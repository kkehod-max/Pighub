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
    Title = "PIG HUB - SAILOR PIECE",
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

-- ==================== สร้าง Tabs ====================
local FarmTab = Window:Tab({Title="Auto Farm", Icon="target"})
local QuestTab = Window:Tab({Title="Auto Quest", Icon="flag"})
local PlayerTab = Window:Tab({Title="Player", Icon="user"})
local MiscTab = Window:Tab({Title="Misc", Icon="settings"})

-- ==================== ระบบ Auto Farm อัจฉริยะ ====================
local farmActive = false
local farmRange = 30
local attackKey = "E"
local useSkills = false
local collectDrops = false
local flySpeed = 50
local currentTarget = nil
local currentQuestTarget = nil
local autoQuestEnabled = false
local currentLevel = 1
local currentZone = "Starting Island"

-- ข้อมูลโซนตามเลเวล (ปรับตาม Sailor Piece จริง)
local levelZones = {
    {level = 1, name = "Starter Island", mobs = {"Bandit", "Thug"}, questGiver = "Quest Giver 1", position = CFrame.new(100, 50, 100)},
    {level = 10, name = "Desert Island", mobs = {"Sand Bandit", "Scorpion"}, questGiver = "Quest Giver 2", position = CFrame.new(500, 50, 500)},
    {level = 30, name = "Jungle Island", mobs = {"Monkey", "Tiger"}, questGiver = "Quest Giver 3", position = CFrame.new(1000, 50, 1000)},
    {level = 60, name = "Snow Island", mobs = {"Snow Bandit", "Yeti"}, questGiver = "Quest Giver 4", position = CFrame.new(1500, 50, 1500)},
    {level = 100, name = "Sky Island", mobs = {"Sky Bandit", "Bird"}, questGiver = "Quest Giver 5", position = CFrame.new(2000, 200, 2000)},
    {level = 150, name = "Marine Base", mobs = {"Marine", "Captain"}, questGiver = "Quest Giver 6", position = CFrame.new(2500, 50, 2500)},
    {level = 200, name = "Pirate Island", mobs = {"Pirate", "Boss"}, questGiver = "Quest Giver 7", position = CFrame.new(3000, 50, 3000)},
    {level = 300, name = "New World", mobs = {"Elite Pirate", "Warlord"}, questGiver = "Quest Giver 8", position = CFrame.new(4000, 100, 4000)},
    {level = 500, name = "Final Island", mobs = {"Admiral", "Yonko"}, questGiver = "Quest Giver 9", position = CFrame.new(5000, 150, 5000)},
}

-- อัปเดตเลเวลปัจจุบัน
function updatePlayerLevel()
    pcall(function()
        local stats = LocalPlayer:FindFirstChild("leaderstats")
        if stats then
            local lvl = stats:FindFirstChild("Lv") or stats:FindFirstChild("Level") or stats:FindFirstChild("Lvl")
            if lvl then
                currentLevel = lvl.Value
            end
        end
    end)
    return currentLevel
end

-- หาโซนตามเลเวล
function getZoneForLevel(level)
    local bestZone = levelZones[1]
    for _, zone in ipairs(levelZones) do
        if level >= zone.level then
            bestZone = zone
        else
            break
        end
    end
    return bestZone
end

-- ฟังก์ชันบินไปยังตำแหน่ง
function flyTo(targetCFrame, offset)
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    offset = offset or Vector3.new(0, 10, 0)
    local targetPos = targetCFrame.Position + offset
    local distance = (hrp.Position - targetPos).Magnitude
    
    if distance > 10 then
        -- บินแบบ smooth
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = (targetPos - hrp.Position).Unit * flySpeed
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Parent = hrp
        
        -- รอจนกว่าใกล้ถึง
        repeat
            task.wait()
            distance = (hrp.Position - targetPos).Magnitude
        until distance < 15 or not farmActive
        
        bodyVelocity:Destroy()
    end
    
    -- ปรับตำแหน่งครั้งสุดท้าย
    hrp.CFrame = CFrame.new(targetPos)
end

-- ฟังก์ชันรับเควส
function acceptQuest(questGiverName)
    local questGiver = workspace:FindFirstChild(questGiverName, true)
    if not questGiver then return false end
    
    -- บินไปหา quest giver
    flyTo(questGiver:GetPivot())
    
    -- กดพูดคุย (อาจต้องปรับตามเกม)
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, "E", false, game)
    task.wait(0.5)
    virtualInput:SendKeyEvent(false, "E", false, game)
    
    -- กดรับเควส
    task.wait(1)
    virtualInput:SendKeyEvent(true, "E", false, game)
    task.wait(0.5)
    virtualInput:SendKeyEvent(false, "E", false, game)
    
    return true
