-- OxygenU ESP Controller
local ESP = loadstring(game:HttpGet("file:///c:/Users/Ryzen Gaming/Desktop/oxygenu/OxygenU/Scripts/EspModule.lua"))()
loadstring(game:HttpGet("file:///c:/Users/Ryzen Gaming/Desktop/oxygenu/OxygenU/Scripts/EspModule2.lua"))()

-- Initialize the ESP
ESP:Init()

-- Export the ESP controller
return function(Options, Toggles)
    -- Link UI elements to ESP settings
    
    -- Main ESP
    Toggles["EnableESP"] = Toggles["EnableESP"] or { Value = false }
    Toggles["EnableESP"]:OnChanged(function()
        ESP.Settings.Enabled = Toggles["EnableESP"].Value
        if not ESP.Settings.Enabled then
            ESP:DisableESP()
        end
    end)
    
    Toggles["TeamCheck"]:OnChanged(function()
        ESP.Settings.TeamCheck = Toggles["TeamCheck"].Value
    end)
    
    Toggles["ShowTeam"]:OnChanged(function()
        ESP.Settings.ShowTeam = Toggles["ShowTeam"].Value
    end)
    
    -- Box ESP
    Toggles["BoxESP"]:OnChanged(function()
        ESP.Settings.BoxESP = Toggles["BoxESP"].Value
    end)
    
    Options["BoxESPStyle"]:OnChanged(function()
        ESP.Settings.BoxStyle = Options["BoxESPStyle"].Value
    end)
    
    -- Tracer ESP
    Toggles["TracerESP"]:OnChanged(function()
        ESP.Settings.TracerESP = Toggles["TracerESP"].Value
    end)
    
    Options["TracerESPOrigin"]:OnChanged(function()
        ESP.Settings.TracerOrigin = Options["TracerESPOrigin"].Value
    end)
    
    -- Chams
    Toggles["Chams"]:OnChanged(function()
        ESP.Settings.ChamsEnabled = Toggles["Chams"].Value
    end)
    
    Options["ChamsFillColor"]:OnChanged(function()
        ESP.Settings.ChamsFillColor = Options["ChamsFillColor"].Value
    end)
    
    Options["ChamsOccludedColor"]:OnChanged(function()
        ESP.Settings.ChamsOccludedColor = Options["ChamsOccludedColor"].Value
    end)
    
    Options["ChamsOutlineColor"]:OnChanged(function()
        ESP.Settings.ChamsOutlineColor = Options["ChamsOutlineColor"].Value
    end)
    
    Options["ChamsFillTransparency"]:OnChanged(function()
        ESP.Settings.ChamsTransparency = Options["ChamsFillTransparency"].Value
    end)
    
    Options["ChamsOutlineTransparency"]:OnChanged(function()
        ESP.Settings.ChamsOutlineTransparency = Options["ChamsOutlineTransparency"].Value
    end)
    
    Options["ChamsOutlineThickness"]:OnChanged(function()
        ESP.Settings.ChamsOutlineThickness = Options["ChamsOutlineThickness"].Value
    end)
    
    -- Health ESP
    Toggles["HealthESP"]:OnChanged(function()
        ESP.Settings.HealthESP = Toggles["HealthESP"].Value
    end)
    
    Options["HealthStyle"]:OnChanged(function()
        ESP.Settings.HealthStyle = Options["HealthStyle"].Value
    end)
    
    -- Skeleton ESP
    Toggles["SkeletonESP"]:OnChanged(function()
        ESP.Settings.SkeletonESP = Toggles["SkeletonESP"].Value
    end)
    
    Options["SkeletonESPColor"]:OnChanged(function()
        ESP.Settings.SkeletonColor = Options["SkeletonESPColor"].Value
    end)
    
    Options["SkeletonLineThickness"]:OnChanged(function()
        ESP.Settings.SkeletonThickness = Options["SkeletonLineThickness"].Value
    end)
    
    Options["SkeletonESPTransparency"]:OnChanged(function()
        ESP.Settings.SkeletonTransparency = Options["SkeletonESPTransparency"].Value
    end)
    
    -- Colors
    Options["EnemyColor"]:OnChanged(function()
        ESP.Colors.Enemy = Options["EnemyColor"].Value
    end)
    
    Options["AllyColor"]:OnChanged(function()
        ESP.Colors.Ally = Options["AllyColor"].Value
    end)
    
    Options["HealthBarFullColor"]:OnChanged(function()
        ESP.Colors.Health = Options["HealthBarFullColor"].Value
    end)
    
    -- Box Settings
    Options["BoxThickness"]:OnChanged(function()
        ESP.Settings.BoxThickness = Options["BoxThickness"].Value
    end)
    
    Options["BoxTransparency"]:OnChanged(function()
        ESP.Settings.BoxFillTransparency = Options["BoxTransparency"].Value
    end)
    
    -- ESP Settings
    Options["MaxDistance"]:OnChanged(function()
        ESP.Settings.MaxDistance = Options["MaxDistance"].Value
    end)
    
    Options["TextSize"]:OnChanged(function()
        ESP.Settings.TextSize = Options["TextSize"].Value
    end)
    
    -- Effects
    Toggles["RainbowMode"]:OnChanged(function()
        ESP.Settings.RainbowEnabled = Toggles["RainbowMode"].Value
    end)
    
    Options["RainbowSpeed"]:OnChanged(function()
        ESP.Settings.RainbowSpeed = Options["RainbowSpeed"].Value
    end)
    
    Options["RainbowParts"]:OnChanged(function()
        local value = Options["RainbowParts"].Value
        if value == "All" then
            ESP.Settings.RainbowBoxes = true
            ESP.Settings.RainbowTracers = true
            ESP.Settings.RainbowText = true
        elseif value == "Box Only" then
            ESP.Settings.RainbowBoxes = true
            ESP.Settings.RainbowTracers = false
            ESP.Settings.RainbowText = false
        elseif value == "Tracers Only" then
            ESP.Settings.RainbowBoxes = false
            ESP.Settings.RainbowTracers = true
            ESP.Settings.RainbowText = false
        elseif value == "Text Only" then
            ESP.Settings.RainbowBoxes = false
            ESP.Settings.RainbowTracers = false
            ESP.Settings.RainbowText = true
        end
    end)
    
    -- Performance
    Options["RefreshRate"]:OnChanged(function()
        ESP.Settings.RefreshRate = 1 / Options["RefreshRate"].Value
    end)
    
    -- Return ESP controller for direct access if needed
    return ESP
end
