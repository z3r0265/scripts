local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function createUICorner(parent, cornerRadius)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, cornerRadius)
    UICorner.Parent = parent
    return UICorner
end

local function applyHoverEffect(button)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Changed color for hover effect
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Restored original color
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
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.BackgroundTransparency = 0.2
    button.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Changed background color
    createUICorner(button, 20)
    applyHoverEffect(button)
    button.MouseButton1Click:Connect(action) -- Connect action to button click
    return button
end

local playerGui = player:WaitForChild("PlayerGui")

-- Create the Main GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "MainGUI"
mainGui.Parent = playerGui

-- Create Remote Scripts GUI
local gui = Instance.new("ScreenGui")
gui.Name = "RemoteScriptsGUI"
gui.Parent = playerGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(245, 245, 245) -- Changed background color
frame.Size = UDim2.new(0, 450, 0, 600)
frame.Position = UDim2.new(0.5, -225, 0.5, -300)
frame.Visible = false
frame.Active = true
frame.Draggable = true

createUICorner(frame, 30)

-- Reopen Button
local reopenButton = Instance.new("TextButton")
reopenButton.Name = "ReopenButton"
reopenButton.Parent = mainGui
reopenButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
reopenButton.Size = UDim2.new(0, 100, 0, 40)
reopenButton.Position = UDim2.new(0, 10, 0, 10)
reopenButton.Text = "Open"
reopenButton.Font = Enum.Font.GothamBold
reopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
reopenButton.TextSize = 14
reopenButton.BorderSizePixel = 0
reopenButton.AutoButtonColor = false
reopenButton.BackgroundTransparency = 0

createUICorner(reopenButton, 20)
applyHoverEffect(reopenButton)

local debounce = false
reopenButton.MouseButton1Click:Connect(function()
    if not debounce then
        debounce = true
        frame.Visible = true
        wait(0.5)
        debounce = false
    end
end)

-- Header Bar
local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Parent = frame
headerBar.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Changed background color
headerBar.Size = UDim2.new(1, 0, 0, 50)
headerBar.Position = UDim2.new(0, 0, 0, 0)

createUICorner(headerBar, 30)

local headerLabel = Instance.new("TextLabel")
headerLabel.Name = "HeaderLabel"
headerLabel.Parent = headerBar
headerLabel.Size = UDim2.new(0.8, 0, 1, 0)
headerLabel.Position = UDim2.new(0.1, 0, 0, 0)
headerLabel.Text = "Invictus Tool"
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Changed text color for better contrast
headerLabel.TextSize = 24
headerLabel.BackgroundTransparency = 1

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = headerBar
closeButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Changed background color
closeButton.Size = UDim2.new(0.1, 0, 0.8, 0)
closeButton.Position = UDim2.new(0.9, -5, 0.1, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Changed text color for better contrast
closeButton.TextSize = 24
closeButton.BorderSizePixel = 0
closeButton.AutoButtonColor = false
closeButton.BackgroundTransparency = 0.2

createUICorner(closeButton, 20)
applyHoverEffect(closeButton)

closeButton.MouseButton1Click:Connect(function()
    if not debounce then
        debounce = true
        frame.Visible = false
        wait(0.5)
        debounce = false
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
scrollFrame.BackgroundColor3 = Color3.fromRGB(211, 211, 211) -- Changed background color
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 10

createUICorner(scrollFrame, 20)

-- Example Buttons to populate Scroll Frame
local exampleButtons = {
    {
        Name = "block",
        Text = "Random block",
        Action = function()
            local args = {
                [1] = "Input",
                [2] = "HumanoidControls",
                [3] = 0,
                [4] = "Block"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
    },
    {
        Name = "INVICTUS",
        Text = "INVICTUS R",
        Action = function()
            local args = {
                [1] = "Input",
                [2] = "ClockworkInvictus",
                [3] = 8,
                [4] = "Satelite"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
    },
    {
        Name = "INVICTUS",
        Text = "INCITUS F",
        Action = function()
            local args = {
                [1] = "Input",
                [2] = "ClockworkInvictus",
                [3] = 25,
                [4] = "Barrage"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
    },
    {
        Name = "INVICTUS",
        Text = "INVICTUS LMB",
        Action = function()
            local args = {
                [1] = "Input",
                [2] = "ClockworkInvictus",
                [3] = 6,
                [4] = "Strike"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
    },
    {
        Name = "MadeByPython",
        Text = "Made by Python",
        Action = function()
            print("Button made by Python clicked")
        end
    }
}

for i, buttonInfo in ipairs(exampleButtons) do
    local button = createStyledButton(buttonInfo.Name, buttonInfo.Text, scrollFrame, UDim2.new(0, 10, 0, (i-1) * 60), buttonInfo.Action)
end

-- Show the main GUI after a delay
wait(3)  -- Wait for 3 seconds before showing the main frame
frame.Visible = true
