-- made by bolt, add "www.doxbin.com" on discord for info
--[[
 ___                ___   ___      
(   )              (   ) (   )     
 | |.-.     .--.    | |   | |_     
 | /   \   /    \   | |  (   __)   
 |  .-. | |  .-. ;  | |   | |      
 | |  | | | |  | |  | |   | | ___  
 | |  | | | |  | |  | |   | |(   ) 
 | |  | | | |  | |  | |   | | | |  
 | '  | | | '  | |  | |   | ' | |  
 ' `-' ;  '  `-' /  | |   ' `-' ;  
  `.__.    `.__.'  (___)   `.__.   
]]--

--performance booster
loadstring(game:HttpGet("https://raw.githubusercontent.com/r1FH/Performance-Booster/main/loader.lua", true))()

--main stuff below
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

Notification.Notify("Boltify AA", "Loaded!", "rbxassetid://13974670417", {
    Duration = 2,       
    Main = {
        Rounding = false,
    }
});

task.wait(0.5)

Notification.Notify("Boltify AA", "Some bugs might occur while walking or standing still!", "rbxassetid://13974670417", {
    Duration = 2,       
    Main = {
        Rounding = false,
    }
});

task.wait(0.5)

Notification.Notify("Boltify AA", "
Please add 'www.doxbin.com' on discord if you want to contact me!", "rbxassetid://13974670417", {
    Duration = 2,       
    Main = {
        Rounding = false,
    }
});


local RunService = game:GetService("RunService")

local character = game.Players.LocalPlayer.Character
local HRP = character.HumanoidRootPart
local orbitPart = character:FindFirstChild("OrbitPart")

-- creates an orbit part if it doesn't exist
if not orbitPart then
    orbitPart = Instance.new("Part")
    orbitPart.Name = "OrbitPart"
    orbitPart.Size = Vector3.new(1, 1, 1)
    orbitPart.Color = Color3.new(1, 1, 0)
    orbitPart.Anchored = true
    orbitPart.Parent = character
    orbitPart.Material = Enum.Material.ForceField
end

local CYCLE_DURATION = 3
local DISTANCE = 10

local i = 0
RunService.RenderStepped:Connect(function(dt)
    i = (i + dt/CYCLE_DURATION) % 1
    local alpha = 2 * math.pi * i

    orbitPart.CFrame = CFrame.Angles(0, alpha, 0)
        * CFrame.new(0, 0, DISTANCE)
        + HRP.Position
end)

_G.BoltifyAA = true

    game.RunService.Heartbeat:Connect(function()
        if _G.BoltifyAA then    
        local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = orbitPart.Position
        game.RunService.RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
        end    
    end)

local Plr = game.Players.LocalPlayer

Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
    if new == Enum.HumanoidStateType.Freefall == true then
        wait(0.27)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(CurrentVelocity, -5, CurrentVelocity)
    end
end)