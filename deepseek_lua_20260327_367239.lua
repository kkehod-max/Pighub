-- PIG HUB - Auto Farm Level 750-900
-- แยกมาจากไก่ AutoFarm
-- ใช้ระบบ Fast Attack แบบใหม่ ไม่บัค

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- ========== SETTINGS ==========
getgenv().FastAttack = true
getgenv().MULTI_HIT = 12
getgenv().ATTACK_DELAY = 0.012
getgenv().SWITCH_TARGET = true
getgenv().DISTANCE = 250
getgenv().AutoWalkSpeed = true
getgenv().WalkSpeedValue = 50

-- ========== ข้อมูลเควส 750-900 ==========
local QuestData = {
    [1] = {
        Level = 750,
        Ms = "Diamond [Lv. 750] [Boss]",
        NameQuest = "Area1Quest",
        LevelQuest = 3,
        NameMon = "Diamond",
        CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956),
        CFrameMon = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
    },
    [2] = {
        Level = 775,
        Ms = "Swan Pirate [Lv. 775]",
        NameQuest = "Area2Quest",
        LevelQuest = 1,
        NameMon = "Swan Pirate",
        CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906),
        CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
    },
    [3] = {
        Level = 800,
        Ms = "Factory Staff [Lv. 800]",
        NameQuest = "Area2Quest",
        LevelQuest = 2,
        NameMon = "Factory Staff",
        CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906),
        CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
    },
    [4] = {
        Level = 875,
        Ms = "Marine Lieutenant [Lv. 875]",
        NameQuest = "MarineQuest3",
        LevelQuest = 1,
        NameMon = "Marine Lieutenant",
        CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
        CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
    },
    [5] = {
        Level = 900,
        Ms = "Marine Captain [Lv. 900]",
        NameQuest = "MarineQuest3",
        LevelQuest = 2,
        NameMon = "Marine Captain",
        CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
        CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
    }
}

-- ========== ตัวแปรควบคุม ==========
local AutoFarm = false
local CurrentQuest = 1
local IsAttacking = false
local CurrentTarget = nil
local AttackConnection = nil
local LastAttackTime = 0
local CurrentTargetIndex = 1

-- ========== ฟังก์ชันช่วย ==========
local function IsAlive(Char)
    local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
    return Hum and Hum.Health > 0
end

local function GetCurrentLevel()
    return LocalPlayer.Data and LocalPlayer.Data.Level.Value or 0
end

