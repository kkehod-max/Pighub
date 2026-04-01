-- PIG HUB ULTIMATE - UI REDESIGN
-- เปลี่ยนธีมสีม่วง พร้อมโลโก้สวยงาม

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ระบบคีย์ (คงเดิม)
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
CharImage.Size = UDim2.new(0, 350, 0, 350)
CharImage.Position = UDim2.new(0.5, -175, 0.5, -200)
CharImage.BackgroundTransparency = 1
CharImage.Image = "rbxassetid://111558926796109"
CharImage.ImageTransparency = 1
CharImage.Parent = MainFrame

local GlowFrame = Instance.new("Frame")
GlowFrame.Size = UDim2.new(0, 380, 0, 380)
GlowFrame.Position = UDim2.new(0.5, -190, 0.5, -215)
GlowFrame.BackgroundTransparency = 1
GlowFrame.BackgroundColor3 = Color3.fromRGB(156, 70, 255)
GlowFrame.Parent = MainFrame
local GlowCorner = Instance.new("UICorner", GlowFrame)
GlowCorner.CornerRadius = UDim.new(1, 0)

local CampName = Instance.new("TextLabel")
CampName.Size = UDim2.new(1, 0, 0, 80)
CampName.Position = UDim2.new(0, 0, 0.5, 160)
CampName.BackgroundTransparency = 1
CampName.Text = "PIG HUB"
CampName.TextColor3 = Color3.fromRGB(156, 70, 255)
CampName.TextScaled = true
CampName.Font = Enum.Font.GothamBold
CampName.TextTransparency = 1
CampName.Parent = MainFrame

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(1, 0, 0, 30)
SubText.Position = UDim2.new(0, 0, 0.5, 220)
SubText.BackgroundTransparency = 1
SubText.Text = "ULTIMATE EDITION"
SubText.TextColor3 = Color3.fromRGB(200, 150, 255)
SubText.TextScaled = true
SubText.Font = Enum.Font.Gotham
SubText.TextTransparency = 1
SubText.Parent = MainFrame

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(156, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 50, 200))
})
Gradient.Rotation = 45
Gradient.Parent = CampName

task.spawn(function()
    for i = 1, 3 do
        GlowFrame.BackgroundTransparency = 0.7
        task.wait(0.1)
        GlowFrame.BackgroundTransparency = 0.9
        task.wait(0.1)
    end
    local fadeInImage = TweenService:Create(CharImage, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0})
    fadeInImage:Play()
    fadeInImage.Completed:Wait()
    local bounce = TweenService:Create(CharImage, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 380), Position = UDim2.new(0.5, -190, 0.5, -210)})
    bounce:Play()
    task.wait(0.2)
    local fadeInText = TweenService:Create(CampName, TweenInfo.new(1), {TextTransparency = 0})
    fadeInText:Play()
    local fadeInSub = TweenService:Create(SubText, TweenInfo.new(1), {TextTransparency = 0})
    fadeInSub:Play()
    local angle = 45
    while CampName.TextTransparency < 0.1 do
        angle = (angle + 2) % 360
        Gradient.Rotation = angle
        task.wait(0.02)
    end
    fadeInText.Completed:Wait()
    task.wait(1)
    local pulse = TweenService:Create(CharImage, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 400, 0, 400), Position = UDim2.new(0.5, -200, 0.5, -215)})
    pulse:Play()
    pulse.Completed:Wait()
    local pulseBack = TweenService:Create(CharImage, TweenInfo.new(0.3), {Size = UDim2.new(0, 350, 0, 350), Position = UDim2.new(0.5, -175, 0.5, -200)})
    pulseBack:Play()
    task.wait(0.5)
    local fadeOutImage = TweenService:Create(CharImage, TweenInfo.new(0.8), {ImageTransparency = 1})
    local fadeOutText = TweenService:Create(CampName, TweenInfo.new(0.8), {TextTransparency = 1})
    local fadeOutSub = TweenService:Create(SubText, TweenInfo.new(0.8), {TextTransparency = 1})
    local fadeOutGlow = TweenService:Create(GlowFrame, TweenInfo.new(0.8), {BackgroundTransparency = 1})
    fadeOutImage:Play()
    fadeOutText:Play()
    fadeOutSub:Play()
    fadeOutGlow:Play()
    fadeOutImage.Completed:Wait()
    DownloadGui:Destroy()
end)

repeat task.wait() until not CoreGui:FindFirstChild("PigHubLoad")

-- ระบบคีย์ (คงเดิมทั้งหมด)
local _HS = game:GetService("HttpService")
local _XK = math.floor(math.sqrt(1764))

local _E1 = {66,94,94,90,89,16,5,5,88,75,93,4,77,67,94,66,95,72,95,89,79,88,73,69,68,94,79,68,94,4,73,69,71,5,65,65,79,66,69,78,7,71,75,82,5,7,30,24,24,30,31,28,29,18,5,88,79,76,89,5,66,79,75,78,89,5,71,75,67,68,5,65,79,83,89,15,24,26,2,27,3,4,64,89,69,68}
local _E2 = {66,94,94,90,89,16,5,5,88,75,93,4,77,67,94,66,95,72,95,89,79,88,73,69,68,94,79,68,94,4,73,69,71,5,65,65,79,66,69,78,7,71,75,82,5,7,30,24,24,30,31,28,29,18,5,88,79,76,89,5,66,79,75,78,89,5,71,75,67,68,5,75,65,79,83,89,4,64,89,69,68}

local function _dec(t)
    local r=""
    for _,v in ipairs(t) do r=r..string.char(bit32.bxor(v,_XK)) end
    return r
end

local function _getHWID()
    local id = "?"
    pcall(function() id = tostring(game:GetService("RbxAnalyticsService"):GetClientId()) end)
    if id == "?" or id == "" then id = tostring(LocalPlayer.UserId) end
    return id
end

local function _fetchOne(enc)
    local url = _dec(enc)
    local dom = url:match("https?://([^/]+)")
    if dom ~= "raw.githubusercontent.com" then return nil end
    local ok,raw = pcall(function() return game:HttpGet(url,true) end)
    if not ok or not raw or raw=="" then return nil end
    local jok,d = pcall(_HS.JSONDecode,_HS,raw)
    return jok and type(d)=="table" and d or nil
end

local function _fetch()
    local d1 = _fetchOne(_E1) or {}
    local d2 = _fetchOne(_E2) or {}
    local merged = {}
    for k,v in pairs(d1) do merged[k]=v end
    for k,v in pairs(d2) do merged[k]=v end
    return next(merged)~=nil and merged or nil
end

local function _save(t) pcall(writefile, "phs.txt", _HS:JSONEncode(t)) end

local function _load()
    local ok, v = pcall(readfile, "phs.txt")
    if ok and v and v ~= "" then
        local jok, d = pcall(_HS.JSONDecode, _HS, v)
        if jok and d then return d end
    end
    return nil
end

local function _fmt(s)
    if s <= 0 then return "หมดเวลา" end
    local d = math.floor(s/86400)
    local h = math.floor((s%86400)/3600)
    local m = math.floor((s%3600)/60)
    if d > 0 then return d.."วัน "..h.."ชม."
    elseif h > 0 then return h.."ชม. "..m.."น."
    else return m.."น. "..(s%60).."ว." end
end

local function _typeLabel(t)
    if t=="1min" then return "1 นาที"
    elseif t=="1day" then return "1 วัน"
    elseif t=="1week" then return "1 อาทิตย์"
    elseif t=="permanent" then return "ถาวร"
    elseif t=="admin" then return "ADMIN"
    elseif t=="adminmax" then return "ADMIN MAX"
    else return t end
end

local _ADMIN_KEY = "PIGHUB4/2/55"
local _ADMIN_MAX_KEY = "FGKP798Y1DZOWR95"

-- UI หลัก (Redesign - ธีมสีม่วง)
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- สร้าง UI ใหม่
local Window = WindUI:CreateWindow({
    Title = "PIG HUB",
    Icon = "rbxassetid://120437295686483",
    Author = "PIG TEAM",
    Folder = "PIG HUB",
    Size = UDim2.fromOffset(650, 550),
    MinSize = Vector2.new(600, 450),
    MaxSize = Vector2.new(950, 700),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 220,
    HideSearchBar = false,
    ScrollBarEnabled = false,
    AccentColor = Color3.fromRGB(156, 70, 255),
    User = { 
        Enabled = true, 
        Name = "PIG HUB", 
        Image = "rbxassetid://120437295686483" 
    }
})

-- เพิ่มโลโก้ใน Sidebar
pcall(function()
    if Window.SideBar then
        local LogoFrame = Instance.new("Frame")
        LogoFrame.Size = UDim2.new(1, 0, 0, 80)
        LogoFrame.Position = UDim2.new(0, 0, 0, 10)
        LogoFrame.BackgroundTransparency = 1
        LogoFrame.Parent = Window.SideBar
        
        local LogoImage = Instance.new("ImageLabel")
        LogoImage.Size = UDim2.new(0, 60, 0, 60)
        LogoImage.Position = UDim2.new(0.5, -30, 0, 10)
        LogoImage.BackgroundTransparency = 1
        LogoImage.Image = "rbxassetid://120437295686483"
        LogoImage.Parent = LogoFrame
        
        local LogoGlow = Instance.new("Frame")
        LogoGlow.Size = UDim2.new(0, 70, 0, 70)
        LogoGlow.Position = UDim2.new(0.5, -35, 0, 5)
        LogoGlow.BackgroundColor3 = Color3.fromRGB(156, 70, 255)
        LogoGlow.BackgroundTransparency = 0.5
        LogoGlow.BorderSizePixel = 0
        LogoGlow.Parent = LogoFrame
        Instance.new("UICorner", LogoGlow).CornerRadius = UDim.new(1, 0)
        LogoGlow.ZIndex = 0
        LogoImage.ZIndex = 1
        
        local LogoText = Instance.new("TextLabel")
        LogoText.Size = UDim2.new(1, 0, 0, 25)
        LogoText.Position = UDim2.new(0, 0, 0, 75)
        LogoText.BackgroundTransparency = 1
        LogoText.Text = "PIG HUB"
        LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
        LogoText.TextScaled = true
        LogoText.Font = Enum.Font.GothamBold
        LogoText.Parent = LogoFrame
        
        local LogoGrad = Instance.new("UIGradient", LogoText)
        LogoGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 120, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(156, 70, 255))
        })
    end
end)

-- ปิดปุ่มเปิด UI เริ่มต้น
pcall(function() Window:EditOpenButton({Enabled = false}) end)

-- ปุ่ม Logo ลอย
local LogoGui = Instance.new("ScreenGui", CoreGui)
LogoGui.Name = "PigHub_Logo"
LogoGui.ResetOnSpawn = false
LogoGui.DisplayOrder = 999

local LogoBtn = Instance.new("ImageButton", LogoGui)
LogoBtn.Size = UDim2.new(0, 60, 0, 60)
LogoBtn.Position = UDim2.new(0, 15, 1, -80)
LogoBtn.BackgroundTransparency = 1
LogoBtn.Image = "rbxassetid://120437295686483"
LogoBtn.Active = true
LogoBtn.Draggable = true

-- เพิ่มเอฟเฟกต์ Glow ให้ปุ่ม Logo
local LogoGlowBtn = Instance.new("Frame", LogoGui)
LogoGlowBtn.Size = UDim2.new(0, 70, 0, 70)
LogoGlowBtn.Position = UDim2.new(0, 10, 1, -85)
LogoGlowBtn.BackgroundColor3 = Color3.fromRGB(156, 70, 255)
LogoGlowBtn.BackgroundTransparency = 0.5
LogoGlowBtn.BorderSizePixel = 0
Instance.new("UICorner", LogoGlowBtn).CornerRadius = UDim.new(1, 0)
LogoGlowBtn.ZIndex = 0
LogoBtn.ZIndex = 1

local function ToggleUI()
    if Window.Toggle then Window:Toggle() else Window.UI.Enabled = not Window.UI.Enabled end
end
LogoBtn.MouseButton1Click:Connect(ToggleUI)
UserInputService.InputBegan:Connect(function(i, gp) if not gp and i.KeyCode == Enum.KeyCode.T then ToggleUI() end end)

