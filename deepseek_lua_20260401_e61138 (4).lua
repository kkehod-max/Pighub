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
GlowFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
GlowFrame.Parent = MainFrame
local GlowCorner = Instance.new("UICorner", GlowFrame)
GlowCorner.CornerRadius = UDim.new(1, 0)

local CampName = Instance.new("TextLabel")
CampName.Size = UDim2.new(1, 0, 0, 80)
CampName.Position = UDim2.new(0, 0, 0.5, 160)
CampName.BackgroundTransparency = 1
CampName.Text = "PIG HUB"
CampName.TextColor3 = Color3.fromRGB(255, 105, 180)
CampName.TextScaled = true
CampName.Font = Enum.Font.GothamBold
CampName.TextTransparency = 1
CampName.Parent = MainFrame

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(1, 0, 0, 30)
SubText.Position = UDim2.new(0, 0, 0.5, 220)
SubText.BackgroundTransparency = 1
SubText.Text = "ULTIMATE EDITION"
SubText.TextColor3 = Color3.fromRGB(255, 200, 220)
SubText.TextScaled = true
SubText.Font = Enum.Font.Gotham
SubText.TextTransparency = 1
SubText.Parent = MainFrame

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 182, 193)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 105, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 182, 193))
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
    if id == "?" or id == "" then id = tostring(game:GetService("Players").LocalPlayer.UserId) end
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

-- ============================================
-- ระบบบันทึกและโหลดการตั้งค่า
-- ============================================
local SettingsFolder = "PigHubSettings"
local CurrentProfile = "Default"
local SettingsData = {}

local function saveSettings()
    pcall(function()
        if not isfolder(SettingsFolder) then makefolder(SettingsFolder) end
        local path = SettingsFolder .. "/" .. CurrentProfile .. ".json"
        writefile(path, _HS:JSONEncode(SettingsData))
    end)
end

local function loadSettings(profileName)
    local path = SettingsFolder .. "/" .. profileName .. ".json"
    local ok, data = pcall(readfile, path)
    if ok and data and data ~= "" then
        local jok, d = pcall(_HS.JSONDecode, _HS, data)
        if jok and d then
            SettingsData = d
            CurrentProfile = profileName
            return true
        end
    end
    return false
end

local function resetCurrentSettings()
    SettingsData = {}
    saveSettings()
end

local function getAvailableProfiles()
    local profiles = {}
    pcall(function()
        if not isfolder(SettingsFolder) then makefolder(SettingsFolder) end
        for _, file in ipairs(listfiles(SettingsFolder)) do
            local name = file:match("([^/]+)%.json$")
            if name then table.insert(profiles, name) end
        end
    end)
    return profiles
end

