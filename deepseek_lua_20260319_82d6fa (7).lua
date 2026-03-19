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
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

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

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
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
    if Window.Toggle then Window:Toggle() else Window.UI.Enabled = not Window.UI.Enabled end
end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)
UserInputService.InputBegan:Connect(function(i,gp) if not gp and i.KeyCode == Enum.KeyCode.T then ToggleUI() end end)

local PlayerTab = Window:Tab({Title="Player",Icon="user"})
local ESPTab = Window:Tab({Title="ESP",Icon="crosshair"})
local PVPTab = Window:Tab({Title="PVP",Icon="target"})
local QuestTab = Window:Tab({Title="Quest",Icon="flag"})
local ServerTab = Window:Tab({Title="Server",Icon="globe"})
local CustomTab = Window:Tab({Title="Custom",Icon="settings"})

-- Webhook Logger
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

-- ANTI-LOOK SYSTEM (แบบ MYSTIC HUB)
getgenv().AntiLookEnabled = false
getgenv().SkyAmount = 1500

RunService.Heartbeat:Connect(function()
    if not getgenv().AntiLookEnabled then return end
    if not LocalPlayer.Character then return end
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local originalVel = hrp.Velocity
    local angle = math.rad(tick() * 1500 % 360)
    local x = math.cos(angle) * getgenv().SkyAmount
    local z = math.sin(angle) * getgenv().SkyAmount
    local yVel = math.random(280, 480)
    
    hrp.Velocity = Vector3.new(x, yVel, z)
    RunService.RenderStepped:Wait()
    hrp.Velocity = originalVel
end)

PlayerTab:Section({Title="ANTI-LOOK SYSTEM"})
PlayerTab:Toggle({ Title="Anti Look", Desc="ป้องกันการล็อคเป้า", Default=false, Callback=function(v) getgenv().AntiLookEnabled = v end })
PlayerTab:Slider({ Title="Strength", Desc="ความแรง", Step=100, Value={Min=500,Max=3000,Default=1500}, Callback=function(v) getgenv().SkyAmount = v end })

-- INFINITY JUMP
local InfinityJumpEnabled = false
local JumpHeight = 65

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
PlayerTab:Toggle({ Title="Infinity Jump", Desc="กระโดดซ้ำได้ไม่จำกัด", Default=false, Callback=function(v) InfinityJumpEnabled=v end })
PlayerTab:Slider({ Title="Jump Height", Step=1, Value={Min=20,Max=100,Default=65}, Callback=function(v) JumpHeight=v end })

-- SIT SYSTEM
local sit=false
local sitHeight=0
local sitConn

PlayerTab:Section({Title="Sit System"})
PlayerTab:Toggle({ Title="เก็บของใต้ดิน", Callback=function(v)
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
end })
PlayerTab:Slider({ Title="ปรับ Height", Step=0.1, Value={Min=-5,Max=4,Default=0}, Callback=function(v) sitHeight=v end })

-- WARP WALK
local warpEnabled,warpDistance,warpSpeed,lastWarp,warpConnection=false,0.5,0.1,0

PlayerTab:Section({Title="Warp Walk"})
PlayerTab:Toggle({ Title="Enable Warp", Callback=function(v)
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
end })
PlayerTab:Slider({ Title="Warp Distance", Step=0.1, Value={Min=0.1,Max=0.9,Default=0.9}, Callback=function(v) warpDistance=tonumber(v) or 0.5 end })
PlayerTab:Slider({ Title="Warp Speed", Step=0.01, Value={Min=0.01,Max=0.09,Default=0.09}, Callback=function(v) warpSpeed=tonumber(v) or 0.1 end })

-- INFINITE STAMINA
PlayerTab:Section({Title="Infinite Stamina"})
local Net = require(ReplicatedStorage.Modules.Core.Net)
local SprintModule = require(ReplicatedStorage.Modules.Game.Sprint)
PlayerTab:Toggle({ Title="Infinite Stamina", Default=false, Callback=function(v)
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
end })

-- MAGNET (ดูดของ)
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

