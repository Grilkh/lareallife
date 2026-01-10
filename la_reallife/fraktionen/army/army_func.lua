function armyClassSpawn ( player )

	if not isKeyBound ( player, "1", "down", tazer_func ) then
		bindKey ( player, "1", "down", tazer_func )
	end
	if laGetElementData ( player, "job" ) == "infanterie" then
		--M4
		giveWeapon ( player, 31, 250, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 31, 250 )
		-- 9mm
		local weapon = 22
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	elseif laGetElementData ( player, "job" ) == "pionier" then
		laSetElementData (player, "versorgungskits", 3 )
		--Shotgun
		giveWeapon ( player, 25, 25, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 25, 25 )
		--Schaufel
		giveWeapon ( player, 6, 1, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 6, 1 )
		--Granaten
		giveWeapon ( player, 16, 3, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 16, 3 )
		-- 9mm
		local weapon = 22		
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	elseif laGetElementData ( player, "job" ) == "marine" then
		--MP5
		giveWeapon ( player, 29, 150, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 29, 150 )
		-- 9mm
		local weapon = 22		
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	elseif laGetElementData ( player, "job" ) == "luftwaffe" then
		--Deagle
		giveWeapon ( player, 24, 42, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 24, 42 )	
		--Fallschirm
		giveWeapon ( player, 46, 3, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 46, 3 )
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	elseif laGetElementData ( player, "job" ) == "artillerie" then
		--Javelin
		giveWeapon ( player, 36, 3, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 36, 3 )
		-- 9mm
		local weapon = 22		
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	elseif laGetElementData ( player, "job" ) == "sniper" then
		--Sniper
		giveWeapon ( player, 34, 20, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 34, 20 )
		-- 9mm SD
		local weapon = 22		
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		local random = math.random(1,2)
		if random == 1 then
			--Nacht
			giveWeapon ( player, 44, 1, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), 44, 1 )
		else
			--Waerme
			giveWeapon ( player, 45, 1, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), 45, 1 )
		end
		if laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 179 )
		elseif laGetElementData ( player, "rang" ) == 5 then
			setElementModel ( player, 61 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			setElementModel ( player, 255 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 71 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 287 )
		else
			setElementModel ( player, 73 )
		end
	else
		setElementModel ( player, 312 )
		-- 9mm sd (Tazer)
		local weapon = 23
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
	setPedArmor ( player, 100 )
	triggerClientEvent ( player, "sec_armor_give", getRootElement(), 100 )
	--M4
	giveWeapon ( player, 31, 500, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), 31, 500 )
	-- Schlagstock
	local weapon = 3		
	local ammo = 1
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	if laGetElementData (player, "armyspecial") == true then
		--Traenengas
		giveWeapon ( player, 17, 5, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 17, 5 )
		--SPAZ-12
		giveWeapon ( player, 27, 100, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 27, 100 )
		setElementModel ( player, 285 )
	end
end

explosiveCount = 0


function giveammo_func (player, cmd, target)
	if laGetElementData ( player, "job" ) == "pionier" and isArmy ( player ) then
		local tplayer = getPlayerFromName(target)
		if tplayer then
			if isArmy(tplayer) then
				local versorgungskits = laGetElementData (player, "versorgungskits")
				if versorgungskits >= 1 then
					giveWeapon ( tplayer, 31, 200, true )
					triggerClientEvent ( tplayer, "sec_gun_give", getRootElement(), 31, 200 )		
					giveWeapon ( tplayer, 22, ammo, 180 )
					triggerClientEvent ( tplayer, "sec_gun_give", getRootElement(), 22, 180 )
					laSetElementData (player, "versorgungskits", versorgungskits - 1 )
					outputChatBox ( "Du hast "..target.." neu ausgerüstet!", player, 0, 150, 0 )
					outputChatBox ( "Du wurdest von "..getPlayerName(player).." neu ausgerüstet!", tplayer, 0, 150, 0 )
				else
					outputChatBox ( "Du hast keine Versorgungskits mehr!", player, 150, 0, 0 )
				end
			end
		end
	end
end
addCommandHandler ( "giveammo", giveammo_func)


