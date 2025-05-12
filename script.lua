local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false -- Forces AddToggle to AddCheckbox
Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)

local Window = Library:CreateWindow({
	-- Set Center to true if you want the menu to appear in the center
	-- Set AutoShow to true if you want the menu to appear when it is created
	-- Set Resizable to true if you want to have in-game resizable Window
	-- Set MobileButtonsSide to "Left" or "Right" if you want the ui toggle & lock buttons to be on the left or right side of the window
	-- Set ShowCustomCursor to false if you don't want to use the Linoria cursor
	-- NotifySide = Changes the side of the notifications (Left, Right) (Default value = Left)
	-- Position and Size are also valid options here
	-- but you do not need to define them unless you are changing them :)

	Title = "mouseware.cc",
	Footer = "Made by: @directw | Version: 1.0",
	NotifySide = "Right",
	ShowCustomCursor = true,
	Center = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
-- You can find more icons in https://lucide.dev/
local Tabs = {
	-- Creates a new tab titled Main
	Legit = Window:AddTab("Legit", "sword"),
	Rage = Window:AddTab("Rage", "angry"),
	Misc = Window:AddTab("Misc", "hard-drive"),
	Visuals = Window:AddTab("Visuals", "globe"),
	Exploits = Window:AddTab("Exploits", "bug"),
	["Settings"] = Window:AddTab("Settings", "settings"),
}

-- Legit Tab Configuration
local LeftGroupBox1 = Tabs.Legit:AddLeftGroupbox("Aim Lock")

LeftGroupBox1:AddToggle("AimLock", {
	Text = "Aim Lock",
	Tooltip = "Toggle aim lock", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] AimLock changed to:", Value)
	end,
})

LeftGroupBox1:AddLabel("Aim Key"):AddKeyPicker("AimKey", {
	Default = "Z",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Aim Lock Keybind",
	NoUI = false,

	Callback = function(Value)
		print("[cb] AimKey clicked!", Value)
	end,
})


LeftGroupBox1:AddToggle("ToggleMode", {
	Text = "Toggle Mode",
	Tooltip = "Aim lock toggle mode",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] ToggleMode changed to:", Value)
	end,
})

-- Add FoV controls to Legit tab (Aim Lock group)
LeftGroupBox1:AddToggle("ShowFoV_Legit", {
	Text = "Show FoV",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] ShowFoV_Legit changed to:", Value)
	end,
})

LeftGroupBox1:AddSlider("FoVSlider_Legit", {
	Text = "FoV",
	Default = 50,
	Min = 1,
	Max = 180,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] FoV_Legit changed to:", Value)
	end,
})

local LeftGroupBox3 = Tabs.Legit:AddLeftGroupbox("Aim Part")

LeftGroupBox3:AddDropdown("AimPart", {
	Values = { "HumanoidRootPart", "Head", "UpperTorso", "RightLeg", "LeftLeg", "RightArm", "LeftArm", "LowerTorso" },
	Default = "HumanoidRootPart",
	Multi = false,

	Text = "Aim Part",
	Tooltip = "Select the part to aim at",

	Callback = function(Value)
		print("[cb] AimPart changed to:", Value)
	end,
})

local LeftGroupBox5 = Tabs.Legit:AddLeftGroupbox("Max Distance")

LeftGroupBox5:AddSlider("MaxDistance", {
	Text = "Max Distance",
	Default = 1000,
	Min = 1,
	Max = 5000,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] MaxDistance changed to:", Value)
	end,
})

local RightGroupBox6 = Tabs.Legit:AddRightGroupbox("Smoothness")

RightGroupBox6:AddToggle("Smoothness", {
	Text = "Smoothness",
	Tooltip = "Toggle aim lock smoothness", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Smoothness changed to:", Value)
	end,
})

RightGroupBox6:AddToggle("Adaptive", {
	Text = "Adaptive",
	Tooltip = "Toggle aim lock adaptive smoothness", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Adaptive changed to:", Value)
	end,
})

RightGroupBox6:AddSlider("SmoothnessValue", {
	Text = "Value",
	Default = 0.15,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] SmoothnessValue changed to:", Value)
	end,
})

RightGroupBox6:AddSlider("SmoothnessMin", {
	Text = "Min",
	Default = 0.5,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] SmoothnessMin changed to:", Value)
	end,
})

RightGroupBox6:AddSlider("SmoothnessMax", {
	Text = "Max",
	Default = 1,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] SmoothnessMax changed to:", Value)
	end,
})

local RightGroupBox7 = Tabs.Legit:AddRightGroupbox("Prediction")

RightGroupBox7:AddToggle("Prediction", {
	Text = "Prediction",
	Tooltip = "Toggle prediction",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Prediction changed to:", Value)
	end,
})

RightGroupBox7:AddSlider("BaseFactor", {
	Text = "Base Factor",
	Default = 0.12,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] BaseFactor changed to:", Value)
	end,
})

RightGroupBox7:AddSlider("AirFactor", {
	Text = "Air Factor",
	Default = 0.05,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] AirFactor changed to:", Value)
	end,
})

RightGroupBox7:AddToggle("Dynamic", {
	Text = "Dynamic",
	Tooltip = "Toggle dynamic prediction",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Dynamic changed to:", Value)
	end,
})

RightGroupBox7:AddSlider("DynamicScale", {
	Text = "Dynamic Scale",
	Default = 0.1,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] DynamicScale changed to:", Value)
	end,
})

RightGroupBox7:AddSlider("PredictionMin", {
	Text = "Min",
	Default = 0.02,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] PredictionMin changed to:", Value)
	end,
})

RightGroupBox7:AddSlider("PredictionMax", {
	Text = "Max",
	Default = 0.25,
	Min = 0.0,
	Max = 2,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		print("[cb] PredictionMax changed to:", Value)
	end,
})

local LeftGroupBox8 = Tabs.Legit:AddLeftGroupbox("Checks")

LeftGroupBox8:AddToggle("Visible", {
	Text = "Visible",
	Tooltip = "Check for visible players",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Visible changed to:", Value)
	end,
})

LeftGroupBox8:AddToggle("Team", {
	Text = "Team",
	Tooltip = "Check for team players",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Team changed to:", Value)
	end,
})

LeftGroupBox8:AddToggle("Alive", {
	Text = "Alive",
	Tooltip = "Check for alive players",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Alive changed to:", Value)
	end,
})

LeftGroupBox8:AddToggle("Knocked", {
	Text = "Knocked",
	Tooltip = "Check for knocked players",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Knocked changed to:", Value)
	end,
})

-- Rage Tab Configuration
local LeftGroupBox1_Rage = Tabs.Rage:AddLeftGroupbox("Aimbot")

LeftGroupBox1_Rage:AddToggle("Aimbot", {
	Text = "Aimbot",
	Tooltip = "Toggle aimbot", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Aimbot changed to:", Value)
	end,
})

LeftGroupBox1_Rage:AddLabel("Aim bot"):AddKeyPicker("AimbotKey", {
	Default = "Q",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Aimbot Keybind",
	NoUI = false,

	Callback = function(Value)
		print("[cb] AimbotKey clicked!", Value)
	end,
})

local LeftGroupBox2_Rage = Tabs.Rage:AddLeftGroupbox("Aim Part")

LeftGroupBox2_Rage:AddDropdown("AimPartRage", {
	Values = { "HumanoidRootPart", "Head", "UpperTorso", "RightLeg", "LeftLeg", "RightArm", "LeftArm", "LowerTorso" },
	Default = "HumanoidRootPart",
	Multi = false,

	Text = "Aim Part",
	Tooltip = "Select the part to aim at",

	Callback = function(Value)
		print("[cb] AimPartRage changed to:", Value)
	end,
})

