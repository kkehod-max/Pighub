-- UI Framework สุดล้ำ สไตล์ค่ายดัง (Modern UI)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UniversalHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = game:GetService("Lighting")

local function createShadow(parent, size, transparency)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, size or 20, 1, size or 20)
    shadow.Position = UDim2.new(0, -(size or 20)/2, 0, -(size or 20)/2)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = transparency or 0.6
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Parent = parent
    return shadow
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 800, 0, 550)
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

createShadow(MainFrame, 30, 0.4)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(45, 50, 60)
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 35, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 22, 27))
})
TopGradient.Rotation = 90
TopGradient.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 20)
TopBarCorner.Parent = TopBar

local TopBarStroke = Instance.new("UIStroke")
TopBarStroke.Thickness = 1.5
TopBarStroke.Color = Color3.fromRGB(60, 70, 85)
TopBarStroke.Transparency = 0.6
TopBarStroke.Parent = TopBar

local TopBarGradient = Instance.new("UIGradient")
TopBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 40, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 25, 32))
})
TopBarGradient.Rotation = 90
TopBarGradient.Parent = TopBar

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 40, 0, 40)
Icon.Position = UDim2.new(0, 20, 0.5, -20)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://12738417673"
Icon.ImageColor3 = Color3.fromRGB(100, 180, 255)
Icon.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 70, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "UNIVERSAL HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextTransparency = 0.1
Title.Parent = TopBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 200, 255))
})
TitleGradient.Rotation = 90
TitleGradient.Parent = Title

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 60, 1, 0)
Version.Position = UDim2.new(1, -170, 0, 0)
Version.BackgroundTransparency = 1
Version.Text = "v2.5.0"
Version.TextColor3 = Color3.fromRGB(150, 160, 180)
Version.TextXAlignment = Enum.TextXAlignment.Right
Version.Font = Enum.Font.Gotham
Version.TextSize = 14
Version.TextTransparency = 0.3
Version.Parent = TopBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(1, -100, 0.5, -17.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 25
MinimizeButton.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinimizeButton

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 60, 75)}):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 45, 55)}):Play()
end)

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -55, 0.5, -17.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 40, 45)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(220, 220, 220)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseButton

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 70)}):Play()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 40, 45)}):Play()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 0}):Play()
    wait(0.3)
    ScreenGui:Destroy()
    Blur:Destroy()
end)

local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 180, 1, -80)
LeftPanel.Position = UDim2.new(0, 0, 0, 70)
LeftPanel.BackgroundColor3 = Color3.fromRGB(18, 20, 25)
LeftPanel.BorderSizePixel = 0
LeftPanel.Parent = MainFrame

local LeftCorner = Instance.new("UICorner")
LeftCorner.CornerRadius = UDim.new(0, 15)
LeftCorner.Parent = LeftPanel

local LeftStroke = Instance.new("UIStroke")
LeftStroke.Thickness = 1.5
LeftStroke.Color = Color3.fromRGB(45, 50, 60)
LeftStroke.Transparency = 0.6
LeftStroke.Parent = LeftPanel

local UserProfile = Instance.new("Frame")
UserProfile.Size = UDim2.new(1, -20, 0, 60)
UserProfile.Position = UDim2.new(0, 10, 0, 15)
UserProfile.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
UserProfile.Parent = LeftPanel

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 12)
ProfileCorner.Parent = UserProfile

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0, 40, 0, 40)
Avatar.Position = UDim2.new(0, 10, 0.5, -20)
Avatar.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
Avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Avatar.Parent = UserProfile

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = Avatar

local UserName = Instance.new("TextLabel")
UserName.Size = UDim2.new(1, -60, 0, 20)
UserName.Position = UDim2.new(0, 60, 0, 10)
UserName.BackgroundTransparency = 1
UserName.Text = LocalPlayer.Name
UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
UserName.TextXAlignment = Enum.TextXAlignment.Left
UserName.Font = Enum.Font.GothamBold
UserName.TextSize = 14
UserName.Parent = UserProfile

local UserStatus = Instance.new("TextLabel")
UserStatus.Size = UDim2.new(1, -60, 0, 20)
UserStatus.Position = UDim2.new(0, 60, 0, 30)
UserStatus.BackgroundTransparency = 1
UserStatus.Text = "Premium • Online"
UserStatus.TextColor3 = Color3.fromRGB(100, 200, 150)
UserStatus.TextXAlignment = Enum.TextXAlignment.Left
UserStatus.Font = Enum.Font.Gotham
UserStatus.TextSize = 12
UserStatus.Parent = UserProfile