end

-- ฟังก์ชันส่งเควส
function completeQuest(questGiverName)
    local questGiver = workspace:FindFirstChild(questGiverName, true)
    if not questGiver then return false end
    
    flyTo(questGiver:GetPivot())
    
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, "E", false, game)
    task.wait(0.5)
    virtualInput:SendKeyEvent(false, "E", false, game)
    
    task.wait(1)
    virtualInput:SendKeyEvent(true, "E", false, game)
    task.wait(0.5)
    virtualInput:SendKeyEvent(false, "E", false, game)
    
    return true
end

-- ฟังก์ชันเช็คว่าเควสสำเร็จหรือยัง
function isQuestComplete()
    -- ตรวจสอบจาก UI เควส (ต้องปรับตามเกม)
    local success = pcall(function()
        local questUI = PlayerGui:FindFirstChild("Quests")
        if questUI then
            local progress = questUI:FindFirstChild("Progress")
            if progress and progress.Text:find("Complete") then
                return true
            end
        end
        return false
    end)
    return success
end

-- ฟังก์ชันหา mob ตามที่กำหนด
function findMobsByType(mobNames)
    local mobs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            for _, mobName in ipairs(mobNames) do
                if obj.Name:find(mobName) then
                    if obj.Humanoid.Health > 0 then
                        table.insert(mobs, obj)
                        break
                    end
                end
            end
        end
    end
    return mobs
end

-- ฟังก์ชันหา mob ที่ใกล้สุดตามประเภท
function getClosestMobByType(mobNames)
    local character = LocalPlayer.Character
    if not character then return nil, math.huge end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, math.huge end
    
    local closest = nil
    local closestDist = math.huge
    local mobs = findMobsByType(mobNames)
    
    for _, mob in ipairs(mobs) do
        local mobHrp = mob:FindFirstChild("HumanoidRootPart")
        if mobHrp then
            local dist = (hrp.Position - mobHrp.Position).Magnitude
            if dist < closestDist then
                closestDist = dist
                closest = mob
            end
        end
    end
    return closest, closestDist
end

-- ฟังก์ชันเดิน/บินไปหา mob
function moveToMob(mob)
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local mobHrp = mob:FindFirstChild("HumanoidRootPart")
    if not hrp or not mobHrp then return end
    
    local dist = (hrp.Position - mobHrp.Position).Magnitude
    
    if dist > farmRange then
        -- ใช้บินเมื่อไกล
        flyTo(CFrame.new(mobHrp.Position), Vector3.new(0, 5, 0))
    else
        -- ใช้เดินเมื่อใกล้
        character.Humanoid:MoveTo(mobHrp.Position)
    end
end

-- ฟังก์ชันโจมตี
function attackMob()
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, attackKey, false, game)
    task.wait(0.1)
    virtualInput:SendKeyEvent(false, attackKey, false, game)
end

-- ฟังก์ชันใช้สกิล
function useSkill(skillKey)
    if not useSkills then return end
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, skillKey, false, game)
    task.wait(0.1)
    virtualInput:SendKeyEvent(false, skillKey, false, game)
end

-- ฟังก์ชันเก็บของ
function collectDropsFunc()
    if not collectDrops then return end
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and (obj.Name:find("Drop") or obj.Name:find("Chest") or obj.Name:find("Money") or obj.Name:find("Item")) then
            local dist = (hrp.Position - obj.Position).Magnitude
            if dist < 10 then
                flyTo(CFrame.new(obj.Position), Vector3.new(0, 2, 0))
                firetouchinterest(hrp, obj, 0)
                task.wait(0.1)
                firetouchinterest(hrp, obj, 1)
            end
        end
    end
end

