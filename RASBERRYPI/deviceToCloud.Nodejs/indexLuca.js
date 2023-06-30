//ENVIROMENTS
let dotenv = require('dotenv');
dotenv.config();

//DATE-TIME
const moment = require('moment/moment');

//SERIAL PORT
const SerialPort = require('serialport');
const Readline = require('@serialport/parser-readline');
const port = new SerialPort('COM7');
const parser = new Readline(new Readline({ delimiter: '\r\n' }));
port.pipe(parser);
let timerObjs = [];
let userObjs = [];

//AZURE IOT HUB
const Protocol = require('azure-iot-device-mqtt').Mqtt;
const Client = require('azure-iot-device').Client;
const Message = require('azure-iot-device').Message;
const deviceConnectionString = process.env.DEVICE_CONNECTION_STRING;
let client = Client.fromConnectionString(deviceConnectionString, Protocol);

client.on('connect', () => { console.log('Client connected') });
client.on('message', sendDataToControllerRoom);

//SEND DATA
parser.on("data", function (data) {
    sendDataToCloud(data);
});

function sendDataToCloud(data) {

    //Split a message 
    var dataSplit = data.split('/');
    // Se il messaggio non è un ACK, lo invio al Cloud
    if(dataSplit[0] == '0' && (dataSplit[2] == '0' || dataSplit[2] == '1'))
    {
        //Create a JSON
        // se il messaggio da inviare è un codice
        if(dataSplit[2] == '0')
        {
            // creo l'array con i dati del codice
            var dataObject = {
                TypeOfMessage: Number(dataSplit[2]),
                Device: Number(process.env.RASP_ID),
                Board: Number(dataSplit[1]),
                Code: Number(dataSplit[3]),
                Date: moment().format()
            }
        }
        // se il messaggio da inviare è un messaggio di conferma/fallita entrata
        else if (dataSplit[2] == '1')
        {
            let id_user = "";

            // ciclo l'array degli utenti che hanno provato a fare un accesso
            for(let i = 0; i < userObjs.length; i++)
            {
                // quando trovo l'utente che è/non è entrato
                if(userObjs[i].pic_id == dataSplit[1])
                {
                    // lo salvo
                    id_user = userObjs[i].user;
                    // e lo tolgo dall'array
                    userObjs.splice(i, 1);
                    break;
                }
            };

            // creo l'array con i dati della conferma/fallita entrata
            var dataObject = {
                TypeOfMessage: Number(dataSplit[2]),
                Device: Number(process.env.RASP_ID),
                Board: Number(dataSplit[1]),
                Success: Boolean(dataSplit[3]),
                Date: moment().format(),
                IdUser: id_user.toString()
            }
        }
        //Serialize a JSON
        dataSerialize = JSON.stringify(dataObject);
        //Create a object messagge and send to cloud
        const message = new Message(dataSerialize);
        client.sendEvent(message);
        console.log("SEND MESSAGE TO CLOUD: " + dataSerialize);
        // invio un ACK al PIC
        sendAck(dataSplit[1]);
    }
    // se il massaggio arrivato è un ACK
    else if(dataSplit[0] == '0' && dataSplit[2] == '2')
    {
        // ciclo l'array dei timer
        for(let i = 0; i < timerObjs.length; i++)
        {
            // trovo il PIC che mi ha inviato l'ACK
            if(timerObjs[i].pic_id == dataSplit[1])
            {
                // stoppo il timer per quel PIC e lo tolgo dall'array
                clearTimeout(timerObjs[i].timer);
                timerObjs.splice(i, 1);
                console.log("ACK ARRIVED FROM PIC, TIMER STOPPED");
                break;
            }
        };
    }

    console.log('\n');
}

// funzione che invia un ACK al PIC
function sendAck(pic_id)
{
    let packet = "1/" + pic_id + "/2";
    port.write(packet);
    console.log("SEND ACK TO PIC: " + packet);
}

function sendDataToControllerRoom(messaggio)
{
    // parso il messaggio che mi arriva da cloud da stringa a JSON
    let jsonStr = messaggio.data.toString();
    let json = JSON.parse(jsonStr);
    
    // aggiungo gli 0 all'id se è un numero < 100 (con meno di 3 caratteri) per il PIC
    let pic_id = json.IdDoor.toString();
    switch(pic_id.length)
    {
        case 1:
            pic_id = '0' + '0' + pic_id;
            break;
        case 2:
            pic_id = '0' + pic_id;
            break;
        default:
            break;
    }
    let code = json.Code.toString();
    let packet = "1/" + pic_id + "/0/" + code;
    // invio il messaggio al PIC
    port.write(packet);
    console.log("SEND MESSAGE TO PIC: " + packet);

    // faccio partire un timer da 5 a 15 secondi in cui attenderà un ACK dal PIC, se non arriva, reinvia il pacchetto
    let time = ((Math.random() % 4) + 6) * 1000; 
    // ciclo l'array dei timer per rimuovere il vecchio timer scaduto
    for(let i = 0; i < timerObjs.length; i++)
    {
        if(timerObjs[i].id == pic_id)
            timerObjs.splice(i, 1);
    };
    // inserisco il timer nell'array e lo faccio partire
    timerObjs.push({pic_id, timer: setTimeout(sendDataToControllerRoom, time, messaggio)});

    // ciclo l'array degli utneti per rimuovere il vecchio utente (serve se scatta il timer dell'ACK che ri-richiama la funzione, altrimenti avre 2 utenti uguali che provano ad accedere allo stesso PIC)
    for(let i = 0; i < userObjs.length; i++)
    {
        if(userObjs[i].id == pic_id)
            userObjs.splice(i, 1);
    };
    // aggiungo lo user all'array degli utenti che hanno provato a fare un accesso (serve per quando arriva un messaggio di successo/fallita entrata)
    userObjs.push({pic_id, user: json.IdUser.toString()});

    console.log('\n');
}