local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Size = UDim2.new(1, -20, 1, -100)
TabContainer.Position = UDim2.new(0, 10, 0, 85)
TabContainer.BackgroundTransparency = 1
TabContainer.BorderSizePixel = 0
TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TabContainer.ScrollBarThickness = 3
TabContainer.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 100)
TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabContainer.Parent = LeftPanel

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 8)
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabContainer

local Tabs = {}
local TabButtons = {}
local CurrentTab = nil

local function createTab(name, icon, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.BackgroundColor3 = Color3.fromRGB(28, 32, 38)
    btn.Text = ""
    btn.Parent = TabContainer
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1.5
    btnStroke.Color = Color3.fromRGB(50, 55, 65)
    btnStroke.Transparency = 0.7
    btnStroke.Parent = btn
    
    local btnIcon = Instance.new("ImageLabel")
    btnIcon.Size = UDim2.new(0, 24, 0, 24)
    btnIcon.Position = UDim2.new(0, 15, 0.5, -12)
    btnIcon.BackgroundTransparency = 1
    btnIcon.Image = icon or "rbxassetid://3926305904"
    btnIcon.ImageColor3 = color or Color3.fromRGB(150, 170, 200)
    btnIcon.Parent = btn
    
    local btnText = Instance.new("TextLabel")
    btnText.Size = UDim2.new(1, -50, 1, 0)
    btnText.Position = UDim2.new(0, 45, 0, 0)
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
    btnGlow.ImageColor3 = color or Color3.fromRGB(100, 150, 255)
    btnGlow.ImageTransparency = 0.9
    btnGlow.ScaleType = Enum.ScaleType.Slice
    btnGlow.SliceCenter = Rect.new(10, 10, 118, 118)
    btnGlow.Visible = false
    btnGlow.Parent = btn
    
    table.insert(Tabs, {
        Name = name,
        Button = btn,
        Icon = btnIcon,
        Text = btnText,
        Glow = btnGlow,
        Color = color or Color3.fromRGB(100, 150, 255)
    })
    table.insert(TabButtons, btn)
    
    return btn
end

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(1, -190, 1, -80)
RightPanel.Position = UDim2.new(0, 190, 0, 70)
RightPanel.BackgroundColor3 = Color3.fromRGB(23, 26, 32)
RightPanel.BorderSizePixel = 0
RightPanel.Parent = MainFrame

local RightCorner = Instance.new("UICorner")
RightCorner.CornerRadius = UDim.new(0, 15)
RightCorner.Parent = RightPanel

local RightStroke = Instance.new("UIStroke")
RightStroke.Thickness = 1.5
RightStroke.Color = Color3.fromRGB(50, 55, 65)
RightStroke.Transparency = 0.6
RightStroke.Parent = RightPanel

local SearchBar = Instance.new("Frame")
SearchBar.Size = UDim2.new(1, -30, 0, 45)
SearchBar.Position = UDim2.new(0, 15, 0, 15)
SearchBar.BackgroundColor3 = Color3.fromRGB(30, 34, 40)
SearchBar.Parent = RightPanel

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 12)
SearchCorner.Parent = SearchBar

local SearchIcon = Instance.new("ImageLabel")
SearchIcon.Size = UDim2.new(0, 20, 0, 20)
SearchIcon.Position = UDim2.new(0, 15, 0.5, -10)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Image = "rbxassetid://7072725342"
SearchIcon.ImageColor3 = Color3.fromRGB(140, 150, 170)
SearchIcon.Parent = SearchBar

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -50, 1, 0)
SearchBox.Position = UDim2.new(0, 45, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.PlaceholderText = "ค้นหาฟีเจอร์..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 150)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 14
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = SearchBar

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -30, 1, -80)
Container.Position = UDim2.new(0, 15, 0, 70)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.ScrollBarThickness = 5
Container.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 100)
Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
Container.Parent = RightPanel

local ContainerLayout = Instance.new("UIListLayout")
ContainerLayout.Padding = UDim.new(0, 12)
ContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContainerLayout.Parent = Container

local ContainerPadding = Instance.new("UIPadding")
ContainerPadding.PaddingTop = UDim.new(0, 5)
ContainerPadding.PaddingBottom = UDim.new(0, 5)
ContainerPadding.Parent = Container

