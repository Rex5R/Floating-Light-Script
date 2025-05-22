local lightpoint = Instance.new("Part")

function waypointSettings(a1: Color3, a2: Vector3)
	lightpoint.Color = Color3.new(0.623529, 0.952941, 0.913725)
	lightpoint.Anchored = true
	lightpoint.Material = Enum.Material.Neon
	lightpoint.Size = Vector3.new(1, 1, 1)
	lightpoint.CanCollide = false
	lightpoint.Transparency = 0
end waypointSettings(Color3.new(0.623529, 0.952941, 0.913725), Vector3.new(1, 1, 1))

local spotlight = Instance.new("PointLight", lightpoint)

function lightSettings(a1: number, a2: Color3, a3: number, a4: boolean)
	spotlight.Brightness = a1
	spotlight.Color = a2
	spotlight.Range = a3
	spotlight.Shadows = a4
end lightSettings(2, Color3.fromRGB(103, 235, 255), 10, true)

task.spawn(function() while wait() do lightpoint.CFrame = lightpoint.CFrame * CFrame.Angles(0, math.rad(1), 0) end end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.E then
		print("Placed light .. " .. game.Players:GetNameFromUserIdAsync(game.Players.LocalPlayer.UserId))
		lightpoint.Parent = workspace
		game:GetService("TweenService"):Create(
			lightpoint,
			TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true),
			{Size = Vector3.new(2,2,2)}):Play()
		lightpoint.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(0, 5, 0)
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.F then print("Removed light .. " .. game.Players:GetNameFromUserIdAsync(game.Players.LocalPlayer.UserId)) lightpoint.Parent = game.ReplicatedStorage end end)
