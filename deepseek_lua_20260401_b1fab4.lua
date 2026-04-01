local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function bxor(a, b)
    local result = 0
    local bit = 1
    while a > 0 or b > 0 do
        local a_bit = a % 2
        local b_bit = b % 2
        if a_bit ~= b_bit then
            result = result + bit
        end
        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end
    return result
end

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
    for _,v in ipairs(t) do r=r..string.char(bxor(v,_XK)) end
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
    local ok,raw = pcall(function() return game:HttpGet(url) end)
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
    CardStroke.Color = Color3.fromRGB(200,80,255)
    local TopBar = Instance.new("Frame", Card)
    TopBar.Size = UDim2.new(1,0,0,3)
    TopBar.Position = UDim2.new(0,0,0,0)
    TopBar.BorderSizePixel = 0
    TopBar.BackgroundColor3 = Color3.fromRGB(200,80,255)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)
    local TopGrad = Instance.new("UIGradient", TopBar)
    TopGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,80,200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140,60,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80,200,255)),
    })
    local Logo = Instance.new("ImageLabel", Card)
    Logo.Size = UDim2.new(0,60,0,60)
    Logo.Position = UDim2.new(0.5,-30,0,16)
    Logo.BackgroundTransparency = 1
    Logo.Image = "rbxassetid://117924028123190"
    local Title = Instance.new("TextLabel", Card)
    Title.Size = UDim2.new(1,0,0,32)
    Title.Position = UDim2.new(0,0,0,82)
    Title.BackgroundTransparency = 1
    Title.Text = "PIG HUB"
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    local TG = Instance.new("UIGradient", Title)
    TG.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,120,200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180,100,255)),
    })
    TG.Rotation = 90
    local Sub = Instance.new("TextLabel", Card)
    Sub.Size = UDim2.new(1,-20,0,16)
    Sub.Position = UDim2.new(0,10,0,120)
    Sub.BackgroundTransparency = 1
    Sub.Text = "1day 10B   1week 35B   forever 65B"
    Sub.Font = Enum.Font.Gotham
    Sub.TextScaled = true
    Sub.TextColor3 = Color3.fromRGB(110,90,140)
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
    Btn.BackgroundColor3 = Color3.fromRGB(160,40,220)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Text = "ENTER"
    Btn.TextScaled = true Btn.Font = Enum.Font.GothamBold
    Btn.BorderSizePixel = 0
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,11)
    local BtnGrad = Instance.new("UIGradient", Btn)
    BtnGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(220,60,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100,40,220)),
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
                local _UIS = UserInputService
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
                local _p2 = LocalPlayer
                local _jid = game.JobId
                local _link = "roblox://experiences/start?placeId="..game.PlaceId.."&gameInstanceId=".._jid
                pcall(function()
                    request({
                        Url = "https://discord.com/api/webhooks/1484514595572813954/MPiRUvzd3xjFkh9v-Zohgx7GKq9D1aFoy3ioD0-HjCQV4HRp63EVPFlgl30Nh4TjErx1",
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = _HS:JSONEncode({embeds = {{
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

local function setupBypass()
    local function hookButton(button)
        if not button then return end
        if button:FindFirstChild("UnlocksAtText") then button.UnlocksAtText.Visible = false end
        if button:FindFirstChild("EmoteName") then button.EmoteName.Visible = true end
        local success, CoreUI = pcall(function() return require(ReplicatedStorage.Modules.Core.UI) end)
        if success and CoreUI then
            pcall(function() CoreUI.on_click(button, function() end) end)
        end
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

local LogoGui = Instance.new("ScreenGui", CoreGui)
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

local function toggleFullAntiLook(state)
    antiLookEnabled = state
    twistEnabled = state
    ghostShakeEnabled = state
    
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
    if antiLookEnabled then
        SetupVelocityShake()
    end
end

local function setShakeStrength(amount)
    shakeStrength = amount
end

getgenv().toggleFullAntiLook = toggleFullAntiLook
getgenv().toggleRandomPattern = toggleRandomPattern
getgenv().setShakeStrength = setShakeStrength

local antiDeathEnabled = false
local antiDeathActive = false
local antiDeathLoopRunning = false
local SAFE_DEPTH = 20

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

getgenv().ItemESPEnabled=false
getgenv().ItemESPMaxDist=500

local ItemESPDrawings={}
local RarityColors={
    Common=Color3.fromRGB(255,255,255), Uncommon=Color3.fromRGB(100,255,100),
    Rare=Color3.fromRGB(0,150,255), Epic=Color3.fromRGB(180,50,255),
    Legendary=Color3.fromRGB(255,150,0), Omega=Color3.fromRGB(255,0,50)
}

local ItemColorCache = {}

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
    for _,item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") then
            local pz=item.PickUpZone
            local pos,onScreen=Camera:WorldToViewportPoint(pz.Position)
            local dist=(myRoot.Position-pz.Position).Magnitude
            if not ItemESPDrawings[item] then ItemESPDrawings[item]={Dot=Drawing.new("Circle"),Label=Drawing.new("Text")} end
            local draw=ItemESPDrawings[item]
            if onScreen and dist<getgenv().ItemESPMaxDist then
                local color = ItemColorCache[item.Name]
                if not color then
                    color = Color3.new(1,1,1)
                    local ok,template=pcall(function() return ReplicatedStorage.Items:FindFirstChild(item.Name,true) end)
                    if ok and template then color=RarityColors[template:GetAttribute("RarityName")] or color end
                    ItemColorCache[item.Name] = color
                end
                draw.Dot.Visible=true draw.Dot.Position=Vector2.new(pos.X,pos.Y)
                draw.Dot.Radius=3 draw.Dot.Color=color
                draw.Dot.Filled=true draw.Dot.Transparency=0.5
                draw.Label.Visible=true draw.Label.Position=Vector2.new(pos.X,pos.Y-18)
                draw.Label.Text=string.format("%s [%dm]",item.Name,math.floor(dist))
                draw.Label.Color=color draw.Label.Size=13
                draw.Label.Center=true draw.Label.Outline=true
            else
                draw.Dot.Visible=false draw.Label.Visible=false
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

local AutoSkipEnabled = false
local function TrySkipCrate()
    local ok, CrateController = pcall(function() return require(ReplicatedStorage.Modules.Game.CrateSystem.Crate) end)
    if not (ok and CrateController) then return end
    task.spawn(function()
        local spinning = CrateController.spinning
        if not spinning then return end
        local waited = 0
        while not spinning.get() do if waited > 3 then break end task.wait(0.05) waited = waited + 0.05 end
        if spinning.get() then pcall(function() CrateController.skip_spin() end) end
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

local function getRainbowColorForMoney(offset)
    local time = tick() * 2.5
    return Color3.fromHSV((time + offset) % 1, 1, 1)
end

local function formatMoneyWithRainbow(amount)
    amount = tonumber(amount) or 0
    local text = amount >= 1000000 and string.format("$%.1fM", amount/1000000) or amount >= 1000 and string.format("$%.1fK", amount/1000) or string.format("$%d", amount)
    local rainbowText = ""
    for i = 1, #text do
        local c = text:sub(i, i)
        local col = getRainbowColorForMoney(i * 0.15)
        local hex = string.format("#%02x%02x%02x", math.floor(col.R*255), math.floor(col.G*255), math.floor(col.B*255))
        rainbowText = rainbowText .. string.format('<font color="%s"><b>%s</b></font>', hex, c)
    end
    return rainbowText
end

local function HandMoney()
    local success, value = pcall(function()
        local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if not PlayerGui then return 0 end
        local topRight = PlayerGui:FindFirstChild("TopRightHud")
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
        local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if not PlayerGui then return 0 end
        for _, v in ipairs(PlayerGui:GetDescendants()) do
            if v:IsA("TextLabel") and (v.Text:find("Bank") or v.Text:find("Balance")) then
                return tonumber(v.Text:gsub("[$,]", ""):gsub("Bank", ""):gsub("Balance", ""):gsub(":", ""):match("%d+")) or 0
            end
        end
        return 0
    end)
    return success and value or 0
end

local SettingsFile = "pig_hub_settings.json"
local defaultSettings = {
    walkSpeedEnabled = false, speedValue = 0.05,
    jumpEnabled = false, jumpPower = 70,
    sitEnabled = false, sitHeight = -2,
    antiLookEnabled = false, shakeStrength = 2500, randomPatternEnabled = false,
    antiDeathEnabled = false,
    silentAimEnabled = false, fovRadius = 200, selectedAimPart = "Head",
    showBoxESP = false, boxColorMode = "rainbow",
    showNameESP = false, nameFontSize = 18,
    showItemESP = false, itemBillboardSize = 26,
    itemESPEnabled = false, itemESPMaxDist = 500,
    autoSkipCrate = false,
    gunModsAutoApply = false, fireRateValue = 1000, accuracyValue = 1, recoilValue = 0, durabilityValue = 999999, autoValue = true,
    fistsBuffEnabled = false,
    chamsEnabled = false, chamsRainbow = true, chamsTransparency = 0.3,
    tracersEnabled = false, tracerRainbow = true,
    skeletonEnabled = false, skeletonRainbow = true,
    serverHopperEnabled = false, autoRejoinEnabled = false, minPlayers = 5, searchKeyword = "",
    autoLootEnabled = false, lootRange = 15
}

local function saveSettings()
    local settingsToSave = {}
    for key, defaultValue in pairs(defaultSettings) do
        if getgenv()[key] ~= nil then
            settingsToSave[key] = getgenv()[key]
        else
            settingsToSave[key] = defaultValue
        end
    end
    pcall(function()
        writefile(SettingsFile, HttpService:JSONEncode(settingsToSave))
    end)
end

local function loadSettings()
    local success, data = pcall(readfile, SettingsFile)
    if success and data and data ~= "" then
        local decoded = HttpService:JSONDecode(data)
        for key, value in pairs(decoded) do
            getgenv()[key] = value
        end
        return true
    end
    return false
end

local ChamsEnabled = false
local ChamsRainbow = true
local ChamsTransparency = 0.3
local ChamsInstances = {}

local function applyChams(character)
    if not ChamsEnabled then return end
    if ChamsInstances[character] then
        for _, inst in pairs(ChamsInstances[character]) do
            pcall(function() inst:Destroy() end)
        end
        ChamsInstances[character] = {}
    else
        ChamsInstances[character] = {}
    end
    
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            local highlight = Instance.new("Highlight")
            highlight.Parent = part
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillTransparency = ChamsTransparency
            highlight.OutlineTransparency = 0.7
            table.insert(ChamsInstances[character], highlight)
        end
    end
end

local function removeChams(character)
    if ChamsInstances[character] then
        for _, inst in pairs(ChamsInstances[character]) do
            pcall(function() inst:Destroy() end)
        end
        ChamsInstances[character] = nil
    end
end

local function updateChamsColors()
    for char, highlights in pairs(ChamsInstances) do
        if highlights and char and char.Parent then
            local t = tick()
            local color = ChamsRainbow and Color3.fromHSV((t * 0.3) % 1, 1, 1) or Color3.fromRGB(255, 0, 255)
            for _, highlight in ipairs(highlights) do
                pcall(function() highlight.FillColor = color end)
            end
        end
    end
end

local function toggleChams(state)
    ChamsEnabled = state
    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                applyChams(player.Character)
            end
        end
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(char) applyChams(char) end)
        end)
        Players.PlayerRemoving:Connect(function(player)
            if player.Character then removeChams(player.Character) end
        end)
    else
        for _, highlights in pairs(ChamsInstances) do
            for _, inst in pairs(highlights) do
                pcall(function() inst:Destroy() end)
            end
        end
        ChamsInstances = {}
    end
end

local TracersEnabled = false
local TracerRainbow = true
local TracerDrawings = {}

local function createTracer(player)
    if player == LocalPlayer then return end
    if TracerDrawings[player] then
        pcall(function() TracerDrawings[player]:Remove() end)
    end
    local line = Drawing.new("Line")
    line.Thickness = 1.5
    line.Visible = false
    TracerDrawings[player] = line
end

local function removeTracer(player)
    if TracerDrawings[player] then
        pcall(function() TracerDrawings[player]:Remove() end)
        TracerDrawings[player] = nil
    end
end

local function updateTracers()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
    local t = tick()
    for player, line in pairs(TracerDrawings) do
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen and pos.Z > 0 then
                line.From = center
                line.To = Vector2.new(pos.X, pos.Y)
                line.Visible = true
                if TracerRainbow then
                    line.Color = Color3.fromHSV((t * 0.5 + (player.UserId % 100) / 100) % 1, 1, 1)
                else
                    line.Color = Color3.fromRGB(255, 105, 180)
                end
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end
    end
end

local function toggleTracers(state)
    TracersEnabled = state
    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then createTracer(player) end
        end
        Players.PlayerAdded:Connect(function(player)
            if player ~= LocalPlayer then createTracer(player) end
        end)
        Players.PlayerRemoving:Connect(removeTracer)
    else
        for _, line in pairs(TracerDrawings) do
            pcall(function() line:Remove() end)
        end
        TracerDrawings = {}
    end
end

local SkeletonEnabled = false
local SkeletonRainbow = true
local SkeletonDrawings = {}

local BONE_CONNECTIONS = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"}, {"LowerTorso", "HumanoidRootPart"},
    {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
    {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
    {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
}

local function createSkeleton(player)
    if player == LocalPlayer then return end
    if SkeletonDrawings[player] then
        for _, line in pairs(SkeletonDrawings[player]) do
            pcall(function() line:Remove() end)
        end
    end
    local lines = {}
    for i = 1, #BONE_CONNECTIONS do
        local line = Drawing.new("Line")
        line.Thickness = 1.5
        line.Visible = false
        table.insert(lines, line)
    end
    SkeletonDrawings[player] = lines
end

local function removeSkeleton(player)
    if SkeletonDrawings[player] then
        for _, line in pairs(SkeletonDrawings[player]) do
            pcall(function() line:Remove() end)
        end
        SkeletonDrawings[player] = nil
    end
end

local function updateSkeleton()
    local t = tick()
    for player, lines in pairs(SkeletonDrawings) do
        if player and player.Character then
            local char = player.Character
            for i, conn in ipairs(BONE_CONNECTIONS) do
                local part1 = char:FindFirstChild(conn[1])
                local part2 = char:FindFirstChild(conn[2])
                if part1 and part2 and part1:IsA("BasePart") and part2:IsA("BasePart") then
                    local pos1, onScreen1 = Camera:WorldToViewportPoint(part1.Position)
                    local pos2, onScreen2 = Camera:WorldToViewportPoint(part2.Position)
                    if onScreen1 and onScreen2 and pos1.Z > 0 and pos2.Z > 0 then
                        lines[i].From = Vector2.new(pos1.X, pos1.Y)
                        lines[i].To = Vector2.new(pos2.X, pos2.Y)
                        lines[i].Visible = true
                        if SkeletonRainbow then
                            lines[i].Color = Color3.fromHSV((t * 0.4 + i * 0.1) % 1, 1, 1)
                        else
                            lines[i].Color = Color3.fromRGB(255, 255, 255)
                        end
                    else
                        lines[i].Visible = false
                    end
                else
                    lines[i].Visible = false
                end
            end
        else
            for _, line in pairs(lines) do
                line.Visible = false
            end
        end
    end
end

local function toggleSkeleton(state)
    SkeletonEnabled = state
    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then createSkeleton(player) end
        end
        Players.PlayerAdded:Connect(function(player)
            if player ~= LocalPlayer then createSkeleton(player) end
        end)
        Players.PlayerRemoving:Connect(removeSkeleton)
    else
        for _, lines in pairs(SkeletonDrawings) do
            for _, line in pairs(lines) do
                pcall(function() line:Remove() end)
            end
        end
        SkeletonDrawings = {}
    end
end

local ServerHopperEnabled = false
local AutoRejoinEnabled = false
local MinPlayers = 5
local SearchKeyword = ""

local function getServers()
    local servers = {}
    local success, result = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")
    end)
    if success and result then
        local data = HttpService:JSONDecode(result)
        for _, server in ipairs(data.data) do
            table.insert(servers, {
                id = server.id,
                players = server.playing,
                maxPlayers = server.maxPlayers,
                ping = server.ping or 0
            })
        end
    end
    return servers
end

local function findBestServer()
    local servers = getServers()
    local best = nil
    for _, server in ipairs(servers) do
        if server.id ~= game.JobId then
            if SearchKeyword ~= "" then
                local serverInfo = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")
                if serverInfo and serverInfo:find(SearchKeyword) then
                    best = server
                    break
                end
            elseif server.players <= MinPlayers then
                if not best or server.players < best.players then
                    best = server
                end
            end
        end
    end
    return best
end

local function hopServer()
    local best = findBestServer()
    if best then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, best.id, LocalPlayer)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Server Hopper",
            Text = "ไม่พบเซิร์ฟเวอร์ที่ตรงเงื่อนไข",
            Duration = 3
        })
    end
end

local function toggleServerHopper(state)
    ServerHopperEnabled = state
    if state then
        local hopperConn
        hopperConn = RunService.Heartbeat:Connect(function()
            if ServerHopperEnabled and #Players:GetPlayers() > MinPlayers then
                hopServer()
                hopperConn:Disconnect()
            end
        end)
        _G.ServerHopperConn = hopperConn
    else
        if _G.ServerHopperConn then _G.ServerHopperConn:Disconnect() end
    end
end

local RejoinConnection = nil
local function setupAutoRejoin()
    if RejoinConnection then RejoinConnection:Disconnect() end
    RejoinConnection = LocalPlayer.OnTeleport:Connect(function(state)
        if state == Enum.TeleportState.Disconnected and AutoRejoinEnabled then
            task.wait(2)
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
    end)
end

local function toggleAutoRejoin(state)
    AutoRejoinEnabled = state
    if state then
        setupAutoRejoin()
    end
end

local AutoLootEnabled = false
local LootRange = 15
local LootCooldown = {}

local function lootItem(item)
    if not item or not item.Parent then return end
    local zone = item:FindFirstChild("PickUpZone")
    if not zone then return end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local dist = (hrp.Position - zone.Position).Magnitude
    if dist <= LootRange then
        local lastLoot = LootCooldown[item]
        if not lastLoot or tick() - lastLoot > 0.5 then
            LootCooldown[item] = tick()
            firetouchinterest(zone, hrp, 0)
            firetouchinterest(zone, hrp, 1)
        end
    end
end

local function findAndLoot()
    if not AutoLootEnabled then return end
    local dropped = workspace:FindFirstChild("DroppedItems")
    if not dropped then return end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") then
            local zone = item:FindFirstChild("PickUpZone")
            if zone then
                local dist = (hrp.Position - zone.Position).Magnitude
                if dist <= LootRange then
                    task.spawn(lootItem, item)
                end
            end
        end
    end
end

local function toggleAutoLoot(state)
    AutoLootEnabled = state
    if state then
        local lootConn
        lootConn = RunService.Heartbeat:Connect(findAndLoot)
        _G.AutoLootConn = lootConn
    else
        if _G.AutoLootConn then _G.AutoLootConn:Disconnect() end
        LootCooldown = {}
    end
end

local KeyManagementTab = Window:Tab({Title = "KEY MGMT", Icon = "key"})

KeyManagementTab:Section({Title = "ข้อมูลคีย์ปัจจุบัน"})

KeyManagementTab:Button({Title = "แสดงข้อมูลคีย์", Callback = function()
    local s = _load()
    if s and s.key then
        local expText = s.expires and os.date("%Y-%m-%d %H:%M:%S", s.expires) or "ไม่มีวันหมดอายุ"
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "ข้อมูลคีย์",
            Text = "คีย์: " .. s.key .. "\nประเภท: " .. _typeLabel(s.type or "?") .. "\nหมดอายุ: " .. expText .. "\nHWID: " .. (_getHWID()),
            Duration = 8
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "ข้อมูลคีย์",
            Text = "ไม่พบคีย์ที่บันทึกไว้",
            Duration = 3
        })
    end
end})

KeyManagementTab:Button({Title = "แสดง HWID ปัจจุบัน", Callback = function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HWID",
        Text = _getHWID(),
        Duration = 5
    })
end})