-- Auto Quest + Farm Loop หลัก
task.spawn(function()
    while true do
        if farmActive or autoQuestEnabled then
            -- อัปเดตเลเวลทุกครั้ง
            updatePlayerLevel()
            local currentZone = getZoneForLevel(currentLevel)
            
            if autoQuestEnabled then
                -- โหมด Auto Quest
                if not currentQuestTarget then
                    -- ไปรับเควสใหม่
                    acceptQuest(currentZone.questGiver)
                    task.wait(2)
                    currentQuestTarget = currentZone
                else
                    -- ตี mob ตามเควส
                    local target, dist = getClosestMobByType(currentZone.mobs)
                    
                    if target then
                        if dist > farmRange then
                            moveToMob(target)
                        else
                            attackMob()
                            useSkill("Q")
                            task.wait(0.3)
                            useSkill("R")
                            collectDropsFunc()
                        end
                        
                        -- เช็คว่าเควสเสร็จยัง
                        if isQuestComplete() then
                            completeQuest(currentZone.questGiver)
                            currentQuestTarget = nil
                            task.wait(3)
                        end
                    else
                        -- ไม่เจอ mob เดินหา
                        local character = LocalPlayer.Character
                        if character then
                            local hrp = character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local randomPos = hrp.Position + Vector3.new(math.random(-30, 30), 0, math.random(-30, 30))
                                flyTo(CFrame.new(randomPos))
                            end
                        end
                    end
                end
            elseif farmActive then
                -- โหมด Farm ธรรมดา
                local target, dist = getClosestMobByType(currentZone.mobs)
                
                if target then
                    if dist > farmRange then
                        moveToMob(target)
                    else
                        attackMob()
                        useSkill("Q")
                        task.wait(0.3)
                        useSkill("R")
                        collectDropsFunc()
                    end
                else
                    -- ไม่เจอ mob เดินสุ่ม
                    local character = LocalPlayer.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local randomPos = hrp.Position + Vector3.new(math.random(-50, 50), 0, math.random(-50, 50))
                            flyTo(CFrame.new(randomPos))
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ==================== UI Controls ====================
FarmTab:Section({Title="⚔️ AUTO FARM SETTINGS"})

FarmTab:Toggle({ 
    Title = "Enable Auto Farm", 
    Desc = "เปิด/ปิดระบบตีมอนสเตอร์อัตโนมัติ", 
    Default = false, 
    Callback = function(v) 
        farmActive = v 
        if v then autoQuestEnabled = false end
    end 
})

FarmTab:Slider({ 
    Title = "Attack Range", 
    Desc = "ระยะที่เริ่มโจมตี (เมตร)", 
    Step = 1, 
    Value = {Min = 10, Max = 100, Default = 30}, 
    Callback = function(v) farmRange = v end 
})

FarmTab:Slider({ 
    Title = "Fly Speed", 
    Desc = "ความเร็วในการบิน", 
    Step = 5, 
    Value = {Min = 20, Max = 200, Default = 50}, 
    Callback = function(v) flySpeed = v end 
})

FarmTab:Dropdown({ 
    Title = "Attack Key", 
    Desc = "เลือกปุ่มโจมตีหลัก", 
    Values = {"E", "F", "Q", "R", "MouseButton1"}, 
    Default = 1, 
    Callback = function(v) attackKey = v end 
})

FarmTab:Toggle({ 
    Title = "Use Skills (Q/R)", 
    Desc = "ใช้สกิล Q และ R อัตโนมัติ", 
    Default = false, 
    Callback = function(v) useSkills = v end 
})

FarmTab:Toggle({ 
    Title = "Auto Collect Drops", 
    Desc = "เก็บของที่ดรอปอัตโนมัติ", 
    Default = false, 
    Callback = function(v) collectDrops = v end 
})

-- ==================== AUTO QUEST TAB ====================
QuestTab:Section({Title="📋 AUTO QUEST SYSTEM"})

QuestTab:Toggle({ 
    Title = "Enable Auto Quest", 
    Desc = "บินรับเควส + ตีมอนตามเลเวลอัตโนมัติ", 
    Default = false, 
    Callback = function(v) 
        autoQuestEnabled = v 
        if v then farmActive = false end
    end 
})

QuestTab:Button({ 
    Title = "Current Level: " .. currentLevel, 
    Desc = "แตะเพื่ออัปเดตเลเวล", 
    Callback = function() 
        currentLevel = updatePlayerLevel()
        QuestTab:Button({Title = "Current Level: " .. currentLevel})
    end 
})

QuestTab:Button({ 
    Title = "Go to Quest Giver", 
    Desc = "บินไปหา NPC รับเควสตามเลเวล", 
    Callback = function()
        currentLevel = updatePlayerLevel()
        local zone = getZoneForLevel(currentLevel)
        local questGiver = workspace:FindFirstChild(zone.questGiver, true)
        if questGiver then
            flyTo(questGiver:GetPivot())
        end
    end 
})

QuestTab:Button({ 
    Title = "Accept Current Quest", 
    Desc = "กดรับเควสจาก NPC ที่อยู่ใกล้", 
    Callback = function()
        currentLevel = updatePlayerLevel()
        local zone = getZoneForLevel(currentLevel)
        acceptQuest(zone.questGiver)
    end 
})

QuestTab:Button({ 
    Title = "Complete Current Quest", 
    Desc = "ส่งเควสเมื่อทำเสร็จ", 
    Callback = function()
        currentLevel = updatePlayerLevel()
        local zone = getZoneForLevel(currentLevel)
        completeQuest(zone.questGiver)
    end 
})

-- แสดงโซนปัจจุบัน
QuestTab:Section({Title="📍 ZONE INFORMATION"})
local ZoneDisplay = QuestTab:Button({ 
    Title = "Current Zone: " .. getZoneForLevel(currentLevel).name, 
    Desc = "Recommended Mobs: " .. table.concat(getZoneForLevel(currentLevel).mobs, ", ") 
})

-- อัปเดตโซนทุก 5 วินาที
task.spawn(function()
    while true do
        task.wait(5)
        currentLevel = updatePlayerLevel()
        local zone = getZoneForLevel(currentLevel)
        ZoneDisplay:SetTitle("Current Zone: " .. zone.name)
        ZoneDisplay:SetDesc("Recommended Mobs: " .. table.concat(zone.mobs, ", "))
    end
end)

-- ==================== PLAYER TAB ====================
PlayerTab:Section({Title="👤 PLAYER STATS"})
local LevelDisplay = PlayerTab:Button({Title="Level", Desc="<b>" .. currentLevel .. "</b>"})
local HealthDisplay = PlayerTab:Button({Title="Health", Desc="<b>100%</b>"})
local BeliDisplay = PlayerTab:Button({Title="Beli", Desc="<b>0</b>"})

-- อัปเดตสเตตัส
task.spawn(function()
    while true do
        task.wait(1)
        currentLevel = updatePlayerLevel()
        LevelDisplay:SetDesc("<b>" .. currentLevel .. "</b>")
        
        -- อัปเดต HP
        pcall(function()
            if LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
                if hum then
                    local hpPercent = math.floor((hum.Health / hum.MaxHealth) * 100)
                    HealthDisplay:SetDesc("<b>" .. hpPercent .. "%</b>")
                end
            end
        end)
        
        -- อัปเดตเงิน
        pcall(function()
            local stats = LocalPlayer:FindFirstChild("leaderstats")
            if stats then
                local beli = stats:FindFirstChild("Beli") or stats:FindFirstChild("Money")
                if beli then
                    BeliDisplay:SetDesc("<b>" .. beli.Value .. "</b>")
                end
            end
        end)
    end
end)

-- ==================== MISC TAB ====================
MiscTab:Section({Title="🛠️ MISC SETTINGS"})

MiscTab:Button({ 
    Title = "Rejoin Server", 
    Desc = "กลับเข้าเซิร์ฟเดิม", 
    Callback = function() 
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId) 
    end 
})

