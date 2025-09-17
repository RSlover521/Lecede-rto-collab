local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()
local runService = game:GetService("RunService")

local moveSpeed = 0.15
local forwardSpeed = 1

runService.RenderStepped:Connect(function(dt)
	if hrp then
		-- horizontal movement
		local screenX = mouse.X / workspace.CurrentCamera.ViewportSize.X
		local targetX = (screenX - 0.5) * 40 -- adjust width of movement space
		local newPos = hrp.Position:Lerp(Vector3.new(targetX, hrp.Position.Y, hrp.Position.Z - (forwardSpeed * 120 * dt)), moveSpeed)
		hrp.CFrame = CFrame.new(newPos, newPos + workspace.CurrentCamera.CFrame.LookVector)
	end
end)

