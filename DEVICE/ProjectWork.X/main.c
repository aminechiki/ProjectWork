/*
 * File:   main.c
 * Author: Administrator
 *
 * Created on 3 maggio 2023, 14:42
 */

// CONFIG
#pragma config FOSC = HS        
#pragma config WDTE = OFF       
#pragma config PWRTE = ON       
#pragma config BOREN = ON
#pragma config LVP = ON
#pragma config CPD = OFF  
#pragma config WRT = OFF
#pragma config CP = OFF  

#include <xc.h>
// librerie per generare un numero random
#include <stdlib.h>
#include <stdio.h>

/*#define PIC_ID 0x01
#define DELIMITER 0x5C
#define ENDER 0x04
#define PIC_ID "\0"*/
#define _XTAL_FREQ 20000000 // Se fPIC = 20Mhz

#define COMMAND 0 // Così, invece di 0 o 1, scriviamo COMMAND o DATA (COMMAND = Passo un comando, DATA = Passo un dato)
#define DATA 1
#define LCD_EN PORTEbits.RE1 // EN = Enable (porta che abilita il display)
#define LCD_RS PORTEbits.RE2 // RS = Register Sheet(se 1 passo un dato, se 0 passo un comando)
#define LCDPORT PORTD // Dato/comando che voglio scrivere (linea dati)
#define LCDPORT_DIR TRISD // Registro che definisce se PORTD è input o output
#define LCDPORT_EN_DIR TRISEbits.TRISE1 // Insieme porte 
#define LCDPORT_RS_DIR TRISEbits.TRISE2 //

// CODICI DEI COMANDI:
#define L_ON 0x0F // accendo il display
#define L_OFF 0x08 // spengo il display
#define L_CLR 0x01 // pulisco il display
#define L_L1 0x80 // visualizza nella prima riga
#define L_L2 0xC0 // visualizza nella seconda riga
#define L_CR 0x0F  // cursore lampeggiante
#define L_NCR 0x0C // non visualizzare il cursore alla fine
#define L_CFG 0x38 // comando che serve per dare delle impostazioni (function set) --> es. tipo di font, numero di righe,... (guarda slide 14)
#define L_CUR 0x0E // visualizza il cursore alla fine

void init_PIC(void);                        // Funzione per l'inizializzare del microcontrollore
void init_Timer0(void);                     // Funzione per l'inizializzazione del timer
void UART_init(long int);                   // Funzione per l'inizializzazione della comunicazione seriale con una velocità impostata dal parametro
void UART_TxChar(char);                     // Funzione per trasmettere un carattere
void UART_TxString(const char*, char);      // Funzione per trasmettere una stringa
void init_NumPad(void);                     // Funzione per l'inizializzazione del tastierino
void read_NumPad(void);                     // Funzione per la lettura da tastierino
void init_LCD(void);                        // Funzione per l'inizializzare il display
void lcdSend(char, char);                   // Funzione che stampa un singolo carattere nel display
void lcdPrint(char *);                      // Funzione che stampa una stringa nel display
int pow(char, char);                        // Funzione per l'elevamento a potenza
void ConvertToString(long, char*);          // Funzione che converte un intero in una stringa
void ConcatToPacket(char*, char*, char);    // Funzione che concatena una stringa al pacchetto da inviare in seriale
int strcat(char*, char*);                   // Funzione che concatena due stringhe
int Length(char*);                          // funzione che calcola la lunghezza di una stringa
char CompareStrings(char*, char*);          // funzione per il confronto tra 2 stringhe
void SplitPacket(char*);                    // funzione che splitta il pacchetto ricevuto nei suoi elementi
void strcopy(char*, char*);                 // funzione per copiare una stringa dentro un altra
void Fill(char*);                           // funzione che aggiunge degli zeri davanti all'id (fa in modo che sia 3 caratteri)

// array che contiene i valori che fanno sì che tu possa leggere in sequenza le colonne A,B e C
const unsigned char colMask[3]=
{
    0b11111110, // Colonna 1 => RB0 a massa
    0b11111101, // Colonna 2 => RB1 a massa
    0b11111011  // Colonna 3 => RB2 a massa
};

