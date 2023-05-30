using System;
using System.Threading.Tasks;
using ApplicationCore.Interfaces;
using Domain.Entities;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;



namespace CloudManagementData
{
    public class FunctionApp
    {
        private readonly IStorageRoomData _StorageRoomData;

        public FunctionApp(IStorageRoomData storageRoomData)
        {
            this._StorageRoomData = storageRoomData;
        }

        [FunctionName("Function1")]
        public async Task insertRoomData([ServiceBusTrigger("tech-geek-queue", Connection = "cs")] RoomData roomData, ILogger log)  //connectionstring del servicebus
        {
            await this._StorageRoomData.InsertRoomData(roomData);
        }
    }
}
