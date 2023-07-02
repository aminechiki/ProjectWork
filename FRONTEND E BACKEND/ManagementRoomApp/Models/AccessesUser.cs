namespace ManagementRoomApp.Models
{
    public class AccessesUser
    {
        public int Id { get; set; }
        public int IdDoor { get; set; }
        public string IdUser { get; set; }
        public string NameDoor { get; set; }
        public string NameBuilding { get; set; }
        public string EmailUser { get; set; }
        public DateTime Date { get; set; }
        public bool Success { get; set; }
    }
}
