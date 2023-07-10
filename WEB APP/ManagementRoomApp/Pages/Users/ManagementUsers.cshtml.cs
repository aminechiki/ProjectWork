using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace ManagementRoomApp.Pages
{
    //[(Roles = "Amministratori")]
    [Authorize(Roles = "Amministratori")]
    public class ManagementUsersModel : PageModel
    {
        public List<User> Users { get; set; }
        public List<Doors> Doors { get; set; }

        private readonly ILogger<TokenModel> _Logger;
        private readonly string _ConnectionString;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public IActionResult AdminPage()
        {
            // Only users with the "Admin" role can access this action
            return Page();
        }
        public ManagementUsersModel(ILogger<TokenModel> logger, IConfiguration configuration, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            this.Users = new List<User>();
            this._Logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
            this._userManager = userManager;
            _roleManager = roleManager;
        }

        //public IActionResult Index() => Content("Admins");


        public async Task OnGetAsync()
        {
            Users = (List<User>)await GetUsers();
            Doors = (List<Doors>)await GetDoors();
            var userId = _userManager.GetUserId(User);

            foreach (var user in Users)
            {
                var userAdmin = await _userManager.FindByEmailAsync(user.Email);
                var roles = await _userManager.GetRolesAsync(userAdmin);

                if (roles.Count >= 1)
                {
                    if (roles[0] == "Amministratori")
                    {
                        user.IsAdmin = true;
                    }
                }
            }
        }

        public async Task OnPostSetUserAdmin()
        {
            string IdUser = Request.Form["IdUser"];
            var user = await _userManager.FindByIdAsync(IdUser);

            // Remove the user from their current role(s)
            var currentRoles = await _userManager.GetRolesAsync(user);
            await _userManager.RemoveFromRolesAsync(user, currentRoles);
            // Add the user to the new role
            await _userManager.AddToRoleAsync(user, "Amministratori");



            Response.Redirect("/Users/ManagementUsers");
        }
        public async Task OnPostSetNormalUser()
        {
            string IdUser = Request.Form["IdUser"];
            var user = await _userManager.FindByIdAsync(IdUser);
            // Remove the user from their current role(s)
            var currentRoles = await _userManager.GetRolesAsync(user);
            await _userManager.RemoveFromRolesAsync(user, currentRoles);
            // Add the user to the new role
            await _userManager.AddToRoleAsync(user, "Utenti");
            Response.Redirect("/Users/ManagementUsers");
        }
        public async Task<IActionResult> CreateRole(string roleName)
        {
            var roleExists = await _roleManager.RoleExistsAsync(roleName);

            if (!roleExists)
            {
                var role = new IdentityRole(roleName);
                var result = await _roleManager.CreateAsync(role);
            }
            return Page();
        }

        public async Task<IActionResult> AssignRole(string userId, string roleName)
        {
            var user = await _userManager.FindByIdAsync(userId);

            if (user != null)
            {
                var result = await _userManager.AddToRoleAsync(user, roleName);

                if (!result.Succeeded)
                {
                    // Handle role assignment failure
                }
            }
            return Page();
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
    }
}