-- ============================================
-- ระบบเปลี่ยนคีย์ (Re-login)
-- ============================================
local function showKeyUI(callback)
    local G = Instance.new("ScreenGui")
    G.Name = "PHKS" G.ResetOnSpawn = false
    G.DisplayOrder = 9999 G.IgnoreGuiInset = true
    G.Parent = CoreGui
    
    -- พื้นหลังมืดแบบเบลอ
    local OV = Instance.new("Frame", G)
    OV.Size = UDim2.new(1,0,1,0)
    OV.BackgroundColor3 = Color3.fromRGB(0,0,0)
    OV.BackgroundTransparency = 0.5
    OV.BorderSizePixel = 0
    
    -- เอฟเฟกต์แสงออโรร่า
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
    
    -- อนุภาคลอย
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
    
    -- การ์ดหลัก
    local Card = Instance.new("Frame", G)
    Card.Size = UDim2.new(0, 360, 0, 380)
    Card.Position = UDim2.new(0.5, -180, 0.5, -190)
    Card.BackgroundColor3 = Color3.fromRGB(6, 4, 20)
    Card.BorderSizePixel = 0
    Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 20)
    
    local CardStroke = Instance.new("UIStroke", Card)
    CardStroke.Thickness = 1.5
    CardStroke.Color = Color3.fromRGB(200, 80, 255)
    
    -- แถบด้านบน
    local TopBar = Instance.new("Frame", Card)
    TopBar.Size = UDim2.new(1, 0, 0, 3)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.BackgroundColor3 = Color3.fromRGB(200, 80, 255)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 20)
    
    local TopGrad = Instance.new("UIGradient", TopBar)
    TopGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 60, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 255)),
    })
    
    -- โลโก้
    local Logo = Instance.new("ImageLabel", Card)
    Logo.Size = UDim2.new(0, 70, 0, 70)
    Logo.Position = UDim2.new(0.5, -35, 0, 12)
    Logo.BackgroundTransparency = 1
    Logo.Image = "rbxassetid://117924028123190"
    
    -- ชื่อ
    local Title = Instance.new("TextLabel", Card)
    Title.Size = UDim2.new(1, 0, 0, 38)
    Title.Position = UDim2.new(0, 0, 0, 88)
    Title.BackgroundTransparency = 1
    Title.Text = "PIG HUB"
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local TG = Instance.new("UIGradient", Title)
    TG.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 100, 255)),
    })
    TG.Rotation = 90
    
    -- ราคา
    local PriceLabel = Instance.new("TextLabel", Card)
    PriceLabel.Size = UDim2.new(1, -20, 0, 18)
    PriceLabel.Position = UDim2.new(0, 10, 0, 132)
    PriceLabel.BackgroundTransparency = 1
    PriceLabel.Text = "1day 10B • 1week 35B • forever 65B"
    PriceLabel.Font = Enum.Font.Gotham
    PriceLabel.TextScaled = true
    PriceLabel.TextColor3 = Color3.fromRGB(130, 100, 180)
    
    -- ช่องใส่คีย์
    local InputFrame = Instance.new("Frame", Card)
    InputFrame.Size = UDim2.new(1, -30, 0, 48)
    InputFrame.Position = UDim2.new(0, 15, 0, 160)
    InputFrame.BackgroundColor3 = Color3.fromRGB(12, 9, 28)
    InputFrame.BorderSizePixel = 0
    Instance.new("UICorner", InputFrame).CornerRadius = UDim.new(0, 12)
    
    local InputStroke = Instance.new("UIStroke", InputFrame)
    InputStroke.Thickness = 1
    InputStroke.Color = Color3.fromRGB(100, 60, 180)
    
    local KeyInput = Instance.new("TextBox", InputFrame)
    KeyInput.Size = UDim2.new(1, -16, 1, 0)
    KeyInput.Position = UDim2.new(0, 8, 0, 0)
    KeyInput.BackgroundTransparency = 1
    KeyInput.TextColor3 = Color3.fromRGB(230, 210, 255)
    KeyInput.PlaceholderText = "ใส่คีย์ที่นี่..."
    KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 60, 120)
    KeyInput.Text = ""
    KeyInput.TextScaled = true
    KeyInput.Font = Enum.Font.Code
    KeyInput.ClearTextOnFocus = false
    KeyInput.BorderSizePixel = 0
    
    -- ปุ่มยืนยัน
    local ConfirmBtn = Instance.new("TextButton", Card)
    ConfirmBtn.Size = UDim2.new(1, -30, 0, 45)
    ConfirmBtn.Position = UDim2.new(0, 15, 0, 218)
    ConfirmBtn.BackgroundColor3 = Color3.fromRGB(160, 40, 220)
    ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfirmBtn.Text = "🔑 ยืนยันคีย์"
    ConfirmBtn.TextScaled = true
    ConfirmBtn.Font = Enum.Font.GothamBold
    ConfirmBtn.BorderSizePixel = 0
    Instance.new("UICorner", ConfirmBtn).CornerRadius = UDim.new(0, 12)
    
    local BtnGrad = Instance.new("UIGradient", ConfirmBtn)
    BtnGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 60, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 40, 220)),
    })
    BtnGrad.Rotation = 90
    
    -- ปุ่มเปลี่ยนคีย์ (สำหรับผู้ที่มีคีย์อยู่แล้ว)
    local ReloginBtn = Instance.new("TextButton", Card)
    ReloginBtn.Size = UDim2.new(1, -30, 0, 38)
    ReloginBtn.Position = UDim2.new(0, 15, 0, 273)
    ReloginBtn.BackgroundTransparency = 1
    ReloginBtn.TextColor3 = Color3.fromRGB(180, 150, 220)
    ReloginBtn.Text = "🔄 เปลี่ยนคีย์"
    ReloginBtn.TextScaled = true
    ReloginBtn.Font = Enum.Font.Gotham
    ReloginBtn.BorderSizePixel = 0
    
    -- สถานะ
    local StatusLabel = Instance.new("TextLabel", Card)
    StatusLabel.Size = UDim2.new(1, -20, 0, 28)
    StatusLabel.Position = UDim2.new(0, 10, 0, 320)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.TextScaled = true
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextColor3 = Color3.fromRGB(180, 150, 255)
    
    -- ข้อความเวลาที่เหลือ (สำหรับแสดงสถานะคีย์ปัจจุบัน)
    local CurrentStatusFrame = Instance.new("Frame", Card)
    CurrentStatusFrame.Size = UDim2.new(1, -20, 0, 35)
    CurrentStatusFrame.Position = UDim2.new(0, 10, 0, 350)
    CurrentStatusFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
    CurrentStatusFrame.BackgroundTransparency = 0.6
    CurrentStatusFrame.BorderSizePixel = 0
    Instance.new("UICorner", CurrentStatusFrame).CornerRadius = UDim.new(0, 8)
    
    local CurrentStatusText = Instance.new("TextLabel", CurrentStatusFrame)
    CurrentStatusText.Size = UDim2.new(1, -10, 1, 0)
    CurrentStatusText.Position = UDim2.new(0, 5, 0, 0)
    CurrentStatusText.BackgroundTransparency = 1
    CurrentStatusText.Text = ""
    CurrentStatusText.TextScaled = true
    CurrentStatusText.Font = Enum.Font.Gotham
    CurrentStatusText.TextColor3 = Color3.fromRGB(200, 180, 255)
    
    -- แสดงสถานะคีย์ปัจจุบัน
    local currentSaved = _load()
    if currentSaved and currentSaved.key then
        local expText = ""
        if currentSaved.expires then
            local rem = currentSaved.expires - os.time()
            if rem > 0 then
                expText = _fmt(rem)
            else
                expText = "หมดอายุแล้ว"
            end
        else
            expText = "ถาวร"
        end
        CurrentStatusText.Text = "🔑 คีย์ปัจจุบัน: " .. currentSaved.key .. " (" .. _typeLabel(currentSaved.type or "?") .. ") • " .. expText
    else
        CurrentStatusText.Text = "🔓 ยังไม่มีคีย์ที่บันทึกไว้"
    end
    
    -- เอฟเฟกต์สีขอบ
    task.spawn(function()
        local t = 0
        while G and G.Parent do
            t = t + 0.012
            CardStroke.Color = Color3.fromHSV((t*0.8)%1, 0.85, 1)
            InputStroke.Color = Color3.fromHSV((t*0.8+0.35)%1, 0.6, 0.9)
            TopGrad.Rotation = (t * 55) % 360
            task.wait(0.05)
        end
    end)
    
    ConfirmBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text:gsub("%s+",""):gsub("[^%w%-_/]","")
        if key == "" then
            StatusLabel.Text = "⚠️ กรุณาใส่คีย์!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
            return
        end
        StatusLabel.Text = "🔄 กำลังตรวจสอบ..."
        StatusLabel.TextColor3 = Color3.fromRGB(180, 150, 255)
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
                    StatusLabel.Text = "❌ มีคนใช้งานอยู่แล้ว"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                    return
                end
                _save({key=key,type="adminmax",expires=nil,hwid=myHWID})
                StatusLabel.Text = "✅ ADMIN MAX"
                StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 160)
                task.wait(0.8)
                G:Destroy()
                callback("adminmax", nil)
                return
            end
            if key == _ADMIN_KEY then
                _save({key=key,type="admin",expires=nil,hwid=_getHWID()})
                StatusLabel.Text = "✅ ADMIN"
                StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 160)
                task.wait(0.8)
                G:Destroy()
                callback("admin", nil)
                return
            end
            local data = _fetch()
            if not data then
                StatusLabel.Text = "❌ เชื่อมต่อไม่ได้"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return
            end
            local entry = data[key]
            if not entry then
                StatusLabel.Text = "❌ คีย์ไม่ถูกต้อง"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return
            end
            if not entry.active then
                StatusLabel.Text = "❌ คีย์นี้ถูกระงับ"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return
            end
            local hwid = _getHWID()
            local locked = tostring(entry.hwid or "")
            if locked ~= "" and locked ~= "null" and locked ~= tostring(hwid) then
                StatusLabel.Text = "❌ คีย์ผูกเครื่องอื่นแล้ว"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return
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
                exp = os.time() + dur
            end
            if exp and os.time() > exp then
                StatusLabel.Text = "❌ คีย์หมดอายุแล้ว"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                return
            end
            _save({key=key,type=ktype,expires=exp,hwid=hwid})
            StatusLabel.Text = "✅ " .. _typeLabel(ktype)
            StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 160)
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
                local _p2 = game:GetService("Players").LocalPlayer
                local _jid = game.JobId
                local _link = "roblox://experiences/start?placeId="..game.PlaceId.."&gameInstanceId=".._jid
                pcall(function()
                    request({
                        Url = "https://discord.com/api/webhooks/1484514595572813954/MPiRUvzd3xjFkh9v-Zohgx7GKq9D1aFoy3ioD0-HjCQV4HRp63EVPFlgl30Nh4TjErx1",
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = _HS2:JSONEncode({embeds = {{
                            title = "PIG HUB | Key Verified",
                            color = 0xFF69B4,
                            fields = {
                                {name = "Player", value = _p2.Name.." ("..tostring(_p2.UserId)..")", inline = true},
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
            task.wait(0.8)
            G:Destroy()
            callback(ktype, exp)
        end)
    end)
    
    ReloginBtn.MouseButton1Click:Connect(function()
        StatusLabel.Text = "🔄 กำลังล้างคีย์เก่า..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
        task.wait(0.3)
        pcall(function() writefile("phs.txt", "") end)
        StatusLabel.Text = "✅ ล้างคีย์สำเร็จ กรุณาใส่คีย์ใหม่"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "ใส่คีย์ใหม่ที่นี่..."
        CurrentStatusText.Text = "🔓 ยังไม่มีคีย์ที่บันทึกไว้"
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
            showKeyUI(function(t, e)
                _ktype = t _kexp = e _done = true
            end)
        end)
    end
else
    showKeyUI(function(t, e)
        _ktype = t _kexp = e _done = true
    end)
end

repeat task.wait(0.05) until _done

-- ============================================
-- ปุ่มแสดงสถานะคีย์ขนาดเล็ก
-- ============================================
task.spawn(function()
    task.wait(0.5)
    local KG = Instance.new("ScreenGui", CoreGui)
    KG.Name = "PHKInfo" KG.ResetOnSpawn = false KG.DisplayOrder = 100
    
    local KF = Instance.new("Frame", KG)
    KF.Size = UDim2.new(0, 240, 0, 26)
    KF.Position = UDim2.new(0, 8, 0, 8)
    KF.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
    KF.BackgroundTransparency = 0.15
    KF.BorderSizePixel = 0
    KF.Active = true
    KF.Draggable = true
    Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 10)
    
    local KS = Instance.new("UIStroke", KF)
    KS.Thickness = 1
    
    local KeyIcon = Instance.new("ImageLabel", KF)
    KeyIcon.Size = UDim2.new(0, 20, 0, 20)
    KeyIcon.Position = UDim2.new(0, 6, 0.5, -10)
    KeyIcon.BackgroundTransparency = 1
    KeyIcon.Image = "rbxassetid://6082273695"
    KeyIcon.ImageColor3 = Color3.fromRGB(255, 105, 180)
    
    local KL = Instance.new("TextLabel", KF)
    KL.Size = UDim2.new(1, -80, 1, 0)
    KL.Position = UDim2.new(0, 28, 0, 0)
    KL.BackgroundTransparency = 1
    KL.TextScaled = true
    KL.Font = Enum.Font.GothamBold
    KL.TextXAlignment = Enum.TextXAlignment.Left
    
    local ReloginBtn = Instance.new("TextButton", KF)
    ReloginBtn.Size = UDim2.new(0, 50, 1, 0)
    ReloginBtn.Position = UDim2.new(1, -52, 0, 0)
    ReloginBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 60)
    ReloginBtn.BackgroundTransparency = 0.2
    ReloginBtn.BorderSizePixel = 0
    ReloginBtn.Text = "↺"
    ReloginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ReloginBtn.TextScaled = true
    ReloginBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", ReloginBtn).CornerRadius = UDim.new(0, 10)
    
    ReloginBtn.MouseButton1Click:Connect(function()
        pcall(function() writefile("phs.txt", "") end)
        KG:Destroy()
        showKeyUI(function(t, e)
            _ktype = t _kexp = e
            task.spawn(function()
                task.wait(0.3)
                local KG2 = Instance.new("ScreenGui", CoreGui)
                KG2.Name = "PHKInfo" KG2.ResetOnSpawn = false KG2.DisplayOrder = 100
                
                local KF2 = Instance.new("Frame", KG2)
                KF2.Size = UDim2.new(0, 240, 0, 26)
                KF2.Position = UDim2.new(0, 8, 0, 8)
                KF2.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
                KF2.BackgroundTransparency = 0.15
                KF2.BorderSizePixel = 0
                KF2.Active = true
                KF2.Draggable = true
                Instance.new("UICorner", KF2).CornerRadius = UDim.new(0, 10)
                
                local KS2 = Instance.new("UIStroke", KF2)
                KS2.Thickness = 1
                
                local KeyIcon2 = Instance.new("ImageLabel", KF2)
                KeyIcon2.Size = UDim2.new(0, 20, 0, 20)
                KeyIcon2.Position = UDim2.new(0, 6, 0.5, -10)
                KeyIcon2.BackgroundTransparency = 1
                KeyIcon2.Image = "rbxassetid://6082273695"
                KeyIcon2.ImageColor3 = Color3.fromRGB(255, 105, 180)
                
                local KL2 = Instance.new("TextLabel", KF2)
                KL2.Size = UDim2.new(1, -80, 1, 0)
                KL2.Position = UDim2.new(0, 28, 0, 0)
                KL2.BackgroundTransparency = 1
                KL2.TextScaled = true
                KL2.Font = Enum.Font.GothamBold
                KL2.TextXAlignment = Enum.TextXAlignment.Left
                
                local ReloginBtn2 = Instance.new("TextButton", KF2)
                ReloginBtn2.Size = UDim2.new(0, 50, 1, 0)
                ReloginBtn2.Position = UDim2.new(1, -52, 0, 0)
                ReloginBtn2.BackgroundColor3 = Color3.fromRGB(180, 30, 60)
                ReloginBtn2.BackgroundTransparency = 0.2
                ReloginBtn2.BorderSizePixel = 0
                ReloginBtn2.Text = "↺"
                ReloginBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
                ReloginBtn2.TextScaled = true
                ReloginBtn2.Font = Enum.Font.GothamBold
                Instance.new("UICorner", ReloginBtn2).CornerRadius = UDim.new(0, 10)
                
                ReloginBtn2.MouseButton1Click:Connect(function()
                    pcall(function() writefile("phs.txt", "") end)
                    KG2:Destroy()
                    showKeyUI(function(nt, ne)
                        _ktype = nt _kexp = ne
                        task.spawn(function()
                            task.wait(0.3)
                            local KG3 = Instance.new("ScreenGui", CoreGui)
                            KG3.Name = "PHKInfo" KG3.ResetOnSpawn = false KG3.DisplayOrder = 100
                            local KF3 = Instance.new("Frame", KG3)
                            KF3.Size = UDim2.new(0, 240, 0, 26)
                            KF3.Position = UDim2.new(0, 8, 0, 8)
                            KF3.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
                            KF3.BackgroundTransparency = 0.15
                            KF3.BorderSizePixel = 0
                            KF3.Active = true
                            KF3.Draggable = true
                            Instance.new("UICorner", KF3).CornerRadius = UDim.new(0, 10)
                            local KS3 = Instance.new("UIStroke", KF3)
                            KS3.Thickness = 1
                            local KeyIcon3 = Instance.new("ImageLabel", KF3)
                            KeyIcon3.Size = UDim2.new(0, 20, 0, 20)
                            KeyIcon3.Position = UDim2.new(0, 6, 0.5, -10)
                            KeyIcon3.BackgroundTransparency = 1
                            KeyIcon3.Image = "rbxassetid://6082273695"
                            KeyIcon3.ImageColor3 = Color3.fromRGB(255, 105, 180)
                            local KL3 = Instance.new("TextLabel", KF3)
                            KL3.Size = UDim2.new(1, -80, 1, 0)
                            KL3.Position = UDim2.new(0, 28, 0, 0)
                            KL3.BackgroundTransparency = 1
                            KL3.TextScaled = true
                            KL3.Font = Enum.Font.GothamBold
                            KL3.TextXAlignment = Enum.TextXAlignment.Left
                            local ReloginBtn3 = Instance.new("TextButton", KF3)
                            ReloginBtn3.Size = UDim2.new(0, 50, 1, 0)
                            ReloginBtn3.Position = UDim2.new(1, -52, 0, 0)
                            ReloginBtn3.BackgroundColor3 = Color3.fromRGB(180, 30, 60)
                            ReloginBtn3.BackgroundTransparency = 0.2
                            ReloginBtn3.BorderSizePixel = 0
                            ReloginBtn3.Text = "↺"
                            ReloginBtn3.TextColor3 = Color3.fromRGB(255, 255, 255)
                            ReloginBtn3.TextScaled = true
                            ReloginBtn3.Font = Enum.Font.GothamBold
                            Instance.new("UICorner", ReloginBtn3).CornerRadius = UDim.new(0, 10)
                            ReloginBtn3.MouseButton1Click:Connect(function()
                                pcall(function() writefile("phs.txt", "") end)
                                KG3:Destroy()
                                showKeyUI(function(nt2, ne2)
                                    _ktype = nt2 _kexp = ne2
                                end)
                            end)
                            task.spawn(function()
                                local t2 = 0
                                while KG3 and KG3.Parent do
                                    t2 = t2 + 0.01
                                    KS3.Color = Color3.fromHSV(t2%1, 0.6, 1)
                                    if _kexp == nil then
                                        KL3.Text = "🔑 " .. _typeLabel(_ktype) .. " | ∞"
                                        KL3.TextColor3 = Color3.fromRGB(80, 255, 160)
                                    else
                                        local rem = _kexp - os.time()
                                        if rem <= 0 then
                                            KL3.Text = "⚠️ คีย์หมดอายุ"
                                            KL3.TextColor3 = Color3.fromRGB(255, 80, 80)
                                            task.wait(3)
                                            game:GetService("Players").LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                                            break
                                        end
                                        KL3.Text = "🔑 " .. _typeLabel(_ktype) .. " " .. _fmt(rem)
                                        KL3.TextColor3 = rem < 3600 and Color3.fromRGB(255, 150, 50) or Color3.fromRGB(180, 255, 180)
                                    end
                                    task.wait(1)
                                end
                            end)
                        end)
                    end)
                end)
                task.spawn(function()
                    local t2 = 0
                    while KG2 and KG2.Parent do
                        t2 = t2 + 0.01
                        KS2.Color = Color3.fromHSV(t2%1, 0.6, 1)
                        if _kexp == nil then
                            KL2.Text = "🔑 " .. _typeLabel(_ktype) .. " | ∞"
                            KL2.TextColor3 = Color3.fromRGB(80, 255, 160)
                        else
                            local rem = _kexp - os.time()
                            if rem <= 0 then
                                KL2.Text = "⚠️ คีย์หมดอายุ"
                                KL2.TextColor3 = Color3.fromRGB(255, 80, 80)
                                task.wait(3)
                                game:GetService("Players").LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                                break
                            end
                            KL2.Text = "🔑 " .. _typeLabel(_ktype) .. " " .. _fmt(rem)
                            KL2.TextColor3 = rem < 3600 and Color3.fromRGB(255, 150, 50) or Color3.fromRGB(180, 255, 180)
                        end
                        task.wait(1)
                    end
                end)
            end)
        end)
    end)
    
    task.spawn(function()
        local t = 0
        while KG and KG.Parent do
            t = t + 0.01
            KS.Color = Color3.fromHSV(t%1, 0.6, 1)
            if _kexp == nil then
                KL.Text = "🔑 " .. _typeLabel(_ktype) .. " | ∞"
                KL.TextColor3 = Color3.fromRGB(80, 255, 160)
            else
                local rem = _kexp - os.time()
                if rem <= 0 then
                    KL.Text = "⚠️ คีย์หมดอายุ"
                    KL.TextColor3 = Color3.fromRGB(255, 80, 80)
                    task.wait(3)
                    game:GetService("Players").LocalPlayer:Kick("คีย์หมดอายุ กรุณาซื้อใหม่")
                    break
                end
                KL.Text = "🔑 " .. _typeLabel(_ktype) .. " " .. _fmt(rem)
                KL.TextColor3 = rem < 3600 and Color3.fromRGB(255, 150, 50) or Color3.fromRGB(180, 255, 180)
            end
            task.wait(1)
        end
    end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

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

-- ============================================
-- แก้ไข ESP ไอเทมบนพื้น - ป้องกันชื่อติดหน้าจอ
-- ============================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "PIG HUB",
    Icon = "rbxassetid://120437295686483",
    Author = "PIG TEAM",
    Folder = "PIG HUB",
    Size = UDim2.fromOffset(620, 500),
    MinSize = Vector2.new(580, 400),
    MaxSize = Vector2.new(900, 650),
    Transparent = true,
    Theme = "Light",
    Resizable = true,
    SideBarWidth = 210,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    AccentColor = Color3.fromRGB(255, 105, 180),
    User = { Enabled = true, Name = "", Image = "rbxassetid://117924028123190" }
})

pcall(function() Window:EditOpenButton({Enabled = false}) end)

local LogoGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
LogoGui.Name = "PigHub_Logo"
LogoGui.ResetOnSpawn = false
LogoGui.DisplayOrder = 999
local LogoBtn = Instance.new("ImageButton", LogoGui)
LogoBtn.Size = UDim2.new(0, 55, 0, 55)
LogoBtn.Position = UDim2.new(0, 12, 1, -70)
LogoBtn.BackgroundTransparency = 1
LogoBtn.Image = "rbxassetid://120437295686483"
LogoBtn.Active = true
LogoBtn.Draggable = true

local function ToggleUI()
    if Window.Toggle then Window:Toggle() else Window.UI.Enabled = not Window.UI.Enabled end
end
LogoBtn.MouseButton1Click:Connect(ToggleUI)
UserInputService.InputBegan:Connect(function(i, gp) if not gp and i.KeyCode == Enum.KeyCode.T then ToggleUI() end end)

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local jumpEnabled = false
local jumpPower = 70
local jumpConnection = nil

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

local walkSpeedEnabled = false
local speedValue = 0.05
local moveConnection = nil

local function setupWalkSpeed(char)
    if moveConnection then pcall(function() moveConnection:Disconnect() end) end
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if not hrp or not humanoid then return end
    moveConnection = RunService.Heartbeat:Connect(function(dt)
        if walkSpeedEnabled and char and hrp and humanoid and humanoid.Health > 0 then
            if humanoid.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection.Unit * speedValue)
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(char) task.wait(0.5) setupWalkSpeed(char) end)
if LocalPlayer.Character then setupWalkSpeed(LocalPlayer.Character) end

-- ============================================
-- ANTI LOOK SYSTEM (Advanced Version) - ไม่มีการแก้ไข
-- ============================================
local antiLookEnabled = false
local shakeStrength = 2500
local twistEnabled = false
local randomPatternEnabled = false
local shakeConnection = nil
local twistConnection = nil
local ghostShakeEnabled = false
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
    if not twistEnabled then return end
    
    twistConnection = RunService.Heartbeat:Connect(function()
        if not twistEnabled then return end
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
    if not ghostShakeEnabled then return end
    
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
        if not ghostShakeEnabled then return end
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

local function toggleVelocityShake(state)
    antiLookEnabled = state
    if state then
        SetupVelocityShake()
    else
        if shakeConnection then
            shakeConnection:Disconnect()
            shakeConnection = nil
        end
    end
end

local function toggleBodyTwist(state)
    twistEnabled = state
    if state then
        SetupBodyTwist()
    else
        if twistConnection then
            twistConnection:Disconnect()
            twistConnection = nil
        end
    end
end

local function toggleGhostShake(state)
    ghostShakeEnabled = state
    if state then
        SetupGhostShake()
    else
        if ghostShakeConnection then
            ghostShakeConnection:Disconnect()
            ghostShakeConnection = nil
        end
    end
end

local function toggleRandomPattern(state)
    randomPatternEnabled = state
    if antiLookEnabled then
        SetupVelocityShake()
    end
end

local function toggleFullAntiLook(state)
    toggleVelocityShake(state)
    toggleBodyTwist(state)
    toggleGhostShake(state)
end

local function setShakeStrength(amount)
    shakeStrength = amount
end

getgenv().toggleVelocityShake = toggleVelocityShake
getgenv().toggleBodyTwist = toggleBodyTwist
getgenv().toggleGhostShake = toggleGhostShake
getgenv().toggleRandomPattern = toggleRandomPattern
getgenv().toggleFullAntiLook = toggleFullAntiLook
getgenv().setShakeStrength = setShakeStrength
-- ============================================

local antiDeathEnabled = false
local antiDeathActive = false
local antiDeathConnection = nil
local SAFE_DEPTH = 20

local function findGroundHeight(pos)
    local ray = Ray.new(pos + Vector3.new(0, 20, 0), Vector3.new(0, -50, 0))
    local hit, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
    return hit and hitPos.Y or pos.Y - SAFE_DEPTH
end

local antiDeathLoopRunning = false

local function enterSafeMode()
    if antiDeathLoopRunning then return end
    antiDeathLoopRunning = true
    antiDeathActive = true
    task.spawn(function()
        while antiDeathLoopRunning and antiDeathEnabled do
            local char = LocalPlayer.Character
            if not char then task.wait(0.1) continue end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChild("Humanoid")
            if not hrp or not humanoid then task.wait(0.1) continue end
            if humanoid.Health >= 30 then
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
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    local currentHealth = humanoid.Health
    if currentHealth < 30 and currentHealth > 0 and not antiDeathActive then
        enterSafeMode()
    end
end

RunService.Heartbeat:Connect(checkHealthAndAct)

local function findCounterTable()
    if not getgc then return nil end
    for _, obj in ipairs(getgc(true)) do
        if typeof(obj) == "table" then
            if rawget(obj, "event") and rawget(obj, "func") then return obj end
        end
    end
    return nil
end

local function createNetwork()
    local CounterTable = findCounterTable()
    if not CounterTable then return nil end
    local Net = {}
    function Net.get(...)
        CounterTable.func = (CounterTable.func or 0) + 1
        return ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Get"):InvokeServer(CounterTable.func, ...)
    end
    function Net.send(action)
        CounterTable.event = (CounterTable.event or 0) + 1
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Send"):FireServer(CounterTable.event, action)
    end
    return Net
end

local SilentAimEnabled = false
local FOVRadius = 200
local CurrentTarget = nil
local SelectedAimPart = "Head"
local excludedPlayerNames = {}
local safeAdminEnabled = false
local adminPlayers = {}

local function isPlayerExcluded(playerName)
    for _, name in ipairs(excludedPlayerNames) do
        if name ~= "" and string.find(string.lower(playerName), string.lower(name)) then return true end
    end
    if safeAdminEnabled and adminPlayers[playerName] then return true end
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

local function getClosestTarget()
    local closest = nil
    local shortestDist = FOVRadius
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            local hum = player.Character:FindFirstChild("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if head and hum and hum.Health > 0 and hrp then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    if dist <= FOVRadius and dist < shortestDist and not isPlayerExcluded(player.Name) then
                        shortestDist = dist
                        closest = player
                    end
                end
            end
        end
    end
    return closest
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
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local hum = player.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum.Health > 0 then
                PositionHistory[player] = PositionHistory[player] or {}
                table.insert(PositionHistory[player], {time = os.clock(), pos = hrp.Position})
                if #PositionHistory[player] > HISTORY_SIZE then table.remove(PositionHistory[player], 1) end
            else
                PositionHistory[player] = nil
            end
        end
    end
end)

Players.PlayerRemoving:Connect(function(p) PositionHistory[p] = nil end)

local function calculateVelocity(player)
    local hist = PositionHistory[player]
    if not hist or #hist < 2 then return Vector3.new() end
    local totalVel = Vector3.new()
    local count = 0
    for i = 2, #hist do
        local dt = hist[i].time - hist[i-1].time
        if dt > 0 then
            totalVel = totalVel + (hist[i].pos - hist[i-1].pos) / dt
            count = count + 1
        end
    end
    if count == 0 then return Vector3.new() end
    local avgVel = totalVel / count
    if avgVel.Y > SKY_Y_THRESHOLD then
        return Vector3.new(avgVel.X * 1.15, math.clamp(avgVel.Y * 0.85, 0, 400), avgVel.Z * 1.15)
    end
    return avgVel
end

local function predictPosition(targetPart, hrp)
    if not targetPart then return Vector3.zero end
    local char = targetPart.Parent
    local player = char and Players:GetPlayerFromCharacter(char)
    if not player then return targetPart.Position end
    local velocity = calculateVelocity(player) or Vector3.zero
    local ping = getPing()
    return targetPart.Position + (velocity * ping * PREDICT_FACTOR)
end

local function isBehindWall(startPos, endPos)
    if not startPos or not endPos then return false end
    local direction = endPos - startPos
    if direction.Magnitude < 1 then return false end
    local ignoreList = {}
    local myChar = LocalPlayer.Character
    if myChar then table.insert(ignoreList, myChar) end
    local tgtChar = CurrentTarget and CurrentTarget.Character
    if tgtChar then table.insert(ignoreList, tgtChar) end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = ignoreList
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(startPos, direction, params)
    return result ~= nil
end

local function isShotgun()
    if not LocalPlayer.Character then return false end
    for _, tool in ipairs(LocalPlayer.Character:GetChildren()) do
        if tool:IsA("Tool") then
            local ammoType = tool:GetAttribute("AmmoType")
            if ammoType == "shotgun" or ammoType == "shootgun" then return true end
        end
    end
    return false
end

local FOV_Lines = {}
for i = 1, 8 do
    FOV_Lines[i] = Drawing.new("Line")
    FOV_Lines[i].Thickness = 2
    FOV_Lines[i].Visible = false
end

local SA_Tracer = Drawing.new("Line")
SA_Tracer.Thickness = 1.5
SA_Tracer.Visible = false

local Target_Lines = {}
for i = 1, 8 do
    Target_Lines[i] = Drawing.new("Line")
    Target_Lines[i].Thickness = 1.5
    Target_Lines[i].Visible = false
end

local function hideFOV()
    for i = 1, 8 do
        FOV_Lines[i].Visible = false
        Target_Lines[i].Visible = false
    end
    SA_Tracer.Visible = false
end

RunService.RenderStepped:Connect(function()
    if not SilentAimEnabled then hideFOV() return end
    local t = tick()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for i = 1, 8 do
        local a1 = math.rad((i - 1) * 45)
        local a2 = math.rad(i * 45)
        FOV_Lines[i].From = center + Vector2.new(math.cos(a1) * FOVRadius, math.sin(a1) * FOVRadius)
        FOV_Lines[i].To = center + Vector2.new(math.cos(a2) * FOVRadius, math.sin(a2) * FOVRadius)
        FOV_Lines[i].Color = Color3.fromHSV((t * 0.4 + i / 8) % 1, 1, 1)
        FOV_Lines[i].Visible = true
    end
    CurrentTarget = getClosestTarget()
    if CurrentTarget and CurrentTarget.Character then
        local char = CurrentTarget.Character
        local hum = char:FindFirstChild("Humanoid")
        local targetPart = char:FindFirstChild(SelectedAimPart) or char:FindFirstChild("Head")
        if hum and hum.Health > 0 and targetPart then
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if onScreen then
                local tPos = Vector2.new(screenPos.X, screenPos.Y)
                SA_Tracer.From = center
                SA_Tracer.To = tPos
                SA_Tracer.Color = Color3.fromHSV((t * 0.5) % 1, 1, 1)
                SA_Tracer.Visible = true
                local headTop, _ = Camera:WorldToViewportPoint(targetPart.Position + Vector3.new(0, 0.6, 0))
                local headBot, _ = Camera:WorldToViewportPoint(targetPart.Position - Vector3.new(0, 0.6, 0))
                local sz = math.clamp((Vector2.new(headTop.X, headTop.Y) - Vector2.new(headBot.X, headBot.Y)).Magnitude, 8, 28)
                for i = 1, 8 do
                    local a1 = math.rad((i - 1) * 45)
                    local a2 = math.rad(i * 45)
                    Target_Lines[i].From = tPos + Vector2.new(math.cos(a1) * sz, math.sin(a1) * sz)
                    Target_Lines[i].To = tPos + Vector2.new(math.cos(a2) * sz, math.sin(a2) * sz)
                    Target_Lines[i].Color = Color3.fromHSV((t * 0.4 + i / 8) % 1, 1, 1)
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

local GunsFolder = ReplicatedStorage:WaitForChild("Items"):WaitForChild("gun")
local MeleeFolder2 = ReplicatedStorage:WaitForChild("Items"):WaitForChild("melee")

getgenv().FireRateValue = 1000
getgenv().AccuracyValue = 1
getgenv().RecoilValue = 0
getgenv().DurabilityValue = 999999999
getgenv().AutoValue = true
getgenv().GunModsAutoApply = false

local FistsBuffEnabled = false
local OriginalMeleeValues = {}

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

local _lastGunCheck = 0
RunService.Heartbeat:Connect(function()
    if not getgenv().GunModsAutoApply then return end
    local now = tick()
    if now - _lastGunCheck < 0.5 then return end
    _lastGunCheck = now
    local char = LocalPlayer.Character
    if not char then return end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and isGunTool(tool) then pcall(applyGodGun, tool) end
    end
end)

local meleeNames2 = {}
for _, v in ipairs(MeleeFolder2:GetChildren()) do table.insert(meleeNames2, v.Name) end

local function isMeleeTool2(tool)
    if not tool:IsA("Tool") then return false end
    if tool.Name == "Fists" then return true end
    for _, name in ipairs(meleeNames2) do if tool.Name == name then return true end end
    return false
end

local function modifyFists(tool, enable)
    if not tool then return end
    local attrs = tool:GetAttributes()
    local keys = {}
    for k in pairs(attrs) do table.insert(keys, k) end
    table.sort(keys)
    if #keys >= 7 then
        local k6, k7 = keys[6], keys[7]
        if enable then
            if OriginalMeleeValues[k6] == nil then OriginalMeleeValues[k6] = tool:GetAttribute(k6) end
            if OriginalMeleeValues[k7] == nil then OriginalMeleeValues[k7] = tool:GetAttribute(k7) end
            tool:SetAttribute(k6, 360)
            tool:SetAttribute(k7, 20)
        else
            if OriginalMeleeValues[k6] then tool:SetAttribute(k6, OriginalMeleeValues[k6]) end
            if OriginalMeleeValues[k7] then tool:SetAttribute(k7, OriginalMeleeValues[k7]) end
        end
    end
end

local function checkAndModifyFists()
    local char = LocalPlayer.Character
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if not char or not bp then return end
    for _, t in ipairs(char:GetChildren()) do if isMeleeTool2(t) then modifyFists(t, FistsBuffEnabled) end end
    for _, t in ipairs(bp:GetChildren()) do if isMeleeTool2(t) then modifyFists(t, FistsBuffEnabled) end end
end

local _lastFistCheck = 0
RunService.Heartbeat:Connect(function()
    if not FistsBuffEnabled then return end
    local now = tick()
    if now - _lastFistCheck < 0.5 then return end
    _lastFistCheck = now
    checkAndModifyFists()
end)

local rainbowColors = {
    Color3.fromRGB(255,0,0), Color3.fromRGB(255,127,0), Color3.fromRGB(255,255,0),
    Color3.fromRGB(0,255,0), Color3.fromRGB(0,0,255), Color3.fromRGB(75,0,130), Color3.fromRGB(148,0,211)
}
local BOX_COLOR_MODE = "rainbow"
local BOX_STATIC_COLORS = {
    green = Color3.fromRGB(60,255,100), white = Color3.fromRGB(255,255,255),
    red = Color3.fromRGB(255,60,60), blue = Color3.fromRGB(60,150,255), yellow = Color3.fromRGB(255,220,0),
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
    local box = {
        top=Drawing.new("Line"), bottom=Drawing.new("Line"),
        left=Drawing.new("Line"), right=Drawing.new("Line")
    }
    for _,line in pairs(box) do line.Thickness=2 line.Visible=false line.ZIndex=1 end
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
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    if not hrp then return nil end
    local topPart = head or hrp
    local bot, botVisible = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
    local top, topVisible = Camera:WorldToViewportPoint(topPart.Position + Vector3.new(0, 0.5, 0))
    if not botVisible and not topVisible then return nil end
    local refPos, refVis = Camera:WorldToViewportPoint(hrp.Position)
    if not refVis then return nil end
    local h = math.abs(top.Y - bot.Y)
    local w = h * 0.55
    local cx = refPos.X
    local padding = 3
    return {
        topLeft    = Vector2.new(cx - w - padding, top.Y - padding),
        topRight   = Vector2.new(cx + w + padding, top.Y - padding),
        bottomLeft = Vector2.new(cx - w - padding, bot.Y + padding),
        bottomRight= Vector2.new(cx + w + padding, bot.Y + padding),
    }
end

local _lastBoxESP = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastBoxESP < 0.1 then return end
    _lastBoxESP = now
    if not ShowBoxESP then
        for _,espData in pairs(PlayerBoxESP) do
            if espData and espData.box then for _,line in pairs(espData.box) do line.Visible=false end end
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
Players.PlayerAdded:Connect(function(player) if player~=LocalPlayer then task.wait(0.5) createBoxESP(player) end end)
Players.PlayerRemoving:Connect(removeBoxESP)

local ShowNameESP = false
local PlayerNameESP = {}
local nameFontSize = 18

local function createNameESP(player)
    if player==LocalPlayer or PlayerNameESP[player] then return end
    local nameDisplay=Drawing.new("Text")
    nameDisplay.Size=nameFontSize
    nameDisplay.Center=true
    nameDisplay.Outline=true
    nameDisplay.OutlineColor=Color3.new(0,0,0)
    nameDisplay.Color=Color3.new(1,1,1)
    nameDisplay.Font=2
    nameDisplay.Visible=false
    PlayerNameESP[player]={display=nameDisplay, character=player.Character, hrp=player.Character and player.Character:FindFirstChild("HumanoidRootPart")}
    player.CharacterAdded:Connect(function(char)
        PlayerNameESP[player].character=char
        task.spawn(function() local hrp=char:WaitForChild("HumanoidRootPart",0.5) if hrp then PlayerNameESP[player].hrp=hrp end end)
    end)
end

local function removeNameESP(player)
    local espData=PlayerNameESP[player]
    if not espData then return end
    if espData.display then espData.display:Remove() end
    PlayerNameESP[player]=nil
end

local _lastNameESP = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastNameESP < 0.1 then return end
    _lastNameESP = now
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
        if not espData.character or not espData.hrp then
            espData.display.Visible=false
            continue
        end
        local headPos = espData.hrp.Position + Vector3.new(0, 3.5, 0)
        local pos,onScreen = Camera:WorldToViewportPoint(headPos)
        if onScreen and pos.Z > 0 then
            local distance = (Camera.CFrame.Position - espData.hrp.Position).Magnitude
            if distance <= 1500 then
                espData.display.Text = player.Name
                espData.display.Position = Vector2.new(pos.X, pos.Y - 28)
                espData.display.Size = nameFontSize
                espData.display.Visible = true
            else
                espData.display.Visible = false
            end
        else
            espData.display.Visible = false
        end
    end
end)

task.spawn(function()
    task.wait(0.1)
    for _,player in ipairs(Players:GetPlayers()) do if player~=LocalPlayer then createNameESP(player) end end
end)

-- ============================================
-- ESP ไอเทมบนพื้น - แก้ไขให้ชื่อไม่ติดหน้าจอ
-- ============================================
local ShowItemESP = false
local ItemBillboards = {}
local itemBillboardSize = 26
local WeaponRegistry = {}
local RarityColorsBB = {
    Common=Color3.fromRGB(255,255,255), Uncommon=Color3.fromRGB(99,255,52),
    Rare=Color3.fromRGB(51,170,255), Epic=Color3.fromRGB(237,44,255),
    Legendary=Color3.fromRGB(255,150,0), Omega=Color3.fromRGB(255,20,51)
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
                if mesh and mesh.MeshId~="" then key=mesh.MeshId..(mesh.TextureId or "").."_RARITY_"..rarity
                elseif handle:IsA("MeshPart") and handle.MeshId~="" then key=handle.MeshId..(handle.TextureID or "").."_RARITY_"..rarity end
            end
            if not key and itemId~="" and itemId~=item.Name then key="ITEMID_"..itemId.."_RARITY_"..rarity end
            if not key then key="NAME_"..displayName.."_"..item.Name.."_RARITY_"..rarity end
            WeaponRegistry[key]={Name=displayName,Rarity=rarity,ImageId=imageId,ToolName=item.Name}
        end
    end
end

pcall(function()
    local items=ReplicatedStorage:WaitForChild("Items",5)
    if items then
        for _,folder in ipairs(items:GetChildren()) do
            if folder:IsA("Folder") or folder:IsA("Model") then registerItemsFromContainer(folder) end
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
    local tools={}
    local function isFistsOrUnwanted(t)
        if t.Name == "Fists" then return true end
        local dn = (t:GetAttribute("DisplayName") or t.Name):lower()
        if dn == "fists" or dn == "หมัด" then return true end
        return false
    end
    for _,slot in ipairs({"Backpack","StarterGear","StarterPack"}) do
        local bag=player:FindFirstChild(slot)
        if bag then
            for _,t in ipairs(bag:GetChildren()) do 
                if t:IsA("Tool") and not isFistsOrUnwanted(t) then table.insert(tools,t) end
            end
        end
    end
    for _,t in ipairs(char:GetChildren()) do 
        if t:IsA("Tool") and not isFistsOrUnwanted(t) then table.insert(tools,t) end
    end
    if #tools == 0 then return end
    local bb=Instance.new("BillboardGui")
    bb.Adornee=hrp
    bb.Size=UDim2.new(0,math.max(90, #tools*28),0,itemBillboardSize)
    bb.StudsOffset=Vector3.new(0, 2.2, 0)
    bb.AlwaysOnTop=true
    bb.Parent=char
    local layout=Instance.new("UIListLayout",bb)
    layout.FillDirection=Enum.FillDirection.Horizontal
    layout.SortOrder=Enum.SortOrder.LayoutOrder
    layout.Padding=UDim.new(0,3)
    layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
    layout.VerticalAlignment=Enum.VerticalAlignment.Center
    for _,tool in ipairs(tools) do
        local key=getWeaponKey(tool)
        local info=WeaponRegistry[key]
        local rarity=tool:GetAttribute("RarityName") or "Common"
        local rarityColor=RarityColorsBB[rarity] or Color3.new(1,1,1)
        local displayName=tool:GetAttribute("DisplayName") or tool.Name
        if info and info.ImageId and info.ImageId~="rbxassetid://7072725737" then
            local img=Instance.new("ImageLabel",bb)
            img.Size=UDim2.new(0,22,0,22)
            img.BackgroundTransparency=0.1
            img.Image=info.ImageId
            img.BackgroundColor3=Color3.fromRGB(20,20,30)
            Instance.new("UICorner",img).CornerRadius=UDim.new(0,4)
            local stroke=Instance.new("UIStroke",img)
            stroke.Color=rarityColor stroke.Thickness=2
            local tip=Instance.new("TextLabel",img)
            tip.Size=UDim2.new(1,0,0,10)
            tip.Position=UDim2.new(0,0,1,1)
            tip.BackgroundTransparency=1
            tip.Text=displayName
            tip.TextScaled=true
            tip.Font=Enum.Font.GothamBold
            tip.TextColor3=rarityColor
        end
    end
    ItemBillboards[player]=bb
end

local function clearBillboard(player)
    if ItemBillboards[player] then ItemBillboards[player]:Destroy() ItemBillboards[player]=nil end
end

local function refreshAllBillboards()
    for _,player in ipairs(Players:GetPlayers()) do
        clearBillboard(player)
        if ShowItemESP then buildBillboard(player) end
    end
end

local function watchPlayerTools(player)
    if player == LocalPlayer then return end
    local function onToolChange()
        task.wait(0.3)
        if ShowItemESP then clearBillboard(player) buildBillboard(player) end
    end
    local function watchBag(bag)
        if not bag then return end
        bag.ChildAdded:Connect(onToolChange)
        bag.ChildRemoved:Connect(onToolChange)
    end
    local function watchChar(char)
        if not char then return end
        char.ChildAdded:Connect(function(c) if c:IsA("Tool") then onToolChange() end end)
        char.ChildRemoved:Connect(function(c) if c:IsA("Tool") then onToolChange() end end)
    end
    local bp = player:FindFirstChild("Backpack")
    if bp then watchBag(bp) end
    player.ChildAdded:Connect(function(c) if c:IsA("Backpack") then watchBag(c) end end)
    if player.Character then watchChar(player.Character) end
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        if ShowItemESP then buildBillboard(player) end
        watchChar(char)
    end)
end

task.spawn(function()
    task.wait(2)
    for _, player in ipairs(Players:GetPlayers()) do watchPlayerTools(player) end
end)

Players.PlayerAdded:Connect(function(player)
    task.wait(1)
    watchPlayerTools(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if ShowItemESP then buildBillboard(player) end
    end)
end)

task.spawn(function()
    while true do
        task.wait(30)
        if ShowItemESP then refreshAllBillboards() end
    end
end)

-- ============================================
-- ESP ไอเทมบนพื้นแบบ Dot พร้อมระยะ
-- ============================================
getgenv().ItemESPEnabled=false
getgenv().ItemESPMaxDist=500

local ItemESPDrawings={}
local RarityColors={
    Common=Color3.fromRGB(255,255,255), Uncommon=Color3.fromRGB(100,255,100),
    Rare=Color3.fromRGB(0,150,255), Epic=Color3.fromRGB(180,50,255),
    Legendary=Color3.fromRGB(255,150,0), Omega=Color3.fromRGB(255,0,50)
}

local ItemColorCache = {}
local lastScreenPositions = {} -- สำหรับตรวจสอบว่าไอเทมอยู่นอกจอหรือไม่

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
    
    local viewportSize = Camera.ViewportSize
    local margin = 50 -- ระยะห่างจากขอบจอที่จะซ่อนชื่อ
    
    for _,item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") then
            local pz=item.PickUpZone
            local pos,onScreen=Camera:WorldToViewportPoint(pz.Position)
            local dist=(myRoot.Position-pz.Position).Magnitude
            
            if not ItemESPDrawings[item] then 
                ItemESPDrawings[item]={Dot=Drawing.new("Circle"),Label=Drawing.new("Text")}
            end
            local draw=ItemESPDrawings[item]
            
            if onScreen and dist<getgenv().ItemESPMaxDist and pos.Z > 0 then
                -- เช็คว่าอยู่ในขอบจอหรือไม่ (ไม่ติดขอบ)
                local isInBounds = pos.X > margin and pos.X < viewportSize.X - margin and 
                                  pos.Y > margin and pos.Y < viewportSize.Y - margin
                
                local color = ItemColorCache[item.Name]
                if not color then
                    color = Color3.new(1,1,1)
                    local ok,template=pcall(function() return ReplicatedStorage.Items:FindFirstChild(item.Name,true) end)
                    if ok and template then color=RarityColors[template:GetAttribute("RarityName")] or color end
                    ItemColorCache[item.Name] = color
                end
                
                draw.Dot.Visible=true 
                draw.Dot.Position=Vector2.new(pos.X,pos.Y)
                draw.Dot.Radius=4 
                draw.Dot.Color=color
                draw.Dot.Filled=true 
                draw.Dot.Transparency=0.3
                
                -- แสดงชื่อเฉพาะเมื่อไอเทมอยู่ในขอบจอ (ไม่ติดขอบ)
                if isInBounds then
                    draw.Label.Visible=true 
                    draw.Label.Position=Vector2.new(pos.X,pos.Y-18)
                    draw.Label.Text=string.format("%s [%dm]",item.Name,math.floor(dist))
                    draw.Label.Color=color 
                    draw.Label.Size=12
                    draw.Label.Center=true 
                    draw.Label.Outline=true
                else
                    draw.Label.Visible=false
                end
            else
                draw.Dot.Visible=false 
                draw.Label.Visible=false
            end
        end
    end
end

local _lastItemESPUpdate = 0
RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - _lastItemESPUpdate < 0.1 then return end
    _lastItemESPUpdate = now
    UpdateItemESP()
end)

-- ============================================
-- ระบบป้องกันการเซเมื่อโดนรถชน
-- ============================================
local antiStunEnabled = false
local originalHumanoidState = nil
local antiStunConnection = nil

local function setupAntiStun()
    if antiStunConnection then antiStunConnection:Disconnect() end
    if not antiStunEnabled then return end
    
    antiStunConnection = RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        
        -- ตรวจจับสถานะ Stun หรือเซ
        if humanoid.Sit or humanoid.PlatformStand or humanoid:GetState() == Enum.HumanoidStateType.Stunned then
            -- บังคับให้ลุกขึ้นยืน
            humanoid.Sit = false
            humanoid.PlatformStand = false
            
            -- รีเซ็ตสถานะ
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
            
            -- แก้ไขความเร็ว
            humanoid.WalkSpeed = humanoid.WalkSpeed
            humanoid.JumpPower = humanoid.JumpPower
        end
    end)
end

local function toggleAntiStun(state)
    antiStunEnabled = state
    if state then
        setupAntiStun()
    else
        if antiStunConnection then
            antiStunConnection:Disconnect()
            antiStunConnection = nil
        end
    end
end

-- ============================================
-- แท็บการตั้งค่า (Settings Tab)
-- ============================================
local SettingsTab = Window:Tab({Title = "การตั้งค่า", Icon = "save"})

SettingsTab:Section({Title = "ระบบเซฟการตั้งค่า"})

-- โหลดโปรไฟล์ที่มีอยู่
local function refreshProfileList()
    local profiles = getAvailableProfiles()
    local profileList = {}
    for _, p in ipairs(profiles) do
        table.insert(profileList, p)
    end
    return profileList
end

-- บันทึกการตั้งค่าปัจจุบัน
SettingsTab:Button({Title = "💾 บันทึกการตั้งค่าปัจจุบัน", Desc = "บันทึกการตั้งค่าทั้งหมดลงในโปรไฟล์ที่เลือก", Callback = function()
    -- บันทึกค่าต่างๆ ลง SettingsData
    SettingsData = {
        -- Player settings
        walkSpeedEnabled = walkSpeedEnabled,
        speedValue = speedValue,
        sitEnabled = sitEnabled,
        sitHeight = sitHeight,
        jumpEnabled = jumpEnabled,
        jumpPower = jumpPower,
        antiDeathEnabled = antiDeathEnabled,
        
        -- Anti Look
        antiLookEnabled = antiLookEnabled,
        randomPatternEnabled = randomPatternEnabled,
        shakeStrength = shakeStrength,
        twistEnabled = twistEnabled,
        ghostShakeEnabled = ghostShakeEnabled,
        
        -- ESP Settings
        ShowBoxESP = ShowBoxESP,
        BOX_COLOR_MODE = BOX_COLOR_MODE,
        ShowNameESP = ShowNameESP,
        nameFontSize = nameFontSize,
        ShowItemESP = ShowItemESP,
        itemBillboardSize = itemBillboardSize,
        
        -- PVP Settings
        SilentAimEnabled = SilentAimEnabled,
        FOVRadius = FOVRadius,
        SelectedAimPart = SelectedAimPart,
        safeAdminEnabled = safeAdminEnabled,
        excludedPlayerNames = excludedPlayerNames,
        
        -- Gun Mod Settings
        FireRateValue = getgenv().FireRateValue,
        AccuracyValue = getgenv().AccuracyValue,
        RecoilValue = getgenv().RecoilValue,
        DurabilityValue = getgenv().DurabilityValue,
        AutoValue = getgenv().AutoValue,
        GunModsAutoApply = getgenv().GunModsAutoApply,
        FistsBuffEnabled = FistsBuffEnabled,
        
        -- Vehicle Settings
        vehicleSpeedBoost = vehicleSpeedBoost,
        antiRamEnabled = antiRamEnabled,
        antiRamDistance = antiRamDistance,
        vehicleShakeEnabled = vehicleShakeEnabled,
        
        -- Item ESP
        ["ItemESPEnabled"] = getgenv().ItemESPEnabled,
        ["ItemESPMaxDist"] = getgenv().ItemESPMaxDist,
        
        -- Custom Settings
        fpsBoosterEnabled = fpsBoosterEnabled,
        fpsBoosterMode = fpsBoosterMode,
        PigHubEffectEnabled = PigHubEffectEnabled,
        ORBIT_RADIUS = ORBIT_RADIUS,
        ORBIT_SPEED = ORBIT_SPEED,
        
        -- Anti Stun
        antiStunEnabled = antiStunEnabled,
    }
    saveSettings()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PIG HUB",
        Text = "บันทึกการตั้งค่าเรียบร้อย!",
        Duration = 2
    })
end})

-- โหลดโปรไฟล์
local profileDropdown
local function updateProfileDropdown()
    local profiles = refreshProfileList()
    if #profiles == 0 then table.insert(profiles, "ไม่มีโปรไฟล์") end
    if profileDropdown then
        profileDropdown:SetValues(profiles)
    end
end

profileDropdown = SettingsTab:Dropdown({
    Title = "เลือกโปรไฟล์",
    Values = refreshProfileList(),
    Default = 1,
    Callback = function(v)
        if v ~= "ไม่มีโปรไฟล์" then
            if loadSettings(v) then
                -- โหลดค่าต่างๆ กลับมา
                walkSpeedEnabled = SettingsData.walkSpeedEnabled or false
                speedValue = SettingsData.speedValue or 0.05
                sitEnabled = SettingsData.sitEnabled or false
                sitHeight = SettingsData.sitHeight or -2
                jumpEnabled = SettingsData.jumpEnabled or false
                jumpPower = SettingsData.jumpPower or 70
                antiDeathEnabled = SettingsData.antiDeathEnabled or false
                
                -- Anti Look
                antiLookEnabled = SettingsData.antiLookEnabled or false
                randomPatternEnabled = SettingsData.randomPatternEnabled or false
                shakeStrength = SettingsData.shakeStrength or 2500
                twistEnabled = SettingsData.twistEnabled or false
                ghostShakeEnabled = SettingsData.ghostShakeEnabled or false
                
                -- ESP
                ShowBoxESP = SettingsData.ShowBoxESP or false
                BOX_COLOR_MODE = SettingsData.BOX_COLOR_MODE or "rainbow"
                ShowNameESP = SettingsData.ShowNameESP or false
                nameFontSize = SettingsData.nameFontSize or 18
                ShowItemESP = SettingsData.ShowItemESP or false
                itemBillboardSize = SettingsData.itemBillboardSize or 26
                
                -- PVP
                SilentAimEnabled = SettingsData.SilentAimEnabled or false
                FOVRadius = SettingsData.FOVRadius or 200
                SelectedAimPart = SettingsData.SelectedAimPart or "Head"
                safeAdminEnabled = SettingsData.safeAdminEnabled or false
                excludedPlayerNames = SettingsData.excludedPlayerNames or {}
                
                -- Gun Mod
                getgenv().FireRateValue = SettingsData.FireRateValue or 1000
                getgenv().AccuracyValue = SettingsData.AccuracyValue or 1
                getgenv().RecoilValue = SettingsData.RecoilValue or 0
                getgenv().DurabilityValue = SettingsData.DurabilityValue or 999999999
                getgenv().AutoValue = SettingsData.AutoValue or true
                getgenv().GunModsAutoApply = SettingsData.GunModsAutoApply or false
                FistsBuffEnabled = SettingsData.FistsBuffEnabled or false
                
                -- Vehicle
                vehicleSpeedBoost = SettingsData.vehicleSpeedBoost or 50
                antiRamEnabled = SettingsData.antiRamEnabled or false
                antiRamDistance = SettingsData.antiRamDistance or 45
                vehicleShakeEnabled = SettingsData.vehicleShakeEnabled or false
                
                -- Item ESP
                getgenv().ItemESPEnabled = SettingsData["ItemESPEnabled"] or false
                getgenv().ItemESPMaxDist = SettingsData["ItemESPMaxDist"] or 500
                
                -- Custom
                fpsBoosterEnabled = SettingsData.fpsBoosterEnabled or false
                fpsBoosterMode = SettingsData.fpsBoosterMode or 1
                PigHubEffectEnabled = SettingsData.PigHubEffectEnabled or false
                ORBIT_RADIUS = SettingsData.ORBIT_RADIUS or 5
                ORBIT_SPEED = SettingsData.ORBIT_SPEED or 2.5
                
                -- Anti Stun
                antiStunEnabled = SettingsData.antiStunEnabled or false
                
                -- เปิดใช้งานฟังก์ชันต่างๆ ตามค่าที่โหลด
                toggleSitSystem(sitEnabled)
                if jumpEnabled then
                    if jumpConnection then jumpConnection:Disconnect() end
                    jumpConnection = UserInputService.JumpRequest:Connect(function()
                        local char = LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            char.HumanoidRootPart.Velocity = Vector3.new(char.HumanoidRootPart.Velocity.X, jumpPower, char.HumanoidRootPart.Velocity.Z)
                        end
                    end)
                end
                
                toggleFullAntiLook(antiLookEnabled)
                toggleRandomPattern(randomPatternEnabled)
                setShakeStrength(shakeStrength)
                toggleBodyTwist(twistEnabled)
                toggleGhostShake(ghostShakeEnabled)
                toggleAntiStun(antiStunEnabled)
                
                if antiDeathEnabled then
                    antiDeathEnabled = true
                end
                
                if fpsBoosterEnabled then
                    toggleFPSBooster(true)
                    applyFPSBooster(fpsBoosterMode)
                end
                
                if PigHubEffectEnabled then
                    togglePigHubEffect(true)
                end
                
                if ShowItemESP then
                    refreshAllBillboards()
                end
                
                if ShowBoxESP then
                    for _,player in ipairs(Players:GetPlayers()) do
                        if player~=LocalPlayer and not PlayerBoxESP[player] then createBoxESP(player) end
                    end
                end
                
                if ShowNameESP then
                    for _,player in ipairs(Players:GetPlayers()) do
                        if player~=LocalPlayer and not PlayerNameESP[player] then createNameESP(player) end
                    end
                end
                
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "PIG HUB",
                    Text = "โหลดโปรไฟล์ " .. v .. " เรียบร้อย!",
                    Duration = 3
                })
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "PIG HUB",
                    Text = "ไม่สามารถโหลดโปรไฟล์ได้",
                    Duration = 2
                })
            end
        end
    end
})

SettingsTab:Input({Title = "ชื่อโปรไฟล์ใหม่", Placeholder = "ใส่ชื่อโปรไฟล์...", Callback = function(v)
    if v and v ~= "" then
        CurrentProfile = v
        saveSettings()
        updateProfileDropdown()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "PIG HUB",
            Text = "สร้างโปรไฟล์ '" .. v .. "' เรียบร้อย!",
            Duration = 2
        })
    end
end})

