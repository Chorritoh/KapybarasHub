local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()

local Window = ArrayField:CreateWindow({
   Name = "Kapybara´s Hub",
   LoadingTitle = GameName .. " Hub Loaded...",
   LoadingSubtitle = "by Kapybaras_",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "KapybarasHub", -- Create a custom folder for your hub/game
      FileName = "KapyConfig"
   },
      KeySystem = true, -- Set this to true to use our key system
      KeySettings = {
          Title = "Kapybara´s Key System",
          Subtitle = "Enter the key.",
          Note = "Only One Way To Know It.",
          FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
          SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
          GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
            Actions = {
                [1] = {
                   Text = ' ',
                   OnPress = function()
                     print('Pressed')
                   end,
          }
       },
        Key = {"KapybarasNoLie"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    },
})
