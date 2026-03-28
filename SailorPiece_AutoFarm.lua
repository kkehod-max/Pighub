local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local AutoFarm = false

local function GetLevel()
    local ok, v = pcall(function()
        return lp.leaderstats.Level.Value
    end)
    return ok and v or 0
end

local function GetQuestNumber()
    local lv = GetLevel()
    local ranges = {0,100,250,500,750,1000,1500,2000,3000,4000,5000,6250,7000,8000,9000,10000,10750,11500,12000}
    local n = 1
    for i, minLv in ipairs(ranges) do
        if lv >= minLv then n = i end
    end
    return n
end

local function FindQuestNPC(num)
    local name = "QuestNPC"..num
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == name then
            return v
        end
    end
    return nil
end

local function FlyTo(pos)
    char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    task.wait(0.15)
end

local function InteractNPC(npc)
    for _, v in pairs(npc:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
            task.wait(0.3)
            return
        end
    end
    for _, v in pairs(npc:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
            task.wait(0.3)
            return
        end
    end
end

local function FarmLoop()
    while AutoFarm do
        local qNum = GetQuestNumber()
        local npc = FindQuestNPC(qNum)

        if npc then
            local npcRoot = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
            if npcRoot then
                FlyTo(npcRoot.Position)
                task.wait(0.3)
                InteractNPC(npc)
                task.wait(0.5)
            end
        else
            StatusLabel.Text = "ไม่เจอ QuestNPC"..qNum
            task.wait(1)
        end

        task.wait(0.5)
    end
end

-- GUI
local sg = Instance.new("ScreenGui")
sg.Name = "PigHubSailor"
sg.ResetOnSpawn = false
sg.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 110)
frame.Position = UDim2.new(0.5, -110, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BorderSizePixel = 0
frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, 0, 0, 32)
bar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
bar.BorderSizePixel = 0
bar.Parent = frame
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "PIG HUB | Sailor Piece"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = bar

StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -10, 0, 25)
StatusLabel.Position = UDim2.new(0, 5, 0, 38)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: OFF"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = frame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -20, 0, 35)
btn.Position = UDim2.new(0, 10, 0, 68)
btn.BackgroundColor3 = Color3.fromRGB(40, 190, 90)
btn.BorderSizePixel = 0
btn.Text = "Auto Farm: OFF"
btn.TextColor3 = Color3.new(1,1,1)
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.Parent = frame
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)

btn.MouseButton1Click:Connect(function()
    AutoFarm = not AutoFarm
    if AutoFarm then
        btn.Text = "Auto Farm: ON"
        btn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        task.spawn(FarmLoop)
    else
        btn.Text = "Auto Farm: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(40, 190, 90)
        StatusLabel.Text = "Status: OFF"
    end
end)

RunService.Heartbeat:Connect(function()
    if AutoFarm then
        local q = GetQuestNumber()
        StatusLabel.Text = "หา QuestNPC"..q.." | Lv."..GetLevel()
    end
end)

local drag, ds, sp
bar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true; ds = i.Position; sp = frame.Position
    end
end)
bar.InputChanged:Connect(function(i)
    if drag and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
        local d = i.Position - ds
        frame.Position = UDim2.new(sp.X.Scale, sp.X.Offset+d.X, sp.Y.Scale, sp.Y.Offset+d.Y)
    end
end)
bar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = false
    end
end)

lp.CharacterAdded:Connect(function(c)
    char = c
    hrp = c:WaitForChild("HumanoidRootPart")
end)