MiscTab:Button({ 
    Title = "Server Hop", 
    Desc = "หาเซิร์ฟใหม่ที่มีผู้เล่นน้อย", 
    Callback = function()
        local servers = HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?limit=100"):format(game.PlaceId))).data
        for _, s in ipairs(servers) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
                break
            end
        end
    end 
})

MiscTab:Button({ 
    Title = "Emergency STOP", 
    Desc = "หยุดทุกอย่างทันที (สีแดง)", 
    Callback = function() 
        farmActive = false
        autoQuestEnabled = false
        if LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = hrp:FindFirstChild("BodyVelocity")
                if bv then bv:Destroy() end
            end
        end
    end 
})

-- ปรับแต่งโซน (สำหรับคนรู้โครงสร้างเกม)
MiscTab:Section({Title="⚙️ ADVANCED"})
MiscTab:Input({ 
    Title = "Custom Mob Names", 
    Desc = "ใส่ชื่อม็อบคั่นด้วยคอมม่า", 
    Placeholder = "Bandit,Thug,Pirate", 
    Callback = function(v)
        if v and v ~= "" then
            local customMobs = {}
            for name in string.gmatch(v, "([^,]+)") do
                table.insert(customMobs, name)
            end
            if #customMobs > 0 then
                levelZones[1].mobs = customMobs
            end
        end
    end 
})