--[[
    PIG HUB - BLOCK SPIN
    รวมทุกระบบครบถ้วน 100%
    UI โดย WindUI + หน้าโหลด PIG HUB
]]

-- ==================== หน้าโหลด PIG HUB ====================
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

-- ==================== Services ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local Workspace = game:GetService("Workspace")
local ContextActionService = game:GetService("ContextActionService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- ==================== โหลด WindUI ====================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "PIG HUB - BLOCK SPIN",
    Icon = "rbxassetid://120437295686483",
    Author = "PIG TEAM",
    Folder = "PIG HUB",
    Size = UDim2.fromOffset(650, 500),
    MinSize = Vector2.new(600, 400),
    MaxSize = Vector2.new(900, 600),
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

-- ปุ่ม Toggle UI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "WindUI_Toggle"
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
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
UserInputService.InputBegan:Connect(function(i, gp) 
    if not gp and i.KeyCode == Enum.KeyCode.T then 
        ToggleUI() 
    end 
end)

-- ==================== FPS Counter ====================
local FPSGui = Instance.new("ScreenGui")
FPSGui.Name = "FPSCounter"
FPSGui.Parent = CoreGui
FPSGui.ResetOnSpawn = false
FPSGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local FPSFrame = Instance.new("Frame")
FPSFrame.Size = UDim2.new(0, 100, 0, 40)
FPSFrame.Position = UDim2.new(0, 10, 0, 10)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0.5
FPSFrame.BorderSizePixel = 0
FPSFrame.Parent = FPSGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = FPSFrame

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(1, 0, 1, 0)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: 60"
FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSLabel.TextScaled = true
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.Parent = FPSFrame

local fpsShowEnabled = true
local frameCount = 0
local lastTime = tick()
local fps = 60

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        fps = frameCount
        frameCount = 0
        lastTime = currentTime
        if fpsShowEnabled then
            FPSLabel.Text = "FPS: " .. fps
            -- เปลี่ยนสีตาม FPS
            if fps >= 60 then
                FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            elseif fps >= 30 then
                FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            else
                FPSLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
    FPSGui.Enabled = fpsShowEnabled
end)

-- ==================== ตัวแปรทั้งหมด ====================
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Util = require(ReplicatedStorage.Modules.Core.Util)
local BuyPromptUI = require(ReplicatedStorage.Modules.Game.UI.BuyPromptUI)
local EmotesUI = require(ReplicatedStorage.Modules.Game.Emotes.EmotesUI)
local EmotesList = require(ReplicatedStorage.Modules.Game.Emotes.EmotesList)
local CoreUI = require(ReplicatedStorage.Modules.Core.UI)
local CharModule = require(ReplicatedStorage.Modules.Core.Char)
local ItemsFolder = ReplicatedStorage:WaitForChild("Items")
local MeleeFolder = ItemsFolder:WaitForChild("melee")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Client = Players.LocalPlayer
local item_drawings = {}
local droppedItems = workspace:WaitForChild("DroppedItems")

local ConfigManager = Window.ConfigManager
local myConfig = ConfigManager:CreateConfig("PigHubConfig")

local Remote
pcall(function()
    Remote = ReplicatedStorage:WaitForChild("Remotes", 5):WaitForChild("Send", 5)
end)

-- Silent Aim
local SilentAimEnabled = false
local SilentAimAttachEnabled = false
local FOVRadius = 120
local CurrentTarget = nil
local SilentFOVCircle = nil
local Tracer = Drawing.new("Line")
Tracer.Thickness = 1
Tracer.Color = Color3.fromRGB(255, 50, 50)
Tracer.Transparency = 1
Tracer.Visible = false
local TracerESP = nil

-- FOV แปดเหลี่ยมสีรุ้ง
local RainbowFOV = Drawing.new("Circle")
RainbowFOV.Visible = false
RainbowFOV.Thickness = 2
RainbowFOV.NumSides = 8  -- แปดเหลี่ยม
RainbowFOV.Filled = false
RainbowFOV.Transparency = 1
RainbowFOV.Radius = FOVRadius
RainbowFOV.Color = Color3.fromRGB(255, 0, 0)

-- สีรุ้งสำหรับ FOV
local hue = 0
RunService.RenderStepped:Connect(function()
    if RainbowFOV.Visible then
        hue = (hue + 0.01) % 1
        RainbowFOV.Color = Color3.fromHSV(hue, 1, 1)
        RainbowFOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        RainbowFOV.Radius = FOVRadius
    end
end)

-- ESP
local espPlayers = {}
local nameESPEnabled = false
local distanceESPEnabled = false
local healthESPEnabled = false
local excludedPlayerNames = {}

-- Movement (ลบ Fly ออก)
local walkSpeedEnabled = false
local speedValue = 0.05
local teleportActive = false
local featureEnabled = false
local lockedY = nil
local maxHeight = 10
local startY = nil
local moveConnection = nil

-- Auto Attack / รบเหงา
local hookEnabled = false
local autoFarmEnabled = false
local farmRange = 30
local attackKey = "E"
local useSkills = false
local collectDrops = false
local currentTargetMob = nil
local clickCount = 0
local fastFinishEnabled = false
local Active = false
local BringConnection = nil
local holdTime = 1
local scanInterval = 0.4
local flickering = false
local undergroundBaseCFrame = nil
local getgenv = getgenv or function() return _G end
getgenv().Sky = false
getgenv().SkyAmount = 1500
local AutoSkipEnabled = false
local sucking = false
local lastPickupTimes = {}
local DROP_DEPTH = -55
local MOVE_RADIUS = 30
local FLICKER_RATE = 0.1
local AutoRespawnEnabled = false
local WallShootEnabled = false
local ShootEnabled = false
local ChckEnabled = false
local scanRadius = 20
local localEventCounter = 0
local localFuncCounter = 0
local AutoSprintEnabled = false

-- Weapon ESP
local RARITY_COLORS = {
    ["Common"] = Color3.fromRGB(255, 255, 255),
    ["Uncommon"] = Color3.fromRGB(99, 255, 52),
    ["Rare"] = Color3.fromRGB(51, 170, 255),
    ["Epic"] = Color3.fromRGB(237, 44, 255),
    ["Legendary"] = Color3.fromRGB(255, 150, 0),
    ["Omega"] = Color3.fromRGB(255, 20, 51)
}
local WeaponDB = {}
local BillboardCache = {}
local ESPEnabled = false
local ESPConnection = nil
local FistsBuffEnabled = false
local OriginalValues = {}
local BOX_SIZE_SCALE = 100
local playerHighlights = {}
local highlightEnabled = false

-- Gun Mods
getgenv().FireRateValue = 1000
getgenv().AccuracyValue = 1
getgenv().RecoilValue = 0
getgenv().Durability = 999999999
getgenv().Auto = true
getgenv().automatic = true
getgenv().AutoValue = true
getgenv().GunModsAutoApply = false
getgenv().ReloadValue = 0.1

-- Counter
local CounterTable
pcall(function()
    for _, Obj in ipairs(getgc(true)) do
        if typeof(Obj) == "table" and rawget(Obj, "event") and rawget(Obj, "func") then
            CounterTable = Obj
            break
        end
    end
end)

-- ==================== ฟังก์ชันพื้นฐาน ====================

local function getPing()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    if not gui then return 0.2 end
    local stats = gui:FindFirstChild("NetworkStats")
    if not stats then return 0.2 end
    local pingLabel = stats:FindFirstChild("PingLabel")
    if not pingLabel then return 0.2 end
    local text = pingLabel.Text
    if typeof(text) ~= "string" then return 0.2 end
    local num = tonumber(text:match("%d+"))
    if not num then return 0.2 end
    local ping = num / 1000
    if ping < 0 or ping > 2 then ping = 0.2 end
    return ping
end

local function isPlayerExcluded(playerName)
    for _, excludedName in ipairs(excludedPlayerNames) do
        if excludedName ~= "" and string.find(string.lower(playerName), string.lower(excludedName)) then
            return true
        end
    end
    return false
end

local function getClosestTarget()
    local closest = nil
    local shortestDistance = FOVRadius
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if head and humanoid and humanoid.Health > 0 and hrp then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local screenVector = Vector2.new(screenPos.X, screenPos.Y)
                    local distanceFromCenter = (screenVector - center).Magnitude
                    if distanceFromCenter <= FOVRadius and not isPlayerExcluded(player.Name) then
                        if distanceFromCenter < shortestDistance then
                            shortestDistance = distanceFromCenter
                            closest = player
                        end
                    end
                end
            end
        end
    end
    return closest
end

local function predictPosition(head, hrp)
    if not head then return Vector3.zero end
    local ping = getPing()
    local vel = (hrp and hrp.AssemblyLinearVelocity) or Vector3.zero
    return head.Position + (vel * ping * 1.21)
end

local function isBehindWall(startPos, endPos)
    if not startPos or not endPos then return false end
    local direction = endPos - startPos
    if direction.Magnitude < 1 then return false end
    local ignoreList = {}
    local char = LocalPlayer.Character
    if char then table.insert(ignoreList, char) end
    local tgtChar = CurrentTarget and CurrentTarget.Character
    if tgtChar then table.insert(ignoreList, tgtChar) end
    local raycastResult = workspace:Raycast(startPos, direction, RaycastParams.new())
    if not raycastResult then return false end
    local hitPart = raycastResult.Instance
    return hitPart and not table.find(ignoreList, hitPart.Parent)
end

