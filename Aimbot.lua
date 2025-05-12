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
