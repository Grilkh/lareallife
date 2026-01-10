function LizenzKaufen_func ( player, lizens )

	if player == client then
		local pname = getPlayerName ( player )
		if lizens == "planeb" then
			if tonumber(laGetElementData ( player, "planelicenseb" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 34950 then
					if laGetElementData ( player, "planelicensea" ) == 1 then
						setElementData ( player, "flugbtest", true )
						startDrivingSchoolPractise_func (player)
						triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
						--laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 34950 )
						--laSetElementData ( player, "planelicenseb", 1 )
						--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFlugschein\nTyp B erhalten!", 5000, 0, 255, 0 )
						--playSoundFrontEnd ( player, 40 )
						--takePlayerMoney ( player, 34950 )
						--MySQL_SetString("userdata", "FlugscheinKlasseB", laGetElementData ( player, "planelicenseb" ), "Name LIKE '"..pname.."'")
						--triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benötigst\nzuerst einen\nFlugschein Typ A!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Flugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "wschein" then
			if tonumber(laGetElementData ( player, "gunlicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 5000 then
					if tonumber(laGetElementData ( player, "playingtime" )) >= 180 then
						laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 5000 )
						laSetElementData ( player, "gunlicense", 1 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWaffenschein A erhalten!", 5000, 0, 255, 0 )
						playSoundFrontEnd ( player, 40 )
						takePlayerMoney ( player, 5000 )
						MySQL_SetString("userdata", "WaffenscheinA", laGetElementData ( player, "gunlicense" ), "Name LIKE '"..pname.."'")
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nErst ab 3 Stunden verfügbar!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Waffenschein A!", 5000, 255, 0, 0 )
			end
		elseif lizens == "wscheinB" then
			if tonumber(laGetElementData ( player, "gunlicense" )) == 1 then
				if tonumber(laGetElementData ( player, "gunlicenseB" )) == 0 then
					if tonumber(laGetElementData ( player, "money" )) >= 25000 then
						if tonumber(laGetElementData ( player, "playingtime" )) >= 600 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 25000 )
							laSetElementData ( player, "gunlicenseB", 1 )
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWaffenschein B erhalten!", 5000, 0, 255, 0 )
							playSoundFrontEnd ( player, 40 )
							takePlayerMoney ( player, 25000 )
							MySQL_SetString("userdata", "WaffenscheinB", laGetElementData ( player, "gunlicenseB" ), "Name LIKE '"..pname.."'")
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nErst ab 10 Stunden verfügbar!", 5000, 255, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Waffenschein B!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Waffenschein A!", 5000, 255, 0, 0 )
			end
		elseif lizens == "wscheinC" then
				if tonumber(laGetElementData ( player, "gunlicenseB" )) == 1 then
					if tonumber(laGetElementData ( player, "gunlicenseC" )) == 0 then
						if tonumber(laGetElementData ( player, "money" )) >= 50000 then
							if tonumber(laGetElementData ( player, "playingtime" )) >= 1500 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 50000 )
								laSetElementData ( player, "gunlicenseC", 1 )
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWaffenschein C erhalten!", 5000, 0, 255, 0 )
								playSoundFrontEnd ( player, 40 )
								takePlayerMoney ( player, 50000 )
								MySQL_SetString("userdata", "WaffenscheinC", laGetElementData ( player, "gunlicenseC" ), "Name LIKE '"..pname.."'")
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nErst ab 25 Stunden verfügbar!", 5000, 255, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 5000, 255, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Waffenschein C!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Waffenschein B!", 5000, 255, 0, 0 )
				end
		elseif lizens == "bike" then
			if tonumber(laGetElementData ( player, "bikelicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 450 then
					setElementData ( player, "biketest", true )
					startDrivingSchoolPractise_func (player)
					triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nMotorradführerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "planea" then
			if tonumber(laGetElementData ( player, "planelicensea" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 15000 then
					setElementData ( player, "flugatest", true )
					startDrivingSchoolPractise_func (player)
					triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nFlugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "fishing" then
			if tonumber(laGetElementData ( player, "fishinglicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 79 then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 79 )
					laSetElementData ( player, "fishinglicense", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nAngelschein\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					takePlayerMoney ( player, 79 )
					MySQL_SetString("userdata", "Angelschein", laGetElementData ( player, "fishinglicense" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Angelschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "car" then
			if tonumber(laGetElementData ( player, "carlicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 750 then
					triggerClientEvent ( player, "startFLicenseTest", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Führerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "perso" then
			if tonumber(laGetElementData ( player, "perso" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 40 then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 40 )
					laSetElementData ( player, "perso", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nPersonalausweis\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					takePlayerMoney ( player, 40 )
					MySQL_SetString("userdata", "Perso", laGetElementData ( player, "perso" ), "Name LIKE '"..pname.."'")
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nPersonalausweis!", 5000, 255, 0, 0 )
			end
		elseif lizens == "lkw" then
			if tonumber(laGetElementData ( player, "lkwlicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 450 then
					if laGetElementData ( player, "carlicense" ) == 1 then
						setElementData ( player, "lkwtest", true )
						startDrivingSchoolPractise_func (player)
						triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benötigst\nzuerst einen\nFührerschein!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nLKW-Führerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "heli" then
			if tonumber(laGetElementData ( player, "helilicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 20000 then
					setElementData ( player, "helitest", true )
					startDrivingSchoolPractise_func (player)
					triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits\neinen Helikopter-\nflugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "raft" then
			if tonumber(laGetElementData ( player, "segellicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 350 then
					if laGetElementData ( player, "motorbootlicense" ) == 1 then
						setElementData ( player, "segeltest", true )
						startDrivingSchoolPractise_func (player)
						triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benötigst\nzuerst einen\nMotorboot-\nführerschein!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Segelschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "motorboot" then
			if tonumber(laGetElementData ( player, "motorbootlicense" )) == 0 then
				if tonumber(laGetElementData ( player, "money" )) >= 400 then
					setElementData ( player, "schifftest", true )
					startDrivingSchoolPractise_func (player)
					triggerClientEvent (player, "hideFahrschuleWindow", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits\neinen Motorboot-\nführerschein!", 5000, 255, 0, 0 )
			end
		end
		checkAchievLicense ( player )
	end
end
addEvent ( "LizenzKaufen", true )
addEventHandler ( "LizenzKaufen", getRootElement(), LizenzKaufen_func )

function checkAchievLicense ( player )

	if tonumber ( laGetElementData ( player, "motorbootlicense" ) ) == 1 and tonumber ( laGetElementData ( player, "segellicense" ) ) == 1 and tonumber ( laGetElementData ( player, "helilicense" ) ) == 1 and tonumber ( laGetElementData ( player, "lkwlicense" ) ) == 1 and tonumber ( laGetElementData ( player, "lkwlicense" ) ) == 1 and tonumber ( laGetElementData ( player, "perso" ) )  == 1 and tonumber ( laGetElementData ( player, "carlicense" ) ) == 1 and tonumber ( laGetElementData ( player, "fishinglicense" ) ) == 1 and tonumber ( laGetElementData ( player, "planelicensea" ) ) == 1 and tonumber ( laGetElementData ( player, "planelicenseb" ) ) == 1 and tonumber ( laGetElementData ( player, "bikelicense" ) ) == 1 and tonumber ( laGetElementData ( player, "gunlicense" ) ) == 1 and laGetElementData ( player, "licenses_achiev" ) ~= "done" then
		if laGetElementData ( player, "licenses_achiev" ) ~= "done" then																						-- Achiev: Mr. License
			laSetElementData ( player, "licenses_achiev", "done" )																								-- Achiev: Mr. License
			triggerClientEvent ( player, "showAchievmentBox", player, " Mr. License", 40, 10000 )																-- Achiev: Mr. License
			laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 40 )												-- Achiev: Mr. License
			MySQL_SetString("achievments", "Lizensen", laGetElementData ( player, "licenses_achiev" ), "Name LIKE '"..getPlayerName(player).."'")				-- Achiev: Mr. License
		end	
	end
end