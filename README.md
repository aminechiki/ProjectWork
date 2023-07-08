# Project Work A2 by TechGeeks
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
   - Aggiunta e rimozione di edifici e/o relative porte dalla piattaforma
   - Modifica dei permessi di accesso alle porte degli utenti
 - Gli utenti devono autenticarsi per accedere alla piattaforma
## La nostra soluzione
### Requisiti tecnici infrastrutturali
Per mettere in funzione il sistema implementato e testarne il comportamento sono necessari:
- Uno o più simulatori del PIC16F877A, istanziati attraverso PicSimLab
  - [main.c](PIC/Code)
- Dispositivi Raspberry Pi
  -  Uno o più gateway fisici con os Ubuntu, collegati serialmente ai pc su cui sono istanziati i simulatori dei PIC
     - [Folder progetto Node per Ubuntu](RASPBERRY_PI)
  - In alternativa, uno o più simulatori Node.js istanziati su Windows
     - Qualora i simulatori dei PIC e quelli dei Raspberry siano istanziati sullo stesso pc, saranno necessari, per ogni simulatore di PIC istanziato
        - Una interfaccia seriale virtuale riservata per quel PIC (suggerito l'impiego di Com0Com)
        - Una interfaccia seriale virtuale riservata per il suo gateway di riferimento
     - E' necessario identificare sul codice [Folder progetto Node per Ubuntu](RASPBERRY_PI) le nuove porte di invio/ricezione
- Istanza Azure IoT Hub
  - Un Device per gateway istanziato
    - Il suo Id dev'essere opportunamente referenziato in
      - [Progetto ASP.NET Core Web App](WEB-APP/ManagementRoomApp)
      - [Folder progetto Node per Ubuntu](RASPBERRY_PI)
  - Un'unica istanza Service Bus Queue che raccolga i messaggi provenienti da tutti i Device istanziati
- Visual Studio per eseguire il progetto dell'Azure Function deputata a processare la coda di messaggi del Service Bus
  - [Progetto Azure Function](AZURE_FUNCTION/CloudManagementData)
- Istanza Azure Web App e SQL Azure intergrata (o Visual Studio per l'esecuzione in ambiente locale) per l'avvio dell'app e l'hosting del database associato
  - [Progetto ASP.NET Core Web App](WEB-APP/ManagementRoomApp)
- Un dispositivo in grado di visualizzare pagine web
  - E' necessario conoscere l'URL della home page del portale di sblocco
### Guida alle funzionalità
Ogni attività rilevante ai fini della piattaforma viene opportunamente documentata in un istanza di SQLServer

![Ogni attività rilevante ai fini della piattaforma viene opportunamente documentata in un istanza di SQLServer](DB/Definitive.png)

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
  - Insert/Delete tabella Buildings
- Aggiungere o rimuovere porte di edifici
  - Insert/Delete tabella Doors
- Aggiungere o rimuovere utenti (funzionalità gestita dal servizio AspNetIdentity)
  - Insert/Delete tabella AspNetUsers
- Visualizzarne gli accessi alle singole porte
  - Select From tabella Accesses
- Modificarne i permessi di accesso
  - Insert/Delete tabella Permissions
- Modificarne i privilegi
  - Update (o Insert/Delete?) tabella AspNetRoles
#### Procedura di sblocco
1. Viene visualizzato il messaggio “Premi #”
1. L’utente preme “#”
1. Il Pic rileva la pressione e genera un codice randomico di 4 cifre, che
   1. stampa sul display
   1. converte in stringa
1. Viene creato un pacchetto RS485 col codice
   - "0/0/Code"
   
   Modello protocollo
   
     ![Modello protocollo](PIC/Protocol/RS485.png)
   
1. Il pacchetto viene inviato alla porta seriale
1. Viene generato un timer casuale compreso tra 5 e 15 secondi (per evitare nuovamente la collisione)
   - Se entro il timer non riceve il messaggio di tipo ACK viene spedito nuovamente il pacchetto
   - Se viene ricevuto viene generato un timer di 30 secondi per impedire la generazione di un nuovo codice da parte di un utente
1. Il messaggio raggiunge la Raspberry (che riconosce il delimitatore di pacchetti “/r/n”)
   1. Viene verificato che il pacchetto non sia un messaggio ACK
   1. Conversione del messaggio da RS485 a JSON
      1. Deserializzazione a partire dai separatori “/”
      2. Viene composto il messaggio per il device dell’IoT Hub associato al gateway coinvolto
     
             {
     
                TypeOfMessage
     
                Device: (IdGateway)
     
                Board: (IdDoor)
     
                Code
     
                Date: moment().format()
     
              }
        
   2. Invio del messaggio all’indirizzo del relativo device dell'istanza dell'IoT Hub
     1. Reindirizzamento automatico del messaggio alla bus queue
        1. Attesa scodamento
   1. Invio dell’ACK al Pic
       - "1/Board/2"
1. Una Azure Function consuma i messaggi della coda discriminando il parametro TypeOfMessage
      - Se uguale a 0, viene eseguito l'inserimento di un nuovo record nella tabella Tokens
1. Autenticazione dell’utente sull’app
1. Convalidazione del token
   - Non corrispondenza
     1. Messaggio di errore
   - Corrispondenza
     1. Inserimento nuovo record nella tabella Accesses, con campo Success a 0
     2. Visualizzazione del secondo codice da parte dell'utente
     3. Invio codice all'indirizzo del device di provenienza del primo codice
1. Ricezione sul gateway del messaggio col secondo codice
   
               {
   
                 IdBoard: (IdDoor)
   
                 Code
   
                 IdUser
   
               }
   
1. Memorizzazione della coppia IdDoor - IdUser in memoria locale, così da poter effettuare l’associazione tra successivo messaggio di sblocco e utente generatore del secondo codice
1. Generazione e invio del pacchetto al Pic
   - "0/IdDoor/1/Code"
1. Generazione timer per la ricezione dell’ACK e, eventualmente, nuovo tentativo di invio del pacchetto 
1. Ricezione secondo codice sul Pic
1. Invio ACK al Raspberry
   - "0/2"
1. Tre tentativi di immissione del secondo codice da parte dell'utente e convalidazione 
   - In caso di riuscita
     1. Generazione pacchetto con la conferma dello sblocco
        - "0/1/1"
     1. Messaggio di sblocco sul display
     1. Attesa ACK e eventuale rinvio
   - In caso di fallimento
     1. Generazione pacchetto di fallimento procedura
        - "0/1/0"
     1. Messaggio di rifiuto sul display
     1. Attesa ACK e eventuale rinvio
1. Ricezione messaggio di sblocco sul Raspberry
1. Associazione del messaggio al mittente confrontando le associazioni memorizzate
1. Composizione messaggio di sblocco
      
             {
      
                TypeOfMessage
      
                Device: (RASP_ID)
      
                Board:(DOOR_ID)
      
                Success
      
                Date: moment().format()
      
                IdUser
      
             }
      
3. Invio al Device
4. Invio ACK al PIC
   - "1/IdBoard/2"
1. Scodamento
   - Se il messaggio è di sblocco riuscito (TypeOfMessage == 1) viene aggiornato il relativo record di Accesses, portandone il campo Success a 1

##### Precisazioni
- Non è previsto che l’utente non effettui il tentativo di convalida del secondo codice sulla porta!
- Solo un utente per volta può effetturare il tentativo di accesso a una specifica porta!
  - Ogni nuovo messaggio di secondo codice ricevuto dal Raspberry per la specifica porta sovrascrive l'eventuale precedente messaggio indirizzato alla medesima
    - Ogni codice ricevuto dal PIC sovrascrive, se presente, quello attualmente in attesa di convalidazione
  - Se, a seguito della sovrascrittura, viene ricevuto un messaggio di sblocco proveniente dal PIC nessuna associazione al mittente viene effettuata e le informazioni inerenti lo sblocco non pervengono alla queue!
 ##### Suggerimenti post-esposizione
 - Il protocollo potrebbe essere ottimizzato rimuovendo il primo byte di informazione
   - Infatti, essendo che un PIC comunica unicamente col proprio gateway, è sufficiente verificare la presenza del byte di id della porta per discriminare il tipo di sorgente
- Se un utente viene espulso dalla piattaforma, stessa sorte tocca alla cronologia dei suoi accessi!
  - Sarebbe opportuno implementare anche il servizio di attivazione e disattivazione temporanee delle utenze, così da renderne persistenti alcune informazioni correlate nonostante l'impossibilità di autenticazione
