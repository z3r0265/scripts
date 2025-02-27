-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local PlayFrame = Instance.new("Frame")
local Play = Instance.new("TextButton")
local UIScale = Instance.new("UIScale")
local UISizeConstraint = Instance.new("UISizeConstraint")
local Song = Instance.new("TextBox")
local UISizeConstraint_2 = Instance.new("UISizeConstraint")
local UIScale_2 = Instance.new("UIScale")
local History = Instance.new("ScrollingFrame")
local Title = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

PlayFrame.Name = "PlayFrame"
PlayFrame.Parent = ScreenGui
PlayFrame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
PlayFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayFrame.BorderSizePixel = 0
PlayFrame.Position = UDim2.new(0.0984116048, 0, 0.373205751, 0)
PlayFrame.Size = UDim2.new(0.212361887, 0, 0.326555043, 0)

Play.Name = "Play"
Play.Parent = PlayFrame
Play.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Play.BorderColor3 = Color3.fromRGB(0, 0, 0)
Play.BorderSizePixel = 0
Play.Position = UDim2.new(0.107316963, 0, 0.587225258, 0)
Play.Size = UDim2.new(0.777914107, 0, 0.188613981, 0)
Play.Font = Enum.Font.SourceSans
Play.Text = "Play/Loop"
Play.TextColor3 = Color3.fromRGB(0, 0, 0)
Play.TextSize = 20.000
Play.TextWrapped = true

UIScale.Parent = Play

UISizeConstraint.Parent = Play

Song.Name = "Song"
Song.Parent = PlayFrame
Song.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Song.BorderColor3 = Color3.fromRGB(0, 0, 0)
Song.BorderSizePixel = 0
Song.Position = UDim2.new(0.107317075, 0, 0.197802201, 0)
Song.Size = UDim2.new(0.777914047, 0, 0.17213048, 0)
Song.Font = Enum.Font.SourceSans
Song.PlaceholderColor3 = Color3.fromRGB(35, 35, 35)
Song.PlaceholderText = "Enter Song ID.."
Song.Text = ""
Song.TextColor3 = Color3.fromRGB(0, 0, 0)
Song.TextSize = 20.000

UISizeConstraint_2.Parent = Song

UIScale_2.Parent = Song

History.Name = "History"
History.Parent = PlayFrame
History.Active = true
History.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
History.BorderColor3 = Color3.fromRGB(0, 0, 0)
History.BorderSizePixel = 0
History.Position = UDim2.new(1, 0, -0.155055448, 0)
History.Size = UDim2.new(0.698713183, 0, 1.1550554, 0)

