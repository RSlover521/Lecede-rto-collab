-- liliput camera mode
local part = script.Parent
local Players = game:GetService("Players")
local Remote = game.ReplicatedStorage:WaitForChild("CameraDirectionEvent")

local NEW_DIRECTION = Vector3.new(0, -0.1, -4) -- target offset
local TWEEN_TIME = 3                        -- seconds

part.Touched:Connect(function(hit)
    local plr = Players:GetPlayerFromCharacter(hit.Parent)
    if plr then
        Remote:FireClient(plr, NEW_DIRECTION, TWEEN_TIME)
    end
end)