function explosive_func ( player )
	if laGetElementData ( player, "job" ) == "pionier" and isArmy ( player ) then
		if not laGetElementData ( player, "expTimer" ) then
			laSetElementData ( player, "expTimer", true )
			setTimer ( laSetElementData, 30000, 1, player, "expTimer", false )
			local x, y, z = getElementPosition ( player )
			local z = z - 0.73
			local x = x + 0.3
			local y = y + 0.3
			_G["explosive"..explosiveCount] = createObject ( 1654, x, y, z )
			setTimer ( explodeExplosive, 10000, 1, _G["explosive"..explosiveCount], player )
			outputChatBox ( "Sprengladung ist scharf, du hast 10 Sekunden!", player, 125, 0, 0 )
			explosiveCount = explosiveCount + 1
		else
			outputChatBox ( "Du kannst nur alle 30 Sekunden eine Sprengladung legen!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "explosive", explosive_func )

function explodeExplosive ( explosive, player )

	local x, y, z = getElementPosition ( explosive )
	createExplosion ( x, y, z, 0, player )
	destroyElement ( explosive )
end

permNames = {}
	permNames[1] = "Infanterie"
	permNames[2] = "Pionier"
	permNames[3] = "Marine"
	permNames[4] = "Luftwaffe"
	permNames[5] = "Artillerie"
	permNames[6] = "Ehrenmedaille"
	permNames[7] = "Luftwaffenorden"
	permNames[8] = "Verdienstkreuz"
	permNames[9] = "GWD-Note"
	permNames[10] = "Scharfschütze"
	
function setpermission_func ( player, cmd, target, perm, bool )
	
	local target = getPlayerFromName ( target )
	if target then
		if isArmy ( player ) then
			if laGetElementData ( player, "rang" ) > 4 then
				local perm = tonumber ( perm )
				if perm then
					if perm > 0 and perm < 11 then
						if perm == 9 then
							bool = tonumber ( bool )
							if bool then
								laSetElementData ( target, "gwd", bool )
								saveArmyPermissions ( target )
								outputChatBox ( "Du hast "..getPlayerName ( target ).." die GWD-Note "..bool.." gegeben!", player, 0, 125, 0 )
								outputChatBox ( getPlayerName ( player ).." hat dir die GWD-Note "..bool.." gegeben!", target, 0, 125, 0 )
							end
						else
							if bool == "1" then
								fix = "gegeben"
								laSetElementData ( target, "armyperm"..perm, 1 )
							else
								fix = "genommen"
								laSetElementData ( target, "job", "none" )
								laSetElementData ( target, "armyperm"..perm, 0 )
							end
							saveArmyPermissions ( target )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..permNames[perm].." "..fix..".", player, 0, 125, 0 )
							outputChatBox ( getPlayerName ( player ).." hat dir "..permNames[perm].." "..fix..".", target, 0, 125, 0 )
						end
					else
						outputChatBox ( "Gebrauch: /setpermission [Name] [Permission 1-10] [1 oder 0]", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Gebrauch: /setpermission [Name] [Permission 1-10] [1 oder 0]", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du bist nicht Leader der Army!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du bist kein Soldat!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende: /setpermission [Name] [Permission 1-10] [1 oder 0]", player, 125, 0, 0 )
		outputChatBox ( "GWD Note = 9 (Wert im Bereich 0 bis und mit 100!)", player, 125, 125, 0 )
		outputChatBox ( "Funktionen: 1 = Infanterie, 2 = Pioniere, 3 = Marine, 4 = Luftwaffe, 5 = Artillerie, 10 = Sniper", player, 125, 150, 0 )
		outputChatBox ( "Auszeichnungen: 6 = Ehrenmedaille, 7 = Luftwaffenorden, 8 = Verdienstkreuz", player, 150, 125, 0 )
	end
end
addCommandHandler ( "setpermission", setpermission_func )

