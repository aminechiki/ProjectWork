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
Per mettere in funzione l'architettura implementata e testarne il comportamento sono necessari:
- Uno o più simulatori del PIC16F877A, istanziati attraverso PicSimLab
  - DEVICE/ProjectWork.X
- Per ogni simulatore del PIC istanziato, attraverso Com0Com e riconfigurazione del codice
  - Una interfaccia seriale virtuale per il PIC
  - Una interfaccia seriale virtuale per il gateway di riferimento
- Dispositivi Raspberry Pi
  - Uno o più simulatori del gateway istanziati su sistema operativo Windows attraverso applicazioni Node.js riconfigurate
    - RASBERRYPI/deviceToCloud.Nodejs
  - In alternativa
    - Uno o più dispositivi fisici con os Ubuntu e connessi serialmente al pc su cui vengono istanziati i simulatori dei PIC
      - branch "feature/Embedded"
- Visual Studio per eseguire il progetto dell'Azure Function
  - CLOUD FOR DATA/CloudManagementData
- Istanza Azure Web App con SQL Azure (o Visual Studio per un esecuzione locale)
  - FRONTEND E BACKEND/ManagementRoomApp
- Un dispositivo in grado di visualizzare pagine web
  - Verificare l'URL della home del portale
### Guida alle funzionalità
Ogni attività rilevante ai fini della piattaforma viene opportunamente documentata in un istanza di SQLServer
![Ogni attività rilevante ai fini della piattaforma viene opportunamente documentata in un istanza di SQLServer](https://myoctocat.com/assets/images/base-octocat.svg)
#### Configurazione centralina della porta
1. All’accensione, il programma verifica se nel registro 0 della EEPROM è memorizzato l’id, corrispondente al numero della porta
1. In caso negativo, viene richiesto all’amministratore di digitarlo, per poi salvarlo premendo “#”
   - Se quello inserito è maggiore di 250 viene riavviata la procedura
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
   
                 IdBoard: (DOOR_ID)
   
                 Code
   
                 IdUser
   
               }
   
    1. Memorizzazione della coppia IdDoor - IdUser in memoria locale così da poter effettuare l’associazione del successivo messaggio di sblocco all'utente genratore
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
   3. Associazione del messaggio al mittente confrontando le associazioni memorizzate
   1. Composizione messaggio di sblocco
      
             {
      
                TypeOfMessage
      
                Device: (RASP_ID)
      
                Board:(DOOR_ID)
      
                Success
      
                Date: moment().format()
      
                IdUser
      
             }
      
   3. Indirizzamento alla queue
1. Scodamento
   - Se il messaggio è di sblocco riuscito viene aggiornato il relativo record di accesso, portando Success a 1

##### Precisazioni
- Non è previsto che l’utente non effettui il tentativo di convalida del secondo codice sulla porta!
- Solo un utente per volta può effetturare il tentativo di accesso a una specifica porta!
  - Ogni nuovo messaggio di secondo codice ricevuto dal Raspberry per la specifica porta sovrascrive l'eventuale precedente messaggio indirizzato alla medesima
    - Ogni codice ricevuto dal PIC sovrascrive, se presente, quello attualmente in attesa di convalidazione
  - Se, a seguito della sovrascrittura, viene ricevuto un messaggio di sblocco proveniente dal PIC nessuna associazione al mittente viene effettuata e le informazioni inerenti lo sblocco non pervengono alla queue!