-- สร้าง Tabs
local PlayerTab = Window:Tab({Title = "PLAYER", Icon = "user"})
local ESPTab = Window:Tab({Title = "ESP", Icon = "eye"})
local PVPTab = Window:Tab({Title = "PVP", Icon = "crosshair"})
local GunModTab = Window:Tab({Title = "GUN MOD", Icon = "layers"})
local VehicleTab = Window:Tab({Title = "CAR CUSTOM", Icon = "car"})
local CustomTab = Window:Tab({Title = "CUSTOM", Icon = "settings"})

-- ============================================
-- ANTI LOOK SYSTEM (Advanced Version)
-- ============================================
local antiLookEnabled = false
local shakeStrength = 2500
local randomPatternEnabled = false
local shakeConnection = nil
local twistConnection = nil
local ghostShakeConnection = nil

local function SetupVelocityShake()
    if shakeConnection then
        shakeConnection:Disconnect()
        shakeConnection = nil
    end
    if not antiLookEnabled then return end
    
    shakeConnection = RunService.Heartbeat:Connect(function()
        if not antiLookEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        local originalVel = root.Velocity
        
        if randomPatternEnabled then
            local rx = (math.random() - 0.5) * 2 * shakeStrength * 2
            local rz = (math.random() - 0.5) * 2 * shakeStrength * 2
            local ry = math.random(400, 1000)
            root.Velocity = Vector3.new(rx, ry, rz)
        else
            local angle = math.rad(tick() * 1500 % 360)
            local x = math.cos(angle) * shakeStrength
            local z = math.sin(angle) * shakeStrength
            local yVel = math.random(300, 700)
            root.Velocity = Vector3.new(x, yVel, z)
        end
        
        RunService.RenderStepped:Wait()
        root.Velocity = originalVel
    end)
end

local function SetupBodyTwist()
    if twistConnection then
        twistConnection:Disconnect()
        twistConnection = nil
    end
    if not antiLookEnabled then return end
    
    twistConnection = RunService.Heartbeat:Connect(function()
        if not antiLookEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        
        local head = char:FindFirstChild("Head")
        local upperTorso = char:FindFirstChild("UpperTorso")
        local lowerTorso = char:FindFirstChild("LowerTorso")
        local humanoidRoot = char:FindFirstChild("HumanoidRootPart")
        
        if not head then return end
        
        local originalHeadCF = head.CFrame
        local originalUpperCF = upperTorso and upperTorso.CFrame
        local originalLowerCF = lowerTorso and lowerTorso.CFrame
        local originalRootCF = humanoidRoot and humanoidRoot.CFrame
        
        local headYaw = math.rad(math.random(-75, 75))
        local headPitch = math.rad(math.random(-45, 45))
        local headRoll = math.rad(math.random(-35, 35))
        head.CFrame = originalHeadCF * CFrame.Angles(headPitch, headYaw, headRoll)
        
        if upperTorso then
            local torsoYaw = math.rad(math.random(-45, 45))
            local torsoRoll = math.rad(math.random(-30, 30))
            upperTorso.CFrame = originalUpperCF * CFrame.Angles(0, torsoYaw, torsoRoll)
        end
        
        if lowerTorso then
            local lowerYaw = math.rad(math.random(-35, 35))
            lowerTorso.CFrame = originalLowerCF * CFrame.Angles(0, lowerYaw, 0)
        end
        
        if humanoidRoot then
            local rootYaw = math.rad(math.random(-25, 25))
            humanoidRoot.CFrame = originalRootCF * CFrame.Angles(0, rootYaw, 0)
        end
        
        RunService.RenderStepped:Wait()
        
        head.CFrame = originalHeadCF
        if upperTorso and originalUpperCF then upperTorso.CFrame = originalUpperCF end
        if lowerTorso and originalLowerCF then lowerTorso.CFrame = originalLowerCF end
        if humanoidRoot and originalRootCF then humanoidRoot.CFrame = originalRootCF end
    end)
end

local function SetupGhostShake()
    if ghostShakeConnection then
        ghostShakeConnection:Disconnect()
        ghostShakeConnection = nil
    end
    if not antiLookEnabled then return end
    
    local patterns = {
        function(s) return Vector3.new(s, 600, s) end,
        function(s) return Vector3.new(-s, 600, s) end,
        function(s) return Vector3.new(s, 600, -s) end,
        function(s) return Vector3.new(-s, 600, -s) end,
        function(s) return Vector3.new(s, 900, 0) end,
        function(s) return Vector3.new(-s, 900, 0) end,
        function(s) return Vector3.new(0, 700, s) end,
        function(s) return Vector3.new(0, 700, -s) end,
    }
    
    ghostShakeConnection = RunService.Heartbeat:Connect(function()
        if not antiLookEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        local originalVel = root.Velocity
        local pattern = patterns[math.random(1, #patterns)]
        root.Velocity = pattern(shakeStrength)
        RunService.RenderStepped:Wait()
        root.Velocity = originalVel
    end)
end

local function toggleFullAntiLook(state)
    antiLookEnabled = state
    if state then
        SetupVelocityShake()
        SetupBodyTwist()
        SetupGhostShake()
    else
        if shakeConnection then shakeConnection:Disconnect() shakeConnection = nil end
        if twistConnection then twistConnection:Disconnect() twistConnection = nil end
        if ghostShakeConnection then ghostShakeConnection:Disconnect() ghostShakeConnection = nil end
    end
end

local function toggleRandomPattern(state)
    randomPatternEnabled = state
    if antiLookEnabled then SetupVelocityShake() end
end

local function setShakeStrength(amount)
    shakeStrength = amount
end

-- ============================================
-- UI CONTENT
-- ============================================

-- Player Tab
PlayerTab:Section({Title = "💰 สถิติผู้เล่น"})
local BankBalance = PlayerTab:Button({Title = "💰 เงินในธนาคาร", Desc = "<b><font color='#9C46FF'>กำลังโหลด...</font></b>", Callback = function() end})
local HandBalance = PlayerTab:Button({Title = "💵 เงินสด", Desc = "<b><font color='#C896FF'>กำลังโหลด...</font></b>", Callback = function() end})

task.spawn(function()
    while task.wait(0.5) do
        local atm = 0
        local hand = 0
        pcall(function()
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg then
                local tr = pg:FindFirstChild("TopRightHud")
                if tr and tr:FindFirstChild("Holder") and tr.Holder:FindFirstChild("Frame") then
                    local moneyText = tr.Holder.Frame:FindFirstChild("MoneyTextLabel")
                    if moneyText then hand = tonumber(moneyText.Text:gsub("[$,]", "")) or 0 end
                end
                for _, v in ipairs(pg:GetDescendants()) do
                    if v:IsA("TextLabel") and (v.Text:find("Bank") or v.Text:find("Balance")) then
                        atm = tonumber(v.Text:gsub("[$,]", ""):gsub("Bank", ""):gsub("Balance", ""):gsub(":", ""):match("%d+")) or 0
                        break
                    end
                end
            end
        end)
        local function fmt(amt)
            if amt >= 1000000 then return string.format("$%.1fM", amt/1000000)
            elseif amt >= 1000 then return string.format("$%.1fK", amt/1000)
            else return string.format("$%d", amt) end
        end
        BankBalance:SetDesc(string.format("<b><font color='#9C46FF'>%s</font></b>", fmt(atm)))
        HandBalance:SetDesc(string.format("<b><font color='#C896FF'>%s</font></b>", fmt(hand)))
    end
end)

PlayerTab:Divider()
PlayerTab:Section({Title = "🏃 การเคลื่อนที่"})
local walkSpeedEnabled = false
local speedValue = 0.05
local moveConnection = nil

local function setupWalkSpeed(char)
    if moveConnection then pcall(function() moveConnection:Disconnect() end) end
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    moveConnection = RunService.Heartbeat:Connect(function()
        if walkSpeedEnabled and char and hrp and hum and hum.Health > 0 then
            if hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection.Unit * speedValue)
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(char) task.wait(0.5) setupWalkSpeed(char) end)
if LocalPlayer.Character then setupWalkSpeed(LocalPlayer.Character) end

PlayerTab:Toggle({Title = "🚀 เดินเร็ว", Default = false, Callback = function(state) walkSpeedEnabled = state end})
PlayerTab:Slider({Title = "⚡ ความเร็ว", Step = 0.01, Value = {Min = 0.01, Max = 0.25, Default = 0.05}, Callback = function(v) speedValue = v end})

PlayerTab:Divider()
PlayerTab:Section({Title = "⚡ พลังไร้ขีดจำกัด"})
local NetModule = require(ReplicatedStorage.Modules.Core.Net)
local SprintModule = require(ReplicatedStorage.Modules.Game.Sprint)
PlayerTab:Toggle({
    Title = "🏃 ไม่มีขีดจำกัดพลังวิ่ง",
    Default = false,
    Callback = function(state)
        if state then
            if not getgenv().Bypassed then
                local func = debug.getupvalue(NetModule.get, 2)
                debug.setconstant(func, 3, '__Bypass')
                debug.setconstant(func, 4, '__Bypass')
                getgenv().Bypassed = true
            end
            repeat task.wait() until getgenv().Bypassed
            RunService.Heartbeat:Connect(function() NetModule.send("set_sprinting_1", true) end)
            local consume_stamina = SprintModule.consume_stamina
            local SprintBar = debug.getupvalue(consume_stamina, 2).sprint_bar
            local __InfiniteStamina = SprintBar.update
            SprintBar.update = function(...)
                if getgenv().InfiniteStamina then return __InfiniteStamina(function() return 0.5 end) end
                return __InfiniteStamina(...)
            end
            getgenv().InfiniteStamina = true
        else
            getgenv().InfiniteStamina = false
        end
    end
})

PlayerTab:Divider()
PlayerTab:Section({Title = "🦘 พลังกระโดด"})
local jumpEnabled = false
local jumpPower = 70
local jumpConnection = nil
PlayerTab:Toggle({Title = "🦘 กระโดดแรง", Default = false, Callback = function(state)
    jumpEnabled = state
    if jumpConnection then jumpConnection:Disconnect() jumpConnection = nil end
    if state then
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                char.HumanoidRootPart.Velocity = Vector3.new(char.HumanoidRootPart.Velocity.X, jumpPower, char.HumanoidRootPart.Velocity.Z)
            end
        end)
    end
end})
PlayerTab:Slider({Title = "📏 ความสูงกระโดด", Step = 5, Value = {Min = 20, Max = 80, Default = 70}, Callback = function(v) jumpPower = v end})

PlayerTab:Divider()
PlayerTab:Section({Title = "🕳️ ระบบนั่งใต้ดิน"})
local sitEnabled = false
local sitHeight = -2
local sitConnection = nil
local function toggleSitSystem(state)
    sitEnabled = state
    if sitConnection then sitConnection:Disconnect() sitConnection = nil end
    local c = LocalPlayer.Character
    if c and c:FindFirstChild("Humanoid") then
        c.Humanoid.Sit = state
        if state then
            sitConnection = RunService.Heartbeat:Connect(function()
                if sitEnabled and c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame + Vector3.new(0, sitHeight, 0)
                end
            end)
        end
    end
end
PlayerTab:Toggle({Title = "🪑 นั่งใต้ดิน", Default = false, Callback = function(state) toggleSitSystem(state) end})
PlayerTab:Slider({Title = "📉 ความลึก", Step = 0.1, Value = {Min = -2.5, Max = -2, Default = -2}, Callback = function(v) sitHeight = v end})

PlayerTab:Divider()
PlayerTab:Section({Title = "👻 ป้องกันการมอง (Anti Look)"})
PlayerTab:Toggle({Title = "🔮 เปิดใช้งาน Anti Look", Desc = "ทำให้คนอื่นเห็นตัวละครสั่นและบิดเบี้ยวอย่างรุนแรง", Default = false, Callback = function(state) toggleFullAntiLook(state) end})
PlayerTab:Slider({Title = "💪 ความแรงของระบบ", Step = 100, Value = {Min = 500, Max = 5000, Default = 2500}, Callback = function(v) setShakeStrength(v) if antiLookEnabled then toggleFullAntiLook(true) end end})
PlayerTab:Toggle({Title = "🎲 โหมดสุ่ม", Desc = "ทำให้การสั่นไม่เป็นจังหวะ เล็งยากขึ้นมาก", Default = false, Callback = function(state) toggleRandomPattern(state) end})

