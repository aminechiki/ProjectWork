using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages
{
    public class ManagementUsersModel : PageModel
    {
        public List<User> Users { get; set; }
        public List<Doors> Doors { get; set; }

        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;

        public ManagementUsersModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            this.Users = new List<User>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task OnGetAsync()
        {
            Users = (List<User>)await GetUsers();
            Doors = (List<Doors>)await GetDoors();
        }

        public async Task OnPostDeleteUser()
        {
            string IdUser = Request.Form["IdUser"];
            await DeleteUserPermissions(IdUser);
            await DeleteUser(IdUser);
            Response.Redirect("/Users/ManagementUsers");
        }
        public async Task DeleteUser(string IdUser)
        {
            const string query = @"DELETE FROM [dbo].[AspNetUsers] WHERE [Id] = @IdUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { IdUser });
        }
        public async Task DeleteUserPermissions(string IdUser)
        {
            const string query = @"DELETE FROM [dbo].[Permissions] WHERE [IdUser] = @IdUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { IdUser });
        }
        public async Task<IEnumerable<User>> GetUsers()
        {
            const string query = @"SELECT [Id],
                                           [Email],
                                           [PhoneNumber]
                                      FROM [dbo].[AspNetUsers]";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<User>(query);
        }
        public async Task<IEnumerable<Doors>> GetDoors()
        {
            const string query = @"
                                    SELECT [Doors].[Id] as IdDoor,
                                           [Doors].[IdBoard],
                                           [Doors].[Name] NameDoor,
                                           [Doors].[IdBuilding],
                                           [Buildings].Name as NameBuilding
                                      FROM [dbo].[Doors] 
                                      INNER JOIN [Buildings] ON Doors.IdBuilding = Buildings.Id;";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<Doors>(query);
        }
        public async Task<IEnumerable<UsersPermissionsDoors>> GetUsersPermissionsDoors()
        {
            const string query = @"  SELECT [Doors].[Id] as IdDoor,
                                           [Doors].[IdBoard],
                                           [Doors].[Name] NameDoor,
                                           [Doors].[IdBuilding],
                                           [Buildings].Name as NameBuilding
                                      FROM [dbo].[Doors] 
                                      INNER JOIN [Buildings] ON Doors.IdBuilding = Buildings.Id
                                      INNER JOIN [Permissions] ON Permissions.IdDoor = Doors.Id
                                      WHERE [Doors].[Id] = 1;";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<UsersPermissionsDoors>(query);
        }
    }
}