Title.Name = "Title"
Title.Parent = PlayFrame
Title.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(-0.00402742717, 0, -0.155055538, 0)
Title.Size = UDim2.new(1.00402749, 0, 0.154634848, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "Song Player V1.1"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true


UIAspectRatioConstraint.Parent = ScreenGui

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui")
local playFrame = screenGui:FindFirstChild("PlayFrame")
local playButton = playFrame:FindFirstChild("Play")
local songBox = playFrame:FindFirstChild("Song")
local historyFrame = playFrame:FindFirstChild("History")

local minPitch, maxPitch = 0.5, 2
local defaultPitch = 1
local pitch = defaultPitch
local dragging = false
local sound
local history = {}

local pitchLabel = Instance.new("TextLabel")
pitchLabel.Parent = playFrame
pitchLabel.Text = "Pitch: 1.00"
pitchLabel.TextColor3 = Color3.new(1, 1, 1)
pitchLabel.Font = Enum.Font.SourceSansBold
pitchLabel.TextSize = 16
pitchLabel.BackgroundTransparency = 1
pitchLabel.Size = UDim2.new(1, 0, 0.1, 0)
pitchLabel.Position = UDim2.new(0, 0, 0.79, 0)
pitchLabel.TextStrokeTransparency = 0.5

local pitchFrame = Instance.new("Frame")
pitchFrame.Parent = playFrame
pitchFrame.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
pitchFrame.Position = UDim2.new(0.1, 0, 0.88, 0)
pitchFrame.Size = UDim2.new(0.8, 0, 0.06, 0)
pitchFrame.BorderSizePixel = 0
pitchFrame.Name = "PitchSlider"

local trackCorner = Instance.new("UICorner")
trackCorner.CornerRadius = UDim.new(0.4, 0)
trackCorner.Parent = pitchFrame

local sliderHandle = Instance.new("Frame")
sliderHandle.Parent = pitchFrame
sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderHandle.Size = UDim2.new(0.08, 0, 1.5, 0)
sliderHandle.Position = UDim2.new(0.5, 0, -0.25, 0)
sliderHandle.BorderSizePixel = 0
sliderHandle.Name = "Handle"

local handleCorner = Instance.new("UICorner")
handleCorner.CornerRadius = UDim.new(1, 0)
handleCorner.Parent = sliderHandle

local function updatePitch(value)
    pitch = math.clamp(math.round(value * 100) / 100, minPitch, maxPitch)
    if math.abs(pitch - defaultPitch) < 0.05 then
        pitch = defaultPitch
    end
    pitchLabel.Text = "Pitch: " .. string.format("%.2f", pitch)
    if sound then
        sound.PlaybackSpeed = pitch
    end
end

local function moveSlider(input)
    local pos = (input.Position.X - pitchFrame.AbsolutePosition.X) / pitchFrame.AbsoluteSize.X
    pos = math.clamp(pos, 0, 1)
    sliderHandle.Position = UDim2.new(pos, 0, -0.25, 0)
    local newPitch = minPitch + pos * (maxPitch - minPitch)
    updatePitch(newPitch)
end

sliderHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

sliderHandle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local resetPitchButton = Instance.new("TextButton")
resetPitchButton.Parent = playFrame
resetPitchButton.Text = "Reset Pitch"
resetPitchButton.TextColor3 = Color3.new(0, 0, 0)
resetPitchButton.Font = Enum.Font.SourceSansBold
resetPitchButton.TextSize = 16
resetPitchButton.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
resetPitchButton.Size = UDim2.new(0.4, 0, 0.1, 0)
resetPitchButton.Position = UDim2.new(0.3, 0, 0.95, 0)
resetPitchButton.BorderSizePixel = 0

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.2, 0)
buttonCorner.Parent = resetPitchButton

local function resetPitch()
    pitch = 1.00
    pitchLabel.Text = "Pitch: 1.00"
    sliderHandle.Position = UDim2.new(0.5, 0, -0.25, 0)
    if sound then
        sound.PlaybackSpeed = 1
    end
end

resetPitchButton.MouseButton1Click:Connect(resetPitch)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        moveSlider(input)
    end
end)

local function getSongName(songId)
    local success, result = pcall(function()
        return MarketplaceService:GetProductInfo(songId).Name
    end)
    return success and result or "Unknown Song"
end

local function playSong(songId)
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Sound") or obj.Name == "Song" then
            obj:Destroy()
        end
    end

    sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. songId
    sound.Volume = 5
    sound.PlaybackSpeed = pitch
    sound.Looped = true
    sound.Name = "Song"
    sound.Parent = workspace
    sound:Play()

    local songName = getSongName(songId)

    if not history[songId] then
        local historyButton = Instance.new("TextButton")
        historyButton.Parent = historyFrame
        historyButton.Size = UDim2.new(1, 0, 0.1, 0)
        historyButton.Text = songName
        historyButton.BackgroundColor3 = playButton.BackgroundColor3
        historyButton.TextColor3 = Color3.fromRGB(0, 0, 0)

        historyButton.MouseButton1Click:Connect(function()
            playSong(songId)
        end)

        history[songId] = true
    end
end

playButton.MouseButton1Click:Connect(function()
    local songId = songBox.Text
    if songId ~= "" then
        playSong(songId)
    end
end)

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then
        screenGui.Enabled = not screenGui.Enabled
    end
end)
