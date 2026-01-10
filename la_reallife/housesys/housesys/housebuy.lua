function housePickup ( player )

	if getElementModel ( source ) == 1273 or getElementModel ( source ) == 1272 then
		if laGetElementData ( source, "owner" ) == "none" then					--Frei
			preis = laGetElementData ( source, "preis" )
			mintime = laGetElementData (source, "mintime")
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Haus steht\nzum Verkauf für\n"..preis..",\nMindestspielzeit:\n"..mintime.." Stunden!", 5000, 0, 125, 0 )
			outputChatBox ( "Verwende /buyhouse [bank/bar] um das Haus mit Bargeld/Bankkonto zu kaufen (per Bank 2% mehr Kosten!)", player, 0, 125, 0 )
			local x, y, z = getElementPosition ( source )
			laSetElementData ( player, "housex", x )
			laSetElementData ( player, "housey", y )
			laSetElementData ( player, "housez", z )
			laSetElementData ( player, "house", source )
		elseif laGetElementData ( source, "owner" ) ~= "none" then				-- Verkauft
			mintime = laGetElementData (source, "mintime")
			fix = ""
			if laGetElementData ( source, "miete" ) > 0 then
				fix = "Miete: "..laGetElementData ( source, "miete" ).." $, /rent\nzum mieten!"
			else
				fix = ""
			end
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Haus gehört:\n"..laGetElementData(source,"owner")..",\nMindestspielzeit:\n"..mintime.." Stunden!\n"..fix, 7500, 200, 200, 0 )
			local x, y, z = getElementPosition ( source )
			laSetElementData ( player, "housex", x )
			laSetElementData ( player, "housey", y )
			laSetElementData ( player, "housez", z )
			laSetElementData ( player, "house", source )
		end
	end
end
addEventHandler ( "onPickupHit", getRootElement(), housePickup )

function buyhouse_func ( player, cmd, zahlart )

	if zahlart == "bank" or zahlart == "bar" then
		if laGetElementData ( player, "housex" ) ~= 0 then
			local haus = laGetElementData ( player, "house" )
			local x1, y1, z1 = getElementPosition ( player )
			local x2 = laGetElementData ( player, "housex" )
			local y2 = laGetElementData ( player, "housey" )
			local z2 = laGetElementData ( player, "housez" )
			local pname = getPlayerName ( player )
			local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
			if distance < 5 then
				if laGetElementData ( haus, "owner" ) == "none" then
					if laGetElementData ( player, "playingtime" )/60 > laGetElementData ( haus, "mintime" ) then
						if not MySQL_DatasetExist ( "buyit", "Hoechstbietender LIKE '"..pname.."' AND Typ LIKE 'Houses'" ) then
							if haus ~= "none" then
								if tonumber(laGetElementData ( player, "housekey" )) == 0 then
									local hauskosten = tonumber(laGetElementData ( haus, "preis" ))
									if zahlart == "bank" then
										local hauskostenblank = hauskosten
										local hauskosten = hauskosten*1.05
										if laGetElementData ( player, "bankmoney" ) >= hauskosten then
											laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - hauskosten )
											
											triggerClientEvent ( player, "createNewStatementEntry", player, "Hauskauf", hauskosten * - 1, "\n" )
											
											local id = laGetElementData ( haus, "id" )
											laSetElementData ( player, "housekey", id )
											laSetElementData ( haus, "owner", pname )
											setElementModel ( haus, 1272 )
											
											datasave_remote(player)
											
											MySQL_SetString("houses", "Besitzer", pname, "ID LIKE '"..id.."'")
											MySQL_SetString("userdata", "Hausschluessel", (laGetElementData ( player, "housekey" )), "Name LIKE '"..pname.."'")
											
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGlückwunsch!\nDu hast das Haus für "..hauskosten.."$ gekauft!\nFür mehr Infos, öffne das Hilfemenü!", 10000, 125, 0, 0 )
											triggerClientEvent ( player, "achievsound", getRootElement() )
											
											outputLog ( "[BUY]: Das Haus (ID "..id..") wurde von "..pname.." fuer "..hauskosten.."$ per Bank erworben.", "house" )
											
											local Hauskaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Hauskauf'") )
											local Hauskaufkassenew = math.floor(Hauskaufkasse + (hauskostenblank))
											MySQL_SetString("staat", "Menge", Hauskaufkassenew, "Name LIKE 'Hauskauf'")
											
											local Hauskaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Hauskaufsteuern'") )
											local Hauskaufsteuernkassenew = math.floor(Hauskaufsteuernkasse + (hauskostenblank/20))
											MySQL_SetString("staat", "Menge", Hauskaufsteuernkassenew, "Name LIKE 'Hauskaufsteuern'")
											
										else
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld\nauf dem Konto!", 5000, 125, 0, 0 )
										end
									else
										if laGetElementData ( player, "money" ) >= hauskosten then
											laSetElementData ( player, "money", laGetElementData ( player, "money" ) - hauskosten )
											takePlayerMoney ( player, hauskosten )
											triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
											
											local id = laGetElementData ( haus, "id" )
											laSetElementData ( player, "housekey", id )
											laSetElementData ( haus, "owner", pname )
											setElementModel ( haus, 1272 )
											
											datasave_remote(player)
											
											MySQL_SetString("houses", "Besitzer", pname, "ID LIKE '"..id.."'")
											MySQL_SetString("userdata", "Hausschluessel", (laGetElementData ( player, "housekey" )), "Name LIKE '"..pname.."'")
											
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGlückwunsch!\nDu hast das Haus für "..hauskosten.."$ gekauft!\nFür mehr Infos, öffne das Hilfemenü!", 10000, 125, 0, 0 )
											triggerClientEvent ( player, "achievsound", getRootElement() )
										
											outputLog ( "[BUY]: Das Haus (ID "..id..") wurde von "..pname.." fuer "..hauskosten.."$ bar erworben.", "house" )
											
											local Hauskaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Hauskauf'") )
											local Hauskaufkassenew = math.floor(Hauskaufkasse + (hauskosten))
											MySQL_SetString("staat", "Menge", Hauskaufkassenew, "Name LIKE 'Hausverkauf'")
											
										else
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Bargeld!", 5000, 125, 0, 0 )
										end
									end
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\nein Haus!", 5000, 125, 0, 0 )
								end
							end
						else
							outputChatBox ( "Du ersteigerst momentan bereits ein Haus!", player, 0, 125, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\nlange genug\ngespielt!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nBitte als Zahlart\nbar oder bank\nangeben!!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "buyhouse", buyhouse_func )