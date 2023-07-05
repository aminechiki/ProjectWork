namespace ManagementRoomApp.Models
{
    public class MessageToken
    {
        public string IdUser { get; set; }
        public int Code { get; set; }
        public int IdDoor { get; set; }

        public MessageToken(int code, int idDoor, string idUser)
        {
            Code = code;
            IdDoor = idDoor;
            IdUser = idUser;
        }
    }
}
