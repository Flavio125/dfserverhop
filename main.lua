getgenv().ServerHop = true
getgenv().ffruit = "Tori" --

--[[
    Part of the server hop is Made By: Sensei Joshy#1060
    Discord: https://discord.com/invite/phantomhub
]]--

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
    print("Starting")
    while wait(5) do
    
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.StartUp:InvokeServer()
        end)
        wait(3)
        for i,v in pairs(game:GetService("Workspace").FruitSpawns:GetDescendants()) do
            if v:IsA("MeshPart") and v.Parent.Name == getgenv().ffruit then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(1)
                fireproximityprompt(game:GetService("Workspace").FruitSpawns[getgenv().ffruit].ProximityPrompt,5 , false)
            end
        end
        print("changin server")
        wait(1)
        repeat wait()
            teleport()
        until not ServerHop
    end
end
