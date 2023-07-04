# ProjectWork
## Contesto
Viene commissionata la realizzazione di un sistema di sblocco delle porte delle stanze degli edifici di un campus universitario.
## Tecnologie disponibili
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
## Requisiti funzionali minimi
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
## Soluzione
### Procedura di sblocco implementata