local LeftGroupBox3_Rage = Tabs.Rage:AddLeftGroupbox("Spinbot")

LeftGroupBox3_Rage:AddToggle("Toggle Spinbot", {
	Text = "Spinbot",
	Tooltip = "Toggle spinbot", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Spinbot changed to:", Value)
	end,
})

LeftGroupBox3_Rage:AddLabel("Spinbot"):AddKeyPicker("SpinbotKey", {
	Default = "C",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Spinbot Keybind",
	NoUI = false,

	Callback = function(Value)
		print("[cb] SpinbotKey clicked!", Value)
	end,
})

LeftGroupBox3_Rage:AddSlider("SpinSpeed", {
	Text = "Spin Speed",
	Default = 90,
	Min = 1,
	Max = 180,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] SpinSpeed changed to:", Value)
	end,
})

-- Misc Tab Configuration
local LeftGroupBox1_Misc = Tabs.Misc:AddLeftGroupbox("NoClip")
LeftGroupBox1_Misc:AddToggle("NoClip", {
	Text = "No Clip",
	Tooltip = "Toggle no clip", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] NoClip changed to:", Value)
	end,
})

local LeftGroupBox2_Misc = Tabs.Misc:AddLeftGroupbox("Infinite Jump")
LeftGroupBox2_Misc:AddToggle("Infinite Jump", {
	Text = "Infinite Jump",
	Tooltip = "Toggle infinite jump", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Infinite Jump changed to:", Value)
	end,
})

local LeftGroupBox3_Misc = Tabs.Misc:AddLeftGroupbox("Anti AFK")
LeftGroupBox3_Misc:AddToggle("Anti AFK", {
	Text = "Anti AFK",
	Tooltip = "Toggle anti afk", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Anti AFK changed to:", Value)
	end,
})

local LeftGroupBox3_Misc = Tabs.Misc:AddLeftGroupbox("Walkspeed")
LeftGroupBox3_Misc:AddToggle("Toggle Walkspeed", {
	Text = "Walkspeed",
	Tooltip = "Toggle walkspeed", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Walkspeed changed to:", Value)
	end,
})

LeftGroupBox3_Misc:AddLabel("Walkspeed"):AddKeyPicker("WalkspeedKey", {
	Default = "X",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Walkspeed Keybind",
	NoUI = false,

	Callback = function(Value)
		print("[cb] WalkspeedKey clicked!", Value)
	end,
})

LeftGroupBox3_Misc:AddSlider("WalkspeedValue", {
	Text = "Walkspeed",
	Default = 16,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] Walkspeed changed to:", Value)
	end,
})

local RightGroupBox4_Misc = Tabs.Misc:AddRightGroupbox("Teleport")
RightGroupBox4_Misc:AddDropdown("PlayerDropdown", {
	SpecialType = "Player",
	Text = "Select Player",
	Tooltip = "Select a player to teleport to",

	Callback = function(Value)
		print("[cb] Selected player:", Value)
	end,
})

RightGroupBox4_Misc:AddButton("Teleport",{
	Text = "Teleport",
	Func = function()
		-- Teleport to selected player
		local players = game:GetService("Players")
		local targetUsername = Options.PlayerDropdown and Options.PlayerDropdown.Value
		if not targetUsername or targetUsername == "" then
			Library:Notify("No player selected!", 3)
			return
		end
		-- Try to find by Name or DisplayName (case-insensitive)
		local targetPlayer = nil
		for _, p in ipairs(players:GetPlayers()) do
			if (p.Name == targetUsername) or (p.DisplayName == targetUsername) or
			   (p.Name:lower() == tostring(targetUsername):lower()) or
			   (p.DisplayName:lower() == tostring(targetUsername):lower()) then
				targetPlayer = p
				break
			end
		end
		if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			Library:Notify("Target player not available!", 3)
			return
		end
		local localChar = players.LocalPlayer.Character
		if localChar and localChar:FindFirstChild("HumanoidRootPart") then
			localChar:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
			Library:Notify("Teleported to " .. targetUsername, 2)
		else
			Library:Notify("Your character is not available!", 3)
		end
	end,
	DoubleClick = true,

	Disabled = false,
	Visible = true,
	Risky = true,
})

local RightGroupBox5_Misc = Tabs.Misc:AddRightGroupbox("Fly")
RightGroupBox5_Misc:AddToggle("Toggle Fly", {
	Text = "Fly",
	Tooltip = "Toggle fly", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = true,

	Callback = function(Value)
		print("[cb] Fly changed to:", Value)
	end,
})

RightGroupBox5_Misc:AddLabel("Fly"):AddKeyPicker("FlyKey", {
	Default = "V",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Fly Keybind",
	NoUI = false,

	Callback = function(Value)
		print("[cb] FlyKey clicked!", Value)
	end,
})

RightGroupBox5_Misc:AddSlider("FlySpeed", {
	Text = "Fly Speed",
	Default = 50,
	Min = 10,
	Max = 250,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] FlySpeed changed to:", Value)
	end,
})

-- Visuals Tab Configuration
local LeftGroupBox1_Visuals = Tabs.Visuals:AddLeftGroupbox("Visual Features")
LeftGroupBox1_Visuals:AddToggle("Box", {
	Text = "Box",
	Tooltip = "Toggle Box", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Box changed to:", Value)
	end,
})

LeftGroupBox1_Visuals:AddToggle("Skeleton", {
	Text = "Skeleton",
	Tooltip = "Toggle Skeleton", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Skeleton changed to:", Value)
	end,
})

LeftGroupBox1_Visuals:AddToggle("Name", {
	Text = "Name",
	Tooltip = "Toggle Name", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Name changed to:", Value)
	end,
})

LeftGroupBox1_Visuals:AddToggle("Healthbar", {
	Text = "Healthbar",
	Tooltip = "Toggle Healthbar", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Healthbar changed to:", Value)
	end,
})

LeftGroupBox1_Visuals:AddToggle("Tracers", {
	Text = "Tracers",
	Tooltip = "Toggle Tracers", 
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Tracers changed to:", Value)
	end,
})

local LeftGroupBox2_Visuals = Tabs.Visuals:AddLeftGroupbox("Box Configuration")

LeftGroupBox2_Visuals:AddDropdown("Style", {
	Values = { "Outline Only", "Fill Only", "Fill + Outline" },
	Default = "Outline Only",
	Multi = false,

	Text = "Box Style",

	Callback = function(Value)
		print("[cb] Box style changed to:", Value)
	end,
})

LeftGroupBox2_Visuals:AddToggle("Cornered Box", {
	Text = "Cornered Box",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,

	Callback = function(Value)
		print("[cb] Cornered box changed to:", Value)
	end,
})

LeftGroupBox2_Visuals:AddSlider("Box Thickness", {
	Text = "Box Thickness",
	Default = 1,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] Box thickness changed to:", Value)
	end,
})

LeftGroupBox2_Visuals:AddLabel("Boxes Color"):AddColorPicker("Boxes Color", {
	Default = Color3.new(0, 1, 0),
	Title = "Boxes Color", 
	Transparency = 0,

	Callback = function(Value)
		print("[cb] Boxes color changed!", Value)
	end,
})

LeftGroupBox2_Visuals:AddLabel("Fill Box Color"):AddColorPicker("Fill Box Color", {
	Default = Color3.new(0, 1, 0),
	Title = "Fill Box Color", 
	Transparency = 0,

	Callback = function(Value)
		print("[cb] Fill boxes color changed!", Value)
	end,
})

local RightGroupBox3_Visuals = Tabs.Visuals:AddRightGroupbox("Skeleton Configuration")