function setspecial_func ( player, cmd, target )
	
	local target = getPlayerFromName ( target )
	if target then
		if isArmy ( player ) then
			if laGetElementData ( player, "rang" ) > 4 then
				if laGetElementData (target, "armyspecial") == false then
					laSetElementData ( target, "armyspecial", true )
					outputChatBox ( "Du hast "..getPlayerName ( target ).." als Special Forces eingestellt.", player, 0, 125, 0 )
				else
					laSetElementData ( target, "armyspecial", false )
					outputChatBox ( "Du hast "..getPlayerName ( target ).." die Rechte als Special Forces entfernt.", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du bist nicht Leader der Army!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du bist kein Soldat!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende: /setspecial [Name]", player, 125, 0, 0 )
	end
end
addCommandHandler ( "setspecial", setspecial_func )


function showClasses_func ( player, cmd, target )

	local targetplayer = getPlayerFromName ( target )
	if targetplayer then
		if isArmy ( player ) then
			if laGetElementData ( player, "rang" ) > 4 then
				if isArmy ( targetplayer ) then
					local pname = getPlayerName ( player )
					local classes = ""
					local auszeichnungen = ""
					local noten = ""
					if getElementData ( player, "armyperm1" ) == 1 then classes = classes.."Infanterie" end
					if getElementData ( player, "armyperm2" ) == 1 then classes = classes..", Pioniere" end
					if getElementData ( player, "armyperm3" ) == 1 then classes = classes..", Marine" end
					if getElementData ( player, "armyperm4" ) == 1 then classes = classes..", Luftwaffe" end
					if getElementData ( player, "armyperm5" ) == 1 then classes = classes..", Artillerie" end
					if getElementData ( player, "armyperm6" ) == 1 then auszeichnungen = auszeichnungen.."Ehrenmedaille" end
					if getElementData ( player, "armyperm7" ) == 1 then auszeichnungen = auszeichnungen..", Luftwaffenorden" end
					if getElementData ( player, "armyperm8" ) == 1 then auszeichnungen = auszeichnungen..", Verdienstkreuz" end
					--if getElementData ( player, "armyperm9" ) == 1 then classes = classes..", Unbekannt" end
					if getElementData ( player, "armyperm10" ) == 1 then classes = classes..", Scharfschützen" end
					local gwd = tonumber(getElementData ( player, "gwd" ))
					if gwd > 0 then 
						noten = noten.."GWD-Note "..gwd.."%"
					else
						noten = noten.."Keine GWD-Note"
					end
					outputChatBox ( "Vorhandene Permissions von "..target..": ", player, 200, 0, 200 )
					outputChatBox ( "Klassen: "..classes, player, 200, 200, 0 )
					outputChatBox ( "Auszeichnungen: "..auszeichnungen, player, 200, 200, 0 )
					outputChatBox ( "Noten: "..noten, player, 200, 200, 0 )
				else
					outputChatBox ( "Der Spieler ist kein Soldat!", player, 150, 0, 0 )
				end
			else
				outputChatBox ( "Du bist nicht befugt!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du bist kein Soldat!", player, 150, 0, 0 )
		end
	else
		outputChatBox ( "Ungültiger Spieler!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "showclasses", showClasses_func )
addEvent ( "showClasses", true )
addEventHandler ( "showClasses", getRootElement(), showClasses_func )


validClasses = {}
validClasses = { ["infanterie"]=true, ["pionier"]=true, ["marine"]=true, ["luftwaffe"]=true, ["artillerie"]=true, ["sniper"]=true }

function class_func ( player, cmd, class )

	if validClasses[class] then
		suc = false
		if laGetElementData ( player, "armyperm5" ) == 1 and class == "artillerie" then
			suc = true
		elseif laGetElementData ( player, "armyperm4" ) == 1 and class == "luftwaffe" then
			suc = true
		elseif laGetElementData ( player, "armyperm3" ) == 1 and class == "marine" then
			suc = true
		elseif laGetElementData ( player, "armyperm2" ) == 1 and class == "pionier" then
			suc = true
		elseif laGetElementData ( player, "armyperm1" ) == 1 and class == "infanterie" then
			suc = true
		elseif laGetElementData ( player, "armyperm10" ) == 1 and class == "sniper" then
			suc = true
		end
		if suc then
			laSetElementData ( player, "job", class )
			outputChatBox ( "Klasse geändert!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du darfst diese Klasse nicht benutzen!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Gebrauch: /class [infanterie|pionier|marine|luftwaffe|artillerie|sniper]", player, 125, 0, 0 )
	end
end
addCommandHandler ( "class", class_func )

function rearm_func ( player )

	if isArmy ( player ) then
		local veh = getPedOccupiedVehicle ( player )
		if veh then
			if getElementModel ( veh ) == 433 then
				takeAllWeapons ( player )
				armyClassSpawn ( player )
				return nil
			else
				outputChatBox ( "Du musst als Soldat in einem Barracks sitzen!", player, 125, 0, 0 )
			end
		end
	elseif isFBI ( player ) then
		local veh = getPedOccupiedVehicle ( player )
		if veh then
			if getElementModel ( veh ) == 428 then
				takeAllWeapons ( player )
				StateClassSpawn ( player )
				return nil
			else
				outputChatBox ( "Du musst als FBI-Agent in einem Securicar sitzen!", player, 125, 0, 0 )
			end
		end
	elseif isCop ( player ) then
		local veh = getPedOccupiedVehicle ( player )
		if veh then
			if getElementModel ( veh ) == 427 then
				takeAllWeapons ( player )
				StateClassSpawn ( player )
				return nil
			else
				outputChatBox ( "Du musst als Polizist in einem Enforcer sitzen!", player, 125, 0, 0 )
			end
		end	
	end
	outputChatBox ( "Du bist kein Staatsbeamter!", player, 125, 0, 0 )
end
addCommandHandler ( "rearm", rearm_func )

function StateClassSpawn ( player )
if isCop(player) then
	if laGetElementData ( player, "rang" ) == 0 then
		setElementModel ( player, 284 )
	elseif laGetElementData ( player, "rang" ) == 1 then
		setElementModel ( player, 282 )
	elseif laGetElementData ( player, "rang" ) == 2 then
		setElementModel ( player, 280 )
	elseif laGetElementData ( player, "rang" ) == 3 then
		setElementModel ( player, 281 )
	elseif laGetElementData ( player, "rang" ) == 4 then
		setElementModel ( player, math.random ( 265, 267 ) )
	elseif laGetElementData ( player, "rang" ) == 5 then
		local model = math.random( 1, 2 )
		if model == 1 then
			setElementModel ( player, 283 )
		else
			setElementModel ( player, 288 )
		end
	elseif laGetElementData ( player, "rang" ) == 6 then
		setElementModel ( player, 295 )
	end
	-- Schlagstock
	local weapon = 3		
	local ammo = 1
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	-- Kamera
	local weapon = 43		
	local ammo = 10
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	-- Deagle
	if laGetElementData ( player, "rang" ) >= 3 then
		local weapon = 24
		local ammo = 84
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	else -- 9mm
		local weapon = 22
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
	-- Schrotflinte
	if laGetElementData ( player, "rang" ) >= 1 then
		local weapon = 25
		local ammo = 100
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
		-- MP5
	if laGetElementData ( player, "rang" ) >= 4 then
		local weapon = 29
		local ammo = 360
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
elseif isFBI(player) then
	if laGetElementData ( player, "rang" ) == 0 then
		setElementModel ( player, 17 )
	elseif laGetElementData ( player, "rang" ) == 1 then
		setElementModel ( player, 286 )
	elseif laGetElementData ( player, "rang" ) == 2 then
		setElementModel ( player, 163 )
	elseif laGetElementData ( player, "rang" ) == 3 then
		setElementModel ( player, 164 )
	elseif laGetElementData ( player, "rang" ) == 4 then
		setElementModel ( player, 165 )
	elseif laGetElementData ( player, "rang" ) == 5 then
		setElementModel ( player, 166 )
	elseif laGetElementData ( player, "rang" ) == 6 then
		setElementModel ( player, 228 )
	end
	-- Schlagstock
	local weapon = 3		
	local ammo = 1
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	-- Eagle
	if laGetElementData ( player, "rang" ) >= 3 then
		local weapon = 24
		local ammo = 84
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	else -- 9mm
		local weapon = 22
		local ammo = 340
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
	-- Schrotflinte
	if laGetElementData ( player, "rang" ) >= 1 then
		local weapon = 25
		local ammo = 100
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
	-- MP5
	if laGetElementData ( player, "rang" ) >= 2 then
		local weapon = 29
		local ammo = 360
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
	-- AK47
	if laGetElementData ( player, "rang" ) >= 4 then
		local weapon = 30
		local ammo = 300
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	end
end
	local armor = 100
	setPedArmor ( player, armor )
	triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
	bindKey ( player, "1", "down", tazer_func )
	setPlayerNametagColor ( player, 0, 100, 0 )
end