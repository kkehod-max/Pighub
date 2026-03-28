repeat task.wait() until game:IsLoaded()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")

local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local CommF = Remotes:WaitForChild("CommF_", 9e9)
local Enemies = workspace:WaitForChild("Enemies", 9e9)
local Player = Players.LocalPlayer
local PlayerLevel = Player.Data.Level
local Sea1 = game.PlaceId == 2753915549
local Sea2 = game.PlaceId == 4442272183
local Sea3 = game.PlaceId == 7449423635

local Quest = {CFrame.new(), CFrame.new(), "", "", 1}
local QuestTween = {}

local function FireRemote(...)
  return CommF:InvokeServer(...)
end

-- platform block สำหรับ tween farm
local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1,1,1)
block.Name = "AutoFarmBlock"
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1

getgenv().TweenSpeed = getgenv().TweenSpeed or 300
getgenv().FarmPos = getgenv().FarmPos or Vector3.new(0, 2, 0)
getgenv().AutoHaki = getgenv().AutoHaki or false
getgenv().FarmTool = getgenv().FarmTool or "Melee"
getgenv().BringMobs = getgenv().BringMobs or true
getgenv().BringMobsDistance = getgenv().BringMobsDistance or 250
getgenv().AutoClickDelay = getgenv().AutoClickDelay or 0.18
getgenv().AutoClick = getgenv().AutoClick or true

-- ========== HELPER FUNCTIONS ==========

local function VerifyNPC(EnemieName)
  for _, Enemie in pairs(Enemies:GetChildren()) do
    if Enemie.Name == EnemieName then
      local h = Enemie:FindFirstChild("Humanoid")
      if h and h.Health > 0 then return true end
    end
  end
  for _, v in pairs(ReplicatedStorage:GetChildren()) do
    if v.Name == EnemieName then
      local h = v:FindFirstChild("Humanoid")
      if h and h.Health > 0 then return true end
    end
  end
end

local function VerifyTool(ToolName)
  local c = Player.Character
  local b = Player.Backpack
  if c and c:FindFirstChild(ToolName) then return true end
  if b and b:FindFirstChild(ToolName) then return true end
end

local function VerifyQuest(EnemieName)
  local ok, QuestUI = pcall(function()
    return Player.PlayerGui.Main.Quest
  end)
  if not ok or not QuestUI then return false end
  local Text1 = QuestUI.Container.QuestTitle.Title.Text:gsub("-",""):lower()
  local Text2 = EnemieName:gsub("-",""):lower()
  return QuestUI.Visible and Text1:find(Text2)
end

local function QuestVisible()
  local ok, QuestUI = pcall(function()
    return Player.PlayerGui.Main.Quest
  end)
  if not ok or not QuestUI then return false end
  return QuestUI.Visible
end

local function EquipToolName(NameTool)
  local b = Player.Backpack
  local c = Player.Character
  local h = c and c:FindFirstChild("Humanoid")
  if b and h and b:FindFirstChild(NameTool) then
    h:EquipTool(b[NameTool])
  end
end

local function EquipTool()
  local b = Player.Backpack
  for _, tool in pairs(b:GetChildren()) do
    if tool and tool.ToolTip == getgenv().FarmTool then
      EquipToolName(tool.Name) return
    end
  end
end

local function ActiveHaki()
  local c = Player.Character
  if getgenv().AutoHaki and c and not c:FindFirstChild("HasBuso") then
    FireRemote("Buso")
  end
end

local TeleportPos
local function PlayerTP(Tween_Pos)
  TeleportPos = Tween_Pos.p
  local plrPP = Player.Character and Player.Character.PrimaryPart
  if not plrPP then return end
  local Distance = (plrPP.Position - Tween_Pos.p).Magnitude
  if block then
    if Distance <= 450 then
      TweenService:Create(block, TweenInfo.new(Distance / (getgenv().TweenSpeed * 1.8), Enum.EasingStyle.Linear), {CFrame = Tween_Pos}):Play()
    else
      TweenService:Create(block, TweenInfo.new(Distance / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Tween_Pos}):Play()
    end
  end
end

