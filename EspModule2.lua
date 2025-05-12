-- OxygenU ESP Module - Part 2 (Update functions)
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/skreyy/mouseware/refs/heads/main/EspModule.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Update ESP for a player
function ESP:UpdateESP(player)
    if not self.Settings.Enabled then return end
    
    local esp = self.Drawings.ESP[player]
    if not esp then return end
    
    local character = player.Character
    if not character then 
        -- Hide all drawings if character doesn't exist
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
        return 
    end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then 
        -- Hide all drawings if rootPart doesn't exist
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
        return 
    end
    
    -- Early screen check to hide all drawings if player is off screen
    local _, isOnScreen = Camera:WorldToViewportPoint(rootPart.Position)
    if not isOnScreen then
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
        return
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
        return
    end
    
    local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
    local distance = (rootPart.Position - Camera.CFrame.Position).Magnitude
    
    if not onScreen or distance > self.Settings.MaxDistance then
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        return
    end
    
    if self.Settings.TeamCheck and player.Team == LocalPlayer.Team and not self.Settings.ShowTeam then
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        esp.Tracer.Visible = false
        for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
        for _, obj in pairs(esp.Info) do obj.Visible = false end
        esp.Snapline.Visible = false
        return
    end
    
    local color = self:GetPlayerColor(player)
    local size = character:GetExtentsSize()
    local cf = rootPart.CFrame
    
    local top, top_onscreen = Camera:WorldToViewportPoint(cf * CFrame.new(0, size.Y/2, 0).Position)
    local bottom, bottom_onscreen = Camera:WorldToViewportPoint(cf * CFrame.new(0, -size.Y/2, 0).Position)
    
    if not top_onscreen or not bottom_onscreen then
        for _, obj in pairs(esp.Box) do obj.Visible = false end
        return
    end
    
    local screenSize = bottom.Y - top.Y
    local boxWidth = screenSize * 0.65
    local boxPosition = Vector2.new(top.X - boxWidth/2, top.Y)
    local boxSize = Vector2.new(boxWidth, screenSize)
    
    -- Hide all box parts by default
    for _, obj in pairs(esp.Box) do
        obj.Visible = false
    end
    
    if self.Settings.BoxESP then
        if self.Settings.BoxStyle == "ThreeD" or self.Settings.BoxStyle == "3D" then
            local front = {
                TL = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, size.Y/2, -size.Z/2)).Position),
                TR = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, size.Y/2, -size.Z/2)).Position),
                BL = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, -size.Y/2, -size.Z/2)).Position),
                BR = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, -size.Y/2, -size.Z/2)).Position)
            }
            
            local back = {
                TL = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, size.Y/2, size.Z/2)).Position),
                TR = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, size.Y/2, size.Z/2)).Position),
                BL = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, -size.Y/2, size.Z/2)).Position),
                BR = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, -size.Y/2, size.Z/2)).Position)
            }
            
            if not (front.TL.Z > 0 and front.TR.Z > 0 and front.BL.Z > 0 and front.BR.Z > 0 and
                   back.TL.Z > 0 and back.TR.Z > 0 and back.BL.Z > 0 and back.BR.Z > 0) then
                for _, obj in pairs(esp.Box) do obj.Visible = false end
                return
            end
            
            -- Convert to Vector2
            local function toVector2(v3) return Vector2.new(v3.X, v3.Y) end
            front.TL, front.TR = toVector2(front.TL), toVector2(front.TR)
            front.BL, front.BR = toVector2(front.BL), toVector2(front.BR)
            back.TL, back.TR = toVector2(back.TL), toVector2(back.TR)
            back.BL, back.BR = toVector2(back.BL), toVector2(back.BR)
            
            -- Front face
            esp.Box.TopLeft.From = front.TL
            esp.Box.TopLeft.To = front.TR
            esp.Box.TopLeft.Visible = true
            
            esp.Box.TopRight.From = front.TR
            esp.Box.TopRight.To = front.BR
            esp.Box.TopRight.Visible = true
            
            esp.Box.BottomLeft.From = front.BL
            esp.Box.BottomLeft.To = front.BR
            esp.Box.BottomLeft.Visible = true
            
            esp.Box.BottomRight.From = front.TL
            esp.Box.BottomRight.To = front.BL
            esp.Box.BottomRight.Visible = true
            
            -- Back face
            esp.Box.Left.From = back.TL
            esp.Box.Left.To = back.TR
            esp.Box.Left.Visible = true
            
            esp.Box.Right.From = back.TR
            esp.Box.Right.To = back.BR
            esp.Box.Right.Visible = true
            
            esp.Box.Top.From = back.BL
            esp.Box.Top.To = back.BR
            esp.Box.Top.Visible = true
            
            esp.Box.Bottom.From = back.TL
            esp.Box.Bottom.To = back.BL
            esp.Box.Bottom.Visible = true
            
            -- Connecting lines
            local function drawConnectingLine(from, to, visible)
                local line = Drawing.new("Line")
                line.Visible = visible
                line.Color = color
                line.Thickness = self.Settings.BoxThickness
                line.From = from
                line.To = to
                return line
            end
            
            -- Connect front to back
            local connectors = {
                drawConnectingLine(front.TL, back.TL, true),
                drawConnectingLine(front.TR, back.TR, true),
                drawConnectingLine(front.BL, back.BL, true),
                drawConnectingLine(front.BR, back.BR, true)
            }
            
            -- Clean up connecting lines after frame
            task.spawn(function()
                task.wait()
                for _, line in ipairs(connectors) do
                    line:Remove()
                end
            end)
            
        elseif self.Settings.BoxStyle == "Corner" then
            local cornerSize = boxWidth * 0.2
            
            esp.Box.TopLeft.From = boxPosition
            esp.Box.TopLeft.To = boxPosition + Vector2.new(cornerSize, 0)
            esp.Box.TopLeft.Visible = true
            
            esp.Box.TopRight.From = boxPosition + Vector2.new(boxSize.X, 0)
            esp.Box.TopRight.To = boxPosition + Vector2.new(boxSize.X - cornerSize, 0)
            esp.Box.TopRight.Visible = true
            
            esp.Box.BottomLeft.From = boxPosition + Vector2.new(0, boxSize.Y)
            esp.Box.BottomLeft.To = boxPosition + Vector2.new(cornerSize, boxSize.Y)
            esp.Box.BottomLeft.Visible = true
            
            esp.Box.BottomRight.From = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
            esp.Box.BottomRight.To = boxPosition + Vector2.new(boxSize.X - cornerSize, boxSize.Y)
            esp.Box.BottomRight.Visible = true
            
            esp.Box.Left.From = boxPosition
            esp.Box.Left.To = boxPosition + Vector2.new(0, cornerSize)
            esp.Box.Left.Visible = true
            
            esp.Box.Right.From = boxPosition + Vector2.new(boxSize.X, 0)
            esp.Box.Right.To = boxPosition + Vector2.new(boxSize.X, cornerSize)
            esp.Box.Right.Visible = true
            
            esp.Box.Top.From = boxPosition + Vector2.new(0, boxSize.Y)
            esp.Box.Top.To = boxPosition + Vector2.new(0, boxSize.Y - cornerSize)
            esp.Box.Top.Visible = true
            
            esp.Box.Bottom.From = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
            esp.Box.Bottom.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y - cornerSize)
            esp.Box.Bottom.Visible = true
            
        else -- Full box
            esp.Box.Left.From = boxPosition
            esp.Box.Left.To = boxPosition + Vector2.new(0, boxSize.Y)
            esp.Box.Left.Visible = true
            
            esp.Box.Right.From = boxPosition + Vector2.new(boxSize.X, 0)
            esp.Box.Right.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
            esp.Box.Right.Visible = true
            
            esp.Box.Top.From = boxPosition
            esp.Box.Top.To = boxPosition + Vector2.new(boxSize.X, 0)
            esp.Box.Top.Visible = true
            
            esp.Box.Bottom.From = boxPosition + Vector2.new(0, boxSize.Y)
            esp.Box.Bottom.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
            esp.Box.Bottom.Visible = true
            
            esp.Box.TopLeft.Visible = false
            esp.Box.TopRight.Visible = false
            esp.Box.BottomLeft.Visible = false
            esp.Box.BottomRight.Visible = false
        end
        
        for _, obj in pairs(esp.Box) do
            if obj.Visible then
                obj.Color = color
                obj.Thickness = self.Settings.BoxThickness
            end
        end
    end
    
    if self.Settings.TracerESP then
        esp.Tracer.From = self:GetTracerOrigin()
        esp.Tracer.To = Vector2.new(pos.X, pos.Y)
        esp.Tracer.Color = color
        esp.Tracer.Visible = true
    else
        esp.Tracer.Visible = false
    end
    
    if self.Settings.HealthESP then
        local health = humanoid.Health
        local maxHealth = humanoid.MaxHealth
        local healthPercent = health/maxHealth
        
        local barHeight = screenSize * 0.8
        local barWidth = 4
        local barPos = Vector2.new(
            boxPosition.X - barWidth - 2,
            boxPosition.Y + (screenSize - barHeight)/2
        )
        
        esp.HealthBar.Outline.Size = Vector2.new(barWidth, barHeight)
        esp.HealthBar.Outline.Position = barPos
        esp.HealthBar.Outline.Visible = true
        
        esp.HealthBar.Fill.Size = Vector2.new(barWidth - 2, barHeight * healthPercent)
        esp.HealthBar.Fill.Position = Vector2.new(barPos.X + 1, barPos.Y + barHeight * (1-healthPercent))
        esp.HealthBar.Fill.Color = Color3.fromRGB(255 - (255 * healthPercent), 255 * healthPercent, 0)
        esp.HealthBar.Fill.Visible = true
        
        if self.Settings.HealthStyle == "Both" or self.Settings.HealthStyle == "Text" then
            esp.HealthBar.Text.Text = math.floor(health) .. self.Settings.HealthTextSuffix
            esp.HealthBar.Text.Position = Vector2.new(barPos.X + barWidth + 2, barPos.Y + barHeight/2)
            esp.HealthBar.Text.Visible = true
        else
            esp.HealthBar.Text.Visible = false
        end
    else
        for _, obj in pairs(esp.HealthBar) do
            obj.Visible = false
        end
    end
    
    if self.Settings.NameESP then
        esp.Info.Name.Text = player.DisplayName
        esp.Info.Name.Position = Vector2.new(
            boxPosition.X + boxWidth/2,
            boxPosition.Y - 20
        )
        esp.Info.Name.Color = color
        esp.Info.Name.Visible = true
    else
        esp.Info.Name.Visible = false
    end
    
    if self.Settings.Snaplines then
        esp.Snapline.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
        esp.Snapline.To = Vector2.new(pos.X, pos.Y)
        esp.Snapline.Color = color
        esp.Snapline.Visible = true
    else
        esp.Snapline.Visible = false
    end
    
    local highlight = self.Highlights[player]
    if highlight then
        if self.Settings.ChamsEnabled and character then
            highlight.Parent = character
            highlight.FillColor = self.Settings.ChamsFillColor
            highlight.OutlineColor = self.Settings.ChamsOutlineColor
            highlight.FillTransparency = self.Settings.ChamsTransparency
            highlight.OutlineTransparency = self.Settings.ChamsOutlineTransparency
            highlight.Enabled = true
        else
            highlight.Enabled = false
        end
    end
    
    if self.Settings.SkeletonESP then
        local function getBonePositions(character)
            if not character then return nil end
            
            local bones = {
                Head = character:FindFirstChild("Head"),
                UpperTorso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso"),
                LowerTorso = character:FindFirstChild("LowerTorso") or character:FindFirstChild("Torso"),
                RootPart = character:FindFirstChild("HumanoidRootPart"),
                
                -- Left Arm
                LeftUpperArm = character:FindFirstChild("LeftUpperArm") or character:FindFirstChild("Left Arm"),
                LeftLowerArm = character:FindFirstChild("LeftLowerArm") or character:FindFirstChild("Left Arm"),
                LeftHand = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm"),
                
                -- Right Arm
                RightUpperArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm"),
                RightLowerArm = character:FindFirstChild("RightLowerArm") or character:FindFirstChild("Right Arm"),
                RightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm"),
                
                -- Left Leg
                LeftUpperLeg = character:FindFirstChild("LeftUpperLeg") or character:FindFirstChild("Left Leg"),
                LeftLowerLeg = character:FindFirstChild("LeftLowerLeg") or character:FindFirstChild("Left Leg"),
                LeftFoot = character:FindFirstChild("LeftFoot") or character:FindFirstChild("Left Leg"),
                
                -- Right Leg
                RightUpperLeg = character:FindFirstChild("RightUpperLeg") or character:FindFirstChild("Right Leg"),
                RightLowerLeg = character:FindFirstChild("RightLowerLeg") or character:FindFirstChild("Right Leg"),
                RightFoot = character:FindFirstChild("RightFoot") or character:FindFirstChild("Right Leg")
            }
            
            -- Verify we have the minimum required bones
            if not (bones.Head and bones.UpperTorso) then return nil end
            
            return bones
        end
        
        local function drawBone(from, to, line)
            if not from or not to then 
                line.Visible = false
                return 
            end
            
            -- Get center positions of the parts
            local fromPos = (from.CFrame * CFrame.new(0, 0, 0)).Position
            local toPos = (to.CFrame * CFrame.new(0, 0, 0)).Position
            
            -- Convert to screen positions with proper depth check
            local fromScreen, fromVisible = Camera:WorldToViewportPoint(fromPos)
            local toScreen, toVisible = Camera:WorldToViewportPoint(toPos)
            
            -- Only show if both points are visible and in front of camera
            if not (fromVisible and toVisible) or fromScreen.Z < 0 or toScreen.Z < 0 then
                line.Visible = false
                return
            end
            
            -- Check if points are within screen bounds
            local screenBounds = Camera.ViewportSize
            if fromScreen.X < 0 or fromScreen.X > screenBounds.X or
               fromScreen.Y < 0 or fromScreen.Y > screenBounds.Y or
               toScreen.X < 0 or toScreen.X > screenBounds.X or
               toScreen.Y < 0 or toScreen.Y > screenBounds.Y then
                line.Visible = false
                return
            end
            
            -- Update line with screen positions
            line.From = Vector2.new(fromScreen.X, fromScreen.Y)
            line.To = Vector2.new(toScreen.X, toScreen.Y)
            line.Color = self.Settings.SkeletonColor
            line.Thickness = self.Settings.SkeletonThickness
            line.Transparency = self.Settings.SkeletonTransparency
            line.Visible = true
        end
        
        local bones = getBonePositions(character)
        if bones then
            local skeleton = self.Drawings.Skeleton[player]
            if skeleton then
                -- Spine & Head
                drawBone(bones.Head, bones.UpperTorso, skeleton.Head)
                drawBone(bones.UpperTorso, bones.LowerTorso, skeleton.UpperSpine)
                
                -- Left Arm Chain
                drawBone(bones.UpperTorso, bones.LeftUpperArm, skeleton.LeftShoulder)
                drawBone(bones.LeftUpperArm, bones.LeftLowerArm, skeleton.LeftUpperArm)
                drawBone(bones.LeftLowerArm, bones.LeftHand, skeleton.LeftLowerArm)
                
                -- Right Arm Chain
                drawBone(bones.UpperTorso, bones.RightUpperArm, skeleton.RightShoulder)
                drawBone(bones.RightUpperArm, bones.RightLowerArm, skeleton.RightUpperArm)
                drawBone(bones.RightLowerArm, bones.RightHand, skeleton.RightLowerArm)
                
                -- Left Leg Chain
                drawBone(bones.LowerTorso, bones.LeftUpperLeg, skeleton.LeftHip)
                drawBone(bones.LeftUpperLeg, bones.LeftLowerLeg, skeleton.LeftUpperLeg)
                drawBone(bones.LeftLowerLeg, bones.LeftFoot, skeleton.LeftLowerLeg)
                
                -- Right Leg Chain
                drawBone(bones.LowerTorso, bones.RightUpperLeg, skeleton.RightHip)
                drawBone(bones.RightUpperLeg, bones.RightLowerLeg, skeleton.RightUpperLeg)
                drawBone(bones.RightLowerLeg, bones.RightFoot, skeleton.RightLowerLeg)
            end
        end
    else
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
    end
