if game:GetService('CoreGui'):FindFirstChild('Atom') then
    game.CoreGui.Atom:Destroy()
    wait(.5)
end

-- Variables
local player = game.Players.LocalPlayer
local char = player.Character
local playerGui = player.PlayerGui
local tweenService = game:GetService('TweenService')
local runService = game:GetService('RunService')
local httpService = game:GetService('HttpService')
local coreGui = game:GetService('CoreGui')
local uis = game:GetService('UserInputService')
local viewport = workspace.CurrentCamera.ViewportSize
local mouse = player:GetMouse()

-- Other Use Variables
local configFileName;
local configFolderName;
local configSaveEnabled;
local minimized;
local opened;

local AtomLibrary = {
    Flags = {}
}

-- Functions
local function Tween(settings, obj, goal, callback)
    local info = TweenInfo.new(settings.Time or .7, settings.Style or Enum.EasingStyle.Quad, settings.Direction or Enum.EasingDirection.Out)
    local tween = tweenService:Create(obj, info, goal)
    tween.Completed:Connect(callback or function() end)
    tween:Play()
    return tween
end

local function addDragging(point, Main)
    pcall(function()
        local dragging, dragInput, mousePos, framePos = false
        point.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                mousePos = input.Position
                framePos = Main.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        point.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        uis.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - mousePos
                Tween({
                    Time = .45,
                    Style = Enum.EasingStyle.Quint,
                    Direction = Enum.EasingDirection.Out
                }, Main, {Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)})
            end
        end)
    end)
end

--[[local function saveConfig()
    if not configSaveEnabled then return end
    local data = {}
    for i, v in pairs(AtomLibrary.Flags) do
        data[i] = v.FirstState or v.FirstValue
    end
    local json = httpService:JSONEncode(data)
    writefile(configFileName .. '.atmc', tostring(json))
end

local function loadConfig(Config)
    local data = httpService:JSONDecode(Config)
    for flagName, flagVal in next, data do
        if AtomLibrary.Flags[flagName] then
            spawn(function()
                if AtomLibrary.Flags[flagName].FirstValue ~= flagVal then
                    AtomLibrary.Flags[flagName]:SetValue(flagVal)
                elseif AtomLibrary.Flags[flagName].FirstState ~= flagVal then
                    AtomLibrary.Flags[flagName]:SetState(flagVal)
                end
            end)
        else
            warn('Flag Error: Unable to find '.. flagName .. ' in the script.')
        end
    end
end
]]

local function hasProperty(obj, prop)
    local s = pcall(function()
        obj[prop] = obj[prop]
    end)
    return s
end

--[[function AtomLibrary:LoadConfiguration()
    if configSaveEnabled then
        pcall(function()
            if isfile(configFileName) then
                loadConfig(readfile(configFileName))
            end
        end)
    end
end
]]