local function BringNPC(Enemie)
  if not getgenv().BringMobs or not getgenv().BringMobsDistance then return end
  for _, NPC in pairs(Enemies:GetChildren()) do
    if NPC.Name == Enemie.Name then
      local h = NPC:FindFirstChild("Humanoid")
      if h and h.Health > 0 then
        local p1, p2 = NPC.PrimaryPart, Enemie.PrimaryPart
        if p1 and p2 then
          local mag = (p1.Position - p2.Position).Magnitude
          if mag < getgenv().BringMobsDistance and mag >= 1 then
            p1.CFrame = p2.CFrame
            p1.CanCollide = false
            p1.Size = Vector3.new(50,50,50)
            h.WalkSpeed = 0
            h.JumpPower = 0
            h:ChangeState(14)
            if h:FindFirstChild("Animator") then h.Animator:Destroy() end
            if NPC:FindFirstChild("Head") then NPC.Head.CanCollide = false end
            pcall(function() sethiddenproperty(Player, "SimulationRadius", math.huge) end)
          end
        end
      end
    end
  end
end

local function GetEnemies(EnemiesList)
  local Distance, Nearest = math.huge
  local function Check(_, Enemie)
    if table.find(EnemiesList, Enemie.Name) then
      local h = Enemie:FindFirstChild("Humanoid")
      if h and h.Health > 0 then
        local ep = Enemie.PrimaryPart
        local pp = Player.Character and Player.Character.PrimaryPart
        if ep and pp and (pp.Position - ep.Position).Magnitude <= Distance then
          Distance = (pp.Position - ep.Position).Magnitude
          Nearest = Enemie
        end
      end
    end
  end
  table.foreach(Enemies:GetChildren(), Check)
  table.foreach(ReplicatedStorage:GetChildren(), Check)
  return Nearest
end

local function StartQuest(quest, number, QuestPos)
  local plrRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
  if plrRP and (plrRP.Position - QuestPos.p).Magnitude <= 3 then
    FireRemote("StartQuest", quest, number)
    task.wait(0.5)
  else
    PlayerTP(QuestPos)
  end
end

local function TweenNPCSpawn(pos)
  if pos then
    repeat task.wait()
      for _, v in pairs(pos) do
        if Enemies:FindFirstChild(Quest[3]) then break end
        if block then
          local tw = TweenService:Create(block, TweenInfo.new((block.Position - v.p).Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = v})
          tw:Play() tw.Completed:Wait()
        end
      end
    until not getgenv().AutoFarm_Level or Enemies:FindFirstChild(Quest[3])
  end
end

local time = tick()
local function PlayerClick()
  local plrPP = Player.Character and Player.Character.PrimaryPart
  if plrPP and TeleportPos and (plrPP.Position - TeleportPos).Magnitude > 25 then return end
  if getgenv().AutoClick and (tick() - time) >= getgenv().AutoClickDelay then
    task.spawn(function()
      VirtualUser:CaptureController()
      VirtualUser:Button1Down(Vector2.new(math.huge, math.huge))
    end)
    time = tick()
  end
end

-- ========== LEVEL QUEST TABLE ==========

