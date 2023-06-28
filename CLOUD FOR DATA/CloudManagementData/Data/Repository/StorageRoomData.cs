using ApplicationCore.Interfaces;
using Dapper;
using Domain.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System;

namespace Data.Repository
{
    public class StorageRoomData : IStorageRoomData
    {
        private readonly string _ConnectionString;
        public StorageRoomData(IConfiguration configuration)
        {
            this._ConnectionString = configuration.GetConnectionString("db");
        }
        public async Task<IEnumerable<DoorsData>> InsertAccesses(DoorsData roomData)
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
            await connection.OpenAsync();
            return await connection.QueryAsync<DoorsData>(query, roomData);
        }
        public async Task<int> GetIdDevice(int id)
        {
            const string query = @"SELECT [Id] FROM [dbo].[Buildings] WHERE [IdDevice] = @id";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { id });
        }
        public async Task<int> GetDoors(int idBoard, int idDevice)
        {
            const string query = @"SELECT [Id] FROM [dbo].[Doors] WHERE [IdBoard] = @idBoard AND [IdBuilding] = @idDevice";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idBoard, idDevice });
        }
        public async Task<IEnumerable<DoorsData>> InsertToken(DoorsData roomData)
        {
            //si recupera l'id del device e l'id della board per trovare l'id della porta 
            int DeviceId = await GetIdDevice(roomData.Device);
            int idDoor = await GetDoors(roomData.Board, DeviceId);
            int code = roomData.Code;
            DateTime date = roomData.Date;

            //recuperati tutti i campi della tabella Tokens vengono inseriti su di essa
            //(id della tabella doors, il codice e la data di creazione del token)
            const string query = @" INSERT INTO[dbo].[Tokens]
                                                    ([IdDoor]
                                                   ,[Code]
                                                   ,[date])
                                             VALUES
                                                   (@idDoor,
                                                    @code,
                                                    @date)";
            
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<DoorsData>(query, new { idDoor, code, date });
        }
    }
}