-- Main Features
function AtomLibrary:StartWindow(Settings)
    if not Settings.Title or Settings.Title == '' then Settings.Title = 'Atom UI' end
    if not Settings.CloseBind then Settings.CloseBind = Enum.KeyCode.Insert end

    -- Instances
    local Atom = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Shadow = Instance.new("Frame")
    local ShadowImage = Instance.new("ImageLabel")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Line = Instance.new("Frame")
    local Repair = Instance.new("Frame")
    local MainTitle = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local TabToggle = Instance.new("ImageLabel")
    local Minimize = Instance.new("ImageLabel")
    local Close = Instance.new("ImageLabel")
    local ContentContainer = Instance.new("Frame")
    local UIPageLayout = Instance.new("UIPageLayout")
    local TabHolder = Instance.new("Frame")
    local TabList = Instance.new("ScrollingFrame")
    local UIListLayout_3 = Instance.new("UIListLayout")
    local UIPadding_10 = Instance.new("UIPadding")
    local UICorner_13 = Instance.new("UICorner")
    local Identifier = Instance.new("TextLabel")
    local Seperator = Instance.new("Frame")

    -- Properties
    do
        Atom.Name = "Atom"
        Atom.Parent = runService:IsStudio() and playerGui or coreGui
        Atom.DisplayOrder = 200
        Atom.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Main.Name = "Main"
        Main.Parent = Atom
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Main.BorderSizePixel = 0
        Main.Position = UDim2.fromOffset((viewport.X / 2) - (Main.Position.X.Offset / 2), (viewport.Y /2) - (Main.Position.Y.Offset))
        Main.Size = UDim2.new(0, 500, 0, 500)

        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = Main

        Shadow.Name = "Shadow"
        Shadow.Parent = Main
        Shadow.BackgroundTransparency = 1.000
        Shadow.BorderSizePixel = 0
        Shadow.Size = UDim2.new(1, 0, 1, 0)
        Shadow.ZIndex = 0

        ShadowImage.Name = "ShadowImage"
        ShadowImage.Parent = Shadow
        ShadowImage.AnchorPoint = Vector2.new(0.5, 0.5)
        ShadowImage.BackgroundTransparency = 1.000
        ShadowImage.BorderSizePixel = 0
        ShadowImage.Position = UDim2.new(0.5, 0, 0.5, 0)
        ShadowImage.Size = UDim2.new(1, 47, 1, 47)
        ShadowImage.ZIndex = 0
        ShadowImage.Image = "rbxassetid://6014261993"
        ShadowImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
        ShadowImage.ImageTransparency = 0.500
        ShadowImage.ScaleType = Enum.ScaleType.Slice
        ShadowImage.SliceCenter = Rect.new(49, 49, 450, 450)

        TopBar.Name = "TopBar"
        TopBar.Parent = Main
        TopBar.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TopBar.BorderSizePixel = 0
        TopBar.Size = UDim2.new(0, 500, 0, 50)

        UICorner_2.Parent = TopBar

        Line.Name = "Line"
        Line.Parent = TopBar
        Line.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
        Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 0, 1, 0)
        Line.Size = UDim2.new(1, 0, 0, 1)

        Repair.Name = "Repair"
        Repair.Parent = TopBar
        Repair.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        Repair.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Repair.BorderSizePixel = 0
        Repair.Position = UDim2.new(0, 0, -1.10000002, 65)
        Repair.Size = UDim2.new(1, 0, 0, 40)

        MainTitle.Name = "MainTitle"
        MainTitle.Parent = TopBar
        MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainTitle.BackgroundTransparency = 1.000
        MainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        MainTitle.BorderSizePixel = 0
        MainTitle.Position = UDim2.new(0, 0, 0, 18)
        MainTitle.Size = UDim2.new(1, 0, 0, 20)
        MainTitle.Font = Enum.Font.Gotham
        MainTitle.Text = Settings.Title 
        MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        MainTitle.TextSize = 17.000
        MainTitle.TextWrapped = true
        MainTitle.TextXAlignment = Enum.TextXAlignment.Left

        UIPadding.Parent = MainTitle
        UIPadding.PaddingLeft = UDim.new(0, 20)

        TabToggle.Name = "TabToggle"
        TabToggle.Parent = TopBar
        TabToggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TabToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabToggle.BackgroundTransparency = 1.000
        TabToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabToggle.ImageColor3 = Color3.fromRGB(100, 100, 100)
        TabToggle.BorderSizePixel = 0
        TabToggle.Position = UDim2.new(0.731999993, 0, 0.49000001, 0)
        TabToggle.Rotation = 90.000
        TabToggle.Size = UDim2.new(0, 30, 0, 30)
        TabToggle.Image = "rbxassetid://13463078710"

        Minimize.Name = "Minimize"
        Minimize.Parent = TopBar
        Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
        Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Minimize.BackgroundTransparency = 1.000
        Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Minimize.ImageColor3 = Color3.fromRGB(100, 100, 100)
        Minimize.BorderSizePixel = 0
        Minimize.Position = UDim2.new(0.834000051, 0, 0.49000001, 0)
        Minimize.Size = UDim2.new(0, 30, 0, 30)
        Minimize.Image = "rbxassetid://14101176654"

        Close.Name = "Close"
        Close.Parent = TopBar
        Close.AnchorPoint = Vector2.new(0.5, 0.5)
        Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Close.BackgroundTransparency = 1.000
        Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Close.ImageColor3 = Color3.fromRGB(100, 100, 100)
        Close.BorderSizePixel = 0
        Close.Position = UDim2.new(0.922000051, 0, 0.49000001, 0)
        Close.Size = UDim2.new(0, 30, 0, 30)
        Close.Image = "rbxassetid://14210462279"

        ContentContainer.Name = "ContentContainer"
        ContentContainer.Parent = Main
        ContentContainer.AnchorPoint = Vector2.new(0.5, 0.5)
        ContentContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ContentContainer.BackgroundTransparency = 1.000
        ContentContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ContentContainer.BorderSizePixel = 0
        ContentContainer.ClipsDescendants = true
        ContentContainer.Position = UDim2.new(0, 250, 0, 273)
        ContentContainer.Size = UDim2.new(0, 470, 0, 427)

        UIPageLayout.Parent = ContentContainer
        UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIPageLayout.FillDirection = Enum.FillDirection.Vertical
        UIPageLayout.TweenTime = .5
        UIPageLayout.EasingStyle = Enum.EasingStyle.Quad

        TabHolder.Name = "TabHolder"
        TabHolder.Parent = Main
        TabHolder.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabHolder.BorderSizePixel = 0
        TabHolder.BackgroundTransparency = 1
        TabHolder.Position = UDim2.new(1.128, 0, 0.02, 0)
        TabHolder.Size = UDim2.new(0, 100, 0, 480)

        TabList.Name = "TabList"
        TabList.Parent = TabHolder
        TabList.Active = true
        TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabList.BackgroundTransparency = 1.000
        TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabList.BorderSizePixel = 0
        TabList.Position = UDim2.new(0, 0, 0.10520833, 0)
        TabList.Size = UDim2.new(1, 0, 0.894791663, 0)
        TabList.ScrollBarThickness = 0

        UIListLayout_3.Parent = TabList
        UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_3.Padding = UDim.new(0, 10)

        UIPadding_10.Parent = TabList
        UIPadding_10.PaddingTop = UDim.new(0, 20)

        UICorner_13.CornerRadius = UDim.new(0, 10)
        UICorner_13.Parent = TabHolder

        Identifier.Name = "Identifier"
        Identifier.Parent = TabHolder
        Identifier.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Identifier.BackgroundTransparency = 1.000
        Identifier.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Identifier.BorderSizePixel = 0
        Identifier.Size = UDim2.new(0, 100, 0, 50)
        Identifier.Font = Enum.Font.Gotham
        Identifier.Text = "Tab List"
        Identifier.TextTransparency = 1
        Identifier.TextColor3 = Color3.fromRGB(200, 200, 200)
        Identifier.TextSize = 16.000

        Seperator.Name = "Seperator"
        Seperator.Parent = TabHolder
        Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
        Seperator.BackgroundColor3 = Color3.fromRGB(98, 98, 98)
        Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Seperator.BorderSizePixel = 0
        Seperator.BackgroundTransparency = 1
        Seperator.Position = UDim2.new(0, 50, 0, 41)
        Seperator.Size = UDim2.new(0, 80, 0, 1)
    end

    addDragging(TopBar, Main)

    -- Configuration Saving Function
    do
        pcall(function()
            if not Settings.ConfigurationSaving.FileName then
                Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
            end
            if Settings.ConfigurationSaving.Enabled == nil then
                Settings.ConfigurationSaving.Enabled = false
            end
    
            configFileName = Settings.ConfigurationSaving.FileName
            configFolderName = Settings.ConfigurationSaving.FolderName
            configSaveEnabled = Settings.ConfigurationSaving.Enabled
    
            if configSaveEnabled then
                if not isfolder(configFolderName) then
                    makefolder(configFolderName)
                end
            end
        end)
    end

    -- TopBar Button Logics
    do
        -- Tab Toggle
        do
            local hover = nil
            TabToggle.MouseEnter:Connect(function()
                hover = true
                Tween({Time = .2}, TabToggle, {ImageColor3 = Color3.fromRGB(150, 150, 150)})
            end)

            TabToggle.MouseLeave:Connect(function()
                hover = false
                Tween({Time = .2}, TabToggle, {ImageColor3 = Color3.fromRGB(100, 100, 100)})
            end)

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                    if not opened then
                        opened = true
                        for _, v in pairs(TabHolder:GetDescendants()) do
                            if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') and not v:IsA('TextLabel') then
                                Tween({Time = .3}, v, {BackgroundTransparency = 0})
                            end
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .3}, v, {TextTransparency = 0})
                            end
                        end
                        Tween({Time = .3}, TabHolder, {BackgroundTransparency = 0})
                        Tween({Time = .3}, TabHolder, {Position = UDim2.new(1.03, 0, 0.02, 0)})
                    else
                        opened = false
                        for _, v in pairs(TabHolder:GetDescendants()) do
                            if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') and not v:IsA('TextLabel') then
                                Tween({Time = .3}, v, {BackgroundTransparency = 1})
                            end
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .3}, v, {TextTransparency = 1})
                            end
                        end
                        Tween({Time = .3}, TabHolder, {BackgroundTransparency = 1})
                        Tween({Time = .3}, TabHolder, {Position = UDim2.new(1.128, 0, 0.02, 0)})
                    end
                end
            end)
        end

        -- Close
        do
            local hover, closed;
            Close.MouseEnter:Connect(function()
                hover = true
                Tween({Time = .2}, Close, {ImageColor3 = Color3.fromRGB(150, 150, 150)})
            end)

            Close.MouseLeave:Connect(function()
                hover = false
                Tween({Time = .2}, Close, {ImageColor3 = Color3.fromRGB(100, 100, 100)})
            end)

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and hover and not closed then
                    closed = true
                    Atom.Enabled = false
                elseif input.KeyCode == Settings.CloseBind and closed then
                    closed = false
                    Atom.Enabled = true
                end
            end)
        end

        -- Minimize
        do
            local hover;
            Minimize.MouseEnter:Connect(function()
                hover = true
                Tween({Time = .2}, Minimize, {ImageColor3 = Color3.fromRGB(150, 150, 150)})
            end)

            Minimize.MouseLeave:Connect(function()
                hover = false
                Tween({Time = .2}, Minimize, {ImageColor3 = Color3.fromRGB(100, 100, 100)})
            end)

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                    if not minimized then
                        for _, v in pairs(TabHolder:GetDescendants()) do
                            if opened then
                                opened = false
                                for _, v in pairs(TabHolder:GetDescendants()) do
                                    if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') and not v:IsA('TextLabel') then
                                        Tween({Time = .3}, v, {BackgroundTransparency = 1})
                                    end
                                    if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                        Tween({Time = .3}, v, {TextTransparency = 1})
                                    end
                                end
                                Tween({Time = .3}, TabHolder, {BackgroundTransparency = 1})
                                Tween({Time = .3}, TabHolder, {Position = UDim2.new(1.128, 0, 0.02, 0)})
                            end
                            if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') and not v:IsA('TextLabel') then
                                Tween({Time = .30}, v, {BackgroundTransparency = 1})
                            end
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .30}, v, {TextTransparency = 1}, function()
                                    minimized = true
                                    Tween({
                                        Time = .70,
                                        Style = Enum.EasingStyle.Quint,
                                        Direction = Enum.EasingDirection.InOut
                                    }, Main, {Size = UDim2.new(0, 500, 0, 52)})
                                end)
                            end
                        end
                    else
                        Tween({
                            Time = .70,
                            Style = Enum.EasingStyle.Quint,
                            Direction = Enum.EasingDirection.InOut
                        }, Main, {Size = UDim2.new(0, 500, 0, 500)}, function()
                            minimized = false
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .30}, v, {TextTransparency = 0})
                            end
                        end)
                    end
                end
            end)
        end

        --[[
            Normal = 0, 500, 0, 500
            ToTween = 0, 500, 0, 52
        ]]
    end

    --[[
        Normal: 1.03, 0, 0.02, 0
        Close = 1.128, 0, 0.02, 0
    ]]

    local tabHandler = {}

    function tabHandler:PlaceTab(name)
        if not name or name == '' then error('Tab has no name and can cause fatal issues!') coreGui.Atom:Destroy() return end

        -- Instances
        local Tab = Instance.new("TextLabel")
        local Elements = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding_4 = Instance.new("UIPadding")

        -- Minimize things
        do
            local hover;
            Minimize.MouseEnter:Connect(function()
                hover = true
            end)

            Minimize.MouseLeave:Connect(function()
                hover = false
            end)

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                    if not minimized then
                        Tween({Time = .30}, Elements, {ScrollBarThickness = 0})
                        for _, v in pairs(Elements:GetDescendants()) do
                            if v:IsA('UIStroke') then
                                v.Enabled = false
                            end
                            if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') then
                                Tween({Time = .30}, v, {BackgroundTransparency = 1})
                            end
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .30}, v, {TextTransparency = 1})
                            end
                            if hasProperty(v, 'ImageTransparency') and v:IsA('ImageLabel') then
                                Tween({Time = .30}, v, {ImageTransparency = 1})
                            end
                        end
                    else
                        Tween({Time = .30}, Elements, {ScrollBarThickness = 3})
                        for _, v in pairs(Elements:GetDescendants()) do
                            if v:IsA('UIStroke') then
                                v.Enabled = true
                            end
                            if hasProperty(v, 'BackgroundTransparency') and v:IsA('Frame') then
                                Tween({Time = .30}, v, {BackgroundTransparency = 0})
                            end
                            if hasProperty(v, 'TextTransparency') and v:IsA('TextLabel') then
                                Tween({Time = .30}, v, {TextTransparency = 0})
                            end
                            if hasProperty(v, 'ImageTransparency') and v:IsA('ImageLabel') then
                                Tween({Time = .30}, v, {ImageTransparency = 0})
                            end
                        end
                    end
                end
            end)
        end

        -- Properties
        do
            Tab.Name = "Tab"
            Tab.Parent = TabList
            Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Tab.BackgroundTransparency = 1.000
            Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Tab.BorderSizePixel = 0
            Tab.Size = UDim2.new(0, 100, 0, 30)
            Tab.Font = Enum.Font.Gotham
            Tab.Text = name
            Tab.TextTransparency = 1
            Tab.TextColor3 = Color3.fromRGB(177, 177, 177)
            Tab.TextSize = 14.000

            Elements.Name = name
            Elements.Parent = ContentContainer
            Elements.Active = true
            Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Elements.BackgroundTransparency = 1.000
            Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Elements.BorderSizePixel = 0
            Elements.Size = UDim2.new(1, 0, 1, 0)
            Elements.ScrollBarThickness = 3

            UIListLayout.Parent = Elements
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 7)

            UIPadding_4.Parent = Elements
            UIPadding_4.PaddingLeft = UDim.new(0, 1)
            UIPadding_4.PaddingTop = UDim.new(0, 1)
        end

        -- Logics
        do
            local hover;
            Tab.MouseEnter:Connect(function()
                hover = true
                Tween({
                    Time = .3,
                    Direction = Enum.EasingDirection.InOut
                }, Tab, {TextColor3 = Color3.fromRGB(255, 255, 255)})
            end)

            Tab.MouseLeave:Connect(function()
                hover = false
                Tween({
                    Time = .3,
                    Direction = Enum.EasingDirection.InOut
                }, Tab, {TextColor3 = Color3.fromRGB(177, 177, 177)})
            end)

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                    UIPageLayout:JumpTo(Elements)
                    UIPageLayout.PageLeave:Wait()
                end
            end)
        end

        local elements = {}

        function elements:MakeButton(args)
            -- Instances
            local Button = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local UIStroke = Instance.new('UIStroke')
            local ButtonTitle = Instance.new("TextLabel")
            local UIPadding_2 = Instance.new("UIPadding")
            local Interact = Instance.new("TextLabel")
            local UIPadding_3 = Instance.new("UIPadding")

            local buttonFunctions = {}

            -- Properties
            do
                Button.Name = "Button"
                Button.Parent = Elements
                Button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(1, -10, 0, 40)

                UICorner_3.CornerRadius = UDim.new(0, 6)
                UICorner_3.Parent = Button

                UIStroke.Parent = Button
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.fromRGB(117, 117, 117)

                ButtonTitle.Name = "ButtonTitle"
                ButtonTitle.Parent = Button
                ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTitle.BackgroundTransparency = 1.000
                ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonTitle.BorderSizePixel = 0
                ButtonTitle.Position = UDim2.new(0, 0, 0, 11)
                ButtonTitle.Size = UDim2.new(0, 290, 0, 20)
                ButtonTitle.Font = Enum.Font.Gotham
                ButtonTitle.Text = args.Title or 'Button Title'
                ButtonTitle.TextColor3 = Color3.fromRGB(147, 147, 147)
                ButtonTitle.TextSize = 15.000
                ButtonTitle.TextWrapped = true
                ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_2.Parent = ButtonTitle
                UIPadding_2.PaddingLeft = UDim.new(0, 15)

                Interact.Name = "Interact"
                Interact.Parent = Button
                Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Interact.BackgroundTransparency = 1.000
                Interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Interact.BorderSizePixel = 0
                Interact.Position = UDim2.new(0, 326, 0, 11)
                Interact.Size = UDim2.new(0, 122, 0, 20)
                Interact.Font = Enum.Font.Gotham
                Interact.Text = args.Interact or 'Button'
                Interact.TextColor3 = Color3.fromRGB(84, 84, 84)
                Interact.TextSize = 15.000
                Interact.TextWrapped = true
                Interact.TextXAlignment = Enum.TextXAlignment.Right

                UIPadding_3.Parent = Interact
                UIPadding_3.PaddingRight = UDim.new(0, 10)
            end

            -- Methods
            function buttonFunctions:SetTitle(newTitle)
                if typeof(newTitle) == 'string' then
                    args.Title = newTitle
                    ButtonTitle.Text = newTitle
                else
                    warn('Argument passed is not a string!')
                end
            end

            function buttonFunctions:SetInteract(newInteract)
                if typeof(newInteract) == 'string' then
                    args.Interact = newInteract
                    Interact.Text = newInteract
                else
                    warn('Argument passed is not a string!')
                end
            end

            function buttonFunctions:SetCallback(newFunction)
                if typeof(newFunction) == 'function' then
                    args.Callback = newFunction
                else
                    warn('Argument passed is not a function!')
                end
            end

            -- Logics
            do
                local hover, mouseDown;
                Button.MouseEnter:Connect(function()
                    hover = true
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                    Tween({Time = .2}, Interact, {TextColor3 = Color3.fromRGB(120, 120, 120)})
                end)

                Button.MouseLeave:Connect(function()
                    hover = false
                    if not mouseDown then
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                        Tween({Time = .2}, Interact, {TextColor3 = Color3.fromRGB(83, 83, 83)})
                    end
                end)

                uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                        mouseDown = true

                        Tween({Time = .2}, Button, {BackgroundColor3 = Color3.fromRGB(90, 90, 90)})
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(255, 255, 255)})
                        Tween({Time = .2}, Interact, {TextColor3 = Color3.fromRGB(170, 170, 170)})

                        local s, retardedError = pcall(args.Callback)
                        if not s then print('Callback error: '.. retardedError) end
                    end
                end)

                uis.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        mouseDown = false

                        if hover then
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                            Tween({Time = .2}, Interact, {TextColor3 = Color3.fromRGB(120 ,120, 120)})
                            Tween({Time = .2}, Button, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        else
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                            Tween({Time = .2}, Interact, {TextColor3 = Color3.fromRGB(84, 84, 84)})
                            Tween({Time = .2}, Button, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        end
                    end
                end)
            end

            return buttonFunctions
        end

        function elements:MakeToggle(toggleSettings)
            -- Instances
            local Toggle = Instance.new("Frame")
            local UIStroke = Instance.new('UIStroke')
            local UICorner_5 = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")
            local CheckmarkFrame = Instance.new("Frame")
            local Checkmark = Instance.new("ImageLabel")
            local UICorner_6 = Instance.new("UICorner")

            local toggleFunctions = {
                state = toggleSettings.FirstState
            }

            -- Properties
            do
                Toggle.Name = "Toggle"
                Toggle.Parent = Elements
                Toggle.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(1, -10, 0, 40)

                UIStroke.Parent = Toggle
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.fromRGB(117, 117, 117)

                UICorner_5.CornerRadius = UDim.new(0, 6)
                UICorner_5.Parent = Toggle

                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = Toggle
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleTitle.BorderSizePixel = 0
                ToggleTitle.Position = UDim2.new(0, 0, 0, 11)
                ToggleTitle.Size = UDim2.new(0, 290, 0, 20)
                ToggleTitle.Font = Enum.Font.Gotham
                ToggleTitle.Text = toggleSettings.Title or 'Toggle'
                ToggleTitle.TextColor3 = Color3.fromRGB(147, 147, 147)
                ToggleTitle.TextSize = 15.000
                ToggleTitle.TextWrapped = true
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_6.Parent = ToggleTitle
                UIPadding_6.PaddingLeft = UDim.new(0, 15)

                CheckmarkFrame.Name = "CheckmarkFrame"
                CheckmarkFrame.Parent = Toggle
                CheckmarkFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                CheckmarkFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                CheckmarkFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                CheckmarkFrame.BorderSizePixel = 0
                CheckmarkFrame.Position = UDim2.new(0.93900001, 0, 0.5, 0)
                CheckmarkFrame.Size = UDim2.new(0, 30, 0, 30)

                Checkmark.Name = "Checkmark"
                Checkmark.Parent = CheckmarkFrame
                Checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Checkmark.BackgroundTransparency = 1.000
                Checkmark.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Checkmark.BorderSizePixel = 0
                Checkmark.ImageTransparency = 1
                Checkmark.Size = UDim2.new(1, 0, 1, 0)
                Checkmark.Image = "rbxassetid://13463182748"

                UICorner_6.CornerRadius = UDim.new(0, 6)
                UICorner_6.Parent = CheckmarkFrame
            end

            -- Methods
            if toggleSettings.FirstState then
                Checkmark.ImageTransparency = 0
            end

            function toggleSettings:SetState(bool)
                if bool == nil then
                    toggleFunctions.state = not toggleFunctions.state
                else
                    toggleFunctions.state = bool
                end

                if toggleFunctions.state then
                    Tween({Time = .2}, Checkmark, {ImageTransparency = 0})
                else
                    Tween({Time = .2}, Checkmark, {ImageTransparency = 1})
                end

                local s, retardedError = pcall(function()
                    toggleSettings.Callback(toggleFunctions.state)
                end)

                if not s then print('Callback error :'.. retardedError) end
            end

            -- Logics
            do
                local hover, mouseDown;
                Toggle.MouseEnter:Connect(function()
                    hover = true
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                end)

                Toggle.MouseLeave:Connect(function()
                    hover = false
                    if not mouseDown then
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                    end
                end)

                uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                        mouseDown = true

                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(255, 255, 255)})
                        Tween({Time = .2}, Toggle, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})

                        toggleSettings:SetState()
                    end
                end)

                uis.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        mouseDown = false

                        if hover then
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                            Tween({Time = .2}, Toggle, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        else
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                            Tween({Time = .2}, Toggle, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        end
                    end
                end)
            end

            return toggleSettings
        end

        function elements:MakeLabel(content)
            -- Instances
            local Label = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local UIStroke = Instance.new('UIStroke')
            local Content = Instance.new("TextLabel")
            local UIPadding_5 = Instance.new("UIPadding")

            local labelFunctions = {}

            -- Properties
            do
                Label.Name = "Label"
                Label.Parent = Elements
                Label.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(1, -10, 0, 37)

                UICorner_4.CornerRadius = UDim.new(0, 6)
                UICorner_4.Parent = Label

                UIStroke.Parent = Label
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.fromRGB(117, 117, 117)

                Content.Name = "Content"
                Content.Parent = Label
                Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Content.BackgroundTransparency = 1.000
                Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Content.BorderSizePixel = 0
                Content.Position = UDim2.new(0, 0, 0, 9)
                Content.Size = UDim2.new(0, 460, 0, 20)
                Content.Text = content or 'Label Content'
                Content.Font = Enum.Font.Gotham
                Content.TextColor3 = Color3.fromRGB(147, 147, 147)
                Content.TextSize = 15.000
                Content.TextWrapped = true

                UIPadding_5.Parent = Content
                UIPadding_5.PaddingLeft = UDim.new(0, 15)
                UIPadding_5.PaddingRight = UDim.new(0, 15)
            end

            -- Methods
            function labelFunctions:SetContent(newContent)
                content = newContent
                Content.Text = content
            end

            -- Logics
            do
                Label.MouseEnter:Connect(function()
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                end)

                Label.MouseLeave:Connect(function()
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                end)
            end

            return labelFunctions
        end

        function elements:MakeSlider(sliderSettings)
            -- Instances
            local Slider = Instance.new("Frame")
            local UIStroke = Instance.new('UIStroke')
            local UICorner_7 = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local UIPadding_7 = Instance.new("UIPadding")
            local Value = Instance.new("TextLabel")
            local SlidingFrame = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local UIStroke_1 = Instance.new('UIStroke')
            local Progress = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")

            local sliderFunctions = {
                Connection = nil
            }

            -- Properties
            do
                Slider.Name = "Slider"
                Slider.Parent = Elements
                Slider.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(1, -10, 0, 54)

                UIStroke.Parent = Slider
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.fromRGB(117, 117, 117)

                UICorner_7.CornerRadius = UDim.new(0, 6)
                UICorner_7.Parent = Slider

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderTitle.BorderSizePixel = 0
                SliderTitle.Position = UDim2.new(0, 0, 0, 7)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = sliderSettings.Title or 'Slider'
                SliderTitle.TextColor3 = Color3.fromRGB(147, 147, 147)
                SliderTitle.TextSize = 15.000
                SliderTitle.TextWrapped = true
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_7.Parent = SliderTitle
                UIPadding_7.PaddingLeft = UDim.new(0, 15)

                Value.Name = "Value"
                Value.Parent = Slider
                Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Value.BackgroundTransparency = 1.000
                Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Value.BorderSizePixel = 0
                Value.Position = UDim2.new(0, 326, 0, 7)
                Value.Size = UDim2.new(0, 122, 0, 20)
                Value.Font = Enum.Font.Gotham
                Value.Text = sliderSettings.FirstValue
                Value.TextColor3 = Color3.fromRGB(84, 84, 84)
                Value.TextSize = 15.000
                Value.TextWrapped = true

                SlidingFrame.Name = "SlidingFrame"
                SlidingFrame.Parent = Slider
                SlidingFrame.AnchorPoint = Vector2.new(0, 0.5)
                SlidingFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SlidingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SlidingFrame.BorderSizePixel = 0
                SlidingFrame.Position = UDim2.new(0.0202854015, 0, 0.74444443, 0)
                SlidingFrame.Size = UDim2.new(0, 440, 0, 15)

                UICorner_8.Parent = SlidingFrame

                UIStroke_1.Parent = SlidingFrame
                UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke_1.Color = Color3.fromRGB(117, 117, 117)

                Progress.Name = "Progress"
                Progress.Parent = SlidingFrame
                Progress.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
                Progress.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Progress.BorderSizePixel = 0
                Progress.Size = UDim2.new(0.479545444, 0, 1, 0)

                UICorner_9.Parent = Progress
            end

            -- Methods
            function sliderSettings:SetValue(value)
                if value == nil then
                    local percentage = math.clamp((mouse.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
                    local vale = math.floor((sliderSettings.Max - sliderSettings.Min) * percentage + sliderSettings.Min)

                    Value.Text = tostring(vale)
                    Progress.Size = UDim2.fromScale(percentage, 1)
                else
                    Value.Text = value
                    Tween({Time = .5, DIrection = Enum.EasingDirection.In}, Progress, {Size = UDim2.fromScale(((value - sliderSettings.Min) / (sliderSettings.Max - sliderSettings.Min)), 1)})
                end

                local s, retardedError = pcall(function()
                    sliderSettings.Callback(sliderFunctions:RetrieveValue())
                end)

                if not s then print('Callback error: '.. retardedError) end
            end

            function sliderSettings:RetrieveValue()
                return tonumber(Value.Text)
            end

            -- Logics
            do
                local hover, mouseDown;
                Slider.MouseEnter:Connect(function()
                    hover = true
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                    Tween({Time = .2}, UIStroke_1, {Color = Color3.fromRGB(177, 177, 177)})
                    Tween({Time = .2}, Value, {TextColor3 = Color3.fromRGB(120, 120, 120)})
                    Tween({Time = .2}, Progress, {BackgroundColor3 = Color3.fromRGB(150, 150, 150)})
                end)

                Slider.MouseLeave:Connect(function()
                    hover = false
                    if not mouseDown then
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                        Tween({Time = .2}, UIStroke_1, {Color = Color3.fromRGB(117, 117, 117)})
                        Tween({Time = .2}, Value, {TextColor3 = Color3.fromRGB(84, 84, 84)})
                        Tween({Time = .2}, Progress, {BackgroundColor3 = Color3.fromRGB(120, 120, 120)})
                    end
                end)

                uis.InputBegan:Connect(function(inpt)
                    if inpt.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                        mouseDown = true

                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(255 ,255, 255)})
                        Tween({Time = .2}, UIStroke_1, {Color = Color3.fromRGB(255, 255, 255)})
                        Tween({Time = .2}, Progress, {BackgroundColor3 = Color3.fromRGB(180, 180, 180)})
                        Tween({Time = .2}, Value, {TextColor3 = Color3.fromRGB(170, 170, 170)})
                        Tween({Time = .2}, Slider, {BackgroundColor3 = Color3.fromRGB(90, 90, 90)})

                        if not sliderFunctions.Connection then
                            sliderFunctions.Connection = runService.RenderStepped:Connect(function()
                                sliderSettings:SetValue()
                            end)
                        end
                    end
                end)

                uis.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        mouseDown = false

                        if hover then
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                            Tween({Time = .2}, UIStroke_1, {Color = Color3.fromRGB(177, 177, 177)})
                            Tween({Time = .2}, Progress, {BackgroundColor3 = Color3.fromRGB(150, 150, 150)})
                            Tween({Time = .2}, Value, {TextColor3 = Color3.fromRGB(120, 120, 120)})
                            Tween({Time = .2}, Slider, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        else
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                            Tween({Time = .2}, UIStroke_1, {Color = Color3.fromRGB(117, 117, 117)})
                            Tween({Time = .2}, Progress, {BackgroundColor3 = Color3.fromRGB(120, 120, 120)})
                            Tween({Time = .2}, Value, {TextColor3 = Color3.fromRGB(84, 84, 84)})
                            Tween({Time = .2}, Slider, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        end

                        if sliderFunctions.Connection then sliderFunctions.Connection:Disconnect() end
                        sliderFunctions.Connection = nil
                    end
                end)
            end

            if Settings.ConfigurationSaving then
                if Settings.ConfigurationSaving.Enabled and sliderSettings.Flag then
                    AtomLibrary.Flags[sliderSettings.Flag] = sliderSettings
                end
            end

            return sliderSettings
        end

        function elements:MakeDropdown(args)
            -- Instances
            local Dropdown = Instance.new("Frame")
            local UIStroke = Instance.new('UIStroke')
            local UICorner_10 = Instance.new("UICorner")
            local DDTitle = Instance.new("TextLabel")
            local UIPadding_8 = Instance.new("UIPadding")
            local ItemsHolder = Instance.new("Frame")
            local UICorner_11 = Instance.new("UICorner")
            local Repair_2 = Instance.new("Frame")
            local ItemsFrame = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIPadding_9 = Instance.new("UIPadding")
            local Sorter = Instance.new("ImageLabel")

            local ddFunctions = {
                Opened = false
            }

            -- Properties
            do
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Elements
                Dropdown.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(1, -10, 0, 40)

                UIStroke.Parent = Dropdown
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.fromRGB(117, 117, 117)

                UICorner_10.CornerRadius = UDim.new(0, 6)
                UICorner_10.Parent = Dropdown

                DDTitle.Name = "DDTitle"
                DDTitle.Parent = Dropdown
                DDTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DDTitle.BackgroundTransparency = 1.000
                DDTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DDTitle.BorderSizePixel = 0
                DDTitle.Position = UDim2.new(0, 0, 0, 11)
                DDTitle.Size = UDim2.new(0, 290, 0, 20)
                DDTitle.Font = Enum.Font.Gotham
                DDTitle.Text = args.Title or 'Dropdown'
                DDTitle.TextColor3 = Color3.fromRGB(147, 147, 147)
                DDTitle.TextSize = 15.000
                DDTitle.TextWrapped = true
                DDTitle.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_8.Parent = DDTitle
                UIPadding_8.PaddingLeft = UDim.new(0, 15)

                ItemsHolder.Name = "ItemsHolder"
                ItemsHolder.Parent = Dropdown
                ItemsHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                ItemsHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ItemsHolder.BorderSizePixel = 0
                ItemsHolder.Position = UDim2.new(0, 0, 0, 40)
                ItemsHolder.Size = UDim2.new(0, 459, 0, 80)

                UICorner_11.CornerRadius = UDim.new(0, 6)
                UICorner_11.Parent = ItemsHolder

                Repair_2.Name = "Repair"
                Repair_2.Parent = ItemsHolder
                Repair_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Repair_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Repair_2.BorderSizePixel = 0
                Repair_2.Size = UDim2.new(0, 460, 0, 17)

                ItemsFrame.Name = "ItemsFrame"
                ItemsFrame.Parent = ItemsHolder
                ItemsFrame.Active = true
                ItemsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ItemsFrame.BackgroundTransparency = 1.000
                ItemsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ItemsFrame.BorderSizePixel = 0
                ItemsFrame.Size = UDim2.new(1, 0, 1, 0)
                ItemsFrame.ScrollBarThickness = 0

                UIListLayout_2.Parent = ItemsFrame
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 5)

                UIPadding_9.Parent = ItemsFrame
                UIPadding_9.PaddingTop = UDim.new(0, 10)

                Sorter.Name = "Sorter"
                Sorter.Parent = Dropdown
                Sorter.AnchorPoint = Vector2.new(0.5, 0.5)
                Sorter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sorter.BackgroundTransparency = 1.000
                Sorter.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Sorter.BorderSizePixel = 0
                Sorter.Position = UDim2.new(0.93900001, 0, 0, 20)
                Sorter.Size = UDim2.new(0, 30, 0, 30)
                Sorter.Image = "rbxassetid://13463078710"
            end

            -- Items Creating
            do
                for _, v in pairs(args.Items) do
                    -- Instances
                    local Item = Instance.new("Frame")
                    local UICorner_12 = Instance.new("UICorner")
                    local ItemName = Instance.new("TextLabel")
                    local UIStroke_3 = Instance.new('UIStroke')

                    -- Properties
                    do
                        Item.Name = v
                        Item.Parent = ItemsFrame
                        Item.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
                        Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Item.BorderSizePixel = 0
                        Item.Size = UDim2.new(0, 430, 0, 30)

                        UICorner_12.CornerRadius = UDim.new(0, 4)
                        UICorner_12.Parent = Item

                        ItemName.Name = v
                        ItemName.Parent = Item
                        ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ItemName.BackgroundTransparency = 1.000
                        ItemName.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ItemName.BorderSizePixel = 0
                        ItemName.Size = UDim2.new(1, 0, 1, 0)
                        ItemName.Font = Enum.Font.Gotham
                        ItemName.Text = v
                        ItemName.TextColor3 = Color3.fromRGB(175, 175, 175)
                        ItemName.TextSize = 14.000
                        ItemName.TextWrapped = true

                        UIStroke_3.Parent = Item
                        UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        UIStroke_3.Color = Color3.fromRGB(80, 80, 80)
                    end

                    -- Logics
                    do
                        local hover, mouseDown;
                        Item.MouseEnter:Connect(function()
                            hover = true
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(150, 150, 150)})
                        end)

                        Item.MouseLeave:Connect(function()
                            hover = false
                            if not mouseDown then
                                Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(80, 80, 80)})
                            end
                        end)

                        uis.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                                mouseDown = true

                                Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(200, 200, 200)})
                                Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

                                local s, retardedError = pcall(function()
                                    args.Callback(ItemName.Name)
                                end)

                                if not s then print('Callback error: '.. retardedError) end
                            end
                        end)

                        uis.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                mouseDown = false

                                if hover then
                                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(150, 150, 150)})
                                    Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(66, 66, 66)})
                                else
                                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(80, 80, 80)})
                                    Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(66, 66, 66)})
                                end
                            end
                        end)
                    end
                end
            end

            -- Methods
            function ddFunctions:NewItem(item)
                -- Instances
                local Item = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local ItemName = Instance.new("TextLabel")
                local UIStroke_3 = Instance.new('UIStroke')

                -- Properties
                do
                    Item.Name = item
                    Item.Parent = ItemsFrame
                    Item.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
                    Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Item.BorderSizePixel = 0
                    Item.Size = UDim2.new(0, 430, 0, 30)

                    UICorner_12.CornerRadius = UDim.new(0, 4)
                    UICorner_12.Parent = Item

                    ItemName.Name = item
                    ItemName.Parent = Item
                    ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ItemName.BackgroundTransparency = 1.000
                    ItemName.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ItemName.BorderSizePixel = 0
                    ItemName.Size = UDim2.new(1, 0, 1, 0)
                    ItemName.Font = Enum.Font.Gotham
                    ItemName.Text = v
                    ItemName.TextColor3 = Color3.fromRGB(175, 175, 175)
                    ItemName.TextSize = 14.000
                    ItemName.TextWrapped = true

                    UIStroke_3.Parent = Item
                    UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke_3.Color = Color3.fromRGB(80, 80, 80)
                end

                 -- Logics
                do
                    local hover, mouseDown;
                    Item.MouseEnter:Connect(function()
                        hover = true
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(150, 150, 150)})
                    end)

                    Item.MouseLeave:Connect(function()
                        hover = false
                        if not mouseDown then
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(80, 80, 80)})
                        end
                    end)

                    uis.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                            mouseDown = true

                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(200, 200, 200)})
                            Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

                            local s, retardedError = pcall(function()
                                args.Callback(ItemName.Text)
                            end)

                            if not s then print('Callback error: '.. retardedError) end
                        end
                    end)

                    uis.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            mouseDown = false

                            if ddFunctions.Opened then
                                ddFunctions:_open()
                            end

                            if hover then
                                Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(150, 150, 150)})
                                Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(66, 66, 66)})
                            else
                                Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(80, 80, 80)})
                                Tween({Time = .2}, Item, {BackgroundColor3 = Color3.fromRGB(66, 66, 66)})
                            end
                        end
                    end)
                end
            end

            function ddFunctions:Remove(itemName)
                for _, v in pairs(ItemsFrame:GetChildren()) do
                    if v.Name == itemName then
                        v:Destroy()
                        return
                    end
                end
                print('Attempting to remove a nil value')
            end

            function ddFunctions:SetVoid()
                for _, v in pairs(ItemsFrame:GetChildren()) do
                    if not v:IsA('UIListLayout') and not v:IsA('UIPadding') then
                        v:Destroy()
                    end
                end
            end

            function ddFunctions:_open()
                if ddFunctions.Opened == false then
                    Tween({
                        Time = .5,
                        Style = Enum.EasingStyle.Quint,
                        Direction = Enum.EasingDirection.Out
                    }, Dropdown, {Size = UDim2.new(1, -10, 0, 120)})
                    ddFunctions.Opened = true
                else
                    Tween({
                        Time = .5,
                        Style = Enum.EasingStyle.Quint,
                        Direction = Enum.EasingDirection.Out
                    }, Dropdown, {Size = UDim2.new(1, -10, 0, 40)})
                    ddFunctions.Opened = false
                end
            end

            -- Logics
            do
                local hover, mouseDown;
                Dropdown.MouseEnter:Connect(function()
                    hover = true
                    Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                end)

                Dropdown.MouseLeave:Connect(function()
                    hover = false
                    if not mouseDown then
                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                    end
                end)

                uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                        mouseDown = true

                        Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(255, 255, 255)})
                        Tween({Time = .2}, Dropdown, {BackgroundColor3 = Color3.fromRGB(90, 90, 90)})

                        ddFunctions:_open()
                    end
                end)

                uis.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if hover then
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(177, 177, 177)})
                            Tween({Time = .2}, Dropdown, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        else
                            Tween({Time = .2}, UIStroke, {Color = Color3.fromRGB(117, 117, 117)})
                            Tween({Time = .2}, Dropdown, {BackgroundColor3 = Color3.fromRGB(53, 53, 53)})
                        end
                    end
                end)
            end

            return ddFunctions
        end

        function elements:MakeInput(inputSettings)
            --- Instances
            local Input = Instance.new("Frame")
            local UICorner_20 = Instance.new("UICorner")
            local InputTitle = Instance.new("TextLabel")
            local UIStrokeIFrame = Instance.new('UIStroke')
            local UIPadding_11 = Instance.new("UIPadding")
            local InputFrame = Instance.new("Frame")
            local UICorner_14 = Instance.new("UICorner")
            local Input_2 = Instance.new("TextBox")
            local UIStrokeInput = Instance.new('UIStroke')

             -- Minimize things
            do
                local hover;
                Minimize.MouseEnter:Connect(function()
                    hover = true
                end)

                Minimize.MouseLeave:Connect(function()
                    hover = false
                end)

                uis.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and hover then
                        if not minimized then
                            Input_2.PlaceholderText = ''
                        else
                            Input_2.PlaceholderText = inputSettings.PlaceholderText or 'PlaceholderText'
                        end
                    end
                end)
            end

            -- Properties
            do
                Input.Name = "Input"
                Input.Parent = Elements
                Input.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Input.BorderSizePixel = 0
                Input.Size = UDim2.new(1, -10, 0, 50)

                UICorner_20.CornerRadius = UDim.new(0, 6)
                UICorner_20.Parent = Input

                InputTitle.Name = "InputTitle"
                InputTitle.Parent = Input
                InputTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                InputTitle.BackgroundTransparency = 1.000
                InputTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                InputTitle.BorderSizePixel = 0
                InputTitle.Position = UDim2.new(0, 0, 0, 15)
                InputTitle.Size = UDim2.new(0, 290, 0, 20)
                InputTitle.Font = Enum.Font.Gotham
                InputTitle.Text = inputSettings.Title or 'Text Input'
                InputTitle.TextColor3 = Color3.fromRGB(147, 147, 147)
                InputTitle.TextSize = 15.000
                InputTitle.TextWrapped = true
                InputTitle.TextXAlignment = Enum.TextXAlignment.Left

                UIStrokeIFrame.Parent = Input
                UIStrokeIFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStrokeIFrame.Color = Color3.fromRGB(117, 117, 117)

                UIPadding_11.Parent = InputTitle
                UIPadding_11.PaddingLeft = UDim.new(0, 15)

                InputFrame.Name = "InputFrame"
                InputFrame.Parent = Input
                InputFrame.AnchorPoint = Vector2.new(1, 0.5)
                InputFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                InputFrame.BorderSizePixel = 0
                InputFrame.Position = UDim2.new(0.967749476, 0, 0.5, 0)
                InputFrame.Size = UDim2.new(0, 100, 0, 30)

                UICorner_14.CornerRadius = UDim.new(0, 9)
                UICorner_14.Parent = InputFrame

                Input_2.Name = "Input"
                Input_2.Parent = InputFrame
                Input_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Input_2.BackgroundTransparency = 1.000
                Input_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Input_2.BorderSizePixel = 0
                Input_2.Position = UDim2.new(0, 0, 0.300000012, 0)
                Input_2.Size = UDim2.new(1.10000002, -10, -0.100000001, 14)
                Input_2.Font = Enum.Font.Gotham
                Input_2.PlaceholderText = inputSettings.PlaceholderText
                Input_2.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
                Input_2.Text = ''
                Input_2.TextColor3 = Color3.fromRGB(173, 173, 173)
                Input_2.TextSize = 14.000
                Input_2.TextWrapped = true

                UIStrokeInput.Parent = InputFrame
                UIStrokeInput.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStrokeInput.Color = Color3.fromRGB(117, 117, 117)

                if inputSettings.FocusLostRemove == false or not inputSettings.FocusLostRemove then
                    Input_2.ClearTextOnFocus = false
                end
            end

            -- Logics
            do
                InputFrame.Size = UDim2.new(0, Input_2.TextBounds.X + 24, 0, 30)

                Input.MouseEnter:Connect(function()
                    Tween({Time = .2}, UIStrokeIFrame, {Color = Color3.fromRGB(177, 177, 177)})
                    Tween({Time = .2}, UIStrokeInput, {Color = Color3.fromRGB(150, 150, 150)})
                end)

                Input.MouseLeave:Connect(function()
                    Tween({Time = .2}, UIStrokeIFrame, {Color = Color3.fromRGB(117, 117, 117)})
                    Tween({Time = .2}, UIStrokeInput, {Color = Color3.fromRGB(117, 117, 117)})
                end)

                Input_2:GetPropertyChangedSignal('Text'):Connect(function()
                    Tween({Time = .55, Style = Enum.EasingStyle.Quint}, InputFrame, {Size = UDim2.new(0, Input_2.TextBounds.X + 24, 0, 30)})
                end)

                Input_2.FocusLost:Connect(function()
                    local s, retardedError = pcall(function()
                        if Input_2.Text ~= '' then
                            inputSettings.Callback(Input_2.Text)
                        end
                    end)

                    if inputSettings.FocusLostRemove then
                        Input_2.Text = ''
                        Tween({Time = .55, Style = Enum.EasingStyle.Quint}, InputFrame, {Size = UDim2.new(0, 120, 0, 30)})
                    end

                    if not s then print('Callback error: '.. retardedError) end
                end)
            end
        end

        return elements
    end

    return tabHandler
end

return AtomLibrary
