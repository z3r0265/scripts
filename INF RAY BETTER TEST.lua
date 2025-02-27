local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "INF DAMAGE SCRIPT",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "The Best Dps",
   LoadingSubtitle = "by Dez and Unknown",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Dm deztherealred on dicsord ", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Dhsy$920DHis"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})



local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image'

local Button = Tab:CreateButton({
   Name = "Phase Artifical Hood",
   Callback = function()
    for i = 1, 50 do
            local args = {
                [1] = "Input",
                [2] = "ArtiphaseArtificer's Hood",
                [3] = 6,
                [4] = "Phase"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
   end,
})

local Button = Tab:CreateButton({
   Name = "Stunner Reality Dagger",
   Callback = function()
    for i = 1, 100 do
            local args = {
                [1] = "Input",
                [2] = "Reality KnifeReality Dagger",
                [3] = 8,
                [4] = "Stunner"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
   end,
})

local Button = Tab:CreateButton({
   Name = "Reality - Reality Dagger",
   Callback = function()
    for i = 1, 70 do
            local args = {
                [1] = "Input",
                [2] = "Reality KnifeReality Dagger",
                [3] = 8,
                [4] = "Reality"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
   end,
})
