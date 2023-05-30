using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;



namespace ApplicationCore
{
    public static class DependecyInjection
    {
        public static IServiceCollection AddApplicationCore(this IServiceCollection services)
        {
            return services;
        }

    }
}
