carslotUpgradePrices = { [3]=50, [5]=60, [7]=75 }

function bonusLoad ( player )

	-- local pname = getPlayerName ( player )
	-- if not MySQL_GetString("bonustable", "Name", "Name LIKE '"..pname.."'") then
	-- 	local result = mysql_query(handler, "INSERT INTO bonustable (Name, Lungenvolumen, Muskeln, Kondition, Boxen, KungFu, Streetfighting, CurStyle, PistolenSkill, DeagleSkill, ShotgunSkill, AssaultSkill) VALUES ('"..pname.."', 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none' )")
	-- 	if( not result) then
	-- 		outputDebugString("Error executing the query: ("		.. mysql_errno(handler) .. ") " .. mysql_error(handler))
	-- 	else
	-- 		mysql_free_result(result)
	-- 	end
	-- end
	
	-- local dsatz
	-- local result = mysql_query ( handler, "SELECT * from bonustable WHERE Name LIKE '"..pname.."'" )
	-- if result then
	-- 	if ( mysql_num_rows ( result ) > 0 ) then
	-- 		dsatz = mysql_fetch_assoc ( result )
	-- 		mysql_free_result ( result )
	-- 	end
	-- end

	local pname = getPlayerName(player)
	if not MySQL_GetString("bonustable", "Name", "Name LIKE '"..pname.."'") then
		local result = dbQuery(handler, "INSERT INTO bonustable (Name, Lungenvolumen, Muskeln, Kondition, Boxen, KungFu, Streetfighting, CurStyle, PistolenSkill, DeagleSkill, ShotgunSkill, AssaultSkill) VALUES ('"..pname.."', 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none')")
		if not result then
			outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		else
			dbFree(result)
		end
	end

	local dsatz
	local result = dbQuery(handler, "SELECT * FROM bonustable WHERE Name LIKE '"..pname.."'")
	if result then
		local re, num_rows = dbPoll(result, -1)
        if re and num_rows > 0 then
            dsatz = re[1]
			dbFree(result)
        else
            dbFree(result)
            return false
        end
	end
	
	local Lungenvolumen = dsatz["Lungenvolumen"]
	laSetElementData ( player, "lungenvol", Lungenvolumen )
	if Lungenvolumen ~= "none" then
		setPedStat ( player, 225, 500 )
	end
	local Muskeln = dsatz["Muskeln"]
	laSetElementData ( player, "muscle", Muskeln )
	if Muskeln ~= "none" then
		setPedStat ( player, 23, 500 )
	end
	local Kondition = dsatz["Kondition"]
	laSetElementData ( player, "stamina", Kondition )
	if Kondition ~= "none" then
		setPedStat ( player, 22, 500 )
	end
	local PistolenSkill = dsatz["PistolenSkill"]
	laSetElementData ( player, "pistolskill", PistolenSkill )
	if PistolenSkill == "pro" then
		setPedStat ( player, 69, 950 )
	elseif PistolenSkill == "hitman" then
		setPedStat ( player, 69, 1000 )
	end
	local SilenceSkill = dsatz["SilenceSkill"]
	laSetElementData ( player, "silenceskill", SilenceSkill )
	if SilenceSkill == "pro" then
		setPedStat ( player, 70, 950 )
	elseif SilenceSkill == "hitman" then
		setPedStat ( player, 70, 1000 )
	end
	local DeagleSkill = dsatz["DeagleSkill"]
	laSetElementData ( player, "deagleskill", DeagleSkill )
	if DeagleSkill == "pro" then
		setPedStat ( player, 71, 950 )
	elseif DeagleSkill == "hitman" then
		setPedStat ( player, 71, 1000 )
	end
	local ShotgunSkill = dsatz["ShotgunSkill"]
	laSetElementData ( player, "shotgunskill", ShotgunSkill )
	if ShotgunSkill == "pro" then
		setPedStat ( player, 72, 950 )
	--	setPedStat ( player, 73, 950 )
	--	setPedStat ( player, 74, 950 )
	elseif ShotgunSkill == "hitman" then
		setPedStat ( player, 72, 999 )
	--	setPedStat ( player, 73, 999 )
	--	setPedStat ( player, 74, 999 )
	end
	local AssaultSkill = dsatz["AssaultSkill"]
	laSetElementData ( player, "assaultskill", AssaultSkill )
	if AssaultSkill == "pro" then
		setPedStat ( player, 78, 950 )
	elseif AssaultSkill == "hitman" then
		setPedStat ( player, 78, 999 )
	end
	local AKSkill = dsatz["AKSkill"]
	laSetElementData ( player, "akskill", AKSkill )
	if AKSkill == "pro" then
		setPedStat ( player, 77, 950 )
	elseif AKSkill == "hitman" then
		setPedStat ( player, 77, 999 )
	end
	local UziSkill = dsatz["UziSkill"]
	laSetElementData ( player, "uziskill", UziSkill )
	if UziSkill == "pro" then
		setPedStat ( player, 75, 950 )
	elseif UziSkill == "hitman" then
		setPedStat ( player, 75, 999 )
	end
	local MP5Skill = dsatz["MP5Skills"]
	laSetElementData ( player, "mp5skill", MP5Skill )
	if MP5Skill == "pro" then
		setPedStat ( player, 76, 950 )
	elseif MP5Skill == "hitman" then
		setPedStat ( player, 76, 999 )
	end
	
	laSetElementData ( player, "boxen", dsatz["Boxen"] )
	laSetElementData ( player, "kungfu", dsatz["KungFu"] )
	laSetElementData ( player, "streetfighting", dsatz["Streetfighting"] )
	setPedFightingStyle ( player, tonumber ( dsatz["CurStyle"] ) )
	laSetElementData ( player, "vortex", dsatz["Vortex"] )
	laSetElementData ( player, "quad", dsatz["Quad"] )
	laSetElementData ( player, "carslotupgrade", dsatz["CarslotUpgrades"] )
	laSetElementData ( player, "bonusskin1", dsatz["BonusSkin1"] )
	
	dsatz = nil
