namespace ManagementRoomApp.Models
{
    public class MessageToken
    {
        public int Code { get; set; }
        public int IdDoor { get; set; }

        public MessageToken(int code, int idDoor)
        {
            Code = code;
            IdDoor = idDoor;
        }
    }
}
