-- Config.lua
_G.Config = {
    FlySpeed = 40,
    WalkSpeed = 30,
    JumpPower = 75,
    ESPColor = Color3.fromRGB(0, 255, 0),
    AimbotFOV = 200
}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local FOV = _G.Config.AimbotFOV

local function getClosest()
    local closest, minDist = nil, FOV
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Team ~= LocalPlayer.Team and p.Character and p.Character:FindFirstChild("Head") then
            local pos, onScreen = Camera:WorldToViewportPoint(p.Character.Head.Position)
            local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
            if onScreen and dist < minDist then
                minDist = dist
                closest = p.Character.Head
            end
        end
    end
    return closest
end

if _G.AimbotToggle then
    RunService.RenderStepped:Connect(function()
        if not _G.AimbotToggle then return end
        local target = getClosest()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end)
end
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower =
    _G.JumpToggle and _G.Config.JumpPower or 50
end 
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed =
    _G.SpeedToggle and _G.Config.WalkSpeed or 16
end
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local enabled = _G.ESPToggle

for _, p in pairs(players:GetPlayers()) do
    if p ~= localPlayer and enabled then
        local char = p.Character
        if char and not char:FindFirstChild("ESP_Highlight") then
            local hl = Instance.new("Highlight")
            hl.Name = "ESP_Highlight"
            hl.FillTransparency = 1
            hl.OutlineColor = _G.Config.ESPColor
            hl.OutlineTransparency = 0
            hl.Parent = char
        end
    elseif not enabled and p.Character then
        local hl = p.Character:FindFirstChild("ESP_Highlight")
        if hl then hl:Destroy() end
    end
end

