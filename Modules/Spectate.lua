getgenv().spectate = {
    enabled = false,
    target = "",
    keybind = Enum.KeyCode.H
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function getTarget()
    local name = getgenv().spectate.target
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower() == name:lower() then
            return p
        end
    end
    return nil
end

local function updateSpectate()
    if getgenv().spectate.enabled then
        local target = getTarget()
        if target and target.Character and target.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = target.Character.Humanoid
        end
    else
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = localPlayer.Character.Humanoid
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == getgenv().spectate.keybind then
        getgenv().spectate.enabled = not getgenv().spectate.enabled
        updateSpectate()
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        updateSpectate()
    end)
end)

localPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    updateSpectate()
end)