local function createSection(title)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 40)
    section.BackgroundTransparency = 1
    section.Parent = Container
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Size = UDim2.new(0, 200, 1, 0)
    sectionTitle.Position = UDim2.new(0, 0, 0, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = title
    sectionTitle.TextColor3 = Color3.fromRGB(180, 190, 210)
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 18
    sectionTitle.Parent = section
    
    local sectionLine = Instance.new("Frame")
    sectionLine.Size = UDim2.new(1, -220, 0, 2)
    sectionLine.Position = UDim2.new(0, 210, 0.5, -1)
    sectionLine.BackgroundColor3 = Color3.fromRGB(60, 70, 85)
    sectionLine.BackgroundTransparency = 0.5
    sectionLine.Parent = section
    
    return section
end

local function createCard(title, description, icon, color)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 90)
    card.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
    card.Parent = Container
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 16)
    cardCorner.Parent = card
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Thickness = 1.5
    cardStroke.Color = Color3.fromRGB(60, 70, 85)
    cardStroke.Transparency = 0.7
    cardStroke.Parent = card
    
    local cardIcon = Instance.new("ImageLabel")
    cardIcon.Size = UDim2.new(0, 50, 0, 50)
    cardIcon.Position = UDim2.new(0, 20, 0.5, -25)
    cardIcon.BackgroundColor3 = color or Color3.fromRGB(70, 120, 255)
    cardIcon.BackgroundTransparency = 0.9
    cardIcon.Image = icon or "rbxassetid://3926305904"
    cardIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    cardIcon.Parent = card
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 14)
    iconCorner.Parent = cardIcon
    
    local cardTitle = Instance.new("TextLabel")
    cardTitle.Size = UDim2.new(1, -200, 0, 25)
    cardTitle.Position = UDim2.new(0, 90, 0, 20)
    cardTitle.BackgroundTransparency = 1
    cardTitle.Text = title
    cardTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    cardTitle.TextXAlignment = Enum.TextXAlignment.Left
    cardTitle.Font = Enum.Font.GothamBold
    cardTitle.TextSize = 16
    cardTitle.Parent = card
    
    local cardDesc = Instance.new("TextLabel")
    cardDesc.Size = UDim2.new(1, -200, 0, 20)
    cardDesc.Position = UDim2.new(0, 90, 0, 45)
    cardDesc.BackgroundTransparency = 1
    cardDesc.Text = description
    cardDesc.TextColor3 = Color3.fromRGB(160, 170, 190)
    cardDesc.TextXAlignment = Enum.TextXAlignment.Left
    cardDesc.Font = Enum.Font.Gotham
    cardDesc.TextSize = 13
    cardDesc.Parent = card
    
    local cardButton = Instance.new("TextButton")
    cardButton.Size = UDim2.new(0, 80, 0, 35)
    cardButton.Position = UDim2.new(1, -100, 0.5, -17.5)
    cardButton.BackgroundColor3 = color or Color3.fromRGB(70, 120, 255)
    cardButton.Text = "เปิด"
    cardButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    cardButton.Font = Enum.Font.GothamBold
    cardButton.TextSize = 14
    cardButton.Parent = card
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = cardButton
    
    return card
end

local function createToggle(text, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(1, 0, 0, 60)
    toggle.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
    toggle.Parent = Container
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 16)
    toggleCorner.Parent = toggle
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Thickness = 1.5
    toggleStroke.Color = Color3.fromRGB(60, 70, 85)
    toggleStroke.Transparency = 0.7
    toggleStroke.Parent = toggle
    
    local toggleText = Instance.new("TextLabel")
    toggleText.Size = UDim2.new(1, -100, 1, 0)
    toggleText.Position = UDim2.new(0, 20, 0, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = text
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Font = Enum.Font.Gotham
    toggleText.TextSize = 15
    toggleText.Parent = toggle
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 60, 0, 30)
    toggleBtn.Position = UDim2.new(1, -80, 0.5, -15)
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(70, 140, 255) or Color3.fromRGB(60, 65, 75)
    toggleBtn.Text = ""
    toggleBtn.Parent = toggle
    
    local toggleBtnCorner = Instance.new("UICorner")
    toggleBtnCorner.CornerRadius = UDim.new(1, 0)
    toggleBtnCorner.Parent = toggleBtn
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Size = UDim2.new(0, 24, 0, 24)
    toggleCircle.Position = default and UDim2.new(1, -29, 0.5, -12) or UDim2.new(0, 5, 0.5, -12)
    toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.Parent = toggleBtn
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    local state = default
    
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(70, 140, 255) or Color3.fromRGB(60, 65, 75)}):Play()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -29, 0.5, -12) or UDim2.new(0, 5, 0.5, -12)}):Play()
        callback(state)
    end)
    
    return toggle
