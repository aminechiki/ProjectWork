using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages
{
    public class ManagementUsersModel : PageModel
    {
        public List<User> Users { get; set; }
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

        }

        public async Task<IEnumerable<User>> GetUsers()
        {
            const string query = @"
                                    SELECT [Id],
                                           [Email],
                                           [PhoneNumber]
                                      FROM [dbo].[AspNetUsers]";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<User>(query);
        }
    }
}
