if (not game:IsLoaded()) then
    game.Loaded:Wait();
end;
function teleport()
    local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    for i,v in pairs(Servers.data) do
        if v.playing ~= v.maxPlayers then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
        end
    end
end
if ServerHop then
    while wait(40) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.StartUp:InvokeServer()
        end)
        wait(5)
        for i,v in pairs(game:GetService("Workspace").FruitSpawns:GetDescendants()) do
            if v:IsA("MeshPart") and v.Parent.Name == "Tori" then --getgenv().Fruit then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
        wait(5)
        syn.queue_on_teleport(
            getgenv().ServerHop = true 
            loadstring(game:HttpGet(""))()
        )
        repeat wait()
            teleport()
        until not ServerHop
    end
end
