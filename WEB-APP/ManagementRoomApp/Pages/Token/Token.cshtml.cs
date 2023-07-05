// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable
using Dapper;
using ManagementRoomApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Azure.Devices;
using Microsoft.Data.SqlClient;
using System.Text;
using System.Text.Json;

namespace ManagementRoomApp.Pages
{
    [Authorize(Roles = "Amministratori, Utenti")]

    public class TokenModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<TokenModel> _logger;
        private readonly string _ConnectionString;
        static ServiceClient ServiceClient;
        public string Iothubowner;
        public TokenModel(SignInManager<IdentityUser> signInManager, ILogger<TokenModel> logger, IConfiguration configuration, UserManager<IdentityUser> userManager)
        {
            this._signInManager = signInManager;
            this._logger = logger;
            this._ConnectionString = configuration.GetConnectionString("DefaultConnection");
            this._userManager = userManager;
            this.Iothubowner = configuration.GetConnectionString("iothubowner");
            ServiceClient = ServiceClient.CreateFromConnectionString(this.Iothubowner);
        }

        [BindProperty]
        public InputModel Input { get; set; }
        public class InputModel
        {
            public int Code { get; set; }
        }
        public async Task OnGetAsync(string returnUrl = null)
        {
        }
        public async Task OnPostCompareCode()
        {
            int code = Int16.Parse(Request.Form["code"]);

            //int code = Input.Code;
            //una volta che l'utente inseriece nella form il codeice viene trovo l'id della doors che lo ha genrato
            int idDoorsToken = await GetIdDoorsToken(code);
            //certo lìid della persona loggata
            //var user = await _userManager.GetUserAsync(User);
            var userId = _userManager.GetUserId(User);
            //commento
            string building = await GetBuildingDoors(idDoorsToken);
            //una volta che ho tutti i dati necessari per effettuare la query su permission 
            int idPermissions = await GetIdPermissions(idDoorsToken, userId);
            //Se la persona che tenta di accedere alla porta non ha i permessi per poterlo fare viene indirizzato nella pagina di errore
            //viceversa viene indirizzato nella pagina che mostra il token

            int idBoard = await GetIdBoard(idDoorsToken);
            if (idPermissions == 0)
            {
                //DA SISTEMARE
                RedirectToPage("../Error/ErrorPagePermissionDoor");
                Response.Redirect($"../Error/ErrorPagePermissionDoor");
            }
            else
            {
                DeleteToken(code);
                int codetoken = GenerateToken();
                MessageToken message = new MessageToken(codetoken, idBoard, userId);
                string messageSerialize = JsonSerializer.Serialize(message);

                //aggiungere id che corrisponde all nome del device
                Console.WriteLine(userId);
                await SendDataToDevice(building, messageSerialize);
                Response.Redirect($"./ManagementToken?token={codetoken}");
            }
        }
        public async Task SendDataToDevice(string device, string message)
        {
            using var messageDevice = new Message(Encoding.ASCII.GetBytes(message))
            {
                ContentType = "application/json",
                ContentEncoding = "utf-8",
            };

            await ServiceClient.SendAsync(device, messageDevice);
        }

        public async Task<int> GetIdBoard(int idDoorsToken)
        {
            const string query = @"SELECT [IdBoard] FROM [dbo].[Doors] WHERE [Id] = @idDoorsToken";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idDoorsToken });
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

        public async Task<string> GetBuildingDoors(int idDoor)
        {
            const string query = @"SELECT [Buildings].Name as NameBuilding
                                      FROM [dbo].[Doors] 
                                      INNER JOIN [Buildings] ON Doors.IdBuilding = Buildings.Id
                                      WHERE [Doors].[Id] = @idDoor;";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<string>(query, new { idDoor });
        }
        public async Task DeleteToken(int code)
        {
            const string query = @"DELETE FROM [dbo].[Tokens] WHERE [Code] = @code";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            await connection.ExecuteAsync(query, new { code });
        }

        public int GenerateToken()
        {
            int min = 1000;
            int max = 9999;
            Random randomToken = new Random();
            return randomToken.Next(min, max);
        }
    }
}