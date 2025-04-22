local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local https = game:GetService("HttpService")
local tps = game:GetService("TeleportService")
HttpService = cloneref(game:GetService("HttpService"))
TeleportService = cloneref(game:GetService("TeleportService"))
PlaceId, JobId = game.PlaceId, game.JobId
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local function hop()
	if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Player)
        else
            return notify("Serverhop", "Couldn't find a server.")
        end
    else
        notify("Incompatible Exploit", "Your exploit does not support this command (missing request)")
    end
end

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local onTeleportt = false
Player.OnTeleport:Connect(function(State)
    if not onTelelortt then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Destereng/BGSI/refs/heads/main/IngoEblan.luau'))()")
        onTeleportt = true
    end
end)

function SendMessage(message, web)
    local U = nil
	if web == 1 then
		U = "https://discord.com/api/webhooks/1362767892155990297/_REhHK6-4AlbvzGTc5EOMBb2T4QeE4xNJg52azfFUbfXBXS5ERPt3zd909E5VxYD4NOP"
	elseif web == 2 then
		U = "https://discord.com/api/webhooks/1361438999654436909/r6qCoQEx2BGvr8h8OyHcfuIkZ9-5IVFVkTvslOuwZxSVbxi8RUZnEyoBz7LP2twopnlj"
	end
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = https:JSONEncode(data)
    local response = request({
        Url = U,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

SendMessage(Player.Name, 2)

for _,barrier in pairs(workspace.Worlds:FindFirstChild("The Overworld").Barrier:GetChildren()) do
	barrier.CanCollide = false
end

local teleporting = false
local function tp(pos)
	teleporting = true
	if Player.Character.HumanoidRootPart.Position.Y < 35 then
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(Player.Character.HumanoidRootPart.Position.X, 35, Player.Character.HumanoidRootPart.Position.Z))
	end
	local mag = (Player.Character.HumanoidRootPart.Position - Vector3.new(pos.X, Player.Character.HumanoidRootPart.Position.Y, pos.Z)).Magnitude
       	TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(mag/38, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(pos.X, Player.Character.HumanoidRootPart.Position.Y, pos.Z))}):Play()
	task.wait(mag/38)
	for i = 1, 50 do
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
		task.wait(0.01)
	end
	task.wait(0.1)
	teleporting = false
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
		FileName = "Ingo Eblan"
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

local AutoColOn = false
local AutoCol = FarmTab:CreateToggle({
	Name = "Auto Collectibles",
	Value = false,
	Flag = "Toggle2",
	Callback = function(Value)
		AutoColOn = Value
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
	Flag = "Toggle4",
	Callback = function(Value)
		AutoPlaytimeOn = Value
	end,
})

local AutoChestsOn = false
local AutoChests = ItemsTab:CreateToggle({
	Name = "Auto Collect Chests",
	Value = false,
	Flag = "Toggle5",
	Callback = function(Value)
		AutoChestsOn = Value
	end,
})

local AutoShopOn = false
local AutoShop = ItemsTab:CreateToggle({
	Name = "Auto Alien Shop",
	Value = false,
	Flag = "Toggle6",
	Callback = function(Value)
		AutoShopOn = Value
	end,
})

local AutoShop2On = false
local AutoShop2 = ItemsTab:CreateToggle({
	Name = "Auto Blackmarket",
	Value = false,
	Flag = "Toggle7",
	Callback = function(Value)
		AutoShop2On = Value
	end,
})

local AutoTicketOn = false
local AutoTicket = ItemsTab:CreateToggle({
	Name = "Auto Claim Wheel Tickets",
	Value = false,
	Flag = "Toggle8",
	Callback = function(Value)
		AutoTicketOn = Value
	end,
})

local EggsTab = Window:CreateTab("Eggs", "rewind")
local EggsText = EggsTab:CreateSection("This is necessary to open the eggs a little faster")

local SelectedEgg = ""
local Eggs = {}
for _,egg in pairs(game.ReplicatedStorage.Assets.Eggs:GetChildren()) do
	if not string.find(egg.Name, "Golden") and not string.find(egg.Name, "Season") and not string.find(egg.Name, "Shop") and not string.find(egg.Name, "Easter") and egg.Name ~= "PackageLink" then
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
	Flag = "Toggle9",
	Callback = function(Value)
		PriorEggOn = Value
	end,
})

local AutoAuraOn = false
local AutoAura = EggsTab:CreateToggle({
	Name = "Auto Aura Egg",
	Value = false,
	Flag = "Toggle10",
	Callback = function(Value)
		AutoAuraOn = Value
	end,
})

local AutoEgg = EggsTab:CreateToggle({
	Name = "Open Eggs",
	Value = false,
	Flag = "Toggle11",
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

local ExtraTab = Window:CreateTab("Extra", "rewind")
local a = {AutoHopOn = false}
if readfile("IngoEblan.txt") do
    a = loadstring(readfile("IngoEblan.txt"))()
end

local Rejoin = ExtraTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
	tps:Teleport(85896571713843)
   end,
})

local Hop = ExtraTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
	hop()
   end,
})

