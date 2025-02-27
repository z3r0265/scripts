local args = {
    [1] = "Input",
    [2] = "Lord of the Federation",
    [3] = 15,
    [4] = "Pull"
}

game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer(unpack(args))