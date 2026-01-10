--[[function dmgZones ( attacker, weapon, bodypart, loss )
		armor = getPedArmor (source)
		health = getElementHealth (source)
		lossdubble =  math.floor(loss * 2)
		losshalfpast =  math.floor(loss * 1.5)
		losshalf =  math.floor(loss / 2)
		losshalfaway = math.floor(loss / 1.333333)
		
	if bodypart == 9 and getElementHealth ( source ) - loss < 0 then
		setTimer ( headlessPed, 500, 1, source )
	end
	if attacker and weapon and bodypart and loss then
		if ( weapon == 34 ) and bodypart == 9 then
			setPedHeadless ( source, true )
			killPed ( source, attacker, weapon, bodypart )
		end
	end
	--Faust--
	if weapon == 0 then
		if attacker then
			if getPedFightingStyle (attacker) == 4 then
				if health - loss <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health - loss )
				end
			elseif getPedFightingStyle (attacker) == 5 then
				if health - loss <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health - loss )
				end
			elseif getPedFightingStyle (attacker) == 6 then
				if health - loss <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health - loss )
				end	
			elseif getPedFightingStyle (attacker) == 7 then
				if health - losshalf <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health + losshalf )
				end
			elseif getPedFightingStyle (attacker) == 15 then
				if health - loss <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health - loss )
				end
			elseif getPedFightingStyle (attacker) == 16 then
				if health - loss <= 0 then
					killPed (source)
				else
					setElementHealth ( source, health - loss )
				end
			end
		end
	end
	if attacker then
		laSetElementData ( attacker, "lastcrime", "lalance" )
	end

	if isEvil(attacker) and isEvil(source) then
		if getElementData ( attacker, "isInGangArea") == true then
			for i=1, gangCount do
				if isRadarAreaFlashing ( _G["gangArea"..i]) then
					local target = getPlayerName(source)
					triggerClientEvent ( attacker, "DamageText_GW_Rendering", source, target, weapon, bodypart, loss)
					break					
				end
			end
		end
	end
end
addEventHandler ( "onPlayerDamage", getRootElement(), dmgZones )]]



function headlessPed ( player )

	if isPedDead ( player ) then
		setPedHeadless ( player, true )
	end
end


--9mm--25--
setWeaponProperty(22, "poor", "damage", 40)
setWeaponProperty(22, "std", "damage", 40)
setWeaponProperty(22, "pro", "damage", 40)

--9mmsd--40--
setWeaponProperty(23, "poor", "damage", 40)
setWeaponProperty(23, "std", "damage", 40)
setWeaponProperty(23, "pro", "damage", 40)

--Deagle--70--
setWeaponProperty(24, "poor", "damage", 70)
setWeaponProperty(24, "std", "damage", 70)
setWeaponProperty(24, "pro", "damage", 70)

--Shotgun--10--
setWeaponProperty(25, "poor", "damage", 15)
setWeaponProperty(25, "std", "damage", 15)
setWeaponProperty(25, "pro", "damage", 15)

--Lupara--10--
setWeaponProperty(26, "poor", "damage", 5)
setWeaponProperty(26, "std", "damage", 5)
setWeaponProperty(26, "pro", "damage", 5)

--SPAZ--15--
setWeaponProperty(27, "poor", "damage", 5)
setWeaponProperty(27, "std", "damage", 5)
setWeaponProperty(27, "pro", "damage", 5)

--UZI--20--
setWeaponProperty(28, "poor", "damage", 15)
setWeaponProperty(28, "std", "damage", 15)
setWeaponProperty(28, "pro", "damage", 15)

--MP5--25--
setWeaponProperty(29, "poor", "damage", 35)
setWeaponProperty(29, "std", "damage", 35)
setWeaponProperty(29, "pro", "damage", 35)

--AK47--30--
setWeaponProperty(30, "poor", "damage", 30)
setWeaponProperty(30, "std", "damage", 30)
setWeaponProperty(30, "std", "maximum_clip_ammo", 40)
setWeaponProperty(30, "pro", "damage", 30)
setWeaponProperty(30, "pro", "maximum_clip_ammo", 50)
local akrange = getWeaponProperty(30, "pro", "weapon_range")
outputChatBox("AK Reichweite: "..tostring(akrange))
local akaccuracy = getWeaponProperty(30, "pro", "accuracy")
outputChatBox("AK Genauigkeit: "..tostring(akaccuracy))
setWeaponProperty(30, "pro", "accuracy", 0.85)
local akbreakout = getWeaponProperty(30, "pro", "damage")
outputChatBox("AK Breakout: "..tostring(akbreakout))

--[[
function akaccuracy (player, cmd, amount)
local amount = tonumber(amount)
setWeaponProperty(30, "pro", "accuracy", amount)

end
addCommandHandler("akacc", akaccuracy)]]