RightGroupBox3_Visuals:AddSlider("Skeleton Thickness", {
	Text = "Skeleton Thickness",
	Default = 1,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] Skeleton thickness changed to:", Value)
	end,
})

local RightGroupBox4_Visuals = Tabs.Visuals:AddRightGroupbox("Healthbar Configuration")

RightGroupBox4_Visuals:AddDropdown("Healthbar Style", {
	Values = { "Vertical Right", "Vertical Left", "Horizontal Up", "Horizontal Down" },
	Default = "Vertical Left",
	Multi = false,

	Text = "Healthbar Style",

	Callback = function(Value)
		print("[cb] Healthbar style changed to:", Value)
	end,
})

local RightGroupBox5_Visuals = Tabs.Visuals:AddRightGroupbox("Tracers Configuration")

RightGroupBox5_Visuals:AddSlider("Tracers Thickness", {
	Text = "Tracers Thickness",
	Default = 1,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		print("[cb] Tracers thickness changed to:", Value)
	end,
})

RightGroupBox5_Visuals:AddLabel("Tracers Color"):AddColorPicker("Tracers Color", {
	Default = Color3.new(0, 1, 0),
	Title = "Tracers Color", 
	Transparency = 0,

	Callback = function(Value)
		print("[cb] Tracers color changed!", Value)
	end,
})

local LeftGroupBox1_Exploits = Tabs.Exploits:AddLeftGroupbox("Lag Switch")

LeftGroupBox1_Exploits:AddLabel("Lag Switch"):AddKeyPicker("Lag Switch Key", {
	Default = "LeftAlt",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Lag Switch Key",
	NoUI = false,

	Callback = function(Value)
		print("[cb] Lag Switch clicked!", Value)
	end,
})

-- Settings
local MenuGroup = Tabs["Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("MouseWare")
SaveManager:SetFolder("MouseWare/config")

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["Settings"])

-- Builds our theme menu on the left side
ThemeManager:ApplyToTab(Tabs["Settings"])

-- Load autoload config
SaveManager:LoadAutoloadConfig()

-- Legit Tab Implementation (Functional)
local baseConfig = {
    Enabled      = false,
    AimKey       = Enum.KeyCode.Z,
    ToggleMode   = false,
    AimPart      = "HumanoidRootPart",
    MaxDistance  = 1000,
    Prediction   = {
        BaseFactor   = 0.12,
        AirFactor    = 0.05,
        Dynamic      = false,
        DynamicScale = 0.1,
        Min          = 0.02,
        Max          = 0.25,
    },
    Smoothing    = {
        Enabled      = false,
        Adaptive     = false,
        Value        = 0.15,
        Min          = 0.5,
        Max          = 1,
    },
    Checks       = {
        Visible      = false,
        Team         = false,
        Alive        = false,
        Knocked      = false,
    },
    HistoryMax   = 10,
}

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UserInput   = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera      = workspace.CurrentCamera

local inputBeginConn, inputEndConn
local Aiming, Current, Histories = false, nil, {}

-- Forward declare input handlers for reconnecting
local function onInputBegin() end
local function onInputEnd() end

local Config = setmetatable({}, {
    __index = baseConfig,
    __newindex = function(_, key, value)
        baseConfig[key] = value
        if key == "AimKey" or key == "ToggleMode" then
            if inputBeginConn then inputBeginConn:Disconnect() end
            if inputEndConn   then inputEndConn:Disconnect()   end
            inputBeginConn = UserInput.InputBegan:Connect(onInputBegin)
            inputEndConn   = UserInput.InputEnded:Connect(onInputEnd)
        end
		end
})

-- Helper to always get the current keycode from Config.AimKey (robust for EnumItem, string, table)
local function getKeyCodeFromConfig()
    local key = Config.AimKey
    if typeof(key) == "EnumItem" then
        return key
    elseif typeof(key) == "string" then
        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Name:lower() == key:lower() then
                return v
            end
        end
    elseif typeof(key) == "table" and key.Key then
        return key.Key
    end
    return Enum.KeyCode.Z
end

onInputBegin = function(i, gp)
    if gp then return end
    if not Config.Enabled then return end
    if i.KeyCode == getKeyCodeFromConfig() then
        if Config.ToggleMode then
            Aiming = not Aiming
            if not Aiming then
                Current, Histories = nil, {}
                updateInfo(nil)
            end
        else
            Aiming = true
        end
    end
end

onInputEnd = function(i, gp)
    if gp then return end
    if not Config.Enabled then return end
    if i.KeyCode == getKeyCodeFromConfig() then
        if not Config.ToggleMode then
            Aiming, Current, Histories = false, nil, {}
            updateInfo(nil)
        end
    end
end

if inputBeginConn then inputBeginConn:Disconnect() end
if inputEndConn then inputEndConn:Disconnect() end
inputBeginConn = UserInput.InputBegan:Connect(onInputBegin)
inputEndConn   = UserInput.InputEnded:Connect(onInputEnd)

local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local infoGui   = Instance.new("ScreenGui", playerGui)
infoGui.Name    = "AimlockInfoGui"

local infoFrame = Instance.new("Frame", infoGui)
infoFrame.Size              = UDim2.new(0, 240, 0, 80)
infoFrame.Position          = UDim2.new(0.5, -120, 0, 50)
infoFrame.BackgroundColor3  = Color3.fromRGB(0,0,0)
infoFrame.BackgroundTransparency = 0.5
infoFrame.Visible           = false

local avatarImage = Instance.new("ImageLabel", infoFrame)
avatarImage.Size               = UDim2.new(0,64,0,64)
avatarImage.Position           = UDim2.new(0,5,0,5)
avatarImage.BackgroundTransparency = 1

local nameLabel = Instance.new("TextLabel", infoFrame)
nameLabel.Size             = UDim2.new(0,160,0,20)
nameLabel.Position         = UDim2.new(0,74,0,5)
nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3       = Color3.new(1,1,1)
nameLabel.TextXAlignment   = Enum.TextXAlignment.Left

local healthLabel = Instance.new("TextLabel", infoFrame)
healthLabel.Size           = UDim2.new(0,160,0,20)
healthLabel.Position       = UDim2.new(0,74,0,30)
healthLabel.BackgroundTransparency = 1
healthLabel.TextColor3     = Color3.new(1,1,1)
healthLabel.TextXAlignment = Enum.TextXAlignment.Left

local knockedLabel = Instance.new("TextLabel", infoFrame)
knockedLabel.Size          = UDim2.new(0,160,0,20)
knockedLabel.Position      = UDim2.new(0,74,0,55)
knockedLabel.BackgroundTransparency = 1
knockedLabel.TextColor3    = Color3.new(1,1,1)
knockedLabel.TextXAlignment = Enum.TextXAlignment.Left

local function updateInfo(p)
    if p and p.Character then
        infoFrame.Visible = true
        local thumbUrl = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        avatarImage.Image = thumbUrl
        nameLabel.Text   = "Name: " .. p.DisplayName
        local hum = p.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            healthLabel.Text  = string.format("Health: %d/%d", math.floor(hum.Health), math.floor(hum.MaxHealth))
            knockedLabel.Text = hum.Health < 18 and "Knocked: Yes" or "Knocked: No"
        else
            healthLabel.Text  = ""
            knockedLabel.Text = ""
        end
    else
        infoFrame.Visible = false
    end
end

local function lerp(a,b,t) return a + (b-a)*t end
local function clamp(v,min,max) return math.max(min, math.min(v,max)) end

local function isAlive(p)
    if not Config.Checks.Alive then return true end
    local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
    return h and h.Health > 0
end

local function isTeammate(p)
    return Config.Checks.Team and p.Team == LocalPlayer.Team
end

