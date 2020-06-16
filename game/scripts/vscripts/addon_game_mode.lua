
if CForBeginners == nil then
	CForBeginners = class({})
end

function Precache( context )

end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CForBeginners()
	GameRules.AddonTemplate:InitGameMode()
end

function CDOTA_Modifier_Lua:GetClass()
    return "CDOTA_Modifier_Lua"
end

function CForBeginners:InitGameMode()
	print( "For Beginners addon is loaded." )

	-- Spawn free Courier
	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled(true)

	-- All items can buy at respawn point
	GameRules:SetUseUniversalShopMode(true)

	-- Remove Roshan Spawner
	local RoshanSpawner = Entities:FindByClassname(nil, "npc_dota_roshan_spawner")
	RoshanSpawner:Destroy()

	-- Remove Outpost
	local TopOutpost = Entities:FindByName(nil, "npc_dota_watch_tower_top")
	TopOutpost:Destroy()
	local BottomOutpost = Entities:FindByName(nil, "npc_dota_watch_tower_bottom")
	BottomOutpost:Destroy()

	-- Remove Secret Shop
	local Shops = Entities:FindAllByClassname("trigger_shop")
	for _, Shop in ipairs(Shops) do
		local Origin = Shop:GetLocalOrigin()
		local Distance = Origin.x * Origin.x + Origin.y * Origin.y
		if Distance < 100000000 then
			Shop:Destroy()
			local Shopkeeper = Entities:FindByClassnameNearest("ent_dota_shop", Origin, 1024)
			Shopkeeper:Destroy()
		end
	end

	-- Remove Neutral Stash
	Entities:FindByName(nil, "radiant_neutral_item_stash"):Destroy()
	Entities:FindByName(nil, "dire_neutral_item_stash"):Destroy()

	-- Replace Neutral Spawner
	-- I gave up
end
