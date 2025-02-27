local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

  

local Window = Rayfield:CreateWindow({
   Name = "ZERO's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading.",
   LoadingSubtitle = "By ZERO",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = zeroshub, -- Create a custom folder for your hub/game
      FileName = "filename2lol"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "t5mC7SseNn", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "https://discord.gg/t5mC7SseNn",
      Note = "use the link shown to get the key.", -- Use this to tell the user how to get a key
      FileName = "filenamelol", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"A3nG&v9xK72"}
   }
})

Rayfield:Notify({
   Title = "Join our discord for updates!",
   Content = "https://discord.gg/t5mC7SseNn",
   Duration = 5,
   Image = 4483362458,
})

local Tab = Window:CreateTab("General", 4483362458) -- Title, Image

game:GetService("StarterGui"):SetCore("SendNotification",{
   Title = "Join our Discord!", -- Required
   Text = "https://discord.gg/t5mC7SseNn", -- Required
   Icon = "rbxassetid://9372" -- Optional
})

local Button = Tab:CreateButton({
   Name = "rSpy",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/nuIIism/scripts/main/rspy.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dex Explorer",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
   end,
})

local othersh = Window:CreateTab("Other Script Hubs", 4483362458) -- Title, Image

local Button = othersh:CreateButton({
   Name = "Astro's Hub",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/XhRDYxJs"))()
   end,
})

local miscstuff = Window:CreateTab("Misc", 18209589170)

local Button = miscstuff:CreateButton({
   Name = "INF DAMAGE SCRIPT",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/z3r0265/scripts/refs/heads/main/INF%20RAY.lua"))()
   end,
})