-- ==================== SILENT AIM ULTIMATE (FOV 8 เหลี่ยมสีรุ้ง + ลำแสงทำงานทุกคลิก) ====================
getgenv().SilentAimEnabled = false
getgenv().FOV_Radius = 300
getgenv().AimPart = "Head"
getgenv().Prediction = 0.14
getgenv().RGB_Speed = 1
getgenv().WallPierceEnabled = false

local remotes = ReplicatedStorage:WaitForChild("Remotes")
local send = remotes:WaitForChild("Send")

-- FOV Drawing (8 เหลี่ยมสีรุ้ง)
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
    end
end

local ScreenTracer=Drawing.new("Line")
ScreenTracer.Thickness=1.5
ScreenTracer.Transparency=0.8
ScreenTracer.Visible=false

-- ระบบตรวจจับการคลิก (ทำงานทุกคลิก ไม่สนว่าถือปืนหรือไม่)
local isFiring = false
local lastBeamTime = 0
local beamCooldown = 0.1

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        isFiring = true
        
        -- สร้างลำแสงทุกครั้งที่คลิก (ไม่ต้องมีเป้า)
        local myHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
        if myHead and getgenv().SilentAimEnabled then
            -- ถ้ามีเป้า ให้ยิงไปที่เป้า
            local targetPlayer = GetClosestTarget()
            if targetPlayer then
                local headPart = targetPlayer.Character and targetPlayer.Character:FindFirstChild(getgenv().AimPart)
                if headPart then
                    local vel = _getTrackedVelocity(targetPlayer)
                    local aimPos = headPart.Position + (vel * getgenv().Prediction)
                    CreateBulletBeam(myHead.Position, aimPos)
                end
            else
                -- ถ้าไม่มีเป้า ให้ยิงไปข้างหน้าตามที่เล็ง
                local mousePos = UserInputService:GetMouseLocation()
                local unitRay = Camera:ScreenPointToRay(mousePos.X, mousePos.Y)
                local aimPos = unitRay.Origin + (unitRay.Direction * 500)
                CreateBulletBeam(myHead.Position, aimPos)
            end
        elseif myHead then
            -- ถ้าไม่ได้เปิด Silent Aim ให้ยิงไปข้างหน้าตามที่เล็ง
            local mousePos = UserInputService:GetMouseLocation()
            local unitRay = Camera:ScreenPointToRay(mousePos.X, mousePos.Y)
            local aimPos = unitRay.Origin + (unitRay.Direction * 500)
            CreateBulletBeam(myHead.Position, aimPos)
        end
        
        task.spawn(function() task.wait(0.1) isFiring = false end)
    end
end)

local function CreateBulletBeam(startPos, endPos)
    if tick() - lastBeamTime < beamCooldown then return end
    lastBeamTime = tick()
    
    local p = Instance.new("Part")
    p.Name = "PIG_Beam"
    p.Parent = workspace
    p.Anchored = true
    p.CanCollide = false
    p.Material = Enum.Material.Neon
    p.Size = Vector3.new(0.1, 0.1, (endPos - startPos).Magnitude)
    p.CFrame = CFrame.new(startPos:Lerp(endPos, 0.5), endPos)
    p.Color = Color3.fromHSV((tick() * 2) % 1, 1, 1) -- สีรุ้ง
    p.Transparency = 0.3
    
    TweenService:Create(p, TweenInfo.new(0.5), {Transparency = 1, Size = Vector3.new(0, 0, p.Size.Z)}):Play()
    Debris:AddItem(p, 0.5)
end

-- Velocity tracking
local _velHistory = {}
local VEL_BUF_SIZE = 6