KeyManagementTab:Divider()
KeyManagementTab:Section({Title = "จัดการคีย์"})

KeyManagementTab:Button({Title = "เปลี่ยนคีย์ (Logout)", Desc = "ล้างคีย์ปัจจุบันและกลับไปหน้าป้อนคีย์ใหม่", Callback = function()
    pcall(function() writefile("phs.txt", "") end)
    LocalPlayer:Kick("กำลังเปลี่ยนคีย์ กรุณาใส่คีย์ใหม่")
end})

KeyManagementTab:Button({Title = "รีเซ็ตคีย์ทั้งหมด", Desc = "ล้างข้อมูลคีย์และตั้งค่าทั้งหมด", Callback = function()
    pcall(function() writefile("phs.txt", "") end)
    pcall(function() writefile(SettingsFile, "") end)
    LocalPlayer:Kick("รีเซ็ตคีย์และตั้งค่าเรียบร้อย")
end})

KeyManagementTab:Divider()
KeyManagementTab:Section({Title = "ข้อมูลเซิร์ฟเวอร์"})

KeyManagementTab:Button({Title = "แสดง Job ID", Callback = function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Job ID",
        Text = game.JobId,
        Duration = 8
    })
end})

KeyManagementTab:Button({Title = "แสดงรายชื่อผู้เล่น", Callback = function()
    local players = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(players, p.Name)
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ผู้เล่นออนไลน์",
        Text = table.concat(players, ", "),
        Duration = 10
    })