end

-- Disable ESP
function ESP:DisableESP()
    for _, player in ipairs(Players:GetPlayers()) do
        local esp = self.Drawings.ESP[player]
        if esp then
            for _, obj in pairs(esp.Box) do obj.Visible = false end
            esp.Tracer.Visible = false
            for _, obj in pairs(esp.HealthBar) do obj.Visible = false end
            for _, obj in pairs(esp.Info) do obj.Visible = false end
            esp.Snapline.Visible = false
        end
        
        -- Also hide skeleton
        local skeleton = self.Drawings.Skeleton[player]
        if skeleton then
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
        end
    end
end

-- Cleanup ESP
function ESP:CleanupESP()
    for _, player in ipairs(Players:GetPlayers()) do
        self:RemoveESP(player)
    end
    self.Drawings.ESP = {}
    self.Drawings.Skeleton = {}
    self.Highlights = {}
end

-- Initialize ESP
function ESP:Init()
    -- Set up rainbow color updater
    task.spawn(function()
        while task.wait(0.1) do
            self.Colors.Rainbow = Color3.fromHSV(tick() * self.Settings.RainbowSpeed % 1, 1, 1)
        end
    end)
    
    -- Set up render step handler
    local lastUpdate = 0
    RunService.RenderStepped:Connect(function()
        if not self.Settings.Enabled then 
            self:DisableESP()
            return 
        end
        
        local currentTime = tick()
        if currentTime - lastUpdate >= self.Settings.RefreshRate then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    if not self.Drawings.ESP[player] then
                        self:CreateESP(player)
                    end
                    self:UpdateESP(player)
                end
            end
            lastUpdate = currentTime
        end
    end)
    
    -- Handle player joining/leaving
    Players.PlayerAdded:Connect(function(player)
        self:CreateESP(player)
    end)
    
    Players.PlayerRemoving:Connect(function(player)
        self:RemoveESP(player)
    end)
    
    -- Create ESP for existing players
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:CreateESP(player)
        end
    end
    
    return self
end

return ESP
