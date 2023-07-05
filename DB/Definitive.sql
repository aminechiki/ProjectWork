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
  [Id] nvarchar PRIMARY KEY,
  [Email] nvarchar
)
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
