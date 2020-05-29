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

function CDOTA_Modifier_Lua:GetClass()
    return "CDOTA_Modifier_Lua"
end

function CAddonTemplateGameMode:InitGameMode()
	print( "For Beginners addon is loaded." )

	-- Remove Roshan Spawner
	local RoshanSpawner = Entities:FindByClassname(nil, "npc_dota_roshan_spawner")
	RoshanSpawner:Destroy()

	-- Remove Outpost
	local TopOutpost = Entities:FindByName(nil, "npc_dota_watch_tower_top")
	TopOutpost:Destroy()
	local BottomOutpost = Entities:FindByName(nil, "npc_dota_watch_tower_bottom")
	BottomOutpost:Destroy()
end
