-- UI.lua
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

local modules = {
    "Fly", "Noclip", "Spider", "ESP", "Aimbot", "Speed", "Jump"
}

ScreenGui.Name = "UniversalHackGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Active = true
Frame.Draggable = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = Frame
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, v in pairs(Frame:GetChildren()) do
        if v:IsA("TextButton") and v.Name ~= "CloseButton" and v.Name ~= "MinimizeButton" then
            v.Visible = not minimized
        end
    end
end)

for i, name in ipairs(modules) do
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Frame
    btn.Text = name
    btn.Size = UDim2.new(0, 180, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 30 * i)
    btn.MouseButton1Click:Connect(function()
        _G[name.."Toggle"] = not _G[name.."Toggle"]
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuario/SeuRepo/main/"..name..".lua"))()
    end)
end
