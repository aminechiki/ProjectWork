using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Accesses
{
    //[Authorize(Roles ="Admins")]
    [Authorize(Roles = "Amministratori")]
    public class ManagementAccessesModel : PageModel
    {
        public List<AccessesUser> Accesses { get; set; }
        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;
        private readonly UserManager<IdentityUser> _userManager;
        public int SuccessAccesses { get; set; }
        public int FailureAccesses { get; set; }
        public ManagementAccessesModel(ILogger<TokenModel> logger, IConfiguration configuration, UserManager<IdentityUser> userManager)
        {
            this.Accesses = new List<AccessesUser>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
            _userManager = userManager;

            //var users = _userManager.Users.ToList();
            //foreach (var user in users)
            //{
            //    var roles = await _userManager.GetRolesAsync(user)
            //}

            //var user = await _userManager.FindByNameAsync("aaaa
            // 
            //var result = await _userManager.AddToRoleAsync(user, "Admins");

        }
        public async Task OnGetAsync()
        {
            //this.Accesses = (List<AccessesUser>)await GetAccesses(id);

            string idUser = Request.Query["Id"];
            this.Accesses = (List<AccessesUser>)await GetAccesses(idUser);
            SuccessAccesses = await GetSuccessAccesses(idUser);
            FailureAccesses = await GetFailureAccesses(idUser);
        }

        public async Task<int> GetSuccessAccesses(string idUser)
        {
            const string query = @"SELECT COUNT([Success]) 
                                          FROM [dbo].[Accesses] 
                                          WHERE [Success] = 1 AND [IdUser] = @idUser
                                          GROUP BY [Success];";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idUser });
        }

        public async Task<int> GetFailureAccesses(string idUser)
        {
            const string query = @"SELECT COUNT([Success]) 
                                          FROM [dbo].[Accesses] 
                                          WHERE [Success] = 0 AND [IdUser] = @idUser
                                          GROUP BY [Success];";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idUser });
        }
        public async Task<IEnumerable<AccessesUser>> GetAccesses(string idUser)
        {
            const string query = @"
                                      SELECT [Accesses].[Id]
                                          ,[IdDoor]
                                          ,[IdUser]
                                          ,[NameDoor]
                                          ,[NameBuilding]
                                          ,[EmailUser]
                                          ,[Date]
                                          ,[Success]
										  ,[Buildings].[Description]
                                      FROM [dbo].[Accesses]
									  INNER JOIN [Doors] ON [Doors].[Id] = [Accesses].[IdDoor]
									  INNER JOIN Buildings ON Buildings.[Id] = [Doors].[IdBuilding]
                                      WHERE [IdUser] = @idUser
                                      ORDER BY Date DESC";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            //Da toglere non va bene
            //List<AccessesUser> accessesUsers = (List<AccessesUser>)connection.QueryFirstOrDefaultAsync<AccessesUser>(query, new { idUser });
            //this.Accesses = accessesUsers;
            return await connection.QueryAsync<AccessesUser>(query, new { idUser });
        }
    }
}