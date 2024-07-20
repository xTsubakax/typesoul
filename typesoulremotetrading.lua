getgenv().Info = {
    Player = "Vortral", --/ Player to send trade.
    Item = "Eyes Reroll", --/ Item to give "Player"
    Amount = 4, --/ Amount of "Item" to give [Max 4]
    Times = 10, --/ Amount of times to repeat
    Method = "Send" --/ [Send or Recieve]
}

local LocalPlayer = game:GetService("Players").LocalPlayer
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait() 

local PlayerGui, CharHandler = LocalPlayer.PlayerGui, Char.CharacterHandler
local TradingUI, Remote = PlayerGui.Trading.Main.Player2.Accepted, CharHandler.Remotes

if Info.Method == "Send" then
    for m = 1, Info.Times do
        task.wait()

        Remote.Trade:InvokeServer(Info.Player)

        repeat task.wait() until TradingUI.Visible

        for i = 1, Info.Amount do
            task.wait()
            Remote.TradeEvent:FireServer("AddItem", Info.Item, i)
        end

        Remote.TradeEvent:FireServer("Accepted")

        repeat task.wait() until not TradingUI.Visible
    end
elseif Info.Method == "Recieve" then
    Remote.Trade:InvokeServer(Info.Player)

    repeat task.wait() until TradingUI.Visible

    Remote.TradeEvent:FireServer("Accepted")
end
