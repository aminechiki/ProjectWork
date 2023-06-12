// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using Dapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

using Microsoft.Data.SqlClient;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ManagementRoomApp.Pages
{
    public class TokenModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;

        private readonly ILogger<TokenModel> _logger;
        private readonly string _ConnectionString;

        public TokenModel(SignInManager<IdentityUser> signInManager, ILogger<TokenModel> logger, IConfiguration configuration, UserManager<IdentityUser> userManager)
        {
            _signInManager = signInManager;
            _logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
            _userManager = userManager;
        }

        [BindProperty]
        public InputModel Input { get; set; }
        public class InputModel
        {
            public int Code { get; set; }

            [Display(Name = "Remember me?")]
            public bool RememberMe { get; set; }
        }
        public async Task OnGetAsync(string returnUrl = null)
        {

        }
        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            int code = Input.Code;

            //FARE IL CHECK DI TUTTI QUESTI CAMPI

            //una volta che l'utente inseriece nella form il codeice viene trovo l'id della doors che lo ha genrato
            int idDoorsToken = await GetIdDoorsToken(code);
            //certo lìid della persona loggata
            //fc583297-23c3-4f5b-b839-3882fce11b96
            //var user = await _userManager.GetUserAsync(User);
            var userId = _userManager.GetUserId(User);
            //una volta che ho tutti i dati necessari per effettuare la query su permission 
            int idPermissions = await GetIdPermissions(idDoorsToken, userId);

            //Se la persona che tenta di accedere alla porta non ha i permessi per poterlo fare 
            if (idPermissions == 0)
            {
                return RedirectToPage("./Error/ErrorPagePermissionDoor");
            }

            //RedirectToPage("./ManagementToken", new { ReturnUrl = returnUrl, RememberMe = Input.RememberMe });
            return RedirectToPage("./ManagementToken");
            //return Page();

            //QUESTA PARTE DI CODCICE DOVRA SU MANAMANAGEMNT CODE 
        }
        public async Task<int> GetIdPermissions(int idDoorsToken, string idUser)
        {
            const string query = @"SELECT [Id] FROM [dbo].[Permissions] WHERE [IdDoor] = @idDoorsToken AND [IdUser] = @idUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idDoorsToken, idUser });
        }
        public async Task<int> GetIdDoorsToken(int code)
        {
            const string query = @"SELECT [IdDoor] FROM [dbo].[Tokens] WHERE [Code] = @code";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { code });
        }
    }
}