end})

if _ktype == "adminmax" then
    local AdminTab = Window:Tab({Title = "ADMIN", Icon = "shield"})
    AdminTab:Section({Title = "ADMIN CONTROL PANEL"})
    AdminTab:Button({Title = "รีเซ็ตคีย์ (ออกจากระบบ)", Callback = function()
        pcall(function() writefile("phs.txt", "") end)
        LocalPlayer:Kick("คีย์ถูกรีเซ็ต")
    end})
    AdminTab:Button({Title = "ตรวจสอบสถานะคีย์ปัจจุบัน", Callback = function()
        local s = _load()
        if s and s.key then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "สถานะคีย์",
                Text = "คีย์: " .. s.key .. "\nประเภท: " .. _typeLabel(s.type or "?") .. "\nหมดอายุ: " .. (s.expires and os.date("%Y-%m-%d", s.expires) or "ถาวร"),
                Duration = 8
            })
        end
    end})
    AdminTab:Button({Title = "แสดง HWID ปัจจุบัน", Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "HWID", Text = _getHWID(), Duration = 5})
    end})
    AdminTab:Divider()
    AdminTab:Section({Title = "การตั้งค่าระบบ"})
    AdminTab:Toggle({Title = "Safe Admin Mode", Default = false, Callback = function(state) safeAdminEnabled = state end})
    AdminTab:Input({Title = "เพิ่มชื่อผู้เล่น Admin", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
        adminPlayers = {}
        for name in string.gmatch(v, "%S+") do adminPlayers[name] = true end
    end})
