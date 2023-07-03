namespace Domain.Entities
{
    public class DoorsData
    {
        public int Id { get; set; }
        public int Device { get; set; }
        public int Board { get; set; }
        public int Code { get; set; }
        public int TypeOfMessage { get; set; }
        public DateTime Date { get; set; }
        public bool Success { get; set; }
        public string IdUser { get; set; }
        public string EmailUser { get; set; }
        public string NameDoor { get; set; }
        public string NameBuilding { get; set; }

    }
}
