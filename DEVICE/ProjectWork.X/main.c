/*
 * File:   main.c
 * Author: Administrator
 *
 * Created on 3 maggio 2023, 14.42
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
#include <stdlib.h>
#include <stdio.h>

#define PIC_ID "PIC_0001\0"
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
void UART_TxString(const char*);            // Funzione per trasmettere una stringa
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

char datoSeriale[16];                           // vettore che conterrà il dato ricevuto in seriale
char datoTastierino[16];                        // vettore che conterrà il valore inserito da tastierino
char iS = 0;                                    // indice del vettore "datoSeriale"
char iT = 0;                                    // indice del vettore "datoTastierino"
char old_iT = 0;                                // variabile che serve per fare in modo che stampi il codice da tastierino quando cambia
char recieved = 0;                              // flag che indica se è arrivato un dato
char compare = 0;                               // flag che indica se il programma è arrivato nella fase "confronta dato tastierino e seriale"
char success = 0;                               // flag che indica se è il caso di sbloccare la porta
char fail = 0;                                  // flag che indica se è hai sbagliato a scrivere il codice (serve perchè non entri all'infinito nell'ultimo ciclo)
char maxFail = 3;                               // variabile che indica il numero di tentativi concessi per inserire il codice arrivato da cloud

unsigned long milliseconds = 0;

int num_rand = 0, old_num_rand = 0;

void main(void) 
{
    init_PIC();
    
    while(1)
    {
        read_NumPad();
        
        // se è stato generato un nuovo numero
        // P.S. non faccio la stampa dentro la funzione del tastierino perchè bugga il ciclo di controllo di PORTD per la continua pressione del tasto
        if(num_rand != old_num_rand)
        {
            // pulisco il display
            lcdSend(L_CLR, COMMAND);
            // stampo il numero random
            char num_rand_s[16];
            ConvertToString(num_rand, num_rand_s);
            lcdPrint(num_rand_s);
            
            // creo il pacchetto...
            char packet[50];
            packet[0] = '\0';
            ConcatToPacket(packet, PIC_ID, '/');
            ConcatToPacket(packet, num_rand_s, ' ');
            // ...e lo invio in seriale
            UART_TxString(packet);
        }
        old_num_rand = num_rand;
        
        //se mi arriva un codice da seriale
        if(recieved)
        {
            // lo stampo a display
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Inserisci code\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("Tentativi: \0");
            lcdSend(maxFail + '0', DATA);
            recieved = 0;
            iS = 0;
        }
        
        if(success)
        {
            // lo stampo a display
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Benvenuto!\0");
            iT = old_iT = 0;
            success = 0;
            compare = 0;
            maxFail = 3;
        }
        else if (maxFail > 0 && maxFail < 3 && fail)
        {
            // lo stampo a display
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Codice errato\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("Tentativi: \0");
            lcdSend(maxFail + '0', DATA);
            iT = old_iT = 0;
            fail = 0;
        }
        else if (maxFail == 0)
        {
            // lo stampo a display
            lcdSend(L_CLR, COMMAND);
            lcdPrint("Tent. esauriti\0");
            lcdSend(L_L2, COMMAND);
            lcdPrint("Rigenerare code\0");
            maxFail = 3;
            iT = old_iT = 0;
            compare = 0;
        }
        
        // se hai cliccato un numero sul tastierino e sei nella fase "compara tastierino e seriale" lo stampo
        if(iT != old_iT && compare)
        {
            // pulisco il display
            lcdSend(L_CLR, COMMAND);
            lcdPrint(datoTastierino);
        }
        old_iT = iT;
    }
    
    return;
}

void init_PIC(void)
{
    UART_init(115200);
    init_LCD();
    init_NumPad();
    //init_rand();
    init_Timer0();
}

void init_Timer0()
{
    // valori ottenuti da foglio excel (frequenza più bassa)
    INTCON |= 0xA0;
    OPTION_REG = 0x06;
    TMR0 = 131;
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
    int packet_length = strcat(pkt, str);
    if(delim != ' ')
    {
        pkt[packet_length] = delim;
        packet_length++;
    }
    else
    {
        pkt[packet_length] = '\r';
        packet_length++;
        pkt[packet_length] = '\n';
        packet_length++;
    }
    pkt[packet_length] = '\0';
}

int strcat(char* str1, char* str2)
{
    int n = 0, length_str1 = 0;
    
    // mi salvo quanto è lunga la stringa destinazione (ossia quanto è stata già riempita)
    while(str1[length_str1] != '\0')
        length_str1++;
    
    // aggiungo alla destinazione la sorgente
    while(str2[n] != '\0')
    {
        str1[length_str1] = str2[n];
        n++;
        length_str1++;
    }
    
    // ritorno la lunghezza (serve per la questione della concatenazione del pacchetto)
    return length_str1;
}

int Length(char *str)
{
    int len = 0;
    
    while(str[len++] != '\0') {}

    return len;
}

char CompareStrings(char *str1, char *str2)
{
    if(Length(str1) != Length(str2))
        return 0;
    else
    {
        char i = 0;
        
        while(str1[i] != '\0')
        {
            if(str1[i] != str2[i])
                return 0;
            
            i++;
        }
        
        return 1;
    }
}

void init_NumPad(void)
{
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
                // Se non è ancora arrivato nessun dato da seriale
                if(!compare)
                {
                    // genero un numero casuale a 4 cifre (tra min = 1000 e MAX = 9999)
                    srand(TMR0);
                    // se vuoi ottenre un numero random tra 2 valori --> (rand()%(MAX-min)) + min
                    num_rand = ((rand()%8999)+1000);
                }
                else if(CompareStrings(datoSeriale, datoTastierino))
                {
                    success = 1;
                }
                else
                {
                    maxFail--;
                    fail = 1;
                }
            }
            // se non hai cliccato ne' '#', ne '*' e sei nella fase "comapara seriale e tastierino"
            else if(keypressed != 0 && compare)
            {
                datoTastierino[iT++] = keys[keypressed];
                datoTastierino[iT] = '\0';
            }

            PORTD |= 0x0F;
            // finchè RD0, RD1 e RD2 non sono tutti = 0 (non sono più premuti), cicla
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
    
    // imposto la frequenzaa 115200 (quella di CuteCom) tramite questa formula
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

void UART_TxString(const char *str)
{
    unsigned int n = 0;
    // Termina quanto incontra il carattere terminatore di stringa
    while(str[n] != '\0')
    {
        UART_TxChar(str[n]);
        n++;
    }
}

void __interrupt() IRS()
{
    // se scatta l'interrupt della seriale prelevo il dato
    if(RCIF)
    {
        datoSeriale[iS++] = RCREG;
        datoSeriale[iS] = '\0';
        recieved = 1;
        compare = 1;
        RCIF = 0;
    }
    // se scatta l'interrupt del timer
    if(T0IF)
    {
        TMR0 = 131;
        milliseconds++;
        T0IF = 0;
    }
}