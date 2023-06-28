//ENVIROMENTS
let dotenv = require('dotenv');
dotenv.config();

//SERIAL PORT
const SerialPort = require('serialport');
const Readline = require('@serialport/parser-readline');
const port = new SerialPort('COM4');
const parser = new Readline(new Readline({ delimiter: '\r\n' }));
port.pipe(parser);
let timerObjs = [];

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

    var today = new Date();

    //Split a message 
    var dataSplit = data.split('/');
    if(dataSplit[0] == '0' && (dataSplit[2] == '0' || dataSplit[2] == '1'))
    {
        //Create a JSON
        var dataObject = {
            Device: Number(process.env.RASP_ID),
            TypeOfMessage : dataSplit[2],
            Board: Number(dataSplit[1]),
            Code: Number(dataSplit[3]),
            Date: today
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
                clearTimeout(timerObjs[i].timer);
                timerObjs.splice(i, 1);
            }
        };
    }
}

function sendAck(pic_id)
{
    let packet = "1/" + pic_id + "/2";
    port.write(packet);
    console.log("SEND ACK TO PIC: " + packet);
}

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
}