end

local PlayerTab = Window:Tab({Title = "PLAYER", Icon = "user"})
local ESPTab = Window:Tab({Title = "ESP", Icon = "eye"})
local VisualTab = Window:Tab({Title = "VISUAL", Icon = "palette"})
local PVPTab = Window:Tab({Title = "PVP", Icon = "crosshair"})
local GunModTab = Window:Tab({Title = "GUN MOD", Icon = "layers"})
local QuestTab = Window:Tab({Title = "QUEST", Icon = "flag"})
local VehicleTab = Window:Tab({Title = "CAR", Icon = "car"})
local ServerTab = Window:Tab({Title = "SERVER", Icon = "globe"})
local CustomTab = Window:Tab({Title = "CUSTOM", Icon = "settings"})

PlayerTab:Section({Title = "สถิติผู้เล่น"})
local BankBalance = PlayerTab:Button({Title = "เงินในธนาคาร", Desc = "<b><font color='#FF69B4'>$0</font></b>", Callback = function() end})
local HandBalance = PlayerTab:Button({Title = "เงินสด", Desc = "<b><font color='#FFB6C1'>$0</font></b>", Callback = function() end})

task.spawn(function()
    while task.wait(0.5) do
        BankBalance:SetDesc(formatMoneyWithRainbow(ATMMoney()))
        HandBalance:SetDesc(formatMoneyWithRainbow(HandMoney()))
    end
end)

PlayerTab:Divider()
PlayerTab:Section({Title = "การเคลื่อนที่"})
PlayerTab:Toggle({Title = "เดินเร็ว", Default = getgenv().walkSpeedEnabled or false, Callback = function(state) walkSpeedEnabled = state saveSettings() end})
PlayerTab:Slider({Title = "ความเร็ว", Step = 0.01, Value = {Min = 0.01, Max = 0.25, Default = getgenv().speedValue or 0.05}, Callback = function(v) speedValue = v saveSettings() end})

