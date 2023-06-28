//ENVIROMENTS
let dotenv = require('dotenv');
dotenv.config();

//SERIAL PORT
<<<<<<< HEAD
const SerialPort = require('serialport');
const Readline = require('@serialport/parser-readline');
const port = new SerialPort('COM7');
const parser = new Readline(new Readline({ delimiter: '\r\n' }));
port.pipe(parser);
let timerObjs = [];
=======
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline')
const port = new SerialPort('COM4')

//In raserry ad this
/*
const port = new SerialPort('/dev/ttyUSB0',
{   baudRate: 115200,
    dataBits: 8,
    parity: 'none',
    stopBits: 1,
   // flowControl: false
});
*/

const parser = new Readline(new Readline({ delimiter: '\r\n' }))
port.pipe(parser)
>>>>>>> bff08c9ffd1310e4670118c44638d647ad9e1f3c

//AZURE IOT HUB
//const Protocol = require('azure-iot-device-mqtt').Mqtt;
const Protocol = require('azure-iot-device-mqtt').Mqtt;
const Client = require('azure-iot-device').Client;
const Message = require('azure-iot-device').Message;
const deviceConnectionString = "HostName=Tech-geeks.azure-devices.net;DeviceId=DeviceCampus;SharedAccessKey=2OiQsGcUPgEsQZVtWIrE7fCwE52ak6jDJ944sneYdH0="
//const deviceConnectionString = "HostName=Pi-Cloud.azure-devices.net;DeviceId=Device2;SharedAccessKey=WVGFS0B04eSzeV1QhtcK1LKywrBb7aq8C1dQGLH9TKw="

let client = Client.fromConnectionString(deviceConnectionString, Protocol);

client.on('connect', () => { console.log('Client connected') });
client.on('message', sendDataToControllerRoom);


//SEND DATA
parser.on("data", function (data) {
<<<<<<< HEAD
=======

>>>>>>> bff08c9ffd1310e4670118c44638d647ad9e1f3c
    sendDataToCloud(data);
});

function sendDataToCloud(data) {


    console.log(data)

    /*
    //Split a message 
    var dataSplit = data.split('/');
<<<<<<< HEAD
    if(dataSplit[0] == '0' && dataSplit[2] == '0')
    {
        //Create a JSON
        var dataObject = {
            building: Number(process.env.RASP_ID),
            numberRoom: Number(dataSplit[1]),
            code: Number(dataSplit[3]),
            date: (new Date()).toLocaleString()
        }
        //Serialize a JSON
        dataSerialize = JSON.stringify(dataObject);
        //Create a object messagge and send to cloud
        const message = new Message(dataSerialize);
        client.sendEvent(message);
        console.log("SEND MESSAGE TO CLOUD: " + dataSerialize);
        sendAck(dataSplit[1]);
    }
    else if(dataSplit[0] == '0' && dataSplit[2] == '2')
    {
        for(let i = 0; i < timerObjs.length; i++)
        {
            if(timerObjs[i].id == dataSplit[1])
            {
                clearTimeout(t.timer);
                timerObjs.splice(i, 1);
            }
        };
    }
=======
    let building = `${dataSplit[0]}`;
    let CodeRoom = Number(dataSplit[1])
    //Date 
    //var today = new Date().toLocale("it-IT", {timeStyle:"full"});
    

    var today = new Date();

    //Create a JSON
   var dataObject = {
    Board : 1,
    Device : 1,
    Code: CodeRoom,
    TypeOfMessage : 0,
    //date: (new Date()).toLocaleString(),
    Date : today
}

    //Serialize a JSON
    dataSerialize = JSON.stringify(dataObject);
    //Create a object messagge and send to cloud

    //const message = new Message(dataSerialize);
    //client.sendEvent(message);
    console.log("SEND MESSAGE TO CLOUD: " + dataSerialize);
    */
>>>>>>> bff08c9ffd1310e4670118c44638d647ad9e1f3c
}

function sendAck(pic_id)
{
    let packet = "1/" + pic_id + "/2";
    port.write(packet);
    console.log("SEND ACK TO PIC: " + packet);
}

<<<<<<< HEAD
function sendDataToControllerRoom(messaggio) 
{
    let jsonStr = messaggio.data.toString();
    let json = JSON.parse(jsonStr);
    
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
    port.write(packet);
    console.log("SEND MESSAGE TO PIC: " + packet);

    let time = ((Math.random() % 4) + 6) * 1000; 
    timerObjs.push({id: pic_id, timer: setTimeout(sendDataToControllerRoom, time, messaggio)});
=======
    //let code = messaggio.data.toString();
   
   console.log(messaggio.data.toString());

    //port.write(code);
    //console.log("SEND MESSAGE TO PIC: " + code);
>>>>>>> bff08c9ffd1310e4670118c44638d647ad9e1f3c
}