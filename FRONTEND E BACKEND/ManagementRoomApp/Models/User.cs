using Microsoft.AspNetCore.Identity;

namespace ManagementRoomApp.Models
{
    public class User : IdentityUser
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public double PhoneNumber { get; set; }
        public bool IsAdmin { get; set; }

        private UserManager<IdentityUser> _userManager;
        public User()
        {

        }
    }
}
