spawnBoats = { [454]=true, [484]=true }

local wasted_spawnpos = { -- Die Position wo man spawnt wenn man Tot ist, bzw sollte(An den  betten)
	{429.7522277832, 266.53988647461, 996.81188964844, 180},
	{425.37951660156, 267.01010131836, 996.81188964844, 180},
	{421.30526733398, 266.46600341797, 996.81188964844, 180},
	{417.05532836914, 266.48602294922, 996.81188964844, 180},
	{412.98022460938, 266.76217651367, 996.81188964844, 180},
	{408.82968139648, 266.78668212891, 996.81188964844, 180},
	{450.75161743164, 260.63830566406, 996.81188964844, 90},
	{450.458984375, 263.92669677734, 996.81188964844, 90},
	{450.48785400391, 257.06845092773, 996.81188964844, 90},
	{450.69598388672, 253.56640625, 996.81188964844, 90},
	{450.66326904297, 248.30767822266, 996.81188964844, 90},
}
-- 2103

local wasted_spawnint = 3
local wasted_spawndim = 0

function RemoteSpawnPlayer ( player )

	if isElement ( player ) then
		local pname = getPlayerName ( player )
		toggleAllControls ( player, true )
		showPlayerHudComponent ( player, "radar", true )
		if laGetElementData ( player, "spawnpos_x" ) == "wohnmobil" then
			local x, y, z, r = getTrailerSpawnKoords ( player )
			savespawn ( player, x, y, z, 0, 0, r )
		elseif tonumber ( laGetElementData ( player, "spawnpos_x" ) ) then
			laSetElementData ( player, "spawnpos_x", tonumber(laGetElementData ( player, "spawnpos_x" )) )
			laSetElementData ( player, "spawnpos_y", tonumber(laGetElementData ( player, "spawnpos_y" )) )
			savespawn ( player, 0, 0, 0, 0, 0, 0 )
			local sx, sy, sz = laGetElementData ( player, "spawnpos_x" ), laGetElementData ( player, "spawnpos_y" ),laGetElementData ( player, "spawnpos_z" )
			if isZivi(player) then
				if laGetElementData (player, "wasted") == true then
					local spawnpunkt = math.random(1, #wasted_spawnpos)
					local x, y, z = wasted_spawnpos[spawnpunkt][1], wasted_spawnpos[spawnpunkt][2], wasted_spawnpos[spawnpunkt][3]
					local rot = wasted_spawnpos[spawnpunkt][4]

					setElementPosition(player, x, y, z)
					setElementInterior(player, wasted_spawnint)
					setElementDimension(player, wasted_spawndim)
					setPedRotation(player, rot)
					laSetElementData (player, "wasted", false)
				else
					setElementPosition ( player, sx, sy, sz )
					setElementInterior ( player, laGetElementData ( player, "spawnint" ) )
					setElementDimension ( player, laGetElementData ( player, "spawndim" ) )
				end
			else
				setElementPosition ( player, sx, sy, sz )
				setElementInterior ( player, laGetElementData ( player, "spawnint" ) )
				setElementDimension ( player, laGetElementData ( player, "spawndim" ) )
			end
			if not isKeyBound ( player, "F2", "down", house_func ) then
				bindKey ( player, "F2", "down", house_func )
			end
		else
			local spawned = false
			for i = 1, 10 do
				local veh = _G["privVeh"..pname..i]
				if veh then
					local model = tonumber ( MySQL_GetString("vehicles", "Typ", "Slot LIKE '"..i.."' AND Besitzer LIKE '"..pname.."'") )
					if model then
						if spawnBoats[model] then
							both = pname..i
							sx, sy, sz = getElementPosition ( _G["privVeh"..both] )
							if laGetElementData ( player, "spawnpos_x" ) == "tropic" then
								savespawn ( player, sx, sy, sz+3.8, 0, 0, 0 )
								spawned = true
							elseif laGetElementData ( player, "spawnpos_x" ) == "marquis" then
								sx, sy, sz = getElementPosition ( _G["ObjYacht"..both] )
								savespawn ( player, sx, sy, sz+3, 0, 0, 0 )
								spawned = true
							end
							break
						end
					end
				end
			end
			if not spawned then
				savespawn ( player, -2458.288085, 774.354492, 35.171875, 0, 0, 0 )
			end
		end
		setPedSkin ( player, laGetElementData ( player, "skinid") )
	--	if isArmy ( player ) then
	--		armyClassSpawn ( player )
	--	end
		fadeCamera ( player, true )
		setCameraTarget( player, player )
		setPlayerWantedLevel ( player, tonumber(laGetElementData ( player, "wanteds")) )
		if tonumber(laGetElementData ( player, "jailtime" )) >= 1 then
			local rnd = math.floor(math.random ( 1, 4 ))
			if rnd == 1 then
				setElementPosition ( player, 215.61360168457, 110.61786651611, 998.66485595703 )
			elseif rnd == 2 then
				setElementPosition ( player, 219.60717773438, 110.39416503906, 998.66485595703 )
			elseif rnd == 3 then
				setElementPosition ( player, 223.60034179688, 110.17053222656, 998.66485595703 )
			else
				setElementPosition ( player, 227.34938049316, 110.19967651367, 998.66485595703 )
			end
			toggleControl ( player, "fire", false )
			setElementInterior ( player, 10 )
		end
		if tonumber ( laGetElementData ( player, "heaventime" ) ) >= 1 then
			setTimer ( revive, tonumber ( laGetElementData ( player, "heaventime" ) )*1000, 1, player )
			setElementInterior ( player, 0 )
			setCameraMatrix ( player, -2537.9006347656, 618.84533691406, 33.35578918457, -2616.6801757813, 619.22979736328, 39.688884735107 )
			toggleAllControls ( player, false )
			showPlayerHudComponent ( player, "radar", false )
			triggerClientEvent ( player, "showProgressBar", player )
		end
	end
	triggerClientEvent ( player, "camfix", getRootElement() )
	triggerClientEvent ( player, "showInfoText", getRootElement() )
	if isPremium(player) then
		setPedArmor(player, 100)
	end
end

function savespawn ( player, x, y, z, rx, ry, rz, highNoon )

	if highNoon then
		setElementDimension ( player, 0 )
	end
	triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
	spawnPlayer ( player, x, y, z, rz )
	setElementHealth ( player, 100 )
	triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
	setPedSkin ( player, laGetElementData ( player, "skinid") )
	fadeCamera ( player, true )
	setCameraTarget( player, player )
	if tonumber ( laGetElementData ( player, "fraktion" ) ) == 5 then
		local gun1 = 43
		local ammo1 = 20000
		giveWeapon ( player, gun1, ammo1, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), gun1, ammo1 )
	end
	setPlayerWantedLevel ( player, laGetElementData ( player, "wanteds" ) )
end



 
local NullPunktMarker = createMarker ( 212.184, 24.799, 2.571, "corona", 5, 255, 0, 0, 150 )


local function NullPunktMarker_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if laGetElementData ( hitElement, "curplayingtime" ) <= 2 then
			setElementPosition ( hitElement, -1968.679, 162.372, 27.688 )
			infobox ( hitElement, "\n\nDu bist nun am Bahnhof!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Dies ist nur als Notfall-Teleporter gedacht!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", NullPunktMarker, NullPunktMarker_func )