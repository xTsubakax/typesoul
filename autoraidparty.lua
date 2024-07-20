if not game:IsLoaded() then
    game.Loaded:Wait()
end

getgenv().settings = {

    duo = false, -- set to false when soloing
    helper1 = "XxSparksv2xX", -- if only one helper set same name for both vars
    helper2 = "XxSparksv2xX",
    waitcheck = 5, -- how long to wait if kisuke doesnt work

}

-- vars
local serverlist = {}
local client = game:service'Players'.LocalPlayer
local teleport = game:service'TeleportService'
local katakura = 14069678431
local notifications = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/xTsubakax/Notification-Popup/main/Roblox%20Notifications'))()
webhook = 'https://discord.com/api/webhooks/1229664864511852574/3BTPgJE2IheIJlXtzGN3mbapeQA1fyGYmw5kHCjzMnX0Dg1j8l6LZz24P6I_lnOlgrls'

-- funcs
local function notify()
    notifications:message{
        Title = "Auto Boss Raid: <font color='rgb(255, 0, 100)'>Initiated</font>",
        Description = "By: Demon",
        Icon = 8678989506
    }
end

local function failsafe()
    for i, v in pairs(game:service('HttpService'):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if type(v) == 'table' and v.maxPlayers > v.playing and v.id ~= game.JobId then
            serverlist[#serverlist + 1] = v.id
        end
    end

    teleport:TeleportToPlaceInstance(game.PlaceId, serverlist[math.random(1, #serverlist)])
end

local function soloraid()
    client.Character:WaitForChild('CharacterHandler').Remotes.PartyCreate:FireServer()
    
    workspace.NPCs.RaidBoss.Kisuke.ClickDetector.MaxActivationDistance = math.huge
    fireclickdetector(workspace.NPCs.RaidBoss.Kisuke.ClickDetector)
    client:WaitForChild('Kisuke'):FireServer('Yes')
    task.wait(settings.waitcheck)
    if game.PlaceId == katakura then
        failsafe()
    end
end

local function duoraid()
    client.Character:WaitForChild('CharacterHandler').Remotes.PartyCreate:FireServer()

    notify()

    repeat task.wait() until workspace.Entities:FindFirstChild(settings.helper1) and workspace.Entities:FindFirstChild(settings.helper2)
    game:service"ReplicatedStorage".Remotes.PartyInvite:FireServer(game.Players[settings.helper1])
    task.wait(1)
    game:service"ReplicatedStorage".Remotes.PartyInvite:FireServer(game.Players[settings.helper2])

    repeat task.wait() until client.PlayerGui.MissionsUI.MainFrame.ScrollingFrame:WaitForChild(settings.helper1) and client.PlayerGui.MissionsUI.MainFrame.ScrollingFrame:WaitForChild(settings.helper2)

    workspace.NPCs.RaidBoss.Kisuke.ClickDetector.MaxActivationDistance = math.huge
    fireclickdetector(workspace.NPCs.RaidBoss.Kisuke.ClickDetector)
    client:WaitForChild('Kisuke'):FireServer('Yes')
    task.wait(settings.waitcheck)
    if game.PlaceId == katakura then
        failsafe()
    end
end

if game.PlaceId == katakura then
    repeat task.wait() until workspace.Entities:FindFirstChild(client.Name)

    if settings.duo == false then
        client.CharacterAdded:Connect(soloraid())
    else
        client.CharacterAdded:Connect(duoraid())
    end
else
    notify()
    game:service'RunService'.Heartbeat:Connect(function()

        sethiddenproperty(client, 'MaxSimulationRadius', math.huge*math.huge*math.huge)
        sethiddenproperty(client, 'SimulationRadius', math.huge*math.huge*math.huge)
        for _, v in pairs(workspace.Entities:GetChildren()) do
            if v:FindFirstChild("PlayerLook") then
                --[[local hum = client.Character.Humanoid
                hum.Name = 'Hentai'
                local humclone = hum:Clone()
                humclone.Parent = client.Character
                humclone.Name = 'Humanoid'
                task.wait()
                hum:Destroy()--]]

                v.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
                client.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
                v.Humanoid.Health = nil

                for i, c in pairs(v:GetDescendants()) do
                    if c:IsA('Part') then
                        c:BreakJoints()
                        c.CanCollide = false
                    end
                end
            end
        end
    end)
    client.PlayerGui:WaitForChild('ScreenEffects').ChildAdded:Connect(function(child)
        if child.Name == 'ItemFrame' then
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/xTsubakax/typesoul/main/BossItemWebhook'),true))()
        end
    end)
end