local function setupCharacter(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
    if moveConnection then pcall(function() moveConnection:Disconnect() end) end
    moveConnection = RunService.RenderStepped:Connect(function()
        if walkSpeedEnabled and Humanoid and HumanoidRootPart then
            if Humanoid.MoveDirection.Magnitude > 0 then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + (Humanoid.MoveDirection.Unit * speedValue)
            end
        end
    end)
end

local function isDowned()
    local hum = CharModule.get_hum()
    if not hum then return false end
    if hum.Health <= 0 then return false end
    return hum:GetAttribute("HasBeenDowned") or hum:GetAttribute("IsDead")
end

local function getHRP()
    local char = CharModule.current_char.get()
    if not char then return end
    return char:FindFirstChild("HumanoidRootPart")
end

local function teleportUnderground()
    local hrp = getHRP()
    if not hrp then return end
    local original = hrp.CFrame
    undergroundBaseCFrame = original + Vector3.new(0, DROP_DEPTH, 0)
    hrp.CFrame = undergroundBaseCFrame
end

local function flickerAndMove()
    if flickering then return end
    flickering = true
    task.spawn(function()
        while flickering and enabled and isDowned() do
            local hum = CharModule.get_hum()
            if hum and hum.Health <= 0 then break end
            local hrp = getHRP()
            if hrp and undergroundBaseCFrame then
                local angle = math.random() * math.pi * 2
                local offset = Vector3.new(math.cos(angle), 0, math.sin(angle)) * MOVE_RADIUS
                local randomPos = undergroundBaseCFrame.Position + offset
                hrp.CFrame = CFrame.new(randomPos)
                task.wait(0.05)
                hrp.CFrame = undergroundBaseCFrame
            end
            task.wait(FLICKER_RATE)
        end
        flickering = false
    end)
end

local function NetGet(...)
    if not CounterTable or not CounterTable.func then return end
    local args = {...}
    for i, v in ipairs(args) do
        if typeof(v) == "Instance" then
            if v:IsA("Model") and #v:GetChildren() == 0 then
                local fallback = Workspace:FindFirstChild("DroppedItems")
                if fallback then
                    local model = fallback:FindFirstChildWhichIsA("Model")
                    if model then args[i] = model else return end
                else return end
            end
        end
    end
    CounterTable.func = (CounterTable.func or 0) + 1
    local success, result = pcall(function()
        local GetRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Get")
        return GetRemote:InvokeServer(CounterTable.func, unpack(args))
    end)
    return result
end

local function CheckAndPickup()
    if not sucking then return end
    local dropped = Workspace:FindFirstChild("DroppedItems")
    if not dropped then return end
    local now = tick()
    local itemsToPickup = {}
    for _, item in ipairs(dropped:GetChildren()) do
        if item:IsA("Model") then
            local part = item:FindFirstChildWhichIsA("BasePart")
            if part then
                local distance = (HumanoidRootPart.Position - part.Position).Magnitude
                if distance <= 20 and (now - (lastPickupTimes[item] or 0)) >= 0 then
                    table.insert(itemsToPickup, item)
                    lastPickupTimes[item] = now
                end
            end
        end
    end
    if #itemsToPickup > 0 then
        for _, item in ipairs(itemsToPickup) do
            spawn(function() NetGet("pickup_dropped_item", item) end)
        end
    end
end

local function SafeCall(f, ...)
    local ok, res = pcall(f, ...)
    return ok, res
end

local tu_unpack = table.unpack or unpack

local function CallRemote(remote, ...)
    if not remote then return end
    local args = {...}
    if remote.ClassName == "RemoteEvent" then
        if CounterTable and type(CounterTable.event) == "number" then
            CounterTable.event = CounterTable.event + 1
            SafeCall(function(...) remote:FireServer(CounterTable.event, ...) end, tu_unpack(args))
        else
            localEventCounter = (localEventCounter or 0) + 1
            SafeCall(function(...) remote:FireServer(localEventCounter, ...) end, tu_unpack(args))
        end
    elseif remote.ClassName == "RemoteFunction" then
        if CounterTable and type(CounterTable.func) == "number" then
            CounterTable.func = CounterTable.func + 1
            SafeCall(function(...) remote:InvokeServer(CounterTable.func, ...) end, tu_unpack(args))
        else
            localFuncCounter = (localFuncCounter or 0) + 1
            SafeCall(function(...) remote:InvokeServer(localFuncCounter, ...) end, tu_unpack(args))
        end
    else
        SafeCall(function(...)
            if remote.FireServer then remote:FireServer(...)
            elseif remote.InvokeServer then remote:InvokeServer(...) end
        end, tu_unpack(args))
    end
end

local function getPlayersInRange(radius)
    local inRange = {}
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return inRange end
    local pos = char.PrimaryPart.Position
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
            local ok, mag = pcall(function() return (player.Character.PrimaryPart.Position - pos).Magnitude end)
            if ok and mag and mag <= radius then table.insert(inRange, player) end
        end
    end
    return inRange
end

local function getActiveTool()
    local char = LocalPlayer and LocalPlayer.Character
    if char then
        for _, item in ipairs(char:GetChildren()) do
            if pcall(function() return item:IsA("Tool") end) and item:IsA("Tool") then return item end
        end
    end
    local backpack = LocalPlayer and LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if pcall(function() return item:IsA("Tool") end) and item:IsA("Tool") then return item end
        end
    end
    return nil
end

local function isMeleeTool(tool)
    if not tool then return false end
    if tool.Name == "Fists" then return true end
    local meleeItems = ReplicatedStorage:WaitForChild("Items"):WaitForChild("melee")
    local throwableItems = ReplicatedStorage:WaitForChild("Items"):WaitForChild("throwable")
    if meleeItems:FindFirstChild(tool.Name) and not throwableItems:FindFirstChild(tool.Name) then return true end
    return false
end

local function AttackNearby()
    if not Remote then return end
    local char = LocalPlayer.Character
    if not char or not char.PrimaryPart then return end
    local tool = getActiveTool()
    if not tool or not isMeleeTool(tool) then return end
    local okParent, parent = pcall(function() return tool.Parent end)
    if not okParent or parent ~= LocalPlayer.Character then return end
    local targets = getPlayersInRange(scanRadius)
    if #targets == 0 then return end
    local okLocalPos, localPos = pcall(function() return char.PrimaryPart.Position end)
    if not okLocalPos or not localPos then return end
    local playerTargets = {}
    local predictedPositions = {}
    for _, player in pairs(targets) do
        if player and player.Character and player.Character.PrimaryPart then
            local head = player.Character:FindFirstChild("Head")
            local hrp = player.Character.PrimaryPart
            if head and hrp then
                local predictedPos = predictPosition(head, hrp)
                table.insert(playerTargets, player)
                table.insert(predictedPositions, predictedPos)
            end
        end
    end
    if #playerTargets == 0 then return end
    local primaryPredictedPos = predictedPositions[1]
    local lookAtCFrame = CFrame.lookAt(localPos, primaryPredictedPos)
    local args = { "melee_attack", tool, playerTargets, lookAtCFrame, 0.75 }
    pcall(function() CallRemote(Remote, tu_unpack(args)) end)
end

local running = false
local function StartAutoAttack()
    if running then return end
    running = true
    task.spawn(function()
        while running do
            task.wait(scanInterval)
            if hookEnabled and LocalPlayer and LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
                pcall(AttackNearby)
            end
        end
    end)
end

-- ==================== ระบบรบเหงา (Auto Farm NPC) ====================

-- ฟังก์ชันหา NPC/ม็อบที่ใกล้ที่สุด
local function getClosestNPC()
    local char = LocalPlayer.Character
    if not char then return nil, math.huge end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, math.huge end
    
    local closest = nil
    local closestDist = math.huge
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local humanoid = obj:FindFirstChild("Humanoid")
            local isPlayer = Players:GetPlayerFromCharacter(obj)
            
            -- เช็คว่าเป็น NPC (ไม่ใช่ผู้เล่น) และมีเลือด
            if not isPlayer and humanoid and humanoid.Health > 0 then
                local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head") or obj.PrimaryPart
                if root then
                    local dist = (hrp.Position - root.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = obj
                    end
                end
            end
        end
    end
    return closest, closestDist
end

-- ฟังก์ชันเดินไปหา NPC
local function moveToNPC(npc)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local npcRoot = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Head")
    if not hrp or not npcRoot then return end
    
    local dist = (hrp.Position - npcRoot.Position).Magnitude
    
    if dist > farmRange then
        -- ใช้ BodyVelocity บินไปหา
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = (npcRoot.Position - hrp.Position).Unit * 50
        bv.MaxForce = Vector3.new(4000, 4000, 4000)
        bv.Parent = hrp
        
        -- รอจนใกล้
        repeat
            task.wait()
            dist = (hrp.Position - npcRoot.Position).Magnitude
        until dist < farmRange or not autoFarmEnabled or not npc.Parent
        
        bv:Destroy()
    end
    
    -- เดินเข้าไปใกล้
    char.Humanoid:MoveTo(npcRoot.Position)
end

-- ฟังก์ชันโจมตี NPC
local function attackNPC()
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, attackKey, false, game)
    task.wait(0.1)
    virtualInput:SendKeyEvent(false, attackKey, false, game)
end

-- ฟังก์ชันใช้สกิล
local function useSkill(skillKey)
    if not useSkills then return end
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, skillKey, false, game)
    task.wait(0.1)
    virtualInput:SendKeyEvent(false, skillKey, false, game)
end