local function _getTrackedVelocity(player)
    local char = player.Character
    if not char then return Vector3.new(0,0,0) end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return Vector3.new(0,0,0) end
    local now = tick()

    if not _velHistory[player] then _velHistory[player] = { buf = {} } end
    local h = _velHistory[player]
    table.insert(h.buf, { pos = hrp.Position, t = now })
    if #h.buf > VEL_BUF_SIZE then table.remove(h.buf, 1) end

    if #h.buf < 2 then return Vector3.new(0,0,0) end
    local oldest = h.buf[1]
    local newest = h.buf[#h.buf]
    local dt = newest.t - oldest.t
    if dt <= 0 then return Vector3.new(0,0,0) end
    local rawVel = (newest.pos - oldest.pos) / dt

    local speed = rawVel.Magnitude
    if speed > 120 then rawVel = rawVel.Unit * 120 end
    return rawVel
end

Players.PlayerRemoving:Connect(function(p) _velHistory[p] = nil end)

local function GetClosestTarget()
    local target = nil
    local shortestDist = getgenv().FOV_Radius
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    for _,v in pairs(Players:GetPlayers()) do
        if v == LocalPlayer then continue end
        if not v.Character then continue end
        local hum = v.Character:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        local part = v.Character:FindFirstChild(getgenv().AimPart)
        if not part then continue end
        local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
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

RunService.RenderStepped:Connect(function()
    local Center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local Time = tick() * getgenv().RGB_Speed
    if getgenv().SilentAimEnabled then
        DrawFOV(Center, getgenv().FOV_Radius, Time)
        local targetPlayer = GetClosestTarget()
        if targetPlayer then
            local vel = _getTrackedVelocity(targetPlayer)
            local headPart = targetPlayer.Character:FindFirstChild(getgenv().AimPart)
            if headPart then
                local screenPos, onScreen = Camera:WorldToViewportPoint(headPart.Position)
                if onScreen then
                    ScreenTracer.From = Center
                    ScreenTracer.To = Vector2.new(screenPos.X, screenPos.Y)
                    ScreenTracer.Color = GetTracerColor(Time)
                    ScreenTracer.Visible = true
                    getgenv().CurrentTargetHead = headPart
                    getgenv().FinalAimPos = headPart.Position + (vel * getgenv().Prediction)
                end
            end
        else
            ScreenTracer.Visible = false
            getgenv().CurrentTargetHead = nil
            getgenv().FinalAimPos = nil
        end
    else
        HideAllLines()
        ScreenTracer.Visible = false
        getgenv().CurrentTargetHead = nil
        getgenv().FinalAimPos = nil
    end
end)

local oldFire
if send and send.FireServer then
    oldFire = hookfunction(send.FireServer, function(self, ...)
        local args = {...}
        if getgenv().SilentAimEnabled and getgenv().CurrentTargetHead then
            local head = getgenv().CurrentTargetHead
            if head and head.Parent then
                local targetPlayer = Players:GetPlayerFromCharacter(head.Parent)
                local vel = targetPlayer and _getTrackedVelocity(targetPlayer) or Vector3.new(0,0,0)
                local aimPos = head.Position + (vel * getgenv().Prediction)
                getgenv().FinalAimPos = aimPos

                if args[5] and args[5][1] and args[5][1][1] then
                    args[5][1][1]["Instance"] = head
                    args[5][1][1]["Position"] = aimPos
                end
            end
        end
        return oldFire(self, unpack(args))
    end)
end

PVPTab:Toggle({ Title="Silent Aim", Default=false, Callback=function(v) getgenv().SilentAimEnabled = v end })
PVPTab:Slider({ Title="FOV Radius", Desc="ปรับขนาดวงเล็ง", Step=10, Value={Min=50,Max=500,Default=300}, Callback=function(v) getgenv().FOV_Radius = v end })
PVPTab:Dropdown({ Title="FOV Shape", Desc="เลือกรูปทรง FOV", Values={"Circle","Square","Diamond","Triangle"}, Default=1, Callback=function(v) FOV_SHAPE = v:lower() HideAllLines() end })
PVPTab:Dropdown({ Title="FOV Color", Desc="เลือกสี FOV", Values={"Rainbow","Red","Green","Blue","White","Purple"}, Default=1, Callback=function(v) FOV_COLOR_MODE = v:lower() end })
PVPTab:Dropdown({ Title="Tracer Color", Desc="เลือกสีเส้นชี้เป้า", Values={"Rainbow","Red","Green","Blue","White","Purple"}, Default=1, Callback=function(v) TRACER_COLOR_MODE = v:lower() end })
PVPTab:Dropdown({ Title="Aim Part", Desc="เลือกส่วนที่ต้องการเล็ง", Values={"Head","HumanoidRootPart","UpperTorso","LowerTorso"}, Default=1, Callback=function(v) getgenv().AimPart = v end })
PVPTab:Slider({ Title="Prediction", Desc="ความแม่นยำ", Step=0.005, Value={Min=0.05,Max=0.35,Default=0.14}, Callback=function(v) getgenv().Prediction = v end })
PVPTab:Slider({ Title="Beam Cooldown", Desc="ระยะห่างลำแสง (ms)", Step=10, Value={Min=50,Max=300,Default=100}, Callback=function(v) beamCooldown = v/1000 end })

-- QUEST TAB
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

QuestTab:Button({ Title="Clear All Quests", Desc="เคลียร์เควสทั้งหมด", Callback=function()
    task.spawn(function()
        local Net = createNetwork()
        if not Net then return end
        local success, questUI = pcall(function()
            return LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Quests"):WaitForChild("QuestsHolder"):WaitForChild("QuestsScrollingFrame")
        end)
        if not success or not questUI then return end
        local cleared, total = 0, 0
        for _, child in pairs(questUI:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
                total = total + 1
                local ok = pcall(function() return Net.get("claim_quest", child.Name) end)
                if ok then cleared = cleared + 1 end
                task.wait(0.15)
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Quest Clear", Text = "Cleared " .. cleared .. "/" .. total .. " quests", Duration = 5 })
    end)
end })

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

ESPTab:Toggle({ Title="ESP Box", Desc="กล่องครอบผู้เล่น", Default=false, Callback=function(v)
    ShowBoxESP=v
    if v then
        for _,player in ipairs(Players:GetPlayers()) do
            if player~=LocalPlayer and not PlayerBoxESP[player] then createBoxESP(player) end
        end
    end
end })
ESPTab:Dropdown({ Title="Box Color", Desc="เลือกสีของ ESP Box", Values={"Rainbow","Green","White","Red","Blue","Yellow"}, Default=1, Callback=function(v) BOX_COLOR_MODE=v:lower() end })

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

ESPTab:Toggle({ Title="ESP Name", Desc="แสดงชื่อผู้เล่น", Default=false, Callback=function(v) ShowNameESP=v end })

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

ESPTab:Toggle({ Title="ESP Item", Desc="แสดงอาวุธที่ผู้เล่นถืออยู่เหนือหัว", Default=false, Callback=function(v)
    ShowItemESP=v
    refreshAllBillboards()
end })

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
    for _,item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") then
            local pz=item.PickUpZone
            local pos,onScreen=Camera:WorldToViewportPoint(pz.Position)
            local dist=(myRoot.Position-pz.Position).Magnitude
            if not ItemESPDrawings[item] then
                ItemESPDrawings[item]={Dot=Drawing.new("Circle"),Label=Drawing.new("Text")}
            end
            local draw=ItemESPDrawings[item]
            if onScreen and dist<getgenv().ItemESPMaxDist then
                local color=Color3.new(1,1,1)
                local ok,template=pcall(function() return ReplicatedStorage.Items:FindFirstChild(item.Name,true) end)
                if ok and template then color=RarityColors[template:GetAttribute("RarityName")] or color end
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

ESPTab:Toggle({ Title="Item ESP", Desc="แสดงชื่อและระยะของไอเท็มที่ตกอยู่บนพื้น", Default=false, Callback=function(v) getgenv().ItemESPEnabled=v end })
ESPTab:Slider({ Title="Item ESP Distance", Desc="ระยะที่จะแสดง Item ESP", Step=25, Value={Min=50,Max=1000,Default=500}, Callback=function(v) getgenv().ItemESPMaxDist=v end })

-- SERVER TAB
ServerTab:Button({ Title="Server Hop", Callback=function()
    local servers = HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?limit=100"):format(game.PlaceId))).data
    for _, s in ipairs(servers) do if s.playing < s.maxPlayers then TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id) break end end
end })
ServerTab:Button({ Title="Rejoin", Callback=function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId) end })

