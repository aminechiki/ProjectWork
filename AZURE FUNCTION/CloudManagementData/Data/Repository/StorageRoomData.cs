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
        public async Task InsertAccessesUser(DoorsData roomData)
        {
            string idUser = roomData.IdUser;
            roomData.EmailUser = await GetEmailUser(idUser);

            int idBuilding = await GetIdBuilding(roomData.Device);
            roomData.NameDoor = await GetNameDoor(roomData.Board, idBuilding);


            roomData.NameBuilding = await GetNameBuilding(roomData.Board, idBuilding);


            int idDoor = await GetIdDoor(roomData.Board, idBuilding);
            roomData.Id = idDoor;
            await InsertAccesses(roomData);
        }

        public async Task<int> GetIdBuilding(int idDevice)
        {
            const string query = @"SELECT [Id] FROM [dbo].[Buildings] WHERE [IdDevice] = @idDevice";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idDevice });
        }

        public async Task<IEnumerable<DoorsData>> InsertAccesses(DoorsData roomData)
        {
            const string query = @"INSERT INTO [dbo].[Accesses]
                                                       ([IdDoor]
                                                       ,[IdUser]
                                                       ,[NameDoor]
                                                       ,[NameBuilding]
                                                       ,[EmailUser]
                                                       ,[Date]
                                                       ,[Success])
                                                 VALUES
                                                       (@Id
                                                       ,@IdUser
                                                       ,@NameDoor
                                                       ,@NameBuilding
                                                       ,@EmailUser
                                                       ,@Date
                                                       ,@Success)";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryAsync<DoorsData>(query, roomData);
        }
        public async Task<int> GetIdDoor(int idBoard, int idDevice)
        {
            const string query = @"SELECT [Id] FROM [dbo].[Doors] WHERE [IdBoard] = @idBoard AND [IdBuilding] = @idDevice";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<int>(query, new { idBoard, idDevice });
        }
        public async Task<string> GetIdBuilding(string idUser)
        {
            const string query = @"SELECT [UserName] FROM [dbo].[AspNetUsers] WHERE [Id] = @idUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<string>(query, new { idUser });
        }
        public async Task<string> GetEmailUser(string idUser)
        {
            const string query = @"SELECT [UserName] FROM [dbo].[AspNetUsers] WHERE [Id] = @idUser";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<string>(query, new { idUser });
        }
        public async Task<string> GetNameDoor(int IdBoard, int idBuilding)
        {
            const string query = @"SELECT [Name] FROM [dbo].[Doors] WHERE [IdBoard] = @IdBoard AND [IdBuilding] = @idBuilding";
            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<string>(query, new { IdBoard, idBuilding });
        }
        public async Task<string> GetNameBuilding(int IdBoard, int idDevice)
        {
            const string query = @"SELECT [Buildings].[Name] as NameBuilding
                                          FROM [Doors]
                                          INNER JOIN [Buildings] ON [IdBuilding] = [Buildings].[Id]
                                          WHERE [Doors].[IdBoard] = @IdBoard AND [IdBuilding] = @idDevice";

            using var connection = new SqlConnection(this._ConnectionString);
            await connection.OpenAsync();
            return await connection.QueryFirstOrDefaultAsync<string>(query, new { IdBoard, idDevice });
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
