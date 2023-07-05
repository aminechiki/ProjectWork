namespace Domain.Entities
{
    public class UserAccesses
    {
        public int TypeOfMessage { get; set; }
        public int Device { get; set; }
        public int Board { get; set; }
        public bool Success { get; set; }
        public DateTime Date { get; set; }
        public string IdUser { get; set; }
    }
}
