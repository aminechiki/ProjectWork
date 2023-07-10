CREATE TABLE [Accesses] (
  [Id] integer PRIMARY KEY,
  [IdDoor] int NOT NULL,
  [IdUser] nvarchar NOT NULL,
  [NameDoor] nvarchar NOT NULL,
  [NameBuilding] nvarchar NOT NULL,
  [EmailUser] nvarchar NOT NULL,
  [Date] datetime NOT NULL,
  [Success] bit NOT NULL
)
GO

CREATE TABLE [Buildings] (
  [Id] integer PRIMARY KEY,
  [Name] nvarchar NOT NULL,
  [IdDevice] integer NOT NULL,
  [Description] nvarchar
)
GO

CREATE TABLE [Doors] (
  [Id] integer PRIMARY KEY,
  [Name] nvarchar NOT NULL,
  [IdBoard] integer NOT NULL,
  [IdBuilding] integer NOT NULL
)
GO

CREATE TABLE [Permissions] (
  [Id] integer PRIMARY KEY,
  [IdUser] nvarchar NOT NULL,
  [IdDoor] integer NOT NULL
)
GO

CREATE TABLE [Tokens] (
  [Id] integer PRIMARY KEY,
  [Code] integer NOT NULL,
  [IdDoor] integer NOT NULL,
  [date] datetime NOT NULL
)
GO

CREATE TABLE [AspNetUsers] (
  [Id] nvarchar(450) PRIMARY KEY,
  [UserName] nvarchar(256),
  [NormalizedUserName] nvarchar(256),
  [Email] nvarchar(256),
  [NormalizedEmail] nvarchar(256),
  [EmailConfirmed] bit NOT NULL,
  [PasswordHash] nvarchar(MAX),
  [SecurityStamp] nvarchar(MAX),
  [ConcurrencyStamp] nvarchar(MAX),
  [PhoneNumber] nvarchar(MAX),
  [PhoneNumberConfirmed] bit NOT NULL,
  [TwoFactorEnabled] bit NOT NULL,
  [LockoutEnd] datetimeoffset(7),
  [LockoutEnabled] bit NOT NULL,
  [AccessFailedCount] integer
)
GO

CREATE TABLE [AspNetRoles] (
  [Id] nvarchar(450) PRIMARY KEY,
  [Name] nvarchar(256),
  [NormalizedName] nvarchar(256),
  [ConcurrencyStamp] nvarchar(MAX)
)
GO

CREATE TABLE [AspNetUserRoles] (
  [UserId] nvarchar(450),
  [RoleId] nvarchar(450)
)
GO

CREATE UNIQUE INDEX [AspNetUserRoles_index_0] ON [AspNetUserRoles] ("UserId", "RoleId")
GO

ALTER TABLE [AspNetUserRoles] ADD FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
GO

ALTER TABLE [AspNetUserRoles] ADD FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id])
GO

ALTER TABLE [Tokens] ADD FOREIGN KEY ([IdDoor]) REFERENCES [Doors] ([Id])
GO

ALTER TABLE [Permissions] ADD FOREIGN KEY ([IdUser]) REFERENCES [AspNetUsers] ([Id])
GO

ALTER TABLE [Permissions] ADD FOREIGN KEY ([IdDoor]) REFERENCES [Doors] ([Id])
GO

ALTER TABLE [Doors] ADD FOREIGN KEY ([IdBuilding]) REFERENCES [Buildings] ([Id])
GO

ALTER TABLE [Accesses] ADD FOREIGN KEY ([IdDoor]) REFERENCES [Doors] ([Id])
GO

ALTER TABLE [Accesses] ADD FOREIGN KEY ([IdUser]) REFERENCES [AspNetUsers] ([Id])
GO
