local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Aimbot = loadstring(game:HttpGet'https://github.com/RunDTM/Zeerox-Aimbot/raw/main/library.lua')()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/LordNahida/DendroESP/main/Source.lua"))();

local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()

local Window = ArrayField:CreateWindow({
   Name = "Kapybara´s Hub",
   LoadingTitle = GameName .. " Hub Loaded...",
   LoadingSubtitle = "by Kapybaras_",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "KapybarasHub",
      FileName = "KapyConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Kapybara´s Key System",
      Subtitle = "Enter the key.",
      Note = "Only One Way To Know It.",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Actions = {
         [1] = {
            Text = ' ',
            OnPress = function()
               print('Pressed')
            end,
         }
      },
      Key = {"KapybarasNoLie"}
   },
})

local Tab = Window:CreateTab("General", 4483362458)
local AimbotSection = Tab:CreateSection("Aimbot",false)
local AimbotToggle = Tab:CreateToggle({
   SectionParent = AimbotSection, -- Section it's parented to
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "Aimbot",
   Callback = function(Value)
      if Value then
        Aimbot.Enabled = true -- is aimbot enabled
        Aimbot.Key = Enum.UserInputType.MouseButton2 -- aimbot key

        Aimbot.Players = true -- is aimbot for default player characters enabled

        Aimbot.FOV = 200 -- aimbot fov
        Aimbot.FOVCircleColor = Color3.fromRGB(255, 255, 255) -- color of fov circle
        Aimbot.ShowFOV = true -- is fov circle visible
      else

      end
   end,
})
local AimbotSmooth = Tab:CreateSlider({
   SectionParent = AimbotSection, -- Section it's parented to
   Name = "Smooth",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "Smooth",
   CurrentValue = 0,
   Flag = "AimSmooth", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        Aimbot.Smoothing = Value -- aimbot smoothness
   end,
})
local AimbotTeam = Tab:CreateToggle({
   SectionParent = AimbotSection, -- Section it's parented to
   Name = "Teamcheck",
   CurrentValue = false,
   Flag = "AimTeamCheck",
   Callback = function(Value)
      if Value then
        Aimbot.TeamCheck = true -- is team checking enabled
      else
        Aimbot.TeamCheck = false -- is team checking enabled
      end
   end,
})
local AimbotAlive = Tab:CreateToggle({
   SectionParent = AimbotSection, -- Section it's parented to
   Name = "AliveCheck",
   CurrentValue = false,
   Flag = "AimAliveCheck",
   Callback = function(Value)
      if Value then
        Aimbot.AliveCheck = true -- is player alive
      else
        Aimbot.AliveCheck = false -- is player alive
      end
   end,
})
local AimPlayerPart = Tab:CreateDropdown({
   SectionParent = AimbotSection, -- Section it's parented to
   Name = "Player Part",
   Options = {"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg"},
   CurrentOption = "Head",
   MultiSelection = false, -- If MultiSelections is allowed
   Flag = "AimPlayerPart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
        Aimbot.PlayerPart = Option -- part of default player character to aim
   end,
})

local EspSection = Tab:CreateSection("Esp",false)

local Proxy -- Definimos Proxy aquí para que sea accesible en ambos Callbacks

local EspEnabled = Tab:CreateToggle({
   SectionParent = EspSection, -- Section it's parented to
   Name = "Enabled",
   CurrentValue = false,
   Flag = "EspEnabled",
   Callback = function(Value)
      if Value then
        for i, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character then
                Proxy = ESP:AddCharacter(player.Character, "BoundingBox"); -- Usamos EspMode aquí
            end
        end
      else
        if Proxy then
            Proxy:Destroy()
        end
      end
   end,
})

game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if EspEnabled.CurrentValue and player ~= game:GetService("Players").LocalPlayer then
            Proxy = ESP:AddCharacter(character, "BoundingBox")
            print("ESP añadido a: " .. player.Name)
        end
    end)
    player.CharacterRemoving:Connect(function(character)
        if Proxy then
            Proxy:Destroy()
            print("ESP eliminado de: " .. player.Name)
        end
    end)
end)
