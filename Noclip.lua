local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local noclip = _G.NoclipToggle

if noclip then
    local conn
    conn = game:GetService("RunService").Stepped:Connect(function()
        if not _G.NoclipToggle then
            conn:Disconnect()
        end
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
else
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end
