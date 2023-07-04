# Project Work A2
## Il problema
### Il contesto
Viene commissionata la realizzazione di un sistema di sblocco delle porte delle stanze degli edifici di un campus universitario.
### Tecnologie disponibili
 - PIC16F877A
   - Interfaccia seriale RS485
 - Raspberry Pi
   - Interfaccia seriale RS485
   - Interfaccia di rete wireless
 - MS Azure
   - IoT Hub
   - Service bus
   - Web App
   - SQL Azure
   - Azure Function
 - Browser web
### Requisiti funzionali minimi
 - Lo sblocco deve avvenire a seguito di una verifica in due passaggi
   1.  Un primo codice di sblocco dev'essere generato dalla porta, tramite interazione diretta dell'utente, che deve poter visualizzare la combinazione generata
   2.  Il primo codice dev'essere convalidato su un portale web, dove l'utente può inserire la combinazione di cifre visualizzata alla porta
   3.  In caso di avvenuta convalidazione sul portale viene generato un secondo codice, che dev'essere visualizzato dall'utente
   4.  L'immissione della seconda combinazione da parte dell'utente deve avvenire alla porta
   5.  La seconda convalidazione può avvenire sul portale o sulla porta
 - Gli utenti con privilegio di amministratore hanno accesso a risorse speciali del portale
   - Visualizzazione cronologia accessi
   - Espulsione utenti standard dalla piattaforma
   - Modifica dei privilegi degli utenti standard
   - Inserimento e cancellazione di edifici e relative porte dalla piattaforma
   - Modifica dei permessi di accesso alle porte degli utenti standard
 - Gli utenti standard devono autenticarsi per accedere alla piattaforma
## La nostra soluzione
### Requisiti tecnici
Per mettere in funzione l'architettura implementata e osservarne il comportamento sono necessari:
- Uno o più simulatori del PIC16F877A, istanziati attraverso PicSimLab
- Una nterfaccia seriale virtuale per ogni simulatore del PIC istanziato
- Una interfaccia seriale virtuale per il simulatore del Raspberry
- Uno o più simulatori del gateway Raspberry Pi, istanziati attraverso applicazioni Node.js su sistema operativo Windows
- Un dispositivo in grado di visualizzare pagine web
### Guida alle funzionalità
Ogni attività rilevante ai fini della piattaforma viene opportunamente documentata in un istanza di SQLServer
#### Configurazione centralina della porta
1. All’accensione, il programma verifica se nel registro 0 della EEPROM è memorizzato l’id, corrispondente al numero della porta
1. In caso negativo, viene richiesto all’amministratore di digitarlo, per poi salvarlo premendo “#”
  2. Se quello inserito è maggiore di 250 viene riavviata la procedura
#### Portale web
##### Registrazione utente
- Il servizio di autenticazione è gestito dal framework Razor Pages
- Alla registrazione l’utente non dispone di alcun permesso di accesso alle porte
- Il primo utente amministratore è preregistrato
##### Facoltà utente amministratore
- Aggiungere o rimuovere edifici
- Aggiungere o rimuovere porte di edifici
- Aggiungere o rimuovere utenti
- Visualizzarne gli accessi
- Modificarne i permessi di accesso
- Modificarne i privilegi
#### Procedura di sblocco
1.Viene visualizzato il messaggio “Premi #”
1.L’utente preme “#”
1.Il Pic rileva la pressione e genera un codice randomico di 4 cifre, che
stampa sul display
converte in stringa
Viene creato un pacchetto (modello illustrato presso DEVICE/Protocol/Protocol.png del branch “feature/Embedded”)
Invio alla porta seriale
Viene generato un timer casuale compreso tra 5 e 15 secondi (per evitare nuovamente la collisione)
Se entro il timer non riceve il messaggio di tipo ACK viene spedito nuovamente il pacchetto
Se viene ricevuto viene generato un timer di 30 secondi per impedire la generazione di un nuovo codice da parte di un utente
Il messaggio raggiunge la Raspberry (che riconosce il delimitatore di pacchetti “/r/n”)
Viene verificato che il pacchetto non sia un messaggio ACK
Conversione da pacchetto a JSON
Viene deserializzato a partire dai separatori “/”
Viene composto il messaggio per il service bus associato al relativo device dell’IoT Hub
 {
                TypeOfMessage
                Device
                Board
                Code
                Date: moment().format()
   }
Invio del messaggio all’indirizzo del service bus queue
Invio dell’ACK al Pic
Service bus queue
Una Azure Function scoda i messaggi discriminando il parametro TypeOfMessage
Se 0, viene inserito un nuovo record nella tabella Tokens
Se 1, viene impiegato, se di conferma dello sblocco, per aggiornare lo stato del relativo record della tabella Accesses
Autenticazione dell’utente sull’app
Convalidazione del token
Non corrispondenza
Messaggio di errore
Corrispondenza
Inserimento nuovo record in Accesses con Success a 0
Visualizzazione secondo codice
Invio codice al Raspberry
Ricezione sul gateway del messaggio col secondo codice
{ 
IdDoor
IdBoard
 Code
 IdUser
 }