-- ฟังก์ชันเก็บของจาก NPC
local function collectNPCItems()
    if not collectDrops then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and (obj.Name:find("Drop") or obj.Name:find("Money") or obj.Name:find("Item") or obj.Name:find("Chest")) then
            local dist = (hrp.Position - obj.Position).Magnitude
            if dist < 10 then
                -- บินไปหา
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = (obj.Position - hrp.Position).Unit * 50
                bv.MaxForce = Vector3.new(4000, 4000, 4000)
                bv.Parent = hrp
                task.wait(0.3)
                bv:Destroy()
                
                -- เก็บของ
                firetouchinterest(hrp, obj, 0)
                task.wait(0.1)
                firetouchinterest(hrp, obj, 1)
            end
        end
    end
end

-- Auto Farm Loop
task.spawn(function()
    while true do
        task.wait(0.5)
        if autoFarmEnabled then
            local npc, dist = getClosestNPC()
            
            if npc then
                if dist > farmRange then
                    moveToNPC(npc)
                else
                    attackNPC()
                    useSkill("Q")
                    task.wait(0.2)
                    useSkill("R")
                    task.wait(0.2)
                    useSkill("F")
                    collectNPCItems()
                end
            else
                -- ไม่เจอ NPC เดินสุ่ม
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local randomPos = hrp.Position + Vector3.new(math.random(-50, 50), 0, math.random(-50, 50))
                        local bv = Instance.new("BodyVelocity")
                        bv.Velocity = (randomPos - hrp.Position).Unit * 30
                        bv.MaxForce = Vector3.new(4000, 4000, 4000)
                        bv.Parent = hrp
                        task.wait(1)
                        bv:Destroy()
                    end
                end
            end
        end
    end
end)

local function createNeonEffectAtPosition(pos, fadeTime) end

local function performTeleport()
    if not HumanoidRootPart then return end
    local currentPos = HumanoidRootPart.Position
    local bottomPos = Vector3.new(currentPos.X, currentPos.Y - maxHeight, currentPos.Z)
    HumanoidRootPart.CFrame = CFrame.new(bottomPos)
    lockedY = bottomPos.Y
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://95298029662868"
    sound.Volume = 1
    sound.PlayOnRemove = true
    sound.Parent = HumanoidRootPart
    sound:Destroy()
    createNeonEffectAtPosition(currentPos, 1.5)
    createNeonEffectAtPosition(bottomPos, 2)
end

local function toggleTeleport()
    if not featureEnabled then return end
    teleportActive = not teleportActive
    if teleportActive then performTeleport() else lockedY = nil end
end

local connection
local function lockYPosition()
    if connection then pcall(function() connection:Disconnect() end) end
    connection = RunService.Heartbeat:Connect(function()
        if teleportActive and lockedY and HumanoidRootPart then
            local currentPos = HumanoidRootPart.Position
            if math.abs(currentPos.Y - lockedY) > 0.1 then
                HumanoidRootPart.CFrame = CFrame.new(currentPos.X, lockedY, currentPos.Z)
            end
        end
    end)
end

local function registerItems(folder)
    for _, tool in ipairs(folder:GetChildren()) do
        if tool:IsA("Tool") then
            local handle = tool:FindFirstChild("Handle")
            local key = nil
            local displayName = tool:GetAttribute("DisplayName") or tool.Name
            local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
            local rarity = tool:GetAttribute("RarityName") or "Common"
            local imageId = tool:GetAttribute("ImageId") or "rbxassetid://7072725737"
            if handle then
                local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                if mesh and mesh.MeshId ~= "" then
                    key = mesh.MeshId .. (mesh.TextureId or "") .. "_RARITY_" .. rarity
                elseif handle:IsA("MeshPart") and handle.MeshId ~= "" then
                    key = handle.MeshId .. (handle.TextureID or "") .. "_RARITY_" .. rarity
                end
            end
            if not key and itemId and itemId ~= "" and itemId ~= tool.Name then
                key = "ITEMID_" .. itemId .. "_RARITY_" .. rarity
            end
            if not key then
                key = "NAME_" .. displayName .. "_" .. tool.Name .. "_RARITY_" .. rarity
            end
            WeaponDB[key] = {
                Name = displayName,
                Rarity = rarity,
                ImageId = imageId,
                ToolName = tool.Name
            }
        end
    end
end

local function getItemKey(tool)
    local handle = tool:FindFirstChild("Handle")
    local displayName = tool:GetAttribute("DisplayName") or tool.Name
    local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
    local rarity = tool:GetAttribute("RarityName") or "Common"
    if handle then
        local mesh = handle:FindFirstChildOfClass("SpecialMesh")
        if mesh and mesh.MeshId ~= "" then
            return mesh.MeshId .. (mesh.TextureId or "") .. "_RARITY_" .. rarity
        elseif handle:IsA("MeshPart") and handle.MeshId ~= "" then
            return handle.MeshId .. (handle.TextureID or "") .. "_RARITY_" .. rarity
        end
    end
    if itemId and itemId ~= "" and itemId ~= tool.Name then
        return "ITEMID_" .. itemId .. "_RARITY_" .. rarity
    end
    return "NAME_" .. displayName .. "_" .. tool.Name .. "_RARITY_" .. rarity
end

local function getWeaponInfo(tool)
    if not tool or not tool:IsA("Tool") then return nil end
    local key = getItemKey(tool)
    return WeaponDB[key]
end

local function createBillboardForPlayer(player)
    if not ESPEnabled or player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if BillboardCache[player] then BillboardCache[player]:Destroy() end
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0, 90, 0, 20)
    billboard.StudsOffset = Vector3.new(0, -5.0, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = char
    billboard:ClearAllChildren()
    local layout = Instance.new("UIListLayout", billboard)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local tools = {}
    for _, container in ipairs({"Backpack", "StarterGear", "StarterPack"}) do
        local obj = player:FindFirstChild(container)
        if obj then
            for _, tool in ipairs(obj:GetChildren()) do
                if tool:IsA("Tool") and tool.Name ~= "Fists" then
                    table.insert(tools, tool)
                end
            end
        end
    end
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and tool.Name ~= "Fists" then
                table.insert(tools, tool)
            end
        end
    end
    for _, tool in ipairs(tools) do
        local info = getWeaponInfo(tool)
        if info then
            local img = Instance.new("ImageLabel", billboard)
            img.Size = UDim2.new(0, 20, 0, 20)
            img.BackgroundTransparency = 0.1
            img.Image = info.ImageId
            img.BackgroundColor3 = Color3.fromRGB(240, 248, 255)
            Instance.new("UICorner", img).CornerRadius = UDim.new(0, 10)
            local border = Instance.new("UIStroke", img)
            border.Color = RARITY_COLORS[info.Rarity] or Color3.new(1, 1, 1)
            border.Thickness = 2
        end
    end
    BillboardCache[player] = billboard
end

local function setFinishPrompt(prompt)
    if prompt and prompt:IsA("ProximityPrompt") then
        prompt.HoldDuration = holdTime
        prompt.MaxActivationDistance = 20
    end
end

local function tryHoldPrompt(prompt, duration)
    if not prompt or prompt:GetAttribute("__AutoFinishBusy") then return end
    prompt:SetAttribute("__AutoFinishBusy", true)
    pcall(function() if prompt.InputHoldBegin then prompt:InputHoldBegin() end end)
    pcall(function() if prompt.HoldBegin then prompt:HoldBegin() end end)
    pcall(function() if prompt.Trigger then prompt:Trigger() end end)
    task.wait(duration)
    pcall(function() if prompt.InputHoldEnd then prompt:InputHoldEnd() end end)
    pcall(function() if prompt.HoldEnd then prompt:HoldEnd() end end)
    prompt:SetAttribute("__AutoFinishBusy", nil)
end

local function findFinishPrompts()
    local found = {}
    for _, char in pairs(workspace:GetChildren()) do
        local player = Players:GetPlayerFromCharacter(char)
        if player and not isPlayerExcluded(player.Name) then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local prompt = hrp:FindFirstChild("FinishPrompt")
                if prompt then
                    setFinishPrompt(prompt)
                    table.insert(found, prompt)
                end
            end
        end
    end
    return found
end

local function applyToAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local prompt = hrp:FindFirstChild("FinishPrompt")
                if prompt then setFinishPrompt(prompt) end
            end
        end
    end
end

local function setupFastFinishForPlayer(p)
    if p ~= LocalPlayer then
        p.CharacterAdded:Connect(function(char)
            char.DescendantAdded:Connect(function(desc)
                if fastFinishEnabled and desc.Name == "FinishPrompt" and desc:IsA("ProximityPrompt") and desc.Parent and desc.Parent.Name == "HumanoidRootPart" then
                    setFinishPrompt(desc)
                end
            end)
            local hrp = char:WaitForChild("HumanoidRootPart", 5)
            if hrp and fastFinishEnabled then
                local prompt = hrp:FindFirstChild("FinishPrompt")
                if prompt then setFinishPrompt(prompt) end
            end
        end)
        if p.Character then
            local char = p.Character
            char.DescendantAdded:Connect(function(desc)
                if fastFinishEnabled and desc.Name == "FinishPrompt" and desc:IsA("ProximityPrompt") and desc.Parent and desc.Parent.Name == "HumanoidRootPart" then
                    setFinishPrompt(desc)
                end
            end)
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp and fastFinishEnabled then
                local prompt = hrp:FindFirstChild("FinishPrompt")
                if prompt then setFinishPrompt(prompt) end
            end
        end
    end
end

local function getPlayer(name)
    name = string.lower(name)
    for _, p in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(p.Name), name) or string.find(string.lower(p.DisplayName), name) then
            return p
        end
    end
end

