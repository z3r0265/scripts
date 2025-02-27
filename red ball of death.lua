local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local isHoldingMouse = false

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isHoldingMouse = true
        while isHoldingMouse do
            local args = {
                [1] = "Input",
                [2] = "ArmedesDuke of the Fallen Federation",
                [3] = 20,
                [4] = "Meteors"
            }

            player.Character.Combat.RemoteEvent:FireServer(unpack(args))
            wait(0.1) -- Adjust the delay as needed to prevent lag
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isHoldingMouse = false
    end
end)