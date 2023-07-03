using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Users.DoorsPermissiones
{
    public class ManagementDoorsPermissionesModel : PageModel
    {
        public List<Doors> Doors { get; set; }
        public List<Building> Building { get; set; }
        public List<UsersPermissionsDoors> UsersPermissionsDoors;
        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;

        public ManagementDoorsPermissionesModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            Doors = new List<Doors>();
            Building = new List<Building>();
            UsersPermissionsDoors = new List<UsersPermissionsDoors>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task OnGetAsync()
        {
            Doors = (List<Doors>)await GetDoors();
            Building = (List<Building>)await GetBuilding();
            string idUser = Request.Query["Id"];
            this.UsersPermissionsDoors = (List<UsersPermissionsDoors>)await GetDoorsPermissionesUser(idUser);
        }
        public async Task OnPostDeletePermissions()
        {
            int idDoor = Int16.Parse(Request.Form["IdDoor"]);
            string idUser = Request.Form["IdUser"];
            await DeletePermissions(idDoor);
            Response.Redirect($"/Users/DoorsPermissiones/ManagementDoorsPermissiones?Id={idUser}");
        }
        public async Task DeletePermissions(int IdDoor)
        {
            const string query = @"DELETE FROM [dbo].[Permissions] WHERE [IdDoor] = @IdDoor";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { IdDoor });
        }

        public async Task OnPostInsertDoorPermissions()
        {
            int idDoor = Int16.Parse(Request.Form["IdDoor"]);
            string idUser = Request.Form["IdUser"];
            await InsertDoorsPermissionesUser(idUser, idDoor);
            Response.Redirect($"/Users/DoorsPermissiones/ManagementDoorsPermissiones?Id={idUser}");
        }
        public async Task<IEnumerable<UsersPermissionsDoors>> InsertDoorsPermissionesUser(string idUser, int idDoor)
        {
            const string query = @"INSERT INTO [dbo].[Permissions]
                                                         ([IdUser]
                                                        ,[IdDoor])
                                                   VALUES
                                                         (@idUser
                                                         ,@idDoor)";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<UsersPermissionsDoors>(query, new { idUser, idDoor });
        }

        public async Task<IEnumerable<Doors>> GetDoors()
        {
            const string query = @"SELECT [Doors].[Id] as [IdDoor]
                                        ,[Doors].[Name] as NameDoor, 
                                        [Doors].[IdBoard], 
                                        [Doors].[IdBuilding],
                                        [Buildings].Description,
                                        [Buildings].[Name] as NameBuilding
                                        FROM [Doors]
                                        INNER JOIN [Buildings] ON [IdBuilding] = [Buildings].[Id]";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Doors>(query);
        }
        public async Task<IEnumerable<Building>> GetBuilding()
        {
            const string query = @"SELECT [Id], [Name] as NameBuilding, [IdDevice] FROM [Buildings]";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Building>(query);
        }
        public async Task<IEnumerable<UsersPermissionsDoors>> GetDoorsPermissionesUser(string idUser)
        {
            const string query = @"
                                     SELECT [IdUser],
		                                    [IdDoor],
		                                    [Doors].Name as NameDoor,
		                                    [Buildings].Name as NameBuilding,
                                            [Buildings].[Description]
		                                    FROM [Permissions]
		                                    INNER JOIN Doors ON [Doors].Id = [Permissions].IdDoor
		                                    INNER JOIN Buildings ON [Doors].IdBuilding = [Buildings].[Id]
		                                    WHERE [Permissions].[IdUser] = @idUser";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<UsersPermissionsDoors>(query, new { idUser });
        }

    }
}
