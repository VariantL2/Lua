-- Variables
local plr = game.Players.LocalPlayer
local uis = game:GetService('UserInputService')
local tweenService = game:GetService('TweenService')
local runService = game:GetService('RunService')
local coreGui = game:GetService('CoreGui')

local viewport = workspace.CurrentCamera.ViewportSize

local Library = {}

Library.__index = Library

function Library:tween(instance, goal, callback)
	local info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local tween = tweenService:Create(instance, info, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Default(default, options)
	for i, v in pairs(default) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:CreateWindow(options)
	options = Library:Default({
		Name = 'CynnFul UI',
		MainFrameUIStroke = Color3.fromRGB(10, 38, 161),
		SecondaryFrameUIStroke = Color3.fromRGB(139, 0, 0)
	}, options or {})

	local GUI = {
		CurrentTab = nil,
		closeButtonHover = false,
		frameHover = false,
		minimizeButtonHover = false
	}

	-- Main Frame
	do
		-- StarterGui.CynnFul Task
		GUI["1"] = Instance.new("ScreenGui", coreGui);
		GUI["1"]["Enabled"] = true;
		GUI["1"]["Name"] = [[CynnFul Task]];
		GUI['1']['IgnoreGuiInset'] = true
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.CynnFul Task.MainFrame
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["2"]["Size"] = UDim2.new(0.41116276383399963, 0, 0.5, 0);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Position"] = UDim2.new(0.49953487515449524, 0, 0.5, 0);
		GUI["2"]["Name"] = [[MainFrame]];

		-- StarterGui.CynnFul Task.MainFrame.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.CynnFul Task.MainFrame.UIStroke
		GUI["4"] = Instance.new("UIStroke", GUI["2"]);
		GUI["4"]["Color"] = Color3.fromRGB(11, 39, 162);
		GUI["4"]["Thickness"] = 2;
		GUI["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui.CynnFul Task.MainFrame.Shadow
		GUI["5"] = Instance.new("Frame", GUI["2"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["5"]["Name"] = [[Shadow]];

		-- StarterGui.CynnFul Task.MainFrame.Shadow.DropShadow
		GUI["6"] = Instance.new("ImageLabel", GUI["5"]);
		GUI["6"]["ZIndex"] = 0;
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["6"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["6"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["ImageTransparency"] = 0.5;
		GUI["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["6"]["Image"] = [[rbxassetid://6014261993]];
		GUI["6"]["Size"] = UDim2.new(1, 60, 1, 60);
		GUI["6"]["Name"] = [[DropShadow]];
		GUI["6"]["BackgroundTransparency"] = 1;
		GUI["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.CynnFul Task.MainFrame.Title
		GUI["7"] = Instance.new("TextLabel", GUI["2"]);
		GUI["7"]["TextWrapped"] = true;
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["TextScaled"] = true;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["7"]["TextSize"] = 40;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(1, 0, 0.18709677457809448, 0);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Text"] = options['Name'];
		GUI["7"]["Name"] = options['Name'];
		GUI["7"]["BackgroundTransparency"] = 1;
		GUI["7"]["Position"] = UDim2.new(0.002262413501739502, 0, -0.20645160973072052, 0);

		-- StarterGui.CynnFul Task.MainFrame.UIControlButtons
		GUI["8"] = Instance.new("Frame", GUI["2"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
		GUI["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["8"]["Size"] = UDim2.new(0.09954752027988434, 0, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Position"] = UDim2.new(1.0791856050491333, 0, 0.5, 0);
		GUI["8"]["Name"] = [[UIControlButtons]];

		-- StarterGui.CynnFul Task.MainFrame.UIControlButtons.UICorner
		GUI["9"] = Instance.new("UICorner", GUI["8"]);
		GUI["9"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.CynnFul Task.MainFrame.UIControlButtons.UIStroke
		GUI["a"] = Instance.new("UIStroke", GUI["8"]);
		GUI["a"]["Color"] = Color3.fromRGB(140, 0, 0);
		GUI["a"]["Thickness"] = 2;
		GUI["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui.CynnFul Task.MainFrame.UIControlButtons.CloseButton
		GUI["b"] = Instance.new("TextLabel", GUI["8"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["b"]["TextSize"] = 36;
		GUI["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["b"]["Size"] = UDim2.new(0, 44, 0, 50);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Text"] = [[X]];
		GUI["b"]["Name"] = [[CloseButton]];
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Position"] = UDim2.new(0.5, 0, 0.14960630238056183, 0);

		-- StarterGui.CynnFul Task.MainFrame.UIControlButtons.MinimiseButton
		GUI["c"] = Instance.new("TextLabel", GUI["8"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["c"]["TextSize"] = 31;
		GUI["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c"]["Size"] = UDim2.new(0, 44, 0, 50);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Text"] = [[__]];
		GUI["c"]["Name"] = [[MinimiseButton]];
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(0.5, 0, 0.29921260476112366, 0);
		
		-- StarterGui.CynnFul Task.MinimizedFrameHandler
		GUI["Minimize"] = Instance.new("Frame", GUI["1"]);
		GUI['Minimize']["BorderSizePixel"] = 0;
		GUI['Minimize']["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
		GUI['Minimize']["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI['Minimize']["Size"] = UDim2.new(0.06344474107027054, 0, 0.11612901091575623, 0);
		GUI['Minimize']["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI['Minimize']["Position"] = UDim2.new(0.5319443941116333, 0, -0.09, 0);
		GUI['Minimize']["Name"] = [[MinimizedFrameHandler]];

		-- StarterGui.CynnFul Task.MinimizedFrameHandler.UICorner
		GUI["MinimzeCorner"] = Instance.new("UICorner", GUI['Minimize']);
		GUI["MinimzeCorner"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.CynnFul Task.MinimizedFrameHandler.TextLabel
		GUI['MinimizeText'] = Instance.new("TextLabel", GUI['Minimize']);
		GUI['MinimizeText']["TextWrapped"] = true;
		GUI['MinimizeText']["BorderSizePixel"] = 0;
		GUI['MinimizeText']["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI['MinimizeText']["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI['MinimizeText']["TextSize"] = 14;
		GUI['MinimizeText']["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI['MinimizeText']["Size"] = UDim2.new(1, 0, 1, 0);
		GUI['MinimizeText']["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI['MinimizeText']["Text"] = [[Open UI]];
		GUI['MinimizeText']["BackgroundTransparency"] = 1;
	end

	-- Shitty Logics
	do
		GUI['b'].MouseEnter:Connect(function()
			GUI.closeButtonHover = true
		end)

		GUI['b'].MouseLeave:Connect(function()
			GUI.closeButtonHover = false
		end)

		uis.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI.closeButtonHover then
					GUI['1']:Destroy()
				end
			end
		end)
	end

	-- Navigation
	do
		-- StarterGui.CynnFul Task.MainFrame.Navigate
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
		GUI["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["d"]["Size"] = UDim2.new(0.2398189902305603, 0, 1, 0);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Position"] = UDim2.new(0.1210407093167305, 0, 0.4999999701976776, 0);
		GUI["d"]["Name"] = [[Navigate]];

		-- StarterGui.CynnFul Task.MainFrame.Navigate.UICorner
		GUI["1c"] = Instance.new("UICorner", GUI["d"]);
		GUI["1c"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.CynnFul Task.MainFrame.Navigate.HideFrame1
		GUI["e"] = Instance.new("Frame", GUI["d"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
		GUI["e"]["Size"] = UDim2.new(0.806654155254364, 0, 0.264516144990921, 0);
		GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["e"]["Position"] = UDim2.new(0.19334550201892853, 0, -5.587935447692871e-09, 0);
		GUI["e"]["Name"] = [[HideFrame1]];

		-- StarterGui.CynnFul Task.MainFrame.Navigate.HideFrame2
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
		GUI["f"]["Size"] = UDim2.new(0.42929571866989136, 0, 0.2290322631597519, 0);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Position"] = UDim2.new(0.5707035660743713, 0, 0.7709677219390869, 0);
		GUI["f"]["Name"] = [[HideFrame2]];

		-- StarterGui.CynnFul Task.MainFrame.Navigate.TabButtonsHolder
		GUI["10"] = Instance.new("Frame", GUI["d"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["10"]["BackgroundTransparency"] = 1;
		GUI["10"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		GUI["10"]["Name"] = [[TabButtonsHolder]];

		-- StarterGui.CynnFul Task.MainFrame.Navigate.TabButtonsHolder.UIPadding
		GUI["11"] = Instance.new("UIPadding", GUI["10"]);
		GUI["11"]["PaddingTop"] = UDim.new(0, 8);
		GUI["11"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.CynnFul Task.MainFrame.Navigate.TabButtonsHolder.UIListLayout
		GUI["13"] = Instance.new("UIListLayout", GUI["10"]);
		GUI["13"]["Padding"] = UDim.new(0, 10);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer
		GUI["1d"] = Instance.new("Frame", GUI["d"]);
		GUI["1d"]["BorderSizePixel"] = 0;
		GUI["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["1d"]["BackgroundTransparency"] = 1;
		GUI["1d"]["Size"] = UDim2.new(2.9738502502441406, 0, 0.948387086391449, 0);
		GUI["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1d"]["Position"] = UDim2.new(2.578796148300171, 0, 0.49705496430397034, 0);
		GUI["1d"]["Name"] = [[ContentContainer]];
	end
	
	do
		GUI['c'].MouseEnter:Connect(function()
			GUI.minimizeButtonHover = true
		end)

		GUI['c'].MouseLeave:Connect(function()
			GUI.minimizeButtonHover = false
		end)

		uis.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI.minimizeButtonHover then
					Library:tween(GUI['2'], {Position = UDim2.fromScale(0.5, 1.34)})
					Library:tween(GUI['Minimize'], {Position = UDim2.fromScale(0.532, 0.089)})
				end
			end
		end)
		
		local openFrameHover = false
		
		GUI['Minimize'].MouseEnter:Connect(function()
			openFrameHover = true
		end)
		
		GUI['Minimize'].MouseLeave:Connect(function()
			openFrameHover = false
		end)
		
		uis.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if openFrameHover then
					Library:tween(GUI['2'], {Position = UDim2.fromScale(0.49953487515449524, 0.5)})
					Library:tween(GUI['Minimize'], {Position = UDim2.fromScale(0.5319443941116333, -0.09)})
				end
			end
		end)
	end

	function GUI:CreateTab(Name: string)

		local Tab = {
			Hover = false,
			Active = false
		}

		-- Button Render
		do
			-- StarterGui.CynnFul Task.MainFrame.Navigate.TabButtonsHolder.Inactive Tab
			Tab["18"] = Instance.new("TextLabel", GUI["10"]);
			Tab["18"]["TextWrapped"] = true;
			Tab["18"]["BorderSizePixel"] = 0;
			Tab['18']['TextScaled'] = false;
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["18"]["TextSize"] = 14;
			Tab["18"]["TextColor3"] = Color3.fromRGB(186, 186, 186);
			Tab["18"]["Size"] = UDim2.new(1, 0, 0.10204081982374191, 0);
			Tab["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["18"]["Text"] = Name;
			Tab["18"]["Name"] = Name;
			Tab["18"]["BackgroundTransparency"] = 0.9599999785423279;
			Tab["18"]["Position"] = UDim2.new(0, 0, 0.025806451216340065, 0);

			-- StarterGui.CynnFul Task.MainFrame.Navigate.TabButtonsHolder.Inactive Tab.UIPadding
			Tab["19"] = Instance.new("UIPadding", Tab["18"]);
			Tab["19"]["PaddingLeft"] = UDim.new(0, 10);

			-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab
			Tab["1e"] = Instance.new("ScrollingFrame", GUI["1d"]);
			Tab["1e"]["BorderSizePixel"] = 0;
			Tab["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1e"]["BackgroundTransparency"] = 1;
			Tab["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1e"]["Selectable"] = false;
			Tab["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1e"]["ScrollBarThickness"] = 2;
			Tab["1e"]["Name"] = Name;
			Tab["1e"]["SelectionGroup"] = false;
			Tab["1e"]["Visible"] = false;

			-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.UIListLayout
			Tab["1f"] = Instance.new("UIListLayout", Tab["1e"]);
			Tab["1f"]["Padding"] = UDim.new(0, 10);
			Tab["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.UIPadding
			Tab["26"] = Instance.new("UIPadding", Tab["1e"]);
			Tab["26"]["PaddingTop"] = UDim.new(0, 6);
			Tab["26"]["PaddingLeft"] = UDim.new(0, 7);
		end

		-- Functions
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Library:tween(Tab['18'], {BackgroundTransparency = .8})
				Library:tween(Tab['18'], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Tab['1e']['Visible'] = true


				GUI.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab['18'], {TextColor3 = Color3.fromRGB(186, 186, 186)})
				Library:tween(Tab['18'], {BackgroundTransparency = .9})
				Tab['1e']['Visible'] = false
			end
		end

		-- tab Button Logics
		do
			Tab['18'].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Tab.Hover = true
					Library:tween(Tab['18'], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab['18'].MouseLeave:Connect(function()
				Tab.Hover = false

				if Tab.Active then
					Library:tween(Tab['18'], {TextColor3 = Color3.fromRGB(186, 186, 186)})
				end
			end)

			uis.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end

		-- Tab Elements Creator
		function Tab:CreateButton(options)
			options = Library:Default({
				Name = 'A button',
				Callback = function() end
			}, options or {})

			local Button = {
				hover = false,
				mouseDown = false
			}

			-- Rendering Tab's Button [Not the Tab button]
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button
				Button["20"] = Instance.new("Frame", Tab["1e"]);
				Button["20"]["BorderSizePixel"] = 0;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Button["20"]["Size"] = UDim2.new(0.9651046395301819, 0, 0.056891076266765594, 0);
				Button["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["20"]["Position"] = UDim2.new(0.0222061425447464, 0, 0.020408162847161293, 0);
				Button["20"]["Name"] = [[Button]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button.UICorner
				Button["21"] = Instance.new("UICorner", Button["20"]);
				Button["21"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button.ButtonName
				Button["22"] = Instance.new("TextLabel", Button["20"]);
				Button["22"]["BorderSizePixel"] = 0;
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["22"]["TextSize"] = 14;
				Button["22"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Button["22"]["Size"] = UDim2.new(0.8979873061180115, 0, 1.0000001192092896, 0);
				Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["22"]["Text"] = options['Name'];
				Button["22"]["Name"] = options['Name'];
				Button["22"]["BackgroundTransparency"] = 1;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button.ButtonName.UIPadding
				Button["23"] = Instance.new("UIPadding", Button["22"]);
				Button["23"]["PaddingLeft"] = UDim.new(0, 9);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button.UIStroke
				Button["24"] = Instance.new("UIStroke", Button["20"]);
				Button["24"]["Color"] = Color3.fromRGB(140, 140, 140);
				Button["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Button.Icon
				Button["25"] = Instance.new("ImageLabel", Button["20"]);
				Button["25"]["BorderSizePixel"] = 0;
				Button["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Button["25"]["Image"] = [[rbxassetid://13459413669]];
				Button["25"]["Size"] = UDim2.new(0.08991503715515137, 0, 0.699999988079071, 0);
				Button["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["25"]["Name"] = [[Icon]];
				Button["25"]["BackgroundTransparency"] = 1;
				Button["25"]["Position"] = UDim2.new(0.9429447650909424, 0, 0.48322877287864685, 0);
			end

			-- Button methods
			function Button:SetText(text)
				Button['22']['Text'] = text
			end

			function Button:SetCallback(func)
				options['Callback'] = func
			end

			-- Button logics
			do
				Button['20'].MouseEnter:Connect(function()
					Button.hover = true
					Library:tween(Button['24'], {Color = Color3.fromRGB(180, 180, 180)})
				end)

				Button['20'].MouseLeave:Connect(function()
					Button.hover = false

					if not Button.mouseDown then
						Library:tween(Button['24'], {Color = Color3.fromRGB(140, 140, 140)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.hover then
						Button.mouseDown = true
						Library:tween(Button['20'], {BackgroundColor3 = Color3.fromRGB(170, 170, 170)})
						Library:tween(Button['24'], {Color = Color3.fromRGB(255, 255, 255)})
						local success, messageError = pcall(options['Callback'])
						if not success then
							print('Cynn UI Error | '.. options['Name'] .. ' Callback error: '.. messageError)
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.mouseDown = false

						if Button.hover then
							Library:tween(Button['20'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Button['24'], {Color = Color3.fromRGB(180, 180, 180)})
						else
							Library:tween(Button['20'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Button['24'], {Color = Color3.fromRGB(140, 140, 140)})
						end
					end
				end)
			end

			return Button
		end

		function Tab:CreateLabel(options)
			options = Library:Default({
				Content = 'This is a label',
				MiddleUIGradient = true
			}, options or {})

			local Label = {}

			-- Label Render
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Label
				Label["27"] = Instance.new("Frame", Tab["1e"]);
				Label["27"]["BorderSizePixel"] = 0;
				Label["27"]["BackgroundColor3"] = Color3.fromRGB(255, 163, 3);
				Label["27"]["Size"] = UDim2.new(0.9651046395301819, 0, 0.03857851028442383, 0);
				Label["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["27"]["Position"] = UDim2.new(0.0222061425447464, 0, 0.16704294085502625, 0);
				Label["27"]["Name"] = [[Label]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Label.UICorner
				Label["28"] = Instance.new("UICorner", Label["27"]);
				Label["28"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Label.LabelName
				Label["29"] = Instance.new("TextLabel", Label["27"]);
				Label["29"]["BorderSizePixel"] = 0;
				Label["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["29"]["TextSize"] = 15;
				Label["29"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Label['29']["Text"] = options.Content;
				Label["29"]["Size"] = UDim2.new(0.9999998211860657, 0, 1, 0);
				Label["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["29"]["Name"] = [[LabelName]];
				Label["29"]["BackgroundTransparency"] = 1;
				Label["29"]["Position"] = UDim2.new(3.077688859320915e-07, 0, 0, 0);
				Label['29']['TextWrapped'] = true;
				Label['29']['TextXAlignment'] = Enum.TextXAlignment.Center;
				Label['29']['TextYAlignment'] = Enum.TextYAlignment.Center;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Label.UIStroke
				Label["2a"] = Instance.new("UIStroke", Label["27"]);
				Label["2a"]["Color"] = Color3.fromRGB(140, 140, 140);
				Label["2a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Label.UIGradient
				Label["2b"] = Instance.new("UIGradient", Label["27"]);
				Label["2b"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.486, 0.9375),NumberSequenceKeypoint.new(1.000, 0)};
				Label["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 164, 4)),ColorSequenceKeypoint.new(0.493, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 164, 4))};
			end

			-- methods
			function Label:Set(text)
				options.Content = text
				Label:__update()
			end
			
			function Label:__update()
				Label['29']['Text'] = options.Content
				Label['29']['Size'] = UDim2.new(Label['29'].Size.X.Scale, Label['29'].Size.X.Offset, 0, math.huge)
				Label['29']['Size'] = UDim2.new(Label['29'].Size.X.Scale, Label['29'].Size.X.Offset, 0, Label['29'].TextBounds.Y)
				Label['27']['Size'] = UDim2.new(Label['27'].Size.X.Scale, Label['29'].Size.X.Offset, 0, Label['29'].TextBounds.Y + 12)
			end

			-- Logics
			do
				if options['MiddleUIGradient'] == false then
					-- Setting the gradient to false
					Label['2b']['Enabled'] = false

					-- UIStroke instance
					Label['UIStroke27'] = Instance.new('UIStroke', Label['29'])
					Label['UIStroke27']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Contextual
					Label['UIStroke27']['Thickness'] = 1
					Label['UIStroke27']['Color'] = Color3.fromRGB(0, 0, 0)
				else
					if Label['29']:FindFirstChildOfClass('UIStroke') then
						Label['29'].UIStroke:Destroy()
					end
				end
			end
			
			Label:__update()
			
			return Label
		end

		function Tab:CreateSlider(options)
			options = Library:Default({
				Name = 'Slider you made',
				Min = 16,
				Max = 50,
				Default = 16,
				Callback = function(sliderValue) end
			}, options or {})

			local Slider = {
				hover = false,
				mouseDown = false,
				Connection = nil
			}

			-- Render
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider
				Slider["2c"] = Instance.new("Frame", Tab["1e"]);
				Slider["2c"]["BorderSizePixel"] = 0;
				Slider["2c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Slider["2c"]["Size"] = UDim2.new(0.9651046395301819, 0, 0.08371738344430923, 0);
				Slider["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2c"]["Position"] = UDim2.new(0.0222061425447464, 0, 0.277426153421402, 0);
				Slider["2c"]["Name"] = [[Slider]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.UICorner
				Slider["2d"] = Instance.new("UICorner", Slider["2c"]);
				Slider["2d"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderName
				Slider["2e"] = Instance.new("TextLabel", Slider["2c"]);
				Slider["2e"]["BorderSizePixel"] = 0;
				Slider["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["2e"]["TextSize"] = 14;
				Slider["2e"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Slider["2e"]["Size"] = UDim2.new(1, 0, 0.6375784277915955, 0);
				Slider["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2e"]["Text"] = options['Name'];
				Slider["2e"]["Name"] = options['Name'];
				Slider["2e"]["BackgroundTransparency"] = 1;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderName.UIPadding
				Slider["2f"] = Instance.new("UIPadding", Slider["2e"]);
				Slider["2f"]["PaddingLeft"] = UDim.new(0, 9);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.UIStroke
				Slider["30"] = Instance.new("UIStroke", Slider["2c"]);
				Slider["30"]["Color"] = Color3.fromRGB(140, 140, 140);
				Slider["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.Value
				Slider["31"] = Instance.new("TextLabel", Slider["2c"]);
				Slider["31"]["BorderSizePixel"] = 0;
				Slider["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["31"]["TextSize"] = 14;
				Slider["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Slider["31"]["Size"] = UDim2.new(0.12260772287845612, 0, 0.7052397727966309, 0);
				Slider["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["31"]["Text"] = options['Default'];
				Slider["31"]["Name"] = [[Value]];
				Slider["31"]["BackgroundTransparency"] = 1;
				Slider["31"]["Position"] = UDim2.new(0.8925197720527649, 0, 0.35261988639831543, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderBackground
				Slider["32"] = Instance.new("Frame", Slider["2c"]);
				Slider["32"]["BorderSizePixel"] = 0;
				Slider["32"]["BackgroundColor3"] = Color3.fromRGB(12, 12, 12);
				Slider["32"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Slider["32"]["Size"] = UDim2.new(0.9778170585632324, 0, 0.15109243988990784, 0);
				Slider["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["32"]["Position"] = UDim2.new(0.49899381399154663, 0, 0.800000011920929, 0);
				Slider["32"]["Name"] = [[SliderBackground]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderBackground.UICorner
				Slider["33"] = Instance.new("UICorner", Slider["32"]);
				Slider["33"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderBackground.UIStroke
				Slider["34"] = Instance.new("UIStroke", Slider["32"]);
				Slider["34"]["Color"] = Color3.fromRGB(116, 116, 116);
				Slider["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderBackground.SliderLevel
				Slider["35"] = Instance.new("Frame", Slider["32"]);
				Slider["35"]["BorderSizePixel"] = 0;
				Slider["35"]["BackgroundColor3"] = Color3.fromRGB(121, 121, 121);
				Slider["35"]["Size"] = UDim2.new(0.30000001192092896, 0, 1, 0);
				Slider["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["35"]["Name"] = [[SliderLevel]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Slider.SliderBackground.SliderLevel.UICorner
				Slider["36"] = Instance.new("UICorner", Slider["35"]);
				Slider["36"]["CornerRadius"] = UDim.new(0, 6);
			end

			-- Methods
			function Slider:SetValue(val: number)
				local mouse = plr:GetMouse()
				if val == nil then
					local percentage = math.clamp((mouse.X - Slider['2c'].AbsolutePosition.X) / (Slider['2c'].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options['Max'] - options['Min']) * percentage) + options['Min'])

					Slider['31']['Text'] = tostring(value)
					Slider['35']['Size'] = UDim2.fromScale(percentage, 1)
				else
					Slider['31']['Text'] = tostring(val)
					Slider['35']['Size'] = UDim2.fromScale(((val - options['Min']) / (options['Max'] - options['Min'])), 1)
				end
				options.Callback(Slider:GetValue())
			end

			function Slider:GetValue()
				return tonumber(Slider['31']['Text'])
			end

			-- Logics
			do
				Slider['2c'].MouseEnter:Connect(function()
					Slider.hover = true
					Library:tween(Slider['30'], {Color = Color3.fromRGB(180, 180, 180)})
					Library:tween(Slider['34'], {Color = Color3.fromRGB(180, 180, 180)})
					Library:tween(Slider['35'], {BackgroundColor3 = Color3.fromRGB(180, 180, 180)})
				end)

				Slider['2c'].MouseLeave:Connect(function()
					Slider.hover = false

					if not Slider.mouseDown then
						Library:tween(Slider['30'], {Color = Color3.fromRGB(140, 140, 140)})
						Library:tween(Slider['34'], {Color = Color3.fromRGB(140, 140, 140)})
						Library:tween(Slider['35'], {BackgroundColor3 = Color3.fromRGB(121, 121, 121)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.hover then
						Slider.mouseDown = true
						Library:tween(Slider['2c'], {BackgroundColor3 = Color3.fromRGB(170, 170, 170)})
						Library:tween(Slider['30'], {Color = Color3.fromRGB(255, 255, 255)})
						Library:tween(Slider['34'], {Color = Color3.fromRGB(255, 255, 255)})
						Library:tween(Slider['35'], {BackgroundColor3 = Color3.fromRGB(230, 230, 230)})

						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.mouseDown = false

						if Slider.hover then
							Library:tween(Slider['2c'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Slider['30'], {Color = Color3.fromRGB(180, 180, 180)})
							Library:tween(Slider['34'], {Color = Color3.fromRGB(180, 180, 180)})
							Library:tween(Slider['35'], {BackgroundColor3 = Color3.fromRGB(121, 121, 121)})
						else
							Library:tween(Slider['2c'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Slider['30'], {Color = Color3.fromRGB(140, 140, 140)})
							Library:tween(Slider['34'], {Color = Color3.fromRGB(140, 140, 140)})
							Library:tween(Slider['35'], {BackgroundColor3 = Color3.fromRGB(121, 121, 121)})
						end

						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end

			return Slider
		end

		function Tab:CreateToggle(options)
			options = Library:Default({
				Name = 'A toggle',
				Callback = function() end
			}, options or {})

			local Toggle = {
				hover = false,
				mouseDown = false,
				state = false
			}

			-- Render
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle
				Toggle["4c"] = Instance.new("Frame", Tab["1e"]);
				Toggle["4c"]["BorderSizePixel"] = 0;
				Toggle["4c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Toggle["4c"]["Size"] = UDim2.new(0.9651046395301819, 0, 0.056891076266765594, 0);
				Toggle["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4c"]["Position"] = UDim2.new(0.0222061425447464, 0, 0.020408162847161293, 0);
				Toggle["4c"]["Name"] = [[InactiveToggle]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.UICorner
				Toggle["4d"] = Instance.new("UICorner", Toggle["4c"]);
				Toggle["4d"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.ToggleName
				Toggle["4e"] = Instance.new("TextLabel", Toggle["4c"]);
				Toggle["4e"]["BorderSizePixel"] = 0;
				Toggle["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["4e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["4e"]["TextSize"] = 14;
				Toggle["4e"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Toggle["4e"]["Size"] = UDim2.new(0.8979873061180115, 0, 1.0000001192092896, 0);
				Toggle["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4e"]["Text"] = options['Name']
				Toggle["4e"]["Name"] = [[ToggleName]];
				Toggle["4e"]["BackgroundTransparency"] = 1;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.ToggleName.UIPadding
				Toggle["4f"] = Instance.new("UIPadding", Toggle["4e"]);
				Toggle["4f"]["PaddingLeft"] = UDim.new(0, 9);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.UIStroke
				Toggle["50"] = Instance.new("UIStroke", Toggle["4c"]);
				Toggle["50"]["Color"] = Color3.fromRGB(140, 140, 140);
				Toggle["50"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.CheckmarkFrame
				Toggle["51"] = Instance.new("Frame", Toggle["4c"]);
				Toggle["51"]["BorderSizePixel"] = 0;
				Toggle["51"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				Toggle["51"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["51"]["Size"] = UDim2.new(0.09000000357627869, 0, 0.800000011920929, 0);
				Toggle["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["51"]["Position"] = UDim2.new(0.9245110750198364, 0, 0.4830004870891571, 0);
				Toggle["51"]["Name"] = [[CheckmarkFrame]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.CheckmarkFrame.Icon
				Toggle["52"] = Instance.new("ImageLabel", Toggle["51"]);
				Toggle["52"]["BorderSizePixel"] = 0;
				Toggle["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["52"]["ImageTransparency"] = 1;
				Toggle["52"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["52"]["Image"] = [[rbxassetid://13463182748]];
				Toggle["52"]["Size"] = UDim2.new(-0.6800000071525574, 0, 0.699999988079071, 0);
				Toggle["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["52"]["Name"] = [[Icon]];
				Toggle["52"]["BackgroundTransparency"] = 1;
				Toggle["52"]["Position"] = UDim2.new(0.476937860250473, 0, 0.5209807753562927, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.InactiveToggle.CheckmarkFrame.UICorner
				Toggle["53"] = Instance.new("UICorner", Toggle["51"]);
				Toggle["53"]["CornerRadius"] = UDim.new(0, 6);
			end

			-- Methods
			function Toggle:SetState(bool: boolean)
				if bool == nil then
					Toggle.state = not Toggle.state
				else
					Toggle.state = bool
				end

				if Toggle.state then
					Library:tween(Toggle['52'], {ImageTransparency = 0})
				else
					Library:tween(Toggle['52'], {ImageTransparency = 1})
				end

				options['Callback'](Toggle.state)
			end

			-- Logics
			do
				Toggle['4c'].MouseEnter:Connect(function()
					Toggle.hover = true
					Library:tween(Toggle['50'], {Color = Color3.fromRGB(180, 180, 180)})
				end)

				Toggle['4c'].MouseLeave:Connect(function()
					Toggle.hover = false

					if not Toggle.mouseDown then
						Library:tween(Toggle['50'], {Color = Color3.fromRGB(140, 140, 140)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.hover then
						Toggle.mouseDown = true
						Library:tween(Toggle['4c'], {BackgroundColor3 = Color3.fromRGB(170, 170, 170)})
						Library:tween(Toggle['50'], {Color = Color3.fromRGB(255, 255, 255)})
						Toggle:SetState()
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.mouseDown = false

						if Toggle.hover then
							Library:tween(Toggle['4c'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Toggle['50'], {Color = Color3.fromRGB(255, 255, 255)})
						else
							Library:tween(Toggle['4c'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Toggle['50'], {Color = Color3.fromRGB(140, 140, 140)})
						end
					end
				end)
			end

			return Toggle
		end

		function Tab:CreateDropdown(options)
			options = Library:Default({
				Name = 'Dropdowns',
				Info = 'This is an info',
				Items = {},
				Callback = function() end
			}, options or {})

			local Dropdown = {
				Items = {
					['id'] = {
						'value'
					}
				},
				hover = false,
				mouseDown = false
			}

			-- Render
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown
				Dropdown["37"] = Instance.new("Frame", Tab["1e"]);
				Dropdown["37"]["BorderSizePixel"] = 0;
				Dropdown["37"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Dropdown["37"]["Size"] = UDim2.new(0.9651046395301819, 0, 0.2450646311044693, 0);
				Dropdown["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["37"]["Position"] = UDim2.new(0.0222061425447464, 0, 0.47716599702835083, 0);
				Dropdown["37"]["Name"] = [[Dropdown]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.UICorner
				Dropdown["38"] = Instance.new("UICorner", Dropdown["37"]);
				Dropdown["38"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.DropdownName
				Dropdown["39"] = Instance.new("TextLabel", Dropdown["37"]);
				Dropdown["39"]["BorderSizePixel"] = 0;
				Dropdown["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["39"]["TextSize"] = 14;
				Dropdown["39"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Dropdown["39"]["Size"] = UDim2.new(1, 0, 0.15204761922359467, 0);
				Dropdown["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["39"]["Text"] = options['Name'];
				Dropdown["39"]["Name"] = options['Name'];
				Dropdown["39"]["BackgroundTransparency"] = 1;
				Dropdown["39"]["Position"] = UDim2.new(0.010084970854222775, 0, 0, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.DropdownName.UIPadding
				Dropdown["3a"] = Instance.new("UIPadding", Dropdown["39"]);
				Dropdown["3a"]["PaddingLeft"] = UDim.new(0, 9);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.UIStroke
				Dropdown["3b"] = Instance.new("UIStroke", Dropdown["37"]);
				Dropdown["3b"]["Color"] = Color3.fromRGB(140, 140, 140);
				Dropdown["3b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.DropdownInfo
				Dropdown["3c"] = Instance.new("TextLabel", Dropdown["37"]);
				Dropdown["3c"]["BorderSizePixel"] = 0;
				Dropdown["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["3c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["3c"]["TextSize"] = 10;
				Dropdown["3c"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Dropdown["3c"]["Size"] = UDim2.new(0.9555920362472534, 0, 0.14503636956214905, 0);
				Dropdown["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["3c"]["Text"] = options['Info'];
				Dropdown["3c"]["Name"] = [[DropdownInfo]];
				Dropdown["3c"]["BackgroundTransparency"] = 1;
				Dropdown["3c"]["Position"] = UDim2.new(0.043701231479644775, 0, 0.09114623069763184, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame
				Dropdown["3d"] = Instance.new("ScrollingFrame", Dropdown["37"]);
				Dropdown["3d"]["BorderSizePixel"] = 0;
				Dropdown["3d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
				Dropdown["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Dropdown["3d"]["Size"] = UDim2.new(1, 0, 0.763817310333252, 0);
				Dropdown["3d"]["Selectable"] = false;
				Dropdown["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["3d"]["ScrollBarThickness"] = 0;
				Dropdown["3d"]["Position"] = UDim2.new(0.5, 0, 0.6180921196937561, 0);
				Dropdown["3d"]["Name"] = [[OptionsFrame]];
				Dropdown["3d"]["SelectionGroup"] = false;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.UIListLayout
				Dropdown["3e"] = Instance.new("UIListLayout", Dropdown["3d"]);
				Dropdown["3e"]["Padding"] = UDim.new(0, 6);
				Dropdown["3e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.UIPadding
				Dropdown["43"] = Instance.new("UIPadding", Dropdown["3d"]);
				Dropdown["43"]["PaddingTop"] = UDim.new(0, 7);
				Dropdown["43"]["PaddingLeft"] = UDim.new(0, 5);
			end

			-- Methods
			function Dropdown:AddItem(id, val)
				local Item = {
					hover = false,
					mouseDown = false
				}

				if Dropdown.Items[id] ~= nil then
					return
				end

				Dropdown.Items[id] = {
					instance = {},
					value = val
				}
				Dropdown.Items[id].instance = {}
				Dropdown.Items[id].value = val
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.Option2
				Dropdown.Items[id].instance["44"] = Instance.new("Frame", Dropdown["3d"]);
				Dropdown.Items[id].instance["44"]["BorderSizePixel"] = 0;
				Dropdown.Items[id].instance["44"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
				Dropdown.Items[id].instance["44"]["Size"] = UDim2.new(0.98, 0, 0.098, 0);
				Dropdown.Items[id].instance["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown.Items[id].instance["44"]["Position"] = UDim2.new(0.01680818200111389, 0, 0.03671697527170181, 0);
				Dropdown.Items[id].instance["44"]["Name"] = [[Option2]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.Option2.UICorner
				Dropdown.Items[id].instance["45"] = Instance.new("UICorner", Dropdown.Items[id].instance['44']);
				Dropdown.Items[id].instance["45"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.Option2.UIStroke
				Dropdown.Items[id].instance["46"] = Instance.new("UIStroke", Dropdown.Items[id].instance['44']);
				Dropdown.Items[id].instance["46"]["Color"] = Color3.fromRGB(113, 113, 113);
				Dropdown.Items[id].instance["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Dropdown.OptionsFrame.Option2.TextLabel
				Dropdown.Items[id].instance["47"] = Instance.new("TextLabel", Dropdown.Items[id].instance['44']);
				Dropdown.Items[id].instance["47"]["BorderSizePixel"] = 0;
				Dropdown.Items[id].instance["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown.Items[id].instance["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown.Items[id].instance["47"]["TextSize"] = 14;
				Dropdown.Items[id].instance["47"]["TextColor3"] = Color3.fromRGB(219, 219, 219);
				Dropdown.Items[id].instance["47"]["Size"] = UDim2.new(1, 0, 1, 0);
				Dropdown.Items[id].instance["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown.Items[id].instance["47"]["Text"] = id;
				Dropdown.Items[id].instance["47"]["BackgroundTransparency"] = 1;

				-- Options Logic
				Dropdown.Items[id].instance["44"].MouseEnter:Connect(function()
					Item.hover = true
					Library:tween(Dropdown.Items[id].instance["46"], {Color = Color3.fromRGB(180, 180, 180)})
				end)

				Dropdown.Items[id].instance["44"].MouseLeave:Connect(function()
					Item.hover = false

					if not Item.mouseDown then
						Library:tween(Dropdown.Items[id].instance["46"], {Color = Color3.fromRGB(113, 113, 113)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.hover then
						
						if Dropdown.Items[id] == nil then return end
						
						Item.mouseDown = true
						Library:tween(Dropdown.Items[id].instance["44"], {BackgroundColor3 = Color3.fromRGB(170, 170, 170)})
						Library:tween(Dropdown.Items[id].instance["46"], {Color = Color3.fromRGB(255, 255, 255)})
						options.Callback(val)
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Item.mouseDown = false
						
						if Dropdown.Items[id] == nil then return end

						if Item.hover then
							Library:tween(Dropdown.Items[id].instance["44"], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Dropdown.Items[id].instance["46"], {Color = Color3.fromRGB(180, 180, 180)})
						else
							Library:tween(Dropdown.Items[id].instance["44"], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Dropdown.Items[id].instance["46"], {Color = Color3.fromRGB(113, 113, 113)})
						end
					end
				end)
			end

			function Dropdown:RemoveItem(id)
				if Dropdown.Items[id] ~= nil then
					if Dropdown.Items[id].instance ~= nil then
						for i, v in pairs(Dropdown.Items[id].instance) do
							v:Destroy()
						end
					end
					Dropdown.Items[id] = nil
				end
			end

			function Dropdown:SweepItems()
				for i, v in pairs(Dropdown.Items) do
					Dropdown.RemoveItem()
				end
			end

			-- Logics
			do
				Dropdown['37'].MouseEnter:Connect(function()
					Dropdown.hover = true
					Library:tween(Dropdown['3b'], {Color = Color3.fromRGB(180, 180, 180)})
				end)

				Dropdown['37'].MouseLeave:Connect(function()
					Dropdown.hover = false

					if not Dropdown.mouseDown then
						Library:tween(Dropdown['3b'], {Color = Color3.fromRGB(140, 140, 140)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.hover then
						Dropdown.mouseDown = true
						Library:tween(Dropdown['37'], {BackgroundColor3 = Color3.fromRGB(170, 170, 170)})
						Library:tween(Dropdown['3b'], {Color = Color3.fromRGB(255, 255, 255)})
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.mouseDown = false

						if Dropdown.hover then
							Library:tween(Dropdown['37'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Dropdown['3b'], {Color = Color3.fromRGB(180, 180, 180)})
						else
							Library:tween(Dropdown['37'], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
							Library:tween(Dropdown['3b'], {Color = Color3.fromRGB(140, 140, 140)})
						end
					end
				end)
			end

			return Dropdown
		end
		
		function Tab:CreateParagraph(options)
			options = Library:Default({
				Title = 'A paragraph',
				Content = 'This is a content for the paragraph. I don\'t know if this will rescale, but I hope it would.'
			}, options or {})
			
			local Paragraph = {}
			
			-- Render
			do
				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph
				Paragraph["54"] = Instance.new("Frame", Tab["1e"]);
				Paragraph["54"]["BorderSizePixel"] = 0;
				Paragraph["54"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Paragraph["54"]["Size"] = UDim2.new(0.9651045799255371, 0, 0.06136682257056236, 0);
				Paragraph["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Paragraph["54"]["Position"] = UDim2.new(0.022082891315221786, 0, 0.2895769476890564, 0);
				Paragraph["54"]["Name"] = [[Paragraph]];

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.UICorner
				Paragraph["55"] = Instance.new("UICorner", Paragraph["54"]);
				Paragraph["55"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.Paragraphname
				Paragraph["56"] = Instance.new("TextLabel", Paragraph["54"]);
				Paragraph["56"]["BorderSizePixel"] = 0;
				Paragraph["56"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Paragraph["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Paragraph["56"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Paragraph["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Paragraph["56"]["TextSize"] = 14;
				Paragraph["56"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Paragraph["56"]["Size"] = UDim2.new(1.0099996328353882, 0, 0.15204761922359467, 0);
				Paragraph["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Paragraph["56"]["Text"] = options.Title;
				Paragraph["56"]["Name"] = [[Paragraphname]];
				Paragraph["56"]["BackgroundTransparency"] = 1;
				Paragraph["56"]["Position"] = UDim2.new(3.060220876704989e-07, 0, 0, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.Paragraphname.UIPadding
				Paragraph["57"] = Instance.new("UIPadding", Paragraph["56"]);
				Paragraph["57"]["PaddingLeft"] = UDim.new(0, 9);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.UIStroke
				Paragraph["58"] = Instance.new("UIStroke", Paragraph["54"]);
				Paragraph["58"]["Color"] = Color3.fromRGB(140, 140, 140);
				Paragraph["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.Content
				Paragraph["59"] = Instance.new("TextLabel", Paragraph["54"]);
				Paragraph["59"]["BorderSizePixel"] = 0;
				Paragraph["59"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Paragraph["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Paragraph["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Paragraph["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Paragraph["59"]["TextSize"] = 10;
				Paragraph["59"]["TextColor3"] = Color3.fromRGB(210, 210, 210);
				Paragraph["59"]["Size"] = UDim2.new(0.9992930889129639, 0, 1.0000005960464478, 0);
				Paragraph["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Paragraph["59"]["Text"] = options.Content;
				Paragraph["59"]['TextWrapped'] = true;
				Paragraph["59"]["Name"] = [[Content]];
				Paragraph["59"]["BackgroundTransparency"] = 1;
				Paragraph["59"]["Position"] = UDim2.new(3.060220876704989e-07, 0, -3.172679328145023e-07, 0);

				-- StarterGui.CynnFul Task.MainFrame.Navigate.ContentContainer.HomeTab.Paragraph.Content.UIPadding
				Paragraph["5a"] = Instance.new("UIPadding", Paragraph["59"]);
				Paragraph["5a"]["PaddingTop"] = UDim.new(0, 20);
				Paragraph["5a"]["PaddingLeft"] = UDim.new(0, 9);
			end
			
			-- Methods
			function Paragraph:SetContent(content)
				options.Content = content
				Paragraph:__update()
			end
			
			function Paragraph:SetTitle(title)
				options.Title = title
				Paragraph:__update()
			end
			
			function Paragraph:__update()
				Paragraph['56']['Text'] = options.Title
				Paragraph['59']['Text'] = options.Content
				
				Paragraph['59']['Size'] = UDim2.new(Paragraph['59'].Size.X.Scale, Paragraph['59'].Size.X.Offset, 0, math.huge)
				Paragraph['59']['Size'] = UDim2.new(Paragraph['59'].Size.X.Scale, Paragraph['59'].Size.X.Offset, 0, Paragraph['59'].TextBounds.Y)
				Library:tween(Paragraph['54'], {Size = UDim2.new(Paragraph['54'].Size.X.Scale, Paragraph['59'].Size.X.Offset, 0, Paragraph['59'].TextBounds.Y + 20)})
			end
			
			Paragraph:__update()
			
			return Paragraph
		end

		return Tab
	end

	return GUI
end

return Library
