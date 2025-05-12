local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
_G.SpiderToggle = not _G.SpiderToggle
humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, _G.SpiderToggle)