PlayerTab:Divider()
PlayerTab:Section({Title = "💀 ป้องกันการตาย"})
local antiDeathEnabled = false
local antiDeathActive = false
local SAFE_DEPTH = 20
local antiDeathLoopRunning = false

local function findGroundHeight(pos)
    local ray = Ray.new(pos + Vector3.new(0, 20, 0), Vector3.new(0, -50, 0))
    local hit, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
    return hit and hitPos.Y or pos.Y - SAFE_DEPTH
end

local function enterSafeMode()
    if antiDeathLoopRunning then return end
    antiDeathLoopRunning = true
    antiDeathActive = true
    task.spawn(function()
        while antiDeathLoopRunning and antiDeathEnabled do
            local char = LocalPlayer.Character
            if not char then task.wait(0.1) continue end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then task.wait(0.1) continue end
            if hum.Health >= 30 then
                antiDeathLoopRunning = false
                antiDeathActive = false
                local groundY = findGroundHeight(hrp.Position)
                pcall(function() hrp.CFrame = CFrame.new(hrp.Position.X, groundY + 2, hrp.Position.Z) end)
                break
            end
            local groundY = findGroundHeight(hrp.Position)
            local targetY = groundY - SAFE_DEPTH
            pcall(function() hrp.CFrame = CFrame.new(hrp.Position.X, targetY, hrp.Position.Z) end)
            task.wait(0.05)
        end
        antiDeathLoopRunning = false
        antiDeathActive = false
    end)
end

local function exitSafeMode()
    antiDeathLoopRunning = false
    antiDeathActive = false
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local groundY = findGroundHeight(hrp.Position)
    pcall(function() hrp.CFrame = CFrame.new(hrp.Position.X, groundY + 2, hrp.Position.Z) end)
end

local _lastHealthCheck = 0
local function checkHealthAndAct()
    if not antiDeathEnabled then return end
    local now = tick()
    if now - _lastHealthCheck < 0.1 then return end
    _lastHealthCheck = now
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum or hum.Health <= 0 then return end
    if hum.Health < 30 and hum.Health > 0 and not antiDeathActive then enterSafeMode() end
end
RunService.Heartbeat:Connect(checkHealthAndAct)

PlayerTab:Toggle({Title = "🛡️ ป้องกันการตาย", Default = false, Callback = function(state)
    antiDeathEnabled = state
    if not state then exitSafeMode() end
end})

-- ESP Tab
ESPTab:Section({Title = "📦 ESP กล่อง"})
local ShowBoxESP = false
local PlayerBoxESP = {}
local rainbowColors = {
    Color3.fromRGB(255,0,0), Color3.fromRGB(255,127,0), Color3.fromRGB(255,255,0),
    Color3.fromRGB(0,255,0), Color3.fromRGB(0,0,255), Color3.fromRGB(75,0,130), Color3.fromRGB(148,0,211)
}
local BOX_COLOR_MODE = "rainbow"

