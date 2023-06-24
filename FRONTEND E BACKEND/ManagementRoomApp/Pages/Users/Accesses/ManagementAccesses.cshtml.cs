using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Accesses
{
    public class ManagementAccessesModel : PageModel
    {
        public List<AccessesUser> Accesses { get; set; }
        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;
        public ManagementAccessesModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            this.Accesses = new List<AccessesUser>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task OnGetAsync()
        {
            //this.Accesses = (List<AccessesUser>)await GetAccesses(id);

            string idUser = Request.Query["Id"];
            this.Accesses = (List<AccessesUser>)await GetAccesses(idUser);
        }
        public async Task<IEnumerable<AccessesUser>> GetAccesses(string idUser)
        {
            const string query = @"
                                    SELECT [Id]
                                          ,[IdDoor]
                                          ,[IdUser]
                                          ,[NameDoor]
                                          ,[NameBuilding]
                                          ,[EmailUser]
                                          ,[Date]
                                      FROM [dbo].[Accesses]
                                      WHERE [IdUser] = @idUser";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            //Da toglere non va bene
            //List<AccessesUser> accessesUsers = (List<AccessesUser>)connection.QueryFirstOrDefaultAsync<AccessesUser>(query, new { idUser });
            //this.Accesses = accessesUsers;
            return await connection.QueryAsync<AccessesUser>(query, new { idUser });
        }
    }
}