--M4--31--
setWeaponProperty(31, "poor", "damage", 25)
setWeaponProperty(31, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(31, "std", "damage", 25)
setWeaponProperty(31, "std", "maximum_clip_ammo", 40)
setWeaponProperty(31, "pro", "damage", 25)
setWeaponProperty(31, "std", "maximum_clip_ammo", 50)
local m4range = getWeaponProperty(31, "pro", "weapon_range")
outputChatBox("M4 Reichweite: "..tostring(m4range))
local m4accuracy = getWeaponProperty(31, "pro", "accuracy")
outputChatBox("M4 Genauigkeit: "..tostring(m4accuracy))
local m4breakout = getWeaponProperty(31, "pro", "damage")
outputChatBox("M4 Breakout: "..tostring(m4breakout))

--TEC-9--20--
setWeaponProperty(32, "poor", "damage", 15)
setWeaponProperty(32, "std", "damage", 15)
setWeaponProperty(32, "pro", "damage", 15)

--Gewehr--75--
setWeaponProperty(33, "poor", "damage", 90)
setWeaponProperty(33, "std", "damage", 90)
setWeaponProperty(33, "pro", "damage", 90)

--Sniper--125--
setWeaponProperty(34, "poor", "damage", 115)
setWeaponProperty(34, "std", "damage", 115)
setWeaponProperty(34, "pro", "damage", 115)

--RPG--75--
setWeaponProperty(35, "poor", "damage", 50)
setWeaponProperty(35, "std", "damage", 50)
setWeaponProperty(35, "pro", "damage", 50)

--Javelin--75--
setWeaponProperty(36, "poor", "damage", 45)
setWeaponProperty(36, "std", "damage", 45)
setWeaponProperty(36, "pro", "damage", 45)

--Minigun--140--
setWeaponProperty(38, "poor", "damage", 5)
setWeaponProperty(38, "std", "damage", 5)
setWeaponProperty(38, "pro", "damage", 5)






-------------------------------
-- The "Damage" Script is a ---
----- Script by schotobi ------
----------- © - 2013 ----------
-------------------------------

local weaponDamages = {}
	weaponDamages[8] = 30
	
	weaponDamages[22] = 9
	weaponDamages[23] = 9
	weaponDamages[24] = 22.5
	
	weaponDamages[25] = 18
	weaponDamages[26] = 9
	weaponDamages[27] = 7.2
	
	weaponDamages[28] = 13.5
	weaponDamages[29] = 9
	weaponDamages[32] = 13.5
	
	weaponDamages[30] = 7.2
	weaponDamages[31] = 5.4
	
	weaponDamages[33] = 18
	weaponDamages[34] = 45
	
	weaponDamages[35] = 45
	weaponDamages[36] = 40.5
	
	weaponDamages[51] = 9
--auch in Client anpassen



function damageCalcServer_func ( attacker, weapon, bodypart, loss, player )
	if attacker and weapon and bodypart and loss then
		-- Spawnschutz
		if getElementType ( player ) == "player" then
			if weapon == 34 and bodypart == 9 then
				killPed ( player, attacker, weapon, bodypart )
			else
				local basicDMG = weaponDamages[weapon]
				local dontDealDamage = false
				
				if not dontDealDamage then
				
					if weapon == 0 then
					--outputChatBox("--")--DEBUG
					triggerClientEvent ( player, "init", player)
						if getPedFightingStyle ( attacker ) == 7 or getPedFightingStyle ( attacker ) == 15 or getPedFightingStyle ( attacker ) == 16 then
							loss = loss / 2
						end
					end
					local multiply = 1
					if bodypart == 3 or bodypart == 4 then
						multiply = 1.5
					elseif bodypart == 5 or bodypart == 6 then
						multiply = 0.8
					elseif bodypart == 7 or bodypart == 8 then
						multiply = 1.2
					elseif bodypart == 9 then
						multiply = 2
					end
					
					if ( weaponDamages[weapon] ) then
						damagePlayer ( player, basicDMG * multiply, attacker, weapon )
						local aval = basicDMG * multiply
							if isEvil(attacker) and isEvil(player) then
								if getElementData ( attacker, "isInGangArea") == true then
									for i=1, gangCount do
										if isRadarAreaFlashing ( _G["gangArea"..i]) then
											local target = getPlayerName(player)
											triggerClientEvent ( attacker, "DamageText_GW_Rendering", player, target, weapon, bodypart, loss)
											break					
										end
									end
								end
							end
					else
						damagePlayer ( player, loss, attacker, weapon )
					end					
				end
			end
		end
	end
end
addEvent ( "damageCalcServer", true )
addEventHandler ( "damageCalcServer", getRootElement(), damageCalcServer_func )

--[[
    3: Torso
    4: Ass
    5: Left Arm
    6: Right Arm
    7: Left Leg
    8: Right leg
    9: Head 
]]

function damagePlayer ( player, amount, damager, weapon )

	if isElement ( player ) then
		local armor = getPedArmor ( player )
		local health = getElementHealth ( player )
		if armor > 0 then
			if armor >= amount then
				setPedArmor ( player, armor - amount )
			else
				setPedArmor ( player, 0 )
				amount = math.abs ( armor - amount )
				setElementHealth ( player, health - amount )
				if getElementHealth ( player ) - amount <= 0 then
					killPed ( player, damager, weapon, 3, false )
				end
			end
		else
			if getElementHealth ( player ) - amount <= 0 then
				killPed ( player, damager, weapon, 3, false )
			end
			setElementHealth ( player, health - amount )
			if weapon ~= 17 then
				triggerClientEvent ( player, "init", player)
			end
		end
	end
end


function transferBloodFunc(player)
	--outputChatBox(source)--DEBUG
	--outputChatBox(getPlayerName(source))--DEBUG
	triggerClientEvent ( source, "init", source)
end
addEvent ( "transferBlood", true )
addEventHandler ( "transferBlood", getRootElement(), transferBloodFunc )