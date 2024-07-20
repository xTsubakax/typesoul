--[[Auto Raid]]
-- Created by: A hooker

local client = game:service"Players".LocalPlayer

if game.PlaceId == 14069678431 then
    repeat task.wait() until game:IsLoaded() and workspace.Entities:FindFirstChild(client.Name)

    local function autoraid()
        client.Character:WaitForChild("CharacterHandler").Remotes.PartyCreate:FireServer()
        task.wait(1)
        workspace.NPCs.RaidBoss.Kisuke.ClickDetector.MaxActivationDistance = math.huge
        fireclickdetector(workspace.NPCs.RaidBoss.Kisuke.ClickDetector)
        task.wait(1)
        client.Kisuke:FireServer("Yes")
    end

    client.CharacterAdded:Connect(autoraid())
else
    game:GetService("RunService").Heartbeat:Connect(function()
        for _, v in pairs(workspace.Entities:GetChildren()) do
            if v:FindFirstChild("PlayerLook") then
                v.Humanoid.Health = 0
            end
        end
    end)
end