// array che contiene i valori che fanno sì che tu possa leggere in sequenza le righe 1, 2, 3 e 4
const unsigned char rowMask[4]=
{
    0b00000001, // Riga 1
    0b00000010, // Riga 2
    0b00000100, // Riga 3
    0b00001000 // Riga 4
};

// array che contiene i valori del tastierino numerico letti colonna per colonna dal basso verso l'alto
const unsigned char keys[] = {'*', '7', '4', '1', '0', '8', '5', '2', '#', '9', '6' , '3'};
// variabile che funge da indice per scansionare le colonne e sapere che colonna hai premuto
unsigned char colScan=0;
// variabile che funge da indice per scansionare le righe e sapere che riga hai premuto
unsigned char rowScan=0;
// variabile che verrà valorizzata con l'indice dell'array "keys" corrispondente al valore che hai premuto
unsigned char keypressed = 99;
// flag che indica se è stato premuto un tasto o no
char keyf = 0;

char PIC_ID[4] = "\0";                          // vettore che conterrà l'id del PIC           
char i_id = 0;                                  // indice del vettore "PIC_ID"
char old_i_id = 0;                              // variabile che serve per fare in modo che stampi l'id inserito quando cambia 
char initialize = 1;                            // flag che indica se serve di inserire un ID al PIC
char packet[15];                                // vettore che conterrà il pacchetto da inviare in seriale
char dato[50];                                  // vettore che conterrà il pacchetto ricevuto in seriale
char source;                                    // variabile che conterrà il tipo di dispositivo che ha inviato il pacchetto ricevuto (0 = PIC, 1 = RASP)
char id_dest[4];                                // variabile che conterrà l'id del destinatario del pacchetto ricevuto
char type;                                      // variabile che conterrà il tipo di dato ricevuto (0 = codice, 2 = ACK)
char datoSeriale[17];                           // vettore che conterrà il dato ricevuto in seriale da comparare col dato tastierino
char datoTastierino[17];                        // vettore che conterrà il valore inserito da tastierino da comparare col dato seriale
char iS = 0;                                    // indice del vettore "datoSeriale"
char iT = 0;                                    // indice del vettore "datoTastierino"
char old_iT = 0;                                // variabile che serve per fare in modo che stampi il codice da tastierino quando cambia
char recieved = 0;                              // flag che indica se è arrivato un dato
char compare = 0;                               // flag che indica se il programma è arrivato nella fase "confronta dato tastierino e seriale"
char success = 0;                               // flag che indica se è il caso di sbloccare la porta
char fail = 0;                                  // flag che indica se hai sbagliato a scrivere il codice (serve perchè non entri all'infinito nel secondo ciclo di controllo)
char maxFail = 3;                               // variabile che indica il numero di tentativi concessi per inserire il codice arrivato da cloud
char pr_start = 0;                              // flag che indica se stampare "Premi '#'
char pr_err_max = 0;                            // flag che indica se stampare l'errore che hai inserito un id > di 250
char pr_empty = 0;                              // flag che indica se stampare l'errore che hai inserito un id vuoto
char pr_succ = 0;                               // flag che indica se stampare il fatto che hai inserito un id corretto
char pr_countdown = 0;                          // flag che indica quando stampare il fatto che il countdown dei 30 secondi è finito

unsigned long milliseconds = 0;                 // variabile che conta i millisecondi passati dall'avvio del programma (serve per usarlo come seed del random)
unsigned long seconds = 0;                      // variabile che serve per scandire i secondi all'interno del timer

int num_rand = 0, old_num_rand = 0;             // variabili che conterrano il numero generato (old_num_rand serve per fare la stampa solo ogni volta che viene generato un nuovo valore)