local function ForcePart(v)
    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, obj in ipairs(v:GetChildren()) do
            if obj:IsA("BodyMover") or obj:IsA("RocketPropulsion") then obj:Destroy() end
        end
        for _, junk in ipairs({"Attachment", "AlignPosition", "Torque"}) do
            local f = v:FindFirstChild(junk)
            if f then f:Destroy() end
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 9999
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function ToggleBring(name)
    local player = getPlayer(name)
    if not player then return end
    Active = not Active
    if Active then
        local char = player.Character or player.CharacterAdded:Wait()
        local targetRoot = char:WaitForChild("HumanoidRootPart")
        for _, v in ipairs(Workspace:GetDescendants()) do ForcePart(v) end
        BringConnection = Workspace.DescendantAdded:Connect(ForcePart)
        task.spawn(function()
            while Active do
                Attachment1.WorldCFrame = targetRoot.CFrame
                task.wait()
            end
        end)
    else
        if BringConnection then BringConnection:Disconnect() end
    end
end

local function TrySkipCrate()
    local success, CrateController = pcall(function() return require(ReplicatedStorage.Modules.Game.CrateSystem.Crate) end)
    if not (success and CrateController) then return end
    task.spawn(function()
        local spinning = CrateController.spinning
        if not spinning then return end
        local waited = 0
        while not spinning.get() do
            if waited > 3 then break end
            task.wait(0.05)
            waited = waited + 0.05
        end
        if spinning.get() then pcall(function() CrateController.skip_spin() end) end
    end)
end

local function SetupAutoSkip()
    local remotesFolder = ReplicatedStorage:WaitForChild("Remotes", 5)
    if not remotesFolder then return end
    local sendRemote = remotesFolder:WaitForChild("Send", 5)
    if not (sendRemote and sendRemote:IsA("RemoteEvent")) then return end
    sendRemote.OnClientEvent:Connect(function(...)
        if AutoSkipEnabled then TrySkipCrate() end
    end)
end

local function createESP(player)
    if espPlayers[player] then return end
    local nameText = Drawing.new("Text")
    nameText.Size = 16
    nameText.Center = true
    nameText.Outline = true
    nameText.Color = isPlayerExcluded(player.Name) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    nameText.Font = 4
    local distanceText = Drawing.new("Text")
    distanceText.Size = 14
    distanceText.Center = true
    distanceText.Outline = true
    distanceText.Color = Color3.fromRGB(255, 255, 255)
    distanceText.Font = 4
    local healthBg = Drawing.new("Square")
    healthBg.Filled = false
    healthBg.Thickness = 1
    healthBg.Color = Color3.fromRGB(0, 0, 0)
    healthBg.Transparency = 0.9
    healthBg.Visible = false
    local healthFg = Drawing.new("Square")
    healthFg.Filled = true
    healthFg.Transparency = 0.9
    healthFg.Visible = false
    local drawings = {nameText, distanceText, healthBg, healthFg}
    local conn = RunService.RenderStepped:Connect(function()
        if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(drawings) do obj.Visible = false end
            return
        end
        local hrp = player.Character.HumanoidRootPart
        local humanoid = player.Character:FindFirstChild("Humanoid")
        local dist = 0
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            dist = (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        end
        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen or screenPos.Z <= 0 then
            for _, obj in pairs(drawings) do obj.Visible = false end
            return
        end
        local centerX = screenPos.X
        local currentTopY = screenPos.Y - 15
        if healthESPEnabled and humanoid and humanoid.Health > 0 then
            local perc = humanoid.Health / (humanoid.MaxHealth > 0 and humanoid.MaxHealth or 1)
            local barHeight = 4
            local barWidth = 60
            local healthX = centerX - barWidth / 2
            healthBg.Position = Vector2.new(healthX, currentTopY - barHeight - 2)
            healthBg.Size = Vector2.new(barWidth, barHeight)
            healthBg.Visible = true
            healthFg.Position = Vector2.new(healthX, currentTopY - barHeight - 2)
            healthFg.Size = Vector2.new(barWidth * perc, barHeight)
            healthFg.Color = Color3.fromHSV(perc * 0.333, 0.8, 0.9)
            healthFg.Visible = true
            currentTopY = currentTopY - barHeight - 6
        else
            healthBg.Visible = false
            healthFg.Visible = false
        end
        if nameESPEnabled then
            local minSize, maxSize = 14, 42
            local scaleDist = math.clamp(dist / 50, 0, 1)
            local dynamicSize = maxSize - (maxSize - minSize) * scaleDist
            nameText.Text = player.Name
            nameText.Size = math.floor(dynamicSize)
            nameText.Color = isPlayerExcluded(player.Name) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
            nameText.Outline = true
            nameText.Position = Vector2.new(centerX, currentTopY - 16)
            nameText.Visible = true
        else
            nameText.Visible = false
        end
        distanceText.Text = distanceESPEnabled and string.format("%.0f studs", dist) or ""
        distanceText.Position = Vector2.new(centerX, screenPos.Y + 20)
        distanceText.Visible = distanceESPEnabled
    end)
    espPlayers[player] = {conn = conn, drawings = drawings}
end

local function loadESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not espPlayers[player] then createESP(player) end
    end
    Players.PlayerAdded:Connect(function(player)
        if player ~= LocalPlayer then
            player.CharacterAdded:Connect(function()
                task.wait(0.1)
                if not espPlayers[player] then createESP(player) end
            end)
            if player.Character and not espPlayers[player] then
                task.wait(0.1)
                createESP(player)
            end
        end
    end)
    Players.PlayerRemoving:Connect(function(player)
        if espPlayers[player] then
            for _, obj in pairs(espPlayers[player].drawings) do
                if obj and obj.Destroy then pcall(function() obj:Destroy() end)
                elseif typeof(obj) == "table" and obj.Visible ~= nil then obj.Visible = false end
            end
            if espPlayers[player].conn then pcall(function() espPlayers[player].conn:Disconnect() end) end
        end
    end)
end

-- Position History
local HISTORY_SIZE = 6
local PREDICT_FACTOR = 1.2
local SKY_Y_THRESHOLD = 150
local SMOOTH_ALPHA = 0.75
local PositionHistory = {}
local TracerSmoothedPos = Vector3.new()

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChild("Humanoid")
            if hrp and humanoid and humanoid.Health > 0 then
                PositionHistory[player] = PositionHistory[player] or {}
                table.insert(PositionHistory[player], {time = os.clock(), pos = hrp.Position})
                if #PositionHistory[player] > HISTORY_SIZE then table.remove(PositionHistory[player], 1) end
            else
                PositionHistory[player] = nil
            end
        end
    end
end)

Players.PlayerRemoving:Connect(function(player) PositionHistory[player] = nil end)

local function calculateVelocity(player)
    local hist = PositionHistory[player]
    if not hist or #hist < 2 then return Vector3.new() end
    local totalVel = Vector3.new()
    local count = 0
    for i = 2, #hist do
        local dt = hist[i].time - hist[i - 1].time
        if dt > 0 then
            totalVel = totalVel + (hist[i].pos - hist[i - 1].pos) / dt
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

-- Gun Mods Functions
local function isGunTool(tool)
    if not tool or not tool:IsA("Tool") then return false end
    local GunsFolder = ReplicatedStorage:WaitForChild("Items"):WaitForChild("gun")
    return GunsFolder:FindFirstChild(tool.Name) ~= nil or tool.Name:match("Gun") or tool:FindFirstChild("Handle")
end

local function forceSetAttribute(tool, attrName, value)
    if tool and tool.SetAttribute then pcall(function() tool:SetAttribute(attrName, value) end) end
end

local function debugPrintAttributes(tool) end

local function applyGodGun(tool)
    if not tool or not isGunTool(tool) then return end
    pcall(function()
        tool:SetAttribute("fire_rate", getgenv().FireRateValue)
        tool:SetAttribute("accuracy", getgenv().AccuracyValue)
        tool:SetAttribute("Recoil", getgenv().RecoilValue)
        tool:SetAttribute("Durability", getgenv().Durability)
        tool:SetAttribute("automatic", getgenv().AutoValue)
    end)
    task.spawn(function()
        for attempt = 1, 20 do
            local attrNames = tool:GetAttributes()
            local keys = {}
            for k in pairs(attrNames) do table.insert(keys, k) end
            table.sort(keys)
            if #keys >= 11 then
                local targetKey = keys[11]
                for i = 1, 5 do
                    forceSetAttribute(tool, targetKey, true)
                    task.wait(0.01)
                end
            end
            task.wait(0.1)
        end
    end)
    task.wait(0.5)
    debugPrintAttributes(tool)
end

RunService.Heartbeat:Connect(function()
    if not getgenv().GunModsAutoApply then return end
    local char = LocalPlayer.Character
    if not char then return end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and isGunTool(tool) then pcall(applyGodGun, tool) end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    repeat
        task.wait(0.1)
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and isGunTool(tool) then task.spawn(applyGodGun, tool) end
        end
    until not getgenv().GunModsAutoApply
end)

LocalPlayer.Character.ChildAdded:Connect(function(child)
    if child:IsA("Tool") and getgenv().GunModsAutoApply then
        task.wait(0.2)
        applyGodGun(child)
    end
end)

-- Melee Aura
local meleeNames = {}
for _, v in ipairs(MeleeFolder:GetChildren()) do table.insert(meleeNames, v.Name) end

