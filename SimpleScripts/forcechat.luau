--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]


-- Instances

local forcechat = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local usr = Instance.new("TextBox")
local txt = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

-- Properties

forcechat.Name = "forcechat"
forcechat.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
forcechat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
forcechat.ResetOnSpawn = false

Frame.Parent = forcechat
Frame.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.312457472, 0, 0.26157406, 0)
Frame.Size = UDim2.new(0, 395, 0, 251)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.240932643, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Force Chat"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 13
TextLabel.TextWrapped = true

usr.Name = "usr"
usr.Parent = Frame
usr.BackgroundColor3 = Color3.new(1, 1, 1)
usr.BorderColor3 = Color3.new(0, 0, 0)
usr.BorderSizePixel = 0
usr.Position = UDim2.new(0.240519464, 0, 0.168673337, 0)
usr.Size = UDim2.new(0, 200, 0, 50)
usr.Font = Enum.Font.SourceSans
usr.PlaceholderText = "username"
usr.Text = ""
usr.TextColor3 = Color3.new(0, 0, 0)
usr.TextSize = 14

txt.Name = "txt"
txt.Parent = Frame
txt.BackgroundColor3 = Color3.new(1, 1, 1)
txt.BorderColor3 = Color3.new(0, 0, 0)
txt.BorderSizePixel = 0
txt.Position = UDim2.new(0.245582759, 0, 0.399749041, 0)
txt.Size = UDim2.new(0, 200, 0, 50)
txt.Font = Enum.Font.SourceSans
txt.PlaceholderText = "something"
txt.Text = ""
txt.TextColor3 = Color3.new(0, 0, 0)
txt.TextSize = 14

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.194936708, 0, 0.661354601, 0)
TextButton.Size = UDim2.new(0, 235, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Send"
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 14

TextButton.MouseButton1Click:Connect(function()
	local Txtchat = game:GetService("TextChatService")
	local plrname = usr.Text
	local target = game:GetService("Players"):FindFirstChild(plrname)
	if not target then return end

	local char = target.Character
	if not char then return end

	local head = char:FindFirstChild("Head")
	if not head then return end

	Txtchat:DisplayBubble(head, txt.Text)
end)
