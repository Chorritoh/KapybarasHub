ocal GameMt = getrawmetatable(game)
local OldNameCall = GameMt.__namecall

setreadonly(GameMt, false)

GameMt.__namecall = newcclosure(function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()

    if not checkcaller() and NamecallMethod  == "Kick" then
        return nil
    end

    return OldNameCall(Self, ...)
end)

setreadonly(GameMt, true)

-- GameId
local GameId = game.PlaceId

-- GameScripts
local GameScripts = {
    [1686885941] = "https://raw.githubusercontent.com/Chorritoh/KapybarasHub/main/BrookHaven.lua",
    [14315258385] = "https://raw.githubusercontent.com/Chorritoh/KapybarasHub/main/RSS-3.lua"
    -- Add more here...
}

-- Check if the GameId is in the GameScripts table
if GameScripts[GameId] then
    -- If so, execute the corresponding loadstring
    loadstring(game:HttpGet(GameScripts[GameId]))()
else
    print("The GameId does not match any of the specified ones.")
end
