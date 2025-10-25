-- ServerScript inside the pad
local part = script.Parent
local Players = game:GetService("Players")
local remote = game.ReplicatedStorage:WaitForChild("SpeedBoostEvent")

local DEBOUNCE = false
local BOOST_TIME = 5

part.Touched:Connect(function(hit)
	if DEBOUNCE then return end
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		DEBOUNCE = true
		remote:FireClient(player, BOOST_TIME)
		task.delay(BOOST_TIME, function()
			DEBOUNCE = false
		end)
	end
end)