local function isKnocked(p)
    if not Config.Checks.Knocked then return false end
    local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
    return h and h.Health < 18
end

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Blacklist

local function isVisible(p, partName)
    if not Config.Checks.Visible then return true end
    if not p.Character then return false end
    local part = p.Character:FindFirstChild(partName)
    if not part then return false end
    local origin = Camera.CFrame.Position
    local dirVec = part.Position - origin
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character, p.Character}
    local result = workspace:Raycast(origin, dirVec.Unit * dirVec.Magnitude, rayParams)
    return not result
end

local function worldDistance(p)
    local a = p.Character and p.Character:FindFirstChild(Config.AimPart)
    local b = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(Config.AimPart)
    return (a and b) and (a.Position - b.Position).Magnitude or math.huge
end

local function screenDistance(p)
    local part = p.Character and p.Character:FindFirstChild(Config.AimPart)
    if not part then return math.huge end
    local sp,on = Camera:WorldToScreenPoint(part.Position)
    if not on then return math.huge end
    local mx,my = UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y
    return (Vector2.new(sp.X,sp.Y) - Vector2.new(mx,my)).Magnitude
end

local Histories = {}
local function record(p)
    local part = p.Character and p.Character:FindFirstChild(Config.AimPart)
    if part then
        Histories[p] = Histories[p] or {}
        table.insert(Histories[p], 1, {vel = part.Velocity, time = tick()})
        if #Histories[p] > Config.HistoryMax then table.remove(Histories[p]) end
    end
end

local function predict(p, part)
    local vel, factor = part.Velocity, Config.Prediction.BaseFactor
    local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
    local st  = hum and hum:GetState()
    if st == Enum.HumanoidStateType.Freefall or st == Enum.HumanoidStateType.Jumping then
        factor = Config.Prediction.AirFactor
    elseif Config.Prediction.Dynamic and Histories[p] then
        local sum, ct = Vector3.new(), 0
        for i = 1, #Histories[p] - 1 do
            local dv = Histories[p][i].vel - Histories[p][i+1].vel
            local dt = Histories[p][i].time - Histories[p][i+1].time
            if dt > 0 then sum = sum + dv/dt; ct = ct + 1 end
        end
        if ct > 0 then vel = vel + (sum/ct) * Config.Prediction.BaseFactor * Config.Prediction.DynamicScale end
    end
    factor = clamp(factor, Config.Prediction.Min, Config.Prediction.Max)
    return part.Position + vel * factor
end

local function getTargets()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer
        and isAlive(p)
        and not isTeammate(p)
        and not isKnocked(p)
        and worldDistance(p) <= Config.MaxDistance
        and isVisible(p, Config.AimPart) then
            table.insert(t, p)
        end
    end
    return t
end

local function choose(list)
    local best, bestDist = nil, math.huge
    for _, p in ipairs(list) do
        local dist = screenDistance(p)
        if dist < bestDist then bestDist, best = dist, p end
    end
    return best
end

local function getSmooth()
    if not Config.Smoothing or not Config.Smoothing.Enabled then return 1 end
    if Config.Smoothing.Adaptive and Current then
        local t = clamp(worldDistance(Current)/Config.MaxDistance, 0, 1)
        return lerp(Config.Smoothing.Max or 1, Config.Smoothing.Min or 1, t)
    end
    return Config.Smoothing.Value or 1
end

local function aimAt(pos)
    if not pos then return end
    local origin = Camera.CFrame.Position
    local cf     = CFrame.new(origin, pos)
    if Config.Smoothing and Config.Smoothing.Enabled then
        Camera.CFrame = Camera.CFrame:Lerp(cf, getSmooth())
    else
        Camera.CFrame = cf
    end
end

RunService.RenderStepped:Connect(function()
    if not Config.Enabled or not Aiming then
        updateInfo(nil)
        return
    end

    if not Current then
        Current = choose(getTargets())
        if not Current then
            Histories = {}
            updateInfo(nil)
            return
        end
    end

    if not isAlive(Current)
    or (Config.Checks.Visible and not isVisible(Current, Config.AimPart))
    or isKnocked(Current) then
        Current, Histories = nil, {}
        updateInfo(nil)
        return
    end

    updateInfo(Current)
    local part = Current.Character and Current.Character:FindFirstChild(Config.AimPart)
    if part then
        record(Current)
        aimAt(predict(Current, part))
    else
        Current, Histories = nil, {}
        updateInfo(nil)
    end
end)

-- Sync UI changes to config and reconnect input if needed
Toggles.AimLock:OnChanged(function()
    Config.Enabled = Toggles.AimLock.Value
end)

Toggles.ToggleMode:OnChanged(function()
    Config.ToggleMode = Toggles.ToggleMode.Value
end)

Options.AimKey:OnChanged(function()
    local key = Options.AimKey.Value
    if typeof(key) == "EnumItem" then
        Config.AimKey = key
    elseif typeof(key) == "string" then
        Config.AimKey = key
    elseif typeof(key) == "table" and key.Key then
        Config.AimKey = key.Key
    end
    -- Reconnect input to apply new key instantly
    if inputBeginConn then inputBeginConn:Disconnect() end
    if inputEndConn then inputEndConn:Disconnect() end
    inputBeginConn = UserInput.InputBegan:Connect(onInputBegin)
    inputEndConn   = UserInput.InputEnded:Connect(onInputEnd)
end)

Options.AimPart:OnChanged(function()
    Config.AimPart = Options.AimPart.Value
end)

Options.MaxDistance:OnChanged(function()
    Config.MaxDistance = Options.MaxDistance.Value
end)

Toggles.Smoothness:OnChanged(function()
    Config.Smoothing.Enabled = Toggles.Smoothness.Value
end)

Toggles.Adaptive:OnChanged(function()
    Config.Smoothing.Adaptive = Toggles.Adaptive.Value
end)

Options.SmoothnessValue:OnChanged(function()
    Config.Smoothing.Value = Options.SmoothnessValue.Value
end)

Options.SmoothnessMin:OnChanged(function()
    Config.Smoothing.Min = Options.SmoothnessMin.Value
end)

Options.SmoothnessMax:OnChanged(function()
    Config.Smoothing.Max = Options.SmoothnessMax.Value
end)

Toggles.Prediction:OnChanged(function()
    Config.Prediction.Enabled = Toggles.Prediction.Value
end)

Options.BaseFactor:OnChanged(function()
    Config.Prediction.BaseFactor = Options.BaseFactor.Value
end)

Options.AirFactor:OnChanged(function()
    Config.Prediction.AirFactor = Options.AirFactor.Value
end)

Toggles.Dynamic:OnChanged(function()
    Config.Prediction.Dynamic = Toggles.Dynamic.Value
end)

Options.DynamicScale:OnChanged(function()
    Config.Prediction.DynamicScale = Options.DynamicScale.Value
end)

Options.PredictionMin:OnChanged(function()
    Config.Prediction.Min = Options.PredictionMin.Value
end)

Options.PredictionMax:OnChanged(function()
    Config.Prediction.Max = Options.PredictionMax.Value
end)

Toggles.Visible:OnChanged(function()
    Config.Checks.Visible = Toggles.Visible.Value
end)

Toggles.Team:OnChanged(function()
    Config.Checks.Team = Toggles.Team.Value
end)

Toggles.Alive:OnChanged(function()
    Config.Checks.Alive = Toggles.Alive.Value
end)

Toggles.Knocked:OnChanged(function()
    Config.Checks.Knocked = Toggles.Knocked.Value
end)

-- Rage Tab Cam Lock Aimbot Implementation
local rageAimbotActive = false
local rageAimbotToggle = false
local rageAimbotConn, rageAimbotInputConn
local FoVCircle

