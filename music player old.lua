local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
textBox.Position = UDim2.new(0.1, 0, 0.1, 0)
textBox.PlaceholderText = "Enter Sound ID"
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.Text = ""
textBox.Parent = frame

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0.8, 0, 0.3, 0)
playButton.Position = UDim2.new(0.1, 0, 0.5, 0)
playButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
playButton.Text = "Play & Loop"
playButton.Parent = frame

local looping = false
local currentSound = nil

local function playSound()
    local soundId = textBox.Text
    if soundId == "" then return end

    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Sound") and (obj.Name == "FiredSound" or obj.Name == "Song") then
            obj:Destroy()
        end
    end

    if looping then
        looping = false
        playButton.Text = "Play & Loop"
        return
    end

    local sound = Instance.new("Sound")
    sound.Name = "FiredSound"
    sound.Parent = workspace
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Volume = 5
    sound.Looped = true
    sound:Play()

    currentSound = sound
    looping = true
    playButton.Text = "Stop"
end

playButton.MouseButton1Click:Connect(playSound)

-- Hide and show GUI with keybind
local isVisible = true
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then
        isVisible = not isVisible
        gui.Enabled = isVisible
    end
end)