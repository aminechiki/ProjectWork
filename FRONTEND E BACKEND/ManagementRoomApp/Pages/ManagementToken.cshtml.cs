using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
//Package for send message to device
using Microsoft.Azure.Devices;
using System.Text;


namespace ManagementRoomApp.Pages
{
    public class ManagementTokenModel : PageModel
    {
        //for send message to device
        static ServiceClient ServiceClient;
        public string Iothubowner;
        public int Code { get; set; }
        public ManagementTokenModel(IConfiguration configuration)
        {
            this.Iothubowner = configuration.GetConnectionString("iothubowner");
            ServiceClient = ServiceClient.CreateFromConnectionString(this.Iothubowner);
            SendToken();
        }

        public void OnGet()
        {

        }
        public async Task<IActionResult> SendToken()
        {
            int token = GenerateToken();
            this.Code = token;

            //create a object Message with inside billboardSerialize object serialize
            using var message = new Message(Encoding.ASCII.GetBytes(token.ToString()))
            {
                ContentType = "application/json",
                ContentEncoding = "utf-8",
            };

            //send a message to device 
            await ServiceClient.SendAsync("DeviceCampus", message);

            return Page();
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