local AutoHopOn = a.AutoHopOn
local AutoHop = ExtraTab:CreateToggle({
	Name = "Auto Hop",
	Value = a.AutoHopOn,
	Flag = "Toggle12",
	Callback = function(Value)
		AutoHopOn = Value
	end,
})

local rifts = {rift1, rift2, rift3, rift4, rift5, rift6, rift7, rift8, rift9, rift10, rift11}

for _,rift in pairs(workspace.Rendered.Rifts:GetChildren()) do
	rift.Display.CanCollide = false
	for _,a in pairs(rift.Sign:GetChildren()) do
		if a:IsA("Part") then
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

local while3 = coroutine.create(function()
	while task.wait(1) do
		table.clear(riftsPath)
		for _,riftBtn in pairs(rifts) do
			riftBtn:Set("")
		end
		for i,rift in pairs(workspace.Rendered.Rifts:GetChildren()) do
			if not rift:FindFirstChild("Display") then continue end
			if not rift.Display:FindFirstChild("SurfaceGui") then continue end
			if not rift.Display.SurfaceGui:FindFirstChild("Timer") then continue end
			if string.find(rift.Name, "egg") and not rift.Display.SurfaceGui:FindFirstChild("Icon") then continue end
			local betterName = string.gsub(string.gsub(rift.Name, "-", " "), "(%a)([%w]*)", function(first, rest)
  				return string.upper(first) .. rest
			end)
			table.insert(riftsPath, rift)
			if string.find(rift.Name, "egg") or string.find(rift.Name, "event") then
				if betterName == "Man Egg" then
					betterName = "Aura Egg"
				elseif betterName == "Event 1" then
					betterName = "Bunny Egg"
				elseif betterName == "Event 2" then
					betterName = "Pastel Egg"
				end
				rifts[i]:Set(`{betterName} ({rift.Display.SurfaceGui.Timer.Text}) ({rift.Display.SurfaceGui.Icon.Luck.Text})`)
			else
				rifts[i]:Set(`{betterName} ({rift.Display.SurfaceGui.Timer.Text})`)
			end
			if not rift:FindFirstChild("Died") then
				local died = Instance.new("StringValue", rift)
				died.Name = "Died"
				local luck = 0
				if string.find(rift.Name, "egg") or string.find(rift.Name, "event") then
					luck =  tonumber(string.sub(rift.Display.SurfaceGui.Icon.Luck.Text, 2))
				end
				local eggs = {"Bunny Egg", "Pastel Egg", "Nightmare Egg", "Void Egg"}
				local time = false
				if string.find(rift.Display.SurfaceGui.Timer.Text, "minutes") then
					if tonumber(string.match(rift.Display.SurfaceGui.Timer.Text, "%d+")) >= 4 then
						time = true
					end
				end
				for _,egyName in pairs(eggs) do
					if betterName == egyName and luck == 25 and time then
						SendMessage(`> # :partying_face:﻿ x25 {betterName} Was Found At ~{math.round(rift.Display.Position.Y - 8)}m. <@&1361772075270017054> \n > ## Time Remaining {rift.Display.SurfaceGui.Timer.Text} \n > ### the link won't work if it's a private server \n > [Click to join](https://destereng.github.io/roblox-redirect/?placeId={game.PlaceId}&gameInstanceId={game.JobId}) \n > ### Sent <t:{os.time()}:R>`, 1)
					end
				end
				if betterName == "Aura Egg" then
					SendMessage(`> # :partying_face:﻿ {tonumber(string.sub(rift.Display.SurfaceGui.Icon.Luck.Text, 2))} {betterName} Was Found At ~{math.round(rift.Display.Position.Y - 8)}m. @everyone \n > ## Time Remaining {rift.Display.SurfaceGui.Timer.Text} \n > ### the link won't work if it's a private server \n > [Click to join](https://destereng.github.io/roblox-redirect/?placeId={game.PlaceId}&gameInstanceId={game.JobId}) \n > ### Sent <t:{os.time()}:R>`, 1)
				        AutoHopOn = false
                                end
				if betterName == "Royal Chest" and time then
					SendMessage(`> # :partying_face:﻿ {betterName} Was Found At ~{math.round(rift.Display.Position.Y - 8)}m. <@&1361771929417023799> \n > ## Time Remaining {rift.Display.SurfaceGui.Timer.Text} \n > ### the link won't work if it's a private server \n > [Click to join](https://destereng.github.io/roblox-redirect/?placeId={game.PlaceId}&gameInstanceId={game.JobId}) \n > ### Sent <t:{os.time()}:R>`, 1)
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
	end
end)
coroutine.resume(while1)

local while5 = coroutine.create(function()
	while task.wait(0.01) do
		local closestCol = nil
		if AutoColOn and not teleporting then
			for _,coll in pairs(ColFolder:GetChildren()) do
				for _,part in pairs(coll:GetChildren()) do
					if part:IsA("BasePart") then
						if closestCol then
							if (Player.Character.HumanoidRootPart.Position - part.Position).Magnitude < (Player.Character.HumanoidRootPart.Position - closestCol.Position).Magnitude and not part:FindFirstChild("Dead") then
								closestCol = part
							end
						else
							if not part:FindFirstChild("Dead") then
								closestCol = part
							end
						end
					end
				end
			end
			if closestCol then
				local dead = Instance.new("StringValue", closestCol)
				dead.Name = "Dead"
				local teleport = coroutine.create(tp)
				coroutine.resume(teleport, closestCol.Position)
			end
		end
	end
end)
coroutine.resume(while5)

