--if gethui then
--	if gethui():FindFirstChild('Synthesial') then
--		gethui().Synthesial:Destroy()
--	end
--end

if game.CoreGui:FindFirstChild('Synthesial') then
  game.CoreGui.Synthesial:Destroy()
  wait(.5)
end

local player = game.Players.LocalPlayer
local replStorage = game.ReplicatedStorage
local mouse = player:GetMouse()
local runService = game:GetService('RunService')
local tweenService = game:GetService('TweenService')
local httpService = game:GetService('HttpService')
local uis = game:GetService('UserInputService')
local coreGui = game:GetService('CoreGui')

local function interpolate(s, obj, prop, fire)
	local info = TweenInfo.new(s.t or .2, s.s or Enum.EasingStyle.Quint, s.a or Enum.EasingDirection.Out)
	local tween = tweenService:Create(obj, info, prop)
	tween.Completed:Connect(fire or function() end)
	tween:Play()
end

local function hp(obj, prop)
	local s = pcall(function()
		obj[prop] = obj[prop]
	end)
	return s
end

local function drag(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos;
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		uis.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				interpolate({t = .45}, Main, {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)})
			end
		end)
	end)
end

local SyntLibrary = {
	PromptTime = false,
	Themes = {
		Default = {}
	},
	CEnabled = false,
	CFolder = nil,
	CName = nil
}