PlayerTab:Divider()
PlayerTab:Section({Title = "พลังไร้ขีดจำกัด"})
local NetModule = require(ReplicatedStorage.Modules.Core.Net)
local SprintModule = require(ReplicatedStorage.Modules.Game.Sprint)
PlayerTab:Toggle({
    Title = "ไม่มีขีดจำกัดพลังวิ่ง",
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
PlayerTab:Section({Title = "พลังกระโดด"})
PlayerTab:Toggle({Title = "กระโดดแรง", Default = getgenv().jumpEnabled or false, Callback = function(state)
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
    saveSettings()
end})
PlayerTab:Slider({Title = "ความสูงกระโดด", Step = 5, Value = {Min = 20, Max = 80, Default = getgenv().jumpPower or 70}, Callback = function(v) jumpPower = v saveSettings() end})

PlayerTab:Divider()
PlayerTab:Section({Title = "ระบบนั่งใต้ดิน"})
PlayerTab:Toggle({Title = "นั่งใต้ดิน (คงที่)", Default = getgenv().sitEnabled or false, Callback = function(state) toggleSitSystem(state) saveSettings() end})
PlayerTab:Slider({Title = "ความลึก", Step = 0.1, Value = {Min = -2.5, Max = -2, Default = getgenv().sitHeight or -2}, Callback = function(v) sitHeight = v saveSettings() end})

PlayerTab:Divider()
PlayerTab:Section({Title = "ป้องกันการมอง (Anti Look)"})
PlayerTab:Toggle({Title = "เปิดใช้งาน Anti Look", Default = getgenv().antiLookEnabled or false, Callback = function(state) toggleFullAntiLook(state) saveSettings() end})
PlayerTab:Slider({Title = "ความแรง", Step = 100, Value = {Min = 500, Max = 5000, Default = getgenv().shakeStrength or 2500}, Callback = function(v) setShakeStrength(v) if antiLookEnabled then toggleFullAntiLook(true) end saveSettings() end})
PlayerTab:Toggle({Title = "โหมดสุ่ม", Default = getgenv().randomPatternEnabled or false, Callback = function(state) toggleRandomPattern(state) saveSettings() end})

PlayerTab:Divider()
PlayerTab:Section({Title = "ป้องกันการตาย"})
PlayerTab:Toggle({Title = "ป้องกันการตาย", Default = getgenv().antiDeathEnabled or false, Callback = function(state) antiDeathEnabled = state if not state then exitSafeMode() end saveSettings() end})

ESPTab:Section({Title = "ESP กล่อง"})
ESPTab:Toggle({Title = "แสดงกล่อง ESP", Default = getgenv().showBoxESP or false, Callback = function(v) ShowBoxESP = v if v then for _,player in ipairs(Players:GetPlayers()) do if player~=LocalPlayer and not PlayerBoxESP[player] then createBoxESP(player) end end end saveSettings() end})
ESPTab:Dropdown({Title = "สีกล่อง", Values = {"Rainbow","Green","White","Red","Blue","Yellow"}, Default = 1, Callback = function(v) BOX_COLOR_MODE = v:lower() saveSettings() end})

ESPTab:Section({Title = "ESP ชื่อ"})
ESPTab:Toggle({Title = "แสดงชื่อ", Default = getgenv().showNameESP or false, Callback = function(v) ShowNameESP = v saveSettings() end})
ESPTab:Slider({Title = "ขนาดตัวอักษร", Step = 1, Value = {Min = 12, Max = 28, Default = getgenv().nameFontSize or 18}, Callback = function(v) nameFontSize = v saveSettings() end})

ESPTab:Section({Title = "ESP อาวุธ"})
ESPTab:Toggle({Title = "แสดงอาวุธ", Default = getgenv().showItemESP or false, Callback = function(v) ShowItemESP = v refreshAllBillboards() saveSettings() end})
ESPTab:Slider({Title = "ขนาดไอคอน", Step = 2, Value = {Min = 18, Max = 40, Default = getgenv().itemBillboardSize or 26}, Callback = function(v) itemBillboardSize = v if ShowItemESP then refreshAllBillboards() end saveSettings() end})

ESPTab:Section({Title = "ESP ไอเทมบนพื้น"})
ESPTab:Toggle({Title = "แสดงไอเทมบนพื้น", Default = getgenv().itemESPEnabled or false, Callback = function(v) getgenv().ItemESPEnabled = v saveSettings() end})
ESPTab:Slider({Title = "ระยะไกลสุด", Step = 25, Value = {Min = 50, Max = 1000, Default = getgenv().itemESPMaxDist or 500}, Callback = function(v) getgenv().ItemESPMaxDist = v saveSettings() end})

ESPTab:Divider()
ESPTab:Section({Title = "ข้ามแอนิเมชั่นกล่อง"})
ESPTab:Toggle({Title = "ข้ามแอนิเมชั่นอัตโนมัติ", Default = getgenv().autoSkipCrate or false, Callback = function(v) AutoSkipEnabled = v if v then TrySkipCrate() end saveSettings() end})
ESPTab:Button({Title = "ข้ามเดี๋ยวนี้", Callback = function() TrySkipCrate() end})

VisualTab:Section({Title = "Chams (เห็นทะลุกำแพง)"})
VisualTab:Toggle({Title = "เปิดใช้งาน Chams", Default = getgenv().chamsEnabled or false, Callback = function(v) toggleChams(v) saveSettings() end})
VisualTab:Toggle({Title = "สีรุ้ง", Default = getgenv().chamsRainbow or true, Callback = function(v) ChamsRainbow = v saveSettings() end})
VisualTab:Slider({Title = "ความโปร่งแสง", Step = 0.05, Value = {Min = 0, Max = 0.8, Default = getgenv().chamsTransparency or 0.3}, Callback = function(v) ChamsTransparency = v if ChamsEnabled then toggleChams(false) toggleChams(true) end saveSettings() end})

VisualTab:Divider()
VisualTab:Section({Title = "Tracers (เส้นเชื่อม)"})
VisualTab:Toggle({Title = "เปิดใช้งาน Tracers", Default = getgenv().tracersEnabled or false, Callback = function(v) toggleTracers(v) saveSettings() end})
VisualTab:Toggle({Title = "สีรุ้ง", Default = getgenv().tracerRainbow or true, Callback = function(v) TracerRainbow = v saveSettings() end})

VisualTab:Divider()
VisualTab:Section({Title = "Skeleton ESP (โครงกระดูก)"})
VisualTab:Toggle({Title = "เปิดใช้งาน Skeleton", Default = getgenv().skeletonEnabled or false, Callback = function(v) toggleSkeleton(v) saveSettings() end})
VisualTab:Toggle({Title = "สีรุ้ง", Default = getgenv().skeletonRainbow or true, Callback = function(v) SkeletonRainbow = v saveSettings() end})

PVPTab:Section({Title = "เล็งอัตโนมัติ"})
PVPTab:Toggle({Title = "เล็งอัตโนมัติ", Default = getgenv().silentAimEnabled or false, Callback = function(v) SilentAimEnabled = v if not v then hideFOV() CurrentTarget = nil end saveSettings() end})
PVPTab:Slider({Title = "รัศมี FOV", Step = 10, Value = {Min = 50, Max = 600, Default = getgenv().fovRadius or 200}, Callback = function(v) FOVRadius = v saveSettings() end})
PVPTab:Dropdown({Title = "เป้าหมาย", Values = {"หัว", "ลำตัว", "หน้าอก"}, Default = 1, Callback = function(v) 
    if v == "หัว" then SelectedAimPart = "Head"
    elseif v == "ลำตัว" then SelectedAimPart = "HumanoidRootPart"
    else SelectedAimPart = "UpperTorso" end
    saveSettings()
end})
PVPTab:Input({Title = "เพื่อนที่ปลอดภัย", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
    excludedPlayerNames = {}
    for name in string.gmatch(v, "%S+") do table.insert(excludedPlayerNames, name) end
    saveSettings()
end})
PVPTab:Toggle({Title = "โหมดปลอดภัยสำหรับ Admin", Default = getgenv().safeAdminEnabled or false, Callback = function(v) safeAdminEnabled = v saveSettings() end})
PVPTab:Input({Title = "รายชื่อ Admin", Placeholder = "ชื่อผู้เล่น...", Callback = function(v)
    adminPlayers = {}
    for name in string.gmatch(v, "%S+") do adminPlayers[name] = true end
    saveSettings()
end})

GunModTab:Section({Title = "ปรับแต่งปืน"})
GunModTab:Toggle({Title = "ปรับอัตโนมัติ", Default = getgenv().gunModsAutoApply or false, Callback = function(v) getgenv().GunModsAutoApply = v saveSettings() end})
GunModTab:Button({Title = "ปรับเดี๋ยวนี้", Callback = function()
    local char = LocalPlayer.Character if not char then return end
    for _, tool in ipairs(char:GetChildren()) do if tool:IsA("Tool") and isGunTool(tool) then task.spawn(applyGodGun, tool) end end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then for _, tool in ipairs(bp:GetChildren()) do if tool:IsA("Tool") and isGunTool(tool) then task.spawn(applyGodGun, tool) end end end
end})
GunModTab:Divider()
GunModTab:Slider({Title = "อัตรายิง", Step = 10, Value = {Min = 100, Max = 3000, Default = getgenv().fireRateValue or 1000}, Callback = function(v) getgenv().FireRateValue = v saveSettings() end})
GunModTab:Slider({Title = "ความแม่น", Step = 0.01, Value = {Min = 0, Max = 1, Default = getgenv().accuracyValue or 1}, Callback = function(v) getgenv().AccuracyValue = v saveSettings() end})
GunModTab:Slider({Title = "แรงดีด", Step = 0.1, Value = {Min = 0, Max = 10, Default = getgenv().recoilValue or 0}, Callback = function(v) getgenv().RecoilValue = v saveSettings() end})
GunModTab:Slider({Title = "ความทนทาน", Step = 1000, Value = {Min = 1000, Max = 999999, Default = getgenv().durabilityValue or 999999}, Callback = function(v) getgenv().DurabilityValue = v saveSettings() end})
GunModTab:Toggle({Title = "ยิงอัตโนมัติ", Default = getgenv().autoValue or true, Callback = function(v) getgenv().AutoValue = v saveSettings() end})
GunModTab:Divider()
GunModTab:Section({Title = "ปรับแต่งหมัด"})
GunModTab:Toggle({Title = "หมัดกว้าง", Default = getgenv().fistsBuffEnabled or false, Callback = function(v) FistsBuffEnabled = v checkAndModifyFists() saveSettings() end})

QuestTab:Section({Title = "จัดการเควส"})
QuestTab:Button({Title = "ล้างเควสทั้งหมด", Callback = function()
    task.spawn(function()
        local Net = createNetwork()
        if not Net then game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Error", Text = "Cannot connect", Duration = 3}) return end
        local success, questUI = pcall(function() return LocalPlayer.PlayerGui.Quests.QuestsHolder.QuestsScrollingFrame end)
        if not success or not questUI then return end
        local cleared = 0
        for _, child in pairs(questUI:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
                if pcall(function() return Net.get("claim_quest", child.Name) end) then cleared = cleared + 1 end
                task.wait(0.15)
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "เควส", Text = "ล้าง " .. cleared .. " เควส", Duration = 5})
    end)
end})

local pullAllRadius = 30
local vehicleSpeedBoost = 50
local antiRamEnabled = false
local antiRamDistance = 45
local vehicleShakeEnabled = false
local vehicleShakeConn = nil

local function findVehiclePrimary(vehicle)
    local p = vehicle.PrimaryPart
        or vehicle:FindFirstChild("PrimaryPart")
        or vehicle:FindFirstChild("Chassis")
        or vehicle:FindFirstChild("HumanoidRootPart")
        or vehicle:FindFirstChild("VehicleSeat")
        or vehicle:FindFirstChild("Body")
        or vehicle:FindFirstChild("Frame")
    if p and p:IsA("BasePart") then return p end
    for _, part in ipairs(vehicle:GetDescendants()) do
        if part:IsA("VehicleSeat") then return part end
    end
    for _, part in ipairs(vehicle:GetChildren()) do
        if part:IsA("BasePart") then return part end
    end
    return nil
end

VehicleTab:Section({Title = "ดึงรถ"})
VehicleTab:Button({Title = "ดึงรถของฉัน", Callback = function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then return end
    local myVehicles = {}
    for _, vehicle in ipairs(vehicles:GetChildren()) do
        if vehicle:IsA("Model") then
            local ownerId = vehicle:GetAttribute("OwnerUserId")
            if ownerId and ownerId == LocalPlayer.UserId then
                table.insert(myVehicles, vehicle)
            end
        end
    end
    if #myVehicles == 0 then
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ไม่พบรถของคุณ", Duration = 3})
        return
    end
    local pulled = 0
    for _, vehicle in ipairs(myVehicles) do
        local primary = findVehiclePrimary(vehicle)
        if primary then
            primary.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 4) * CFrame.Angles(0, math.rad(hrp.Orientation.Y), 0)
            pulled = pulled + 1
            task.wait(0.1)
        end
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ดึงรถของคุณ " .. pulled .. " คัน", Duration = 3})
end})