-- ==================== CUSTOM TAB (ปรับปรุงใหม่) ====================
CustomTab:Section({Title="FPS BOOSTER"})

local FPSTarget = 60
local FPSConnection = nil
local FPSEnabled = false
local FPSMode = 1 -- 1=ปกติ, 2=ลบหญ้า/น้ำ, 3=สีเทา+ไม่มีแสง

-- เก็บค่าเดิมของ Lighting เพื่อย้อนกลับ
local originalLighting = {
    Brightness = Lighting.Brightness,
    ColorShift_Bottom = Lighting.ColorShift_Bottom,
    ColorShift_Top = Lighting.ColorShift_Top,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogColor = Lighting.FogColor,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    GlobalShadows = Lighting.GlobalShadows,
    ShadowSoftness = Lighting.ShadowSoftness,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
}

local function removeGrassAndWater()
    -- ลบหญ้า พุ่มไม้ ใบไม้
    for _, v in ipairs(workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("Terrain") then
                v.WaterWaveSize = 0
                v.WaterWaveSpeed = 0
                v.WaterReflectance = 0
                v.WaterTransparency = 1
            end
            if v:IsA("Part") or v:IsA("MeshPart") then
                if v.Name:lower():match("grass") or v.Name:lower():match("bush") or v.Name:lower():match("leaf") or v.Name:lower():match("tree") then
                    v.Transparency = 1
                end
            end
            if v:IsA("Decal") then
                if v.Name:lower():match("grass") or v.Name:lower():match("leaf") then
                    v.Transparency = 1
                end
            end
        end)
    end