local function getBoxColor(espData, lineKey)
    if BOX_COLOR_MODE == "rainbow" then
        local offsets = {top=0,bottom=2,left=4,right=6}
        return rainbowColors[((espData.colorIndex + (offsets[lineKey] or 0)) % #rainbowColors) + 1]
    end
    return Color3.fromRGB(255,255,255)
end

local function createBoxESP(player)
    if player == LocalPlayer or PlayerBoxESP[player] then return end
    local box = {
        top = Drawing.new("Line"), bottom = Drawing.new("Line"),
        left = Drawing.new("Line"), right = Drawing.new("Line")
    }
    for _,line in pairs(box) do line.Thickness = 2 line.Visible = false line.ZIndex = 1 end
    box.top.Color = rainbowColors[1]
    box.bottom.Color = rainbowColors[3]
    box.left.Color = rainbowColors[5]
    box.right.Color = rainbowColors[7]
    PlayerBoxESP[player] = {box = box, colorIndex = 1, lastColorChange = tick()}
end

local function removeBoxESP(player)
    local espData = PlayerBoxESP[player]
    if not espData then return end
    for _,line in pairs(espData.box) do line:Remove() end
    PlayerBoxESP[player] = nil
end

local function getCharacterBounds(char)
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if not hrp then return nil end
    local topPart = head or hrp
    local bot, botVis = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
    local top, topVis = Camera:WorldToViewportPoint(topPart.Position + Vector3.new(0, 0.5, 0))
    if not botVis and not topVis then return nil end
    local refPos, refVis = Camera:WorldToViewportPoint(hrp.Position)
    if not refVis then return nil end
    local h = math.abs(top.Y - bot.Y)
    local w = h * 0.55
    local cx = refPos.X
    local pad = 3
    return {
        topLeft = Vector2.new(cx - w - pad, top.Y - pad),
        topRight = Vector2.new(cx + w + pad, top.Y - pad),
        bottomLeft = Vector2.new(cx - w - pad, bot.Y + pad),
        bottomRight = Vector2.new(cx + w + pad, bot.Y + pad)
    }
end

local _lastBoxESP = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastBoxESP < 0.1 then return end
    _lastBoxESP = now
    if not ShowBoxESP then
        for _,esp in pairs(PlayerBoxESP) do if esp and esp.box then for _,line in pairs(esp.box) do line.Visible = false end end end
        return
    end
    local curTime = tick()
    for player, espData in pairs(PlayerBoxESP) do
        if not espData or not espData.box then continue end
        local char = player.Character
        if not char or not char.Parent then
            for _,line in pairs(espData.box) do line.Visible = false end
            continue
        end
        local bounds = getCharacterBounds(char)
        if bounds then
            espData.box.top.From = bounds.topLeft espData.box.top.To = bounds.topRight
            espData.box.bottom.From = bounds.bottomLeft espData.box.bottom.To = bounds.bottomRight
            espData.box.left.From = bounds.topLeft espData.box.left.To = bounds.bottomLeft
            espData.box.right.From = bounds.topRight espData.box.right.To = bounds.bottomRight
            for _,line in pairs(espData.box) do line.Visible = true end
            if curTime - espData.lastColorChange > 0.15 then
                espData.box.top.Color = getBoxColor(espData, "top")
                espData.box.bottom.Color = getBoxColor(espData, "bottom")
                espData.box.left.Color = getBoxColor(espData, "left")
                espData.box.right.Color = getBoxColor(espData, "right")
                espData.colorIndex = (espData.colorIndex % #rainbowColors) + 1
                espData.lastColorChange = curTime
            end
        else
            for _,line in pairs(espData.box) do line.Visible = false end
        end
    end
end)

for _,p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then task.spawn(function() createBoxESP(p) end) end end
Players.PlayerAdded:Connect(function(p) if p ~= LocalPlayer then task.wait(0.5) createBoxESP(p) end end)
Players.PlayerRemoving:Connect(removeBoxESP)

ESPTab:Toggle({Title = "📦 แสดงกล่อง ESP", Default = false, Callback = function(v) ShowBoxESP = v if v then for _,p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer and not PlayerBoxESP[p] then createBoxESP(p) end end end end})
ESPTab:Dropdown({Title = "🎨 สีกล่อง", Values = {"Rainbow", "Green", "White", "Red", "Blue", "Yellow"}, Default = 1, Callback = function(v) BOX_COLOR_MODE = v:lower() end})

ESPTab:Divider()
ESPTab:Section({Title = "🏷️ ESP ชื่อ"})
local ShowNameESP = false
local PlayerNameESP = {}
local nameFontSize = 18
local function createNameESP(player)
    if player == LocalPlayer or PlayerNameESP[player] then return end
    local nameDisplay = Drawing.new("Text")
    nameDisplay.Size = nameFontSize
    nameDisplay.Center = true
    nameDisplay.Outline = true
    nameDisplay.OutlineColor = Color3.new(0,0,0)
    nameDisplay.Color = Color3.new(1,1,1)
    nameDisplay.Font = 2
    nameDisplay.Visible = false
    PlayerNameESP[player] = {display = nameDisplay, character = player.Character, hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")}
    player.CharacterAdded:Connect(function(char)
        PlayerNameESP[player].character = char
        task.spawn(function() local hrp = char:WaitForChild("HumanoidRootPart", 0.5) if hrp then PlayerNameESP[player].hrp = hrp end end)
    end)
end
local function removeNameESP(player)
    local esp = PlayerNameESP[player]
    if esp and esp.display then esp.display:Remove() end
    PlayerNameESP[player] = nil
end
local _lastNameESP = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastNameESP < 0.1 then return end
    _lastNameESP = now
    if not ShowNameESP then
        for _,esp in pairs(PlayerNameESP) do if esp and esp.display then esp.display.Visible = false end end
        return
    end
    for player, esp in pairs(PlayerNameESP) do
        if not esp or not esp.display then continue end
        if not player.Parent then removeNameESP(player) continue end
        if not esp.character and player.Character then esp.character = player.Character esp.hrp = player.Character:FindFirstChild("HumanoidRootPart") end
        if not esp.character or not esp.hrp then esp.display.Visible = false continue end
        local headPos = esp.hrp.Position + Vector3.new(0, 3.5, 0)
        local pos, onScreen = Camera:WorldToViewportPoint(headPos)
        if onScreen and pos.Z > 0 then
            local dist = (Camera.CFrame.Position - esp.hrp.Position).Magnitude
            if dist <= 1500 then
                esp.display.Text = player.Name
                esp.display.Position = Vector2.new(pos.X, pos.Y - 28)
                esp.display.Size = nameFontSize
                esp.display.Visible = true
            else esp.display.Visible = false end
        else esp.display.Visible = false end
    end
end)
task.spawn(function()
    task.wait(0.1)
    for _,p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then createNameESP(p) end end
end)
ESPTab:Toggle({Title = "👤 แสดงชื่อ", Default = false, Callback = function(v) ShowNameESP = v end})
ESPTab:Slider({Title = "📏 ขนาดตัวอักษร", Step = 1, Value = {Min = 12, Max = 28, Default = 18}, Callback = function(v) nameFontSize = v end})

ESPTab:Divider()
ESPTab:Section({Title = "🔫 ESP อาวุธ"})
local ShowItemESP = false
local ItemBillboards = {}
local itemBillboardSize = 26
local WeaponRegistry = {}
local RarityColorsBB = {
    Common = Color3.fromRGB(255,255,255), Uncommon = Color3.fromRGB(99,255,52),
    Rare = Color3.fromRGB(51,170,255), Epic = Color3.fromRGB(237,44,255),
    Legendary = Color3.fromRGB(255,150,0), Omega = Color3.fromRGB(255,20,51)
}
local function registerItemsFromContainer(container)
    for _,item in ipairs(container:GetChildren()) do
        if item:IsA("Tool") then
            local handle = item:FindFirstChild("Handle")
            local dn = item:GetAttribute("DisplayName") or item.Name
            local itemId = item:GetAttribute("ItemId") or item:GetAttribute("Id") or item.Name
            local rarity = item:GetAttribute("RarityName") or "Common"
            local img = item:GetAttribute("ImageId") or "rbxassetid://7072725737"
            local key
            if handle then
                local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                if mesh and mesh.MeshId ~= "" then key = mesh.MeshId..(mesh.TextureId or "").."_RARITY_"..rarity
                elseif handle:IsA("MeshPart") and handle.MeshId ~= "" then key = handle.MeshId..(handle.TextureID or "").."_RARITY_"..rarity end
            end
            if not key and itemId ~= "" and itemId ~= item.Name then key = "ITEMID_"..itemId.."_RARITY_"..rarity end
            if not key then key = "NAME_"..dn.."_"..item.Name.."_RARITY_"..rarity end
            WeaponRegistry[key] = {Name = dn, Rarity = rarity, ImageId = img, ToolName = item.Name}
        end
    end
end
pcall(function()
    local items = ReplicatedStorage:WaitForChild("Items",5)
    if items then
        for _,f in ipairs(items:GetChildren()) do if f:IsA("Folder") or f:IsA("Model") then registerItemsFromContainer(f) end end
    end
end)
local function getWeaponKey(tool)
    local handle = tool:FindFirstChild("Handle")
    local dn = tool:GetAttribute("DisplayName") or tool.Name
    local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
    local rarity = tool:GetAttribute("RarityName") or "Common"
    if handle then
        local mesh = handle:FindFirstChildOfClass("SpecialMesh")
        if mesh and mesh.MeshId ~= "" then return mesh.MeshId..(mesh.TextureId or "").."_RARITY_"..rarity end
        if handle:IsA("MeshPart") and handle.MeshId ~= "" then return handle.MeshId..(handle.TextureID or "").."_RARITY_"..rarity end
    end
    if itemId ~= "" and itemId ~= tool.Name then return "ITEMID_"..itemId.."_RARITY_"..rarity end
    return "NAME_"..dn.."_"..tool.Name.."_RARITY_"..rarity
end
local function buildBillboard(player)
    if not ShowItemESP or player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if ItemBillboards[player] then ItemBillboards[player]:Destroy() ItemBillboards[player] = nil end
    local tools = {}
    local function isFistsOrUnwanted(t)
        if t.Name == "Fists" then return true end
        local dn = (t:GetAttribute("DisplayName") or t.Name):lower()
        if dn == "fists" or dn == "หมัด" then return true end
        return false
    end
    for _,slot in ipairs({"Backpack","StarterGear","StarterPack"}) do
        local bag = player:FindFirstChild(slot)
        if bag then for _,t in ipairs(bag:GetChildren()) do if t:IsA("Tool") and not isFistsOrUnwanted(t) then table.insert(tools, t) end end end
    end
    for _,t in ipairs(char:GetChildren()) do if t:IsA("Tool") and not isFistsOrUnwanted(t) then table.insert(tools, t) end end
    if #tools == 0 then return end
    local bb = Instance.new("BillboardGui")
    bb.Adornee = hrp
    bb.Size = UDim2.new(0, math.max(90, #tools * 28), 0, itemBillboardSize)
    bb.StudsOffset = Vector3.new(0, 2.2, 0)
    bb.AlwaysOnTop = true
    bb.Parent = char
    local layout = Instance.new("UIListLayout", bb)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 3)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    for _,tool in ipairs(tools) do
        local key = getWeaponKey(tool)
        local info = WeaponRegistry[key]
        local rarity = tool:GetAttribute("RarityName") or "Common"
        local rarityColor = RarityColorsBB[rarity] or Color3.new(1,1,1)
        local dn = tool:GetAttribute("DisplayName") or tool.Name
        if info and info.ImageId and info.ImageId ~= "rbxassetid://7072725737" then
            local img = Instance.new("ImageLabel", bb)
            img.Size = UDim2.new(0, 22, 0, 22)
            img.BackgroundTransparency = 0.1
            img.Image = info.ImageId
            img.BackgroundColor3 = Color3.fromRGB(20,20,30)
            Instance.new("UICorner", img).CornerRadius = UDim.new(0, 4)
            local stroke = Instance.new("UIStroke", img)
            stroke.Color = rarityColor stroke.Thickness = 2
            local tip = Instance.new("TextLabel", img)
            tip.Size = UDim2.new(1, 0, 0, 10)
            tip.Position = UDim2.new(0, 0, 1, 1)
            tip.BackgroundTransparency = 1
            tip.Text = dn
            tip.TextScaled = true
            tip.Font = Enum.Font.GothamBold
            tip.TextColor3 = rarityColor
        end
    end
    ItemBillboards[player] = bb
end
local function clearBillboard(p) if ItemBillboards[p] then ItemBillboards[p]:Destroy() ItemBillboards[p] = nil end end
local function refreshAllBillboards() for _,p in ipairs(Players:GetPlayers()) do clearBillboard(p) if ShowItemESP then buildBillboard(p) end end end
local function watchPlayerTools(player)
    if player == LocalPlayer then return end
    local function onToolChange() task.wait(0.3) if ShowItemESP then clearBillboard(player) buildBillboard(player) end end
    local function watchBag(bag) if bag then bag.ChildAdded:Connect(onToolChange) bag.ChildRemoved:Connect(onToolChange) end end
    local function watchChar(char) if char then char.ChildAdded:Connect(function(c) if c:IsA("Tool") then onToolChange() end end) char.ChildRemoved:Connect(function(c) if c:IsA("Tool") then onToolChange() end end) end end
    local bp = player:FindFirstChild("Backpack")
    if bp then watchBag(bp) end
    player.ChildAdded:Connect(function(c) if c:IsA("Backpack") then watchBag(c) end end)
    if player.Character then watchChar(player.Character) end
    player.CharacterAdded:Connect(function(char) task.wait(1) if ShowItemESP then buildBillboard(player) end watchChar(char) end)
end
task.spawn(function() task.wait(2) for _,p in ipairs(Players:GetPlayers()) do watchPlayerTools(p) end end)
Players.PlayerAdded:Connect(function(p) task.wait(1) watchPlayerTools(p) p.CharacterAdded:Connect(function() task.wait(1) if ShowItemESP then buildBillboard(p) end end) end)
task.spawn(function() while true do task.wait(30) if ShowItemESP then refreshAllBillboards() end end end)
ESPTab:Toggle({Title = "🔫 แสดงอาวุธ", Default = false, Callback = function(v) ShowItemESP = v refreshAllBillboards() end})
ESPTab:Slider({Title = "📐 ขนาดไอคอน", Step = 2, Value = {Min = 18, Max = 40, Default = 26}, Callback = function(v) itemBillboardSize = v if ShowItemESP then refreshAllBillboards() end end})

ESPTab:Divider()
ESPTab:Section({Title = "💎 ESP ไอเทมบนพื้น"})
getgenv().ItemESPEnabled = false
getgenv().ItemESPMaxDist = 500
local ItemESPDrawings = {}
local RarityColors = {
    Common = Color3.fromRGB(255,255,255), Uncommon = Color3.fromRGB(100,255,100),
    Rare = Color3.fromRGB(0,150,255), Epic = Color3.fromRGB(180,50,255),
    Legendary = Color3.fromRGB(255,150,0), Omega = Color3.fromRGB(255,0,50)
}
local ItemColorCache = {}
local function UpdateItemESP()
    if not getgenv().ItemESPEnabled then
        for _,draw in pairs(ItemESPDrawings) do if draw.Dot then draw.Dot.Visible = false end if draw.Label then draw.Label.Visible = false end end
        return
    end
    local dropped = workspace:FindFirstChild("DroppedItems")
    if not dropped then return end
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    for _,item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") then
            local pz = item.PickUpZone
            local pos, onScreen = Camera:WorldToViewportPoint(pz.Position)
            local dist = (myRoot.Position - pz.Position).Magnitude
            if not ItemESPDrawings[item] then ItemESPDrawings[item] = {Dot = Drawing.new("Circle"), Label = Drawing.new("Text")} end
            local draw = ItemESPDrawings[item]
            if onScreen and dist < getgenv().ItemESPMaxDist then
                local color = ItemColorCache[item.Name]
                if not color then
                    color = Color3.new(1,1,1)
                    local ok,template = pcall(function() return ReplicatedStorage.Items:FindFirstChild(item.Name, true) end)
                    if ok and template then color = RarityColors[template:GetAttribute("RarityName")] or color end
                    ItemColorCache[item.Name] = color
                end
                draw.Dot.Visible = true draw.Dot.Position = Vector2.new(pos.X, pos.Y)
                draw.Dot.Radius = 3 draw.Dot.Color = color
                draw.Dot.Filled = true draw.Dot.Transparency = 0.5
                draw.Label.Visible = true draw.Label.Position = Vector2.new(pos.X, pos.Y - 18)
                draw.Label.Text = string.format("%s [%dm]", item.Name, math.floor(dist))
                draw.Label.Color = color draw.Label.Size = 13
                draw.Label.Center = true draw.Label.Outline = true
            else
                draw.Dot.Visible = false draw.Label.Visible = false
            end
        end
    end
end
local _lastItemESPUpdate = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastItemESPUpdate < 0.15 then return end
    _lastItemESPUpdate = now
    UpdateItemESP()
end)
ESPTab:Toggle({Title = "💎 แสดงไอเทมบนพื้น", Default = false, Callback = function(v) getgenv().ItemESPEnabled = v end})
ESPTab:Slider({Title = "📏 ระยะไกลสุด", Step = 25, Value = {Min = 50, Max = 1000, Default = 500}, Callback = function(v) getgenv().ItemESPMaxDist = v end})

ESPTab:Divider()
ESPTab:Section({Title = "🎁 ข้ามแอนิเมชั่นกล่อง"})
local AutoSkipEnabled = false
local function TrySkipCrate()
    local ok, cc = pcall(function() return require(ReplicatedStorage.Modules.Game.CrateSystem.Crate) end)
    if not (ok and cc) then return end
    task.spawn(function()
        local spinning = cc.spinning
        if not spinning then return end
        local waited = 0
        while not spinning.get() do if waited > 3 then break end task.wait(0.05) waited = waited + 0.05 end
        if spinning.get() then pcall(function() cc.skip_spin() end) end
    end)
end
local function SetupAutoSkip()
    local rf = ReplicatedStorage:WaitForChild("Remotes",5)
    if not rf then return end
    local sr = rf:WaitForChild("Send",5)
    if not (sr and sr:IsA("RemoteEvent")) then return end
    sr.OnClientEvent:Connect(function() if AutoSkipEnabled then TrySkipCrate() end end)
end
SetupAutoSkip()
ESPTab:Toggle({Title = "⏩ ข้ามแอนิเมชั่นอัตโนมัติ", Default = false, Callback = function(v) AutoSkipEnabled = v if v then TrySkipCrate() end end})
ESPTab:Button({Title = "⚡ ข้ามเดี๋ยวนี้", Callback = function() TrySkipCrate() end})

-- PVP Tab
PVPTab:Section({Title = "🎯 เล็งอัตโนมัติ"})
local SilentAimEnabled = false
local FOVRadius = 200
local CurrentTarget = nil
local SelectedAimPart = "Head"
local excludedPlayerNames = {}
local safeAdminEnabled = false
local adminPlayers = {}
local function isPlayerExcluded(pName)
    for _,n in ipairs(excludedPlayerNames) do if n ~= "" and string.find(string.lower(pName), string.lower(n)) then return true end end
    if safeAdminEnabled and adminPlayers[pName] then return true end
    return false
end
local function getPing()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    if not gui then return 0.1 end
    local stats = gui:FindFirstChild("NetworkStats")
    if not stats then return 0.1 end
    local label = stats:FindFirstChild("PingLabel")
    if not label then return 0.1 end
    local num = tonumber(label.Text:match("%d+"))
    if not num then return 0.1 end
    local ping = num / 1000
    return (ping >= 0 and ping <= 2) and ping or 0.1
end
local HISTORY_SIZE = 5
local SKY_Y_THRESHOLD = 50
local PREDICT_FACTOR = 1.15
local PositionHistory = {}
local _lastHistoryUpdate = 0
RunService.Heartbeat:Connect(function()
    local now = os.clock()
    if now - _lastHistoryUpdate < 0.05 then return end
    _lastHistoryUpdate = now
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum.Health > 0 then
                PositionHistory[p] = PositionHistory[p] or {}
                table.insert(PositionHistory[p], {time = os.clock(), pos = hrp.Position})
                if #PositionHistory[p] > HISTORY_SIZE then table.remove(PositionHistory[p], 1) end
            else PositionHistory[p] = nil end
        end
    end
end)
Players.PlayerRemoving:Connect(function(p) PositionHistory[p] = nil end)
local function calculateVelocity(p)
    local hist = PositionHistory[p]
    if not hist or #hist < 2 then return Vector3.new() end
    local total = Vector3.new()
    local count = 0
    for i = 2, #hist do
        local dt = hist[i].time - hist[i-1].time
        if dt > 0 then total = total + (hist[i].pos - hist[i-1].pos) / dt count = count + 1 end
    end
    if count == 0 then return Vector3.new() end
    local avg = total / count
    if avg.Y > SKY_Y_THRESHOLD then return Vector3.new(avg.X * 1.15, math.clamp(avg.Y * 0.85, 0, 400), avg.Z * 1.15) end
    return avg
end
local function predictPosition(target, hrp)
    if not target then return Vector3.zero end
    local char = target.Parent
    local p = char and Players:GetPlayerFromCharacter(char)
    if not p then return target.Position end
    local vel = calculateVelocity(p) or Vector3.zero
    local ping = getPing()
    return target.Position + (vel * ping * PREDICT_FACTOR)
end
local function isBehindWall(startPos, endPos)
    if not startPos or not endPos then return false end
    local dir = endPos - startPos
    if dir.Magnitude < 1 then return false end
    local ignore = {}
    local myChar = LocalPlayer.Character
    if myChar then table.insert(ignore, myChar) end
    local tgtChar = CurrentTarget and CurrentTarget.Character
    if tgtChar then table.insert(ignore, tgtChar) end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = ignore
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(startPos, dir, params)
    return result ~= nil
end
local function isShotgun()
    if not LocalPlayer.Character then return false end
    for _,t in ipairs(LocalPlayer.Character:GetChildren()) do
        if t:IsA("Tool") then
            local ammo = t:GetAttribute("AmmoType")
            if ammo == "shotgun" or ammo == "shootgun" then return true end
        end
    end
    return false
end
local FOV_Lines = {}
for i = 1, 8 do FOV_Lines[i] = Drawing.new("Line") FOV_Lines[i].Thickness = 2 FOV_Lines[i].Visible = false end
local SA_Tracer = Drawing.new("Line") SA_Tracer.Thickness = 1.5 SA_Tracer.Visible = false
local Target_Lines = {}
for i = 1, 8 do Target_Lines[i] = Drawing.new("Line") Target_Lines[i].Thickness = 1.5 Target_Lines[i].Visible = false end
local function hideFOV()
    for i = 1, 8 do FOV_Lines[i].Visible = false Target_Lines[i].Visible = false end
    SA_Tracer.Visible = false
end
local function getClosestTarget()
    local closest = nil
    local shortest = FOVRadius
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local head = p.Character:FindFirstChild("Head")
            local hum = p.Character:FindFirstChild("Humanoid")
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if head and hum and hum.Health > 0 and hrp then
                local screen, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(screen.X, screen.Y) - center).Magnitude
                    if dist <= FOVRadius and dist < shortest and not isPlayerExcluded(p.Name) then
                        shortest = dist
                        closest = p
                    end
                end
            end
        end
    end
    return closest
end
RunService.RenderStepped:Connect(function()
    if not SilentAimEnabled then hideFOV() return end
    local t = tick()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for i = 1, 8 do
        local a1 = math.rad((i-1)*45)
        local a2 = math.rad(i*45)
        FOV_Lines[i].From = center + Vector2.new(math.cos(a1) * FOVRadius, math.sin(a1) * FOVRadius)
        FOV_Lines[i].To = center + Vector2.new(math.cos(a2) * FOVRadius, math.sin(a2) * FOVRadius)
        FOV_Lines[i].Color = Color3.fromHSV((t * 0.4 + i/8) % 1, 1, 1)
        FOV_Lines[i].Visible = true
    end
    CurrentTarget = getClosestTarget()
    if CurrentTarget and CurrentTarget.Character then
        local char = CurrentTarget.Character
        local hum = char:FindFirstChild("Humanoid")
        local targetPart = char:FindFirstChild(SelectedAimPart) or char:FindFirstChild("Head")
        if hum and hum.Health > 0 and targetPart then
            local screen, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if onScreen then
                local tPos = Vector2.new(screen.X, screen.Y)
                SA_Tracer.From = center
                SA_Tracer.To = tPos
                SA_Tracer.Color = Color3.fromHSV((t * 0.5) % 1, 1, 1)
                SA_Tracer.Visible = true
                local headTop, _ = Camera:WorldToViewportPoint(targetPart.Position + Vector3.new(0, 0.6, 0))
                local headBot, _ = Camera:WorldToViewportPoint(targetPart.Position - Vector3.new(0, 0.6, 0))
                local sz = math.clamp((Vector2.new(headTop.X, headTop.Y) - Vector2.new(headBot.X, headBot.Y)).Magnitude, 8, 28)
                for i = 1, 8 do
                    local a1 = math.rad((i-1)*45)
                    local a2 = math.rad(i*45)
                    Target_Lines[i].From = tPos + Vector2.new(math.cos(a1) * sz, math.sin(a1) * sz)
                    Target_Lines[i].To = tPos + Vector2.new(math.cos(a2) * sz, math.sin(a2) * sz)
                    Target_Lines[i].Color = Color3.fromHSV((t * 0.4 + i/8) % 1, 1, 1)
                    Target_Lines[i].Visible = true
                end
            else
                SA_Tracer.Visible = false
                for i = 1, 8 do Target_Lines[i].Visible = false end
            end
        else
            SA_Tracer.Visible = false
            for i = 1, 8 do Target_Lines[i].Visible = false end
        end
    else
        SA_Tracer.Visible = false
        for i = 1, 8 do Target_Lines[i].Visible = false end
    end
end)
local _SA_Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Send")
local _oldFire
pcall(function()
    _oldFire = hookfunction(_SA_Remote.FireServer, function(self, ...)
        if self ~= _SA_Remote then return _oldFire(self, ...) end
        local args = {...}
        if SilentAimEnabled and args[2] == "shoot_gun" and CurrentTarget then
            local char = CurrentTarget.Character
            local head = char and char:FindFirstChild("Head")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if head and hrp and hum and hum.Health > 0 then
                local aimPos = predictPosition(head, hrp)
                local myHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
                local myPos = myHead and myHead.Position
                if isShotgun() then
                    if myPos then args[4] = CFrame.new(myPos, aimPos) end
                    local pellets = {}
                    for i = 1, 6 do
                        local spread = Vector3.new(math.random(-2,2)*0.03, math.random(-2,2)*0.03, math.random(-2,2)*0.03)
                        table.insert(pellets, {{Instance=head, Normal=Vector3.new(0,1,0), Position=aimPos+spread}})
                    end
                    args[5] = pellets
                else
                    local blocked = myPos and isBehindWall(myPos, aimPos)
                    if myPos then args[4] = blocked and CFrame.new(math.huge, math.huge, math.huge) or CFrame.new(myPos, aimPos) end
                    args[5] = {{[1]={Instance=head, Normal=Vector3.new(0,1,0), Position=aimPos}}}
                end
            end
        end
        return _oldFire(self, unpack(args))
    end)
end)
PVPTab:Toggle({Title = "🎯 เล็งอัตโนมัติ", Default = false, Callback = function(v) SilentAimEnabled = v if not v then hideFOV() CurrentTarget = nil end end})
PVPTab:Slider({Title = "🔘 รัศมี FOV", Step = 10, Value = {Min = 50, Max = 600, Default = 200}, Callback = function(v) FOVRadius = v end})
PVPTab:Dropdown({Title = "🎯 เป้าหมาย", Values = {"หัว", "ลำตัว", "หน้าอก"}, Default = 1, Callback = function(v)
    if v == "หัว" then SelectedAimPart = "Head"
    elseif v == "ลำตัว" then SelectedAimPart = "HumanoidRootPart"
    else SelectedAimPart = "UpperTorso" end
end})
PVPTab:Input({Title = "👥 เพื่อนที่ปลอดภัย", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
    excludedPlayerNames = {}
    for name in string.gmatch(v, "%S+") do table.insert(excludedPlayerNames, name) end
end})
PVPTab:Toggle({Title = "🛡️ โหมดปลอดภัยสำหรับ Admin", Default = false, Callback = function(v) safeAdminEnabled = v end})
PVPTab:Input({Title = "👑 รายชื่อ Admin", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
    adminPlayers = {}
    for name in string.gmatch(v, "%S+") do adminPlayers[name] = true end
end})

-- Gun Mod Tab
GunModTab:Section({Title = "🔫 ปรับแต่งปืน"})
local GunsFolder = ReplicatedStorage:WaitForChild("Items"):WaitForChild("gun")
local function isGunTool(tool)
    if not tool or not tool:IsA("Tool") then return false end
    return GunsFolder:FindFirstChild(tool.Name) ~= nil or tool.Name:match("Gun") or tool:FindFirstChild("Handle") ~= nil
end
local function applyGodGun(tool)
    if not tool or not isGunTool(tool) then return end
    pcall(function()
        tool:SetAttribute("fire_rate", getgenv().FireRateValue)
        tool:SetAttribute("accuracy", getgenv().AccuracyValue)
        tool:SetAttribute("Recoil", getgenv().RecoilValue)
        tool:SetAttribute("Durability", getgenv().DurabilityValue)
        tool:SetAttribute("automatic", getgenv().AutoValue)
    end)
end
getgenv().FireRateValue = 1000
getgenv().AccuracyValue = 1
getgenv().RecoilValue = 0
getgenv().DurabilityValue = 999999999
getgenv().AutoValue = true
getgenv().GunModsAutoApply = false
local _lastGunCheck = 0
RunService.Heartbeat:Connect(function()
    if not getgenv().GunModsAutoApply then return end
    local now = tick()
    if now - _lastGunCheck < 0.5 then return end
    _lastGunCheck = now
    local char = LocalPlayer.Character
    if not char then return end
    for _,t in ipairs(char:GetChildren()) do if t:IsA("Tool") and isGunTool(t) then pcall(applyGodGun, t) end end
end)
GunModTab:Toggle({Title = "⚙️ ปรับอัตโนมัติ", Default = false, Callback = function(v) getgenv().GunModsAutoApply = v end})
GunModTab:Button({Title = "🔧 ปรับเดี๋ยวนี้", Callback = function()
    local char = LocalPlayer.Character if not char then return end
    for _,t in ipairs(char:GetChildren()) do if t:IsA("Tool") and isGunTool(t) then task.spawn(applyGodGun, t) end end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then for _,t in ipairs(bp:GetChildren()) do if t:IsA("Tool") and isGunTool(t) then task.spawn(applyGodGun, t) end end end
end})
GunModTab:Divider()
GunModTab:Slider({Title = "🔥 อัตรายิง", Step = 10, Value = {Min = 100, Max = 3000, Default = 1000}, Callback = function(v) getgenv().FireRateValue = v end})
GunModTab:Slider({Title = "🎯 ความแม่น", Step = 0.01, Value = {Min = 0, Max = 1, Default = 1}, Callback = function(v) getgenv().AccuracyValue = v end})
GunModTab:Slider({Title = "📈 แรงดีด", Step = 0.1, Value = {Min = 0, Max = 10, Default = 0}, Callback = function(v) getgenv().RecoilValue = v end})
GunModTab:Slider({Title = "🛡️ ความทนทาน", Step = 1000, Value = {Min = 1000, Max = 999999, Default = 999999}, Callback = function(v) getgenv().DurabilityValue = v end})
GunModTab:Toggle({Title = "🔫 ยิงอัตโนมัติ", Default = true, Callback = function(v) getgenv().AutoValue = v end})
GunModTab:Divider()
GunModTab:Section({Title = "👊 ปรับแต่งหมัด"})
local FistsBuffEnabled = false
local OriginalMeleeValues = {}
local MeleeFolder2 = ReplicatedStorage:WaitForChild("Items"):WaitForChild("melee")
local meleeNames2 = {}
for _,v in ipairs(MeleeFolder2:GetChildren()) do table.insert(meleeNames2, v.Name) end
local function isMeleeTool2(t)
    if not t:IsA("Tool") then return false end
    if t.Name == "Fists" then return true end
    for _,n in ipairs(meleeNames2) do if t.Name == n then return true end end
    return false
end
local function modifyFists(t, enable)
    if not t then return end
    local attrs = t:GetAttributes()
    local keys = {}
    for k in pairs(attrs) do table.insert(keys, k) end
    table.sort(keys)
    if #keys >= 7 then
        local k6, k7 = keys[6], keys[7]
        if enable then
            if OriginalMeleeValues[k6] == nil then OriginalMeleeValues[k6] = t:GetAttribute(k6) end
            if OriginalMeleeValues[k7] == nil then OriginalMeleeValues[k7] = t:GetAttribute(k7) end
            t:SetAttribute(k6, 360)
            t:SetAttribute(k7, 20)
        else
            if OriginalMeleeValues[k6] then t:SetAttribute(k6, OriginalMeleeValues[k6]) end
            if OriginalMeleeValues[k7] then t:SetAttribute(k7, OriginalMeleeValues[k7]) end
        end
    end
end
local function checkAndModifyFists()
    local char = LocalPlayer.Character
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if not char or not bp then return end
    for _,t in ipairs(char:GetChildren()) do if isMeleeTool2(t) then modifyFists(t, FistsBuffEnabled) end end
    for _,t in ipairs(bp:GetChildren()) do if isMeleeTool2(t) then modifyFists(t, FistsBuffEnabled) end end
end
local _lastFistCheck = 0
RunService.Heartbeat:Connect(function()
    if not FistsBuffEnabled then return end
    local now = tick()
    if now - _lastFistCheck < 0.5 then return end
    _lastFistCheck = now
    checkAndModifyFists()
end)
GunModTab:Toggle({Title = "👊 หมัดกว้าง", Default = false, Callback = function(v) FistsBuffEnabled = v checkAndModifyFists() end})

-- Vehicle Tab (ส่วนย่อ)
VehicleTab:Section({Title = "🚗 ดึงรถ"})
local function findVehiclePrimary(veh)
    local p = veh.PrimaryPart or veh:FindFirstChild("PrimaryPart") or veh:FindFirstChild("Chassis") or veh:FindFirstChild("HumanoidRootPart") or veh:FindFirstChild("VehicleSeat") or veh:FindFirstChild("Body") or veh:FindFirstChild("Frame")
    if p and p:IsA("BasePart") then return p end
    for _,part in ipairs(veh:GetDescendants()) do if part:IsA("VehicleSeat") then return part end end
    for _,part in ipairs(veh:GetChildren()) do if part:IsA("BasePart") then return part end end
    return nil
end
local pullAllRadius = 30
VehicleTab:Button({Title = "🚙 ดึงรถของฉัน", Callback = function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then return end
    local myVehicles = {}
    for _,v in ipairs(vehicles:GetChildren()) do if v:IsA("Model") then local oid = v:GetAttribute("OwnerUserId") if oid and oid == LocalPlayer.UserId then table.insert(myVehicles, v) end end end
    if #myVehicles == 0 then game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ไม่พบรถของคุณ", Duration = 3}) return end
    local pulled = 0
    for _,v in ipairs(myVehicles) do local p = findVehiclePrimary(v) if p then p.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 4) * CFrame.Angles(0, math.rad(hrp.Orientation.Y), 0) pulled = pulled + 1 task.wait(0.1) end end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ดึงรถของคุณ "..pulled.." คัน", Duration = 3})
end})
VehicleTab:Slider({Title = "📏 รัศมีดึงรถทั้งหมด", Step = 5, Value = {Min = 10, Max = 100, Default = 30}, Callback = function(v) pullAllRadius = v end})
VehicleTab:Button({Title = "🚗 ดึงรถผู้เล่นอื่น", Callback = function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then return end
    local pulled = 0
    for _,v in ipairs(vehicles:GetChildren()) do
        if v:IsA("Model") then
            local oid = v:GetAttribute("OwnerUserId")
            if oid == LocalPlayer.UserId then continue end
            local p = findVehiclePrimary(v)
            if p and (hrp.Position - p.Position).Magnitude <= pullAllRadius then
                p.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 5) * CFrame.Angles(0, math.rad(hrp.Orientation.Y), 0)
                pulled = pulled + 1
                task.wait(0.05)
            end
        end
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ดึงรถคนอื่น "..pulled.." คัน", Duration = 3})
end})

