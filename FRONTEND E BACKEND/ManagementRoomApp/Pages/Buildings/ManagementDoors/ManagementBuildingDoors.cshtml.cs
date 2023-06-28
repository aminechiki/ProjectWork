using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Buildings.ManagementDoors
{
    public class ManagementBuildingDoorsModel : PageModel
    {
        public List<Doors> Doors { get; set; }
        private readonly ILogger<ManagementBuildingDoorsModel> _Logger;
        private readonly string _ConnectionString;

        public ManagementBuildingDoorsModel(ILogger<ManagementBuildingDoorsModel> logger, IConfiguration configuration)
        {
            Doors = new List<Doors>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task OnGetAsync(int id)
        {
            this.Doors = (List<Doors>)await GetDoors(id);
        }

        public async Task<IActionResult> OnPostDeleteDoor(int id)
        {
            //controllare che id è, che non elimini tutti 
            //idBuilding è inutile
            int IdDoor = Int16.Parse(Request.Form["IdDoor"]);
            int idBuilding = id;
            await DeletePermissions(IdDoor);
            await DeleteDoor(IdDoor);
            return RedirectToPage("/Buildings/ManagementDoors/ManagementBuildingDoors", new { id });
        }

        public async Task<IActionResult> OnPostInsertDoor(int id)
        {
            int IdDoor = Int16.Parse(Request.Form["IdBoard"]);
            string nameDoor = Request.Form["NameDoor"];
            int idBuilding = id;

            await InsertDoor(idBuilding, IdDoor, nameDoor);
            // Response.Redirect($"/Buildings/ManagementDoors/ManagementBuildingDoors?Id={id}");
            return RedirectToPage("/Buildings/ManagementDoors/ManagementBuildingDoors", new { id });
            //await OnPostIn("/sertDoor();
        }

        public async Task InsertDoor(int idBuilding, int IdDoor, string nameDoor)
        {
            const string query = @"INSERT INTO [dbo].[Doors]
                                                         ([IdBoard]
                                                        ,[Name]
                                                        ,[idBuilding])
                                                   VALUES
                                                         (@IdDoor
                                                         ,@nameDoor
                                                         ,@idBuilding)";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.QueryAsync<UsersPermissionsDoors>(query, new { idBuilding, IdDoor, nameDoor });
        }

        public async Task DeleteDoor(int idDoor)
        {
            const string query = @"DELETE FROM [Doors]
                                         WHERE [Id] = @idDoor";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.QueryAsync<int>(query, new { idDoor });
        }
        public async Task DeletePermissions(int IdDoor)
        {
            const string query = @"DELETE FROM [dbo].[Permissions] WHERE [IdDoor] = @IdDoor";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { IdDoor });
        }
        public async Task<IEnumerable<Doors>> GetDoors(int idBuilding)
        {
            const string query = @"SELECT [Id] as [IdDoor]
                                         ,[Name] as NameDoor, [IdBoard], 
                                          [IdBuilding] 
                                          FROM [Doors]
                                       WHERE [IdBuilding] = @idBuilding";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Doors>(query, new { idBuilding });
        }
    }
}
