local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer

--https://discord.com/api/webhooks/1362767892155990297/_REhHK6-4AlbvzGTc5EOMBb2T4QeE4xNJg52azfFUbfXBXS5ERPt3zd909E5VxYD4NOP

function SendMessage(message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = "https://discord.com/api/webhooks/1361438999654436909/r6qCoQEx2BGvr8h8OyHcfuIkZ9-5IVFVkTvslOuwZxSVbxi8RUZnEyoBz7LP2twopnlj",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

for _,barrier in pairs(workspace.Worlds:FindFirstChild("The Overworld").Barrier:GetChildren()) do
	barrier.CanCollide = false
end

local function tp(pos)
	local mag = (Player.Character.HumanoidRootPart.Position - Vector3.new(pos.X, Player.Character.HumanoidRootPart.Position.Y, pos.Z)).Magnitude
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(Player.Character.HumanoidRootPart.Position.X, 35, Player.Character.HumanoidRootPart.Position.Z))
       	TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(mag/42, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(pos.X, Player.Character.HumanoidRootPart.Position.Y, pos.Z))}):Play()
	task.wait(mag/42)
	for i = 1, 50 do
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
		task.wait(0.01)
	end
end

local Window = Rayfield:CreateWindow({
	Name = "Ingo Eblan",
	Icon = 0,
	LoadingTitle = "Ingo Eblan",
	LoadingSubtitle = "BubbleGum Simulator Infinity Cheat",
	Theme = "Default",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "Big Hub"
	},

	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},

	KeySystem = false,
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = {"Hello"}
	}
})

local ColFolder = workspace
for _,folder in pairs(workspace.Rendered:GetChildren()) do
	if folder.Name == "Chunker" then
		for _,v in pairs(folder:GetChildren()) do
			if string.find(v.Name, "-") then
				ColFolder = folder
				break
			end
		end
	end
end

local EggsFolder = workspace
for _,folder in pairs(workspace.Rendered:GetChildren()) do
	if folder.Name == "Chunker" then
		for _,v in pairs(folder:GetChildren()) do
			if string.find(v.Name, "Egg") then
				EggsFolder = folder
				break
			end
		end
	end
end

local FarmTab = Window:CreateTab("Farm", "rewind")

local AutoBlowOn = false
local AutoBlow = FarmTab:CreateToggle({
	Name = "Auto Blow",
	Value = false,
	Flag = "Toggle1",
	Callback = function(Value)
		AutoBlowOn = Value
	end,
})

local AutoSellOn = false
local AutoSell = FarmTab:CreateToggle({
	Name = "Auto Sell",
	Value = false,
	Flag = "Toggle2",
	Callback = function(Value)
		AutoSellOn = Value
	end,
})

local AutoFarmOn = false
local AutoFarm = FarmTab:CreateToggle({
	Name = "Auto Сollect",
	Value = false,
	Flag = "Toggle100",
	Callback = function(Value)
		AutoFarmOn = Value
	end,
})

local ItemsTab = Window:CreateTab("Items", "rewind")

local AutoDoggyOn = false
local AutoDoggy = ItemsTab:CreateToggle({
	Name = "Auto Doggy Game",
	Value = false,
	Flag = "Toggle3",
	Callback = function(Value)
		AutoDoggyOn = Value
	end,
})

local AutoPlaytimeOn = false
local AutoPlaytime = ItemsTab:CreateToggle({
	Name = "Auto Collect Playtime",
	Value = false,
	Flag = "Toggle5",
	Callback = function(Value)
		AutoPlaytimeOn = Value
	end,
})

local AutoChestsOn = false
local AutoChests = ItemsTab:CreateToggle({
	Name = "Auto Collect Chests",
	Value = false,
	Flag = "Toggle69",
	Callback = function(Value)
		AutoChestsOn = Value
	end,
})

local AutoShopOn = false
local AutoShop = ItemsTab:CreateToggle({
	Name = "Auto Alien Shop",
	Value = false,
	Flag = "Toggle89",
	Callback = function(Value)
		AutoShopOn = Value
	end,
})

local AutoShop2On = false
local AutoShop2 = ItemsTab:CreateToggle({
	Name = "Auto Blackmarket",
	Value = false,
	Flag = "Toggle1000",
	Callback = function(Value)
		AutoShop2On = Value
	end,
})

local AutoRoyalOn = false
local AutoRoyal = FarmTab:CreateToggle({
	Name = "Auto Royal Chest(DOESN'T WORK)",
	Value = false,
	Flag = "Toggle2111",
	Callback = function(Value)
		AutoRoyalOn = Value
	end,
})

local AutoTicketOn = false
local AutoTicket = ItemsTab:CreateToggle({
	Name = "Auto Claim Wheel Tickets",
	Value = false,
	Flag = "Toggle101",
	Callback = function(Value)
		AutoTicketOn = Value
	end,
})

local AutoWheelOn = false
local AutoWheel = ItemsTab:CreateToggle({
	Name = "Auto Spin Wheel",
	Value = false,
	Flag = "Toggle102",
	Callback = function(Value)
		AutoWheelOn = Value
	end,
})