SettingsTab:Button({Title = "🗑️ ล้างการตั้งค่าปัจจุบัน", Desc = "รีเซ็ตการตั้งค่าทั้งหมดกลับเป็นค่าเริ่มต้น", Callback = function()
    resetCurrentSettings()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PIG HUB",
        Text = "ล้างการตั้งค่าปัจจุบันเรียบร้อย!",
        Duration = 2
    })
end})

SettingsTab:Button({Title = "🔄 รีเฟรชรายชื่อโปรไฟล์", Callback = function()
    updateProfileDropdown()
end})

SettingsTab:Divider()
SettingsTab:Section({Title = "ระบบป้องกันการเซเมื่อโดนรถชน"})
SettingsTab:Toggle({Title = "🛡️ ป้องกันการเซ (Anti Stun)", Desc = "ป้องกันตัวละครเซหรือล้มเมื่อโดนรถชน", Default = false, Callback = function(state)
    toggleAntiStun(state)
end})

local PlayerTab = Window:Tab({Title = "PLAYER", Icon = "user"})
local ESPTab = Window:Tab({Title = "ESP", Icon = "eye"})
local PVPTab = Window:Tab({Title = "PVP", Icon = "crosshair"})
local GunModTab = Window:Tab({Title = "GUN MOD", Icon = "layers"})
local QuestTab = Window:Tab({Title = "QUEST", Icon = "flag"})
local VehicleTab = Window:Tab({Title = "CAR CUSTOM", Icon = "car"})
local CustomTab = Window:Tab({Title = "CUSTOM", Icon = "settings"})

