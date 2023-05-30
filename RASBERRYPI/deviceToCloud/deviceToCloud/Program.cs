using deviceToCloud;

IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices(services =>
    {
        services.AddHostedService<communicationControlRoom>();
        services.AddSingleton<RoomDoorManagement>();
    })
    .Build();

await host.RunAsync();