local function modifyFists(tool, enable)
    if tool then
        local attributes = tool:GetAttributes()
        local keys = {}
        for name, _ in pairs(attributes) do table.insert(keys, name) end
        table.sort(keys)
        if #keys >= 7 then
            local attr6 = keys[6]
            local attr7 = keys[7]
            if enable then
                if OriginalValues[attr6] == nil then OriginalValues[attr6] = tool:GetAttribute(attr6) end
                if OriginalValues[attr7] == nil then OriginalValues[attr7] = tool:GetAttribute(attr7) end
                tool:SetAttribute(attr6, 360)
                tool:SetAttribute(attr7, 20)
            else
                if OriginalValues[attr6] then tool:SetAttribute(attr6, OriginalValues[attr6]) end
                if OriginalValues[attr7] then tool:SetAttribute(attr7, OriginalValues[attr7]) end
            end
        end
    end
end

local function checkAndModifyFists()
    local Character = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not Character or not backpack then return end
    local tools = {}
    for _, t in ipairs(Character:GetChildren()) do if isMeleeTool(t) then table.insert(tools, t) end end
    for _, t in ipairs(backpack:GetChildren()) do if isMeleeTool(t) then table.insert(tools, t) end end
    for _, tool in ipairs(tools) do modifyFists(tool, FistsBuffEnabled) end
end

RunService.Heartbeat:Connect(function() if FistsBuffEnabled then checkAndModifyFists() end end)
LocalPlayer.CharacterAdded:Connect(function() task.wait(1) if FistsBuffEnabled then checkAndModifyFists() end end)

-- Shotgun Check
local function isShotgun()
    if not Character then return false end
    for _, tool in ipairs(Character:GetChildren()) do
        if tool:IsA("Tool") then
            local ammoType = tool:GetAttribute("AmmoType")
            if ammoType == "shotgun" or ammoType == "shootgun" then return true end
        end
    end
    return false
end

-- Hook FireServer for Silent Aim
local oldFire
if Remote and Remote.FireServer then
    local ok, res = pcall(function()
        oldFire = hookfunction(Remote.FireServer, function(self, ...)
            if self ~= Remote then return oldFire(self, ...) end
            local args = {...}
            if SilentAimEnabled and args[2] == "shoot_gun" and CurrentTarget then
                local head = CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("Head")
                local hrp = CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
                local humanoid = CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("Humanoid")
                if head and hrp and humanoid then
                    local aimPos = predictPosition(head, hrp)
                    local myHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
                    local myPos = myHead and myHead.Position or nil
                    if isShotgun() then
                        args[4] = CFrame.new(myPos, aimPos)
                        local pellets = {}
                        for i = 1, 6 do
                            local spread = Vector3.new(math.random(-2, 2) * 0.03, math.random(-2, 2) * 0.03, math.random(-2, 2) * 0.03)
                            table.insert(pellets, { [1] = { Instance = head, Normal = Vector3.new(0, 1, 0), Position = aimPos + spread } })
                        end
                        args[5] = pellets
                    else
                        local blocked = isBehindWall(myPos, aimPos)
                        if blocked then args[4] = CFrame.new(math.huge, math.huge, math.huge)
                        else args[4] = CFrame.new(myPos, aimPos) end
                        args[5] = { [1] = { [1] = { Instance = head, Normal = Vector3.new(0, 1, 0), Position = aimPos } } }
                    end
                    local success, beam = pcall(function()
                        local part = Instance.new("Part")
                        part.Anchored = true
                        part.CanCollide = false
                        part.Size = Vector3.new(0.08, 0.08, (aimPos - LocalPlayer.Character.Head.Position).Magnitude)
                        part.CFrame = CFrame.new(LocalPlayer.Character.Head.Position, aimPos) * CFrame.new(0, 0, -part.Size.Z / 2)
                        part.Material = Enum.Material.Neon
                        part.Transparency = 0.35
                        part.Color = Color3.fromRGB(255, 0, 0)
                        part.Parent = workspace
                        Debris:AddItem(part, 4)
                        return part
                    end)
                    if humanoid then
                        local previousHealth = humanoid.Health
                        spawn(function()
                            wait(0.1)
                            if humanoid and humanoid.Health < previousHealth then
                                if success and beam then beam.Color = Color3.fromRGB(0, 255, 0) end
                                for _, part in ipairs(CurrentTarget.Character:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        local box = Instance.new("Part")
                                        box.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
                                        box.CFrame = part.CFrame
                                        box.Anchored = true
                                        box.CanCollide = false
                                        box.Material = Enum.Material.Neon
                                        box.Color = Color3.fromRGB(255, 0, 0)
                                        box.Transparency = 0.5
                                        box.Parent = Workspace
                                        local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear)
                                        TweenService:Create(box, tweenInfo, {Transparency = 1}):Play()
                                        Debris:AddItem(box, 2)
                                    end
                                end
                                if head then
                                    local blood = Instance.new("Part")
                                    blood.Size = Vector3.new(0.2, 0.2, 0.2)
                                    blood.Shape = Enum.PartType.Ball
                                    blood.Material = Enum.Material.Neon
                                    blood.Color = Color3.fromRGB(255, 0, 0)
                                    blood.CFrame = CFrame.new(head.Position)
                                    blood.Anchored = false
                                    blood.CanCollide = false
                                    blood.Parent = Workspace
                                    local bv = Instance.new("BodyVelocity")
                                    bv.Velocity = Vector3.new(math.random(-5, 5), math.random(5, 10), math.random(-5, 5))
                                    bv.P = 5000
                                    bv.MaxForce = Vector3.new(4000, 4000, 4000)
                                    bv.Parent = blood
                                    Debris:AddItem(blood, 1)
                                end
                            else
                                if success and beam then beam.Color = Color3.fromRGB(255, 0, 0) end
                            end
                        end)
                    end
                end
            end
            return oldFire(self, unpack(args))
        end)
    end)
end

-- RenderStepped Loop
RunService.RenderStepped:Connect(function()
    pcall(function()
        if SilentAimAttachEnabled then CurrentTarget = getClosestTarget() end
        CurrentTarget = (SilentAimEnabled or SilentAimAttachEnabled) and getClosestTarget() or nil
        
        -- FOV แปดเหลี่ยมสีรุ้ง
        if RainbowFOV then
            RainbowFOV.Visible = SilentAimEnabled
        end
        
        local TracerTarget = getClosestTarget()
        if TracerTarget and TracerTarget.Character then
            local character = TracerTarget.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local targetPart = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
            if humanoid and humanoid.Health > 0 and targetPart then
                local centerScreenPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                local newPos = targetPart.Position
                TracerSmoothedPos = TracerSmoothedPos:Lerp(newPos, SMOOTH_ALPHA)
                local targetPos = TracerSmoothedPos
                local targetScreenPos, targetOnScreen = Camera:WorldToViewportPoint(targetPos)
                if targetOnScreen then
                    Tracer.Visible = true
                    Tracer.From = centerScreenPos
                    Tracer.To = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                    Tracer.Color = Color3.fromRGB(255, 50, 50)
                    Tracer.Thickness = 1.3
                    if not TracerESP then
                        TracerESP = {}
                        for i = 1, 4 do
                            TracerESP[i] = Drawing.new("Line")
                            TracerESP[i].Color = Color3.fromRGB(255, 255, 255)
                            TracerESP[i].Thickness = 1.2
                            TracerESP[i].Visible = true
                        end
                    end
                    local headTopPos = Camera:WorldToViewportPoint(targetPart.Position + Vector3.new(0, 0.5, 0))
                    local headBottomPos = Camera:WorldToViewportPoint(targetPart.Position - Vector3.new(0, 0.5, 0))
                    local center = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                    local sizeY = (headTopPos - headBottomPos).Magnitude / 2
                    local sizeX = sizeY
                    local minSize, maxSize = 8, 25
                    sizeX = math.clamp(sizeX, minSize, maxSize)
                    sizeY = math.clamp(sizeY, minSize, maxSize)
                    local top = Vector2.new(center.X, center.Y - sizeY)
                    local bottom = Vector2.new(center.X, center.Y + sizeY)
                    local left = Vector2.new(center.X - sizeX, center.Y)
                    local right = Vector2.new(center.X + sizeX, center.Y)
                    TracerESP[1].From, TracerESP[1].To = top, right
                    TracerESP[2].From, TracerESP[2].To = right, bottom
                    TracerESP[3].From, TracerESP[3].To = bottom, left
                    TracerESP[4].From, TracerESP[4].To = left, top
                    for i = 1, 4 do TracerESP[i].Visible = true end
                else
                    Tracer.Visible = false
                    if TracerESP then for i = 1, 4 do TracerESP[i].Visible = false end end
                end
            else
                Tracer.Visible = false
                if TracerESP then for i = 1, 4 do TracerESP[i].Visible = false end end
            end
        else
            Tracer.Visible = false
            if TracerESP then for i = 1, 4 do TracerESP[i].Visible = false end end
            TracerSmoothedPos = Vector3.new()
        end
        if teleportActive and lockedY and HumanoidRootPart then
            local currentPos = HumanoidRootPart.Position
            if math.abs(currentPos.Y - lockedY) > 0.1 then
                HumanoidRootPart.CFrame = CFrame.new(currentPos.X, lockedY, currentPos.Z)
            end
        end
    end)
end)

-- Sky/Anti Lock
RunService.Heartbeat:Connect(function()
    if getgenv().Sky and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local Root = LocalPlayer.Character.HumanoidRootPart
        local originalVel = Root.Velocity
        local angle = math.rad(tick() * 1500 % 360)
        local x = math.cos(angle) * getgenv().SkyAmount
        local z = math.sin(angle) * getgenv().SkyAmount
        local yVel = math.random(280, 480)
        Root.Velocity = Vector3.new(x, yVel, z)
        RunService.RenderStepped:Wait()
        Root.Velocity = originalVel
    end
end)