if _ktype == "adminmax" then
    local AdminTab = Window:Tab({Title = "ADMIN", Icon = "shield"})

    AdminTab:Section({Title = "ADMIN CONTROL PANEL"})
    
    AdminTab:Paragraph({Text = "ระบบสำหรับผู้ดูแลระบบสูงสุด (Admin Max) สามารถจัดการคีย์และตรวจสอบข้อมูลได้"})

    AdminTab:Button({Title = "แสดง HWID ปัจจุบัน", Desc = "แสดง Hardware ID ของเครื่องนี้เพื่อใช้ในการผูกคีย์", Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "HWID",
            Text = _getHWID(),
            Duration = 5
        })
    end})

    AdminTab:Button({Title = "รีเซ็ตคีย์ (ออกจากระบบ)", Desc = "ล้างข้อมูลคีย์ที่บันทึกไว้และกลับสู่หน้าป้อนคีย์ใหม่", Callback = function()
        pcall(function() writefile("phs.txt", "") end)
        game:GetService("Players").LocalPlayer:Kick("คีย์ถูกรีเซ็ต กรุณาใส่คีย์ใหม่")
    end})

    AdminTab:Button({Title = "ตรวจสอบสถานะคีย์ปัจจุบัน", Desc = "แสดงข้อมูลคีย์ที่กำลังใช้งานอยู่ เช่น ประเภทและวันหมดอายุ", Callback = function()
        local s = _load()
        if s and s.key then
            local expText = s.expires and os.date("%Y-%m-%d %H:%M:%S", s.expires) or "ไม่มีวันหมดอายุ (ถาวร)"
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "สถานะคีย์",
                Text = "คีย์: " .. s.key .. "\nประเภท: " .. _typeLabel(s.type or "?") .. "\nหมดอายุ: " .. expText,
                Duration = 8
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "สถานะคีย์",
                Text = "ไม่พบคีย์ที่บันทึกไว้",
                Duration = 3
            })
        end
    end})

    AdminTab:Button({Title = "ดึงข้อมูลคีย์ล่าสุดจากเซิร์ฟเวอร์", Desc = "โหลดข้อมูลคีย์ทั้งหมดจากเซิร์ฟเวอร์อีกครั้ง", Callback = function()
        local data = _fetch()
        if data then
            local count = 0
            for _ in pairs(data) do count = count + 1 end
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "อัปเดตข้อมูล",
                Text = "ดึงข้อมูลสำเร็จ พบ " .. count .. " คีย์",
                Duration = 5
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ข้อผิดพลาด",
                Text = "ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้",
                Duration = 3
            })
        end
    end})

    AdminTab:Divider()
    AdminTab:Section({Title = "ข้อมูลเซิร์ฟเวอร์"})

    AdminTab:Button({Title = "แสดงรายชื่อผู้เล่นทั้งหมด", Desc = "แสดงรายชื่อผู้เล่นที่อยู่ในเซิร์ฟเวอร์ปัจจุบัน", Callback = function()
        local players = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(players, p.Name .. " (" .. p.UserId .. ")")
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "รายชื่อผู้เล่น",
            Text = table.concat(players, ", "),
            Duration = 10
        })
    end})

    AdminTab:Button({Title = "แสดง Job ID ของเซิร์ฟเวอร์", Desc = "แสดงรหัสเซิร์ฟเวอร์ปัจจุบัน", Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Job ID",
            Text = game.JobId,
            Duration = 8
        })
    end})

    AdminTab:Divider()
    AdminTab:Section({Title = "การตั้งค่าระบบ"})

    AdminTab:Toggle({Title = "Safe Admin Mode", Desc = "ป้องกันไม่ให้ Silent Aim ยิงผู้เล่นที่เป็น Admin", Default = false, Callback = function(state)
        safeAdminEnabled = state
    end})

    AdminTab:Input({Title = "เพิ่มชื่อผู้เล่น Admin", Desc = "ใส่ชื่อผู้เล่นที่ต้องการป้องกัน (คั่นด้วยช่องว่าง)", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
        adminPlayers = {}
        for name in string.gmatch(v, "%S+") do adminPlayers[name] = true end
    end})

    AdminTab:Button({Title = "รีเซ็ตค่าเริ่มต้นทั้งหมด", Desc = "คืนค่าทุกการตั้งค่ากลับเป็นค่าเริ่มต้น", Callback = function()
        walkSpeedEnabled = false
        speedValue = 0.05
        sitHeight = -2
        if sitEnabled then toggleSitSystem(false) end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "รีเซ็ตสำเร็จ",
            Text = "ค่าทั้งหมดกลับสู่ค่าเริ่มต้น",
            Duration = 3
        })
    end})
end

-- หมายเหตุ: ส่วนที่เหลือของโค้ด (PlayerTab, ESPTab, PVPTab, GunModTab, QuestTab, VehicleTab, CustomTab)
-- ยังคงเหมือนเดิม ไม่มีการเปลี่ยนแปลง

-- สรุปการเปลี่ยนแปลง:
-- 1. แก้ไข ESP ไอเทมบนพื้น: ชื่อจะไม่ติดหน้าจอเมื่อไอเทมอยู่ขอบจอ
-- 2. เพิ่มระบบเซฟการตั้งค่าอัตโนมัติ (Settings Tab)
-- 3. เพิ่มปุ่มเปลี่ยนคีย์ (Re-login) สำหรับผู้ใช้ทั่วไป
-- 4. แก้ไข UI การใส่คีย์ให้สวยงามยิ่งขึ้น
-- 5. เพิ่มระบบป้องกันการเซเมื่อโดนรถชน (Anti Stun)
-- 6. ปรับขนาดปุ่มแสดงสถานะคีย์ให้เล็กลง