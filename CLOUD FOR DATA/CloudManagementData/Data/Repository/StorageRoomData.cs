using ApplicationCore.Interfaces;
using Dapper;
using Domain.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace Data.Repository
{
    public class StorageRoomData : IStorageRoomData
    {
        private readonly string _ConnectionString;
        public StorageRoomData(IConfiguration configuration)
        {
            this._ConnectionString = configuration.GetConnectionString("db");
        }
        public async Task<IEnumerable<RoomData>> InsertRoomData(RoomData roomData)
        {
            const string query = @"INSERT INTO [dbo].[RoomDataAmime]
                                       ([edificio]
                                       ,[codiceStanza]
                                       ,[data])
                                 VALUES
                                       (@numberRoom
                                       ,@code
                                       ,@date)";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();  //La connection string va passata tramite _connectionString

            return await connection.QueryAsync<RoomData>(query, roomData);
        }
    }
}
