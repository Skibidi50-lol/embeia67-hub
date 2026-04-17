local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

getgenv().crosshairId = getgenv().crosshairId or 123456789
getgenv().customCrosshair = getgenv().customCrosshair ~= false

local player = Players.LocalPlayer

local function setup()
	local pGui = player:WaitForChild("PlayerGui")

	local old = pGui:FindFirstChild("CustomCrosshairGui")
	if old then
		old:Destroy()
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = "CustomCrosshairGui"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Parent = pGui

	local crosshair = Instance.new("ImageLabel")
	crosshair.Size = UDim2.new(0, 64, 0, 64)
	crosshair.AnchorPoint = Vector2.new(0.5, 0.5)
	crosshair.BackgroundTransparency = 1
	crosshair.ZIndex = 100
	crosshair.Visible = false
	crosshair.Parent = gui

	RunService:BindToRenderStep("CrosshairUpdate", Enum.RenderPriority.Last.Value + 1, function()
		if getgenv().customCrosshair then
			local pos = UserInputService:GetMouseLocation()
			crosshair.Position = UDim2.fromOffset(pos.X, pos.Y)
			crosshair.Image = "rbxassetid://" .. getgenv().crosshairId
			crosshair.Visible = true
			UserInputService.MouseIconEnabled = false
		else
			crosshair.Visible = false
			UserInputService.MouseIconEnabled = true
		end
	end)
end

if player.Character then
	setup()
end

player.CharacterAdded:Connect(function()
	task.wait()
	setup()
end)
