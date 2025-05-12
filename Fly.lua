local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local flying = _G.FlyToggle
local speed = _G.Config.FlySpeed
local bodyVel = hrp:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
bodyVel.Name = "FlyVelocity"
bodyVel.MaxForce = Vector3.new(1e4, 1e4, 1e4)
bodyVel.Velocity = Vector3.zero
bodyVel.P = 1250

if flying then
    bodyVel.Parent = hrp
    local UIS = game:GetService("UserInputService")
    local conn
    conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not _G.FlyToggle then
            bodyVel:Destroy()
            conn:Disconnect()
        end
        local dir = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then dir += workspace.CurrentCamera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= workspace.CurrentCamera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= workspace.CurrentCamera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then dir += workspace.CurrentCamera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0,1,0) end
        if dir.Magnitude > 0 then
            bodyVel.Velocity = dir.Unit * speed
        else
            bodyVel.Velocity = Vector3.zero
        end
    end)
else
    if bodyVel then bodyVel:Destroy() end
end