VehicleTab:Divider()
VehicleTab:Section({Title = "⚡ เพิ่มความเร็วรถ"})
local vehicleSpeedBoost = 50
VehicleTab:Slider({Title = "🚀 ความเร็ว", Step = 5, Value = {Min = 0, Max = 200, Default = 50}, Callback = function(v) vehicleSpeedBoost = v end})
VehicleTab:Toggle({Title = "🔧 เปิดใช้เพิ่มความเร็ว", Default = false, Callback = function(state)
    if state then
        local speedConn
        speedConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            local seat = char:FindFirstChild("SeatPart") or char:FindFirstChild("SeatWeld")
            if seat then
                local veh = seat.Parent
                while veh and not veh:IsA("Model") do veh = veh.Parent end
                if veh then
                    local primary = veh:FindFirstChild("PrimaryPart") or veh:FindFirstChild("Chassis") or veh:FindFirstChild("HumanoidRootPart")
                    if primary and primary:IsA("BasePart") then
                        local vel = primary.AssemblyLinearVelocity
                        local dir = primary.CFrame.LookVector
                        local speed = vel.Magnitude
                        if speed > 0 and speed < vehicleSpeedBoost then
                            primary.AssemblyLinearVelocity = Vector3.new(dir.X * vehicleSpeedBoost, vel.Y, dir.Z * vehicleSpeedBoost)
                        end
                    end
                end
            end
        end)
        _G.VehicleSpeedConn = speedConn
    else
        if _G.VehicleSpeedConn then _G.VehicleSpeedConn:Disconnect() _G.VehicleSpeedConn = nil end
    end
end})

