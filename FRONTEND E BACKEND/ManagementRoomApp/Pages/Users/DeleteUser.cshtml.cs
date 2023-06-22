using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Dapper;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages.Users
{
    public class DeleteUserModel : PageModel
    {
        private readonly ILogger<TokenModel> _logger;
        private readonly string _ConnectionString;

        public DeleteUserModel(ILogger<TokenModel> logger, IConfiguration configuration)
        {
            this._logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public void OnGet()
        {
        }

        public async Task DeleteUser(string IdUser)
        {
            const string query = @"DELETE FROM [dbo].[AspNetUsers] WHERE [Id] = @IdUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            //return await connection.QueryFirstOrDefaultAsync<int>(query, new { code });
            await connection.ExecuteAsync(query, new { IdUser });
            RedirectToPage("/ManagementUsers");
        }

    }
}
