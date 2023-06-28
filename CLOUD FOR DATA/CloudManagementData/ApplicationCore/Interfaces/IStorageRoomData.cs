using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;


namespace ApplicationCore.Interfaces
{
    public interface IStorageRoomData
    {
        public Task<IEnumerable<DoorsData>> InsertToken(DoorsData roomData);
        public Task<IEnumerable<DoorsData>> InsertAccesses(DoorsData roomData);
    }
}
