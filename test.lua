--[[for _, v in next, getgc(true) do
    if typeof(v) == 'function' and debug.info(v, 'n') == 'Flashstep' then
        local scr = rawget(getfenv(v), 'script');
        print(scr)
    end
end

for i, y in next, getgc(true) do
    if typeof(y) == 'function' then
        local funcinfo = debug.getinfo(y)
        if funcinfo and funcinfo.Name == "Flashstep" then
            print(i,y,funcinfo.Name)
        end
    end
end

game.Players.LocalPlayer:Kick()

game:service"RunService".RenderStepped:Connect(function()
    game:service('CoreGui').RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            game:service"TeleportService":Teleport(14069678431)
        end
    end)
end)

sentences = {
    "Idk",
    "gang rape",
    "zamn",
    "kitty kitty meow meow",
    "Shadows danced in the corners, whispering secrets of the forgotten.",
    "Put his finger in his bootyhole, now he quivering...",
    "A chill ran down her spine as she heard footsteps approaching, but there was no one there.",
    "The old house creaked and groaned as if it held ancient secrets within its walls.",
    "Money small but my dick long",
    "In the mirror, she caught a glimpse of a figure standing behind her, but when she turned around, no one was there.",
    "The moon cast eerie shadows through the barren trees, creating an atmosphere of unease.",
    "Sucked his dick and now he shivering...",
    "A child's laughter echoed through the empty halls of the abandoned asylum, sending shivers down their spine.",
    "As the fog rolled in, strange shapes began to emerge, lurking just beyond sight.",
    "I wanna let an arrancar fuck my ass",
    "The sound of scratching came from the attic, though she knew no one had been up there in years.",
    "Every night, the same nightmare haunted his sleep, a dark figure with glowing eyes reaching out to him from the darkness.",
    "Quigger pussy hits different...",
    "Something brushed against his leg in the water, icy fingers wrapping around his ankle before disappearing into the depths below."
}

str = string.gsub(game:service"Players".LocalPlayer.PlayerGui.ScreenEffects:WaitForChild("ItemFrame").TextLabel.Text, "obtained.", "")

local data = 
    {
        ["content"] = "My name is Vivi and I like cats :3",
        ["embeds"] = {{
            ["title"] = string.format("**%s**", str),
            ["description"] = sentences[math.random(1, #sentences)],
            ["type"] = "rich",
            ["color"] = tonumber(000000),
        }}
    }

local newdata = game:service('HttpService'):JSONEncode(data)

local headers = {
        ["content-type"] = "application/json"
}

request({
	Url = "https://discord.com/api/webhooks/1229664864511852574/3BTPgJE2IheIJlXtzGN3mbapeQA1fyGYmw5kHCjzMnX0Dg1j8l6LZz24P6I_lnOlgrls",
    Body = newdata,
	Method = "POST",
    Headers = headers
})



serverlist = {}
teleport = game:service'TeleportService'


for i, v in pairs(game:service('HttpService'):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if type(v) == 'table' and v.maxPlayers > v.playing and v.id ~= game.JobId then
            serverlist[#serverlist + 1] = v.id
        end
    end

print(table.concat(serverlist))

table = {}
print(table.concat(table))

hookfunction(kick, function()
    return nil
end)
task.wait(1)
game.Players.LocalPlayer:kick()--]]


local Table = {
    --[["ohwowcool",
    "delayedwhoops",
    "bloodedged",
    "rankedmidseason",
    "quickshutdown",
    "woahreal",
    "sorry4ranked3",
    "devilgene",
    "badquincy",
    "sundayupdate",
    "awesomesauce",
    "pockettactics.com/type-soul/codes",
    "nuova10k",
    "drakos10k",
    "khaotic10k",
    "eduardobrg10k",
    "sorryfortheinconvenienceee",
    "cowoe10k",
    "johnbooming",
    "nuovaprimadon",
    "supasta",
    "balancedbalance",
    "luisvonmarco",
    "khaoticyachty",
    "ididntgetopenedupiliterallyjustgottiredofblocking",
    "kamehamehax3",
    "pleasegivemererollscodesimliterallystarvingoverhereimstuckwithacid",
    "rankedseason2",
    "soulianstreak",
    "robotcowoe",
    "afkworld", 
    "100mlikes", 
    "lightsegunda",
    "robloxban",--]]
    "johnboomingg",
    "icanimaginesomeonesayingimnexttoatree",
    "phase1",
    "canyourecmeintodemonhunter",
    "myhopewillneverdie",
    "nosreppbestaustraliandeveloperinthewholeworld",
    "almightyeye",
    "tsugokusenku",
    "breathlesspumpkle",
    "160mvisits",
    "400kdiscmembers",
    "newfaceswow",
    "nothinghappened",
    "5minutesoffame",
    "thekiraeventparttwo",
}


for _, v in pairs(Table) do
    game:GetService("Players").LocalPlayer.Character.CharacterHandler.Remotes.Codes:InvokeServer(v)
end