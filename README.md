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
- Una interfaccia seriale virtuale per il simulatore del Raspberry per ogni simulatore del PIC istanziato
- Uno o più simulatori del gateway Raspberry Pi, istanziati attraverso applicazioni Node.js su sistema operativo Windows
  - RASBERRYPI/deviceToCloud.Nodejs
- Visual Studio o istanza Azure Web App
  - FRONTEND E BACKEND/ManagementRoomApp
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
1. Viene visualizzato il messaggio “Premi #”
1. L’utente preme “#”
1. Il Pic rileva la pressione e genera un codice randomico di 4 cifre, che
   1. stampa sul display
   1. converte in stringa
1. Viene creato un pacchetto (modello illustrato presso DEVICE/Protocol/Protocol.png del branch “feature/Embedded”)
1. Il pacchetto viene inviato alla porta seriale
1. Viene generato un timer casuale compreso tra 5 e 15 secondi (per evitare nuovamente la collisione)
   - Se entro il timer non riceve il messaggio di tipo ACK viene spedito nuovamente il pacchetto
   - Se viene ricevuto viene generato un timer di 30 secondi per impedire la generazione di un nuovo codice da parte di un utente
1. Il messaggio raggiunge la Raspberry (che riconosce il delimitatore di pacchetti “/r/n”)
   1.Viene verificato che il pacchetto non sia un messaggio ACK
   1. Conversione da pacchetto a JSON
     2. Viene deserializzato a partire dai separatori “/”
     1. Viene composto il messaggio per il service bus associato al relativo device dell’IoT Hub
     
             {
     
                TypeOfMessage
     
                Device
     
                Board
     
                Code
     
                Date: moment().format()
     
              }
   1. Invio del messaggio all’indirizzo del service bus queue
   1. Invio dell’ACK al Pic
1. Service bus queue
   1. Una Azure Function scoda i messaggi discriminando il parametro TypeOfMessage
      - Se 0, viene inserito un nuovo record nella tabella Tokens
      - Se 1, viene impiegato, se di conferma dello sblocco, per aggiornare lo stato del relativo record della tabella Accesses
1. Autenticazione dell’utente sull’app
1. Convalidazione del token
   - Non corrispondenza
     1. Messaggio di errore
   - Corrispondenza
     1. Inserimento nuovo record in Accesses con Success a 0
     2. Visualizzazione secondo codice
     3. Invio codice al Raspberry
1. Ricezione sul gateway del messaggio col secondo codice
   
               {
   
                 IdDoor
   
                 IdBoard
   
                 Code
   
                 IdUser
   
               }
    1. Memorizzazione della coppia IdDoor - IdUser in memoria locale così da poter effettuare l’associazione del messaggio di sblocco
    1. Generazione e invio del pacchetto al Pic
    1. Generazione timer per la ricezione dell’ACK e, eventualmente, nuovo tentativo di invio del pacchetto 
1. Ricezione secondo codice sul Pic
   1. Tre tentativi di immissione e convalidazione del codice immesso dall’utente 
      - In caso di riuscita
        1. Generazione pacchetto con la conferma dello sblocco (Tipo 1)
        1. Messaggio di sblocco sul display
        1. Attesa ACK e eventuale rinvio
      - In caso di fallimento
        1. Pacchetto fallimento
        1. Messaggio di rifiuto sul display
        1. Attesa ACK e eventuale rinvio
1. Ricezione messaggio di sblocco sul Raspberry
   2. Invio ACK
   3. Associazione del messaggio al mittente secondo le associazioni memorizzate
   1. Invio messaggio di sblocco sul service bus
1. Scodamento
   - Se il messaggio è di sblocco riuscito viene aggiornato il relativo record di accesso, portando Success a 1

##### Precisazioni
Non è previsto che l’utente non effettui il tentativo di convalida del secondo codice!



