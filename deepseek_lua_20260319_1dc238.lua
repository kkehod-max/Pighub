local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NeonHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = game:GetService("Lighting")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 400)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 24)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(40, 140, 255)
MainStroke.Transparency = 0.8
MainStroke.Parent = MainFrame

local GlowEffect = Instance.new("ImageLabel")
GlowEffect.Size = UDim2.new(1, 40, 1, 40)
GlowEffect.Position = UDim2.new(0, -20, 0, -20)
GlowEffect.BackgroundTransparency = 1
GlowEffect.Image = "rbxassetid://1316045217"
GlowEffect.ImageColor3 = Color3.fromRGB(40, 140, 255)
GlowEffect.ImageTransparency = 0.85
GlowEffect.ScaleType = Enum.ScaleType.Slice
GlowEffect.SliceCenter = Rect.new(10, 10, 118, 118)
GlowEffect.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 18, 25)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 24)
TopBarCorner.Parent = TopBar

local TopBarGradient = Instance.new("UIGradient")
TopBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 30, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 15, 25))
})
TopBarGradient.Rotation = 90
TopBarGradient.Parent = TopBar

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 32, 0, 32)
Icon.Position = UDim2.new(0, 15, 0.5, -16)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://12738417673"
Icon.ImageColor3 = Color3.fromRGB(40, 140, 255)
Icon.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 150, 1, 0)
Title.Position = UDim2.new(0, 55, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NEO N HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = TopBar

local TitleGlow = Instance.new("UIGradient")
TitleGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 140, 255))
})
TitleGlow.Rotation = 90
TitleGlow.Parent = Title

local WindowControls = Instance.new("Frame")
WindowControls.Size = UDim2.new(0, 120, 1, 0)
WindowControls.Position = UDim2.new(1, -120, 0, 0)
WindowControls.BackgroundTransparency = 1
WindowControls.Parent = TopBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(0, 15, 0.5, -17.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(180, 200, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 25
MinimizeButton.Parent = WindowControls

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinimizeButton

local MaxButton = Instance.new("TextButton")
MaxButton.Size = UDim2.new(0, 35, 0, 35)
MaxButton.Position = UDim2.new(0, 55, 0.5, -17.5)
MaxButton.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
MaxButton.Text = "□"
MaxButton.TextColor3 = Color3.fromRGB(180, 200, 255)
MaxButton.Font = Enum.Font.GothamBold
MaxButton.TextSize = 22
MaxButton.Parent = WindowControls

local MaxCorner = Instance.new("UICorner")
MaxCorner.CornerRadius = UDim.new(0, 12)
MaxCorner.Parent = MaxButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(0, 95, 0.5, -17.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 30, 35)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 180, 180)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.Parent = WindowControls

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseButton

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 150, 1, -60)
TabContainer.Position = UDim2.new(0, 0, 0, 60)
TabContainer.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 20)
TabCorner.Parent = TabContainer

local TabList = Instance.new("ScrollingFrame")
TabList.Size = UDim2.new(1, -20, 1, -20)
TabList.Position = UDim2.new(0, 10, 0, 10)
TabList.BackgroundTransparency = 1
TabList.BorderSizePixel = 0
TabList.CanvasSize = UDim2.new(0, 0, 0, 0)
TabList.ScrollBarThickness = 3
TabList.ScrollBarImageColor3 = Color3.fromRGB(40, 140, 255)
TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabList.Parent = TabContainer

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 8)
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabList

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -160, 1, -60)
ContentFrame.Position = UDim2.new(0, 160, 0, 60)
ContentFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 20)
ContentCorner.Parent = ContentFrame

local ContentGradient = Instance.new("UIGradient")
ContentGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 30, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 20, 28))
})
ContentGradient.Rotation = 45
ContentGradient.Parent = ContentFrame

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -30, 1, -30)
Container.Position = UDim2.new(0, 15, 0, 15)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.ScrollBarThickness = 4
Container.ScrollBarImageColor3 = Color3.fromRGB(40, 140, 255)
Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
Container.Parent = ContentFrame