local function Get_LevelQuest()
  local Level = PlayerLevel.Value
  if Sea1 then
    if Level < 10 then
      if tostring(Player.Team) == "Pirates" then
        Quest = {CFrame.new(1059,17,1546), false, "Bandit", "BanditQuest1", 1}
        QuestTween = {CFrame.new(943,45,1562), CFrame.new(1115,45,1619), CFrame.new(1265,45,1606)}
      else
        Quest = {CFrame.new(-2708,25,2103), false, "Trainee", "MarineQuest", 1}
        QuestTween = {CFrame.new(-2754,50,2063), CFrame.new(-2950,70,2240)}
      end
    elseif Level < 15 then
      Quest = {CFrame.new(-1598,37,153), false, "Monkey", "JungleQuest", 1}
      QuestTween = {CFrame.new(-1524,50,37), CFrame.new(-1424,50,216), CFrame.new(-1554,50,359)}
    elseif Level < 30 then
      if VerifyNPC("The Gorilla King") and Level >= 20 then
        Quest = {CFrame.new(-1598,37,153), CFrame.new(-1128,6,-451), "The Gorilla King", "JungleQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1598,37,153), false, "Gorilla", "JungleQuest", 2}
        QuestTween = {CFrame.new(-1128,40,-451), CFrame.new(-1313,40,-546)}
      end
    elseif Level < 40 then
      Quest = {CFrame.new(-1140,4,3829), false, "Pirate", "BuggyQuest1", 1}
      QuestTween = {CFrame.new(-1262,40,3905), CFrame.new(-1167,40,3942)}
    elseif Level < 60 then
      if VerifyNPC("Bobby") and Level >= 55 then
        Quest = {CFrame.new(-1140,4,3829), CFrame.new(-1131,14,4080), "Bobby", "BuggyQuest1", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1140,4,3829), false, "Brute", "BuggyQuest1", 2}
        QuestTween = {CFrame.new(-976,55,4304), CFrame.new(-1196,55,4287)}
      end
    elseif Level < 75 then
      Quest = {CFrame.new(897,6,4389), CFrame.new(938,6,4470), "Desert Bandit", "DesertQuest", 1}
      QuestTween = nil
    elseif Level < 90 then
      Quest = {CFrame.new(897,6,4389), CFrame.new(1546,14,4384), "Desert Officer", "DesertQuest", 2}
      QuestTween = nil
    elseif Level < 100 then
      Quest = {CFrame.new(1385,87,-1298), CFrame.new(1303,106,-1441), "Snow Bandit", "SnowQuest", 1}
      QuestTween = {CFrame.new(1362,120,-1531), CFrame.new(1357,120,-1381)}
    elseif Level < 120 then
      if VerifyNPC("Yeti") and Level >= 105 then
        Quest = {CFrame.new(1385,87,-1298), CFrame.new(1185,106,-1518), "Yeti", "SnowQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(1385,87,-1298), CFrame.new(1185,106,-1518), "Snowman", "SnowQuest", 2}
        QuestTween = {CFrame.new(1243,140,-1437), CFrame.new(1072,140,-1458)}
      end
    elseif Level < 150 then
      if VerifyNPC("Vice Admiral") and Level >= 130 then
        Quest = {CFrame.new(-5035,29,4326), CFrame.new(-4807,21,4360), "Vice Admiral", "MarineQuest2", 2}
        QuestTween = nil
      else
        Quest = {CFrame.new(-5035,29,4326), CFrame.new(-4807,21,4360), "Chief Petty Officer", "MarineQuest2", 1}
        QuestTween = nil
      end
    elseif Level < 175 then
      Quest = {CFrame.new(-4844,718,-2621), CFrame.new(-4956,296,-2901), "Sky Bandit", "SkyQuest", 1}
      QuestTween = nil
    elseif Level < 190 then
      Quest = {CFrame.new(-4844,718,-2621), CFrame.new(-5268,392,-2213), "Dark Master", "SkyQuest", 2}
      QuestTween = nil
    elseif Level < 210 then
      Quest = {CFrame.new(5306,2,477), CFrame.new(5288,2,470), "Prisoner", "PrisonerQuest", 1}
      QuestTween = nil
    elseif Level < 250 then
      if VerifyNPC("Swan") and Level >= 240 then
        Quest = {CFrame.new(5191,4,692), CFrame.new(5230,4,749), "Swan", "ImpelQuest", 3}
      elseif VerifyNPC("Chief Warden") and Level >= 230 then
        Quest = {CFrame.new(5191,4,692), CFrame.new(5230,4,749), "Chief Warden", "ImpelQuest", 2}
      elseif VerifyNPC("Warden") and Level >= 220 then
        Quest = {CFrame.new(5191,4,692), CFrame.new(5230,4,749), "Warden", "ImpelQuest", 1}
      else
        Quest = {CFrame.new(5306,2,477), CFrame.new(5282,2,1052), "Dangerous Prisoner", "PrisonerQuest", 2}
      end
      QuestTween = nil
    elseif Level < 275 then
      Quest = {CFrame.new(-1581,7,-2982), CFrame.new(-1897,7,-2796), "Toga Warrior", "ColosseumQuest", 1}
      QuestTween = nil
    elseif Level < 300 then
      Quest = {CFrame.new(-1581,7,-2982), CFrame.new(-1327,59,-3231), "Gladiator", "ColosseumQuest", 2}
      QuestTween = {CFrame.new(-1268,30,-2996), CFrame.new(-1472,30,-3194)}
    elseif Level < 325 then
      Quest = {CFrame.new(-5319,12,8515), false, "Military Soldier", "MagmaQuest", 1}
      QuestTween = {CFrame.new(-5335,46,8638), CFrame.new(-5512,30,8366)}
    elseif Level < 375 then
      if VerifyNPC("Magma Admiral") and Level >= 350 then
        Quest = {CFrame.new(-5319,12,8515), CFrame.new(-5694,18,8735), "Magma Admiral", "MagmaQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-5319,12,8515), CFrame.new(-5791,97,8834), "Military Spy", "MagmaQuest", 2}
        QuestTween = nil
      end
    elseif Level < 400 then
      Quest = {CFrame.new(61122,18,1567), false, "Fishman Warrior", "FishmanQuest", 1}
      QuestTween = {CFrame.new(60998,50,1534), CFrame.new(60880,50,1675)}
    elseif Level < 450 then
      if VerifyNPC("Fishman Lord") and Level >= 425 then
        Quest = {CFrame.new(61122,18,1567), CFrame.new(61350,31,1095), "Fishman Lord", "FishmanQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(61122,18,1567), false, "Fishman Commando", "FishmanQuest", 2}
        QuestTween = {CFrame.new(61866,55,1655), CFrame.new(62043,55,1510)}
      end
    elseif Level < 475 then
      Quest = {CFrame.new(-4720,846,-1951), false, "God's Guard", "SkyExp1Quest", 1}
      QuestTween = {CFrame.new(-4641,880,-1902), CFrame.new(-4781,880,-1817)}
    elseif Level < 525 then
      if VerifyNPC("Wysper") and Level >= 500 then
        Quest = {CFrame.new(-7861,5545,-381), CFrame.new(-7927,5551,-637), "Wysper", "SkyExp1Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-7861,5545,-381), false, "Shanda", "SkyExp1Quest", 2}
        QuestTween = {CFrame.new(-7741,5580,-395), CFrame.new(-7591,5580,-466)}
      end
    elseif Level < 575 then
      Quest = {CFrame.new(-7903,5636,-1412), false, "Royal Squad", "SkyExp2Quest", 1}
      QuestTween = {CFrame.new(-7727,5650,-1410), CFrame.new(-7522,5650,-1499)}
    elseif Level < 625 then
      if VerifyNPC("Thunder God") and Level >= 575 then
        Quest = {CFrame.new(-7812,5619,-2271), CFrame.new(-7751,5607,-2315), "Thunder God", "SkyExp2Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-7812,5619,-2271), false, "Galley Pirate", "SkyExp2Quest", 2}
        QuestTween = {CFrame.new(-7600,5650,-2250), CFrame.new(-7383,5650,-2311)}
      end
    elseif Level < 675 then
      Quest = {CFrame.new(6029,14,3786), CFrame.new(6138,10,3939), "Galley Captain", "FountainQuest", 2}
      QuestTween = nil
    elseif Level < 700 then
      if VerifyNPC("Cyborg") and Level >= 675 then
        Quest = {CFrame.new(6029,14,3786), CFrame.new(6138,10,3939), "Cyborg", "FountainQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(6029,14,3786), false, "Galley Captain", "FountainQuest", 2}
        QuestTween = nil
      end
    end
  elseif Sea2 then
    if Level < 775 then
      Quest = {CFrame.new(-1569,199,-31), false, "Raider", "Area1Quest", 1}
      QuestTween = {CFrame.new(-1433,240,-130), CFrame.new(-1613,240,-193)}
    elseif Level < 825 then
      if VerifyNPC("Diamond") and Level >= 800 then
        Quest = {CFrame.new(-1569,199,-31), CFrame.new(-1569,199,-31), "Diamond", "Area1Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1569,199,-31), false, "Mercenary", "Area1Quest", 2}
        QuestTween = {CFrame.new(-1363,240,-292), CFrame.new(-1521,240,-440)}
      end
    elseif Level < 875 then
      Quest = {CFrame.new(2316,449,787), false, "Swan Pirate", "Area2Quest", 1}
      QuestTween = {CFrame.new(778,110,1129), CFrame.new(1018,110,1128)}
    elseif Level < 925 then
      if VerifyNPC("Jeremy") and Level >= 900 then
        Quest = {CFrame.new(2316,449,787), CFrame.new(2316,449,787), "Jeremy", "Area2Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(2316,449,787), false, "Pirate Officer", "Area2Quest", 2}
        QuestTween = {CFrame.new(2450,449,960), CFrame.new(2238,449,1066)}
      end
    elseif Level < 975 then
      Quest = {CFrame.new(-2086,73,-4208), false, "Marine Lieutenants", "MarineQuest3", 1}
      QuestTween = {CFrame.new(-2266,100,-4178), CFrame.new(-2136,100,-4378)}
    elseif Level < 1025 then
      if VerifyNPC("Fajita") and Level >= 1000 then
        Quest = {CFrame.new(-2086,73,-4208), CFrame.new(-2086,73,-4208), "Fajita", "MarineQuest3", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-2086,73,-4208), false, "Marine Captain", "MarineQuest3", 2}
        QuestTween = {CFrame.new(-2366,100,-4408), CFrame.new(-2476,100,-4208)}
      end
    elseif Level < 1075 then
      Quest = {CFrame.new(-5078,24,-5352), false, "Snow Trooper", "IceSideQuest", 1}
      QuestTween = {CFrame.new(-5088,60,-5512), CFrame.new(-5258,60,-5432)}
    elseif Level < 1125 then
      if VerifyNPC("Smoke Admiral") and Level >= 1100 then
        Quest = {CFrame.new(-5078,24,-5352), CFrame.new(-5078,24,-5352), "Smoke Admiral", "IceSideQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-5078,24,-5352), false, "Arctic Warrior", "IceSideQuest", 2}
        QuestTween = {CFrame.new(-5288,60,-5232), CFrame.new(-5408,60,-5042)}
      end
    elseif Level < 1175 then
      Quest = {CFrame.new(6473,297,-6944), false, "Sea Soldier", "FrostQuest", 1}
      QuestTween = {CFrame.new(6583,330,-7054), CFrame.new(6343,330,-7134)}
    elseif Level < 1225 then
      if VerifyNPC("Awakened Ice Admiral") and Level >= 1200 then
        Quest = {CFrame.new(6473,297,-6944), CFrame.new(6473,297,-6944), "Awakened Ice Admiral", "FrostQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(6473,297,-6944), false, "Ice Fighter", "FrostQuest", 2}
        QuestTween = {CFrame.new(6293,330,-6924), CFrame.new(6183,330,-6744)}
      end
    elseif Level < 1275 then
      Quest = {CFrame.new(-3711,77,-11469), false, "Water Fighter", "ForgottenQuest", 1}
      QuestTween = {CFrame.new(-3339,290,-10412), CFrame.new(-3518,290,-10419)}
    elseif Level < 1325 then
      if VerifyNPC("Tide Keeper") and Level >= 1300 then
        Quest = {CFrame.new(-3711,77,-11469), CFrame.new(-3711,77,-11469), "Tide Keeper", "ForgottenQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-3711,77,-11469), false, "Sand Trooper", "ForgottenQuest", 2}
        QuestTween = {CFrame.new(-3836,290,-10667), CFrame.new(-3918,290,-10867)}
      end
    end
  elseif Sea3 then
    if Level < 1575 then
      Quest = {CFrame.new(-1049,40,6791), false, "Pirate Millionaire", "PiratePortQuest", 1}
      QuestTween = {CFrame.new(-1249,80,6941), CFrame.new(-1449,80,6791)}
    elseif Level < 1625 then
      if VerifyNPC("Stone") and Level >= 1600 then
        Quest = {CFrame.new(-1049,40,6791), CFrame.new(-1049,40,6791), "Stone", "PiratePortQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1049,40,6791), false, "Pistol Billionaire", "PiratePortQuest", 2}
        QuestTween = {CFrame.new(-1549,80,6791), CFrame.new(-1649,80,6641)}
      end
    elseif Level < 1675 then
      Quest = {CFrame.new(5730,602,199), false, "Amazon Warrior", "AmazonQuest2", 1}
      QuestTween = {CFrame.new(5780,640,309), CFrame.new(5630,640,409)}
    elseif Level < 1725 then
      if VerifyNPC("Island Empress") and Level >= 1700 then
        Quest = {CFrame.new(5730,602,199), CFrame.new(5730,602,199), "Island Empress", "AmazonQuest2", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(5730,602,199), false, "Warrior Queen", "AmazonQuest2", 2}
        QuestTween = {CFrame.new(5880,640,199), CFrame.new(5930,640,49)}
      end
    elseif Level < 1775 then
      Quest = {CFrame.new(2889,424,-7233), false, "Marine Commodore", "MarineTreeIsland", 1}
      QuestTween = {CFrame.new(2739,460,-7383), CFrame.new(2589,460,-7233)}
    elseif Level < 1825 then
      if VerifyNPC("Kilo Admiral") and Level >= 1800 then
        Quest = {CFrame.new(2889,424,-7233), CFrame.new(2889,424,-7233), "Kilo Admiral", "MarineTreeIsland", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(2889,424,-7233), false, "Marine Vice Admiral", "MarineTreeIsland", 2}
        QuestTween = {CFrame.new(2689,460,-7083), CFrame.new(2489,460,-6933)}
      end
    elseif Level < 1875 then
      Quest = {CFrame.new(-13233,332,-7626), false, "Forest Pirate", "DeepForestIsland", 1}
      QuestTween = {CFrame.new(-13335,380,-7660), CFrame.new(-13138,380,-7713)}
    elseif Level < 1925 then
      if VerifyNPC("Captain Elephant") and Level >= 1900 then
        Quest = {CFrame.new(-13233,332,-7626), CFrame.new(-13393,319,-8423), "Captain Elephant", "DeepForestIsland", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-13233,332,-7626), false, "Mythological Pirate", "DeepForestIsland", 2}
        QuestTween = {CFrame.new(-13844,520,-7016), CFrame.new(-13710,520,-6856)}
      end
    elseif Level < 1975 then
      Quest = {CFrame.new(-12682,391,-9901), false, "Jungle Pirate", "DeepForestIsland2", 1}
      QuestTween = {CFrame.new(-12166,380,-10375), CFrame.new(-12303,380,-10639)}
    elseif Level < 2025 then
      Quest = {CFrame.new(-12682,391,-9901), false, "Musketeer Pirate", "DeepForestIsland2", 2}
      QuestTween = {CFrame.new(-13098,450,-9831), CFrame.new(-13222,450,-9621)}
    elseif Level < 2075 then
      Quest = {CFrame.new(-9481,142,5565), false, "Reborn Skeleton", "HauntedQuest1", 1}
      QuestTween = {CFrame.new(-8680,190,5852), CFrame.new(-8879,190,5900)}
    elseif Level < 2100 then
      Quest = {CFrame.new(-9481,142,5565), false, "Living Zombie", "HauntedQuest1", 2}
      QuestTween = {CFrame.new(-10104,200,5739), CFrame.new(-10078,200,5953)}
    elseif Level < 2125 then
      Quest = {CFrame.new(-818,66,-10964), false, "Ice Cream Chef", "IceCreamIslandQuest", 1}
      QuestTween = {CFrame.new(-501,100,-10883), CFrame.new(-763,100,-10834)}
    elseif Level < 2175 then
      Quest = {CFrame.new(-818,66,-10964), false, "Ice Cream Commander", "IceCreamIslandQuest", 2}
      QuestTween = {CFrame.new(-690,100,-11350), CFrame.new(-534,100,-11284)}
    elseif Level < 2225 then
      Quest = {CFrame.new(-2023,38,-12028), false, "Cookie Crafter", "CakeQuest1", 1}
      QuestTween = {CFrame.new(-2332,90,-12049), CFrame.new(-2468,90,-12121)}
    elseif Level < 2275 then
      Quest = {CFrame.new(-2023,38,-12028), false, "Cake Guard", "CakeQuest1", 2}
      QuestTween = {CFrame.new(-1514,90,-12422), CFrame.new(-1455,90,-12244)}
    elseif Level < 2325 then
      Quest = {CFrame.new(-1931,38,-12840), false, "Baking Staff", "CakeQuest2", 1}
      QuestTween = {CFrame.new(-1930,90,-12963), CFrame.new(-1803,90,-13115)}
    elseif Level < 2375 then
      Quest = {CFrame.new(-1931,38,-12840), false, "Head Baker", "CakeQuest2", 2}
      QuestTween = {CFrame.new(-2123,110,-12777), CFrame.new(-2281,110,-12748)}
    elseif Level < 2400 then
      Quest = {CFrame.new(235,25,-12199), false, "Cocoa Warrior", "ChocQuest1", 1}
      QuestTween = {CFrame.new(110,80,-12245), CFrame.new(-71,80,-12292)}
    elseif Level < 2425 then
      Quest = {CFrame.new(235,25,-12199), false, "Chocolate Bar Battler", "ChocQuest1", 2}
      QuestTween = {CFrame.new(579,80,-12413), CFrame.new(735,80,-12659)}
    elseif Level < 2450 then
      Quest = {CFrame.new(150,25,-12777), false, "Sweet Thief", "ChocQuest2", 1}
      QuestTween = {CFrame.new(-68,80,-12692), CFrame.new(90,80,-12519)}
    elseif Level < 2475 then
      Quest = {CFrame.new(150,25,-12777), false, "Candy Rebel", "ChocQuest2", 2}
      QuestTween = {CFrame.new(17,80,-12962), CFrame.new(158,80,-12961)}
    elseif Level < 2500 then
      Quest = {CFrame.new(-16547,56,-172), false, "Isle Outlaw", "TikiQuest1", 1}
      QuestTween = {CFrame.new(-16431,90,-223), CFrame.new(-16313,50,-210)}
    elseif Level < 2525 then
      Quest = {CFrame.new(-16547,56,-172), false, "Island Boy", "TikiQuest1", 2}
      QuestTween = {CFrame.new(-16668,70,-243), CFrame.new(-16744,60,-195)}
    elseif Level < 2550 then
      Quest = {CFrame.new(-16540,56,1051), false, "Sun-kissed Warrior", "TikiQuest2", 1}
      QuestTween = {CFrame.new(-16345,80,1004), CFrame.new(-16425,77,1059)}
    else
      Quest = {CFrame.new(-16540,56,1051), false, "Isle Champion", "TikiQuest2", 2}
      QuestTween = {CFrame.new(-16634,85,1106), CFrame.new(-16735,60,1075)}
    end
  end
end

PlayerLevel.Changed:Connect(Get_LevelQuest)
task.spawn(function() while task.wait(1) do pcall(Get_LevelQuest) end end)
Get_LevelQuest()

-- ========== PLATFORM SYSTEM ==========

repeat task.wait() until Player.Character and Player.Character.PrimaryPart
block.CFrame = Player.Character.PrimaryPart.CFrame

task.spawn(function()
  while task.wait() do
    pcall(function()
      if getgenv().AutoFarm_Level then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP then
          if (plrPP.Position - block.Position).Magnitude <= 200 then
            plrPP.CFrame = block.CFrame
          else
            block.CFrame = plrPP.CFrame
          end
        end
        local plrChar = Player.Character
        if plrChar then
          for _, part in pairs(plrChar:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
          end
          if plrChar:FindFirstChild("Stun") and plrChar.Stun.Value ~= 0 then
            plrChar.Stun.Value = 0
          end
          if plrChar:FindFirstChild("Busy") and plrChar.Busy.Value then
            plrChar.Busy.Value = false
          end
        end
      else
        local plrChar = Player.Character
        if plrChar then
          for _, part in pairs(plrChar:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = true end
          end
        end
      end
    end)
  end
end)

-- ========== AUTO FARM LEVEL ==========

local function AutoFarm_Level()
  while getgenv().AutoFarm_Level do task.wait()
    local Enemie = GetEnemies({Quest[3]})
    QuestVisible()
    if not VerifyQuest(Quest[3]) then
      StartQuest(Quest[4], Quest[5], Quest[1])
    elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
      PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function() PlayerClick() ActiveHaki() EquipTool() BringNPC(Enemie) end)
    else
      local plrPP = Player.Character and Player.Character.PrimaryPart
      if QuestTween and QuestTween[1] and plrPP and (plrPP.Position - QuestTween[1].p).Magnitude < 1200 then
        TweenNPCSpawn(QuestTween)
      elseif Quest[2] then
        PlayerTP(Quest[2])
      else
        PlayerTP(Quest[1])
      end
    end
  end
end

-- ========== AUTO FARM NEAREST ==========

local function AutoFarmNearest()
  repeat task.wait() until Player.Character and Player.Character.PrimaryPart
  local SavePos = Player.Character.PrimaryPart.Position

  local function GetNearest()
    local Distance, Nearest = 2500
    for _, Enemie in pairs(Enemies:GetChildren()) do
      local h = Enemie:FindFirstChild("Humanoid")
      if h and h.Health > 0 then
        local ep = Enemie.PrimaryPart
        local pp = Player.Character and Player.Character.PrimaryPart
        if ep and pp and (pp.Position - ep.Position).Magnitude <= Distance then
          Distance = (pp.Position - ep.Position).Magnitude
          Nearest = Enemie
        end
      end
    end
    return Nearest
  end

  while getgenv().AutoFarmNearest do task.wait()
    if not getgenv().AutoFarm_Level then
      local Enemie = GetNearest()
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function() PlayerClick() ActiveHaki() EquipTool() BringNPC(Enemie) end)
      else
        PlayerTP(CFrame.new(SavePos))
      end
    end
  end
end

-- ========== FAST ATTACK (NEW SYSTEM) ==========

local FA_Net = ReplicatedStorage:FindFirstChild("Modules")
if FA_Net then FA_Net = FA_Net:FindFirstChild("Net") end
if not FA_Net then FA_Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net") end

local RegisterAttack = FA_Net:FindFirstChild("RE/RegisterAttack") or FA_Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = FA_Net:FindFirstChild("RE/RegisterHit") or FA_Net:WaitForChild("RE/RegisterHit")

getgenv().FastAttack = true
getgenv().MULTI_HIT = getgenv().MULTI_HIT or 12
getgenv().ATTACK_DELAY = getgenv().ATTACK_DELAY or 0.012
getgenv().SWITCH_TARGET = getgenv().SWITCH_TARGET ~= false
getgenv().DISTANCE = getgenv().DISTANCE or 250

local FA_LastAttack = 0
local FA_TargetIndex = 1

local function FA_IsAlive(Char)
  local h = Char and Char:FindFirstChildOfClass("Humanoid")
  return h and h.Health > 0
end

local function FA_GetEnemies()
  local Char = Player.Character
  if not Char or not FA_IsAlive(Char) then return {} end
  local Root = Char:FindFirstChild("HumanoidRootPart")
  if not Root then return {} end
  local List = {}
  for _, Enemy in ipairs(Enemies:GetChildren()) do
    if FA_IsAlive(Enemy) then
      local HRP = Enemy:FindFirstChild("HumanoidRootPart")
      if HRP and (Root.Position - HRP.Position).Magnitude <= getgenv().DISTANCE then
        table.insert(List, HRP)
      end
    end
  end
  table.sort(List, function(a, b)
    return (Root.Position - a.Position).Magnitude < (Root.Position - b.Position).Magnitude
  end)
  return List
end

local function FA_DoAttack(HRP)
  if not HRP or not HRP.Parent then return end
  local Char = Player.Character
  if not Char or not FA_IsAlive(Char) then return end
  if not Char:FindFirstChildOfClass("Tool") then return end
  pcall(function()
    RegisterAttack:FireServer(HRP)
    for i = 1, getgenv().MULTI_HIT do
      RegisterHit:FireServer(HRP)
      task.wait(0.002)
    end
  end)
end

RunService.Heartbeat:Connect(function()
  if not getgenv().FastAttack then return end
  local Now = tick()
  if Now - FA_LastAttack < getgenv().ATTACK_DELAY then return end
  local Char = Player.Character
  if not Char or not FA_IsAlive(Char) then return end
  if not Char:FindFirstChildOfClass("Tool") then return end
  local List = FA_GetEnemies()
  if #List == 0 then FA_TargetIndex = 1 return end
  local Target
  if getgenv().SWITCH_TARGET and #List > 1 then
    FA_TargetIndex = (FA_TargetIndex % #List) + 1
    Target = List[FA_TargetIndex]
  else
    Target = List[1]
  end
  if Target and Target.Parent then
    FA_DoAttack(Target)
    FA_LastAttack = Now
  end
end)

-- ========== KEYBINDS ==========

UIS.InputBegan:Connect(function(i, g)
  if g then return end
  local SG = game:GetService("StarterGui")
  if i.KeyCode == Enum.KeyCode.F1 then
    getgenv().AutoFarm_Level = true
    if getgenv().AutoFarm_Level then task.spawn(AutoFarm_Level) end
    SG:SetCore("SendNotification", {Title="Auto Farm Level", Text=getgenv().AutoFarm_Level and "ON" or "OFF", Duration=1})
  elseif i.KeyCode == Enum.KeyCode.F2 then
    getgenv().AutoFarmNearest = not getgenv().AutoFarmNearest
    if getgenv().AutoFarmNearest then task.spawn(AutoFarmNearest) end
    SG:SetCore("SendNotification", {Title="Auto Farm Nearest", Text=getgenv().AutoFarmNearest and "ON" or "OFF", Duration=1})
  elseif i.KeyCode == Enum.KeyCode.RightControl then
    getgenv().FastAttack = not getgenv().FastAttack
    SG:SetCore("SendNotification", {Title="Fast Attack", Text=getgenv().FastAttack and "ON" or "OFF", Duration=1})
  elseif i.KeyCode == Enum.KeyCode.RightAlt then
    getgenv().SWITCH_TARGET = not getgenv().SWITCH_TARGET
    SG:SetCore("SendNotification", {Title="Switch Target", Text=getgenv().SWITCH_TARGET and "ON" or "OFF", Duration=1})
  end
end)

-- ========== LOADED ==========

game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "PIG HUB AutoFarm",
  Text = "F1=Farm Level | F2=Farm Nearest | RCtrl=FastAttack | RAlt=SwitchTarget",
  Duration = 5
})

-- AUTO START
getgenv().AutoFarm_Level = true
getgenv().FastAttack = true
task.spawn(AutoFarm_Level)
