using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO.Ports;
//use to send data to cloud
using Microsoft.Azure.Devices.Client;
//for serialize class
using System.Text.Json;

namespace deviceToCloud
{
    public class communicationControlRoom : BackgroundService
    {
        public SerialPort serialPort;
        public deviceData deviceData;
        private readonly ILogger<communicationControlRoom> _logger;
        private readonly IConfiguration _configuration;
        private readonly RoomDoorManagement _roomDoorManagement;
        //string Device;
        //DeviceClient deviceClient;

        public communicationControlRoom(ILogger<communicationControlRoom> logger, IConfiguration configuration, RoomDoorManagement roomDoorManagement)
        {
            //inizialize
            serialPort = new SerialPort();
            deviceData = new deviceData();

            //Ensure port isn't already opened:
            //Assign settings to the serial port:
            serialPort.PortName = "COM4";
            serialPort.BaudRate = 9600;
            //sets the standard lenght of data bits per byte
            serialPort.DataBits = 8;
            //imposte parity and stop bit
            serialPort.Parity = Parity.None;
            serialPort.StopBits = StopBits.One;
            //Imposte Timeout:
            serialPort.ReadTimeout = 1000;
            serialPort.WriteTimeout = 1000;
            serialPort.DataReceived += new SerialDataReceivedEventHandler(MyDataReceivedHandler);




            _configuration = configuration;
            _logger = logger;
            _roomDoorManagement = roomDoorManagement;
        }

        public bool OpenSerialCommunication()
        {
            bool statusSerialCommunication = false;
            try
            {
                serialPort.Open();
                return serialPort.IsOpen;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return statusSerialCommunication;
        }
         async void MyDataReceivedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            //PACCHETTO DATI

            // 1 - il numero della stanza
            // 2 - il nmero da inviare al cloud
            // 3 - forse anche il numero della stanza
            
            int count = serialPort.BytesToRead;
            byte[] ByteArray = new byte[count];
            serialPort.Read(ByteArray, 0, count);
            List<string> dataFromDevice = new List<string>();

            for(int i = 0;i < count;i++)
            { 
                dataFromDevice.Add(Convert.ToChar(ByteArray[i]).ToString());
            }
            
            if(dataFromDevice.Count != 0)
            {
                deviceData.code = Int16.Parse(dataFromDevice[0]);
                deviceData.date = DateTime.Now;
                deviceData.numberRoom= "17A";
            }

            //Send data to cloud
            _roomDoorManagement.SendDataCloud(deviceData);

            Console.WriteLine(deviceData.code);
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            //Try to open the port
            //si potrebbe effettuare un controllo e verfifcare se la
            //porta che si vuole aprire è possibile farlo

            //try to opern serial communiaction
            OpenSerialCommunication();
        }
    }
}