local ContainerLayout = Instance.new("UIListLayout")
ContainerLayout.Padding = UDim.new(0, 10)
ContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContainerLayout.Parent = Container

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.Parent = Container

local Tabs = {}
local SelectedTab = nil

local function createTab(name, icon, color)
    color = color or Color3.fromRGB(40, 140, 255)
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 55)
    btn.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    btn.Text = ""
    btn.Parent = TabList
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 16)
    btnCorner.Parent = btn
    
    local btnIcon = Instance.new("ImageLabel")
    btnIcon.Size = UDim2.new(0, 28, 0, 28)
    btnIcon.Position = UDim2.new(0, 15, 0.5, -14)
    btnIcon.BackgroundTransparency = 1
    btnIcon.Image = icon or "rbxassetid://6031094678"
    btnIcon.ImageColor3 = color
    btnIcon.Parent = btn
    
    local btnText = Instance.new("TextLabel")
    btnText.Size = UDim2.new(1, -55, 1, 0)
    btnText.Position = UDim2.new(0, 50, 0, 0)
    btnText.BackgroundTransparency = 1
    btnText.Text = name
    btnText.TextColor3 = Color3.fromRGB(200, 210, 230)
    btnText.TextXAlignment = Enum.TextXAlignment.Left
    btnText.Font = Enum.Font.GothamBold
    btnText.TextSize = 14
    btnText.Parent = btn
    
    local btnGlow = Instance.new("ImageLabel")
    btnGlow.Size = UDim2.new(1, 20, 1, 20)
    btnGlow.Position = UDim2.new(0, -10, 0, -10)
    btnGlow.BackgroundTransparency = 1
    btnGlow.Image = "rbxassetid://1316045217"
    btnGlow.ImageColor3 = color
    btnGlow.ImageTransparency = 0.9
    btnGlow.ScaleType = Enum.ScaleType.Slice
    btnGlow.SliceCenter = Rect.new(10, 10, 118, 118)
    btnGlow.Visible = false
    btnGlow.Parent = btn
    
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 4, 0, 30)
    indicator.Position = UDim2.new(1, -6, 0.5, -15)
    indicator.BackgroundColor3 = color
    indicator.Visible = false
    indicator.Parent = btn
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = indicator
    
    table.insert(Tabs, {
        Name = name,
        Button = btn,
        Icon = btnIcon,
        Text = btnText,
        Glow = btnGlow,
        Indicator = indicator,
        Color = color
    })
    
    return btn
end

