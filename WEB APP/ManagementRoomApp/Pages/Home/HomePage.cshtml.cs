using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace ManagementRoomApp.Pages.Home
{
    [Authorize(Roles = "Admins")]
    public class HomePageModel : PageModel
    {
        public void OnGet()
        {
        }
    }
}
