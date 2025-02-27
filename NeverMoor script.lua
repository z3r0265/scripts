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
        button.BackgroundColor3 = Color3.fromRGB(96, 130, 182)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(96, 130, 182)
    end)
end

local function createStyledButton(name, text, parent, position)
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
    button.BackgroundColor3 = Color3.fromRGB(96, 130, 182)
    createUICorner(button, 20)
    applyHoverEffect(button)
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
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 112)
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
reopenButton.BackgroundColor3 = Color3.fromRGB(96, 130, 182)
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
headerBar.BackgroundColor3 = Color3.fromRGB(96, 130, 182)
headerBar.Size = UDim2.new(1, 0, 0, 50)
headerBar.Position = UDim2.new(0, 0, 0, 0)

createUICorner(headerBar, 30)

local headerLabel = Instance.new("TextLabel")
headerLabel.Name = "HeaderLabel"
headerLabel.Parent = headerBar
headerLabel.Size = UDim2.new(0.8, 0, 1, 0)
headerLabel.Position = UDim2.new(0.1, 0, 0, 0)
headerLabel.Text = "NeverMoor tool"
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
headerLabel.TextSize = 24
headerLabel.BackgroundTransparency = 1

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = headerBar
closeButton.BackgroundColor3 = Color3.fromRGB(115, 147, 179)
closeButton.Size = UDim2.new(0.1, 0, 0.8, 0)
closeButton.Position = UDim2.new(0.9, -5, 0.1, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(0, 0, 112)
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
scrollFrame.BackgroundColor3 = Color3.fromRGB(31, 81, 255)
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 10

createUICorner(scrollFrame, 20)

-- Example Buttons to populate Scroll Frame
local exampleButtons = {
    {
        Name = "NeverMoor",
        Text = "NeverMoor E",
        Action = function()
             for i = 1, 5 do
            local args = {
                [1] = "Input",
                [2] = "NevermoorIce Skull of Nevermoor",
                [3] = 2,
                [4] = "E"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
        end
    end
    },
    {
        Name = "NeverMoor",
        Text = "NeverMoor R",
        Action = function()
            for i = 1, 20 do
            local args = {
                [1] = "Input",
                [2] = "NevermoorIce Skull of Nevermoor",
                [3] = 6,
                [4] = "R"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
         end
     end 
    },
    {
        Name = "NeverMoor",
        Text = "NeverMoor F",
        Action = function()
             for i = 1, 8 do
            local args = {
                [1] = "Input",
                [2] = "NevermoorIce Skull of Nevermoor",
                [3] = 7,
                [4] = "F"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
          end
      end 
    },
    {
        Name = "NeverMoor",
        Text = "NeverMoor LMB",
        Action = function()
            for i = 1, 10 do
            local args = {
                [1] = "Input",
                [2] = "NevermoorIce Skull of Nevermoor",
                [3] = 2,
                [4] = "LMB"
            }
            game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))
          end
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
    local button
    if type(buttonInfo) == "table" then
        button = createStyledButton(buttonInfo.Name, buttonInfo.Text, scrollFrame, UDim2.new(0, 10, 0, (i - 1) * 60))
        button.MouseButton1Click:Connect(buttonInfo.Action)
    else
        button = createStyledButton("Button" .. i, buttonInfo, scrollFrame, UDim2.new(0, 10, 0, (i - 1) * 60))
    end
end


-- Show the main GUI after a delay
wait(3)  -- Wait for 3 seconds before showing the main frame
frame.Visible = true