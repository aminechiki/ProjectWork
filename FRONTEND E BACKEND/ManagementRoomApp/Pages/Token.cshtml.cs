// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using Dapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
//Package for send message to device
using Microsoft.Azure.Devices;
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
        //for send message to device
        static ServiceClient ServiceClient;
        private readonly string _ConnectionString;
        public string Iothubowner;
        public TokenModel(SignInManager<IdentityUser> signInManager, ILogger<TokenModel> logger, IConfiguration configuration, UserManager<IdentityUser> userManager)
        {
            _signInManager = signInManager;
            _logger = logger;
            //for send message to device
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
            this.Iothubowner = configuration.GetConnectionString("iothubowner");
            ServiceClient = ServiceClient.CreateFromConnectionString(this.Iothubowner);

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

            //DOPO CHE SI SARANNO VERIFICATI I VALORI QUI SOPRA ALORA L'UTENTE VERR REDIRETTO NELLA PAGINA MANAGMENTTOKEN

           //QUESTA PARTE DI CODCICE DOVRA SU MANAMANAGEMNT CODE 
            int token = 2244; 

            //create a object Message with inside billboardSerialize object serialize
            using var message = new Message(Encoding.ASCII.GetBytes(token.ToString()))
            {
                ContentType = "application/json",
                ContentEncoding = "utf-8",
            };
       
            //send a message to device 
            await ServiceClient.SendAsync("DeviceCampus", message);

            //RedirectToPage("./ManagementToken", new { ReturnUrl = returnUrl, RememberMe = Input.RememberMe });
            return RedirectToPage("./ManagementToken");
            //return Page();
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