local EggsTab = Window:CreateTab("Eggs", "rewind")
local EggsText = EggsTab:CreateSection("This is necessary to open the eggs a little faster")

local SelectedEgg = ""
local Eggs = {}
for _,egg in pairs(game.ReplicatedStorage.Assets.Eggs:GetChildren()) do
	if not string.find(egg.Name, "Golden") and not string.find(egg.Name, "Season") and not string.find(egg.Name, "Shop") and egg.Name ~= "PackageLink" then
		table.insert(Eggs, egg.Name)
	end
end

local AutoEggOn = false

local SelectEgg = EggsTab:CreateDropdown({
	Name = "Select Egg",
	Options = Eggs, 
	CurrentOption = {},
	MultipleOptions = false,
	Flag = "Dropdown1",
	Callback = function(CurrentOption)
		AutoEggOn = false
		for _,i in pairs(CurrentOption) do 
			SelectedEgg = i
		end
	end,
})

local CurrentEggsAmount = 1
local EggsAmount = EggsTab:CreateSlider({
	Name = "How many eggs to open",
	Range = {1, 6},
	Increment = 1,
	Suffix = "Eggs",
	CurrentValue = 1,
	Flag = "Slider1",
	Callback = function(CurrentValue)
		CurrentEggsAmount = CurrentValue
	end,
})

local PriorEggOn = false
local PriorEgg = EggsTab:CreateToggle({
	Name = "Priority on eggs with multiplier",
	Value = false,
	Flag = "Toggle999",
	Callback = function(Value)
		PriorEggOn = Value
	end,
})

local AutoAuraOn = false
local AutoAura = EggsTab:CreateToggle({
	Name = "Auto Aura Egg",
	Value = false,
	Flag = "Toggle1111",
	Callback = function(Value)
		AutoAuraOn = Value
	end,
})

local curPos = Vector3.new(0, 0, 0)
local curPosText = EggsTab:CreateSection("Position: 0, 0, 0")

local setPos = EggsTab:CreateButton({
   Name = "Update AFK Position",
   Callback = function()
	curPos = Player.Character.HumanoidRootPart.Position
	curPosText:Set(`Position: {curPos}`)
   end,
})

local AutoEgg = EggsTab:CreateToggle({
	Name = "Open Eggs",
	Value = false,
	Flag = "Toggle4",
	Callback = function(Value)
		AutoEggOn = Value
		if Value then
			Rayfield:Notify({
				Title = "Eggs Open",
				Content = "To open eggs, you need to stand next to them",
				Duration = 3,
				Image = "rewind",
			})
		end
	end,
})

local RiftsTab = Window:CreateTab("Rifts", "rewind")
local RiftText = RiftsTab:CreateSection("Allows you to view all rifts and teleport to them")

local riftsPath = {}

local rift1 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[1].Display.Position)
   end,
})

local rift2 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[2].Display.Position)
   end,
})

local rift3 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[3].Display.Position)
   end,
})

local rift4 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[4].Display.Position)
   end,
})

local rift5 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[5].Display.Position)
   end,
})

local rift6 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[6].Display.Position)
   end,
})

local rift7 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[7].Display.Position)
   end,
})

local rift8 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[8].Display.Position)
   end,
})

local rift9 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[9].Display.Position)
   end,
})

local rift10 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[10].Display.Position)
   end,
})

local rift11 = RiftsTab:CreateButton({
   Name = "",
   Callback = function()
	local teleport = coroutine.create(tp)
	coroutine.resume(teleport, riftsPath[11].Display.Position)
   end,
})

local rifts = {rift1, rift2, rift3, rift4, rift5, rift6, rift7, rift8, rift9, rift10, rift11}

for _,rift in pairs(workspace.Rendered.Rifts:GetChildren()) do
	rift.Display.CanCollide = false
	for _,a in pairs(rift.Sign.Sign:GetChildren()) do
		if a:IsA("BasePart") then
			a.CanCollide = false
		else
			for _,b in pairs(a:GetChildren()) do
				b.CanCollide = false
			end
		end
	end
end

workspace.Rendered.Rifts.ChildAdded:Connect(function(rift)
	task.wait(1)
	rift.Display.CanCollide = false
	for _,a in pairs(rift.Sign:GetChildren()) do
		if a:IsA("BasePart") then
			a.CanCollide = false
		else
			for _,b in pairs(a:GetChildren()) do
				b.CanCollide = false
			end
		end
	end
end)

for _,mountain in pairs(workspace.Worlds:FindFirstChild("The Overworld").Decoration.Mountains:GetChildren()) do
    for _,part in pairs(mountain:GetChildren()) do
        part.CanCollide = false
    end
end

