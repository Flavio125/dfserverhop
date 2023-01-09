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
                wait(1)
                fireproximityprompt(game:GetService("Workspace").FruitSpawns.Tori.ProximityPrompt,5 , false)
            end
        end
        wait(1)
        repeat wait()
            teleport()
        until not ServerHop
    end
end