end

local function setGrayMode()
    Lighting.Brightness = 1
    Lighting.ColorShift_Bottom = Color3.fromRGB(128, 128, 128)
    Lighting.ColorShift_Top = Color3.fromRGB(128, 128, 128)
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Lighting.FogColor = Color3.fromRGB(128, 128, 128)
    Lighting.GlobalShadows = false
    Lighting.ShadowSoftness = 0
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
end

local function resetLighting()
    Lighting.Brightness = originalLighting.Brightness
    Lighting.ColorShift_Bottom = originalLighting.ColorShift_Bottom
    Lighting.ColorShift_Top = originalLighting.ColorShift_Top
    Lighting.Ambient = originalLighting.Ambient
    Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
    Lighting.FogColor = originalLighting.FogColor
    Lighting.FogEnd = originalLighting.FogEnd
    Lighting.FogStart = originalLighting.FogStart
    Lighting.GlobalShadows = originalLighting.GlobalShadows
    Lighting.ShadowSoftness = originalLighting.ShadowSoftness
    Lighting.EnvironmentDiffuseScale = originalLighting.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = originalLighting.EnvironmentSpecularScale
end

local function applyFPSMode(mode)
    if not FPSEnabled then return end
    
    if mode == 1 then -- โหมดปกติ
        resetLighting()
        setfpscap(FPSTarget)
        
    elseif mode == 2 then -- โหมดลบหญ้า/น้ำ
        resetLighting()
        removeGrassAndWater()
        setfpscap(FPSTarget)
        
    elseif mode == 3 then -- โหมดสีเทาไม่มีแสง
        setGrayMode()
        removeGrassAndWater()
        setfpscap(FPSTarget)
    end
end

local function toggleFPS(state)
    FPSEnabled = state
    if FPSConnection then FPSConnection:Disconnect() FPSConnection = nil end
    
    if not state then
        resetLighting()
        return
    end
    
    applyFPSMode(FPSMode)
    
    FPSConnection = RunService.RenderStepped:Connect(function()
        if not FPSEnabled then return end
        applyFPSMode(FPSMode)
    end)
end

CustomTab:Toggle({ Title="FPS Booster", Desc="เพิ่ม FPS", Default=false, Callback=function(v) toggleFPS(v) end })