local auraEgg = false
local while3 = coroutine.create(function()
	while task.wait(1) do
		auraEgg = false
		table.clear(riftsPath)
		local riftForTeleport = nil
		for _,riftBtn in pairs(rifts) do
			riftBtn:Set("")
		end
		for i,rift in pairs(workspace.Rendered.Rifts:GetChildren()) do
			local betterName = string.gsub(string.gsub(rift.Name, "-", " "), "(%a)([%w]*)", function(first, rest)
  				return string.upper(first) .. rest
			end)
			table.insert(riftsPath, rift)
			if PriorEggOn and betterName == SelectedEgg and AutoEggOn and not auraEgg then
				if riftForTeleport then
					if tonumber(string.sub(riftForTeleport.Display.SurfaceGui.Icon.Luck.Text, 2)) < tonumber(string.sub(rift.Display.SurfaceGui.Icon.Luck.Text, 2)) then
						needToTeleport = rift
					end
				else
					riftForTeleport = rift
				end
			end
			if AutoAuraOn and betterName == "Man Egg" and AutoEggOn then
				auraEgg = true
				riftForTeleport = rift
			end
			if rift:FindFirstChild("Display") and rift.Display:FindFirstChild("SurfaceGui") and string.find(rift.Name, "egg") then
				if betterName ~= "Man Egg" then
					rifts[i]:Set(`{betterName} ({rift.Display.SurfaceGui.Timer.Text}) ({rift.Display.SurfaceGui.Icon.Luck.Text})`)
				else
					rifts[i]:Set(`Aura Egg ({rift.Display.SurfaceGui.Timer.Text}) ({rift.Display.SurfaceGui.Icon.Luck.Text})`)
					if not rift:FindFirstChild("Checked") then
						local c = Instance.new("StringValue", rift)
						c.Name = "Checked"
						SendMessage(`> # :partying_face:﻿ Aura Egg Was Found At ~{math.round(rift.Display.Position.Y - 8)}m. @everyone \n > ### the link won't work if it's a private server \n > [Click to join](https://destereng.github.io/roblox-redirect/?placeId={game.PlaceId}&gameInstanceId={game.JobId})`)
					end
				end
				if tonumber(string.sub(rift.Display.SurfaceGui.Icon.Luck.Text, 2)) >= 25 then
					if not rift:FindFirstChild("Checked") then
						local c = Instance.new("StringValue", rift)
						c.Name = "Checked"
						SendMessage(`> # :partying_face:﻿ X25 {betterName} Was Found At ~{math.round(rift.Display.Position.Y - 8)}m. @x25 egg \n > ### the link won't work if it's a private server \n > [Click to join](https://destereng.github.io/roblox-redirect/?placeId={game.PlaceId}&gameInstanceId={game.JobId})`)
					end
				end
			else
				rifts[i]:Set(`{betterName} ({rift.Display.SurfaceGui.Timer.Text})`)
			end
		end
		if riftForTeleport then
			local mag = (Player.Character.HumanoidRootPart.Position - riftForTeleport.Display.Position).Magnitude
			if mag > 50 then
				local teleport = coroutine.create(tp)
				coroutine.resume(teleport, riftForTeleport.Display.Position)
			end
		else
			if AutoEggOn then
				local mag = (Player.Character.HumanoidRootPart.Position - curPos).Magnitude
				if mag > 10 then
					local teleport = coroutine.create(tp)
					coroutine.resume(teleport, curPos)
				end
			end
		end
	end
end)
coroutine.resume(while3)

local while1 = coroutine.create(function()
	while task.wait(10) do
		if AutoChestsOn then
			for _,chest in pairs(workspace.Rendered.Chests:GetChildren()) do
				if not workspace.Rendered.Generic:FindFirstChild(chest.Name):FindFirstChild("ChestRespawn") then
					game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("ClaimChest", chest.Name, true)
				end
			end
		end
		if AutoShopOn then
			for i = 1, 3 do
				for v = 1, 12 do
					game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("BuyShopItem", "alien-shop", i)
					task.wait(0.1)
				end
			end
		end
		if AutoShop2On then
			for i = 1, 3 do
				for v = 1, 12 do
					game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("BuyShopItem", "shard-shop", i)
					task.wait(0.1)
				end
			end
		end
		if AutoPlaytimeOn then
			for i = 1,9 do
				game.ReplicatedStorage.Shared.Framework.Network.Remote.Function:InvokeServer("ClaimPlaytime", i)
			end
		end
		if AutoDoggyOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("DoggyJumpWin", 3)
		end
		if AutoTicketOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("ClaimFreeWheelSpin")
		end
		if AutoWheelOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Function:InvokeServer("WheelSpin")
		end
	end
end)
coroutine.resume(while1)

local while2 = coroutine.create(function()
	while task.wait(0.1) do
		if AutoFarmOn then
			for _,v in pairs(ColFolder:GetChildren()) do
				game.ReplicatedStorage.Remotes.Pickups.CollectPickup:FireServer(v.Name)
				v:Destroy()
			end
		end
		if AutoBlowOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("BlowBubble")
		end
		if AutoSellOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("SellBubble")
		end
		if AutoEggOn then
			if not auraEgg then
				game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", SelectedEgg, CurrentEggsAmount)
			else
				game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", "man-egg", CurrentEggsAmount)
				print("Open Aura Egg")
			end
		else
			AutoEgg:Set(false)
		end
	end
end)
coroutine.resume(while2)
