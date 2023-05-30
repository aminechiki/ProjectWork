using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//use to send data to cloud
using Microsoft.Azure.Devices.Client;
//for serialize class
using System.Text.Json;

namespace deviceToCloud
{
    public class RoomDoorManagement
    {
        private readonly ILogger<RoomDoorManagement> _logger;
        communicationControlRoom communicationDevices;
        private readonly IConfiguration _configuration;
        string Device;
        DeviceClient deviceClient;
        public RoomDoorManagement(ILogger<RoomDoorManagement> logger, IConfiguration configuration)
        {
            _configuration= configuration;
            _logger = logger;

            //conf for send data to cloud
            this.Device = _configuration.GetConnectionString("Device");
            this.deviceClient = DeviceClient.CreateFromConnectionString(Device);
        }

        //FACCIO UNA CLASSE A CUI IN INGRESSO LI PASSO SOLO IN INGRESSO IL
        //Codice DA SPEDIRE E LO INVIA METTENDOCI DATA ECC...

        public async Task SendDataCloud(deviceData deviceData)
        {
            string deviceDataSerialize = JsonSerializer.Serialize(deviceData);

            //BUILD A MESSAGE
            using var message = new Message(Encoding.ASCII.GetBytes(deviceDataSerialize))
            {
                ContentType = "application/json",
                ContentEncoding = "utf-8",
            };

            //send data to cloud 
            await deviceClient.SendEventAsync(message);
        }
    }
}