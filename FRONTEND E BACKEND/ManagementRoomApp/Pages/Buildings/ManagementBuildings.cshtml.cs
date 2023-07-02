using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Buildings
{
    public class ManagementBuildingsModel : PageModel
    {
        public Building building;
        public List<Building> Buildings { get; set; }
        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;

        public ManagementBuildingsModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            this.building = new Building();
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
                                           [Name] as NameBuilding,
                                           [IdDevice],
                                           [Description]     
                                      FROM [dbo].[Buildings]";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Building>(query);
        }
        public async Task OnPostBuilding()
        {
            int IdDevice = Int16.Parse(Request.Form["IdDevice"]);
            string NameDevice = Request.Form["NameBuilding"];
            string IdDeviceCloud = Request.Form["IdDeviceCloud"];
            await InsertBuilding(IdDevice, NameDevice, IdDeviceCloud);
            RedirectToPage("/ManagementBuildings");
        }
        public async Task InsertBuilding(int IdDevice, string NameBuilding, string IdDeviceCloud)
        {
            const string query = @"INSERT INTO [dbo].[Buildings]
                                                         ([Name]
                                                        ,[IdDevice]
                                                        ,[Description])
                                                   VALUES
                                                         (@NameBuilding
                                                         ,@IdDevice
                                                         ,@IdDeviceCloud)";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            //return await connection.QueryFirstOrDefaultAsync<int>(query, new { code });
            await connection.ExecuteAsync(query, new { NameBuilding, IdDevice, IdDeviceCloud });
            //RedirectToPage("/ManagementBuildings");
            Response.Redirect("/Buildings/ManagementBuildings");
        }
        public async Task OnPostDeleteBuilding()
        {
            int idBuilding = Int16.Parse(Request.Form["idBuilding"]);
            await DeleteDoorBuilding(idBuilding);
            await DeleteBuilding(idBuilding);
            Response.Redirect("/Buildings/ManagementBuildings");
        }

        public async Task DeleteDoorBuilding(int idBuilding)
        {
            const string query = @"DELETE FROM [Doors]
                                         WHERE [IdBuilding] = @idBuilding";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.QueryAsync<int>(query, new { idBuilding });
        }

        public async Task DeleteBuilding(int IdBuilding)
        {
            const string query = @"DELETE FROM [dbo].[Buildings] WHERE [Id] = @IdBuilding";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { IdBuilding });
        }
        public async Task OnPostDoor(int id)
        {
            int IdBoard = Int16.Parse(Request.Form["IdBoard"]);
            string NameDoor = Request.Form["NameDoor"];
            int IdBuilding = Int16.Parse(Request.Form["IdBuilding"]);
            await InsertDoor(IdBoard, NameDoor, IdBuilding);
        }
        public async Task InsertDoor(int IdBoard, string NameDoor, int IdBuilding)
        {
            const string query = @"INSERT INTO [dbo].[Doors]
                                                   ([IdBoard]
                                                   ,[Name]
                                                   ,[IdBuilding])
                                             VALUES
                                                   (@IdBoard
                                                   ,@NameDoor
                                                   ,@IdBuilding)";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            //return await connection.QueryFirstOrDefaultAsync<int>(query, new { code });
            await connection.ExecuteAsync(query, new { IdBuilding, IdBoard, NameDoor });
            //RedirectToPage("/ManagementBuildings");
            Response.Redirect("/Buildings/ManagementBuildings");
        }
    }
}