-- Anti Kill
RunService.Heartbeat:Connect(function()
    if not enabled then return end
    if isDowned() then
        local hrp = getHRP()
        if hrp and not undergroundBaseCFrame then teleportUnderground() end
        flickerAndMove()
    else
        if undergroundBaseCFrame then
            local hrp = getHRP()
            if hrp then hrp.CFrame = undergroundBaseCFrame + Vector3.new(0, -DROP_DEPTH, 0) end
        end
        undergroundBaseCFrame = nil
        flickering = false
    end
end)

-- Auto Pickup
RunService.Heartbeat:Connect(function()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    end
    pcall(CheckAndPickup)
end)

-- User Input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G and WindUI and Window then
        if Window.Toggle then Window:Toggle() elseif Window.SetVisible then Window:SetVisible(not Window.Visible) end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z and featureEnabled then toggleTeleport() end
end)

LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    lockedY = nil
    teleportActive = false
    lockYPosition()
end)

lockYPosition()
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    running = false
    task.wait(0.1)
    StartAutoAttack()
end)

StartAutoAttack()

for _, category in ipairs({"gun", "melee", "throwable", "consumable", "farming", "misc", "rod", "fish"}) do
    registerItems(ReplicatedStorage:WaitForChild("Items")[category])
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESPEnabled then
            wait(0.2)
            createBillboardForPlayer(player)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if BillboardCache[player] then BillboardCache[player]:Destroy() end
end)

for _, p in ipairs(Players:GetPlayers()) do setupFastFinishForPlayer(p) end
Players.PlayerAdded:Connect(setupFastFinishForPlayer)

task.spawn(function()
    while true do
        task.wait(scanInterval)
        if fastFinishEnabled then
            for _, prompt in ipairs(findFinishPrompts()) do
                task.spawn(function() tryHoldPrompt(prompt, holdTime) end)
            end
        end
    end
end)

SetupAutoSkip()

ReplicatedStorage.ChildAdded:Connect(function(child)
    if child.Name == "Remotes" then SetupAutoSkip() end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if highlightEnabled then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = character
            highlight.FillColor = Color3.fromRGB(0, 170, 255)
            highlight.OutlineColor = Color3.fromRGB(0, 170, 255)
            highlight.Parent = workspace
            playerHighlights[player] = highlight
        end
        if espPlayers[player] and espPlayers[player].drawings then
            local nameText = espPlayers[player].drawings[1]
            nameText.Color = isPlayerExcluded(player.Name) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if espPlayers[player] then
        for _, obj in pairs(espPlayers[player].drawings) do
            if obj and obj.Destroy then pcall(function() obj:Destroy() end)
            elseif typeof(obj) == "table" and obj.Visible ~= nil then obj.Visible = false end
        end
        if espPlayers[player].conn then pcall(function() espPlayers[player].conn:Disconnect() end) end
        espPlayers[player] = nil
    end
    if playerHighlights[player] then
        playerHighlights[player]:Destroy()
        playerHighlights[player] = nil
    end
end)

task.spawn(function()
    while task.wait(1) do
        if highlightEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    if not playerHighlights[player] then
                        local highlight = Instance.new("Highlight")
                        highlight.Adornee = player.Character
                        highlight.FillColor = Color3.fromRGB(0, 170, 255)
                        highlight.OutlineColor = Color3.fromRGB(0, 170, 255)
                        highlight.Parent = workspace
                        playerHighlights[player] = highlight
                    end
                end
            end
        end
    end
end)

loadESP()

local Net = {}
function Net.send(...)
    local args = {...}
    CounterTable.event = CounterTable.event + 1
    pcall(function() Remotes.Send:FireServer(CounterTable.event, unpack(args)) end)
end

-- ==================== UI Tabs ====================

-- COMBAT Tab
local CombatTab = Window:Tab({Title = "COMBAT", Icon = "crosshair"})
CombatTab:Section({Title = "GUN SETTINGS"})

local SilentToggle = CombatTab:Toggle({
    Title = "Silent Aim",
    Default = false,
    Callback = function(state) SilentAimEnabled = state; CurrentTarget = nil end
})
myConfig:Register("SilentAim", SilentToggle)

local AttachToggle = CombatTab:Toggle({
    Title = "Red Line Lock",
    Default = false,
    Callback = function(state) SilentAimAttachEnabled = state; CurrentTarget = nil end
})
myConfig:Register("SilentAimAttach", AttachToggle)

local FOVSlider = CombatTab:Slider({
    Title = "FOV Radius (แปดเหลี่ยมสีรุ้ง)",
    Step = 5,
    Value = { Min = 20, Max = 800, Default = FOVRadius },
    Callback = function(value) FOVRadius = tonumber(value) end
})
myConfig:Register("FOVRadius", FOVSlider)

local FriendsInput = CombatTab:Input({
    Title = "Safe Friends",
    Desc = "ใส่ชื่อเพื่อน คั่นด้วยช่องว่าง",
    Value = "",
    Placeholder = "friend1 friend2",
    Callback = function(input)
        excludedPlayerNames = {}
        for name in string.gmatch(input, "%S+") do
            table.insert(excludedPlayerNames, name)
        end
        for _, player in pairs(Players:GetPlayers()) do
            if espPlayers[player] and espPlayers[player].drawings then
                local nameText = espPlayers[player].drawings[1]
                nameText.Color = isPlayerExcluded(player.Name) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
            end
        end
    end
})
myConfig:Register("FriendsList", FriendsInput)

CombatTab:Divider()
CombatTab:Section({Title = "MELEE SETTINGS"})

local MeleeToggle = CombatTab:Toggle({
    Title = "Melee Aura",
    Desc = "เพิ่มระยะและความกว้างของหมัด",
    Default = false,
    Callback = function(state)
        FistsBuffEnabled = state
        checkAndModifyFists()
    end
})
myConfig:Register("MeleeAura", MeleeToggle)

local AutoAttackToggle = CombatTab:Toggle({
    Title = "Auto Attack (PvP)",
    Desc = "โจมตีผู้เล่นอัตโนมัติเมื่อมีศัตรูในระยะ",
    Default = false,
    Callback = function(state) hookEnabled = state end
})
myConfig:Register("AutoAttack", AutoAttackToggle)

local ScanSlider = CombatTab:Slider({
    Title = "PvP Scan Radius",
    Step = 1,
    Value = { Min = 5, Max = 50, Default = scanRadius },
    Callback = function(value) scanRadius = value end
})
myConfig:Register("ScanRadius", ScanSlider)

-- ==================== AUTO FARM TAB (รบเหงา) ====================
local FarmTab = Window:Tab({Title = "AUTO FARM", Icon = "target"})
FarmTab:Section({Title = "⚔️ รบเหงา (Auto Farm NPC)"})

local FarmToggle = FarmTab:Toggle({
    Title = "เปิดระบบรบเหงา",
    Desc = "ตีม็อบ/ NPC อัตโนมัติ",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
        if state then
            hookEnabled = false -- ปิด PvP อัตโนมัติ
            WindUI:Notify({ Title = "✅ ระบบรบเหงาเปิดแล้ว", Duration = 3 })
        end
    end
})
myConfig:Register("AutoFarm", FarmToggle)

local FarmRangeSlider = FarmTab:Slider({
    Title = "ระยะโจมตี",
    Step = 5,
    Value = { Min = 10, Max = 100, Default = farmRange },
    Callback = function(value) farmRange = value end
})

local AttackKeyDropdown = FarmTab:Dropdown({
    Title = "ปุ่มโจมตี",
    Values = {"E", "F", "Q", "R", "MouseButton1"},
    Default = 1,
    Callback = function(v) attackKey = v end
})

local UseSkillsToggle = FarmTab:Toggle({
    Title = "ใช้สกิล (Q/R/F)",
    Default = false,
    Callback = function(state) useSkills = state end
})

local CollectDropsToggle = FarmTab:Toggle({
    Title = "เก็บของอัตโนมัติ",
    Default = false,
    Callback = function(state) collectDrops = state end
})

FarmTab:Divider()
FarmTab:Section({Title = "📊 สถิติ"})

local MobCountLabel = FarmTab:Button({
    Title = "จำนวนม็อบในแผนที่",
    Desc = "กำลังนับ...",
    Callback = function()
        local count = 0
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                count = count + 1
            end
        end
        MobCountLabel:SetDesc("พบ " .. count .. " ตัว")
    end
})

-- ==================== WEAPON TAB ====================
local WeaponTab = Window:Tab({Title = "WEAPON", Icon = "layers"})
WeaponTab:Section({Title = "GUN MODIFIERS"})

WeaponTab:Slider({
    Title = "Fire Rate",
    Step = 10,
    Value = {Min = 100, Max = 3000, Default = 1000},
    Callback = function(v) getgenv().FireRateValue = v end
})

WeaponTab:Slider({
    Title = "Accuracy",
    Step = 0.01,
    Value = {Min = 0, Max = 1, Default = 1},
    Callback = function(v) getgenv().AccuracyValue = v end
})

WeaponTab:Slider({
    Title = "Recoil",
    Step = 0.1,
    Value = {Min = 0, Max = 10, Default = 0},
    Callback = function(v) getgenv().RecoilValue = v end
})

WeaponTab:Slider({
    Title = "Reload Time",
    Step = 0.1,
    Value = {Min = 0.1, Max = 10, Default = 0.1},
    Callback = function(v) getgenv().ReloadValue = v end
})

WeaponTab:Toggle({
    Title = "Auto Apply Gun Mods",
    Desc = "ปรับค่าปืนอัตโนมัติเมื่อถือ",
    Default = false,
    Callback = function(v)
        getgenv().automatic = v
        getgenv().GunModsAutoApply = v
        if v then WindUI:Notify({ Title = "✅ Auto Gun Mods Enabled", Duration = 2 }) end
    end
})