end

function bonusSave ( player )

	
end

function setMaximumCarsForPlayer ( player )

	local pname = getPlayerName ( player )
	
	laSetElementData ( player, "maxcars", 10 )
end

function bonusBuy_func ( player, bonus )

	if player == client then
		local pname = getPlayerName ( player )
		local bonuspoints = tonumber ( laGetElementData ( player, "bonuspoints" ) )
		if bonus == " Lungenvolumen" then
			if laGetElementData ( player, "lungenvol" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 225, 500 )
					laSetElementData ( player, "lungenvol", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					MySQL_SetString("bonustable", "Lungenvolumen", laGetElementData ( player, "lungenvol" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Muskeln" then
			if laGetElementData ( player, "muscle" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 40 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 23, 500 )
					laSetElementData ( player, "muscle", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 40 )
					MySQL_SetString("bonustable", "Muskeln", laGetElementData ( player, "muscle" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Kondition" then
			if laGetElementData ( player, "stamina" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 22, 500 )
					laSetElementData ( player, "stamina", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					MySQL_SetString("bonustable", "Kondition", laGetElementData ( player, "stamina" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Boxen" then
			if laGetElementData ( player, "boxen" ) ~= "none" then
				setPedFightingStyle ( player, 5 )
				outputChatBox ( "Aktueller Stil: Boxen", player, 175, 175, 20 )
				MySQL_SetString("bonustable", "CurStyle", "5", "Name LIKE '"..pname.."'")
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					laSetElementData ( player, "boxen", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					MySQL_SetString("bonustable", "Boxen", laGetElementData ( player, "boxen" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Kung-Fu" then
			if laGetElementData ( player, "kungfu" ) ~= "none" then
				setPedFightingStyle ( player, 6 )
				outputChatBox ( "Aktueller Stil: Kung-Fu", player, 175, 175, 20 )
				MySQL_SetString("bonustable", "CurStyle", "6", "Name LIKE '"..pname.."'")
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					laSetElementData ( player, "kungfu", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					MySQL_SetString("bonustable", "KungFu", laGetElementData ( player, "kungfu" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Streetfighting" then
			if laGetElementData ( player, "streetfighting" ) ~= "none" then
				setPedFightingStyle ( player, 7 )
				outputChatBox ( "Aktueller Stil: Streetfighting", player, 175, 175, 20 )
				MySQL_SetString("bonustable", "CurStyle", "7", "Name LIKE '"..pname.."'")
			else
				if bonuspoints >= 40 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					laSetElementData ( player, "streetfighting", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 40 )
					MySQL_SetString("bonustable", "Streetfighting", laGetElementData ( player, "streetfighting" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Pistole" then
			if laGetElementData ( player, "pistolskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 20 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 69, 900 )
					setPedStat ( player, 70, 999 )
					laSetElementData ( player, "pistolskill", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 20 )
					MySQL_SetString("bonustable", "PistolenSkill", laGetElementData ( player, "pistolskill" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Deagle" then
			if laGetElementData ( player, "deagleskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 71, 999 )
					laSetElementData ( player, "deagleskill", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					MySQL_SetString("bonustable", "DeagleSkill", laGetElementData ( player, "deagleskill" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Sturmgewehr" then
			if laGetElementData ( player, "assaultskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 77, 999 )
					setPedStat ( player, 78, 999 )
					laSetElementData ( player, "assaultskill", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					MySQL_SetString("bonustable", "AssaultSkill", laGetElementData ( player, "assaultskill" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Schrotflinten" then
			if laGetElementData ( player, "shotgunskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 20 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 72, 999 )
					setPedStat ( player, 74, 999 )
					laSetElementData ( player, "shotgunskill", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 20 )
					MySQL_SetString("bonustable", "ShotgunSkill", laGetElementData ( player, "shotgunskill" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " MP5" then
			if laGetElementData ( player, "mp5skill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 76, 999 )
					laSetElementData ( player, "mp5skill", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					MySQL_SetString("bonustable", "MP5Skills", laGetElementData ( player, "mp5skill" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Vortex" then
			if laGetElementData ( player, "vortex" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst das Vortex nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					laSetElementData ( player, "vortex", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					MySQL_SetString("bonustable", "Vortex", laGetElementData ( player, "vortex" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Quad" then
			if laGetElementData ( player, "quad" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst das Quad nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					laSetElementData ( player, "quad", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					MySQL_SetString("bonustable", "Quad", laGetElementData ( player, "quad" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Leichenwagen" then
			if laGetElementData ( player, "romero" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 50 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst den Leichenwagen nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					laSetElementData ( player, "romero", 1 )
					laSetElementData ( player, "bonuspoints", bonuspoints - 50 )
					MySQL_SetString("bonustable", "Leichenwagen", laGetElementData ( player, "romero" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Skimmer" then
			if laGetElementData ( player, "skimmer" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 50 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst den Skimmer nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					laSetElementData ( player, "skimmer", 1 )
					laSetElementData ( player, "bonuspoints", bonuspoints - 50 )
					MySQL_SetString("bonustable", "Skimmer", laGetElementData ( player, "skimmer" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Fahrzeugslots" then
			if laGetElementData ( player, "carslotupgrade3" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				local points = laGetElementData ( player, "bonuspoints" )
				if laGetElementData ( player, "carslotupgrade" ) == "none" then
					if points >= 50 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 5 Fahrzeuge besitzen.", player, 0, 125, 0 )
						laSetElementData ( player, "carslotupgrade", "buyed" )
						laSetElementData ( player, "bonuspoints", bonuspoints - 50 )
						MySQL_SetString("bonustable", "CarslotUpgrades", "buyed", "Name LIKE '"..pname.."'")
						laSetElementData ( player, "maxcars", 5 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				elseif laGetElementData ( player, "carslotupgrade2" ) == 0 then
					if points >= 60 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 7 Fahrzeuge besitzen.", player, 0, 125, 0 )
						laSetElementData ( player, "carslotupgrade2", 1 )
						laSetElementData ( player, "bonuspoints", bonuspoints - 60 )
						MySQL_SetString("bonustable", "CarslotUpdate2", 1, "Name LIKE '"..pname.."'")
						laSetElementData ( player, "maxcars", 7 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				elseif laGetElementData ( player, "carslotupgrade3" ) == 0 then
					if points >= 75 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 10 Fahrzeuge besitzen.", player, 0, 125, 0 )
						laSetElementData ( player, "carslotupgrade3", 1 )
						laSetElementData ( player, "bonuspoints", bonuspoints - 75 )
						MySQL_SetString("bonustable", "CarslotUpdate3", 1, "Name LIKE '"..pname.."'")
						laSetElementData ( player, "maxcars", 10 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				end
				triggerClientEvent ( player, "refreshBonus", player )
			end
		elseif bonus == " Cluckin Bell" then
			if laGetElementData ( player, "bonusskin1" ) ~= "none" then
				if not getPedOccupiedVehicle ( player ) then
					setElementModel ( player, 167 )
					laSetElementData ( player, "skinid", 167 )
				else
					outputChatBox ( "Du kannst deinen Skin nicht in Fahrzeugen verwenden!", player, 125, 0, 0 )
				end
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Skin gekauft! Wähle ihn jetzt aus, um ihn zu aktivieren!", player, 0, 125, 0 )
					laSetElementData ( player, "bonusskin1", "buyed" )
					laSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					MySQL_SetString("bonustable", "BonusSkin1", laGetElementData ( player, "bonusskin1" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Notebook" then
			if laGetElementData ( player, "fruitNotebook" ) >= 1 then
				outputChatBox ( "Du hast dein Notebook bereits! Wähle es im Inventar aus!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast dein Notebook gekauft und kannst es jetzt im Inventar verwenden!", player, 0, 125, 0 )
					laSetElementData ( player, "fruitNotebook", 1 )
					laSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					MySQL_SetString("inventar", "FruitNotebook", laGetElementData ( player, "fruitNotebook" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Spielekonsole" then
			if laGetElementData ( player, "gameboy" ) >= 1 then
				ouputChatBox ( "Du hast bereits einen Gameboy!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					laSetElementData ( player, "gameboy", 1 )
					outputChatBox ( "Du hast dir eine Spielekonsole gekauft und kannst sie nun im Inventar verwenden!", player, 0, 125, 0 )
					laSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					MySQL_SetString("inventar", "Gameboy", "1", "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		end
		MySQL_SetString("userdata", "Bonuspunkte", laGetElementData ( player, "bonuspoints" ), "Name LIKE '"..pname.."'")
	end
end
addEvent ( "bonusBuy", true )
addEventHandler ( "bonusBuy", getRootElement(), bonusBuy_func )

setWeaponProperty(28, "pro", "flags", 0x000800)
setWeaponProperty(28, "pro", "flags", 0x000002)
setWeaponProperty(28, "pro", "maximum_clip_ammo", 100)


--[[setWeaponProperty(24, "pro", "flags", 0x000800)
setWeaponProperty(24, "pro", "flags", 0x000002)
setWeaponProperty(24, "pro", "maximum_clip_ammo", 14)]]