local function createSection(title)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, -10, 0, 35)
    section.BackgroundTransparency = 1
    section.Parent = Container
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Size = UDim2.new(0, 200, 1, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = title
    sectionTitle.TextColor3 = Color3.fromRGB(140, 160, 200)
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 16
    sectionTitle.Parent = section
    
    return section
end

local function createCard(title, desc, color)
    color = color or Color3.fromRGB(40, 140, 255)
    
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, -10, 0, 80)
    card.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    card.Parent = Container
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 18)
    cardCorner.Parent = card
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Thickness = 1.5
    cardStroke.Color = color
    cardStroke.Transparency = 0.8
    cardStroke.Parent = card
    
    local cardIcon = Instance.new("Frame")
    cardIcon.Size = UDim2.new(0, 50, 0, 50)
    cardIcon.Position = UDim2.new(0, 15, 0.5, -25)
    cardIcon.BackgroundColor3 = color
    cardIcon.BackgroundTransparency = 0.9
    cardIcon.Parent = card
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 14)
    iconCorner.Parent = cardIcon
    
    local iconImage = Instance.new("ImageLabel")
    iconImage.Size = UDim2.new(0, 30, 0, 30)
    iconImage.Position = UDim2.new(0.5, -15, 0.5, -15)
    iconImage.BackgroundTransparency = 1
    iconImage.Image = "rbxassetid://6031094678"
    iconImage.ImageColor3 = color
    iconImage.Parent = cardIcon
    
    local cardTitle = Instance.new("TextLabel")
    cardTitle.Size = UDim2.new(1, -140, 0, 25)
    cardTitle.Position = UDim2.new(0, 80, 0, 15)
    cardTitle.BackgroundTransparency = 1
    cardTitle.Text = title
    cardTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    cardTitle.TextXAlignment = Enum.TextXAlignment.Left
    cardTitle.Font = Enum.Font.GothamBold
    cardTitle.TextSize = 16
    cardTitle.Parent = card
    
    local cardDesc = Instance.new("TextLabel")
    cardDesc.Size = UDim2.new(1, -140, 0, 20)
    cardDesc.Position = UDim2.new(0, 80, 0, 40)
    cardDesc.BackgroundTransparency = 1
    cardDesc.Text = desc
    cardDesc.TextColor3 = Color3.fromRGB(160, 170, 190)
    cardDesc.TextXAlignment = Enum.TextXAlignment.Left
    cardDesc.Font = Enum.Font.Gotham
    cardDesc.TextSize = 12
    cardDesc.Parent = card
    
    local cardBtn = Instance.new("TextButton")
    cardBtn.Size = UDim2.new(0, 70, 0, 35)
    cardBtn.Position = UDim2.new(1, -85, 0.5, -17.5)
    cardBtn.BackgroundColor3 = color
    cardBtn.Text = "เปิด"
    cardBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    cardBtn.Font = Enum.Font.GothamBold
    cardBtn.TextSize = 13
    cardBtn.Parent = card
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = cardBtn
    
    return card
end

local function createToggle(text, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(1, -10, 0, 60)
    toggle.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    toggle.Parent = Container
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 18)
    toggleCorner.Parent = toggle
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Thickness = 1.5
    toggleStroke.Color = Color3.fromRGB(60, 70, 90)
    toggleStroke.Transparency = 0.7
    toggleStroke.Parent = toggle
    
    local toggleText = Instance.new("TextLabel")
    toggleText.Size = UDim2.new(1, -90, 1, 0)
    toggleText.Position = UDim2.new(0, 20, 0, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = text
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Font = Enum.Font.Gotham
    toggleText.TextSize = 14
    toggleText.Parent = toggle
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 55, 0, 28)
    toggleBtn.Position = UDim2.new(1, -70, 0.5, -14)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(40, 140, 255) or Color3.fromRGB(50, 55, 70)
    toggleBtn.Text = ""
    toggleBtn.Parent = toggle
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(1, 0)
    btnCorner.Parent = toggleBtn
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Size = UDim2.new(0, 22, 0, 22)
    toggleCircle.Position = default and UDim2.new(1, -27, 0.5, -11) or UDim2.new(0, 5, 0.5, -11)
    toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.Parent = toggleBtn
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    local state = default
    
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(40, 140, 255) or Color3.fromRGB(50, 55, 70)}):Play()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -27, 0.5, -11) or UDim2.new(0, 5, 0.5, -11)}):Play()
        callback(state)
    end)
    
    return toggle
end

