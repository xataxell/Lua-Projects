-- No afk text
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method, args = getnamecallmethod(), {...}
    if method == "FireServer" and self.Name == "afk" then
        args[1] = false
        return oldNamecall(self, unpack(args))
    end
    return oldNamecall(self, ...)
end)

-- Always perfect / 100% cast
local oldNamecall2
oldNamecall2 = hookmetamethod(game, "__namecall", function(self, ...)
    local method, args = getnamecallmethod(), {...}
    if method == "FireServer" and self.Name == "cast" then
        args[1] = 100
        return oldNamecall2(self, unpack(args))
    end
    return oldNamecall2(self, ...)
end)

-- Always perfect catch
local oldNamecall3
oldNamecall3 = hookmetamethod(game, "__namecall", function(self, ...)
    local method, args = getnamecallmethod(), {...}
    if method == "FireServer" and self.Name == "reelfinished" then
        args[1] = 100
        args[2] = true
        return oldNamecall3(self, unpack(args))
    end
    return oldNamecall3(self, ...)
end)

local position = nil
local cframe = nil
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        -- Instant finish
        if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') and game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').values.lure.Value == 100 then
            task.wait(.5)
            game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
        end

        -- Auto Fish
        if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') and game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').values.lure.Value < 0.000000000001 then
            game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').events.cast:FireServer(100, 1)
            if position == nil or cframe == nil then
                position = game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                cframe = game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            end
        elseif game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') and game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').values.lure.Value > 0.000000000001 then
            if position and cframe and (game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - position).Magnitude > 0.1 then
                game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position = position
                game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = cframe
            end
        elseif not game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') then
            position = nil
            cframe = nil
        end

        -- Auto shake
        if game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('shakeui') and game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('shakeui'):FindFirstChild('safezone') and game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('shakeui'):FindFirstChild('safezone'):FindFirstChild('button') then
            game:GetService('GuiService').SelectedObject = game:GetService('Players').LocalPlayer.PlayerGui.shakeui.safezone.button
            game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            task.wait(.1)
            game:GetService('GuiService').SelectedObject = nil
        end
    end)
end)