end

local function createSlider(text, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, 0, 0, 80)
    slider.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
    slider.Parent = Container
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 16)
    sliderCorner.Parent = slider
    
    local sliderStroke = Instance.new("UIStroke")
    sliderStroke.Thickness = 1.5
    sliderStroke.Color = Color3.fromRGB(60, 70, 85)
    sliderStroke.Transparency = 0.7
    sliderStroke.Parent = slider
    
    local sliderText = Instance.new("TextLabel")
    sliderText.Size = UDim2.new(1, -100, 0, 30)
    sliderText.Position = UDim2.new(0, 20, 0, 10)
    sliderText.BackgroundTransparency = 1
    sliderText.Text = text .. ": " .. default
    sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    sliderText.Font = Enum.Font.Gotham
    sliderText.TextSize = 15
    sliderText.Parent = slider
    
    local sliderValue = Instance.new("TextLabel")
    sliderValue.Size = UDim2.new(0, 60, 0, 30)
    sliderValue.Position = UDim2.new(1, -80, 0, 10)
    sliderValue.BackgroundTransparency = 1
    sliderValue.Text = default .. "%"
    sliderValue.TextColor3 = Color3.fromRGB(70, 140, 255)
    sliderValue.Font = Enum.Font.GothamBold
    sliderValue.TextSize = 16
    sliderValue.Parent = slider
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, -40, 0, 8)
    sliderBg.Position = UDim2.new(0, 20, 0, 50)
    sliderBg.BackgroundColor3 = Color3.fromRGB(45, 50, 60)
    sliderBg.Parent = slider
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
    sliderFill.Parent = sliderBg
    
    local sliderFillCorner = Instance.new("UICorner")
    sliderFillCorner.CornerRadius = UDim.new(1, 0)
    sliderFillCorner.Parent = sliderFill
    
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
                    sliderText.Text = text .. ": " .. value
                    sliderValue.Text = value .. "%"
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
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 55)
    btn.BackgroundColor3 = color or Color3.fromRGB(70, 120, 255)
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
    btnText.TextSize = 16
    btnText.Parent = btn
    
    local btnArrow = Instance.new("ImageLabel")
    btnArrow.Size = UDim2.new(0, 24, 0, 24)
    btnArrow.Position = UDim2.new(1, -44, 0.5, -12)
    btnArrow.BackgroundTransparency = 1
    btnArrow.Image = "rbxassetid://6031094678"
    btnArrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    btnArrow.Rotation = 180
    btnArrow.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

local MainTab = createTab("หน้าแรก", "rbxassetid://6031094678", Color3.fromRGB(70, 140, 255))
local CombatTab = createTab("ต่อสู้", "rbxassetid://6031094678", Color3.fromRGB(255, 70, 70))
local PlayerTab = createTab("ผู้เล่น", "rbxassetid://6031094678", Color3.fromRGB(70, 255, 140))
local WorldTab = createTab("โลก", "rbxassetid://6031094678", Color3.fromRGB(255, 200, 70))
local SettingsTab = createTab("ตั้งค่า", "rbxassetid://6031094678", Color3.fromRGB(170, 100, 255))

local function clearContainer()
    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

local function loadHomeTab()
    clearContainer()
    createSection("👋 ยินดีต้อนรับ")
    createCard("ระบบอัตโนมัติ", "จัดการทุกอย่างอัตโนมัติ", "rbxassetid://6031094678", Color3.fromRGB(70, 140, 255))
    createCard("ฟาร์มเงิน", "ฟาร์มเงินอัตโนมัติ", "rbxassetid://6031094678", Color3.fromRGB(70, 255, 140))
    
    createSection("⚙️ ระบบหลัก")
    createToggle("เปิดใช้งานทั้งหมด", false, function(v) print("Master toggle:", v) end)
    createSlider("ความเร็ว", 0, 100, 50, function(v) print("Speed:", v) end)
    createButton("เริ่มทำงานทันที", Color3.fromRGB(70, 140, 255), function() print("Start clicked") end)