local function createSlider(text, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, -10, 0, 75)
    slider.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    slider.Parent = Container
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 18)
    sliderCorner.Parent = slider
    
    local sliderStroke = Instance.new("UIStroke")
    sliderStroke.Thickness = 1.5
    sliderStroke.Color = Color3.fromRGB(60, 70, 90)
    sliderStroke.Transparency = 0.7
    sliderStroke.Parent = slider
    
    local sliderText = Instance.new("TextLabel")
    sliderText.Size = UDim2.new(1, -80, 0, 25)
    sliderText.Position = UDim2.new(0, 20, 0, 10)
    sliderText.BackgroundTransparency = 1
    sliderText.Text = text
    sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    sliderText.Font = Enum.Font.Gotham
    sliderText.TextSize = 14
    sliderText.Parent = slider
    
    local sliderValue = Instance.new("TextLabel")
    sliderValue.Size = UDim2.new(0, 50, 0, 25)
    sliderValue.Position = UDim2.new(1, -70, 0, 10)
    sliderValue.BackgroundTransparency = 1
    sliderValue.Text = default
    sliderValue.TextColor3 = Color3.fromRGB(40, 140, 255)
    sliderValue.Font = Enum.Font.GothamBold
    sliderValue.TextSize = 16
    sliderValue.Parent = slider
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, -40, 0, 6)
    sliderBg.Position = UDim2.new(0, 20, 0, 50)
    sliderBg.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
    sliderBg.Parent = slider
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(1, 0)
    bgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(40, 140, 255)
    sliderFill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    local value = default
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local dragConnection
            dragConnection = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = UserInputService:GetMouseLocation()
                    local absPos = sliderBg.AbsolutePosition
                    local size = sliderBg.AbsoluteSize.X
                    
                    local percent = math.clamp((mousePos.X - absPos.X) / size, 0, 1)
                    sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    
                    value = math.floor(min + (max - min) * percent)
                    sliderValue.Text = value
                    callback(value)
                end
            end)
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragConnection:Disconnect()
                end
            end)
        end
    end)
    
    return slider
end

local function createButton(text, color, callback)
    color = color or Color3.fromRGB(40, 140, 255)
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.BackgroundColor3 = color
    btn.Text = ""
    btn.Parent = Container
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 16)
    btnCorner.Parent = btn
    
    local btnText = Instance.new("TextLabel")
    btnText.Size = UDim2.new(1, -40, 1, 0)
    btnText.Position = UDim2.new(0, 20, 0, 0)
    btnText.BackgroundTransparency = 1
    btnText.Text = text
    btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnText.TextXAlignment = Enum.TextXAlignment.Left
    btnText.Font = Enum.Font.GothamBold
    btnText.TextSize = 15
    btnText.Parent = btn
    
    local btnArrow = Instance.new("ImageLabel")
    btnArrow.Size = UDim2.new(0, 20, 0, 20)
    btnArrow.Position = UDim2.new(1, -40, 0.5, -10)
    btnArrow.BackgroundTransparency = 1
    btnArrow.Image = "rbxassetid://6031094678"
    btnArrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    btnArrow.Rotation = 180
    btnArrow.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

local homeTab = createTab("หน้าแรก", "rbxassetid://6031094678", Color3.fromRGB(40, 140, 255))
local combatTab = createTab("ต่อสู้", "rbxassetid://6031094678", Color3.fromRGB(255, 70, 70))
local playerTab = createTab("ผู้เล่น", "rbxassetid://6031094678", Color3.fromRGB(70, 255, 140))
local worldTab = createTab("โลก", "rbxassetid://6031094678", Color3.fromRGB(255, 200, 70))
local settingTab = createTab("ตั้งค่า", "rbxassetid://6031094678", Color3.fromRGB(170, 100, 255))

local function clearContainer()
    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

local function loadHomeTab()
    clearContainer()
    createSection("🔥 ฟีเจอร์ยอดนิยม")
    createCard("ระบบอัตโนมัติ", "จัดการทุกอย่างอัตโนมัติ", Color3.fromRGB(40, 140, 255))
    createCard("ฟาร์มเงินไว", "เพิ่มความเร็วในการฟาร์ม", Color3.fromRGB(70, 255, 140))
    createToggle("เปิดใช้งานทั้งหมด", false, function(v) print("All:", v) end)
    createSlider("ความเร็ว", 1, 100, 50, function(v) print("Speed:", v) end)
end

local function loadCombatTab()
    clearContainer()
    createSection("⚔️ ระบบต่อสู้")
    createToggle("โจมตีอัตโนมัติ", true, function(v) print("Auto attack:", v) end)
    createToggle("หลบหลีก", true, function(v) print("Dodge:", v) end)
    createToggle("ใช้สกิล", false, function(v) print("Skills:", v) end)
    createSlider("ระยะโจมตี", 10, 100, 50, function(v) print("Range:", v) end)
    createButton("ใช้สกิลทั้งหมด", Color3.fromRGB(255, 70, 70), function() print("Use all") end)