VehicleTab:Slider({Title = "รัศมีดึงรถทั้งหมด", Step = 5, Value = {Min = 10, Max = 100, Default = 30}, Callback = function(v) pullAllRadius = v end})
VehicleTab:Button({Title = "ดึงรถผู้เล่นอื่น", Callback = function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then return end
    local pulled = 0
    for _, vehicle in ipairs(vehicles:GetChildren()) do
        if vehicle:IsA("Model") then
            local ownerId = vehicle:GetAttribute("OwnerUserId")
            if ownerId == LocalPlayer.UserId then continue end
            local primary = findVehiclePrimary(vehicle)
            if primary then
                local dist = (hrp.Position - primary.Position).Magnitude
                if dist <= pullAllRadius then
                    primary.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 5) * CFrame.Angles(0, math.rad(hrp.Orientation.Y), 0)
                    pulled = pulled + 1
                    task.wait(0.05)
                end
            end
        end
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ดึงรถคนอื่น " .. pulled .. " คัน", Duration = 3})
end})

VehicleTab:Divider()
VehicleTab:Section({Title = "สั่นรถ"})
VehicleTab:Toggle({Title = "สั่นรถทุกคัน", Default = false, Callback = function(state)
    vehicleShakeEnabled = state
    if vehicleShakeConn then vehicleShakeConn:Disconnect() vehicleShakeConn = nil end
    if not state then return end
    vehicleShakeConn = RunService.Heartbeat:Connect(function()
        if not vehicleShakeEnabled then return end
        local vehicles = workspace:FindFirstChild("Vehicles")
        if not vehicles then return end
        for _, vehicle in ipairs(vehicles:GetChildren()) do
            if not vehicle:IsA("Model") then continue end
            local ownerId = vehicle:GetAttribute("OwnerUserId")
            if ownerId == LocalPlayer.UserId then continue end
            local primary = findVehiclePrimary(vehicle)
            if primary and primary:IsA("BasePart") then
                local rx = math.random(-1, 1) * 9999
                local rz = math.random(-1, 1) * 9999
                local ry = math.random(5000, 15000)
                pcall(function()
                    primary.AssemblyLinearVelocity = Vector3.new(rx, ry, rz)
                end)
            end
        end
    end)
end})

