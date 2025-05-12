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