end

local function loadPlayerTab()
    clearContainer()
    createSection("👤 ผู้เล่น")
    createToggle("เดินเร็ว", false, function(v) print("Speed:", v) end)
    createToggle("กระโดดสูง", false, function(v) print("Jump:", v) end)
    createToggle("มองทะลุกำแพง", false, function(v) print("ESP:", v) end)
    createSlider("ความเร็วเดิน", 16, 200, 16, function(v) print("Walk speed:", v) end)
    createButton("ฟื้นฟูพลัง", Color3.fromRGB(70, 255, 140), function() print("Heal") end)
end

local function loadWorldTab()
    clearContainer()
    createSection("🌍 โลก")
    createToggle("ตกไม่ตาย", true, function(v) print("No fall:", v) end)
    createToggle("มองตอนกลางคืน", false, function(v) print("Night vision:", v) end)
    createToggle("เก็บของอัตโนมัติ", true, function(v) print("Auto collect:", v) end)
    createSlider("เวลาในเกม", 0, 24, 12, function(v) print("Time:", v) end)
    createButton("โทรพอร์ต", Color3.fromRGB(255, 200, 70), function() print("Teleport") end)
end

local function loadSettingTab()
    clearContainer()
    createSection("⚙️ ตั้งค่า")
    createToggle("แสดง UI", true, function(v) print("Show UI:", v) end)
    createToggle("เสียง", true, function(v) print("Sound:", v) end)
    createToggle("แจ้งเตือน", true, function(v) print("Notify:", v) end)
    createSlider("ความโปร่งใส", 0, 100, 0, function(v) print("Alpha:", v) end)
    createButton("ออกจากระบบ", Color3.fromRGB(255, 70, 70), function()
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 0}):Play()
        wait(0.3)
        ScreenGui:Destroy()
        Blur:Destroy()
    end)
end

for _, tab in ipairs(Tabs) do
    tab.Button.MouseButton1Click:Connect(function()
        for _, t in ipairs(Tabs) do
            t.Button.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
            t.Icon.ImageColor3 = t.Color
            t.Text.TextColor3 = Color3.fromRGB(200, 210, 230)
            t.Glow.Visible = false
            t.Indicator.Visible = false
        end
        
        tab.Button.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
        tab.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        tab.Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.Glow.Visible = true
        tab.Indicator.Visible = true
        
        if tab.Name == "หน้าแรก" then loadHomeTab()
        elseif tab.Name == "ต่อสู้" then loadCombatTab()
        elseif tab.Name == "ผู้เล่น" then loadPlayerTab()
        elseif tab.Name == "โลก" then loadWorldTab()
        elseif tab.Name == "ตั้งค่า" then loadSettingTab()
        end
    end)
end

loadHomeTab()

local isMinimized = false
local originalSize = MainFrame.Size
local originalPos = MainFrame.Position

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 300, 0, 50),
            Position = UDim2.new(1, -320, 0, 10)
        }):Play()
        MinimizeButton.Text = "□"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = originalSize,
            Position = originalPos
        }):Play()
        MinimizeButton.Text = "−"
    end
end)

MaxButton.MouseButton1Click:Connect(function()
    if isMinimized then
        isMinimized = false
        MinimizeButton.Text = "−"
    end
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 800, 0, 500),
        Position = UDim2.new(0.5, -400, 0.5, -250)
    }):Play()
    originalSize = UDim2.new(0, 800, 0, 500)
    originalPos = UDim2.new(0.5, -400, 0.5, -250)
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 50, 60)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 30, 35)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 0}):Play()
    wait(0.3)
    ScreenGui:Destroy()
    Blur:Destroy()
end)

local dragging = false
local dragInput
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        originalPos = MainFrame.Position
    end
end)

TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 15}):Play()
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 650, 0, 400)}):Play()