const mqtt = require('mqtt');

const brokerUrl = "mqtt://192.168.0.26";

const topic = "/its_test";

const options = {
    username: 'mario',
    password: 'Blazi2017',
    clean: true
}

const SerialPort = require('serialport');
const ReadLine = require('@serialport/parser-readline');
const port = new SerialPort('COM7');

const parser = port.pipe(new ReadLine({ delimiter: '\r\n' }));
parser.on('data', parseMsg);

function parseMsg(data)
{
    let values = data.split('/');
    let jsonOut = {
        "PIC_id":values[0],
        "code":values[1]
    };
    let jsonStr = JSON.stringify(jsonOut);

    let client = mqtt.connect(brokerUrl, options);
    client.on("connect", () => {
        console.log("Connesso al broker");

        client.publish(topic, jsonStr, (err) => {
            if(err)
                console.error("Errore nella publish: ", err);
            else
                console.log("Messaggio pubblicato con successo");
        })
        client.end();
    });
    client.on("error", (err) => {
        console.error("Errore nella connessione al broker: ", err);
    });
}