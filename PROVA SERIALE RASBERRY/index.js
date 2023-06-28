//ENVIROMENTS
let dotenv = require('dotenv');
dotenv.config();

//SERIAL PORT
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline')
const port = new SerialPort('COM4')
const parser = new Readline(new Readline({ delimiter: '\r\n' }))
port.pipe(parser)

//AZURE IOT HUB
const Protocol = require('azure-iot-device-mqtt').Mqtt;
const Client = require('azure-iot-device').Client;
const Message = require('azure-iot-device').Message;
const deviceConnectionString = "HostName=Tech-geeks.azure-devices.net;DeviceId=Dormitorio;SharedAccessKey=2MhiQN8cFjXPf6cNo8aNeqgKmQqIfJNsUGSiKT7vAUM="
let client = Client.fromConnectionString(deviceConnectionString, Protocol);

client.on('connect', () => { console.log('Client connected') });
client.on('message', sendDataToControllerRoom);

//SEND DATA
parser.on("data", function (data) {

    sendDataToCloud(data)
});

function sendDataToCloud(data) {

    //Split a message 
    var dataSplit = data.split('/');
    let building = `${dataSplit[0]}`;
    let CodeRoom = Number(dataSplit[1])
    //Date 
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
    const message = new Message(dataSerialize);
    client.sendEvent(message);
    console.log("SEND MESSAGE TO CLOUD: " + dataSerialize);
}

function sendDataToControllerRoom(messaggio) {

    let code = messaggio.data.toString();
    port.write(code);
    console.log("SEND MESSAGE TO PIC: " + code);
}