end

local function loadCombatTab()
    clearContainer()
    createSection("⚔️ ระบบต่อสู้")
    createToggle("โหมดอัตโนมัติ", true, function(v) print("Auto combat:", v) end)
    createToggle("หลบหลีกอัตโนมัติ", true, function(v) print("Auto dodge:", v) end)
    createToggle("ใช้สกิล", false, function(v) print("Use skills:", v) end)
    
    createSection("🎯 เป้าหมาย")
    createSlider("ระยะโจมตี", 10, 100, 50, function(v) print("Range:", v) end)
    createSlider("ความแรง", 1, 10, 5, function(v) print("Power:", v) end)
    
    createSection("💥 สกิลพิเศษ")
    createButton("ใช้สกิลทั้งหมด", Color3.fromRGB(255, 70, 70), function() print("Use all skills") end)
end

local function loadPlayerTab()
    clearContainer()
    createSection("👤 ผู้เล่น")
    createToggle("เดินเร็ว", false, function(v) print("Speed boost:", v) end)
    createToggle("กระโดดสูง", false, function(v) print("High jump:", v) end)
    createToggle("มองทะลุ", false, function(v) print("ESP:", v) end)
    
    createSection("📊 สถานะ")
    createSlider("ความเร็วเดิน", 16, 100, 16, function(v) print("Walk speed:", v) end)
    createSlider("พลังกระโดด", 50, 200, 50, function(v) print("Jump power:", v) end)
    
    createButton("ฟื้นฟูเต็มที่", Color3.fromRGB(70, 255, 140), function() print("Heal") end)
end

local function loadWorldTab()
    clearContainer()
    createSection("🌍 โลก")
    createToggle("ตกไม่ตาย", true, function(v) print("No fall:", v) end)
    createToggle("มองตอนกลางคืน", false, function(v) print("Night vision:", v) end)
    createToggle("เก็บของอัตโนมัติ", true, function(v) print("Auto collect:", v) end)
    
    createSection("⏰ เวลา")
    createSlider("เวลาในเกม", 0, 24, 12, function(v) print("Time:", v) end)
    createSlider("ความเร็วเวลา", 1, 10, 1, function(v) print("Time speed:", v) end)
    
    createButton("โทรพอร์ตไปที่หมาย", Color3.fromRGB(255, 200, 70), function() print("Teleport") end)
end

local function loadSettingsTab()
    clearContainer()
    createSection("⚙️ ตั้งค่า")
    createToggle("แสดง UI", true, function(v) print("Show UI:", v) end)
    createToggle("เสียง", true, function(v) print("Sound:", v) end)
    createToggle("แจ้งเตือน", true, function(v) print("Notifications:", v) end)
    
    createSection("🎨 ธีม")
    createSlider("ความโปร่งใส", 0, 100, 0, function(v) print("Transparency:", v) end)
    createSlider("ขนาด UI", 80, 120, 100, function(v) print("UI Scale:", v) end)
    
    createButton("รีเซ็ตการตั้งค่า", Color3.fromRGB(170, 100, 255), function() print("Reset settings") end)
    createButton("ออกจากระบบ", Color3.fromRGB(255, 70, 70), function() 
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        wait(0.3)
        ScreenGui:Destroy()
        Blur:Destroy()
    end)
end

for i, tab in ipairs(Tabs) do
    tab.Button.MouseButton1Click:Connect(function()
        for _, btn in ipairs(Tabs) do
            btn.Button.BackgroundColor3 = Color3.fromRGB(28, 32, 38)
            btn.Icon.ImageColor3 = btn.Color
            btn.Text.TextColor3 = Color3.fromRGB(200, 210, 230)
            btn.Glow.Visible = false
        end
        
        tab.Button.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
        tab.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        tab.Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.Glow.Visible = true
        
        if tab.Name == "หน้าแรก" then loadHomeTab()
        elseif tab.Name == "ต่อสู้" then loadCombatTab()
        elseif tab.Name == "ผู้เล่น" then loadPlayerTab()
        elseif tab.Name == "โลก" then loadWorldTab()
        elseif tab.Name == "ตั้งค่า" then loadSettingsTab()
        end
    end)
end

loadHomeTab()

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
    end
end)

TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 20}):Play()
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 800, 0, 550)}):Play()