if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )

end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "For Beginners addon is loaded." )
	local hRoshanSpawner = Entities:FindByClassname(nil, "npc_dota_roshan_spawner")
	hRoshanSpawner:Destroy()
end
