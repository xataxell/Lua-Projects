local env = getgenv()
env.Autofarm = {
    ToolName = 'Plastic Shovel',
    Enabled = true
}

local function getplayer()
    return game:GetService('Players').LocalPlayer
end

local function getcharacter()
    return getplayer().Character or getplayer().CharacterAdded:Wait()
end

local function gethrp()
    return getcharacter():WaitForChild('HumanoidRootPart')
end

local function gettool()
    local ToolName = env.Autofarm.ToolName
    if getplayer().Backpack:FindFirstChild(ToolName) then
        tool = getplayer().Backpack[ToolName]
        tool.Parent = getcharacter()
        return tool
    elseif getcharacter():FindFirstChild(ToolName) then
        return getcharacter()[ToolName]
    end
end

local function getsnow()
    for i,v in next, workspace.Regions.Winterville.Tiles:GetChildren() do
        if v.Color == Color3.new(1,1,1) and v.Position.Y >= 8 then
            return v
        end
    end
end

while env.Autofarm.Enabled and task.wait(.01) do
    game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer('Shovel', gettool(), {[1] = getsnow()})
end