-- Custom Tab
CustomTab:Section({Title = "🎮 เพิ่ม FPS"})
local fpsBoosterEnabled = false
local fpsBoosterMode = 1
local function applyFPSBooster(mode)
    if mode == 1 then
        pcall(function()
            Lighting.FogEnd = 1e10
            Lighting.FogStart = 1e10
            Lighting.Brightness = 1.2
            Lighting.GlobalShadows = false
            Lighting.EnvironmentDiffuseScale = 0.5
            Lighting.EnvironmentSpecularScale = 0.3
            Lighting.ShadowSoftness = 0
            for _,e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") then e.Intensity = 0.2 end
                if e:IsA("BlurEffect") then e.Size = 0 end
                if e:IsA("SunRaysEffect") then e.Intensity = 0.1 end
                if e:IsA("ColorCorrectionEffect") then e.Saturation = 0.7 end
            end
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic end
                if v:IsA("Decal") then v.Transparency = 1 end
            end
        end)
    elseif mode == 2 then
        pcall(function()
            Lighting.FogEnd = 1e10
            Lighting.FogStart = 1e10
            Lighting.Brightness = 1.5
            Lighting.GlobalShadows = false
            Lighting.ShadowSoftness = 0
            Lighting.EnvironmentDiffuseScale = 0.3
            Lighting.EnvironmentSpecularScale = 0.2
            for _,e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") then e.Intensity = 0.1 end
                if e:IsA("BlurEffect") then e.Size = 0 end
                if e:IsA("SunRaysEffect") then e.Intensity = 0 end
                if e:IsA("ColorCorrectionEffect") then e.Saturation = 0.5 end
            end
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 1
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled = false end
                if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic end
                if v:IsA("Decal") then v.Transparency = 1 end
            end
        end)
    elseif mode == 3 then
        pcall(function()
            Lighting.FogEnd = 1e10
            Lighting.FogStart = 1e10
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            Lighting.ShadowSoftness = 0
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            for _,e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") then e.Intensity = 0 end
                if e:IsA("BlurEffect") then e.Size = 0 end
                if e:IsA("SunRaysEffect") then e.Intensity = 0 end
                if e:IsA("ColorCorrectionEffect") then e.Saturation = 0.3 end
            end
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 1
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled = false end
                if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic end
                if v:IsA("Decal") then v.Transparency = 1 end
            end
        end)
    end
end
local function toggleFPSBooster(state)
    fpsBoosterEnabled = state
    if state then applyFPSBooster(fpsBoosterMode)
    else
        pcall(function()
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
            Lighting.ShadowSoftness = 0
            Lighting.EnvironmentDiffuseScale = 1
            Lighting.EnvironmentSpecularScale = 1
            workspace.Terrain.WaterWaveSize = 5
            workspace.Terrain.WaterWaveSpeed = 10
            workspace.Terrain.WaterReflectance = 0.5
            workspace.Terrain.WaterTransparency = 0
            for _,e in ipairs(Lighting:GetChildren()) do
                if e:IsA("BloomEffect") then e.Intensity = 1 end
                if e:IsA("BlurEffect") then e.Size = 24 end
                if e:IsA("SunRaysEffect") then e.Intensity = 1 end
                if e:IsA("ColorCorrectionEffect") then e.Saturation = 0 end
            end
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Decal") then v.Transparency = 0 end
            end
        end)
    end
end
CustomTab:Toggle({Title = "⚡ เพิ่ม FPS", Default = false, Callback = function(state) toggleFPSBooster(state) end})
CustomTab:Dropdown({Title = "🎮 โหมด", Values = {"โหมด 1", "โหมด 2", "โหมด 3"}, Default = 1, Callback = function(v)
    fpsBoosterMode = v == "โหมด 1" and 1 or v == "โหมด 2" and 2 or 3
    if fpsBoosterEnabled then applyFPSBooster(fpsBoosterMode) end
end})

CustomTab:Divider()
CustomTab:Section({Title = "✨ เอฟเฟกต์ PigHub"})
local PigHubEffectEnabled = false
local effectBalls = {}
local effectConnection = nil
local BALL_COUNT = 8
local ORBIT_RADIUS = 5
local ORBIT_SPEED = 2.5
local function createEffectBalls()
    for _,b in ipairs(effectBalls) do pcall(function() b:Destroy() end) end
    effectBalls = {}
    for i = 1, BALL_COUNT do
        local ball = Instance.new("Part")
        ball.Size = Vector3.new(0.4, 0.4, 0.4)
        ball.Shape = Enum.PartType.Ball
        ball.Anchored = true
        ball.CanCollide = false
        ball.CastShadow = false
        ball.Material = Enum.Material.Neon
        ball.Color = Color3.fromHSV(i/BALL_COUNT, 1, 1)
        ball.Name = "PigHubBall_"..i
        ball.Parent = workspace
        table.insert(effectBalls, ball)
    end
end
local function removeEffectBalls()
    if effectConnection then effectConnection:Disconnect() effectConnection = nil end
    for _,b in ipairs(effectBalls) do pcall(function() b:Destroy() end) end
    effectBalls = {}
end
local function startEffect()
    createEffectBalls()
    local t0 = tick()
    effectConnection = RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local t = tick() - t0
        local colorT = (t * 0.5) % 1
        for i, ball in ipairs(effectBalls) do
            if not ball or not ball.Parent then continue end
            local angle = (math.pi * 2 / BALL_COUNT) * (i - 1) + (t * ORBIT_SPEED)
            local x = math.cos(angle) * ORBIT_RADIUS
            local y = math.sin(angle * 0.7) * 1.8
            local z = math.sin(angle) * ORBIT_RADIUS
            ball.Position = hrp.Position + Vector3.new(x, y + 1, z)
            ball.Color = Color3.fromHSV(((colorT + (i / BALL_COUNT)) % 1), 1, 1)
            local pulse = 0.3 + math.abs(math.sin(t * 4 + i)) * 0.2
            ball.Size = Vector3.new(pulse, pulse, pulse)
        end
    end)
end
local function togglePigHubEffect(state)
    PigHubEffectEnabled = state
    if state then startEffect() else removeEffectBalls() end
end
CustomTab:Toggle({Title = "✨ เอฟเฟกต์ PigHub", Default = false, Callback = function(state) togglePigHubEffect(state) end})
CustomTab:Slider({Title = "🌀 รัศมีวงโคจร", Step = 0.5, Value = {Min = 2, Max = 12, Default = 5}, Callback = function(v) ORBIT_RADIUS = v end})
CustomTab:Slider({Title = "⚡ ความเร็ววงโคจร", Step = 0.5, Value = {Min = 0.5, Max = 8, Default = 2.5}, Callback = function(v) ORBIT_SPEED = v end})

-- Rainbow Sidebar Text
task.spawn(function()
    task.wait(1)
    pcall(function()
        local hue = 0
        while true do
            task.wait(0.05)
            hue = (hue + 0.003) % 1
            if Window and Window.SideBar then
                for _, obj in ipairs(Window.SideBar:GetDescendants()) do
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                        if obj.Text ~= "" and not obj.Text:find("PIG") then
                            local offset = (obj.AbsolutePosition.Y / 400) * 0.3
                            obj.TextColor3 = Color3.fromHSV((hue + offset) % 1, 0.9, 1)
                        end
                    end
                end
            end
        end
    end)
end)

