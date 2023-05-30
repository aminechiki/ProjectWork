using System;
using deviceToCloud;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace CloudManagementData
{
    public class Function1
    {
        [FunctionName("Function1")]
        public void Run([ServiceBusTrigger("tech-geek-queue", Connection = "cs")] deviceData deviceData, ILogger log)
        {
            //log.LogInformation($"C# ServiceBus queue trigger function processed message: {myQueueItem}");

            //PROSSIMI PUNTI

            // - IMPLEMENTARE LA DEPENDENCY INJECTION

            Console.WriteLine(deviceData);



        }
    }
}
