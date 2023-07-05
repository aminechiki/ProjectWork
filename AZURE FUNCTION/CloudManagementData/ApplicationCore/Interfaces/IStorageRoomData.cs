using Domain.Entities;


namespace ApplicationCore.Interfaces
{
    public interface IStorageRoomData
    {
        public Task<IEnumerable<DoorsData>> InsertToken(DoorsData roomData);
        public Task<IEnumerable<DoorsData>> InsertAccesses(DoorsData roomData);
        public Task InsertAccessesUser(DoorsData roomData);
    }
}