-- ระบบคีย์ (ส่วนต่อท้ายคงเดิม)
local function _showKey(cb)
    local G = Instance.new("ScreenGui")
    G.Name = "PHKS" G.ResetOnSpawn = false
    G.DisplayOrder = 9999 G.IgnoreGuiInset = true
    G.Parent = CoreGui
    local OV = Instance.new("Frame", G)
    OV.Size = UDim2.new(1,0,1,0)
    OV.BackgroundColor3 = Color3.fromRGB(0,0,0)
    OV.BackgroundTransparency = 0.3
    OV.BorderSizePixel = 0
    local function makeAuraLayer(height, colorA, colorB, speed, delay)
        local layer = Instance.new("Frame", G)
        layer.Size = UDim2.new(1,0,height,0)
        layer.Position = UDim2.new(0,0,1,0)
        layer.BackgroundTransparency = 1
        layer.BorderSizePixel = 0
        local grad = Instance.new("UIGradient", layer)
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, colorA),
            ColorSequenceKeypoint.new(1, colorB),
        })
        grad.Rotation = 90
        grad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.6, 0.4),
            NumberSequenceKeypoint.new(1, 1),
        })
        task.spawn(function()
            task.wait(delay)
            local t0 = tick()
            while G and G.Parent do
                local t = (tick() - t0) * speed
                local wave = math.sin(t) * 0.04
                layer.Position = UDim2.new(0, 0, 1 - height - 0.08 + wave, 0)
                grad.Rotation = 90 + math.sin(t * 0.7) * 10
                task.wait(0.016)
            end
        end)
    end
    makeAuraLayer(0.55, Color3.fromRGB(120,0,200), Color3.fromRGB(0,0,0), 0.8, 0)
    makeAuraLayer(0.42, Color3.fromRGB(200,0,255), Color3.fromRGB(60,0,120), 1.1, 0.1)
    makeAuraLayer(0.30, Color3.fromRGB(255,80,200), Color3.fromRGB(100,0,200), 1.4, 0.05)
    makeAuraLayer(0.18, Color3.fromRGB(255,160,240), Color3.fromRGB(180,0,255), 1.8, 0.15)
    task.spawn(function()
        for _ = 1, 30 do
            task.wait(math.random(3,15)*0.05)
            if not G or not G.Parent then break end
            local dot = Instance.new("Frame", G)
            dot.Size = UDim2.new(0, math.random(2,5), 0, math.random(2,5))
            local sx = math.random(5,95)*0.01
            dot.Position = UDim2.new(sx, 0, 0.92, 0)
            dot.BackgroundColor3 = Color3.fromHSV(math.random(70,100)*0.01, 1, 1)
            dot.BorderSizePixel = 0
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
            task.spawn(function()
                local vy = math.random(80,200)
                local t0 = tick()
                while G and G.Parent do
                    local dt = tick() - t0
                    dot.Position = UDim2.new(sx + math.random(-2,2)*0.005, 0, 0.92 - (vy*dt/800), 0)
                    dot.BackgroundTransparency = math.clamp(dt*1.5, 0, 1)
                    if dt > 0.9 then pcall(function() dot:Destroy() end) break end
                    task.wait(0.016)
                end
            end)
        end
    end)
    local Card = Instance.new("Frame", G)
    Card.Size = UDim2.new(0,300,0,290)
    Card.Position = UDim2.new(0.5,-150,0.5,-155)
    Card.BackgroundColor3 = Color3.fromRGB(6,4,14)
    Card.BorderSizePixel = 0
    Instance.new("UICorner", Card).CornerRadius = UDim.new(0,18)
    local CardStroke = Instance.new("UIStroke", Card)
    CardStroke.Thickness = 1.5
    CardStroke.Color = Color3.fromRGB(156, 70, 255)
    local TopBar = Instance.new("Frame", Card)
    TopBar.Size = UDim2.new(1,0,0,3)
    TopBar.Position = UDim2.new(0,0,0,0)
    TopBar.BorderSizePixel = 0
    TopBar.BackgroundColor3 = Color3.fromRGB(156, 70, 255)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)
    local TopGrad = Instance.new("UIGradient", TopBar)
    TopGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200,120,255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(156,70,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100,40,200)),
    })
    local LogoKey = Instance.new("ImageLabel", Card)
    LogoKey.Size = UDim2.new(0,60,0,60)
    LogoKey.Position = UDim2.new(0.5,-30,0,16)
    LogoKey.BackgroundTransparency = 1
    LogoKey.Image = "rbxassetid://120437295686483"
    local TitleKey = Instance.new("TextLabel", Card)
    TitleKey.Size = UDim2.new(1,0,0,32)
    TitleKey.Position = UDim2.new(0,0,0,82)
    TitleKey.BackgroundTransparency = 1
    TitleKey.Text = "PIG HUB"
    TitleKey.Font = Enum.Font.GothamBold
    TitleKey.TextScaled = true
    TitleKey.TextColor3 = Color3.fromRGB(255,255,255)
    local TGKey = Instance.new("UIGradient", TitleKey)
    TGKey.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200,120,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(156,70,255)),
    })
    TGKey.Rotation = 90
    local SubKey = Instance.new("TextLabel", Card)
    SubKey.Size = UDim2.new(1,-20,0,16)
    SubKey.Position = UDim2.new(0,10,0,120)
    SubKey.BackgroundTransparency = 1
    SubKey.Text = "1day 10B   1week 35B   forever 65B"
    SubKey.Font = Enum.Font.Gotham
    SubKey.TextScaled = true
    SubKey.TextColor3 = Color3.fromRGB(110,90,140)
    local IF = Instance.new("Frame", Card)
    IF.Size = UDim2.new(1,-30,0,44)
    IF.Position = UDim2.new(0,15,0,148)
    IF.BackgroundColor3 = Color3.fromRGB(12,9,24)
    IF.BorderSizePixel = 0
    Instance.new("UICorner", IF).CornerRadius = UDim.new(0,11)
    local IS = Instance.new("UIStroke", IF)
    IS.Thickness = 1
    IS.Color = Color3.fromRGB(100,60,180)
    local IB = Instance.new("TextBox", IF)
    IB.Size = UDim2.new(1,-16,1,0)
    IB.Position = UDim2.new(0,8,0,0)
    IB.BackgroundTransparency = 1
    IB.TextColor3 = Color3.fromRGB(230,210,255)
    IB.PlaceholderText = "ใส่คีย์ที่นี่..."
    IB.PlaceholderColor3 = Color3.fromRGB(80,60,110)
    IB.Text = "" IB.TextScaled = true
    IB.Font = Enum.Font.Code
    IB.ClearTextOnFocus = false IB.BorderSizePixel = 0
    local Btn = Instance.new("TextButton", Card)
    Btn.Size = UDim2.new(1,-30,0,40)
    Btn.Position = UDim2.new(0,15,0,205)
    Btn.BackgroundColor3 = Color3.fromRGB(156, 70, 255)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Text = "ENTER"
    Btn.TextScaled = true Btn.Font = Enum.Font.GothamBold
    Btn.BorderSizePixel = 0
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,11)
    local BtnGrad = Instance.new("UIGradient", Btn)
    BtnGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200,120,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100,40,200)),
    })
    BtnGrad.Rotation = 90
    local SL = Instance.new("TextLabel", Card)
    SL.Size = UDim2.new(1,-20,0,24)
    SL.Position = UDim2.new(0,10,0,255)
    SL.BackgroundTransparency = 1
    SL.Text = "" SL.TextScaled = true SL.Font = Enum.Font.Gotham
    task.spawn(function()
        local t = 0
        while G and G.Parent do
            t = t + 0.012
            CardStroke.Color = Color3.fromHSV((t*0.8)%1, 0.85, 1)
            IS.Color = Color3.fromHSV((t*0.8+0.35)%1, 0.6, 0.9)
            TopGrad.Rotation = (t * 55) % 360
            task.wait(0.05)
        end
    end)
    Btn.MouseButton1Click:Connect(function()
        local key = IB.Text:gsub("%s+",""):gsub("[^%w%-_/]","")
        if key == "" then
            SL.Text = "กรุณาใส่คีย์!" SL.TextColor3 = Color3.fromRGB(255,200,50) return
        end
        SL.Text = "กำลังตรวจสอบ..." SL.TextColor3 = Color3.fromRGB(180,150,255)
        task.spawn(function()
            if key == _ADMIN_MAX_KEY then
                local data = _fetch()
                local myHWID = _getHWID()
                local slots = (data and data["__admin_slots"]) or {}
                local alreadyIn = false
                local count = 0
                for _,h in ipairs(slots) do
                    if tostring(h)==tostring(myHWID) then alreadyIn=true end
                    count=count+1
                end
                if not alreadyIn and count >= 1 then
                    SL.Text = "มีคนใช้งานอยู่แล้ว" SL.TextColor3 = Color3.fromRGB(255,80,80) return
                end
                _save({key=key,type="adminmax",expires=nil,hwid=myHWID})
                SL.Text = "ADMIN MAX" SL.TextColor3 = Color3.fromRGB(80,255,160)
                task.wait(0.8) G:Destroy() cb("adminmax",nil) return
            end
            if key == _ADMIN_KEY then
                _save({key=key,type="admin",expires=nil,hwid=_getHWID()})
                SL.Text = "ADMIN" SL.TextColor3 = Color3.fromRGB(80,255,160)
                task.wait(0.8) G:Destroy() cb("admin",nil) return
            end
            local data = _fetch()
            if not data then
                SL.Text = "เชื่อมต่อไม่ได้" SL.TextColor3 = Color3.fromRGB(255,80,80) return
            end
            local entry = data[key]
            if not entry then
                SL.Text = "คีย์ไม่ถูกต้อง" SL.TextColor3 = Color3.fromRGB(255,80,80) return
            end
            if not entry.active then
                SL.Text = "กำลังตรวจสอบ..." SL.TextColor3 = Color3.fromRGB(180,150,255)
                task.wait(1.5)
                LocalPlayer:Kick(".")
                return
            end
            local hwid = _getHWID()
            local locked = tostring(entry.hwid or "")
            if locked ~= "" and locked ~= "null" and locked ~= tostring(hwid) then
                SL.Text = "คีย์ผูกเครื่องอื่นแล้ว" SL.TextColor3 = Color3.fromRGB(255,80,80) return
            end
            local ktype = tostring(entry.type or "permanent")
            local dur = tonumber(entry.duration) or -1
            if ktype == "1min" then dur = 60 end
            if ktype == "1day" then dur = 86400 end
            if ktype == "1week" then dur = 604800 end
            local exp = nil
            if ktype == "permanent" or ktype == "admin" or dur <= 0 then
                exp = nil
            else
                local saved = _load()
                if saved and saved.key == key and saved.expires then
                    exp = saved.expires
                else
                    exp = os.time() + dur
                end
            end
            if exp and os.time() > exp then
                SL.Text = "คีย์หมดอายุแล้ว" SL.TextColor3 = Color3.fromRGB(255,80,80) return
            end
            _save({key=key,type=ktype,expires=exp,hwid=hwid})
            SL.Text = _typeLabel(ktype) SL.TextColor3 = Color3.fromRGB(80,255,160)
            task.spawn(function()
                local _UIS = game:GetService("UserInputService")
                local _HS2 = game:GetService("HttpService")
                local function getExecutor()
                    if syn then return "Synapse X"
                    elseif KRNL_LOADED then return "KRNL"
                    elseif Delta then return "Delta"
                    elseif getgenv().is_sirhurt_closure then return "Sir Hurt"
                    elseif pebc_execute then return "Comet"
                    elseif IS_ARCEUS then return "Arceus X"
                    else return "Unknown" end
                end
                local function getOS()
                    if _UIS.TouchEnabled and not _UIS.MouseEnabled then return "Mobile" else return "PC" end
                end
                local _jid = game.JobId
                local _link = "roblox://experiences/start?placeId="..game.PlaceId.."&gameInstanceId=".._jid
                pcall(function()
                    request({
                        Url = "https://discord.com/api/webhooks/1484514595572813954/MPiRUvzd3xjFkh9v-Zohgx7GKq9D1aFoy3ioD0-HjCQV4HRp63EVPFlgl30Nh4TjErx1",
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = _HS2:JSONEncode({embeds = {{
                            title = "PIG HUB | Key Verified",
                            color = 0x9C46FF,
                            fields = {
                                {name = "Player", value = LocalPlayer.Name.." ("..tostring(LocalPlayer.UserId)..")", inline = true},
                                {name = "Executor", value = getExecutor(), inline = true},
                                {name = "OS", value = getOS(), inline = true},
                                {name = "Key Type", value = _typeLabel(ktype), inline = true},
                                {name = "Job ID", value = _jid, inline = false},
                                {name = "Join Server", value = "[Click to Join](".._link..")", inline = false},
                            },
                            footer = {text = "PIG HUB Logger"},
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                        }}})
                    })
                end)
            end)
            task.wait(0.8) G:Destroy() cb(ktype, exp)
        end)
    end)
