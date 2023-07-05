using ApplicationCore.Interfaces;
using Domain.Entities;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

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
        public async Task insertRoomData([ServiceBusTrigger("tech-geek-queue", Connection = "cs")] DoorsData roomData, ILogger log)
        {
            //roomData ha il parametro TypeOfMessage, può avere tre tipi di value quest'ultimo
            //se è uguale a 0 la board davanti alla porta ha genrato il token e di conseguenza
            //deve essere inserito nella tabella Tokens
            if (roomData.TypeOfMessage == 0) await this._StorageRoomData.InsertToken(roomData);
            //se è uguale a 1 la board davanti alla porta ha spedito un messaggio per aggiornare lo 
            //stato di accesso alla porta (conferma/fallita apertura porta)
            if (roomData.TypeOfMessage == 1) await this._StorageRoomData.InsertAccessesUser(roomData);
        }
    }
}
