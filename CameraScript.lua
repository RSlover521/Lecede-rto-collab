local camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer

camera.CameraType = Enum.CameraType.Scriptable

local targetDistance = 0
local cameraDistance = -10
local cameraDirection = Vector3.new(0, -0.2, -6)

local currentTarget = cameraDirection * targetDistance
local currentPosition = cameraDirection * cameraDistance

-- Horizontal smoothing factor (X axis only)
local xSmooth = 0.08  -- lower = smoother / more lag
-- Vertical & forward smoothing factor
local yzSmooth = 0.2  -- keeps camera responsive in Y/Z

game:GetService("RunService").RenderStepped:Connect(function()
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local torso = character.HumanoidRootPart

		-- target camera positions
		local desiredPos = Vector3.new(torso.Position.X, torso.Position.Y + 10, torso.Position.Z - 20) + currentPosition
		local desiredLook = Vector3.new(torso.Position.X, torso.Position.Y, torso.Position.Z - 10) + currentTarget

		-- break down into components
		local currentPos = camera.CFrame.Position

		local newX = currentPos.X + (desiredPos.X - currentPos.X) * xSmooth
		local newY = currentPos.Y + (desiredPos.Y - currentPos.Y) * yzSmooth
		local newZ = currentPos.Z + (desiredPos.Z - currentPos.Z) * yzSmooth

		local lookX = currentPos.X + (desiredLook.X - currentPos.X) * xSmooth
		local lookY = currentPos.Y + (desiredLook.Y - currentPos.Y) * yzSmooth
		local lookZ = currentPos.Z + (desiredLook.Z - currentPos.Z) * yzSmooth

		-- apply camera
		camera.CFrame = CFrame.new(Vector3.new(newX, newY, newZ), Vector3.new(lookX, lookY, lookZ))
	end
end)
