local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

  

local Window = Rayfield:CreateWindow({
   Name = "Astro's Powers",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = " ",
   LoadingSubtitle = "By python, edited by gri.",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "OP FUCKGROUND"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "what", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "Key System",
      Note = "https://discord.gg/s4GSWqrsKH Join to access the key.", -- Use this to tell the user how to get a key
      FileName = "BIGLATINAS", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"WOMENLOVEME,MENTOO"}
   }
})

Rayfield:Notify({
   Title = "Join our discord for updates!",
   Content = "https://discord.gg/s4GSWqrsKH",
   Duration = 5,
   Image = 4483362458,
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
   Name = "Federation Star",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(CurrentValue)
   if CurrentValue then
        _G.loop2 = true
while _G.loop2 do
local args = {
    [1] = "Input",
    [2] = "Lord of the Federation",
    [3] = 0.2,
    [4] = "Star"
}

game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))

wait()
end
    else
        _G.loop2 = false
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Darkwood Shots",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(CurrentValue)
   if CurrentValue then
        _G.loop2 = true
while _G.loop2 do
local args = {
    [1] = "Input",
    [2] = "Darkwood Bow",
    [3] = 0.2,
    [4] = "Bow"
}

game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))

wait()
end
    else
        _G.loop2 = false
    end
   end,
})