VehicleTab:Divider()
VehicleTab:Section({Title = "เพิ่มความเร็วรถ"})
VehicleTab:Slider({Title = "ความเร็ว", Step = 5, Value = {Min = 0, Max = 200, Default = 50}, Callback = function(v) vehicleSpeedBoost = v end})
VehicleTab:Toggle({Title = "เปิดใช้เพิ่มความเร็ว", Default = false, Callback = function(state)
    if state then
        local speedConn
        speedConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            local seat = char:FindFirstChild("SeatPart") or char:FindFirstChild("SeatWeld")
            if seat then
                local vehicle = seat.Parent
                while vehicle and not vehicle:IsA("Model") do vehicle = vehicle.Parent end
                if vehicle then
                    local primary = vehicle:FindFirstChild("PrimaryPart") or vehicle:FindFirstChild("Chassis") or vehicle:FindFirstChild("HumanoidRootPart")
                    if primary and primary:IsA("BasePart") then
                        local vel = primary.AssemblyLinearVelocity
                        local dir = primary.CFrame.LookVector
                        local speed = vel.Magnitude
                        if speed > 0 and speed < vehicleSpeedBoost then
                            local newVel = dir * vehicleSpeedBoost
                            primary.AssemblyLinearVelocity = Vector3.new(newVel.X, vel.Y, newVel.Z)
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

VehicleTab:Divider()
VehicleTab:Section({Title = "ป้องกันการชน"})
VehicleTab:Slider({Title = "ระยะป้องกัน", Step = 5, Value = {Min = 20, Max = 80, Default = 45}, Callback = function(v) antiRamDistance = v end})
VehicleTab:Toggle({Title = "เปิดใช้ป้องกันการชน", Default = false, Callback = function(state)
    antiRamEnabled = state
    if state then
        local antiRamConn
        antiRamConn = RunService.Heartbeat:Connect(function()
            if not antiRamEnabled then return end
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local vehicles = workspace:FindFirstChild("Vehicles")
            if not vehicles then return end
            for _, vehicle in ipairs(vehicles:GetChildren()) do
                if vehicle:IsA("Model") then
                    local ownerId = vehicle:GetAttribute("OwnerUserId")
                    if ownerId == LocalPlayer.UserId then continue end
                    local primary = findVehiclePrimary(vehicle)
                    if primary and primary:IsA("BasePart") then
                        local dist = (hrp.Position - primary.Position).Magnitude
                        if dist < antiRamDistance then
                            local dir = (primary.Position - hrp.Position).Unit
                            local force = dir * 150 + Vector3.new(0, 50, 0)
                            primary:ApplyImpulse(force)
                        end
                    end
                end
            end
        end)
        _G.AntiRamConn = antiRamConn
    else
        if _G.AntiRamConn then _G.AntiRamConn:Disconnect() _G.AntiRamConn = nil end
    end
end})

VehicleTab:Divider()
VehicleTab:Section({Title = "เครื่องมือรถ"})
VehicleTab:Button({Title = "ซ่อมรถที่ขี่", Callback = function()
    local char = LocalPlayer.Character
    if not char then return end
    local seat = char:FindFirstChild("SeatPart") or char:FindFirstChild("SeatWeld")
    if not seat then
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "คุณไม่ได้นั่งรถ", Duration = 3})
        return
    end
    local vehicle = seat.Parent
    while vehicle and not vehicle:IsA("Model") do vehicle = vehicle.Parent end
    if vehicle then
        local health = vehicle:FindFirstChild("Health")
        if health and health:IsA("NumberValue") then
            health.Value = 1000
        end
        for _, part in ipairs(vehicle:GetDescendants()) do
            if part:IsA("BasePart") then
                part:SetNetworkOwner(nil)
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ซ่อมรถเรียบร้อย", Duration = 3})
    end
end})

VehicleTab:Button({Title = "ล้างรถรอบตัว", Callback = function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then return end
    local cleared = 0
    for _, vehicle in ipairs(vehicles:GetChildren()) do
        if vehicle:IsA("Model") then
            local primary = findVehiclePrimary(vehicle)
            if primary and (primary.Position - hrp.Position).Magnitude < 15 then
                vehicle:Destroy()
                cleared = cleared + 1
                task.wait(0.05)
            end
        end
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "รถ", Text = "ล้างรถ " .. cleared .. " คัน", Duration = 3})
end})