local function UpdateQuestByLevel()
    local level = GetCurrentLevel()
    for i, data in ipairs(QuestData) do
        if level >= data.Level and (i == #QuestData or level < QuestData[i+1].Level) then
            CurrentQuest = i
            return data
        end
    end
    return QuestData[#QuestData]
end

local function GetEnemies(monsterName)
    local char = LocalPlayer.Character
    if not char or not IsAlive(char) then return {} end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return {} end
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return {} end
    local list = {}
    for _, enemy in ipairs(enemies:GetChildren()) do
        if IsAlive(enemy) and enemy.Name == monsterName then
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (root.Position - hrp.Position).Magnitude
                if dist <= getgenv().DISTANCE then
                    table.insert(list, hrp)
                end
            end
        end
    end
    table.sort(list, function(a, b)
        local rootPos = root.Position
        return (rootPos - a.Position).Magnitude < (rootPos - b.Position).Magnitude
    end)
    return list
end

local function GetClosestEnemy(monsterName)
    local list = GetEnemies(monsterName)
    return list[1]
end

local function DoAttack(hrp)
    if not hrp or not hrp.Parent then return end
    local char = LocalPlayer.Character
    if not char or not IsAlive(char) then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    local Net = ReplicatedStorage:FindFirstChild("Modules")
    if Net then Net = Net:FindFirstChild("Net") end
    if not Net then Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net") end
    
    local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
    local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
    if not RegisterAttack then RegisterAttack = Net:WaitForChild("RE/RegisterAttack") end
    if not RegisterHit then RegisterHit = Net:WaitForChild("RE/RegisterHit") end
    
    pcall(function()
        RegisterAttack:FireServer(hrp)
        for i = 1, getgenv().MULTI_HIT do
            RegisterHit:FireServer(hrp)
            task.wait(0.002)
        end
    end)
end

local function GetWeapon()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                return tool
            end
        end
    end
    return nil
end

local function EquipWeapon()
    local tool = GetWeapon()
    if tool and tool.Parent ~= LocalPlayer.Character then
        LocalPlayer.Character.Humanoid:EquipTool(tool)
        task.wait(0.3)
    end
end

local function UseBuso()
    pcall(function()
        if not LocalPlayer.Character:FindFirstChild("HasBuso") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end
    end)
end

local function TeleportTo(cframe)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = cframe
end

local function TweenTo(cframe)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local dist = (hrp.Position - cframe.Position).Magnitude
    local speed = dist < 500 and 300 or 250
    local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, info, {CFrame = cframe})
    tween:Play()
    return tween
end

local function StartQuest(questData)
    if not questData then return end
    pcall(function()
        local args = {
            [1] = "StartQuest",
            [2] = questData.NameQuest,
            [3] = questData.LevelQuest
        }
        ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

local function AbandonQuest()
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
end

local function IsQuestActive(questData)
    if not questData then return false end
    local gui = LocalPlayer.PlayerGui:FindFirstChild("Main")
    if not gui then return false end
    local quest = gui:FindFirstChild("Quest")
    if not quest or not quest.Visible then return false end
    local title = quest:FindFirstChild("Container")
    if title and title:FindFirstChild("QuestTitle") and title.QuestTitle:FindFirstChild("Title") then
        return string.find(title.QuestTitle.Title.Text, questData.NameMon)
    end
    return false
end

-- ========== Fast Attack System ==========
local function StartFastAttack()
    if AttackConnection then AttackConnection:Disconnect() end
    
    AttackConnection = RunService.Heartbeat:Connect(function()
        if not getgenv().FastAttack then return end
        if not AutoFarm then return end
        
        local now = tick()
        if now - LastAttackTime < getgenv().ATTACK_DELAY then return end
        
        local char = LocalPlayer.Character
        if not char or not IsAlive(char) then return end
        
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool then return end
        
        local questData = UpdateQuestByLevel()
        local enemiesList = GetEnemies(questData.Ms)
        
        if #enemiesList == 0 then
            CurrentTargetIndex = 1
            CurrentTarget = nil
            return
        end
        
        local target = nil
        if getgenv().SWITCH_TARGET and #enemiesList > 1 then
            CurrentTargetIndex = (CurrentTargetIndex % #enemiesList) + 1
            target = enemiesList[CurrentTargetIndex]
        else
            target = enemiesList[1]
        end
        
        if target and target.Parent then
            CurrentTarget = target
            DoAttack(target)
            LastAttackTime = now
        end
    end)
end

-- ========== ระบบเดินอัตโนมัติ ==========
local CurrentTween = nil
local IsMoving = false

local function StopMoving()
    if CurrentTween then
        pcall(function() CurrentTween:Cancel() end)
        CurrentTween = nil
    end
    IsMoving = false
end

local function MoveTo(cframe, distance)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local dist = (hrp.Position - cframe.Position).Magnitude
    if dist <= distance then
        StopMoving()
        return true
    end
    StopMoving()
    local speed = dist < 500 and 300 or 250
    local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
    CurrentTween = TweenService:Create(hrp, info, {CFrame = cframe})
    CurrentTween:Play()
    IsMoving = true
    CurrentTween.Completed:Connect(function()
        IsMoving = false
        CurrentTween = nil
    end)
    return false
end

-- ========== หลักการทำงาน ==========
local function AutoFarmLoop()
    task.spawn(function()
        while AutoFarm do
            task.wait(0.1)
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not IsAlive(char) then
                    task.wait(1)
                    continue
                end
                
                local questData = UpdateQuestByLevel()
                if not questData then continue end
                
                -- ตั้งความเร็วเดิน
                if getgenv().AutoWalkSpeed then
                    char.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
                end
                
                -- ตรวจสอบว่าเควส active หรือไม่
                local questActive = IsQuestActive(questData)
                
                if not questActive then
                    -- ไปรับเควส
                    if not IsMoving then
                        MoveTo(questData.CFrameQuest, 30)
                    end
                    
                    if (char.HumanoidRootPart.Position - questData.CFrameQuest.Position).Magnitude <= 30 then
                        StopMoving()
                        task.wait(0.5)
                        StartQuest(questData)
                        task.wait(1)
                    end
                else
                    -- เควส active หา monster
                    local target = GetClosestEnemy(questData.Ms)
                    
                    if target then
                        -- มี monster ให้โจมตี
                        StopMoving()
                        UseBuso()
                        EquipWeapon()
                        
                        -- กระโดดถ้าจำเป็น
                        if char.Humanoid and char.HumanoidRootPart.Position.Y < target.Position.Y - 5 then
                            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    else
                        -- ไม่มี monster ให้ไปหา
                        if not IsMoving then
                            MoveTo(questData.CFrameMon, 50)
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== ควบคุม UI ==========
local function CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PigHubAutoFarm"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 250, 0, 200)
    MainFrame.Position = UDim2.new(0, 10, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
    
    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.BackgroundTransparency = 1
    Title.Text = "PIG HUB - Auto Farm 750-900"
    Title.TextColor3 = Color3.fromRGB(255, 105, 180)
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true
    
    local ToggleBtn = Instance.new("TextButton", MainFrame)
    ToggleBtn.Size = UDim2.new(0.8, 0, 0, 40)
    ToggleBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.Text = "START"
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextScaled = true
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)
    
    local Status = Instance.new("TextLabel", MainFrame)
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0.55, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "Status: Stopped"
    Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    Status.Font = Enum.Font.Gotham
    Status.TextScaled = true
    
    local LevelText = Instance.new("TextLabel", MainFrame)
    LevelText.Size = UDim2.new(1, 0, 0, 25)
    LevelText.Position = UDim2.new(0, 0, 0.7, 0)
    LevelText.BackgroundTransparency = 1
    LevelText.Text = "Level: " .. (LocalPlayer.Data and LocalPlayer.Data.Level.Value or 0)
    LevelText.TextColor3 = Color3.fromRGB(255, 200, 100)
    LevelText.Font = Enum.Font.Gotham
    LevelText.TextScaled = true
    
    local TargetText = Instance.new("TextLabel", MainFrame)
    TargetText.Size = UDim2.new(1, 0, 0, 25)
    TargetText.Position = UDim2.new(0, 0, 0.82, 0)
    TargetText.BackgroundTransparency = 1
    TargetText.Text = "Target: -"
    TargetText.TextColor3 = Color3.fromRGB(150, 255, 150)
    TargetText.Font = Enum.Font.Gotham
    TargetText.TextScaled = true
    
    local function UpdateUI()
        while ScreenGui and ScreenGui.Parent do
            task.wait(0.5)
            local level = LocalPlayer.Data and LocalPlayer.Data.Level.Value or 0
            LevelText.Text = "Level: " .. level
            local questData = UpdateQuestByLevel()
            if questData then
                TargetText.Text = "Target: " .. questData.Ms
            end
            Status.Text = AutoFarm and "Status: RUNNING" or "Status: Stopped"
            ToggleBtn.Text = AutoFarm and "STOP" or "START"
        end
    end
    
    ToggleBtn.MouseButton1Click:Connect(function()
        AutoFarm = not AutoFarm
        if AutoFarm then
            StartFastAttack()
            AutoFarmLoop()
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 100)
        else
            StopMoving()
            if AttackConnection then AttackConnection:Disconnect() end
            AttackConnection = nil
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            AbandonQuest()
        end
    end)
    
    task.spawn(UpdateUI)
    
    -- ปุ่มปิด
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -30, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 12)
    CloseBtn.MouseButton1Click:Connect(function()
        AutoFarm = false
        if AttackConnection then AttackConnection:Disconnect() end
        StopMoving()
        ScreenGui:Destroy()
    end)
end

-- ========== เปิดใช้งาน ==========
task.spawn(function()
    repeat task.wait() until LocalPlayer and LocalPlayer.Character
    repeat task.wait() until ReplicatedStorage:FindFirstChild("Remotes")
    repeat task.wait() until LocalPlayer:FindFirstChild("PlayerGui")
    CreateUI()
end)

-- ========== Hotkey ควบคุม ==========
UserInputService.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.RightControl then
        getgenv().FastAttack = not getgenv().FastAttack
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Fast Attack", 
            Text = getgenv().FastAttack and "ON" or "OFF", 
            Duration = 1
        })
    elseif i.KeyCode == Enum.KeyCode.RightAlt then
        getgenv().SWITCH_TARGET = not getgenv().SWITCH_TARGET
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Switch Target", 
            Text = getgenv().SWITCH_TARGET and "ON" or "OFF", 
            Duration = 1
        })
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PIG HUB Auto Farm 750-900",
    Text = "Loaded | RightCtrl = FastAttack ON/OFF | RightAlt = Switch Target",
    Duration = 5
})