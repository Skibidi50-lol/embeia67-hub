getgenv().rotationlock = getgenv().rotationlock or {
	enabled = true,
	lockorientation = "right"
}

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function getOrientation()
	local mode = string.lower(getgenv().rotationlock.lockorientation)

	if mode == "left" then
		return Enum.ScreenOrientation.LandscapeLeft
	else
		return Enum.ScreenOrientation.LandscapeRight
	end
end

local function applyRotation()
	local playerGui = player:WaitForChild("PlayerGui")

	if getgenv().rotationlock.enabled then
		playerGui.ScreenOrientation = getOrientation()
	else
		playerGui.ScreenOrientation = Enum.ScreenOrientation.Sensor
	end
end

if player.Character then
	applyRotation()
end

player.CharacterAdded:Connect(function()
	task.wait()
	applyRotation()
end)