void main(void) 
{
    // inizializzo tutti i componenti del PIC
    init_PIC();
    
    while(1)
    {
        if(pr_start)
        {
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Premi '#'\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("per gen. codice\0");
            pr_start = 0;
        }
        if(pr_err_max)
        {
            // Stampo l'errore
            lcdSend(L_CLR, COMMAND);
            lcdPrint("ERRORE\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("ID > 250\0");
            pr_err_max = 0;
        } 
        if(pr_empty)
        {
            // Stampo l'errore
            lcdSend(L_CLR, COMMAND);
            lcdPrint("ERRORE\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("ID VUOTO\0");
            pr_empty = 0;
        } 
        if(pr_succ)
        {
            // Stampo
            lcdSend(L_CLR, COMMAND);
            lcdPrint("ID Salvato\0");
            // setto il timer in modo che la scritta venga cancellata entro 4 secondi
            milliseconds = 0;
            seconds = 1000;
            pr_succ = 0;
        }
        if(pr_countdown)
        {
            lcdSend(L_CLR, COMMAND);
            // stampo il numero random
            char num_rand_s[16];
            ConvertToString(num_rand, num_rand_s);
            lcdPrint("Codice: \0");
            lcdPrint(num_rand_s);
            lcdSend(L_L2, COMMAND);
            lcdPrint("# per altro cod.\0");
            pr_countdown = 0;
        }
        
        // leggo se è premuto un pulsante del tastierino
        read_NumPad();
        
        // se hai cliccato un numero sul tastierino e sei nella fase "inizializzazione" lo stampo
        if(i_id != old_i_id && initialize)
        {
            // Stampo il valore
            lcdSend(L_CLR, COMMAND);
            lcdPrint("#=conf. *=canc.\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint(PIC_ID);
        }
        // salvo il vacchio valore dell'indice per il prossimo ciclo
        old_i_id = i_id;
        
        // se è stato generato un nuovo numero random
        // P.S. non faccio la stampa dentro la funzione del tastierino perchè bugga il ciclo di controllo di PORTD per la continua pressione del tasto
        if(num_rand != old_num_rand)
        {
            // pulisco il display
            lcdSend(L_CLR, COMMAND);
            // stampo il numero random
            char num_rand_s[16];
            ConvertToString(num_rand, num_rand_s);
            lcdPrint("Codice: \0");
            lcdPrint(num_rand_s);
            lcdSend(L_L2, COMMAND);
            lcdPrint("Attendi 30s...\0");
            
            /*char digits[4];
            digits[3] = (char) (num_rand / 1000);
            digits[2] = (char) ((num_rand / 100) - digits[3]);
            digits[1] = (char) ((num_rand / 10) - digits[3] - digits[2]);
            digits[0] = (char) (num_rand - digits[3] - digits[2] - digits[1]);
            
            char packet[12] = {0x01, DELIMITER, PIC_ID, DELIMITER, 0x05, DELIMITER, digits[3], digits[2], digits[1], digits[0], ENDER, '\0'};*/
            
            // creo il pacchetto (formato: 'source/id/type/payload/r/n')...
            // codice identificativo del dispositivo (0 = PIC, 1 = Raspberry)
            packet[0] = '0';
            packet[1] = '/';
            packet[2] = '\0';
            // id del PIC
            ConcatToPacket(packet, PIC_ID, '/');
            // tipo del messaggio (0 = codice, 1 = conferma/fallita entrata, 2 = ACK)
            packet[6] = '0';
            packet[7] = '/';
            packet[8] = '\0';
            // il payload del pacchetto
            ConcatToPacket(packet, num_rand_s, ' ');
            // ...e lo invio in seriale
            UART_TxString(packet, 0);
        }
        // salvo il valore per il prossimo ciclo
        old_num_rand = num_rand;
        
        //se mi arriva un codice da seriale (cioè da cloud)
        if(recieved)
        {
            SplitPacket(dato);
            // Se il messaggio arriva da un Raspberry, se l'id destinario combacia con l'id del PIC e il messaggio è un codice
            if(source == '1' && CompareStrings(id_dest, PIC_ID) && type == '0')
            {
                // invio un ACK al Raspberry
                packet[0] = '0';
                packet[1] = '/';
                packet[2] = '\0';
                ConcatToPacket(packet, PIC_ID, '/');
                ConcatToPacket(packet, "2", ' ');
                UART_TxString(packet, 1);
                // inizio la modalità 'confronto tra tastierino e seriale'
                compare = 1;
                // resetto il numero rand (questo serve per cancellare le scritte nell'interrupt del timer)
                old_num_rand = num_rand = 0;
                // setto i tentativi a 3 (serve se arriva un altro codice da seriale mentre sto inserendo un vecchio codice)
                maxFail = 3;
                // puliscco il display e stampo il numero di tentativi rimanenti
                lcdSend(L_CLR, COMMAND);
                lcdPrint("Inserisci codice\0");
                lcdSend(L_L2, COMMAND);
                lcdPrint("Tentativi: \0");
                lcdSend(maxFail + '0', DATA);
                // stoppo il timer dei 30 secondi
                seconds = 0;
            }
            // se ricevo un ACK
            if(source == '1' && CompareStrings(id_dest, PIC_ID) && type == '2')
            {
                // fermo il conteggio dei 5 secondi per il rinvio del messaggio...
                // ... facendone partire un altro da 30 secondi (serve in modo che non puoi spammare '#' per generare codici)...
                if(num_rand != 0)
                    seconds = 7500;
                // ... rimpiazzandolo con il conteggio per pulire il display (se non c'è un codice a display)
                else
                {
                    milliseconds = 0;
                    seconds = 1000;
                }
            }
            recieved = 0;
            iS = 0;
        }
        
//------GESTIONE CASISTICHE INSERIMENTO DA TASTIERINO:--------------------------------------------------------------------------------------------------------------------------------------------------------------------
        // Se hai inserito correttamente il codice
        if(success)
        {
            // "Apro la porta del campus" e resetto i valori per il prossimo dato che arriverà da seriale
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Benvenuto!\0");
            iT = old_iT = 0;
            success = 0;
            // esco dalla modalità "confronto tastierino e seriale"
            compare = 0;
            maxFail = 3;
            // invio al Cloud il fatto che l'utente è riuscito ad entrare (pkt: "1/PIC_ID/1/1\r\n")
            packet[0] = '0';
            packet[1] = '/';
            packet[2] = '\0';
            ConcatToPacket(packet, PIC_ID, '/');
            ConcatToPacket(packet, "1/1", ' ');
            UART_TxString(packet, 0);
        }
        // se invece hai esaurito i tentativi (ma non tutti)
        else if (maxFail > 0 && maxFail < 3 && fail)
        {
            // Scrivo a display "Codice errato" e stampo il numero di tentativi rimanenti
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Codice errato\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("Tentativi: \0");
            lcdSend(maxFail + '0', DATA);
            iT = old_iT = 0;
            fail = 0;
        }
        // se invece hai finito tutti i tentativi
        else if (maxFail == 0)
        {
            // Stampo a display che i tentativi sono esauriti
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Tent. esauriti\0");
            // Resetto i valori ed esco dalla modalità "confronto tastierino e seriale"
            maxFail = 3;
            iT = old_iT = 0;
            compare = 0;
            // invio al Cloud il fatto che l'utente ha fallito l'entrata (pkt: "1/PIC_ID/1/0\r\n")
            packet[0] = '0';
            packet[1] = '/';
            packet[2] = '\0';
            ConcatToPacket(packet, PIC_ID, '/');
            ConcatToPacket(packet, "1/0", ' ');
            UART_TxString(packet, 0);
        }
        
        // se hai cliccato un numero sul tastierino e sei nella fase "compara tastierino e seriale" lo stampo
        if(iT != old_iT && compare)
        {
            // Stampo il valore
            lcdSend(L_CLR, COMMAND);
            lcdPrint("#=conf. *=canc.\0"),
            lcdSend(L_L2, COMMAND);
            lcdPrint(datoTastierino);
        }
        // salvo il vacchio valore dell'indice per il prossimo ciclo
        old_iT = iT;
    }
    
    return;
}

void init_PIC(void)
{
    // inizializzo seriale, display, tastierino e timer
    UART_init(115200);
    init_LCD();
    init_NumPad();
    init_Timer0();
    
    // cerco l'id nella eeprom
    int id = (int)eeprom_read(0);
    // se non esiste, inizio la fase di inserimento ID
    if(id == 255)
    {
        lcdPrint("Inser. ID PIC:\0");
        lcdSend(L_L2, COMMAND);
        lcdPrint("MIN=0,MAX=250\0");
    }
    // altimenti, se esiste, lo salvo
    else
    {
        ConvertToString(id, PIC_ID);
        // aggiunge gli zeri davanti se ha meno di 3 caratteri
        Fill(PIC_ID);
        initialize = 0;
        pr_start = 1;
    }
}

void init_Timer0()
{
    // valori ottenuti da foglio excel (frequenza più bassa)
    INTCON |= 0xA0;
    OPTION_REG = 0x06;
    TMR0 = 131;
    // inizializzo il contatore dei millisecondi
    milliseconds = 0;
}

void init_LCD(void)
{
    // Inizializzazione LCD
    // Vedi pag. 19 slide
    LCD_RS = 0; // Register Selector
    LCD_EN = 0; // Enable a 0
    __delay_ms(20);
    LCD_EN = 1; // Enable a 1
    // invio le impostazioni (comandi) al display
    lcdSend(L_CFG, COMMAND); 
    __delay_ms(5);
    lcdSend(L_CFG, COMMAND);
    __delay_ms(1);
    lcdSend(L_CFG, COMMAND);
    lcdSend(L_OFF, COMMAND);
    lcdSend(L_ON, COMMAND);
    lcdSend(L_CLR, COMMAND);
    // lcdSend(L_CUR, COMMAND);
    lcdSend(L_NCR, COMMAND); // No cursore
}

void lcdSend(char dato, char tipo)
{ 
    // Pag. 21 diapositiva
    // Configurazione porte di connessione
    LCDPORT_DIR = 0x00;
    LCDPORT_EN_DIR = 0;
    LCDPORT_RS_DIR = 0;
    // Procedura scrittura sul display
    LCD_EN = 1;
    LCDPORT = dato; // carico sulla linea dati (PORTD) il dato
    LCD_RS = tipo; // Se comando o dato
    __delay_ms(3); // Attende 3 ms
    LCD_EN = 0;
    __delay_ms(3); // Attende 3 ms
    LCD_EN = 1;
}

void lcdPrint(char *str)
{   // Vedere pag. 22 slide
    int n = 0;
    // Termina quanto incontra il carattere terminatore di stringa
    while(str[n] != '\0')
    {
        // equivale a scrivere n++ sotto
        lcdSend(str[n++], DATA);
    }
}

int pow(char b, char exp)
{
    int n = 1;
    for(int i = 0; i < exp; i++)
    {
        n *= b;
    }
    return n;
}

// PER CONVERTIRE UN NEGATIVO --> PRIMA CONVERTI IN POSITIVO (* -1) --> STR[0] = '-' --> i PARTE DA 1 NEL CICLO (0 è IL MENO) 
void ConvertToString(long n, char* str)
{
    // i = indice dell'array str che parte da 1 se il numero è negativo
    // j = indice che fa scalare l'esponente di 10. Esiste per il ciclo (esiste perchè deve sempre partire da 0, mentre i può iniziare a 1)
    int i = 0, j = 0;
    if(n < 0)
    {
        i = 1;
        str[0] = '-';
        n *= -1;
    }
    // variabile che indica il numero di cifre dell'intero da convertire
    char n_cifre = 1;
    // conto il numero di cifre (finchè n/1, /10, /100, /1000,... è diverso da 0 --> il diviso prende solo la parte intera)
    while(n / pow(10, n_cifre))
        n_cifre++;
    // ciclo partendo dalla cifra più siginificativa
    while(j < n_cifre)
    {
        int temp = pow(10, (char)(n_cifre - 1 - j));
        // int + '0' = valore intero in stringa (es. 3 + '0' = '3')
        str[i] = (char)(n/temp) + '0';
        // tolgo da n la cifra appena convertita
        n = n % temp;
        i++;
        j++;
    }
    // aggiungo il carattere di fine stringa
    str[i] = '\0';
}

// delim è il carattere che delimita i vari campi del pacchetto (se vuoto [' '] è l'ultimo elemento e non ha delimitatore)
void ConcatToPacket(char* pkt, char* str, char delim)
{
    // concateno la stringa al pacchetto salvandomi la sua lunghezza
    int packet_length = strcat(pkt, str);
    // se non è l'ultimo elemento
    if(delim != ' ')
    {
        // accodo il delimitatore
        pkt[packet_length] = delim;
        packet_length++;
    }
    // altrimenti
    else
    {
        // accodo \r\n, che sono i caratteri che fanno da terminatore del pacchetto per il Raspberry
        pkt[packet_length] = '\r';
        packet_length++;
        pkt[packet_length] = '\n';
        packet_length++;
    }
    // aggiungo \0 in coda per il prossimo strcat/l'invio in seriale
    pkt[packet_length] = '\0';
}

int Length(char *str)
{
    int len = 0;
    
    while(str[len] != '\0') { len++; }

    return len;
}

int strcat(char* dest, char* source)
{
    // mi salvo quanto è lunga la stringa di destinazione (ossia quanto è stata già riempita)
    int n = 0, length_dest = Length(dest);
    
    // aggiungo la sorgente alla destinazione
    while(source[n] != '\0')
    {
        dest[length_dest] = source[n];
        n++;
        length_dest++;
    }
    
    // ritorno la lunghezza (serve perchè al pacchetto devo aggiungere dei delimitatore/caratteri di fine pacchetto)
    return length_dest;
}

void SplitPacket(char* pkt)
{
    // vettore che conterrà le singole parti del pacchetto separate da '/'
    char part[5];
    /* i_part  =  indice del vettore part
     * section =  indice che indica che parte del pacchetto hai splittato (source, id_dest, code,...) */
    int i_part = 0, section = 0, len = Length(pkt);   
    
    // ciclo fino a len + 1 perchè mi serve che arrivi a '\0'
    for(int i = 0; i < len + 1; i++)
    { 
        // se non hai raggiunto un carattere delimitatore
        if(pkt[i] != '/' && pkt[i] != '\0')
        {
            // salvo il contenuto del pacchetto dentro part
            part[i_part] = pkt[i];
            i_part++;
            part[i_part] = '\0';
        }
        // se hai raggiunto un carattere delimitatore
        else
        {
            // a seconda di che parte del pacchetto hai appena splittato, salvo il dato nell'apposita variabile
            switch(section)
            {
                case 0:
                    source = part[0];
                    break;
                case 1:
                    strcopy(id_dest, part);
                    break;
                case 2:
                    type = part[0];
                    break;
                case 3:
                    strcopy(datoSeriale, part);
                    break;
                default:
                    break;
            }
            // aumento le sezioni per il prossimo ciclo
            section++;
            // resetto l'indice per salvare la prossima parte del pacchetto
            i_part = 0;
        }
    }
}

void strcopy(char* dest, char* source)
{
    int n = 0;
    
    // copio la sorgente nella destinazione
    while(source[n] != '\0')
    {
        dest[n] = source[n];
        n++;
    }
    
    // aggiungo '\0' alla destinazione
    dest[n] = '\0';
}

char CompareStrings(char *str1, char *str2)
{
    // se le 2 stringhe sono di dimensioni diverse, sono diverse
    if(Length(str1) != Length(str2))
        return 0;
    else
    {
        char i = 0;
        
        // confronto le stringhe elemento per elemento
        while(str1[i] != '\0')
        {
            if(str1[i] != str2[i])
                return 0;
            
            i++;
        }
        
        return 1;
    }
}

void Fill(char* id)
{
    int length = Length(id);
    
    if(length < 3)
    {
        switch(length)
        {
            case 1:
                id[3] = '\0';
                id[2] = id[0];
                id[1] = '0';
                id[0] = '0';
                break;
            case 2:
                id[3] = '\0';
                id[2] = id[1];
                id[1] = id[0];
                id[0] = '0';
                break;
            default:
                break;
                
        }
    }
}

void init_NumPad(void)
{
    // inizializzo le porte del tastierino
    TRISD |= 0x0F;
    TRISB &= 0xF0;
}

void read_NumPad(void)
{
    // siccome utilizzo il display (che utilizza TRISD), qua TRISD và reimpostato per il tastierino
    TRISD |= 0x0F; 
    for(colScan = 0; colScan < 3; colScan++)
    {
        // resetto PORTB in modo che il valore assegnato a PORTB al ciclo precedente venga resettato 
        // (altrimenti scansionerebbe solo la colonna che hai premuto prima)
        PORTB |= 0x07;
        // assegno a PORTB il valore di una delle colonne
        PORTB &= colMask[colScan];

        for(rowScan = 0; rowScan < 4; rowScan++)
        {
            // se hai premuto il pulsante in quella riga, in quella colonna (! perchè controlli se == 0)
            if(!(PORTD & rowMask[rowScan]))
            {
                // questa parte serve per capire se è stato un tocco involontario o no (per far fronte a rimbalzi del pulsante)
                __delay_ms(5);
                if(!(PORTD & rowMask[rowScan]))
                {
                    // assegno a keypressed la posizione nell'array "keys" del valore premuto
                    /* considera di aver rilevato una variazione su colonna 1 --> 1 * 4 = 4 --> a seconda della riga che premuto --> riga 0: keypressed = 0 + 4 = 4; riga 1: keypressed = 5; riga 2: keypressed = 6;...
                    *  stessa cosa per le altre righe, così riesci ad ottenere numeri da 0 a 11 che corrispondono agli indici nell'array dei valori*/
                    keypressed = rowScan+(4*colScan);
                    // metto a 1 la flag che indica che è stato premuto un tasto;
                    keyf = 1;
                }
            }
        }

        if(keyf)
        { 
            keyf = 0;

            // se hai cliccato '#':
            if(keypressed == 8)
            {
                // se sei nella fase di inserimento ID e hai inserito un id non vuoto
                if(initialize && i_id > 0)
                {
                    // se l'id ha meno di 3 caratteri
                    if(i_id < 3)
                    {
                      // aggiungo gli 0 davanti
                        Fill(PIC_ID); 
                    }
                    // Converto l'id in intero (per salvarlo nella eeprom)
                    int id = (PIC_ID[0] - '0') * 100 + (PIC_ID[1] - '0') * 10 + (PIC_ID[2] - '0');
                    // Se l'id è valido
                    if(id <= 250)
                    {
                        // salvo ogni cifra l'id nella EEPROM (indirizzo 0)
                        eeprom_write(0, id);
                        pr_succ = 1;
                        // termino la fase di inserimento ID
                        initialize = 0;
                    }
                    // altrimenti
                    else
                    {
                        pr_err_max = 1;
                        // resetto l'ID
                        PIC_ID[0] = '\0';
                        i_id = old_i_id = 0;
                    }
                }
                // altrimenti, se non hai ancora inserito un id
                else if (initialize)
                    pr_empty = 1;
                // altrimenti, se non è ancora arrivato nessun dato da seriale e non sei nella fase di inserimento id e non è attivo il timer da 30 secondi (in modo che tu non possa spammare per generare codici)
                else if(!compare && seconds != 7500)
                {
                    // genero un numero casuale a 4 cifre (tra min = 1000 e MAX = 9999)
                    srand(milliseconds);
                    // se vuoi ottenre un numero random tra 2 valori --> (rand()%(MAX-min)) + min
                    num_rand = ((rand()%8999)+1000);
                    // fermo il timer dei 4 secondi per pulire lo schermo
                    seconds = 0;
                }
                // altrimenti, se il dato inserito da tastierino e quello arrivato da seriale sono uguali, setto il flag che "apre la porta" a 1
                else if(compare && CompareStrings(datoSeriale, datoTastierino))
                {
                    success = 1;
                }
                // altrimenti scalo il numero di tantativi
                else if (compare)
                {
                    maxFail--;
                    fail = 1;
                }
            }
            // se hai cliccato '*'
            else if(keypressed == 0)
            {
                // se sei nella fase di inserimento codice e hai inserito almeno una cifra
                if(compare && iT > 0)
                {
                    // tolgo una cifra dal codice
                    iT--;
                    datoTastierino[iT] = '\0';
                }
                // se sei nella fase di inserimento id e hai inserito almeno una cifra
                else if (initialize && i_id > 0)
                {
                    // tolgo una cifra dall'id
                    i_id--;
                    PIC_ID[i_id] = '\0';
                }
            }
            // se non hai cliccato ne' '#', ne '*' e sei nella fase "comapara seriale e tastierino"
            else if(compare)
            {
                // aggiungo al vettore che continene il dato inserito da tastierino la nuova cifra
                datoTastierino[iT++] = keys[keypressed];
                datoTastierino[iT] = '\0';
            }
            // se non hai cliccato ne' '#', ne '*' e sei nella fase di inserimento di id nel PIC e non hai superato la lunghezza massima dell'ID
            else if(initialize && i_id < 3)
            {
                // aggiungo al vettore che continene il dato inserito da tastierino la nuova cifra
                PIC_ID[i_id++] = keys[keypressed];
                PIC_ID[i_id] = '\0';
            }

            PORTD |= 0x0F;
            // finchè RD0, RD1 e RD2 non sono tutti = 0 (non sono più premuti), cicla
            // (cioè cicla finchè non rilasci il tasto che hai premuto)
            while(((PORTD & 0x0F) != 0x0F))
            {
                continue;
            }
        }
    }
}

void UART_init(long int baudrate)
{
    // i fili di TX e RX sono rispettivamente su RC6 e RC7
    TRISC &= ~0x40;
    TRISC |= 0x80;
    TXSTA |= 0x24;
    RCSTA |= 0x80;
    RCSTA |= 0x10;
    
    // imposto la frequenzaa 115200 (quella di Com0Com) tramite questa formula
    SPBRG = (char) (_XTAL_FREQ / (long) (64UL * baudrate)) - 1;
            
    // abilito il global interrupt enabler
    INTCON |= 0x80;
    // abilito l'interrupt delle periferiche (PIE)
    INTCON |= 0x40;
    // abilito gli interrupt di ricezione/trasmissione
    PIE1 |= 0x20;
}

void UART_TxChar(char ch)
{
    // se TXIF è a 0 (non sta trasmettendo) --> altrimenti rimango nel ciclo e aspetto
    while(!(PIR1 & 0x10));
    // imposto a forza TXIF a 0 (just in case)
    PIR1 &= ~0x10;
    // trasmetto il dato
    TXREG = ch;
}

void UART_TxString(const char *str, char is_ACK)
{
    unsigned int n = 0;
    // Termina quanto incontra il carattere terminatore di stringa
    while(str[n] != '\0')
    {
        UART_TxChar(str[n]);
        n++;
    }
    // se il messaggio da inviare non è un ACK
    if(is_ACK == 0)
    {
        // setto che il programma aspetti tra 5 e 15 secondi entro cui deve ricevere un ACK
        // genero un numero casuale che identificherà un numero di secondi casuale (tra 5 e 15) entro cui ritrasmettere il messaggio
        srand(milliseconds);
        milliseconds = 0;
        // se vuoi ottenere un numero random tra 2 valori --> (rand()%(MAX-min)) + min
        seconds = ((rand()%10)+5) * 250;
    }
}

void __interrupt() IRS()
{
    // se scatta l'interrupt della seriale, prelevo il dato
    if(RCIF)
    {
        dato[iS++] = RCREG;
        dato[iS] = '\0';
        recieved = 1;
        RCIF = 0;
    }
    // se scatta l'interrupt del timer
    if(T0IF)
    {
        TMR0 = 131;
        milliseconds++;
        // se è scattato un  timer
        if(seconds != 0 && milliseconds > seconds)
        {
            // se è scattato il timer dei 4 secondi, faccio in modo che pulisca lo schermo e stampi "Premi '#'"
            if(seconds == 1000)
            {
                pr_start = 1;
                seconds = 0;
            }
            // se è scattato il timer dei 30 secondi, stampo il fatto che puoi generare un altro codice
            else if (seconds == 7500)
            {
                pr_countdown = 1;
                seconds = 0;
            }
            // altrimenti vuol dire che il timer è scattato perchè non ha ricevuto un ACK dal Raspberry
            else
            {
                // reinvio il pacchetto
                UART_TxString(packet, 0);
            }
        }
        T0IF = 0;
    }
}