-- ==================== ESP TAB ====================
local ESPTab = Window:Tab({Title = "ESP", Icon = "eye"})
ESPTab:Section({Title = "PLAYER ESP"})

local NameESPToggle = ESPTab:Toggle({
    Title = "Name ESP",
    Default = false,
    Callback = function(state) nameESPEnabled = state end
})
myConfig:Register("NameESP", NameESPToggle)

local HealthESPToggle = ESPTab:Toggle({
    Title = "Health Bar",
    Default = false,
    Callback = function(state) healthESPEnabled = state end
})
myConfig:Register("HealthESP", HealthESPToggle)

local DistanceESPToggle = ESPTab:Toggle({
    Title = "Distance",
    Default = false,
    Callback = function(state) distanceESPEnabled = state end
})
myConfig:Register("DistanceESP", DistanceESPToggle)

local HighlightToggle = ESPTab:Toggle({
    Title = "Player Highlight",
    Default = false,
    Callback = function(state)
        highlightEnabled = state
        if not state then
            for _, highlight in pairs(playerHighlights) do
                pcall(function() highlight:Destroy() end)
            end
            playerHighlights = {}
        end
    end
})
myConfig:Register("HighlightESP", HighlightToggle)

ESPTab:Section({Title = "ITEM ESP"})

local ItemsESPToggle = ESPTab:Toggle({
    Title = "Inventory Viewer",
    Desc = "แสดงไอเทมในช่องเก็บของผู้เล่นอื่น",
    Default = false,
    Callback = function(state)
        ESPEnabled = state
        if state then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then createBillboardForPlayer(p) end
            end
            ESPConnection = RunService.Heartbeat:Connect(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then createBillboardForPlayer(p) end
                end
            end)
            WindUI:Notify({ Title = "✅ Inventory Viewer Enabled", Duration = 3 })
        else
            if ESPConnection then ESPConnection:Disconnect(); ESPConnection = nil end
            for _, billboard in pairs(BillboardCache) do billboard:Destroy() end
            BillboardCache = {}
            WindUI:Notify({ Title = "❌ Inventory Viewer Disabled", Duration = 3 })
        end
    end
})
myConfig:Register("ItemsESP", ItemsESPToggle)

-- ==================== CHARACTER TAB ====================
local CharTab = Window:Tab({Title = "CHARACTER", Icon = "user"})
CharTab:Section({Title = "MOVEMENT"})

local WalkSpeedToggle = CharTab:Toggle({
    Title = "Walk Speed",
    Default = false,
    Callback = function(state) walkSpeedEnabled = state end
})
myConfig:Register("WalkSpeed", WalkSpeedToggle)

local SpeedSlider = CharTab:Slider({
    Title = "Speed Multiplier",
    Step = 0.5,
    Value = { Min = 1, Max = 5, Default = 2 },
    Callback = function(value) speedValue = value * 0.05 end
})
myConfig:Register("SpeedMultiplier", SpeedSlider)

CharTab:Section({Title = "EXPLOITS"})

-- Anti Lock (Sky)
local SkyToggle = CharTab:Toggle({
    Title = "Anti Lock (Sky)",
    Desc = "ทำให้ตัวลอยฟุ้งกระจาย",
    Default = false,
    Callback = function(state)
        getgenv().Sky = state
        if state then getgenv().SkyAmount = 1500 end
    end
})
myConfig:Register("SkyLock", SkyToggle)

-- Anti Kill
local AntiKillToggle = CharTab:Toggle({
    Title = "Anti Kill",
    Desc = "ป้องกันการตาย (เทเลพอร์ตใต้แผนที่)",
    Default = false,
    Callback = function(state)
        enabled = state
        WindUI:Notify({ Title = state and "✅ Anti Kill Enabled" or "❌ Anti Kill Disabled", Duration = 3 })
    end
})
myConfig:Register("AntiKill", AntiKillToggle)

-- Auto Pickup
local PickupToggle = CharTab:Toggle({
    Title = "Auto Pickup Items",
    Desc = "เก็บไอเทมอัตโนมัติ",
    Default = false,
    Callback = function(state) sucking = state end
})
myConfig:Register("PickupItems", PickupToggle)

-- Infinite Stamina
local AutoSprintToggle = CharTab:Toggle({
    Title = "Infinite Stamina",
    Default = false,
    Callback = function(state)
        AutoSprintEnabled = state
        if state then
            task.spawn(function()
                while AutoSprintEnabled do
                    pcall(function()
                        Net.send("set_sprinting_1", true)
                        task.wait(0.5)
                        Net.send("set_sprinting_1", false)
                    end)
                    task.wait(0.1)
                end
            end)
            WindUI:Notify({ Title = "✅ Infinite Stamina Enabled", Duration = 3 })
        else
            pcall(function() Net.send("set_sprinting_1", false) end)
            WindUI:Notify({ Title = "❌ Infinite Stamina Disabled", Duration = 3 })
        end
    end
})
myConfig:Register("AutoSprint", AutoSprintToggle)

-- Auto Respawn
local AutoRespawnToggle = CharTab:Toggle({
    Title = "Auto Respawn",
    Default = false,
    Callback = function(state)
        AutoRespawnEnabled = state
        if state then
            task.spawn(function()
                while AutoRespawnEnabled do
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health <= 0 then
                        task.wait(6)
                        if AutoRespawnEnabled then
                            Net.send("death_screen_request_respawn")
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})
myConfig:Register("AutoRespawn", AutoRespawnToggle)

-- Auto Finish
local AutoFinishToggle = CharTab:Toggle({
    Title = "Auto Finish",
    Desc = "กด Finish อัตโนมัติ",
    Default = false,
    Callback = function(state)
        fastFinishEnabled = state
        if state then applyToAll() end
        WindUI:Notify({ Title = state and "✅ Auto Finish Enabled" or "❌ Auto Finish Disabled", Duration = 3 })
    end
})
myConfig:Register("AutoFinish", AutoFinishToggle)

-- Anti Ragdoll
local AntiRagdollToggle = CharTab:Toggle({
    Title = "Anti Ragdoll",
    Default = false,
    Callback = function(state)
        local enabled = state
        if not enabled then return end
        task.spawn(function()
            while enabled do
                pcall(function()
                    Net.send("end_ragdoll_early")
                    task.wait(0.3)
                    Net.send("clear_ragdoll")
                    task.wait(0.3)
                end)
            end
        end)
    end
})
myConfig:Register("AntiRagdoll", AntiRagdollToggle)

-- Hide Name
local HideNameToggle = CharTab:Toggle({
    Title = "Hide Name",
    Default = false,
    Callback = function(state)
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local gui = hrp:FindFirstChild("CharacterBillboardGui")
                    if gui then
                        local nameLabel = gui:FindFirstChild("PlayerName")
                        if nameLabel then nameLabel.Visible = not state end
                    end
                end
            end
        end)
    end
})
myConfig:Register("HideName", HideNameToggle)

CharTab:Divider()
CharTab:Section({Title = "SNAP UNDER MAP (Press Z)"})

local SnapToggle = CharTab:Toggle({
    Title = "Snap Under Map",
    Default = false,
    Callback = function(state)
        featureEnabled = state
        if state then
            clickCount = clickCount + 1
            if clickCount < 2 then return end
            startY = HumanoidRootPart and HumanoidRootPart.Position.Y or nil
            teleportActive = true
            performTeleport()
        else
            teleportActive = false
            lockedY = nil
            startY = nil
        end
    end
})
myConfig:Register("SnapUnderMap", SnapToggle)

local SnapSlider = CharTab:Slider({
    Title = "Snap Depth",
    Step = 1,
    Value = {Min = 1, Max = 50, Default = 10},
    Callback = function(value)
        maxHeight = value
        if teleportActive and HumanoidRootPart and startY then
            local bottomPos = Vector3.new(HumanoidRootPart.Position.X, startY - maxHeight, HumanoidRootPart.Position.Z)
            HumanoidRootPart.CFrame = CFrame.new(bottomPos)
            lockedY = bottomPos.Y
        end
    end
})
myConfig:Register("SnapHeight", SnapSlider)

-- ==================== MISC TAB ====================
local MiscTab = Window:Tab({Title = "MISC", Icon = "warehouse"})
MiscTab:Section({Title = "DISPLAY"})

local FPSToggle = MiscTab:Toggle({
    Title = "แสดง FPS Counter",
    Desc = "แสดงจำนวนเฟรมต่อวินาที",
    Default = true,
    Callback = function(state) fpsShowEnabled = state end
})

MiscTab:Section({Title = "SERVER"})

local ServerHopInput = MiscTab:Input({
    Title = "Server Hop by ID",
    Value = "",
    Placeholder = "job id here",
    Callback = function(input)
        if not input or input == "" then return end
        pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, input, LocalPlayer)
        end)
    end
})