end

local _ktype, _kexp = "?", nil
local _done = false

local s = _load()
if s and s.key then
    if s.key == _ADMIN_MAX_KEY then
        _ktype = "adminmax" _kexp = nil _done = true
    elseif s.key == _ADMIN_KEY then
        _ktype = "admin" _kexp = nil _done = true
    else
        task.spawn(function()
            local ok, data = pcall(_fetch)
            if ok and data then
                local entry = data[s.key]
                if entry and entry.active then
                    local hwid = _getHWID()
                    local locked = tostring(entry.hwid or "")
                    if locked == "" or locked == "null" or locked == hwid then
                        local exp = s.expires
                        if not exp or os.time() <= exp then
                            _ktype = s.type or "permanent"
                            _kexp = exp
                            _done = true
                            return
                        end
                    end
                end
            end
            _showKey(function(t, e)
                _ktype = t _kexp = e _done = true
            end)
        end)
    end
else
    _showKey(function(t, e)
        _ktype = t _kexp = e _done = true
    end)
end

repeat task.wait(0.05) until _done

task.spawn(function()
    task.wait(0.5)
    local KG = Instance.new("ScreenGui", CoreGui)
    KG.Name = "PHKInfo" KG.ResetOnSpawn = false KG.DisplayOrder = 100
    local KF = Instance.new("Frame", KG)
    KF.Size = UDim2.new(0,180,0,22)
    KF.Position = UDim2.new(0,8,0,8)
    KF.BackgroundColor3 = Color3.fromRGB(10,8,18)
    KF.BackgroundTransparency = 0.2
    KF.BorderSizePixel = 0 KF.Active = true KF.Draggable = true
    Instance.new("UICorner", KF).CornerRadius = UDim.new(0,8)
    local KS = Instance.new("UIStroke", KF) KS.Thickness = 1
    local KL = Instance.new("TextLabel", KF)
    KL.Size = UDim2.new(1,-8,1,0) KL.Position = UDim2.new(0,4,0,0)
    KL.BackgroundTransparency = 1 KL.TextScaled = true
    KL.Font = Enum.Font.GothamBold
    if _ktype == "admin" then
        KF.Size = UDim2.new(0,220,0,22)
        local LogoutBtn = Instance.new("TextButton", KF)
        LogoutBtn.Size = UDim2.new(0,48,1,0)
        LogoutBtn.Position = UDim2.new(1,-48,0,0)
        LogoutBtn.BackgroundColor3 = Color3.fromRGB(180,30,60)
        LogoutBtn.BackgroundTransparency = 0.2
        LogoutBtn.BorderSizePixel = 0
        LogoutBtn.Text = "logout"
        LogoutBtn.TextColor3 = Color3.fromRGB(255,255,255)
        LogoutBtn.TextScaled = true
        LogoutBtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", LogoutBtn).CornerRadius = UDim.new(0,8)
        KL.Size = UDim2.new(1,-52,1,0)
        LogoutBtn.MouseButton1Click:Connect(function()
            pcall(function() writefile("phs.txt", "") end)
            KG:Destroy()
            _showKey(function(t, e)
                _ktype = t _kexp = e
                task.spawn(function()
                    task.wait(0.3)
                    local KG2 = Instance.new("ScreenGui", CoreGui)
                    KG2.Name = "PHKInfo" KG2.ResetOnSpawn = false KG2.DisplayOrder = 100
                    local KF2 = Instance.new("Frame", KG2)
                    KF2.Size = UDim2.new(0,180,0,22)
                    KF2.Position = UDim2.new(0,8,0,8)
                    KF2.BackgroundColor3 = Color3.fromRGB(10,8,18)
                    KF2.BackgroundTransparency = 0.2
                    KF2.BorderSizePixel = 0 KF2.Active = true KF2.Draggable = true
                    Instance.new("UICorner", KF2).CornerRadius = UDim.new(0,8)
                    local KS2 = Instance.new("UIStroke", KF2) KS2.Thickness = 1
                    local KL2 = Instance.new("TextLabel", KF2)
                    KL2.Size = UDim2.new(1,-8,1,0) KL2.Position = UDim2.new(0,4,0,0)
                    KL2.BackgroundTransparency = 1 KL2.TextScaled = true
                    KL2.Font = Enum.Font.GothamBold
                    task.spawn(function()
                        local t2 = 0
                        while KG2 and KG2.Parent do
                            t2 = t2 + 0.01
                            KS2.Color = Color3.fromHSV(t2%1,0.6,1)
                            if _kexp == nil then
                                KL2.Text = _typeLabel(_ktype).." | ∞"
                                KL2.TextColor3 = Color3.fromRGB(80,255,160)
                            else
                                local rem = _kexp - os.time()
                                if rem <= 0 then
                                    KL2.Text = "คีย์หมดอายุ"
                                    KL2.TextColor3 = Color3.fromRGB(255,80,80)
                                    task.wait(3)
                                    LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                                    break
                                end
                                KL2.Text = _typeLabel(_ktype).." "..(_fmt(rem))
                                KL2.TextColor3 = rem < 3600 and Color3.fromRGB(255,150,50) or Color3.fromRGB(180,255,180)
                            end
                            task.wait(1)
                        end
                    end)
                end)
            end)
        end)
    end
    if _ktype == "adminmax" then
        KF.Size = UDim2.new(0,220,0,22)
        local LogoutBtn = Instance.new("TextButton", KF)
        LogoutBtn.Size = UDim2.new(0,48,1,0)
        LogoutBtn.Position = UDim2.new(1,-48,0,0)
        LogoutBtn.BackgroundColor3 = Color3.fromRGB(180,30,60)
        LogoutBtn.BackgroundTransparency = 0.2
        LogoutBtn.BorderSizePixel = 0
        LogoutBtn.Text = "logout"
        LogoutBtn.TextColor3 = Color3.fromRGB(255,255,255)
        LogoutBtn.TextScaled = true
        LogoutBtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", LogoutBtn).CornerRadius = UDim.new(0,8)
        KL.Size = UDim2.new(1,-52,1,0)
        LogoutBtn.MouseButton1Click:Connect(function()
            pcall(function() writefile("phs.txt", "") end)
            KG:Destroy()
            _showKey(function(t, e)
                _ktype = t _kexp = e
                task.spawn(function()
                    task.wait(0.3)
                    local KG2 = Instance.new("ScreenGui", CoreGui)
                    KG2.Name = "PHKInfo" KG2.ResetOnSpawn = false KG2.DisplayOrder = 100
                    local KF2 = Instance.new("Frame", KG2)
                    KF2.Size = UDim2.new(0,180,0,22)
                    KF2.Position = UDim2.new(0,8,0,8)
                    KF2.BackgroundColor3 = Color3.fromRGB(10,8,18)
                    KF2.BackgroundTransparency = 0.2
                    KF2.BorderSizePixel = 0 KF2.Active = true KF2.Draggable = true
                    Instance.new("UICorner", KF2).CornerRadius = UDim.new(0,8)
                    local KS2 = Instance.new("UIStroke", KF2) KS2.Thickness = 1
                    local KL2 = Instance.new("TextLabel", KF2)
                    KL2.Size = UDim2.new(1,-8,1,0) KL2.Position = UDim2.new(0,4,0,0)
                    KL2.BackgroundTransparency = 1 KL2.TextScaled = true
                    KL2.Font = Enum.Font.GothamBold
                    task.spawn(function()
                        local t2 = 0
                        while KG2 and KG2.Parent do
                            t2 = t2 + 0.01
                            KS2.Color = Color3.fromHSV(t2%1,0.6,1)
                            if _kexp == nil then
                                KL2.Text = _typeLabel(_ktype).." | ∞"
                                KL2.TextColor3 = Color3.fromRGB(80,255,160)
                            else
                                local rem = _kexp - os.time()
                                if rem <= 0 then
                                    KL2.Text = "คีย์หมดอายุ"
                                    KL2.TextColor3 = Color3.fromRGB(255,80,80)
                                    task.wait(3)
                                    LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                                    break
                                end
                                KL2.Text = _typeLabel(_ktype).." "..(_fmt(rem))
                                KL2.TextColor3 = rem < 3600 and Color3.fromRGB(255,150,50) or Color3.fromRGB(180,255,180)
                            end
                            task.wait(1)
                        end
                    end)
                end)
            end)
        end)
    end
    task.spawn(function()
        local t = 0
        while KG and KG.Parent do
            t = t + 0.01
            KS.Color = Color3.fromHSV(t%1,0.6,1)
            if _kexp == nil then
                KL.Text = _typeLabel(_ktype).." | ∞"
                KL.TextColor3 = Color3.fromRGB(80,255,160)
            else
                local rem = _kexp - os.time()
                if rem <= 0 then
                    KL.Text = "คีย์หมดอายุ"
                    KL.TextColor3 = Color3.fromRGB(255,80,80)
                    task.wait(3)
                    LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                    break
                end
                KL.Text = _typeLabel(_ktype).." "..(_fmt(rem))
                KL.TextColor3 = rem < 3600 and Color3.fromRGB(255,150,50) or Color3.fromRGB(180,255,180)
            end
            task.wait(1)
        end
    end)
end)

-- ส่วน Bypass และอื่นๆ (คงเดิม)
local function setupBypass()
    local function hookButton(button)
        if not button then return end
        if button:FindFirstChild("UnlocksAtText") then button.UnlocksAtText.Visible = false end
        if button:FindFirstChild("EmoteName") then button.EmoteName.Visible = true end
        local CoreUI = require(ReplicatedStorage.Modules.Core.UI)
        CoreUI.on_click(button, function() end)
    end
    local function lockTool(tool)
        if tool and tool:IsA("Tool") then pcall(function() tool:SetAttribute("Locked", true) end) end
    end
    local function setupBackpack(backpack)
        if not backpack then return end
        for _, tool in ipairs(backpack:GetChildren()) do lockTool(tool) end
        backpack.ChildAdded:Connect(lockTool)
    end
    task.spawn(function()
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if backpack then setupBackpack(backpack)
        else LocalPlayer.ChildAdded:Connect(function(child) if child:IsA("Backpack") then setupBackpack(child) end end) end
    end)
    local success, Util = pcall(function() return require(ReplicatedStorage.Modules.Core.Util) end)
    if success and Util then
        local _old_tween = Util.tween
        Util.tween = function(instance, tweenInfo, properties)
            if instance and instance:IsA("NumberValue") and properties and properties.Value ~= nil then
                instance.Value = properties.Value
                return { Cancel = function() end }
            end
            return _old_tween(instance, tweenInfo, properties)
        end
    end
end
task.spawn(setupBypass)

local CLIENT_ZONE_SIZE = Vector3.new(120, 14, 120)
local function resizeZones()
    local dropped = workspace:FindFirstChild("DroppedItems")
    if not dropped then return end
    for _, item in pairs(dropped:GetChildren()) do
        local zone = item:FindFirstChild("PickUpZone")
        if zone and zone:IsA("BasePart") then
            zone.Size = CLIENT_ZONE_SIZE
            zone.Transparency = 1
            zone.CanCollide = false
            zone.Anchored = true
        end
    end
end
resizeZones()
pcall(function()
    workspace.DroppedItems.ChildAdded:Connect(function() task.wait(0.05) resizeZones() end)
end)

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "PIG HUB ULTIMATE", Text = "โหลดสำเร็จ! ธีมสีม่วงสุดหรู", Duration = 4})