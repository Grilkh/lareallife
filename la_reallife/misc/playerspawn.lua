function onPlayerSpawn_func ()
if getElementData(source, "wereDead") == true then

else
	setPedSkin ( source, laGetElementData ( source, "skinid") )
	showPlayerHudComponent ( source, "radar", true )
	setTimer ( ShowWanteds_func, 250, 1, source )
if getElementData ( source, "sprache" ) == "" then
	triggerClientEvent ( source, "showLanguageOldGui", getRootElement() )
end
	if isEvil(source) then
		if laGetElementData ( source, "rang" ) == 0 then
			local weapon = 5
			local ammo = 1
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 1 then
			local weapon = 22
			local ammo = 170
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 2 then
			local weapon = 25
			local ammo = 50
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 3 then
			local weapon = 29
			local ammo = 90
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 4 then
			local weapon = 30
			local ammo = 100
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 5 then
			local weapon = 30
			local ammo = 150
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( source, "rang" ) == 6 then
			local weapon = 24
			local ammo = 42
			giveWeapon ( source, weapon, ammo, true )
			triggerClientEvent ( source, "sec_gun_give", getRootElement(), weapon, ammo )
		end
	setPedArmor ( source, 100 )
	triggerClientEvent ( source, "sec_armor_give", getRootElement(), 100 )
	end
end
end
addEventHandler("onPlayerSpawn", getRootElement(), onPlayerSpawn_func )

function ShowWanteds_func ( player )
	
	setPlayerWantedLevel ( player, tonumber(laGetElementData ( player, "wanteds" )) )
end