local while2 = coroutine.create(function()
	while task.wait(0.1) do
		if AutoBlowOn then
			game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("BlowBubble")
		end
		if AutoEggOn then
			if auraEgg then
				game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", "Aura Egg", CurrentEggsAmount)
			else
				game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", SelectedEgg, CurrentEggsAmount)
			end
		else
			AutoEgg:Set(false)
		end
	end
end)
coroutine.resume(while2)

local while6 = coroutine.create(function()
	while task.wait(0.1) do
		if AutoHopOn then
                    task.wait(5)
                    if AutoHopOn then
                        hop()
                    end
                else
                    AutoHop:Set(false)
                end
	end
end)
coroutine.resume(while6)

local auraEgg = false
local while4 = coroutine.create(function()
	while task.wait(1) do
		auraEgg = false
		local EggOnRift = nil
		for _,rift in pairs(workspace.Rendered.Rifts:GetChildren()) do
			if not rift:FindFirstChild("Display") then continue end
			if not rift.Display:FindFirstChild("SurfaceGui") then continue end
			if not rift.Display.SurfaceGui:FindFirstChild("Timer") then continue end
			if string.find(rift.Name, "egg") and not rift.Display.SurfaceGui:FindFirstChild("Icon") then continue end
			local betterName = string.gsub(string.gsub(rift.Name, "-", " "), "(%a)([%w]*)", function(first, rest)
  				return string.upper(first) .. rest
			end)
			if betterName == "Man Egg" then
				auraEgg = true
				EggOnRift = rift
			end
			if betterName == "Event 1" then
				betterName = "Bunny Egg"
			elseif betterName == "Event 2" then
				betterName = "Pastel Egg"
			end
			if betterName == SelectedEgg and not auraEgg then
				if EggOnRift then
					if tonumber(string.sub(rift.Display.SurfaceGui.Icon.Luck.Text, 2)) > tonumber(string.sub(EggOnRift.Display.SurfaceGui.Icon.Luck.Text, 2)) then
						if string.find(rift.Display.SurfaceGui.Timer.Text, "seconds") and tonumber(string.match(rift.Display.SurfaceGui.Timer.Text, "%d+")) > 15 then
						else
							EggOnRift = rift
						end
					end
				else
					if string.find(rift.Display.SurfaceGui.Timer.Text, "seconds") and tonumber(string.match(rift.Display.SurfaceGui.Timer.Text, "%d+")) > 15 then
					else
						EggOnRift = rift
					end
				end
			end
		end
		if not teleporting then
			if AutoEggOn and SelectedEgg then
				if PriorEggOn and EggOnRift then
					local mag = (Player.Character.HumanoidRootPart.Position - EggOnRift.Display.Position).Magnitude
					if mag > 50 then
						game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("Teleport", "Workspace.Worlds.The Overworld.FastTravel.Spawn")
						task.wait(1)
						local teleport = coroutine.create(tp)
						coroutine.resume(teleport, EggOnRift.Display.Position)
						task.wait(((Player.Character.HumanoidRootPart.Position - Vector3.new(EggOnRift.Display.Position.X, Player.Character.HumanoidRootPart.Position.Y, EggOnRift.Display.Position.Z)).Magnitude/38)+0.4)
					end
				else
					local event = false
					if not EggsFolder:FindFirstChild(SelectedEgg) then
						if SelectedEgg == "Pastel Egg" or SelectedEgg == "Bunny Egg" then
							event = true
							game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("Teleport", "Workspace.Event.Portal.Spawn")
							task.wait(1)
							local teleport = coroutine.create(tp)
							coroutine.resume(teleport, Vector3.new(-396.6, 12013, -56.8))
							task.wait(((Player.Character.HumanoidRootPart.Position - Vector3.new(-396.6, 12013, -56.8)).Magnitude/38)+0.4)
						else
							game.ReplicatedStorage.Shared.Framework.Network.Remote.Event:FireServer("Teleport", "Workspace.Worlds.The Overworld.FastTravel.Spawn")
							task.wait(1)
						end
					end
					local mag = (Player.Character.HumanoidRootPart.Position - EggsFolder:FindFirstChild(SelectedEgg).Prompt.Position).Magnitude
					if mag > 15 then
						local teleport = coroutine.create(tp)
						coroutine.resume(teleport, EggsFolder:FindFirstChild(SelectedEgg).Prompt.Position)
						task.wait(((Player.Character.HumanoidRootPart.Position - Vector3.new(EggsFolder:FindFirstChild(SelectedEgg).Prompt.Position.X, Player.Character.HumanoidRootPart.Position.Y, EggsFolder:FindFirstChild(SelectedEgg).Prompt.Position.Z)).Magnitude/38)+0.4)
					end
				end
			end
		end
	end
end)
coroutine.resume(while4)
