//ENVIROMENTS
let dotenv = require('dotenv');
dotenv.config();

//SERIAL PORT
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

    sendDataToCloud(data);
});

function sendDataToCloud(data) {

    /*
    //Split a message 
    var dataSplit = data.split('/');
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
}

function sendDataToControllerRoom(messaggio) {

    //let code = messaggio.data.toString();
   
   console.log(messaggio.data.toString());

    //port.write(code);
    //console.log("SEND MESSAGE TO PIC: " + code);
}