local function getRageAimbotKey()
    local key = Options.AimbotKey and Options.AimbotKey.Value
    if typeof(key) == "EnumItem" then
        return key
    elseif typeof(key) == "string" then
        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Name:lower() == key:lower() then
                return v
            end
        end
    elseif typeof(key) == "table" and key.Key then
        return key.Key
    end
    return Enum.KeyCode.Q
end

local function getRageAimPart()
    return Options.AimPartRage and Options.AimPartRage.Value or "HumanoidRootPart"
end

-- Use Legit tab's FoV settings for cam lock
local function getLegitFoV()
    return Options.FoVSlider_Legit and Options.FoVSlider_Legit.Value or 50
end

local function getShowFoVLegit()
    return Toggles.ShowFoV_Legit and Toggles.ShowFoV_Legit.Value or false
end

local function getClosestPlayerInFoV()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local camera = workspace.CurrentCamera
    local mousePos = UserInput:GetMouseLocation()
    local best, bestDist = nil, getLegitFoV()
    for _, p in ipairs(players:GetPlayers()) do
        if p ~= localPlayer and p.Character then
            local part = p.Character:FindFirstChild(getRageAimPart())
            if part then
                local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if dist <= bestDist then
                        bestDist = dist
                        best = p
                    end
                end
            end
        end
    end
    return best
end

-- Draw FoV Circle (now uses Legit tab's settings)
local function createFoVCircle()
    if FoVCircle then FoVCircle:Remove() FoVCircle = nil end
    local Drawing = Drawing or getgenv().Drawing
    if not Drawing then return end
    FoVCircle = Drawing.new("Circle")
    FoVCircle.Thickness = 2
    FoVCircle.Radius = getLegitFoV()
    FoVCircle.Filled = false
    FoVCircle.Color = Color3.fromRGB(255,255,255)
    FoVCircle.Transparency = 0.5
    FoVCircle.Visible = getShowFoVLegit()
end

local function updateFoVCircle()
    if not FoVCircle then return end
    FoVCircle.Radius = getLegitFoV()
    FoVCircle.Visible = getShowFoVLegit()
    local mousePos = UserInput:GetMouseLocation()
    FoVCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
end

if Drawing then
    createFoVCircle()
    RunService.RenderStepped:Connect(function()
        updateFoVCircle()
    end)
end

Options.FoVSlider_Legit:OnChanged(function()
    updateFoVCircle()
end)
Toggles.ShowFoV_Legit:OnChanged(function()
    updateFoVCircle()
end)

-- Rage Aimbot logic
local function rageAimbotStep()
    if not Toggles.Aimbot.Value or not rageAimbotActive then return end
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local camera = workspace.CurrentCamera
    local mousePos = UserInput:GetMouseLocation()
    local best, bestDist = nil, getLegitFoV()
    for _, p in ipairs(players:GetPlayers()) do
        if p ~= localPlayer and p.Character then
            local part = p.Character:FindFirstChild(getRageAimPart())
            if part then
                local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if dist <= bestDist then
                        bestDist = dist
                        best = p
                    end
                end
            end
        end
    end
    if not best or not best.Character then return end
    local part = best.Character:FindFirstChild(getRageAimPart())
    if not part then return end
    camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
end

if rageAimbotConn then rageAimbotConn:Disconnect() end
rageAimbotConn = RunService.RenderStepped:Connect(rageAimbotStep)

-- Rage Aimbot keybind handler
if rageAimbotInputConn then rageAimbotInputConn:Disconnect() end
rageAimbotInputConn = UserInput.InputBegan:Connect(function(input, gp)
    if gp then return end
    if Toggles.Aimbot and Toggles.Aimbot.Value and input.KeyCode == getRageAimbotKey() then
        rageAimbotKeyActive = not rageAimbotKeyActive
    end
end)
UserInput.InputEnded:Connect(function(input, gp)
    -- No-op for toggle mode
end)

local function rageAimbotStep()
    if not (Toggles.Aimbot and Toggles.Aimbot.Value and rageAimbotKeyActive) then return end
    -- ...existing aimbot logic...
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local camera = workspace.CurrentCamera
    local mousePos = UserInput:GetMouseLocation()
    local best, bestDist = nil, getLegitFoV()
    for _, p in ipairs(players:GetPlayers()) do
        if p ~= localPlayer and p.Character then
            local part = p.Character:FindFirstChild(getRageAimPart())
            if part then
                local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if dist <= bestDist then
                        bestDist = dist
                        best = p
                    end
                end
            end
        end
    end
    if not best or not best.Character then return end
    local part = best.Character:FindFirstChild(getRageAimPart())
    if not part then return end
    camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
end

if rageAimbotConn then rageAimbotConn:Disconnect() end
rageAimbotConn = RunService.RenderStepped:Connect(rageAimbotStep)

Toggles.Aimbot:OnChanged(function()
    rageAimbotKeyActive = false
end)

Options.AimbotKey:OnChanged(function()
    -- No need to do anything here, key is read live in the handler
end)

-- Spinbot Implementation
local spinbotConn
local function getSpinbotKey()
    local key = Options.SpinbotKey and Options.SpinbotKey.Value
    if typeof(key) == "EnumItem" then
        return key
    elseif typeof(key) == "string" then
        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Name:lower() == key:lower() then
                return v
            end
        end
    elseif typeof(key) == "table" and key.Key then
        return key.Key
    end
    return Enum.KeyCode.C
end

local function startSpinbot()
    if spinbotConn then spinbotConn:Disconnect() end
    spinbotConn = game:GetService("RunService").RenderStepped:Connect(function(dt)
        if not Toggles["Toggle Spinbot"].Value then return end
        local char = Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        -- Make spin speed much faster and more responsive
        local speed = Options.SpinSpeed and Options.SpinSpeed.Value or 90
        -- Multiply by a higher factor for visible effect (e.g. 10x)
        local rot = (speed or 90) * 50 * dt
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(rot), 0)
    end)
end

local function stopSpinbot()
    if spinbotConn then
        spinbotConn:Disconnect()
        spinbotConn = nil
    end
end

Toggles["Toggle Spinbot"]:OnChanged(function()
    if Toggles["Toggle Spinbot"].Value then
        startSpinbot()
    else
        stopSpinbot()
    end
end)

Options.SpinSpeed:OnChanged(function()
    -- No need to do anything here, speed is read live in the loop
end)

-- Spinbot keybind handler
local spinbotKeyConn
local UserInput = game:GetService("UserInputService")
if spinbotKeyConn then spinbotKeyConn:Disconnect() end
spinbotKeyConn = UserInput.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == getSpinbotKey() then
        Toggles["Toggle Spinbot"]:SetValue(not Toggles["Toggle Spinbot"].Value)
    end
end)

Options.SpinbotKey:OnChanged(function()
    -- No need to do anything here, key is read live in the handler
end)

-- Optional: Stop spinbot if character respawns
Players.LocalPlayer.CharacterAdded:Connect(function()
    if Toggles["Toggle Spinbot"].Value then
        startSpinbot()
    end
end)

-- Walkspeed Implementation
local walkspeedConn
local walkspeedKeyActive = false
local function setWalkspeed(enabled)
    local char = Players.LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            if enabled then
                hum.WalkSpeed = Options.WalkspeedValue and Options.WalkspeedValue.Value or 16
            else
                hum.WalkSpeed = 16
            end
        end
    end
end

local function startWalkspeed()
    setWalkspeed(true)
    if walkspeedConn then walkspeedConn:Disconnect() end
    walkspeedConn = Players.LocalPlayer.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid").WalkSpeed = Options.WalkspeedValue and Options.WalkspeedValue.Value or 16
    end)
