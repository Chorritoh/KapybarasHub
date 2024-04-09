local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

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
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Lock WalkSpeed",
   CurrentValue = false,
   Flag = "Lock WalkSpeed",
   Callback = function(Value)
      if Value then
         game:GetService("RunService").RenderStepped:Connect(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Slider.CurrentValue
         end)
      else
         game:GetService("RunService").RenderStepped:Connect(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
         end)
      end
   end,
})