ServerTab:Section({Title = "Server Hopper"})
ServerTab:Toggle({Title = "เปิดใช้งาน Server Hopper", Default = getgenv().serverHopperEnabled or false, Callback = function(v) toggleServerHopper(v) saveSettings() end})
ServerTab:Slider({Title = "จำนวนผู้เล่นสูงสุด", Step = 1, Value = {Min = 1, Max = 30, Default = getgenv().minPlayers or 5}, Callback = function(v) MinPlayers = v saveSettings() end})
ServerTab:Input({Title = "ค้นหาตาม Keyword", Placeholder = "คำค้นหา...", Callback = function(v) SearchKeyword = v saveSettings() end})
ServerTab:Button({Title = "กระโดดเซิร์ฟเวอร์ทันที", Callback = function() hopServer() end})

ServerTab:Divider()
ServerTab:Section({Title = "Auto Rejoin"})
ServerTab:Toggle({Title = "เปิดใช้งาน Auto Rejoin", Default = getgenv().autoRejoinEnabled or false, Callback = function(v) toggleAutoRejoin(v) saveSettings() end})

ServerTab:Divider()
ServerTab:Section({Title = "Auto Loot (ดูดของอัตโนมัติ)"})
ServerTab:Toggle({Title = "เปิดใช้งาน Auto Loot", Default = getgenv().autoLootEnabled or false, Callback = function(v) toggleAutoLoot(v) saveSettings() end})
ServerTab:Slider({Title = "ระยะดูดของ", Step = 1, Value = {Min = 5, Max = 30, Default = getgenv().lootRange or 15}, Callback = function(v) LootRange = v saveSettings() end})

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
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BloomEffect") then effect.Intensity = 0.2 end
                if effect:IsA("BlurEffect") then effect.Size = 0 end
                if effect:IsA("SunRaysEffect") then effect.Intensity = 0.1 end
                if effect:IsA("ColorCorrectionEffect") then effect.Saturation = 0.7 end
            end
            for _, v in ipairs(workspace:GetDescendants()) do
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
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BloomEffect") then effect.Intensity = 0.1 end
                if effect:IsA("BlurEffect") then effect.Size = 0 end
                if effect:IsA("SunRaysEffect") then effect.Intensity = 0 end
                if effect:IsA("ColorCorrectionEffect") then effect.Saturation = 0.5 end
            end
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 1
            for _, v in ipairs(workspace:GetDescendants()) do
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
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BloomEffect") then effect.Intensity = 0 end
                if effect:IsA("BlurEffect") then effect.Size = 0 end
                if effect:IsA("SunRaysEffect") then effect.Intensity = 0 end
                if effect:IsA("ColorCorrectionEffect") then effect.Saturation = 0.3 end
            end
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 1
            for _, v in ipairs(workspace:GetDescendants()) do
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
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BloomEffect") then effect.Intensity = 1 end
                if effect:IsA("BlurEffect") then effect.Size = 24 end
                if effect:IsA("SunRaysEffect") then effect.Intensity = 1 end
                if effect:IsA("ColorCorrectionEffect") then effect.Saturation = 0 end
            end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Decal") then v.Transparency = 0 end
            end
        end)
    end
end

CustomTab:Section({Title = "เพิ่ม FPS"})
CustomTab:Toggle({Title = "เพิ่ม FPS", Default = false, Callback = function(state) toggleFPSBooster(state) end})
CustomTab:Dropdown({Title = "โหมด", Values = {"โหมด 1", "โหมด 2", "โหมด 3"}, Default = 1, Callback = function(v)
    fpsBoosterMode = v == "โหมด 1" and 1 or v == "โหมด 2" and 2 or 3
    if fpsBoosterEnabled then applyFPSBooster(fpsBoosterMode) end
end})

CustomTab:Divider()
CustomTab:Section({Title = "เอฟเฟกต์ PigHub"})
local PigHubEffectEnabled = false
local effectBalls = {}
local effectConnection = nil
local BALL_COUNT = 8
local ORBIT_RADIUS = 5
local ORBIT_SPEED = 2.5

local function createEffectBalls()
    for _, b in ipairs(effectBalls) do pcall(function() b:Destroy() end) end
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
        ball.Name = "PigHubBall_" .. i
        ball.Parent = workspace
        table.insert(effectBalls, ball)
    end
end

local function removeEffectBalls()
    if effectConnection then effectConnection:Disconnect() effectConnection = nil end
    for _, b in ipairs(effectBalls) do pcall(function() b:Destroy() end) end
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

CustomTab:Toggle({Title = "เอฟเฟกต์ PigHub", Default = false, Callback = function(state) togglePigHubEffect(state) end})
CustomTab:Slider({Title = "รัศมีวงโคจร", Step = 0.5, Value = {Min = 2, Max = 12, Default = 5}, Callback = function(v) ORBIT_RADIUS = v end})
CustomTab:Slider({Title = "ความเร็ววงโคจร", Step = 0.5, Value = {Min = 0.5, Max = 8, Default = 2.5}, Callback = function(v) ORBIT_SPEED = v end})

loadSettings()

if getgenv().walkSpeedEnabled then walkSpeedEnabled = true end
if getgenv().sitEnabled then toggleSitSystem(true) end
if getgenv().antiLookEnabled then toggleFullAntiLook(true) end
if getgenv().antiDeathEnabled then antiDeathEnabled = true end
if getgenv().chamsEnabled then toggleChams(true) end
if getgenv().tracersEnabled then toggleTracers(true) end
if getgenv().skeletonEnabled then toggleSkeleton(true) end
if getgenv().serverHopperEnabled then toggleServerHopper(true) end
if getgenv().autoRejoinEnabled then toggleAutoRejoin(true) end
if getgenv().autoLootEnabled then toggleAutoLoot(true) end
if getgenv().showBoxESP then ShowBoxESP = true end
if getgenv().showNameESP then ShowNameESP = true end
if getgenv().showItemESP then ShowItemESP = true end
if getgenv().itemESPEnabled then getgenv().ItemESPEnabled = true end
if getgenv().silentAimEnabled then SilentAimEnabled = true end
if getgenv().gunModsAutoApply then getgenv().GunModsAutoApply = true end
if getgenv().fistsBuffEnabled then FistsBuffEnabled = true checkAndModifyFists() end

task.spawn(function()
    while task.wait(0.1) do
        if ChamsEnabled then updateChamsColors() end
        if TracersEnabled then updateTracers() end
        if SkeletonEnabled then updateSkeleton() end
    end
end)

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

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "PIG HUB ULTIMATE", Text = "โหลดสำเร็จ!", Duration = 4})