end

local function stopWalkspeed()
    setWalkspeed(false)
    if walkspeedConn then walkspeedConn:Disconnect() end
    walkspeedConn = nil
end

Toggles["Toggle Walkspeed"]:OnChanged(function()
    -- Only enable keybind listening, not walkspeed itself
    if not Toggles["Toggle Walkspeed"].Value then
        if walkspeedKeyActive then stopWalkspeed() end
        walkspeedKeyActive = false
    end
end)

Options.WalkspeedValue:OnChanged(function()
    if Toggles["Toggle Walkspeed"].Value and walkspeedKeyActive then
        setWalkspeed(true)
    end
end)

-- Walkspeed keybind handler (now requires both toggle and keybind)
local function getWalkspeedKey()
    local key = Options.WalkspeedKey and Options.WalkspeedKey.Value
    if typeof(key) == "EnumItem" then
        return key
    elseif typeof(key) == "string" then
        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Name:lower() == key:lower() then
                return v
            end
        end
    elseif typeof(key) == "table" and key.Key then
        return key.Key
    end
    return Enum.KeyCode.X
end

local walkspeedKeyConn
if walkspeedKeyConn then walkspeedKeyConn:Disconnect() end
walkspeedKeyConn = UserInput.InputBegan:Connect(function(input, gp)
    if gp then return end
    if Toggles["Toggle Walkspeed"].Value and input.KeyCode == getWalkspeedKey() then
        walkspeedKeyActive = not walkspeedKeyActive
        if walkspeedKeyActive then
            startWalkspeed()
        else
            stopWalkspeed()
        end
    end
end)

Options.WalkspeedKey:OnChanged(function()
    -- No need to do anything here, key is read live in the handler
end)

Players.LocalPlayer.CharacterAdded:Connect(function()
    -- ...existing code...
    if Toggles["Toggle Spinbot"].Value then
        startSpinbot()
    end
    if Toggles["Toggle Walkspeed"].Value then
        setWalkspeed(true)
    end
    -- Do not auto start fly, wait for keybind
    flyKeyActive = false
    stopFly()
end)

-- Fly Implementation
local flyConn
local flying = false
local flyBodyVel, flyBodyGyro
local flyKeyActive = false

local function setFly(enabled)
    local char = Players.LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    if enabled then
        if not flyBodyVel then
            flyBodyVel = Instance.new("BodyVelocity")
            flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            flyBodyVel.P = 1e4
            flyBodyVel.Parent = hrp
        end
        if not flyBodyGyro then
            flyBodyGyro = Instance.new("BodyGyro")
            flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            flyBodyGyro.P = 1e4
            flyBodyGyro.Parent = hrp
        end
        hum.PlatformStand = true
        flying = true
    else
        if flyBodyVel then flyBodyVel:Destroy() flyBodyVel = nil end
        if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
        hum.PlatformStand = false
        flying = false
    end
end

local function startFly()
    setFly(true)
    if flyConn then flyConn:Disconnect() end
    flyConn = RunService.RenderStepped:Connect(function()
        if not flying then return end
        local char = Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp or not flyBodyVel or not flyBodyGyro then return end
        local cam = workspace.CurrentCamera
        local move = Vector3.new()
        if UserInput:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
        if UserInput:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
        if UserInput:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
        if UserInput:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
        if UserInput:IsKeyDown(Enum.KeyCode.Space) then move = move + cam.CFrame.UpVector end
        if UserInput:IsKeyDown(Enum.KeyCode.LeftControl) or UserInput:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - cam.CFrame.UpVector end
        if move.Magnitude > 0 then move = move.Unit end
        local speed = Options.FlySpeed and Options.FlySpeed.Value or 30
        flyBodyVel.Velocity = move * speed
        flyBodyGyro.CFrame = cam.CFrame
    end)
end

local function stopFly()
    setFly(false)
    if flyConn then flyConn:Disconnect() end
    flyConn = nil
end

Toggles["Toggle Fly"]:OnChanged(function()
    -- Only enable keybind listening, not flying itself
    if not Toggles["Toggle Fly"].Value then
        if flying then stopFly() end
        flyKeyActive = false
    end
end)

Options.FlySpeed:OnChanged(function()
    -- No need to do anything here, speed is read live in the loop
end)

-- Fly keybind handler (now requires both toggle and keybind)
local function getFlyKey()
    local key = Options.FlyKey and Options.FlyKey.Value
    if typeof(key) == "EnumItem" then
        return key
    elseif typeof(key) == "string" then
        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Name:lower() == key:lower() then
                return v
            end
        end
    elseif typeof(key) == "table" and key.Key then
        return key.Key
    end
    return Enum.KeyCode.V
end

local flyKeyConn
if flyKeyConn then flyKeyConn:Disconnect() end
flyKeyConn = UserInput.InputBegan:Connect(function(input, gp)
    if gp then return end
    if Toggles["Toggle Fly"].Value and input.KeyCode == getFlyKey() then
        flyKeyActive = not flyKeyActive
        if flyKeyActive then
            startFly()
        else
            stopFly()
        end
    end
end)

Options.FlyKey:OnChanged(function()
    -- No need to do anything here, key is read live in the handler
end)

Players.LocalPlayer.CharacterAdded:Connect(function()
    -- ...existing code...
    if Toggles["Toggle Spinbot"].Value then
        startSpinbot()
    end
    if Toggles["Toggle Walkspeed"].Value then
        setWalkspeed(true)
    end
    -- Do not auto start fly, wait for keybind
    flyKeyActive = false
    stopFly()
end)

-- === ESP & Visuals Implementation (Robust & Accurate) ===

local ESP = {}
local Drawing = Drawing or getgenv().Drawing
local visualsConn

local function isDrawing(obj)
    return typeof(obj) == "table" and obj.Remove ~= nil and obj.Visible ~= nil
end

local function clearESP()
    for userId, tbl in pairs(ESP) do
        for _, obj in pairs(tbl) do
            if typeof(obj) == "table" then
                for _, o in pairs(obj) do if isDrawing(o) then o:Remove() end end
            elseif isDrawing(obj) then
                obj:Remove()
            end
        end
        ESP[userId] = nil
    end
end

local function removeAllESPForUser(userId)
    local tbl = ESP[userId]
    if tbl then
        for _, obj in pairs(tbl) do
            if typeof(obj) == "table" then
                for _, o in pairs(obj) do if isDrawing(o) then o:Remove() end end
            elseif isDrawing(obj) then
                obj:Remove()
            end
        end
        ESP[userId] = nil
    end
end

-- When toggling any ESP option, fully clear and remove all ESP objects (not just hide)
for _, v in ipairs({"Box","Skeleton","Name","Healthbar","Tracers","Cornered Box"}) do
    if Toggles[v] then
        Toggles[v]:OnChanged(function()
            clearESP()
        end)
    end
end
for _, v in ipairs({"Boxes Color","Fill Box Color","Tracers Color","Box Thickness","Skeleton Thickness","Tracers Thickness","Style","Healthbar Style"}) do
    if Options[v] then
        Options[v]:OnChanged(function()
            clearESP()
        end)
    end
end

local function getBoxColor()
    return Options["Boxes Color"] and Options["Boxes Color"].Value or Color3.new(0,1,0)
end
local function getFillBoxColor()
    return Options["Fill Box Color"] and Options["Fill Box Color"].Value or Color3.new(0,1,0)
end
local function getTracersColor()
    return Options["Tracers Color"] and Options["Tracers Color"].Value or Color3.new(0,1,0)
end
local function getBoxThickness()
    return Options["Box Thickness"] and Options["Box Thickness"].Value or 1
