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
