Target = "Vortral" -- Player Name Here
getgenv().toggle = true

local runservice = game:service"RunService"
local retrieve = workspace.Effects:WaitForChild(game.Players.LocalPlayer.Name)

while toggle and runservice.Heartbeat:Wait() do
    for i, v in pairs(retrieve:GetDescendants()) do
        if v:IsA("Part") and v.Name ~= "DymonSinHead" then
            print(v)
            v.CFrame = workspace.Entities[Target].HumanoidRootPart.CFrame
        end
    end
end