end
local function getSkeletonThickness()
    return Options["Skeleton Thickness"] and Options["Skeleton Thickness"].Value or 1
end
local function getTracersThickness()
    return Options["Tracers Thickness"] and Options["Tracers Thickness"].Value or 1
end
local function getBoxStyle()
    return Options["Style"] and Options["Style"].Value or "Outline Only"
end
local function getHealthbarStyle()
    return Options["Healthbar Style"] and Options["Healthbar Style"].Value or "Vertical Left"
end

local function lerpColor3(a, b, t)
    return Color3.new(
        a.R + (b.R - a.R) * t,
        a.G + (b.G - a.G) * t,
        a.B + (b.B - a.B) * t
    )
end

local function healthGradient(hp)
    if hp < 0.5 then
        -- Red to Yellow
        return lerpColor3(Color3.fromRGB(255,0,0), Color3.fromRGB(255,255,0), hp*2)
    else
        -- Yellow to Green
        return lerpColor3(Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), (hp-0.5)*2)
    end
end

-- Use all character points for box bounds
local function getFullCharBoxBounds(char, cam)
    local minX, minY, maxX, maxY = math.huge, math.huge, -math.huge, -math.huge
    local any = false
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            local pos, onScreen = cam:WorldToViewportPoint(part.Position)
            if onScreen then
                minX = math.min(minX, pos.X)
                minY = math.min(minY, pos.Y)
                maxX = math.max(maxX, pos.X)
                maxY = math.max(maxY, pos.Y)
                any = true
            end
        end
    end
    if not any then return end
    -- Expand box slightly for padding
    local padY = (maxY-minY)*0.08
    local padX = (maxX-minX)*0.04
    minY = minY - padY
    maxY = maxY + padY
    minX = minX - padX
    maxX = maxX + padX
    return minX, minY, maxX-minX, maxY-minY, true
end

local function drawCornerLines(tbl, minX, minY, maxX, maxY, color, thickness)
    local len = math.max((maxX-minX), (maxY-minY)) * 0.2
    tbl = tbl or {}
    -- Top Left
    tbl[1] = tbl[1] or Drawing.new("Line")
    tbl[1].Visible = true
    tbl[1].From = Vector2.new(minX, minY)
    tbl[1].To = Vector2.new(minX+len, minY)
    tbl[1].Color = color
    tbl[1].Thickness = thickness
    tbl[2] = tbl[2] or Drawing.new("Line")
    tbl[2].Visible = true
    tbl[2].From = Vector2.new(minX, minY)
    tbl[2].To = Vector2.new(minX, minY+len)
    tbl[2].Color = color
    tbl[2].Thickness = thickness
    -- Top Right
    tbl[3] = tbl[3] or Drawing.new("Line")
    tbl[3].Visible = true
    tbl[3].From = Vector2.new(maxX, minY)
    tbl[3].To = Vector2.new(maxX-len, minY)
    tbl[3].Color = color
    tbl[3].Thickness = thickness
    tbl[4] = tbl[4] or Drawing.new("Line")
    tbl[4].Visible = true
    tbl[4].From = Vector2.new(maxX, minY)
    tbl[4].To = Vector2.new(maxX, minY+len)
    tbl[4].Color = color
    tbl[4].Thickness = thickness
    -- Bottom Left
    tbl[5] = tbl[5] or Drawing.new("Line")
    tbl[5].Visible = true
    tbl[5].From = Vector2.new(minX, maxY)
    tbl[5].To = Vector2.new(minX+len, maxY)
    tbl[5].Color = color
    tbl[5].Thickness = thickness
    tbl[6] = tbl[6] or Drawing.new("Line")
    tbl[6].Visible = true
    tbl[6].From = Vector2.new(minX, maxY)
    tbl[6].To = Vector2.new(minX, maxY-len)
    tbl[6].Color = color
    tbl[6].Thickness = thickness
    -- Bottom Right
    tbl[7] = tbl[7] or Drawing.new("Line")
    tbl[7].Visible = true
    tbl[7].From = Vector2.new(maxX, maxY)
    tbl[7].To = Vector2.new(maxX-len, maxY)
    tbl[7].Color = color
    tbl[7].Thickness = thickness
    tbl[8] = tbl[8] or Drawing.new("Line")
    tbl[8].Visible = true
    tbl[8].From = Vector2.new(maxX, maxY)
    tbl[8].To = Vector2.new(maxX, maxY-len)
    tbl[8].Color = color
    tbl[8].Thickness = thickness
    return tbl
end

local function hideCornerLines(tbl)
    if tbl then for i=1,8 do if tbl[i] then tbl[i].Visible = false end end end
end

local function getAllCharacterPoints(char)
    local points = {}
    for _, part in ipairs({
        "Head","HumanoidRootPart","UpperTorso","LowerTorso",
        "LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand",
        "LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"
    }) do
        local p = char:FindFirstChild(part)
        if p then table.insert(points, p.Position) end
    end
    return points
end