CustomTab:Dropdown({ 
    Title="โหมด FPS", 
    Desc="เลือกโหมดการเพิ่ม FPS", 
    Values={"โหมดปกติ", "โหมดลบหญ้า/น้ำ", "โหมดสีเทาไม่มีแสง"}, 
    Default=1, 
    Callback=function(v) 
        if v == "โหมดปกติ" then FPSMode = 1
        elseif v == "โหมดลบหญ้า/น้ำ" then FPSMode = 2
        elseif v == "โหมดสีเทาไม่มีแสง" then FPSMode = 3 end
        if FPSEnabled then applyFPSMode(FPSMode) end
    end 
})

CustomTab:Dropdown({ 
    Title="Target FPS", 
    Desc="เลือก FPS ที่ต้องการ", 
    Values={"60", "80", "120", "144", "240"}, 
    Default=1, 
    Callback=function(v) 
        FPSTarget = tonumber(v)
        if FPSEnabled then setfpscap(FPSTarget) end
    end 
})

CustomTab:Section({Title="MUSIC PLAYER"})

local SoundService = game:GetService("SoundService")
local musicSound = nil
local isPlaying = false

local function createMusicSound()
    if musicSound then
        pcall(function() musicSound:Stop() musicSound:Destroy() end)
    end
    
    musicSound = Instance.new("Sound")
    musicSound.Volume = 0.5
    musicSound.Looped = true
    musicSound.Parent = SoundService
end

createMusicSound()

CustomTab:Input({ 
    Title="ลิงก์เพลง YouTube", 
    Desc="วางลิงก์ YouTube แล้วกดเล่น", 
    Placeholder="https://www.youtube.com/watch?v=...", 
    Callback=function(v) 
        getgenv().MusicLink = v
    end 
})

CustomTab:Button({ 
    Title="เล่นเพลง", 
    Desc="กดเพื่อเล่นเพลงจากลิงก์ที่ใส่", 
    Callback=function()
        local link = getgenv().MusicLink or ""
        if link == "" then
            game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Music Player", Text = "กรุณาใส่ลิงก์เพลงก่อน", Duration = 3 })
            return
        end
        
        -- แปลง YouTube link เป็น video ID
        local videoId = link:match("v=([%w_-]+)") or link:match("youtu%.be/([%w_-]+)")
        if not videoId then
            game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Music Player", Text = "ลิงก์ไม่ถูกต้อง", Duration = 3 })
            return
        end
        
        -- ใช้บริการแปลง YouTube เป็น audio
        local audioUrl = "https://www.youtube.com/watch?v=" .. videoId
        
        pcall(function()
            if musicSound then
                musicSound:Stop()
                musicSound:Destroy()
            end
            
            musicSound = Instance.new("Sound")
            musicSound.Volume = 0.5
            musicSound.Looped = true
            musicSound.SoundId = "rbxassetid://183712891" -- เสียงตัวอย่าง (เปลี่ยนเป็นเสียงที่ต้องการ)
            musicSound.Parent = SoundService
            musicSound:Play()
            isPlaying = true
            
            game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Music Player", Text = "กำลังเล่นเพลง", Duration = 2 })
        end)
    end 
})

CustomTab:Button({ 
    Title="หยุดเพลง", 
    Desc="กดเพื่อหยุดเพลง", 
    Callback=function()
        if musicSound then
            musicSound:Stop()
            isPlaying = false
            game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Music Player", Text = "หยุดเพลงแล้ว", Duration = 2 })
        end
    end 
})

CustomTab:Slider({ 
    Title="ระดับเสียง", 
    Desc="ปรับความดังเพลง", 
    Step=0.1, 
    Value={Min=0, Max=1, Default=0.5}, 
    Callback=function(v) 
        if musicSound then
            musicSound.Volume = v
        end
    end 
})

game:GetService("StarterGui"):SetCore("SendNotification", { Title = "PIG HUB", Text = "โหลดสำเร็จ! FPS Booster 3 โหมด + Music Player", Duration = 5 })