local coreGui = game:GetService('CoreGui')
local runService = game:GetService('RunService')
local tweenService = game:GetService('TweenService')
local uis = game:GetService('UserInputService')
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize

if runService:IsStudio() and coreGui:FindFirstChild('Atomic') then
	player.PlayerGui.Atomic:Destroy()
else
	coreGui.Atomic:Destroy()
end

local function Tween(obj: instance, goal)
	local info = TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	tweenService:Create(obj, info, goal):Play()
end

local function validate(default, Settings)
	for i, v in pairs(default) do
		if Settings[i] == nil then
			Settings[i] = v
		end
	end
	return Settings
end

local Atomic = {}

function Atomic:StartAsset(Settings)
	Settings = validate({
		Title = 'Atomic UI',
		UIController_Frame = true,
		UIController_Keybind = false,
		OpenCloseKeybind = Enum.KeyCode.BackSlash,
		OpeningAnimation = true
	}, Settings or {})
	
	local UI = {}
	
	-- Main Frame
	do
		-- StarterGui.Atomic
		UI['1'] = Instance.new('ScreenGui', runService:IsStudio() and player:WaitForChild('PlayerGui') or coreGui);
		UI['1']['IgnoreGuiInset'] = true;
		UI['1']['DisplayOrder'] = 1000;
		UI['1']['Enabled'] = true;
		UI['1']['ScreenInsets'] = Enum.ScreenInsets.DeviceSafeInsets;
		UI['1']['Name'] = 'Atomic';
		UI['1']['ZIndexBehavior'] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.Atomic.Main
		UI['2'] = Instance.new('Frame', UI['1']);
		UI['2']['BorderSizePixel'] = 0;
		UI['2']['BackgroundColor3'] = Color3.fromRGB(46, 46, 46);
		UI['2']['AnchorPoint'] = Vector2.new(0.5, 0.5);
		UI['2']['BackgroundTransparency'] = 0.20000000298023224;
		UI['2']['Size'] = UDim2.new(0.6617020964622498, 0, 0.7290321588516235, 0);
		UI['2']['ClipsDescendants'] = true;
		UI['2']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['2']['Position'] = UDim2.new(0.4990749657154083, 0, 0.4999999403953552, 0);
		UI['2']['Name'] = 'Main';

		-- StarterGui.Atomic.Main.Shadow
		UI['3'] = Instance.new('Frame', UI['2']);
		UI['3']['ZIndex'] = 0;
		UI['3']['BorderSizePixel'] = 0;
		UI['3']['BackgroundTransparency'] = 1;
		UI['3']['Size'] = UDim2.new(1, 0, 1, 0);
		UI['3']['Name'] = 'Shadow';

		-- StarterGui.Atomic.Main.Shadow.ShadowImage
		UI['4'] = Instance.new('ImageLabel', UI['3']);
		UI['4']['ZIndex'] = 0;
		UI['4']['BorderSizePixel'] = 0;
		UI['4']['SliceCenter'] = Rect.new(49, 49, 450, 450);
		UI['4']['ScaleType'] = Enum.ScaleType.Slice;
		UI['4']['ImageColor3'] = Color3.fromRGB(0, 0, 0);
		UI['4']['ImageTransparency'] = 0.5;
		UI['4']['AnchorPoint'] = Vector2.new(0.5, 0.5);
		UI['4']['Image'] = 'rbxassetid://6014261993';
		UI['4']['Size'] = UDim2.new(1, 47, 1, 47);
		UI['4']['Name'] = 'ShadowImage';
		UI['4']['BackgroundTransparency'] = 1;
		UI['4']['Position'] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.Atomic.Main.ContentContainer
		UI['6'] = Instance.new('Frame', UI['2']);
		UI['6']['BorderSizePixel'] = 0;
		UI['6']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['6']['BackgroundTransparency'] = 1;
		UI['6']['Size'] = UDim2.new(0.7522954940795898, 0, 0.8893805146217346, 0);
		UI['6']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['6']['Position'] = UDim2.new(0.20000004768371582, 0, 0.05999999865889549, 0);
		UI['6']['Name'] = 'ContentContainer';
		
		-- StarterGui.Atomic.Main.UICorner
		UI['5e'] = Instance.new('UICorner', UI['2']);
		
		-- StarterGui.Atomic.Main.MainTitle
		UI['5f'] = Instance.new('TextLabel', UI['1']);
		UI['5f']['BorderSizePixel'] = 0;
		UI['5f']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['5f']['TextXAlignment'] = Enum.TextXAlignment.Left;
		UI['5f']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		UI['5f']['TextSize'] = 20;
		UI['5f']['TextColor3'] = Color3.fromRGB(255, 255, 255);
		UI['5f']['Size'] = UDim2.new(0.662, 0, 0.065, 0);
		UI['5f']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['5f']['Text'] = Settings.Title;
		UI['5f']['Name'] = 'MainTitle';
		UI['5f']['BackgroundTransparency'] = 1;
		UI['5f']['Position'] = UDim2.new(0.168, 0, 0.863, 0);

		-- StarterGui.Atomic.Main.CurrentTab
		UI['60'] = Instance.new('TextLabel', UI['2']);
		UI['60']['BorderSizePixel'] = 0;
		UI['60']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['60']['TextXAlignment'] = Enum.TextXAlignment.Left;
		UI['60']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		UI['60']['TextSize'] = 14;
		UI['60']['TextColor3'] = Color3.fromRGB(255, 255, 255);
		UI['60']['Size'] = UDim2.new(0, 527, 0, 20);
		UI['60']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['60']['Text'] = 'Current Tab: None';
		UI['60']['Name'] = 'CurrentTab';
		UI['60']['BackgroundTransparency'] = 1;
		UI['60']['Position'] = UDim2.new(0.19457145035266876, 0, 0, 5);

		-- StarterGui.Atomic.Main.CurrentTab.UIPadding
		UI['61'] = Instance.new('UIPadding', UI['60']);
		UI['61']['PaddingLeft'] = UDim.new(0, 10);
		
		-- StarterGui.Atomic.Main.ContentContainer.UIPageLayout
		UI['54'] = Instance.new('UIPageLayout', UI['6']);
		UI['54']['HorizontalAlignment'] = Enum.HorizontalAlignment.Center;
		UI['54']['Circular'] = true;
		UI['54']['EasingStyle'] = Enum.EasingStyle.Quad;
		UI['54']['SortOrder'] = Enum.SortOrder.LayoutOrder;
		UI['54']['TweenTime'] = .5;
		
		-- StarterGui.Atomic.NotificationHolder
		UI['66'] = Instance.new('Frame', UI['1']);
		UI['66']['BorderSizePixel'] = 0;
		UI['66']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['66']['BackgroundTransparency'] = 1;
		UI['66']['Size'] = UDim2.new(0.37940630316734314, 0, 0.9999998807907104, 0);
		UI['66']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['66']['Position'] = UDim2.new(0.3246753513813019, 0, -0.0032257079146802425, 0);
		UI['66']['Name'] = 'NotificationHolder';
		UI['66']['ZIndex'] = 4;
		
		-- StarterGui.Atomic.NotificationHolder.UIListLayout
		UI['67'] = Instance.new('UIListLayout', UI['66']);
		UI['67']['VerticalAlignment'] = Enum.VerticalAlignment.Bottom;
		UI['67']['Padding'] = UDim.new(0, 10);
		UI['67']['SortOrder'] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.Atomic.NotificationHolder.UIPadding
		UI['68'] = Instance.new('UIPadding', UI['66']);
		UI['68']['PaddingBottom'] = UDim.new(0, 10);
		
		if Settings.UIController_Frame then
			do
				-- StarterGui.Atomic.Controller
				UI['62'] = Instance.new('Frame', UI['1']);
				UI['62']['BorderSizePixel'] = 0;
				UI['62']['BackgroundColor3'] = Color3.fromRGB(27, 27, 27);
				UI['62']['Size'] = UDim2.new(0.0969935804605484, 0, 0.7258065342903137, 0);
				UI['62']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				UI['62']['Position'] = UDim2.new(0.05900000035762787, 0, 0.135, 0);
				UI['62']['Name'] = 'Controller';

				-- StarterGui.Atomic.Controller.UICorner
				UI['63'] = Instance.new('UICorner', UI['62']);
				UI['63']['CornerRadius'] = UDim.new(0, 20);

				-- StarterGui.Atomic.Controller.Close
				UI['64'] = Instance.new('TextLabel', UI['62']);
				UI['64']['BorderSizePixel'] = 0;
				UI['64']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				UI['64']['FontFace'] = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				UI['64']['TextSize'] = 30;
				UI['64']['TextColor3'] = Color3.fromRGB(255, 255, 255);
				UI['64']['Size'] = UDim2.new(1.0000001192092896, 0, 0.13333338499069214, 0);
				UI['64']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				UI['64']['Text'] = 'Close';
				UI['64']['Name'] = 'Close';
				UI['64']['BackgroundTransparency'] = 1;
				UI['64']['Position'] = UDim2.new(0, 0, 0.040000028908252716, 0);

				-- StarterGui.Atomic.Controller.Minimize
				UI['65'] = Instance.new('TextLabel', UI['62']);
				UI['65']['BorderSizePixel'] = 0;
				UI['65']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				UI['65']['FontFace'] = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				UI['65']['TextSize'] = 27;
				UI['65']['TextColor3'] = Color3.fromRGB(255, 255, 255);
				UI['65']['Size'] = UDim2.new(1.0000001192092896, 0, 0.13333338499069214, 0);
				UI['65']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				UI['65']['Text'] = 'Minimize';
				UI['65']['Name'] = 'Minimize';
				UI['65']['BackgroundTransparency'] = 1;
				UI['65']['Position'] = UDim2.new(-0.009537428617477417, 0, 0.20000001788139343, 0);
			end
			
			-- Logics
			do
				local closeHover, minimizedHover, minimized = false, false, false
				
				UI['64'].MouseEnter:Connect(function()
					closeHover = true
				end)
				
				UI['64'].MouseLeave:Connect(function()
					closeHover = false
				end)
				
				UI['65'].MouseEnter:Connect(function()
					minimizedHover = true
				end)
				
				UI['65'].MouseLeave:Connect(function()
					minimizedHover = false
				end)
				
				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if closeHover then
							UI['1']:Destroy()
						elseif minimizedHover and not minimized then
							Tween(UI['62'], {Position = UDim2.new(0.059, 0, -0.74, 0)})
							Tween(UI['2'], {Position = UDim2.new(0.499, 0, -0.4, 0)})
							Tween(UI['5f'], {TextTransparency = 1})
							minimized = true
						end
					end
				end)
				
				uis.InputBegan:Connect(function(i)
					if i.KeyCode == Settings.OpenCloseKeybind and minimized then
						Tween(UI['62'], {Position = UDim2.new(0.059, 0, 0.135, 0)})
						Tween(UI['2'], {Position = UDim2.new(0.499, 0, 0.5, 0)})
						Tween(UI['5f'], {TextTransparency = 0})
						minimized = false
					end
				end)
			end
		end
	end
	
	-- Tab Holder
	do
		-- StarterGui.Atomic.Main.TabList
		UI['55'] = Instance.new('Frame', UI['2']);
		UI['55']['ZIndex'] = 10;
		UI['55']['BorderSizePixel'] = 0;
		UI['55']['BackgroundColor3'] = Color3.fromRGB(49, 49, 49);
		UI['55']['Size'] = UDim2.new(0.14082396030426025, 0, 1.000000238418579, 0);
		UI['55']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['55']['Position'] = UDim2.new(4.270353315405373e-08, 0, -1.687919422010964e-07, 0);
		UI['55']['Name'] = 'TabList';

		-- StarterGui.Atomic.Main.TabList.Line
		UI['56'] = Instance.new('Frame', UI['55']);
		UI['56']['BorderSizePixel'] = 0;
		UI['56']['BackgroundColor3'] = Color3.fromRGB(101, 101, 101);
		UI['56']['Size'] = UDim2.new(0, 1, 1, 0);
		UI['56']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['56']['Position'] = UDim2.new(0, 100, 0, 0);
		UI['56']['Name'] = 'Line';

		-- StarterGui.Atomic.Main.TabList.ButtonHolder
		UI['57'] = Instance.new('ScrollingFrame', UI['55']);
		UI['57']['ZIndex'] = 9;
		UI['57']['BorderSizePixel'] = 0;
		UI['57']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['57']['BackgroundTransparency'] = 1;
		UI['57']['Size'] = UDim2.new(1, 0, 0.7638269066810608, 0);
		UI['57']['ScrollBarImageColor3'] = Color3.fromRGB(0, 0, 0);
		UI['57']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['57']['ScrollBarThickness'] = 0;
		UI['57']['Position'] = UDim2.new(0, 0, 0.23617327213287354, 0);
		UI['57']['Name'] = 'ButtonHolder';
		
		-- StarterGui.Atomic.Main.TabList.UICorner
		UI['5b'] = Instance.new('UICorner', UI['55']);

		-- StarterGui.Atomic.Main.TabList.HideFrame1
		UI['5c'] = Instance.new('Frame', UI['55']);
		UI['5c']['BorderSizePixel'] = 0;
		UI['5c']['BackgroundColor3'] = Color3.fromRGB(49, 49, 49);
		UI['5c']['Size'] = UDim2.new(0, 50, 0, 450);
		UI['5c']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['5c']['Position'] = UDim2.new(0.5, 0, 0, 0);
		UI['5c']['Name'] = 'HideFrame1';

		-- StarterGui.Atomic.Main.TabList.Atomic_Icon
		UI['5d'] = Instance.new('ImageLabel', UI['55']);
		UI['5d']['BorderSizePixel'] = 0;
		UI['5d']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		UI['5d']['Image'] = 'rbxassetid://14048616555';
		UI['5d']['Size'] = UDim2.new(0.9340390563011169, 0, 0.22511115670204163, 0);
		UI['5d']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		UI['5d']['Name'] = 'Atomic_Icon';
		UI['5d']['BackgroundTransparency'] = 1;
		UI['5d']['Position'] = UDim2.new(0.0695561021566391, 0, 0.011062097735702991, 0);
		
		-- StarterGui.Atomic.Main.TabList.ButtonHolder.UIListLayout
		UI['5a'] = Instance.new('UIListLayout', UI['57']);
		UI['5a']['HorizontalAlignment'] = Enum.HorizontalAlignment.Center;
		UI['5a']['Padding'] = UDim.new(0, 30);
		UI['5a']['SortOrder'] = Enum.SortOrder.LayoutOrder;
	end
	
	function UI:Notify(Settings)
		Settings = validate({
			Title = 'Notification Title',
			Content = 'Your notification content is placed here to let u know about the thing why would u notify the user with this thing yk i dont rly like ur ass gettin on my property bitch!',
			Duration = 3
		}, Settings or {})
		
		local Notif = {}
		
		-- StarterGui.Atomic.NotificationHolder.Notification
		Notif['69'] = Instance.new('Frame', UI['66']);
		Notif['69']['BorderSizePixel'] = 0;
		Notif['69']['BackgroundColor3'] = Color3.fromRGB(70, 70, 70);
		Notif['69']['Size'] = UDim2.new(1, 0, 0.232, 0);
		Notif['69']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		Notif['69']['Position'] = UDim2.new(0, 0, 0.7677419185638428, 0);
		Notif['69']['Name'] = [[Notification]];

		-- StarterGui.Atomic.NotificationHolder.Notification.UICorner
		Notif['6a'] = Instance.new('UICorner', Notif['69']);

		-- StarterGui.Atomic.NotificationHolder.Notification.Shadow
		Notif['6b'] = Instance.new('Frame', Notif['69']);
		Notif['6b']['ZIndex'] = 0;
		Notif['6b']['BorderSizePixel'] = 0;
		Notif['6b']['BackgroundTransparency'] = 1;
		Notif['6b']['Size'] = UDim2.new(1, 0, 1, 0);
		Notif['6b']['Name'] = [[Shadow]];

		-- Players.CimakoGaming.PlayerGui.Atomic.NotificationHolder.Notification.Shadow.ShadowImage
		Notif["1e"] = Instance.new("ImageLabel", Notif["6b"]);
		Notif["1e"]["ZIndex"] = 0;
		Notif["1e"]["BorderSizePixel"] = 0;
		Notif["1e"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		Notif["1e"]["ScaleType"] = Enum.ScaleType.Slice;
		Notif["1e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		Notif["1e"]["ImageTransparency"] = 0.5;
		Notif["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Notif["1e"]["Image"] = [[rbxassetid://6014261993]];
		Notif["1e"]["Size"] = UDim2.new(1, 47, 1, 47);
		Notif["1e"]["Name"] = [[ShadowImage]];
		Notif["1e"]["BackgroundTransparency"] = 1;
		Notif["1e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.Atomic.NotificationHolder.Notification.UIGradient
		Notif['6d'] = Instance.new('UIGradient', Notif['69']);
		Notif['6d']['Rotation'] = 45;
		Notif['6d']['Color'] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(114, 114, 114)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(178, 178, 178))};
		Notif['6d']['Offset'] = Vector2.new(0, 1);

		-- StarterGui.Atomic.NotificationHolder.Notification.Title
		Notif['6e'] = Instance.new('TextLabel', Notif['69']);
		Notif['6e']['BorderSizePixel'] = 0;
		Notif['6e']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		Notif['6e']['TextXAlignment'] = Enum.TextXAlignment.Left;
		Notif['6e']['FontFace'] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Notif['6e']['TextSize'] = 18;
		Notif['6e']['TextColor3'] = Color3.fromRGB(214, 214, 214);
		Notif['6e']['Size'] = UDim2.new(1, 0, 0.2915949523448944, 0);
		Notif['6e']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		Notif['6e']['Text'] = Settings.Title;
		Notif['6e']['Name'] = [[Title]];
		Notif['6e']['BackgroundTransparency'] = 1;

		-- StarterGui.Atomic.NotificationHolder.Notification.Title.UIPadding
		Notif['6f'] = Instance.new('UIPadding', Notif['6e']);
		Notif['6f']['PaddingLeft'] = UDim.new(0, 10);

		-- StarterGui.Atomic.NotificationHolder.Notification.Content
		Notif['70'] = Instance.new('TextLabel', Notif['69']);
		Notif['70']['TextWrapped'] = true;
		Notif['70']['BorderSizePixel'] = 0;
		Notif['70']['TextYAlignment'] = Enum.TextYAlignment.Top;
		Notif['70']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
		Notif['70']['TextXAlignment'] = Enum.TextXAlignment.Left;
		Notif['70']['FontFace'] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Notif['70']['TextSize'] = 18;
		Notif['70']['TextColor3'] = Color3.fromRGB(214, 214, 214);
		Notif['70']['Size'] = UDim2.new(1, 0, 0.7084052562713623, 0);
		Notif['70']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
		Notif['70']['Text'] = Settings.Content;
		Notif['70']['Name'] = [[Content]];
		Notif['70']['BackgroundTransparency'] = 1;
		Notif['70']['Position'] = UDim2.new(0, 0, 0.29159465432167053, 0);

		-- StarterGui.Atomic.NotificationHolder.Notification.Content.UIPadding
		Notif['71'] = Instance.new('UIPadding', Notif['70']);
		Notif['71']['PaddingLeft'] = UDim.new(0, 10);
		
		do
			local function tween(obj, goal, callback)
				local info = TweenInfo.new(.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
				local tween = tweenService:Create(obj, info, goal)
				tween.Completed:Connect(callback or function() end)
				tween:Play()
			end
			
			-- Configs
			Notif['69'].BackgroundTransparency = 1
			Notif['1e'].ImageTransparency = 1
			Notif['6e'].TextTransparency = 1
			Notif['70'].TextTransparency = 1
			
			-- Tweening
			tween(Notif['69'], {BackgroundTransparency = 0})
			tween(Notif['1e'], {ImageTransparency = .5})
			tween(Notif['6e'], {TextTransparency = 0})
			tween(Notif['70'], {TextTransparency = 0})
			
			task.wait(Settings.Duration)
			
			tween(Notif['69'], {BackgroundTransparency = 1})
			tween(Notif['1e'], {ImageTransparency = 1})
			tween(Notif['6e'], {TextTransparency = 1})
			tween(Notif['70'], {TextTransparency = 1}, function()
				Notif['69']:Destroy()
			end)	
		end
		
		return Notif
	end
	
	local firstTab = nil
	
	function UI:PlaceTab(Name, Image)
		
		if firstTab == nil then
			firstTab = Name
			UI['60'].Text = 'Current Tab: '.. firstTab
		else
			firstTab = ''
		end
		
		if not Image or Image == nil or typeof(Image) ~= 'number' then
			Image = 'rbxassetid://'
		else
			Image = 'rbxassetid://'.. Image
		end
		
		local Tab = {
			Hover = false
		}
		
		-- Render
		do
			-- StarterGui.Atomic.Main.TabList.ButtonHolder.InactiveTab
			Tab['59'] = Instance.new('ImageLabel', UI['57']);
			Tab['59']['BorderSizePixel'] = 0;
			Tab['59']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
			Tab['59']['ImageColor3'] = Color3.fromRGB(100, 100, 100);
			Tab['59']['Image'] = 'rbxassetid://13459295387';
			Tab['59']['Size'] = UDim2.new(0.550000011920929, 0, 0.06983932852745056, 0);
			Tab['59']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
			Tab['59']['Name'] = Name;
			Tab['59']['BackgroundTransparency'] = 1;
			Tab['59']['Position'] = UDim2.new(0.22499999403953552, 0, 0.3892035484313965, 0);
			
			-- StarterGui.Atomic.Main.ContentContainer.ElementContainer
			Tab['7'] = Instance.new('ScrollingFrame', UI['6']);
			Tab['7']['Active'] = true;
			Tab['7']['BorderSizePixel'] = 0;
			Tab['7']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
			Tab['7']['BackgroundTransparency'] = 1;
			Tab['7']['Size'] = UDim2.new(1, 0, 1, 0);
			Tab['7']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
			Tab['7']['ScrollBarThickness'] = 0;
			Tab['7']['Name'] = 'Container of '.. Name;

			-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.UIListLayout
			Tab['8'] = Instance.new('UIListLayout', Tab['7']);
			Tab['8']['HorizontalAlignment'] = Enum.HorizontalAlignment.Center;
			Tab['8']['Padding'] = UDim.new(0, 10);
			Tab['8']['SortOrder'] = Enum.SortOrder.LayoutOrder;
			
			-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.UIPadding
			Tab['10'] = Instance.new('UIPadding', Tab['7']);
			Tab['10']['PaddingTop'] = UDim.new(0, 1);
		end
		
		-- Logics
		do
			Tab['59'].MouseEnter:Connect(function()
				Tab.Hover = true
				
				Tween(Tab['59'], {ImageColor3 = Color3.fromRGB(150, 150, 150)})
			end)
			
			Tab['59'].MouseLeave:Connect(function()
				Tab.Hover = false

				Tween(Tab['59'], {ImageColor3 = Color3.fromRGB(100, 100, 100)})
			end)
			
			uis.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						UI['60'].Text = 'Current Tab: '.. Name
						UI['54']:JumpTo(Tab['7'])
						UI['54'].PageEnter:Wait()
					end
				end
			end)
		end
		
		function Tab:DefineButton(Settings)
			Settings = validate({
				Name = 'Button',
				Interact = 'Click me to do something',
				Callback = function() end
			}, Settings or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button
				Button['9'] = Instance.new('Frame', Tab['7']);
				Button['9']['BorderSizePixel'] = 0;
				Button['9']['BackgroundColor3'] = Color3.fromRGB(53, 53, 53);
				Button['9']['Size'] = UDim2.new(1, -10, 0.05046733096241951, 0);
				Button['9']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Button['9']['Position'] = UDim2.new(0.009291660971939564, 0, 0.002487562596797943, 0);
				Button['9']['Name'] = 'Button';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.UIStroke
				Button['a'] = Instance.new('UIStroke', Button['9']);
				Button['a']['Color'] = Color3.fromRGB(117, 117, 117);
				Button['a']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.UICorner
				Button['b'] = Instance.new('UICorner', Button['9']);
				Button['b']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.Title
				Button['c'] = Instance.new('TextLabel', Button['9']);
				Button['c']['BorderSizePixel'] = 0;
				Button['c']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Button['c']['TextXAlignment'] = Enum.TextXAlignment.Left;
				Button['c']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button['c']['TextSize'] = 16;
				Button['c']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Button['c']['Size'] = UDim2.new(1, 0, 1, 0);
				Button['c']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Button['c']['Text'] = Settings.Name;
				Button['c']['Name'] = 'Title';
				Button['c']['TextYAlignment'] = Enum.TextYAlignment.Center
				Button['c']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.Title.UIPadding
				Button['d'] = Instance.new('UIPadding', Button['c']);
				Button['d']['PaddingLeft'] = UDim.new(0, 15);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.Title.Interact
				Button['e'] = Instance.new('TextLabel', Button['c']);
				Button['e']['BorderSizePixel'] = 0;
				Button['e']['TextYAlignment'] = Enum.TextYAlignment.Center;
				Button['e']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Button['e']['TextXAlignment'] = Enum.TextXAlignment.Right;
				Button['e']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button['e']['TextSize'] = 17;
				Button['e']['TextColor3'] = Color3.fromRGB(75, 75, 75);
				Button['e']['Size'] = UDim2.new(1, 0, 1, 0);
				Button['e']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Button['e']['Text'] = Settings.Interact;
				Button['e']['Name'] = 'Interact';
				Button['e']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Button.Title.Interact.UIPadding
				Button['f'] = Instance.new('UIPadding', Button['e']);
				Button['f']['PaddingRight'] = UDim.new(0, 15);
			end
			
			-- Methods
			function Button:Update(arg, bool)
				if typeof(arg) == 'string' and bool == false then
					Settings.Name = arg
					Button['c'].Text = arg
				elseif typeof(arg) == 'string' and bool == true then
					Settings.Interact = arg
					Button['e'].Text = arg
				elseif typeof(arg) == 'function' and bool == nil then
					Settings.Callback = arg
				elseif typeof(arg) == 'function' and bool ~= nil then
					error(Settings.Name ..' button error, second argument must be nil!')
				end
			end
			
			-- Logics
			do
				Button['9'].MouseEnter:Connect(function()
					Button.Hover = true
					
					Tween(Button['a'], {Color = Color3.fromRGB(171, 171, 171)})
					Tween(Button['e'], {TextColor3 = Color3.fromRGB(100, 100, 100)})
				end)
				
				Button['9'].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Tween(Button['a'], {Color = Color3.fromRGB(117, 117, 117)})
						Tween(Button['e'], {TextColor3 = Color3.fromRGB(75, 75, 75)})
					end
				end)
				
				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						
						Tween(Button['9'], {BackgroundColor3 = Color3.fromRGB(75, 75, 75)})
						Tween(Button['a'], {Color = Color3.fromRGB(255, 255, 255)})
						Tween(Button['e'], {TextColor3 = Color3.fromRGB(150, 150,150)})
						
						Settings.Callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							Tween(Button['9'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Button['a'], {Color = Color3.fromRGB(171, 171, 171)})
							Tween(Button['e'], {TextColor3 = Color3.fromRGB(100, 100, 100)})
						else
							Tween(Button['9'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Button['a'], {Color = Color3.fromRGB(117, 117, 117)})
							Tween(Button['e'], {TextColor3 = Color3.fromRGB(75, 75, 75)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:DefineSlider(Settings)
			Settings = validate({
				Name = 'Slider',
				Min = 16,
				Max = 50,
				FirstValue = 16,
				Callback = function() end
			}, Settings or {})
			
			local Slider = {
				Hover = false,
				MouseDown = false,
				Connection = nil
			}
			
			-- Render
			do
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider
				Slider['33'] = Instance.new('Frame', Tab['7']);
				Slider['33']['BorderSizePixel'] = 0;
				Slider['33']['BackgroundColor3'] = Color3.fromRGB(53, 53, 53);
				Slider['33']['Size'] = UDim2.new(1, -10, 0.06770573556423187, 0);
				Slider['33']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Slider['33']['Position'] = UDim2.new(0.009291660971939564, 0, 0.7618784308433533, 0);
				Slider['33']['Name'] = 'Slider';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.UIStroke
				Slider['34'] = Instance.new('UIStroke', Slider['33']);
				Slider['34']['Color'] = Color3.fromRGB(117, 117, 117);
				Slider['34']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.UICorner
				Slider['35'] = Instance.new('UICorner', Slider['33']);
				Slider['35']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.Title
				Slider['36'] = Instance.new('TextLabel', Slider['33']);
				Slider['36']['BorderSizePixel'] = 0;
				Slider['36']['TextYAlignment'] = Enum.TextYAlignment.Top;
				Slider['36']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Slider['36']['TextXAlignment'] = Enum.TextXAlignment.Left;
				Slider['36']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider['36']['TextSize'] = 16;
				Slider['36']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Slider['36']['Size'] = UDim2.new(1, 0, 1, 0);
				Slider['36']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Slider['36']['Text'] = Settings.Name;
				Slider['36']['Name'] = 'Title';
				Slider['36']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.Title.UIPadding
				Slider['37'] = Instance.new('UIPadding', Slider['36']);
				Slider['37']['PaddingTop'] = UDim.new(0, 11);
				Slider['37']['PaddingLeft'] = UDim.new(0, 15);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.ProgressFrame
				Slider['38'] = Instance.new('Frame', Slider['33']);
				Slider['38']['BorderSizePixel'] = 0;
				Slider['38']['BackgroundColor3'] = Color3.fromRGB(37, 37, 37);
				Slider['38']['Size'] = UDim2.new(0.9727690815925598, 0, 0.181779146194458, 0);
				Slider['38']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Slider['38']['Position'] = UDim2.new(0.013461604714393616, 0, 0.656479001045227, 0);
				Slider['38']['Name'] = 'ProgressFrame';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.ProgressFrame.UICorner
				Slider['39'] = Instance.new('UICorner', Slider['38']);
				Slider['39']['CornerRadius'] = UDim.new(0, 100);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.ProgressFrame.UIStroke
				Slider['3a'] = Instance.new('UIStroke', Slider['38']);
				Slider['3a']['Color'] = Color3.fromRGB(103, 103, 103);
				Slider['3a']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.ProgressFrame.Level
				Slider['3b'] = Instance.new('Frame', Slider['38']);
				Slider['3b']['BorderSizePixel'] = 0;
				Slider['3b']['BackgroundColor3'] = Color3.fromRGB(82, 82, 82);
				Slider['3b']['Size'] = UDim2.new(0.23493602871894836, 0, 1.0000001192092896, 0);
				Slider['3b']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Slider['3b']['Name'] = 'Level';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.ProgressFrame.Level.UICorner
				Slider['3c'] = Instance.new('UICorner', Slider['3b']);
				Slider['3c']['CornerRadius'] = UDim.new(0, 100);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.Value
				Slider['3d'] = Instance.new('TextLabel', Slider['33']);
				Slider['3d']['BorderSizePixel'] = 0;
				Slider['3d']['TextYAlignment'] = Enum.TextYAlignment.Top;
				Slider['3d']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Slider['3d']['TextXAlignment'] = Enum.TextXAlignment.Right;
				Slider['3d']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider['3d']['TextSize'] = 16;
				Slider['3d']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Slider['3d']['Size'] = UDim2.new(1, 0, 1, 0);
				Slider['3d']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Slider['3d']['Text'] = Settings.FirstValue;
				Slider['3d']['Name'] = 'Value';
				Slider['3d']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Slider.Value.UIPadding
				Slider['3e'] = Instance.new('UIPadding', Slider['3d']);
				Slider['3e']['PaddingTop'] = UDim.new(0, 11);
				Slider['3e']['PaddingRight'] = UDim.new(0, 50);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider['33'].AbsolutePosition.X) / (Slider['33'].AbsoluteSize.X), 0, 1)
					local value = math.floor(((Settings.Max - Settings.Min) * percentage) + Settings.Min)
					
					Slider['3d'].Text = tostring(value)
					Slider['3b'].Size = UDim2.fromScale(percentage, 1)
				else
					Slider['3d'].Text = tostring(v)
					Slider['3b'].Size = UDim2.fromScale(((v - Settings.Min) / (Settings.Max - Settings.Min)), 1)
				end
				
				Settings.Callback(Slider:RetrieveValue())
			end
			
			function Slider:RetrieveValue()
				return tonumber(Slider['3d'].Text)
			end
			
			-- Logics
			do
				Slider['33'].MouseEnter:Connect(function()
					Slider.Hover = true
					
					Tween(Slider['34'], {Color = Color3.fromRGB(171, 171, 171)})
					Tween(Slider['3a'], {Color = Color3.fromRGB(150, 150, 150)})
					Tween(Slider['3b'], {BackgroundColor3 = Color3.fromRGB(120, 120, 120)})
				end)
				
				Slider['33'].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Tween(Slider['34'], {Color = Color3.fromRGB(117, 117, 117)})
						Tween(Slider['3a'], {Color = Color3.fromRGB(103, 103, 103)})
						Tween(Slider['3b'], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
					end
				end)
				
				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						
						Tween(Slider['34'], {Color = Color3.fromRGB(255, 255, 255)})
						Tween(Slider['3a'], {Color = Color3.fromRGB(255, 255, 255)})
						Tween(Slider['3b'], {BackgroundColor3 = Color3.fromRGB(140, 140, 140)})
						Tween(Slider['33'], {BackgroundColor3 = Color3.fromRGB(75, 75, 75)})
						
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false
						
						if Slider.Hover then
							Tween(Slider['34'], {Color = Color3.fromRGB(171, 171, 171)})
							Tween(Slider['3a'], {Color = Color3.fromRGB(150, 150, 150)})
							Tween(Slider['3b'], {BackgroundColor3 = Color3.fromRGB(120, 120, 120)})
							Tween(Slider['33'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
						else
							Tween(Slider['34'], {Color = Color3.fromRGB(117, 117, 117)})
							Tween(Slider['3a'], {Color = Color3.fromRGB(103, 103, 103)})
							Tween(Slider['3b'], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
							Tween(Slider['33'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:DefineLabel(Content)
			
			if not Content or Content == nil or typeof(Content) ~= 'string' then
				Content = 'Your following label content here'
			end
			
			local Label = {}
			
			-- Render
			do
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Label
				Label['11'] = Instance.new('Frame', Tab['7']);
				Label['11']['BorderSizePixel'] = 0;
				Label['11']['BackgroundColor3'] = Color3.fromRGB(27, 27, 27);
				Label['11']['Size'] = UDim2.new(1, -10, 0.03500000014901161, 0);
				Label['11']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Label['11']['Name'] = 'Label';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Label.UIStroke
				Label['12'] = Instance.new('UIStroke', Label['11']);
				Label['12']['Color'] = Color3.fromRGB(72, 72, 72);
				Label['12']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Label.UICorner
				Label['13'] = Instance.new('UICorner', Label['11']);
				Label['13']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Label.Title
				Label['14'] = Instance.new('TextLabel', Label['11']);
				Label['14']['BorderSizePixel'] = 0;
				Label['14']['TextYAlignment'] = Enum.TextYAlignment.Top;
				Label['14']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Label['14']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label['14']['TextSize'] = 16;
				Label['14']['TextWrapped'] = true;
				Label['14']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Label['14']['Size'] = UDim2.new(1, 0, 1, 0);
				Label['14']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Label['14']['Text'] = Content;
				Label['14']['Name'] = 'Title';
				Label['14']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Label.Title.UIPadding
				Label['15'] = Instance.new('UIPadding', Label['14']);
				Label['15']['PaddingTop'] = UDim.new(0, 7);
			end
			
			-- Methods
			function Label:Update(text)
				Content = text
				Label['14'].Text = Content
			end
			
			-- Logics
			do
				Label['11'].MouseEnter:Connect(function()
					Tween(Label['12'], {Color = Color3.fromRGB(120, 120, 120)})
				end)
				
				Label['11'].MouseLeave:Connect(function()
					Tween(Label['12'], {Color = Color3.fromRGB(72, 72, 72)})
				end)
			end
			
			return Label
		end
		
		function Tab:DefineSwitch(Settings)
			Settings = validate({
				Name = 'Switchable',
				FirstState = false,
				Callback = function() end
			}, Settings or {})
			
			local Switch = {
				Hover = false,
				MouseDown = false,
				State = Settings.FirstState
			}
			
			-- Render
			do
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle
				Switch['16'] = Instance.new('Frame', Tab['7']);
				Switch['16']['BorderSizePixel'] = 0;
				Switch['16']['BackgroundColor3'] = Color3.fromRGB(53, 53, 53);
				Switch['16']['Size'] = UDim2.new(1, -10, 0.05000000074505806, 0);
				Switch['16']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Switch['16']['Name'] = 'Toggle';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.UIStroke
				Switch['17'] = Instance.new('UIStroke', Switch['16']);
				Switch['17']['Color'] = Color3.fromRGB(117, 117, 117);
				Switch['17']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.UICorner
				Switch['18'] = Instance.new('UICorner', Switch['16']);
				Switch['18']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.Title
				Switch['19'] = Instance.new('TextLabel', Switch['16']);
				Switch['19']['BorderSizePixel'] = 0;
				Switch['19']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Switch['19']['TextXAlignment'] = Enum.TextXAlignment.Left;
				Switch['19']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Switch['19']['TextSize'] = 16;
				Switch['19']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Switch['19']['Size'] = UDim2.new(0.8596154451370239, 0, 1, 0);
				Switch['19']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Switch['19']['Text'] = Settings.Name;
				Switch['19']['Name'] = 'Title';
				Switch['19']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.Title.UIPadding
				Switch['1a'] = Instance.new('UIPadding', Switch['19']);
				Switch['1a']['PaddingLeft'] = UDim.new(0, 15);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.CheckmarkHolder
				Switch['1b'] = Instance.new('Frame', Switch['16']);
				Switch['1b']['BorderSizePixel'] = 0;
				Switch['1b']['BackgroundColor3'] = Color3.fromRGB(28, 28, 28);
				Switch['1b']['Size'] = UDim2.new(0.06523057818412781, 0, 0.7671258449554443, 0);
				Switch['1b']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Switch['1b']['Position'] = UDim2.new(0.9209998250007629, 0, 0.09900015592575073, 0);
				Switch['1b']['Name'] = 'CheckmarkHolder';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.CheckmarkHolder.UICorner
				Switch['1c'] = Instance.new('UICorner', Switch['1b']);
				Switch['1c']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.Toggle.CheckmarkHolder.Checkmark
				Switch['1d'] = Instance.new('ImageLabel', Switch['1b']);
				Switch['1d']['BorderSizePixel'] = 0;
				Switch['1d']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Switch['1d']['Image'] = 'rbxassetid://13463182748';
				Switch['1d']['Size'] = UDim2.new(1, 0, 1, 0);
				Switch['1d']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Switch['1d']['Name'] = 'Checkmark';
				Switch['1d']['ImageTransparency'] = 1;
				Switch['1d']['BackgroundTransparency'] = 1;
			end
			
			-- Methods
			
			if Settings.FirstState then
				Switch['1d'].ImageTransparency = 0;
			end
			
			function Switch:SetState(bool)
				if bool == nil then
					Switch.State = not Switch.State
				else
					Switch.State = bool
				end
				
				if Switch.State then
					Tween(Switch['1d'], {ImageTransparency = 0})
				else
					Tween(Switch['1d'], {ImageTransparency = 1})
				end
				
				Settings.Callback(Switch.State)
			end
			
			-- Logics
			do
				Switch['16'].MouseEnter:Connect(function()
					Switch.Hover = true
					
					Tween(Switch['17'], {Color = Color3.fromRGB(171, 171, 171)})
				end)
				
				Switch['16'].MouseLeave:Connect(function()
					Switch.Hover = false
					
					if not Switch.MouseDown then
						Tween(Switch['17'], {Color = Color3.fromRGB(117, 117, 117)})
					end
				end)
				
				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Switch.Hover then
						Switch.MouseDown = true
						
						Tween(Switch['16'], {BackgroundColor3 = Color3.fromRGB(75, 75, 75)})
						Tween(Switch['17'], {Color = Color3.fromRGB(255, 255, 255)})
						
						Switch:SetState()
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Switch.MouseDown = false
						
						if Switch.Hover then
							Tween(Switch['16'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Switch['17'], {Color = Color3.fromRGB(171, 171, 171)})
						else
							Tween(Switch['16'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Switch['17'], {Color = Color3.fromRGB(117, 117, 117)})
						end
					end
				end)
			end
			
			return Switch
		end
		
		function Tab:DefineDropdown(Settings)
			Settings = validate({
				Name = 'Dropdown Here',
				Callback = function() end
			}, Settings or {})
			
			local Dropdown = {
				Items = {
					['id'] = {
						'value'
					}
				},
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown
				Dropdown['3f'] = Instance.new('Frame', Tab['7']);
				Dropdown['3f']['BorderSizePixel'] = 0;
				Dropdown['3f']['BackgroundColor3'] = Color3.fromRGB(53, 53, 53);
				Dropdown['3f']['Size'] = UDim2.new(1, -10, 0.19488775730133057, 0);
				Dropdown['3f']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown['3f']['Position'] = UDim2.new(0.009291660971939564, 0, 0.34771209955215454, 0);
				Dropdown['3f']['Name'] = 'InactiveDropdown';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.UIStroke
				Dropdown['40'] = Instance.new('UIStroke', Dropdown['3f']);
				Dropdown['40']['Color'] = Color3.fromRGB(117, 117, 117);
				Dropdown['40']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.UICorner
				Dropdown['41'] = Instance.new('UICorner', Dropdown['3f']);
				Dropdown['41']['CornerRadius'] = UDim.new(0, 6);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.Title
				Dropdown['42'] = Instance.new('TextLabel', Dropdown['3f']);
				Dropdown['42']['BorderSizePixel'] = 0;
				Dropdown['42']['TextYAlignment'] = Enum.TextYAlignment.Top;
				Dropdown['42']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Dropdown['42']['TextXAlignment'] = Enum.TextXAlignment.Left;
				Dropdown['42']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown['42']['TextSize'] = 16;
				Dropdown['42']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Dropdown['42']['Size'] = UDim2.new(0.8596153855323792, 0, 0.21031823754310608, 0);
				Dropdown['42']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown['42']['Text'] = Settings.Name;
				Dropdown['42']['Name'] = 'Title';
				Dropdown['42']['BackgroundTransparency'] = 1;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.Title.UIPadding
				Dropdown['43'] = Instance.new('UIPadding', Dropdown['42']);
				Dropdown['43']['PaddingTop'] = UDim.new(0, 11);
				Dropdown['43']['PaddingLeft'] = UDim.new(0, 15);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder
				Dropdown['45'] = Instance.new('Frame', Dropdown['3f']);
				Dropdown['45']['ZIndex'] = 2;
				Dropdown['45']['BorderSizePixel'] = 0;
				Dropdown['45']['BackgroundColor3'] = Color3.fromRGB(23, 23, 23);
				Dropdown['45']['Size'] = UDim2.new(0.998, 0, 0.779, 0);
				Dropdown['45']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown['45']['Position'] = UDim2.new(0, 0, 0.221, 0);
				Dropdown['45']['Name'] = 'OptionsHolder';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame
				Dropdown['46'] = Instance.new('ScrollingFrame', Dropdown['45']);
				Dropdown['46']['Active'] = true;
				Dropdown['46']['BorderSizePixel'] = 0;
				Dropdown['46']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Dropdown['46']['BackgroundTransparency'] = 1;
				Dropdown['46']['Size'] = UDim2.new(1, 0, 1, 0);
				Dropdown['46']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown['46']['ScrollBarThickness'] = 0;
				Dropdown['46']['Name'] = 'OptionsFrame';

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.UIListLayout
				Dropdown['47'] = Instance.new('UIListLayout', Dropdown['46']);
				Dropdown['47']['HorizontalAlignment'] = Enum.HorizontalAlignment.Center;
				Dropdown['47']['Padding'] = UDim.new(0, 10);
				Dropdown['47']['SortOrder'] = Enum.SortOrder.LayoutOrder;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.UIPadding
				Dropdown['48'] = Instance.new('UIPadding', Dropdown['46']);
				Dropdown['48']['PaddingTop'] = UDim.new(0, 10);
				
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.UICorner
				Dropdown['51'] = Instance.new('UICorner', Dropdown['45']);
				Dropdown['51']['CornerRadius'] = UDim.new(0, 7);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.Info.UIPadding
				Dropdown['53'] = Instance.new('UIPadding', Dropdown['52']);
				Dropdown['53']['PaddingTop'] = UDim.new(0, 11);
				Dropdown['53']['PaddingRight'] = UDim.new(0, 11);
				Dropdown['53']['PaddingLeft'] = UDim.new(0, 15);
			end
			
			-- Methods
			function Dropdown:AddItem(id, v)
				
				local Item = {
					Hover = false,
					MouseDown = false
				}
				
				if Dropdown.Items[id] ~= nil then
					return
				end
				
				Dropdown.Items[id] = {
					instance = {},
					value = v
				}
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.Option
				Dropdown.Items[id].instance['49'] = Instance.new('Frame', Dropdown['46']);
				Dropdown.Items[id].instance['49']['BorderSizePixel'] = 0;
				Dropdown.Items[id].instance['49']['BackgroundColor3'] = Color3.fromRGB(67, 67, 67);
				Dropdown.Items[id].instance['49']['Size'] = UDim2.new(0.9384615421295166, 0, 0.15000762045383453, 0);
				Dropdown.Items[id].instance['49']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown.Items[id].instance['49']['Position'] = UDim2.new(0, 0, 0.0066583226434886456, 0);
				Dropdown.Items[id].instance['49']['Name'] = id;

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.Option.UICorner
				Dropdown.Items[id].instance['4a'] = Instance.new('UICorner', Dropdown.Items[id].instance['49']);
				Dropdown.Items[id].instance['4a']['CornerRadius'] = UDim.new(0, 5);

				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.Option.Name
				Dropdown.Items[id].instance['4b'] = Instance.new('TextLabel', Dropdown.Items[id].instance['49']);
				Dropdown.Items[id].instance['4b']['BorderSizePixel'] = 0;
				Dropdown.Items[id].instance['4b']['BackgroundColor3'] = Color3.fromRGB(255, 255, 255);
				Dropdown.Items[id].instance['4b']['FontFace'] = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown.Items[id].instance['4b']['TextSize'] = 14;
				Dropdown.Items[id].instance['4b']['TextColor3'] = Color3.fromRGB(178, 178, 178);
				Dropdown.Items[id].instance['4b']['Size'] = UDim2.new(1, 0, 1, 0);
				Dropdown.Items[id].instance['4b']['BorderColor3'] = Color3.fromRGB(0, 0, 0);
				Dropdown.Items[id].instance['4b']['Text'] = id;
				Dropdown.Items[id].instance['4b']['Name'] = 'Name';
				Dropdown.Items[id].instance['4b']['BackgroundTransparency'] = 1;
				
				-- StarterGui.Atomic.Main.ContentContainer.ElementContainer.InactiveDropdown.OptionsHolder.OptionsFrame.Option.UIStroke
				Dropdown.Items[id].instance['4c'] = Instance.new('UIStroke', Dropdown.Items[id].instance['49']);
				Dropdown.Items[id].instance['4c']['Color'] = Color3.fromRGB(117, 117, 117);
				Dropdown.Items[id].instance['4c']['ApplyStrokeMode'] = Enum.ApplyStrokeMode.Border;
				
				-- Logics
				do
					Dropdown.Items[id].instance['49'].MouseEnter:Connect(function()
						Item.Hover = true
						
						Tween(Dropdown.Items[id].instance['4c'], {Color = Color3.fromRGB(171, 171, 171)})
					end)
					
					Dropdown.Items[id].instance['49'].MouseLeave:Connect(function()
						Item.Hover = false

						if not Item.MouseDown then
							Tween(Dropdown.Items[id].instance['4c'], {Color = Color3.fromRGB(117, 117, 117)})
						end
					end)
					
					uis.InputBegan:Connect(function(input)
						if Dropdown.Items[id] == nil then return end
						
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							
							Tween(Dropdown.Items[id].instance['49'], {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})
							Tween(Dropdown.Items[id].instance['4c'], {Color = Color3.fromRGB(255, 255, 255)})
							
							Settings.Callback(v)
						end
					end)
					
					uis.InputEnded:Connect(function(i)
						if Dropdown.Items[id] == nil then return end
						
						if i.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false
							
							if Item.Hover then
								Tween(Dropdown.Items[id].instance['49'], {BackgroundColor3 = Color3.fromRGB(67, 67, 67)})
								Tween(Dropdown.Items[id].instance['4c'], {Color = Color3.fromRGB(171, 171, 171)})
							else
								Tween(Dropdown.Items[id].instance['49'], {BackgroundColor3 = Color3.fromRGB(67, 67, 67)})
								Tween(Dropdown.Items[id].instance['4c'], {Color = Color3.fromRGB(117, 117, 117)})
							end
						end
					end)
				end
			end
			
			function Dropdown:SetVoid(id)
				if Dropdown.Items[id] ~= nil then
					if #Dropdown.Items[id].instance ~= nil then
						for i, v in pairs(Dropdown.Items[id].instance) do
							v:Destroy()
						end
					end
					Dropdown.Items[id] = nil
				end
			end
			
			function Dropdown:VoidItem()
				for i, _ in pairs(Dropdown.Items) do
					Dropdown:SetVoid(i)
				end
			end
			
			-- Logics
			do
				Dropdown['3f'].MouseEnter:Connect(function()
					Dropdown.Hover = true

					Tween(Dropdown['40'], {Color = Color3.fromRGB(171, 171, 171)})
				end)

				Dropdown['3f'].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Tween(Dropdown['40'], {Color = Color3.fromRGB(117, 117, 117)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true

						Tween(Dropdown['3f'], {BackgroundColor3 = Color3.fromRGB(75, 75, 75)})
						Tween(Dropdown['40'], {Color = Color3.fromRGB(255, 255, 255)})
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Tween(Dropdown['3f'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Dropdown['40'], {Color = Color3.fromRGB(171, 171, 171)})
						else
							Tween(Dropdown['3f'], {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
							Tween(Dropdown['40'], {Color = Color3.fromRGB(117, 117, 117)})
						end
					end
				end)
			end
			
			return Dropdown
		end
		
		return Tab
	end
	
	return UI
end

return Atomic
