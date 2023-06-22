using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Dapper;

namespace ManagementRoomApp.Pages.Buildings
{
    public class ManagementBuildingsModel : PageModel
    {
        public List<Building> Buildings { get; set; }
        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;

        public ManagementBuildingsModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            this.Buildings = new List<Building>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task OnGetAsync()
        {
            this.Buildings = (List<Building>)await GetBuildings();
        }
        public async Task<IEnumerable<Building>> GetBuildings()
        {
            const string query = @"
                                    SELECT [Id],
                                           [Name],
                                           [IdDevice]
                                      FROM [dbo].[Buildings]";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Building>(query);
        }
    }
}
