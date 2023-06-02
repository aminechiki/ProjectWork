//SERIAL PORT
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline')
const port = new SerialPort('COM4')

//AZURE IOT HUB
const Protocol = require('azure-iot-device-mqtt').Mqtt;
const Client = require('azure-iot-device').Client;
const Message = require('azure-iot-device').Message;

//const parser = new Readline()
const parser = new Readline(new Readline({ delimiter: '\r\n' }))
port.pipe(parser)

const deviceConnectionString = "HostName=Tech-geeks.azure-devices.net;DeviceId=DeviceCampus;SharedAccessKey=2OiQsGcUPgEsQZVtWIrE7fCwE52ak6jDJ944sneYdH0=";
let client = Client.fromConnectionString(deviceConnectionString, Protocol);

client.on('connect', () => { console.log('Client connected')});
client.on('message', () => { console.log('Messsage --> bisogna capire perche è obbligatorio utilizzare la caallback')});

//SEND DATA
parser.on("data", function(data) {
   //Split a message 
   var dataSplit = data.split('/');
   let building = `${dataSplit[0]}`;
   let numberRoom = Number(dataSplit[1])

    var dataObject = {
        code : numberRoom,
        date : (new Date()).toLocaleString(),
        numberRoom : building
    }

    dataSerialize = JSON.stringify(dataObject);
    const message = new Message(dataSerialize);
    client.sendEvent(message);
    console.log("SEND MESSAGE " + dataSerialize);
});