local function updateESP()
    if not Drawing then return end
    local cam = workspace.CurrentCamera

    -- Remove ESP for players who left or are not valid
    for userId, tbl in pairs(ESP) do
        local plr = Players:GetPlayerByUserId(userId)
        if not plr or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
            removeAllESPForUser(userId)
        end
    end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local userId = plr.UserId
            ESP[userId] = ESP[userId] or {}
            local char = plr.Character
            local minX, minY, boxW, boxH, valid = getFullCharBoxBounds(char, cam)
            if not valid then
                -- Remove all ESP for this player if not valid (prevents freeze)
                removeAllESPForUser(userId)
                continue
            end
            local maxX, maxY = minX + boxW, minY + boxH
            local hum = char:FindFirstChildOfClass("Humanoid")

            -- Box
            if Toggles.Box and Toggles.Box.Value then
                if Toggles["Cornered Box"] and Toggles["Cornered Box"].Value then
                    -- Remove normal box and outline if they exist
                    if ESP[userId].Box then ESP[userId].Box:Remove(); ESP[userId].Box = nil end
                    if ESP[userId].BoxOutline then ESP[userId].BoxOutline:Remove(); ESP[userId].BoxOutline = nil end
                    -- Remove any old cornered box lines if count is not 8
                    if ESP[userId].CorneredBox and #ESP[userId].CorneredBox ~= 8 then
                        for _, o in pairs(ESP[userId].CorneredBox) do if isDrawing(o) then o:Remove() end end
                        ESP[userId].CorneredBox = nil
                    end
                    ESP[userId].CorneredBox = drawCornerLines(ESP[userId].CorneredBox, minX, minY, maxX, maxY, getBoxColor(), getBoxThickness())
                else
                    -- Remove cornered box lines if they exist
                    if ESP[userId].CorneredBox then
                        for i=1,8 do
                            if ESP[userId].CorneredBox[i] then ESP[userId].CorneredBox[i]:Remove(); ESP[userId].CorneredBox[i] = nil end
                        end
                        ESP[userId].CorneredBox = nil
                    end
                    if not ESP[userId].Box then ESP[userId].Box = Drawing.new("Square") end
                    local box = ESP[userId].Box
                    box.Visible = true
                    box.Position = Vector2.new(minX, minY)
                    box.Size = Vector2.new(boxW, boxH)
                    box.Color = getBoxColor()
                    box.Thickness = getBoxThickness()
                    box.Filled = (getBoxStyle() == "Fill Only" or getBoxStyle() == "Fill + Outline")
                    box.Transparency = (box.Filled and 0.3) or 1
                    if getBoxStyle() == "Fill + Outline" then
                        if not ESP[userId].BoxOutline then ESP[userId].BoxOutline = Drawing.new("Square") end
                        local outline = ESP[userId].BoxOutline
                        outline.Visible = true
                        outline.Position = Vector2.new(minX-1, minY-1)
                        outline.Size = Vector2.new(boxW+2, boxH+2)
                        outline.Color = Color3.new(0,0,0)
                        outline.Thickness = box.Thickness+2
                        outline.Filled = false
                        outline.Transparency = 1
                    elseif ESP[userId].BoxOutline then
                        ESP[userId].BoxOutline:Remove(); ESP[userId].BoxOutline = nil
                    end
                    if box.Filled then
                        box.Color = getFillBoxColor()
                        box.Transparency = 0.3
                    end
                end
            else
                -- Remove all box objects if box is disabled
                if ESP[userId].Box then ESP[userId].Box:Remove(); ESP[userId].Box = nil end
                if ESP[userId].BoxOutline then ESP[userId].BoxOutline:Remove(); ESP[userId].BoxOutline = nil end
                if ESP[userId].CorneredBox then
                    for i=1,8 do
                        if ESP[userId].CorneredBox[i] then ESP[userId].CorneredBox[i]:Remove(); ESP[userId].CorneredBox[i] = nil end
                    end
                    ESP[userId].CorneredBox = nil
                end
            end

            -- Name
            if Toggles.Name and Toggles.Name.Value then
                if not ESP[userId].Name then ESP[userId].Name = Drawing.new("Text") end
                local name = ESP[userId].Name
                name.Visible = true
                name.Text = plr.DisplayName
                name.Size = math.max(13, math.floor(boxH * 0.18))
                name.Center = true
                name.Outline = true
                name.Color = Color3.new(1,1,1)
                name.Transparency = 1
                name.Position = Vector2.new(minX + boxW/2, minY - name.Size - 2)
                name.Font = 2
            else
                if ESP[userId].Name then ESP[userId].Name.Visible = false end
            end

            -- Healthbar (gradient)
            if Toggles.Healthbar and Toggles.Healthbar.Value and hum then
                if not ESP[userId].Healthbar then ESP[userId].Healthbar = Drawing.new("Square") end
                if not ESP[userId].HealthbarBg then ESP[userId].HealthbarBg = Drawing.new("Square") end
                local bar = ESP[userId].Healthbar
                local bg = ESP[userId].HealthbarBg
                local hp = math.clamp(hum.Health/hum.MaxHealth,0,1)
                local style = getHealthbarStyle()
                local barW, barH, barX, barY
                if style == "Vertical Left" then
                    barW = 5
                    barH = boxH
                    barX = minX - barW - 2
                    barY = minY + (1-hp)*barH
                    bar.Position = Vector2.new(barX, barY)
                    bar.Size = Vector2.new(barW, barH*hp)
                    bg.Position = Vector2.new(barX, minY)
                    bg.Size = Vector2.new(barW, barH)
                elseif style == "Vertical Right" then
                    barW = 5
                    barH = boxH
                    barX = maxX + 2
                    barY = minY + (1-hp)*barH
                    bar.Position = Vector2.new(barX, barY)
                    bar.Size = Vector2.new(barW, barH*hp)
                    bg.Position = Vector2.new(barX, minY)

                    bg.Size = Vector2.new(barW, barH)
                               elseif style == "Horizontal Up" then
                    barW = boxW
                    barH = 5
                    barX = minX
                    barY = minY - barH - 2
                    bar.Position = Vector2.new(barX, barY)
                    bar.Size = Vector2.new(barW*hp, barH)
                    bg.Position = Vector2.new(barX, barY)
                    bg.Size = Vector2.new(barW, barH)
                elseif style == "Horizontal Down" then
                    barW = boxW
                    barH = 5
                    barX = minX
                    barY = maxY + 2
                    bar.Position = Vector2.new(barX, barY)
                    bar.Size = Vector2.new(barW*hp, barH)
                    bg.Position = Vector2.new(barX, barY)
                    bg.Size = Vector2.new(barW, barH)
                end
                bar.Visible = true
                bar.Color = healthGradient(hp)
                bar.Filled = true
                bar.Transparency = 0.8
                bar.Thickness = 1
                bar.ZIndex = 1
                bg.Visible = true
                bg.Color = Color3.new(0,0,0)
                bg.Filled = true
                bg.Transparency = 0.5
                bg.Thickness = 0
                bg.ZIndex = 0
            else
                if ESP[userId].Healthbar then ESP[userId].Healthbar.Visible = false end
                if ESP[userId].HealthbarBg then ESP[userId].HealthbarBg.Visible = false end
            end

            -- Tracers
            if Toggles.Tracers and Toggles.Tracers.Value then
                if not ESP[userId].Tracer then ESP[userId].Tracer = Drawing.new("Line") end
                local tracer = ESP[userId].Tracer
                tracer.Visible = true
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    local to, onScreen = cam:WorldToViewportPoint(root.Position)
                    if onScreen then
                        tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                        tracer.To = Vector2.new(to.X, to.Y)
                    else
                        tracer.Visible = false
                    end
                else
                    tracer.Visible = false
                end
                tracer.Color = getTracersColor()
                tracer.Thickness = getTracersThickness()
                tracer.Transparency = 1
            else
                if ESP[userId].Tracer then ESP[userId].Tracer.Visible = false end
            end

            -- Skeleton
            if Toggles.Skeleton and Toggles.Skeleton.Value then
                if not ESP[userId].Skeleton then ESP[userId].Skeleton = {} end
                local bones = {
                    {"Head","UpperTorso"},
                    {"UpperTorso","LowerTorso"},
                    {"UpperTorso","LeftUpperArm"},
                    {"UpperTorso","RightUpperArm"},
                    {"LeftUpperArm","LeftLowerArm"},
                    {"RightUpperArm","RightLowerArm"},
                    {"LeftLowerArm","LeftHand"},
                    {"RightLowerArm","RightHand"},
                    {"LowerTorso","LeftUpperLeg"},
                    {"LowerTorso","RightUpperLeg"},
                    {"LeftUpperLeg","LeftLowerLeg"},
                    {"RightUpperLeg","RightLowerLeg"},
                    {"LeftLowerLeg","LeftFoot"},
                    {"RightLowerLeg","RightFoot"},
                }
                for i, bone in ipairs(bones) do
                    local a = char:FindFirstChild(bone[1])
                    local b = char:FindFirstChild(bone[2])
                    if a and b then
                        local a2d, aok = cam:WorldToViewportPoint(a.Position)
                        local b2d, bok = cam:WorldToViewportPoint(b.Position)
                        if not ESP[userId].Skeleton[i] then ESP[userId].Skeleton[i] = Drawing.new("Line") end
                        local line = ESP[userId].Skeleton[i]
                        line.Visible = aok and bok
                        if aok and bok then
                            line.From = Vector2.new(a2d.X, a2d.Y)
                            line.To = Vector2.new(b2d.X, b2d.Y)
                            line.Color = getBoxColor()
                            line.Thickness = getSkeletonThickness()
                            line.Transparency = 1
                        end
                    elseif ESP[userId].Skeleton[i] then
                        ESP[userId].Skeleton[i].Visible = false
                    end
                end
            else
                if ESP[userId].Skeleton then for _, l in pairs(ESP[userId].Skeleton) do if isDrawing(l) then l.Visible = false end end end
            end

        else
            -- Remove all ESP for this player if not valid (prevents freeze)
            local userId = plr.UserId
            removeAllESPForUser(userId)
        end
    end
end

if visualsConn then visualsConn:Disconnect() end
visualsConn = RunService.RenderStepped:Connect(function()
    pcall(updateESP)
end)

Players.PlayerRemoving:Connect(function(plr)
    removeAllESPForUser(plr.UserId)
end)
