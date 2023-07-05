namespace ManagementRoomApp.Models
{
    public class Doors
    {
        public int IdDoor { get; set; }
        public int IdBoard { get; set; }
        public string NameDoor { get; set; }
        public int IdBuilding { get; set; }

        public string Description { get; set; }
        public string NameBuilding { get; set; }
    }
}
