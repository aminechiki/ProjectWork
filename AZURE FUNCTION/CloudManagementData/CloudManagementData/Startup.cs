using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using ApplicationCore;
using Data;


[assembly: FunctionsStartup(typeof(CloudManagementData.Startup))]

namespace CloudManagementData
{
    public class Startup : FunctionsStartup
    {
        public override void Configure(IFunctionsHostBuilder builder)
        {
            builder.Services.AddRoomData();
            builder.Services.AddApplicationCore();
        }
    }
}