function SyntLibrary:SpawnWindow(windowSettings)
	local Synthesial = Instance.new('ScreenGui')
	local MainFrame = Instance.new('Frame')
	local UICorner = Instance.new('UICorner')
	local Topbar = Instance.new('Frame')
	local UICorner_2 = Instance.new('UICorner')
	local Fix = Instance.new('Frame')
	local TopbarLine = Instance.new('Frame')
	local MainTitle = Instance.new('TextLabel')
	local UIPadding = Instance.new('UIPadding')
	local Controller = Instance.new('Frame')
	local UIStroke = Instance.new('UIStroke')
	local UICorner_3 = Instance.new('UICorner')
	local Divider = Instance.new('Frame')
	local Close = Instance.new('ImageLabel')
	local Mnimize = Instance.new('ImageLabel')
	local LiteralContents = Instance.new('Frame')
	local UIPageLayout = Instance.new('UIPageLayout')
	local Tabs = Instance.new('Frame')
	local UICorner_24 = Instance.new('UICorner')
	local TScrollerFrame = Instance.new('ScrollingFrame')
	local UIListLayout_5 = Instance.new('UIListLayout')
	local UIPadding_19 = Instance.new('UIPadding')

	do
		Synthesial.Name = 'Synthesial'
		Synthesial.IgnoreGuiInset = true
		Synthesial.Parent = player:WaitForChild('PlayerGui')
		Synthesial.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		MainFrame.Name = 'MainFrame'
		MainFrame.Parent = Synthesial
		MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		MainFrame.BackgroundTransparency = .1
		MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainFrame.BorderSizePixel = 0
		MainFrame.ClipsDescendants = false
		MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		MainFrame.Size = UDim2.new(0, 615, 0, 344)

		UICorner.CornerRadius = UDim.new(0, 14)
		UICorner.Parent = MainFrame

		Topbar.Name = 'Topbar'
		Topbar.Parent = MainFrame
		Topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Topbar.BorderSizePixel = 0
		Topbar.Size = UDim2.new(1, 0, 0, 56)

		UICorner_2.CornerRadius = UDim.new(0, 14)
		UICorner_2.Parent = Topbar

		Fix.Name = 'Fix'
		Fix.Parent = Topbar
		Fix.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Fix.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Fix.BorderSizePixel = 0
		Fix.Position = UDim2.new(0, 0, 0.625, 0)
		Fix.Size = UDim2.new(1, 0, 0, 21)

		TopbarLine.Name = 'TopbarLine'
		TopbarLine.Parent = Topbar
		TopbarLine.BackgroundColor3 = Color3.fromRGB(107, 107, 107)
		TopbarLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TopbarLine.BorderSizePixel = 0
		TopbarLine.Position = UDim2.new(0, 0, 0.982142866, 0)
		TopbarLine.Size = UDim2.new(1, 0, 0, 1)

		MainTitle.Name = 'MainTitle'
		MainTitle.Parent = Topbar
		MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainTitle.BackgroundTransparency = 1.000
		MainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainTitle.BorderSizePixel = 0
		MainTitle.Size = UDim2.new(0, 449, 0, 55)
		MainTitle.Font = Enum.Font.GothamBold
		MainTitle.Text = windowSettings.UITitle or 'Synthesial'
		MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		MainTitle.TextSize = 20.000
		MainTitle.TextWrapped = true
		MainTitle.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding.Parent = MainTitle
		UIPadding.PaddingLeft = UDim.new(0, 20)

		Controller.Name = 'Controller'
		Controller.Parent = Topbar
		Controller.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		Controller.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Controller.BorderSizePixel = 0
		Controller.Position = UDim2.new(0.793, 0, 0.161, 0)
		Controller.Size = UDim2.new(0, 100, 0, 38)

		UIStroke.Parent = Controller
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Color = Color3.fromRGB(108, 108, 108)

		UICorner_3.Parent = Controller

		Divider.Name = 'Divider'
		Divider.Parent = Controller
		Divider.BackgroundColor3 = Color3.fromRGB(108, 108, 108)
		Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Divider.BorderSizePixel = 0
		Divider.Position = UDim2.new(0.5, 0, 0, 0)
		Divider.Size = UDim2.new(0, 1, 1, 0)

		Close.Name = 'Close'
		Close.Parent = Controller
		Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close.BackgroundTransparency = 1.000
		Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close.BorderSizePixel = 0
		Close.Position = UDim2.new(0.591000021, 0, -0.0250000004, 0)
		Close.Size = UDim2.new(0, 34, 0, 38)
		Close.Image = 'rbxassetid://14210462279'

		Mnimize.Name = 'Mnimize'
		Mnimize.Parent = Controller
		Mnimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Mnimize.BackgroundTransparency = 1.000
		Mnimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Mnimize.BorderSizePixel = 0
		Mnimize.Position = UDim2.new(0.0810000002, 0, -0.0250000004, 0)
		Mnimize.Size = UDim2.new(0, 30, 0, 38)
		Mnimize.Image = 'rbxassetid://14101176654'

		LiteralContents.Name = 'LiteralContents'
		LiteralContents.Parent = MainFrame
		LiteralContents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LiteralContents.BackgroundTransparency = 1.000
		LiteralContents.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LiteralContents.ClipsDescendants = true
		LiteralContents.BorderSizePixel = 0
		LiteralContents.Position = UDim2.new(0, 0, 0, 58)
		LiteralContents.Size = UDim2.new(1, 0, 0.833999991, -1)

		UIPageLayout.Parent = LiteralContents
		UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
		UIPageLayout.TweenTime = 0.800

		Tabs.Name = 'Tabs'
		Tabs.Parent = MainFrame
		Tabs.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tabs.BorderSizePixel = 0
		Tabs.BackgroundTransparency = .5
		Tabs.Position = UDim2.new(0.5, -80, 0.5, 78)
		Tabs.Size = UDim2.new(0, 157, 0, 100)
		Tabs.ZIndex = 0

		UICorner_24.Parent = Tabs

		TScrollerFrame.Name = 'TScrollerFrame'
		TScrollerFrame.Parent = Tabs
		TScrollerFrame.Active = true
		TScrollerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TScrollerFrame.BackgroundTransparency = 1.000
		TScrollerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TScrollerFrame.BorderSizePixel = 0
		TScrollerFrame.ScrollBarImageTransparency = .56
		TScrollerFrame.Size = UDim2.new(1, 0, 1, 0)
		TScrollerFrame.ZIndex = 0
		TScrollerFrame.ScrollBarThickness = 2

		UIListLayout_5.Parent = TScrollerFrame
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 10)

		UIPadding_19.Parent = TScrollerFrame
		UIPadding_19.PaddingTop = UDim.new(0, 10)
	end

	drag(Topbar, MainFrame)

	do
		do
			local hover, state;
			Close.MouseEnter:Connect(function()
				if SyntLibrary.PromptTime then return end
				hover = true
			end)

			Close.MouseLeave:Connect(function()
				hover = false
			end)

			uis.InputBegan:Connect(function(input)
				local keycode = windowSettings.ToggleKeybind or Enum.KeyCode.Insert
				if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
					if not state then
						state = true
						Synthesial.Enabled = false
					end
				elseif input.KeyCode == keycode and state then
					state = false
					Synthesial.Enabled = true
				end
			end)
		end

		do
			local hover, state;
			Mnimize.MouseEnter:Connect(function()
				if SyntLibrary.PromptTime then return end
				hover = true
			end)

			Mnimize.MouseLeave:Connect(function()
				hover = false
			end)

			uis.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
					if not state then
						state = true
						interpolate({t = .85}, MainFrame, {Size = UDim2.new(0, 615, 0, 57)}, function()
							MainFrame.ClipsDescendants = true
						end)
						interpolate({}, Tabs, {BackgroundTransparency = 1})
						for _, v in pairs(Tabs:GetDescendants()) do
							if hp(v, 'BackgroundTransparency') and v:IsA('Frame') then
								interpolate({t = .3}, v, {BackgroundTransparency = 1})
							end
							if hp(v, 'TextTransparecy') and v:IsA('TextLabel') then
								interpolate({t = .3}, v, {TextTransparency = 1})
							end
						end
						for _, v in pairs(Tabs:GetDescendants()) do
							if hp(v, 'ScrollBarImageTransparency') and v:IsA('ScrollingFrame') then
								interpolate({t = .3}, v, {ScrollBarImageTransparency = 1})
							end
							if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
								interpolate({t = .3}, v, {TextTransparency = 1})
							end
							if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
								interpolate({t = .3}, v, {ImageTransparency = 1})
							end
						end
					else
						state = false
						MainFrame.ClipsDescendants = false
						interpolate({t = .85}, MainFrame, {Size = UDim2.new(0, 615, 0, 344)})
						interpolate({}, Tabs, {BackgroundTransparency = .7})
						for _, v in pairs(Tabs:GetDescendants()) do
							if hp(v, 'BackgroundTransparency') and v:IsA('Frame') then
								interpolate({t = .3}, v, {BackgroundTransparency = 0})
							end
							if hp(v, 'TextTransparecy') and v:IsA('TextLabel') then
								interpolate({t = .3}, v, {TextTransparency = 0})
							end
						end
						for _, v in pairs(Tabs:GetDescendants()) do
							if hp(v, 'ScrollBarImageTransparency') and v:IsA('ScrollingFrame') then
								interpolate({t = .3}, v, {ScrollBarImageTransparency = 0})
							end
							if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
								interpolate({t = .3}, v, {TextTransparency = 0})
							end
							if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
								interpolate({t = .3}, v, {ImageTransparency = 0})
							end
						end
					end
				end
			end)
		end

		do
			Tabs.MouseEnter:Connect(function()
				if SyntLibrary.PromptTime then return end
				interpolate({t = .45}, Tabs, {Position = UDim2.new(0.5, -80, 0.5, 162)})
				for _, v in pairs(Tabs:GetDescendants()) do
					if hp(v, 'ScrollBarImageTransparency') then
						interpolate({t = .45}, v, {ScrollBarImageTransparency = 0})
					end
					if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
						interpolate({t = .45}, v, {TextTransparency = 0})
					end
					if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
						interpolate({t = .45}, v, {ImageTransparency = 0})
					end
				end
			end)

			Tabs.MouseLeave:Connect(function()
				interpolate({t = .45}, Tabs, {Position = UDim2.new(0.5, -80, 0.5, 78)})
				for _, v in pairs(Tabs:GetDescendants()) do
					if hp(v, 'ScrollBarImageTransparency') then
						interpolate({t = .45}, v, {ScrollBarImageTransparency = .56})
					end
					if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
						interpolate({t = .45}, v, {TextTransparency = .56})
					end
					if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
						interpolate({t = .45}, v, {ImageTransparency = .56})
					end
				end
			end)
		end
	end

	--if syn then
	--	syn.protect_gui(Synthesial)
	--elseif gethui then
	--	Synthesial.Parent = gethui()
	--end

	local tabHandler = {
		Counter1 = 0
	}

	function tabHandler:PlaceTab(name, icon)
		if not name then tabHandler.Counter1 += 1 end

		local Tab = Instance.new('TextLabel')
		local UIPadding_18 = Instance.new('UIPadding')
		local TabIcon = Instance.new('ImageLabel')
		local Elements = Instance.new('ScrollingFrame')

		do
			Tab.Name = name or 'Tab ' .. tabHandler.Counter1
			Tab.Parent = TScrollerFrame
			Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Tab.BackgroundTransparency = 1.000
			Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Tab.BorderSizePixel = 0
			Tab.Size = UDim2.new(0, 157, 0, 25)
			Tab.ZIndex = 0
			Tab.Font = Enum.Font.Gotham
			Tab.Text = name or 'Tab' .. tabHandler.Counter1
			Tab.TextTransparency = .56
			Tab.TextColor3 = Color3.fromRGB(190, 190, 190)
			Tab.TextSize = 14.000
			Tab.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_18.Parent = Tab
			UIPadding_18.PaddingLeft = UDim.new(0, 35)

			TabIcon.Name = 'TabIcon'
			TabIcon.Parent = Tab
			TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabIcon.BackgroundTransparency = 1.000
			TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabIcon.BorderSizePixel = 0
			TabIcon.Position = UDim2.new(-0.222408608, 0, 0, 0)
			TabIcon.Size = UDim2.new(0, 20, 0, 20)
			TabIcon.ImageTransparency = .56
			TabIcon.Image = icon or 'rbxassetid://14101176654'

			Elements.Name = name or 'Tab '.. tabHandler.Counter
			Elements.Parent = LiteralContents
			Elements.Active = true
			Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Elements.BackgroundTransparency = 1.000
			Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Elements.BorderSizePixel = 0
			Elements.Size = UDim2.new(1, 0, 1, 0)
			Elements.ScrollBarThickness = 0
			Elements.ScrollingEnabled = false
		end

		do
			local hover;
			Tab.MouseEnter:Connect(function()
				hover = true
			end)

			Tab.MouseLeave:Connect(function()
				hover = false
			end)

			uis.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
					UIPageLayout:JumpTo(Elements)
					interpolate({t = .45}, Tabs, {Position = UDim2.new(0.5, -80, 0.5, 78)})
					for _, v in pairs(Tabs:GetDescendants()) do
						if hp(v, 'ScrollBarImageTransparency') then
							interpolate({t = .45}, v, {ScrollBarImageTransparency = .56})
						end
						if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
							interpolate({t = .45}, v, {TextTransparency = .56})
						end
						if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
							interpolate({t = .45}, v, {ImageTransparency = .56})
						end
					end
				end
			end)
		end

		local subSection = {}
		local count = 0

		function SyntLibrary:Confirm(confirmationSets)
			--[[
				Window:Confirm({
					Title = 'Confirmation',
					Content = 'Is this what you fucking want?',
					Buttons = {
						Yessir = {
							Name = 'Yes',
							Action = function()
								print('do smth')
							end
						}
					}
				})
			]]

			local Confirmation = Instance.new("Frame")
			local ConfirmShadow = Instance.new("Frame")
			local ConfirmShadowImage = Instance.new("ImageLabel")
			local UICorner_27 = Instance.new("UICorner")
			local ConfimationTitle = Instance.new("TextLabel")
			local Explanation = Instance.new("TextLabel")
			local Buttons = Instance.new("ScrollingFrame")
			local UIListLayout_6 = Instance.new("UIListLayout")

			SyntLibrary.PromptTime = true

			do
				Confirmation.Name = "Confirmation"
				Confirmation.Parent = MainFrame
				Confirmation.AnchorPoint = Vector2.new(0.5, 0.5)
				Confirmation.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
				Confirmation.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Confirmation.BorderSizePixel = 0
				Confirmation.ZIndex = 2
				Confirmation.Position = UDim2.new(0.5, 0, 0.5, 0)
				Confirmation.Size = UDim2.new(0, 337, 0, 222)

				ConfirmShadow.Name = "ConfirmShadow"
				ConfirmShadow.Parent = Confirmation
				ConfirmShadow.BackgroundTransparency = 1.000
				ConfirmShadow.BorderSizePixel = 0
				ConfirmShadow.ZIndex = 2
				ConfirmShadow.Size = UDim2.new(1, 0, 1, 0)
				ConfirmShadow.ZIndex = 0

				ConfirmShadowImage.Name = "ConfirmShadowImage"
				ConfirmShadowImage.Parent = ConfirmShadow
				ConfirmShadowImage.AnchorPoint = Vector2.new(0.5, 0.5)
				ConfirmShadowImage.BackgroundTransparency = 1.000
				ConfirmShadowImage.BorderSizePixel = 0
				ConfirmShadowImage.Position = UDim2.new(0.5, 0, 0.5, 0)
				ConfirmShadowImage.Size = UDim2.new(1, 47, 1, 47)
				ConfirmShadowImage.ZIndex = 2
				ConfirmShadowImage.Image = "rbxassetid://6014261993"
				ConfirmShadowImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
				ConfirmShadowImage.ImageTransparency = 0.500
				ConfirmShadowImage.ScaleType = Enum.ScaleType.Slice
				ConfirmShadowImage.SliceCenter = Rect.new(49, 49, 450, 450)

				UICorner_27.CornerRadius = UDim.new(0, 12)
				UICorner_27.Parent = ConfirmShadowImage

				ConfimationTitle.Name = "ConfimationTitle"
				ConfimationTitle.Parent = Confirmation
				ConfimationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConfimationTitle.BackgroundTransparency = 1.000
				ConfimationTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ConfimationTitle.BorderSizePixel = 0
				ConfimationTitle.Position = UDim2.new(0, 68, 0, 14)
				ConfimationTitle.Size = UDim2.new(0, 200, 0, 25)
				ConfimationTitle.Font = Enum.Font.Gotham
				ConfimationTitle.ZIndex = 2
				ConfimationTitle.Text = confirmationSets.Title or "Confirmation Title"
				ConfimationTitle.TextColor3 = Color3.fromRGB(193, 193, 193)
				ConfimationTitle.TextSize = 20.000

				Explanation.Name = "Explanation"
				Explanation.Parent = Confirmation
				Explanation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Explanation.BackgroundTransparency = 1.000
				Explanation.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Explanation.BorderSizePixel = 0
				Explanation.Position = UDim2.new(0, 13, 0, 48)
				Explanation.Size = UDim2.new(0, 317, 0, 125)
				Explanation.Font = Enum.Font.Gotham
				Explanation.ZIndex = 2
				Explanation.Text = confirmationSets.Content or "This might be the dangerous kid, do you continue?"
				Explanation.TextColor3 = Color3.fromRGB(193, 193, 193)
				Explanation.TextSize = 14.000
				Explanation.TextWrapped = true

				Buttons.Name = "Buttons"
				Buttons.Parent = Confirmation
				Buttons.Active = true
				Buttons.AnchorPoint = Vector2.new(0.5, 0.5)
				Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Buttons.BackgroundTransparency = 1.000
				Buttons.BorderSizePixel = 0
				Buttons.ZIndex = 2
				Buttons.Position = UDim2.new(0, 169, 0, 193)
				Buttons.Size = UDim2.new(0, 245, 0, 30)
				Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
				Buttons.ScrollBarThickness = 0

				UIListLayout_6.Parent = Buttons
				UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout_6.Padding = UDim.new(0, 6)
			end

			for _, v in pairs(Confirmation:GetDescendants()) do
				Confirmation.BackgroundTransparency = 1
				if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
					v.TextTransparency = 1
				end
				if hp(v, 'BackgroundTransparency') and v:IsA('Frame') then
					v.BackgroundTransparency = 1
				end
				if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
					v.ImageTransparency = 1
				end
			end

			for _, v in pairs(Confirmation:GetDescendants()) do
				interpolate({s = Enum.EasingStyle.Quad}, Confirmation, {BackgroundTransparency = 0})
				if hp(v, 'BackgroundTransparency') and v:IsA('Frame') and v.Name ~= 'ConfirmShadow' then
					interpolate({s = Enum.EasingStyle.Quad}, v, {BackgroundTransparency = 0})
				end
				if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
					interpolate({s = Enum.EasingStyle.Quad}, v, {ImageTransparency = .5})
				end
				if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
					interpolate({s = Enum.EasingStyle.Quad}, v, {TextTransparency = 0})
				end
			end

			local function close()
				for _, v in pairs(Confirmation:GetDescendants()) do
					interpolate({s = Enum.EasingStyle.Quad}, Confirmation, {BackgroundTransparency = 1})
					if hp(v, 'BackgroundTransparency') and v:IsA('Frame') and v.Name ~= 'ConfirmShadow' then
						interpolate({s = Enum.EasingStyle.Quad}, v, {BackgroundTransparency = 1})
					end
					if hp(v, 'ImageTransparency') and v:IsA('ImageLabel') then
						interpolate({s = Enum.EasingStyle.Quad}, v, {ImageTransparency = 1})
					end
					if hp(v, 'TextTransparency') and v:IsA('TextLabel') then
						interpolate({s = Enum.EasingStyle.Quad}, v, {TextTransparency = 1}, function()
							task.wait(.2)
							SyntLibrary.PromptTime = false
							Confirmation:Destroy()
						end)
					end
				end
			end

			if confirmationSets.Buttons then
				for _, v in pairs(confirmationSets.Buttons) do
					local ConfirmationButtonTemplate = Instance.new("Frame")
					local UICorner_28 = Instance.new("UICorner")
					local ConfirmButtonTitle = Instance.new("TextLabel")
					local UIGradient = Instance.new("UIGradient")

					ConfirmationButtonTemplate.Name = "ConfirmationButtonTemplate"
					ConfirmationButtonTemplate.Parent = Buttons
					ConfirmationButtonTemplate.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
					ConfirmationButtonTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ConfirmationButtonTemplate.BorderSizePixel = 0
					ConfirmationButtonTemplate.ZIndex = 2
					ConfirmationButtonTemplate.Position = UDim2.new(0, 0, 0.366666675, 0)
					ConfirmationButtonTemplate.Size = UDim2.new(0, 100, 0, 25)

					UICorner_28.CornerRadius = UDim.new(0, 20)
					UICorner_28.Parent = ConfirmationButtonTemplate

					ConfirmButtonTitle.Name = "ConfirmButtonTitle"
					ConfirmButtonTitle.Parent = ConfirmationButtonTemplate
					ConfirmButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ConfirmButtonTitle.BackgroundTransparency = 1.000
					ConfirmButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ConfirmButtonTitle.BorderSizePixel = 0
					ConfirmButtonTitle.ZIndex = 2
					ConfirmButtonTitle.Size = UDim2.new(1, 0, 1, 0)
					ConfirmButtonTitle.Font = Enum.Font.Gotham
					ConfirmButtonTitle.Text = v['Name'] or "Btn Title"
					ConfirmButtonTitle.TextColor3 = Color3.fromRGB(204, 204, 204)
					ConfirmButtonTitle.TextSize = 11.000

					UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.48, 0.47), NumberSequenceKeypoint.new(1.00, 0.91)}
					UIGradient.Parent = ConfirmationButtonTemplate

					do
						local hover;
						ConfirmationButtonTemplate.MouseEnter:Connect(function()
							hover = true
						end)

						ConfirmationButtonTemplate.MouseLeave:Connect(function()
							hover = false
						end)

						uis.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
								local s, err = pcall(v.Action)
								if not s then print('Synthesial | Error within action: '.. err) end
								wait(1)
								close()
							end
						end)
					end
				end
			else
				wait(confirmationSets.Duration)
				close()
			end
		end

		function subSection:SubSection(title, icon, side)
			for _, v in pairs(Elements:GetChildren()) do
				if v:IsA('Frame') then
					count += 1
					if count == 2 then
						print('Synthesial | Max section has been created. Consider placing it to another tab.')
					end
				end
			end
			if count == 2 then return end

			local SectionLeft = Instance.new('Frame')
			local UICorner_4 = Instance.new('UICorner')
			local ActualElement = Instance.new('ScrollingFrame')
			local UIPadding_2 = Instance.new('UIPadding')
			local SLName = Instance.new('TextLabel')
			local UIPadding_8 = Instance.new('UIPadding')
			local UIPadding_9 = Instance.new('UIPadding')
			local SLIcon = Instance.new('ImageLabel')
			local UIListLayout_2 = Instance.new('UIListLayout')

			do
				SectionLeft.Name = 'Section'
				SectionLeft.Parent = Elements
				SectionLeft.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
				SectionLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionLeft.BorderSizePixel = 0
				SectionLeft.Position = UDim2.new(0, 19, 0, 7)
				SectionLeft.Size = UDim2.new(0, 278, 0, 268)

				UICorner_4.Parent = SectionLeft

				ActualElement.Name = 'ActualElement'
				ActualElement.Parent = SectionLeft
				ActualElement.Active = true
				ActualElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ActualElement.BackgroundTransparency = 1.000
				ActualElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ActualElement.BorderSizePixel = 0
				ActualElement.Size = UDim2.new(1, 0, 1, 0)
				ActualElement.ScrollBarThickness = 2

				UIPadding_2.Parent = ActualElement
				UIPadding_2.PaddingTop = UDim.new(0, 10)

				UIListLayout_2.Parent = ActualElement
				UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.Padding = UDim.new(0, 8)

				SLName.Name = 'SLName'
				SLName.Parent = SectionLeft
				SLName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SLName.BackgroundTransparency = 1.000
				SLName.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SLName.BorderSizePixel = 0
				SLName.Position = UDim2.new(0, 0, 0, -25)
				SLName.Size = UDim2.new(0, 278, 0, 35)
				SLName.Font = Enum.Font.GothamBold
				SLName.Text = title or 'Section'
				SLName.TextColor3 = Color3.fromRGB(255, 255, 255)
				SLName.TextSize = 14.000
				SLName.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_8.Parent = SLName
				UIPadding_8.PaddingLeft = UDim.new(0, 40)

				UIPadding_9.Parent = SectionLeft
				UIPadding_9.PaddingTop = UDim.new(0, 25)

				SLIcon.Name = 'SLIcon'
				SLIcon.Parent = SectionLeft
				SLIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SLIcon.BackgroundTransparency = 1.000
				SLIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SLIcon.BorderSizePixel = 0
				SLIcon.Position = UDim2.new(0, 12, 0, -20)
				SLIcon.Size = UDim2.new(0, 25, 0, 25)
				SLIcon.Image = icon or 'rbxassetid://13738982097'
			end

			if side == 'Right' then
				SectionLeft.Position = UDim2.new(0, 320, 0, 7)
			elseif side == 'Left' then
				SectionLeft.Position = UDim2.new(0, 19, 0, 7)
			end

			local elements = {}

			function elements:MakeButton(btnSets)
				local Button = Instance.new('Frame')
				local UIStroke_2 = Instance.new('UIStroke')
				local UICorner_5 = Instance.new('UICorner')
				local ButtonTitle = Instance.new('TextLabel')
				local UIPadding_3 = Instance.new('UIPadding')
				local Fingerprint = Instance.new('ImageLabel')

				do
					Button.Name = 'Button'
					Button.Parent = ActualElement
					Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button.BorderSizePixel = 0
					Button.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Button.Size = UDim2.new(1, -20, 0, 34)

					UIStroke_2.Parent = Button
					UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_2.Color = Color3.fromRGB(91, 91, 91)

					UICorner_5.Parent = Button

					ButtonTitle.Name = 'ButtonTitle'
					ButtonTitle.Parent = Button
					ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonTitle.BackgroundTransparency = 1.000
					ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ButtonTitle.BorderSizePixel = 0
					ButtonTitle.Size = UDim2.new(0, 200, 0, 34)
					ButtonTitle.Font = Enum.Font.SourceSans
					ButtonTitle.Text = btnSets.Title or 'Button Title'
					ButtonTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					ButtonTitle.TextSize = 17.000
					ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_3.Parent = ButtonTitle
					UIPadding_3.PaddingLeft = UDim.new(0, 10)

					Fingerprint.Name = 'Fingerprint'
					Fingerprint.Parent = Button
					Fingerprint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Fingerprint.BackgroundTransparency = 1.000
					Fingerprint.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Fingerprint.BorderSizePixel = 0
					Fingerprint.Position = UDim2.new(0, 220, 0, 4)
					Fingerprint.Size = UDim2.new(0, 25, 0, 25)
					Fingerprint.Image = 'rbxassetid://3944703587'
					Fingerprint.ImageColor3 = Color3.fromRGB(172, 172, 172)
				end

				function btnSets:SetTitle(newTitle)
					btnSets.Title = newTitle
					ButtonTitle.Text = newTitle
				end

				function btnSets:SetCallback(newFire)
					btnSets.Callback = newFire
				end

				do
					local hover, down;
					Button.MouseEnter:Connect(function()
						if SyntLibrary.PromptTime then return end
						hover = true
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_2, {Color = Color3.fromRGB(117, 117, 117)})
					end)

					Button.MouseLeave:Connect(function()
						hover = false
						if not down then
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_2, {Color = Color3.fromRGB(91, 91, 91)})
						end
					end)

					uis.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
							down = true
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_2, {Color = Color3.fromRGB(177, 177, 177)})
							interpolate({s = Enum.EasingStyle.Quad}, Button, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

							local s, err = pcall(btnSets.Callback)
							if not s then print('Synthesial | '.. btnSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
						end
					end)

					uis.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							down = false
							if hover then
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_2, {Color = Color3.fromRGB(117, 117, 117)})
								interpolate({s = Enum.EasingStyle.Quad}, Button, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							else
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_2, {Color = Color3.fromRGB(91, 91, 91)})
								interpolate({s = Enum.EasingStyle.Quad}, Button, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							end
						end
					end)
				end

				return btnSets
			end

			function elements:MakeSlider(slideSets)
				local Slider = Instance.new('Frame')
				local UIStroke_3 = Instance.new('UIStroke')
				local UICorner_6 = Instance.new('UICorner')
				local SliderTitle = Instance.new('TextLabel')
				local UIPadding_4 = Instance.new('UIPadding')
				local Value = Instance.new('TextLabel')
				local ProgressFrame = Instance.new('Frame')
				local UIStroke_4 = Instance.new('UIStroke')
				local Progress = Instance.new('Frame')
				local UICorner_7 = Instance.new('UICorner')
				local UICorner_8 = Instance.new('UICorner')

				do
					Slider.Name = 'Slider'
					Slider.Parent = ActualElement
					Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Slider.BorderSizePixel = 0
					Slider.Position = UDim2.new(0.0431654677, 0, 0.180257514, 0)
					Slider.Size = UDim2.new(1, -20, 0, 55)

					UIStroke_3.Parent = Slider
					UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_3.Color = Color3.fromRGB(91, 91, 91)

					UICorner_6.Parent = Slider

					SliderTitle.Name = 'SliderTitle'
					SliderTitle.Parent = Slider
					SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderTitle.BackgroundTransparency = 1.000
					SliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderTitle.BorderSizePixel = 0
					SliderTitle.Size = UDim2.new(0, 200, 0, 34)
					SliderTitle.Font = Enum.Font.SourceSans
					SliderTitle.Text = slideSets.Title or 'Slider Title'
					SliderTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					SliderTitle.TextSize = 17.000
					SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_4.Parent = SliderTitle
					UIPadding_4.PaddingLeft = UDim.new(0, 10)

					Value.Name = 'Value'
					Value.Parent = Slider
					Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Value.BackgroundTransparency = 1.000
					Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Value.BorderSizePixel = 0
					Value.Position = UDim2.new(0, 206, 0, 4)
					Value.Size = UDim2.new(0, 41, 0, 26)
					Value.Text = slideSets.CurrentValue
					Value.TextColor3 = Color3.fromRGB(172, 172, 172)
					Value.TextWrapped = true
					Value.TextXAlignment = Enum.TextXAlignment.Right

					ProgressFrame.Name = 'ProgressFrame'
					ProgressFrame.Parent = Slider
					ProgressFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
					ProgressFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ProgressFrame.BorderSizePixel = 0
					ProgressFrame.Position = UDim2.new(0, 11, 0, 34)
					ProgressFrame.Size = UDim2.new(0, 236, 0, 14)

					UIStroke_4.Parent = ProgressFrame
					UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_4.Color = Color3.fromRGB(100, 100, 100)

					Progress.Name = 'Progress'
					Progress.Parent = ProgressFrame
					Progress.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
					Progress.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Progress.BorderSizePixel = 0
					Progress.Size = UDim2.new(0.364406794, 0, 1, 0)

					UICorner_7.CornerRadius = UDim.new(0, 10)
					UICorner_7.Parent = Progress

					UICorner_8.CornerRadius = UDim.new(0, 10)
					UICorner_8.Parent = ProgressFrame
				end

				function slideSets:SetValue(newVal)
					if typeof(newVal) == 'number' and not (newVal < slideSets.Range[1]) and not (newVal > slideSets.Range[2]) then
						newVal = newVal
					elseif typeof(newVal) ~= 'number' and not (newVal < slideSets.Range[1]) and not (newVal > slideSets.Range[2]) then
						if typeof(newVal) == 'string' then
							print('Synthesial | The argument given is string, so we translated it.')
						else
							print('Synthesial | Error giving argument: Type is not correct!')
							return
						end
					end
					Value.Text = newVal
					interpolate({Time = .5, DIrection = Enum.EasingDirection.In}, Progress, {Size = UDim2.fromScale((newVal - slideSets.Range[1]) / (slideSets.Range[2] - slideSets.Range[1]), 1)})

					local s, err = pcall(function()
						slideSets.Callback(slideSets:RetrieveValue())
					end)	

					if not s then print('Synthesial | '.. slideSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
				end

				function slideSets:RetrieveValue()
					return tonumber(Value.Text)
				end

				do
					local hover, down, connection;
					Slider.MouseEnter:Connect(function()
						if SyntLibrary.PromptTime then return end
						hover = true
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_3, {Color = Color3.fromRGB(117, 117, 117)})
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_4, {Color = Color3.fromRGB(126, 126, 126)})
					end)

					Slider.MouseLeave:Connect(function()
						hover = false
						if not down then
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_3, {Color = Color3.fromRGB(91, 91, 91)})
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_4, {Color = Color3.fromRGB(100, 100, 100)})
						end
					end)

					uis.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
							down = true
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_3, {Color = Color3.fromRGB(177, 177, 177)})
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_4, {Color = Color3.fromRGB(203, 203, 203)})
							interpolate({s = Enum.EasingStyle.Quad}, Slider, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
							interpolate({s = Enum.EasingStyle.Quad}, Progress, {BackgroundColor3 = Color3.fromRGB(131, 131, 131)})

							if not connection then
								connection = runService.RenderStepped:Connect(function()
									local p = math.clamp((mouse.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
									local value = math.floor((slideSets.Range[2] - slideSets.Range[1]) * p + slideSets.Range[1])
									Value.Text = tostring(value)
									Progress.Size = UDim2.fromScale(p, 1)

									local s, err = pcall(function()
										slideSets.Callback(slideSets:RetrieveValue())
									end)	

									if not s then print('Synthesial | '.. slideSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
								end)
							end
						end
					end)

					uis.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							down = false
							if hover then
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_3, {Color = Color3.fromRGB(117, 117, 117)})
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_4, {Color = Color3.fromRGB(126, 126, 126)})
								interpolate({s = Enum.EasingStyle.Quad}, Slider, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
								interpolate({s = Enum.EasingStyle.Quad}, Progress, {BackgroundColor3 = Color3.fromRGB(103, 103, 103)})
							else
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_3, {Color = Color3.fromRGB(91, 91, 91)})
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_4, {Color = Color3.fromRGB(100, 100, 100)})
								interpolate({s = Enum.EasingStyle.Quad}, Slider, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
								interpolate({s = Enum.EasingStyle.Quad}, Progress, {BackgroundColor3 = Color3.fromRGB(103, 103, 103)})
							end

							if connection then connection:Disconnect() end
							connection = nil
						end
					end)
				end

				return slideSets
			end

			function elements:MakeToggle(switchSets)
				local Toggle = Instance.new('Frame')
				local UIStroke_5 = Instance.new('UIStroke')
				local UICorner_9 = Instance.new('UICorner')
				local ToggleTitle = Instance.new('TextLabel')
				local UIPadding_5 = Instance.new('UIPadding')
				local Switch = Instance.new('Frame')
				local UICorner_10 = Instance.new('UICorner')
				local Mark = Instance.new('ImageLabel')

				local stateCurrent = switchSets.CurrentState

				do
					Toggle.Name = 'Toggle'
					Toggle.Parent = ActualElement
					Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Toggle.BorderSizePixel = 0
					Toggle.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Toggle.Size = UDim2.new(1, -20, 0, 34)

					UIStroke_5.Parent = Toggle
					UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_5.Color = Color3.fromRGB(91, 91, 91)

					UICorner_9.Parent = Toggle

					ToggleTitle.Name = 'ToggleTitle'
					ToggleTitle.Parent = Toggle
					ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleTitle.BackgroundTransparency = 1.000
					ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ToggleTitle.BorderSizePixel = 0
					ToggleTitle.Size = UDim2.new(0, 200, 0, 34)
					ToggleTitle.Font = Enum.Font.SourceSans
					ToggleTitle.Text = switchSets.Title or 'Toggle'
					ToggleTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					ToggleTitle.TextSize = 17.000
					ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_5.Parent = ToggleTitle
					UIPadding_5.PaddingLeft = UDim.new(0, 10)

					Switch.Name = 'Switch'
					Switch.Parent = Toggle
					Switch.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
					Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Switch.BorderSizePixel = 0
					Switch.Position = UDim2.new(0, 220, 0, 4)
					Switch.Size = UDim2.new(0, 25, 0, 25)

					UICorner_10.CornerRadius = UDim.new(0, 5)
					UICorner_10.Parent = Switch

					Mark.Name = 'Mark'
					Mark.Parent = Switch
					Mark.AnchorPoint = Vector2.new(0.5, 0.5)
					Mark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Mark.BackgroundTransparency = 1.000
					Mark.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Mark.BorderSizePixel = 0
					Mark.Position = UDim2.new(0.5, 0, 0.5, 0)
					Mark.Size = UDim2.new(0, 0, 0, 0)
					Mark.Image = 'rbxassetid://13463182748'
					Mark.ImageColor3 = Color3.fromRGB(200, 200, 200)
					Mark.ImageTransparency = 1.000
				end

				if stateCurrent == true then
					Mark.ImageTransparency = 0
					Mark.Size = UDim2.new(1, -5, 1, -5)
					Switch.BackgroundColor3 = Color3.fromRGB(36, 72, 189)
				end

				function switchSets:SetState(state)
					if state == nil then
						stateCurrent = not stateCurrent
					else
						stateCurrent = state
					end

					if stateCurrent then
						interpolate({t = .5}, Mark, {ImageTransparency = 0})
						interpolate({t = .5, s = Enum.EasingStyle.Back}, Mark, {Size = UDim2.new(1, -5, 1, -5)})
						interpolate({t = .5}, Switch, {BackgroundColor3 = Color3.fromRGB(36, 72, 189)})
					else
						interpolate({t = .5}, Mark, {ImageTransparency = 1})
						interpolate({t = .5, s = Enum.EasingStyle.Back, a = Enum.EasingDirection.In}, Mark, {Size = UDim2.new(0, 0, 0, 0)})
						interpolate({t = .5}, Switch, {BackgroundColor3 = Color3.fromRGB(17, 17, 17)})
					end

					local s, err = pcall(function()
						switchSets.Callback(stateCurrent)
					end)

					if not s then print('Synthesial | '.. switchSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
				end

				do
					local hover, down
					Toggle.MouseEnter:Connect(function()
						if SyntLibrary.PromptTime then return end
						hover = true
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_5, {Color = Color3.fromRGB(117, 117, 117)})
					end)

					Toggle.MouseLeave:Connect(function()
						hover = false
						if not down then
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_5, {Color = Color3.fromRGB(91, 91, 91)})
						end
					end)

					uis.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
							down = true
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_5, {Color = Color3.fromRGB(177, 177, 177)})
							interpolate({s = Enum.EasingStyle.Quad}, Toggle, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
							switchSets:SetState()
						end
					end)

					uis.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							down = false
							if hover then
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_5, {Color = Color3.fromRGB(117, 117, 117)})
								interpolate({s = Enum.EasingStyle.Quad}, Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							else
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_5, {Color = Color3.fromRGB(91, 91, 91)})
								interpolate({s = Enum.EasingStyle.Quad}, Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							end
						end
					end)
				end

				return switchSets
			end

			function elements:MakeDropdown(ddSets)
				local Dropdown = Instance.new('Frame')
				local UIStroke_6 = Instance.new('UIStroke')
				local UICorner_11 = Instance.new('UICorner')
				local ButtonTitle_2 = Instance.new('TextLabel')
				local UIPadding_6 = Instance.new('UIPadding')
				local Sorter = Instance.new('ImageLabel')
				local Items = Instance.new('Frame')
				local List = Instance.new('ScrollingFrame')
				local UIListLayout = Instance.new('UIListLayout')
				local UIPadding_7 = Instance.new('UIPadding')
				local UICorner_13 = Instance.new('UICorner')

				local open = false
				local blacklistedItem = {}

				do
					Dropdown.Name = 'Dropdown'
					Dropdown.Parent = ActualElement
					Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Dropdown.BorderSizePixel = 0
					Dropdown.ClipsDescendants = true
					Dropdown.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Dropdown.Size = UDim2.new(1, -20, 0, 34)

					UIStroke_6.Parent = Dropdown
					UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_6.Color = Color3.fromRGB(91, 91, 91)

					UICorner_11.Parent = Dropdown

					ButtonTitle_2.Name = 'ButtonTitle'
					ButtonTitle_2.Parent = Dropdown
					ButtonTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonTitle_2.BackgroundTransparency = 1.000
					ButtonTitle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ButtonTitle_2.BorderSizePixel = 0
					ButtonTitle_2.Size = UDim2.new(0, 200, 0, 34)
					ButtonTitle_2.Font = Enum.Font.SourceSans
					ButtonTitle_2.Text = ddSets.Title or 'Dropdown Title'
					ButtonTitle_2.TextColor3 = Color3.fromRGB(172, 172, 172)
					ButtonTitle_2.TextSize = 17.000
					ButtonTitle_2.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_6.Parent = ButtonTitle_2
					UIPadding_6.PaddingLeft = UDim.new(0, 10)

					Sorter.Name = 'Sorter'
					Sorter.Parent = Dropdown
					Sorter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Sorter.BackgroundTransparency = 1.000
					Sorter.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Sorter.BorderSizePixel = 0
					Sorter.Position = UDim2.new(0, 220, 0, 4)
					Sorter.Size = UDim2.new(0, 25, 0, 25)
					Sorter.Image = 'rbxassetid://13463078710'
					Sorter.ImageColor3 = Color3.fromRGB(172, 172, 172)

					Items.Name = 'Items'
					Items.Parent = Dropdown
					Items.Active = true
					Items.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
					Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Items.BorderSizePixel = 0
					Items.ClipsDescendants = true
					Items.Position = UDim2.new(0, 0, 0, 34)
					Items.Selectable = true
					Items.Size = UDim2.new(0, 258, 0, 86)

					List.Name = 'List'
					List.Parent = Items
					List.Active = true
					List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					List.BackgroundTransparency = 1.000
					List.BorderColor3 = Color3.fromRGB(0, 0, 0)
					List.BorderSizePixel = 0
					List.Size = UDim2.new(1, 0, 1, 0)
					List.ScrollBarThickness = 2

					UIListLayout.Parent = List
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					UIListLayout.Padding = UDim.new(0, 8)

					UIPadding_7.Parent = List
					UIPadding_7.PaddingTop = UDim.new(0, 5)

					UICorner_13.Parent = Items
				end

				if ddSets.Items then
					local firstActivatedItem;

					for _, v in pairs(ddSets.Items) do
						local Item = Instance.new('TextLabel')
						local UICorner_12 = Instance.new('UICorner')

						Item.Name = 'Item'
						Item.Parent = List
						Item.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
						Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Item.BorderSizePixel = 0
						Item.Position = UDim2.new(-0.217054263, 0, 0, 0)
						Item.Size = UDim2.new(0, 234, 0, 27)
						Item.Font = Enum.Font.Gotham
						Item.Text = 'Item'
						Item.TextColor3 = Color3.fromRGB(175, 175, 175)
						Item.TextSize = 14.000

						UICorner_12.CornerRadius = UDim.new(0, 20)
						UICorner_12.Parent = Item

						if typeof(v) == 'table' then
							Item.Name = v[1]
							Item.Text = v[1]
						else
							Item.Name = v
							Item.Text = v
						end

						for _, v2 in pairs(List:GetChildren()) do
							if string.find(string.lower(v2.Name), string.lower(ddSets.CurrentValue)) then
								firstActivatedItem = v[2]
								ddSets.CurrentValue = firstActivatedItem
							end
						end

						do	
							if ddSets.SpawnExecute then
								local s, err = pcall(function()
									ddSets.Callback(ddSets.CurrentValue)
								end)

								if not s then print('Synthesial | '.. ddSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
							end

							local hover, down;
							Item.MouseEnter:Connect(function()
								if SyntLibrary.PromptTime then return end
								hover = true
								interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(73, 73, 73)})
							end)

							Item.MouseLeave:Connect(function()
								hover = false
								if not down then
									interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
								end
							end)

							uis.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
									down = true
									if typeof(v) == 'table' then
										ddSets.CurrentValue = v[2]
									else
										ddSets.CurrentValue = Item.Name
									end

									interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(117, 117, 117)})
									local s, err = pcall(function()
										ddSets.Callback(ddSets.CurrentValue)
									end)

									if not s then print('Synthesial | '.. ddSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
								end
							end)

							uis.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									down = false
									if hover then
										interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(73, 73, 73)})
									else
										interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
									end
								end
							end)
						end
					end
				end

				local function remoteFrame()
					if not open then
						open = true
						interpolate({t = .6}, Dropdown, {Size = UDim2.new(1, -20, 0, 120)})
					else
						open = false
						interpolate({t = .6}, Dropdown, {Size = UDim2.new(1, -20, 0, 34)})
					end
				end

				function ddSets:AddItem(newItemSets)
					local itemName, itemValue;

					if typeof(newItemSets) == 'table' then
						itemName = newItemSets[1]
						itemValue = newItemSets[2]
					else
						itemName = newItemSets
						itemValue = newItemSets
					end

					local Item = Instance.new('TextLabel')
					local UICorner_12 = Instance.new('UICorner')

					Item.Name = itemName
					Item.Parent = List
					Item.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
					Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Item.BorderSizePixel = 0
					Item.Position = UDim2.new(-0.217054263, 0, 0, 0)
					Item.Size = UDim2.new(0, 234, 0, 27)
					Item.Font = Enum.Font.Gotham
					Item.Text = 'Item'
					Item.TextColor3 = Color3.fromRGB(175, 175, 175)
					Item.TextSize = 14.000

					UICorner_12.CornerRadius = UDim.new(0, 20)
					UICorner_12.Parent = Item

					do
						local hover, down;
						Item.MouseEnter:Connect(function()
							if SyntLibrary.PromptTime then return end
							hover = true
							interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(73, 73, 73)})
						end)

						Item.MouseLeave:Connect(function()
							hover = false
							if not down then
								interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							end
						end)

						uis.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
								down = true

								interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(117, 117, 117)})
								ddSets.CurrentValue =itemValue

								local s, err = pcall(function()
									ddSets.Callback(ddSets.CurrentValue)
								end)

								if not s then print('Synthesial | '.. ddSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
							end
						end)

						uis.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								down = false
								if hover then
									interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(73, 73, 73)})
								else
									interpolate({s = Enum.EasingStyle.Quad}, Item, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
								end
							end
						end)
					end
				end

				function ddSets:SetVoid(itemName)
					for _, v in pairs(List:GetChildren()) do
						if string.find(string.lower(v.Name), string.lower(itemName)) then
							table.insert(blacklistedItem, v.Name)
							v:Destroy()
						end
					end
				end

				function ddSets:Void()
					for _, v in pairs(List:GetChildren()) do
						if v.Name ~= blacklistedItem then
							table.clear(blacklistedItem)
							v:Destroy()
						end
					end
				end

				do
					local hover, down;
					Dropdown.MouseEnter:Connect(function()
						if SyntLibrary.PromptTime then return end
						hover = true
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_6, {Color = Color3.fromRGB(117, 117, 117)})
					end)

					Dropdown.MouseLeave:Connect(function()
						hover = false
						if not down then
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_6, {Color = Color3.fromRGB(91, 91, 91)})
						end
					end)

					uis.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
							down = true
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_6, {Color = Color3.fromRGB(177, 177, 177)})
							interpolate({s = Enum.EasingStyle.Quad}, Dropdown, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
							remoteFrame()
						end
					end)

					uis.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							down = false
							if hover then
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_6, {Color = Color3.fromRGB(117, 117, 117)})
								interpolate({s = Enum.EasingStyle.Quad}, Dropdown, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							else
								interpolate({s = Enum.EasingStyle.Quad}, UIStroke_6, {Color = Color3.fromRGB(91, 91, 91)})
								interpolate({s = Enum.EasingStyle.Quad}, Dropdown, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
							end
						end
					end)
				end

				return ddSets
			end

			function elements:MakeTextbox(tbSets)
				local Textbox = Instance.new("Frame")
				local UIStroke_8 = Instance.new('UIStroke')
				local UICorner_14 = Instance.new("UICorner")
				local TextboxTitle = Instance.new("TextLabel")
				local UIPadding_8 = Instance.new("UIPadding")
				local InputFrame = Instance.new("Frame")
				local UIStroke_9 = Instance.new('UIStroke')
				local UICorner_15 = Instance.new("UICorner")
				local Input = Instance.new("TextBox")

				do
					Textbox.Name = "Textbox"
					Textbox.Parent = ActualElement
					Textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Textbox.BorderSizePixel = 0
					Textbox.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Textbox.Size = UDim2.new(1, -20, 0, 34)

					UIStroke_8.Parent = Textbox
					UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_8.Color = Color3.fromRGB(91, 91, 91)

					UICorner_14.Parent = Textbox

					TextboxTitle.Name = "TextboxTitle"
					TextboxTitle.Parent = Textbox
					TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextboxTitle.BackgroundTransparency = 1.000
					TextboxTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextboxTitle.BorderSizePixel = 0
					TextboxTitle.Size = UDim2.new(0, 200, 0, 34)
					TextboxTitle.Font = Enum.Font.SourceSans
					TextboxTitle.Text = tbSets.Title or 'Textbox'
					TextboxTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					TextboxTitle.TextSize = 17.000
					TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_8.Parent = TextboxTitle
					UIPadding_8.PaddingLeft = UDim.new(0, 10)

					InputFrame.Name = "InputFrame"
					InputFrame.Parent = Textbox
					InputFrame.AnchorPoint = Vector2.new(1, 0.5)
					InputFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
					InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					InputFrame.BorderSizePixel = 0
					InputFrame.Position = UDim2.new(0, 247, 0, 17)
					InputFrame.Size = UDim2.new(0, 100, 0, 14)

					UIStroke_9.Parent = InputFrame
					UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_9.Color = Color3.fromRGB(91, 91, 91)

					UICorner_15.Parent = InputFrame

					Input.Name = "Input"
					Input.Parent = InputFrame
					Input.AnchorPoint = Vector2.new(0.5, 0.5)
					Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Input.BackgroundTransparency = 1.000
					Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Input.BorderSizePixel = 0
					Input.Position = UDim2.new(0.5, 0, 0.5, 0)
					Input.Size = UDim2.new(1, -15, 0, 14)
					Input.Font = Enum.Font.Gotham
					Input.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
					Input.PlaceholderText = tbSets.PlaceholderText or "PlaceholderText"
					Input.Text = ''
					Input.TextColor3 = Color3.fromRGB(168, 168, 168)
					Input.TextSize = 12.000
				end

				do
					InputFrame.Size = UDim2.new(0, Input.TextBounds.X + 24, 0, 14)

					if tbSets.NumbersOnly or tbSets.CharLimit then
						Input:GetPropertyChangedSignal('Text'):Connect(function()
							if Input.Text == '' then return end
							if tbSets.NumbersOnly then Input.Text = Input.Text:gsub('%D+', '') end
							if tbSets.CharLimit then Input.Text = Input.Text:sub(1, tbSets.CharLimit) end
							interpolate({t = .55}, InputFrame, {Size = UDim2.new(0, Input.TextBounds.X + 24, 0, 14)})
						end)
					end

					Input.FocusLost:Connect(function(enter)
						if tbSets.FireEnter and not enter then
							if tbSets.FocusLostRemoveText then
								Input.Text = ''
								interpolate({t = .55}, InputFrame, {Size = UDim2.new(0, Input.TextBounds.X + 24, 0, 14)})
							end
							return
						end

						local s, err = pcall(function()
							tbSets.Callback(Input.Text)
						end)

						if not s then print('Synthesial | '.. tbSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
						if tbSets.FocusLostRemoveText then Input.Text = '' interpolate({t = .55}, InputFrame, {Size = UDim2.new(0, Input.TextBounds.X + 24, 0, 14)}) end	

						Textbox.MouseEnter:Connect(function()
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_8, {Color = Color3.fromRGB(117, 117, 117)})
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_9, {Color = Color3.fromRGB(117, 117, 117)})
						end)

						Textbox.MouseLeave:Connect(function()
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_8, {Color = Color3.fromRGB(91, 91, 91)})
							interpolate({s = Enum.EasingStyle.Quad}, UIStroke_9, {Color = Color3.fromRGB(91, 91, 91)})
						end)
					end)

					Input.Focused:Connect(function()
						if SyntLibrary.PromptTime then return end
						interpolate({t = .55}, InputFrame, {Size = UDim2.new(0, Input.TextBounds.X + 24, 0, 14)})
					end)
				end

				return tbSets
			end
			
			function elements:MakeKeybind(bindSets)
				local Keybind = Instance.new("Frame")
				local UIStroke_10 = Instance.new('UIStroke')
				local UICorner_16 = Instance.new("UICorner")
				local BindTitle = Instance.new("TextLabel")
				local UIPadding_9 = Instance.new("UIPadding")
				local KeyFrame = Instance.new("Frame")
				local UIStroke_11 = Instance.new('UIStroke')
				local UICorner_17 = Instance.new("UICorner")
				local BindBox = Instance.new("TextBox")
				
				local checking;
				
				do
					Keybind.Name = "Keybind"
					Keybind.Parent = ActualElement
					Keybind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Keybind.BorderSizePixel = 0
					Keybind.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Keybind.Size = UDim2.new(1, -20, 0, 34)
					
					UIStroke_10.Parent = Keybind
					UIStroke_10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_10.Color = Color3.fromRGB(91, 91, 91)

					UICorner_16.Parent = Keybind

					BindTitle.Name = "BindTitle"
					BindTitle.Parent = Keybind
					BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BindTitle.BackgroundTransparency = 1.000
					BindTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					BindTitle.BorderSizePixel = 0
					BindTitle.Size = UDim2.new(0, 200, 0, 34)
					BindTitle.Font = Enum.Font.SourceSans
					BindTitle.Text = bindSets.Title or "KB Title"
					BindTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					BindTitle.TextSize = 17.000
					BindTitle.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding_9.Parent = BindTitle
					UIPadding_9.PaddingLeft = UDim.new(0, 10)

					KeyFrame.Name = "KeyFrame"
					KeyFrame.Parent = Keybind
					KeyFrame.AnchorPoint = Vector2.new(1, 0.5)
					KeyFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
					KeyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					KeyFrame.BorderSizePixel = 0
					KeyFrame.Position = UDim2.new(0, 247, 0, 17)
					KeyFrame.Size = UDim2.new(0, 20, 0, 15)
					
					UIStroke_11.Parent = KeyFrame
					UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_11.Color = Color3.fromRGB(91, 91, 91)

					UICorner_17.Parent = KeyFrame

					BindBox.Name = "BindBox"
					BindBox.Parent = KeyFrame
					BindBox.AnchorPoint = Vector2.new(0.5, 0.5)
					BindBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BindBox.BackgroundTransparency = 1.000
					BindBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					BindBox.BorderSizePixel = 0
					BindBox.Position = UDim2.new(0.5, 0, 0.5, 0)
					BindBox.Size = UDim2.new(1, -15, 0, 14)
					BindBox.Font = Enum.Font.Gotham
					BindBox.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
					BindBox.Text = ''
					BindBox.TextColor3 = Color3.fromRGB(168, 168, 168)
					BindBox.TextSize = 12.000
				end
				
				function bindSets:SetKey(newKey)
					BindBox.Text = tostring(newKey)
					bindSets.CurrentKey = tostring(newKey)
					BindBox:ReleaseFocus()
				end
				
				do
					KeyFrame.Size = UDim2.new(0, BindBox.TextBounds.X + 24, 0, 15)
					
					BindBox.Focused:Connect(function()
						checking = true
						BindBox.Text = ''
					end)
					
					BindBox.FocusLost:Connect(function()
						checking = false
						if BindBox.Text == '' then
							BindBox.Text = bindSets.CurrentKey
						end
					end)
					
					Keybind.MouseEnter:Connect(function()
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_10, {Color = Color3.fromRGB(117, 117, 117)})
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_11, {Color = Color3.fromRGB(117, 117, 117)})
					end)
					
					Keybind.MouseLeave:Connect(function()
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_10, {Color = Color3.fromRGB(91, 91, 91)})
						interpolate({s = Enum.EasingStyle.Quad}, UIStroke_11, {Color = Color3.fromRGB(91, 91, 91)})
					end)
					
					uis.InputBegan:Connect(function(input, gpe)
						if checking then
							if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.Insert then
								local split = string.split(tostring(input.KeyCode), '.')
								local newKey = split[3]
								BindBox.Text = tostring(newKey)
								bindSets.CurrentKey = tostring(newKey)
								BindBox:ReleaseFocus()
							end
						elseif bindSets.CurrentKey ~= nil and input.KeyCode == Enum.KeyCode[bindSets.CurrentKey] then
							local held = true
							local connection; connection = input.Changed:Connect(function(prop)
								if prop == 'UserInputState' then
									connection:Disconnect()
									held = false
								end
							end)
							
							if not bindSets.HoldToFire then
								local s, err = pcall(bindSets.Callback)
								if not s then print('Synthesial | '.. bindSets.Title .. ' callback error:\n'.. err) print('---------------------------------------------') end
							else
								wait(.25)
								if held then
									local loop; loop = runService.Stepped:Connect(function()
										if not held then
											bindSets.Callback(false)
											loop:Disconnect()
										else
											bindSets.Callback(true)
										end
									end)
								end
							end
						end
					end)
					
					BindBox:GetPropertyChangedSignal('Text'):Connect(function()
						interpolate({t = .55}, KeyFrame, {Size = UDim2.new(0, BindBox.TextBounds.X + 24, 0, 15)})
					end)
				end
				
				return bindSets
			end
			
			function elements:MakeLabel(content)
				local Label = Instance.new("Frame")
				local UICorner_18 = Instance.new("UICorner")
				local LabelTitle = Instance.new("TextLabel")
				local UIPadding_10 = Instance.new("UIPadding")
				local UIGradient = Instance.new("UIGradient")
				
				local labelFunction = {}
				
				do
					Label.Name = "Label"
					Label.Parent = ActualElement
					Label.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Label.BorderSizePixel = 0
					Label.Position = UDim2.new(0.0323740989, 0, 0, 0)
					Label.Size = UDim2.new(1, -20, 0, 26)

					UICorner_18.Parent = Label

					LabelTitle.Name = "LabelTitle"
					LabelTitle.Parent = Label
					LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					LabelTitle.BackgroundTransparency = 1.000
					LabelTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					LabelTitle.BorderSizePixel = 0
					LabelTitle.Size = UDim2.new(0, 258, 0, 26)
					LabelTitle.Font = Enum.Font.SourceSansItalic
					LabelTitle.Text = content
					LabelTitle.TextColor3 = Color3.fromRGB(172, 172, 172)
					LabelTitle.TextSize = 15.000
					LabelTitle.TextWrapped = true
					LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
					LabelTitle.TextYAlignment = Enum.TextYAlignment.Top

					UIPadding_10.Parent = LabelTitle
					UIPadding_10.PaddingLeft = UDim.new(0, 10)
					UIPadding_10.PaddingTop = UDim.new(0, 5)

					UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
					UIGradient.Parent = Label
				end
				
				function labelFunction:Set(new)
					content = new
					LabelTitle = content
				end
				
				return labelFunction
			end

			return elements
		end

		return subSection
	end

	return tabHandler
end

return SyntLibrary
