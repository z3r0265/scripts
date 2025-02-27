local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local function createUICorner(parent, cornerRadius)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, cornerRadius)
    UICorner.Parent = parent
    return UICorner
end

local function applyHoverEffect(button)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(129, 19, 49)
    end)
end

local function createStyledButton(name, text, parent, position, action)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = text
    button.Parent = parent
    button.Size = UDim2.new(1, -20, 0, 50)
    button.Position = position
    button.Font = Enum.Font.GothamBold
    button.TextColor3 = Color3.fromRGB(255, 251, 0)
    button.TextSize = 18
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.BackgroundTransparency = 0.2
    button.BackgroundColor3 = Color3.fromRGB(74, 4, 4)
    createUICorner(button, 20)
    applyHoverEffect(button)
    
    if action then
        button.MouseButton1Click:Connect(action)
    end
    
    return button
end

local playerGui = player:WaitForChild("PlayerGui")

-- Create Remote Scripts GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RemoteScriptsGUI"
gui.Parent = playerGui
gui.Enabled = false

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Size = UDim2.new(0, 450, 0, 600)
frame.Position = UDim2.new(0.5, -225, 0.5, -300)
frame.Visible = true
frame.Active = true
frame.Draggable = true

createUICorner(frame, 30)

-- Header Bar
local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Parent = frame
headerBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
headerBar.Size = UDim2.new(1, 0, 0, 50)
headerBar.Position = UDim2.new(0, 0, 0, 0)

createUICorner(headerBar, 30)

local headerLabel = Instance.new("TextLabel")
headerLabel.Name = "HeaderLabel"
headerLabel.Parent = headerBar
headerLabel.Size = UDim2.new(0.8, 0, 1, 0)
headerLabel.Position = UDim2.new(0.1, 0, 0, 0)
headerLabel.Text = "Duke of Federation Tool"
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextColor3 = Color3.fromRGB(255, 251, 0)
headerLabel.TextSize = 24
headerLabel.BackgroundTransparency = 1

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = headerBar
closeButton.BackgroundColor3 = Color3.fromRGB(136, 8, 8)
closeButton.Size = UDim2.new(0.1, 0, 0.8, 0)
closeButton.Position = UDim2.new(0.9, -5, 0.1, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(255, 251, 0)
closeButton.TextSize = 24
closeButton.BorderSizePixel = 0
closeButton.AutoButtonColor = false
closeButton.BackgroundTransparency = 0.2

createUICorner(closeButton, 20)
applyHoverEffect(closeButton)

closeButton.MouseButton1Click:Connect(function()
    if gui.Enabled then
        gui.Enabled = false
        frame.Visible = false
    end
end)

-- Polished Texture
local polishTexture = Instance.new("ImageLabel")
polishTexture.Parent = frame
polishTexture.Size = UDim2.new(1, 0, 1, 0)
polishTexture.Position = UDim2.new(0, 0, 0, 0)
polishTexture.BackgroundTransparency = 1
polishTexture.Image = "rbxassetid://1234567890" -- Replace with the appropriate asset ID for the texture
polishTexture.ImageTransparency = 0.1

-- Scroll Frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Parent = frame
scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 10

createUICorner(scrollFrame, 20)

-- Button Actions
local function button1Action()
    for i = 1, 5 do
        local args = {
            [1] = "Input",
            [2] = "DukeDuke of the Federation",
            [3] = 20,
            [4] = "E"
        }
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
    end
end

local function button2Action()
    for i = 1, 5 do
        local args = {
            [1] = "Input",
            [2] = "DukeDuke of the Federation",
            [3] = 28,
            [4] = "R"
        }
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
    end
end

local function button3Action()
    for i = 1, 5 do
        local args = {
            [1] = "Input",
            [2] = "DukeDuke of the Federation",
            [3] = 40,
            [4] = "F"
        }
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
    end
end

-- Create Example Buttons and Assign Actions
local exampleButtons = {
    {text = "Duke e", action = button1Action},
    {text = "Duke r", action = button2Action},
    {text = "Duke f", action = button3Action},
    {text = "Button 4", action = nil},
    {text = "Made by Python", action = nil}
}

for i, buttonInfo in ipairs(exampleButtons) do
    local button = createStyledButton("Button" .. i, buttonInfo.text, scrollFrame, UDim2.new(0, 10, 0, (i - 1) * 60), buttonInfo.action)
end

-- Show the main GUI after a delay
wait(3)  -- Wait for 3 seconds before showing the main frame
frame.Visible = true
gui.Enabled = true

-- Keybind for opening and closing the GUI
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.P and not gameProcessedEvent then
        gui.Enabled = not gui.Enabled
        frame.Visible = not frame.Visible
    end
end)
--keybind is p