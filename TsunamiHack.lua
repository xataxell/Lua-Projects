local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()
local Window = ImGui:CreateWindow({Title = "TsunamiHack for Breakwater Blitz 2008", Size = UDim2.fromOffset(650, 400), Position = UDim2.new(0.5, 0, 0, 70)})

local PointFarm = false
local TsunamiGodmode = false

local Misc = Window:CreateTab({Name = "Console", Visible = false})
local Console = Misc:Console({Text = "Console\n----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", ReadOnly = true, Border = true, Fill = true, RichText = true, Enabled = true,  AutoScroll = true, MaxLines = 99999999})
Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', 'Hack has been initialized')
Misc:Button({Text = "Pause Console", Callback = function(self) if Console.Enabled then Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(255, 0, 0)">[-]</font>', 'Console has been paused and new messages will not be sent or seen') end; local Paused = shared.Pause; Paused = not (Paused or false); shared.Pause = Paused; self.Text = Paused and "Paused" or "Pause"; Console.Enabled = not Paused if Console.Enabled then Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(0, 255, 0)">[+]</font>',  'Console has been unpaused and new messages will be sent and seen') end; end})

local Main = Window:CreateTab({Name = "Main", Visible = true})
Main:Checkbox({Label = "Point farm", Value = PointFarm, Callback = function(self, Value) PointFarm = Value; if PointFarm then Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(0, 255, 0)">[+]</font>', 'Point farm has been enabled') else Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(255, 0, 0)">[-]</font>', 'Point farm has been disabled') end end})
Main:Checkbox({Label = "Tsunami godmode", Value = TsunamiGodmode, Callback = function(self, Value) TsunamiGodmode = Value; if TsunamiGodmode then Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(0, 255, 0)">[+]</font>', 'Tsunami Godmode has been enabled') else Console:AppendText('<font color="rgb(237, 141, 7)">[TsunamiHack]</font>', '<font color="rgb(255, 0, 0)">[-]</font>', 'Tsunami Godmode has been disabled') end end})

spawn(function()
    while task.wait() do
        if PointFarm then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:FindFirstChild("Script") and v:FindFirstChildOfClass("TouchTransmitter") and v.Name ~= "Visor Giver" then 
                    v.CanCollide = false
                    v.Transparency = 1
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    v.Transparency = 1
                    v.CanCollide = false
                    task.wait()
                    v.CFrame = CFrame.new(-99, 50.5, 75)
                    v.Transparency = 0
                    v.CanCollide = true
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if TsunamiGodmode then
            if game.Workspace:FindFirstChild("Tsunami") and game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("DestructionPart") and game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("WakePart") and game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("TsunamiPart") then
                -- This doesn't even fucking work or do anything lmfao
                if game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("DestructionPart"):FindFirstChildOfClass("TouchTransmitter") then
                    game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("DestructionPart"):FindFirstChildOfClass("TouchTransmitter"):Destroy()
                end
                if game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("DestructionPart"):FindFirstChild("Script") then
                    game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("DestructionPart"):FindFirstChild("Script"):Destroy()
                end
                if game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("WakePart"):FindFirstChild("Script") then
                    game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("WakePart"):FindFirstChild("Script"):Destroy()
                end
                if game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("TsunamiPart"):FindFirstChild("Script") then
                    game.Workspace:FindFirstChild("Tsunami"):FindFirstChild("TsunamiPart"):FindFirstChild("Script"):Destroy()
                end
            end
        end
    end
end)