MiscTab:Button({
    Title = "Server Rejoin",
    Desc = "กลับเข้าเซิร์ฟเดิม",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

MiscTab:Button({
    Title = "Server Hop (Low Players)",
    Desc = "หาเซิร์ฟคนน้อย",
    Callback = function()
        local success, servers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(
                "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
            ))
        end)
        if success and servers and servers.data then
            local available = {}
            for _, server in ipairs(servers.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(available, server)
                end
            end
            if #available > 0 then
                table.sort(available, function(a, b) return a.playing < b.playing end)
                TeleportService:TeleportToPlaceInstance(game.PlaceId, available[1].id, LocalPlayer)
            end
        end
    end
})

MiscTab:Divider()
MiscTab:Section({Title = "UTILITY"})

MiscTab:Button({
    Title = "Skip Crate Spin",
    Desc = "ข้ามการหมุนกล่อง",
    Callback = function()
        AutoSkipEnabled = true
        TrySkipCrate()
        task.wait(1)
        AutoSkipEnabled = false
    end
})

local SkipCrateToggle = MiscTab:Toggle({
    Title = "Auto Skip Crate",
    Desc = "ข้ามการหมุนกล่องอัตโนมัติ",
    Default = false,
    Callback = function(state) AutoSkipEnabled = state end
})
myConfig:Register("SkipCrate", SkipCrateToggle)

MiscTab:Button({
    Title = "Claim All Quests",
    Desc = "รับรางวัลเควสทั้งหมด",
    Callback = function()
        task.spawn(function()
            pcall(function()
                local questFrame = LocalPlayer:FindFirstChild("PlayerGui") and
                    LocalPlayer.PlayerGui:FindFirstChild("Quests") and
                    LocalPlayer.PlayerGui.Quests:FindFirstChild("QuestsHolder") and
                    LocalPlayer.PlayerGui.Quests.QuestsHolder:FindFirstChild("QuestsScrollingFrame")
                if questFrame then
                    for _, child in ipairs(questFrame:GetChildren()) do
                        if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
                            NetGet("claim_quest", child.Name)
                            task.wait(0.2)
                        end
                    end
                end
            end)
        end)
    end
})

MiscTab:Divider()
MiscTab:Section({Title = "CONFIG"})

MiscTab:Button({
    Title = "Save Config",
    Callback = function()
        if myConfig.Save then myConfig:Save() end
        WindUI:Notify({ Title = "✅ Config Saved", Duration = 2 })
    end
})

MiscTab:Button({
    Title = "Load Config",
    Callback = function()
        if myConfig.Load then myConfig:Load() end
        WindUI:Notify({ Title = "✅ Config Loaded", Duration = 2 })
    end
})

MiscTab:Button({
    Title = "Delete Config",
    Callback = function()
        if myConfig.Delete then myConfig:Delete() end
        WindUI:Notify({ Title = "✅ Config Deleted", Duration = 2 })
    end
})

-- Load config
if myConfig.Load then
    myConfig:Load()
end

-- ==================== โค้ดส่วนท้าย ====================

-- Bypass tween
local _old_tween = Util.tween
Util.tween = function(instance, tweenInfo, properties)
    if instance and instance:IsA("NumberValue") and properties and properties.Value ~= nil then
        instance.Value = properties.Value
        return { Cancel = function() end }
    end
    return _old_tween(instance, tweenInfo, properties)
end

-- Lock tools
local function lockTool(tool)
    if tool and tool:IsA("Tool") then pcall(function() tool:SetAttribute("Locked", true) end) end
end

local function setupBackpack(backpack)
    if not backpack then return end
    for _, tool in ipairs(backpack:GetChildren()) do lockTool(tool) end
    backpack.ChildAdded:Connect(lockTool)
end

local function init()
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if backpack then setupBackpack(backpack)
    else
        LocalPlayer.ChildAdded:Connect(function(child)
            if child:IsA("Backpack") then setupBackpack(child) end
        end)
    end
end

init()
LocalPlayer.CharacterAdded:Connect(function() task.wait(1); init() end)

-- Emotes bypass
local function hookButton(button)
    if not button then return end
    if button:FindFirstChild("UnlocksAtText") then button.UnlocksAtText.Visible = false end
    if button:FindFirstChild("EmoteName") then button.EmoteName.Visible = true end
    CoreUI.on_click(button, function()
        local hum = CharModule.get_hum()
        if not hum or hum.Health <= 0 then return end
        if EmotesUI.current_emote_playing.get() == button then
            EmotesUI.current_emote_playing.set(nil)
        else
            EmotesUI.current_emote_playing.set(button)
        end
        task.wait(0.12)
        EmotesUI.enabled.set(false)
    end)
    EmotesUI.current_emote_playing.hook(function(current)
        if button:FindFirstChild("EmoteEquipped") then
            button.EmoteEquipped.Visible = (current == button)
        end
    end)
end

local function hookAllEmotes()
    for _, emote in pairs(EmotesList) do
        local button = CoreUI.get("EmoteTemplate").Parent:FindFirstChild(emote.name)
        hookButton(button)
    end
end

hookAllEmotes()
LocalPlayer.CharacterAdded:Connect(function() task.wait(1); hookAllEmotes() end)

-- Item ESP
local CurrentCamera = workspace.CurrentCamera

local function getRarityColor(item)
    if item.Name == "Money" then return Color3.fromRGB(0, 255, 0) end
    for _, folder in ipairs(ItemsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            local tool = folder:FindFirstChild(item.Name)
            if tool and tool:GetAttribute("RarityName") then
                local rarity = tool:GetAttribute("RarityName")
                return RARITY_COLORS[rarity] or Color3.fromRGB(255, 255, 255)
            end
        end
    end
    return Color3.fromRGB(255, 255, 255)
end

local function cleanupItemDrawings()
    for item, d in pairs(item_drawings) do
        if not item or not item.Parent then
            if d.circle then pcall(function() d.circle:Remove() end) end
            if d.innerCircle then pcall(function() d.innerCircle:Remove() end) end
            if d.name then pcall(function() d.name:Remove() end) end
            if d.amount then pcall(function() d.amount:Remove() end) end
            if d.highlight then pcall(function() d.highlight:Destroy() end) end
            item_drawings[item] = nil
        end
    end
end

RunService.RenderStepped:Connect(function()
    cleanupItemDrawings()
    if not droppedItems then return end
    local hrp = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, d in pairs(item_drawings) do
        d.circle.Visible = false
        d.innerCircle.Visible = false
        d.name.Visible = false
        d.amount.Visible = false
        if d.highlight then d.highlight.Enabled = false end
    end
    local nearbyItems = {}
    for _, item in ipairs(droppedItems:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("PickUpZone") and not item:GetAttribute("Locked") then
            local success, pos = pcall(function() return item.PickUpZone.Position end)
            if success and pos then
                local dist = (pos - hrp.Position).Magnitude
                table.insert(nearbyItems, {item = item, dist = dist})
            end
        end
    end
    table.sort(nearbyItems, function(a, b) return a.dist < b.dist end)
    for i = 1, math.min(20, #nearbyItems) do
        local item = nearbyItems[i].item
        local d = item_drawings[item]
        if not d then
            d = {
                circle = Drawing.new("Circle"),
                innerCircle = Drawing.new("Circle"),
                name = Drawing.new("Text"),
                amount = Drawing.new("Text")
            }
            d.circle.Thickness = 2
            d.circle.Transparency = 0.7
            d.circle.Filled = false
            d.innerCircle.Thickness = 2
            d.innerCircle.Transparency = 1
            d.innerCircle.Filled = true
            d.name.Outline = true
            d.name.OutlineColor = Color3.fromRGB(0, 0, 0)
            d.name.Center = true
            d.name.Size = 16
            d.name.Font = 4
            d.amount.Outline = true
            d.amount.OutlineColor = Color3.fromRGB(0, 0, 0)
            d.amount.Center = true
            d.amount.Size = 13
            d.amount.Color = Color3.fromRGB(200, 200, 200)
            item_drawings[item] = d
        end
        if not d.highlight or not d.highlight.Parent then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0.1
            highlight.Adornee = item
            highlight.Parent = item
            d.highlight = highlight
        end
        local rootPos, onScreen = CurrentCamera:WorldToViewportPoint(item.PickUpZone.Position)
        if onScreen then
            local color = getRarityColor(item)
            local radius = math.clamp(BOX_SIZE_SCALE / rootPos.Z, 3, 6)
            if d.highlight then
                d.highlight.FillColor = color
                d.highlight.OutlineColor = color
                d.highlight.Enabled = true
            end
            d.circle.Position = Vector2.new(rootPos.X, rootPos.Y)
            d.circle.Radius = radius + 5
            d.circle.Color = color
            d.circle.Visible = true
            d.innerCircle.Position = Vector2.new(rootPos.X, rootPos.Y)
            d.innerCircle.Radius = radius
            d.innerCircle.Color = color
            d.innerCircle.Visible = true
            d.name.Color = color
            d.name.Position = Vector2.new(rootPos.X, rootPos.Y - radius - 20)
            d.name.Text = item.Name
            d.name.Visible = true
            local amount = item:GetAttribute("Amount") or 1
            d.amount.Position = Vector2.new(rootPos.X, rootPos.Y + radius + 15)
            d.amount.Text = amount > 1 and "[" .. tostring(amount) .. "]" or ""
            d.amount.Visible = amount > 1
        else
            d.circle.Visible = false
            d.innerCircle.Visible = false
            d.name.Visible = false
            d.amount.Visible = false
            if d.highlight then d.highlight.Enabled = false end
        end
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    if plr == Client then
        for _, d in pairs(item_drawings) do
            pcall(function() d.circle:Remove() end)
            pcall(function() d.innerCircle:Remove() end)
            pcall(function() d.name:Remove() end)
            pcall(function() d.amount:Remove() end)
            pcall(function() if d.highlight then d.highlight:Destroy() end end)
        end
        item_drawings = {}
    end
end)

-- ==================== เริ่มต้น ====================
task.wait(1)
print("✅ PIG HUB LOADED SUCCESSFULLY!")
print("📌 Press T to toggle UI")
print("📌 Press Z for Snap Under Map (when enabled)")