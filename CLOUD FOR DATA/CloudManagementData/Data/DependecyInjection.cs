using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using ApplicationCore.Interfaces;
using Data.Repository;


namespace Data
{
    public static class DependecyInjection
    {
        public static IServiceCollection AddRoomData(this IServiceCollection services)
        {
            services.AddSingleton<IStorageRoomData, StorageRoomData>();
            return services;
        }
    }
}
