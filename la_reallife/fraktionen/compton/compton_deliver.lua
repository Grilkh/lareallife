------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

ComptonDeliver = createMarker ( comptonx, comptony, comptonz, "checkpoint", 7, 255, 0, 0, 150, getRootElement() )
ComptonDeliverBlip = createBlip ( comptonx, comptony, comptonz, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( ComptonDeliver, getRootElement(), false )
setElementVisibleTo ( ComptonDeliverBlip, getRootElement(), false )

function ComptonDeliver_func ( player, dim )
if isCompton (player) then
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if getElementModel ( veh ) == 609 then
				if laGetElementData ( veh, "matstruck" ) == 1 then
				
					local mats = laGetElementData ( veh, "mats" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					ComptonMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Compton'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
					
				
					local Fammatsneu = ComptonMats + mats
					local ComptonFamkasseNew = ComptonFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE 'Compton'")
					MySQL_SetString("fraktionen", "DepotGeld", ComptonFamkasseNew, "Name LIKE 'Compton'")		
							
					ComptonMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Compton'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
	
					outputChatBox ( "Matslieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse zurück!", player, 0, 200, 0 )
					local msg = "[MATSTRUCK]: Der Matstruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat bei den Comptons einen Matstruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( ComptonDeliver, player, false )
					setElementVisibleTo ( ComptonDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(matsclean, 3600000, 1)
				elseif laGetElementData ( veh, "kokstruck" ) == 1 then
				
					local koks = laGetElementData ( veh, "koks" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					ComptonKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Compton'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
					
				
					local Famkoksneu = ComptonKoks + koks
					local ComptonFamkasseNew = ComptonFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE 'Compton'")
					MySQL_SetString("fraktionen", "DepotGeld", ComptonFamkasseNew, "Name LIKE 'Compton'")		
							
					ComptonKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Compton'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
	
					outputChatBox ( "Kokainlieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse zurück!", player, 0, 200, 0 )
					local msg = "[KOKAINTRUCK]: Der Kokaintruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 0, 0 )
					outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat bei den Comptons einen Kokaintruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( ComptonDeliver, player, false )
					setElementVisibleTo ( ComptonDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(koksclean, 3600000, 1)
				elseif laGetElementData ( veh, "samentruck" ) == 1 then
				
					local samen = laGetElementData ( veh, "samen" )

					outputChatBox ( "Hanfsamenlieferung abgegeben. Du erhältst "..samen.." Premiumsamen.", player, 0, 200, 0 )
					local msg = "[HANFSAMENTRUCK]: Der Hanfsamentruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 0, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat bei den Comptons einen Hanfsamentruck mit "..samen.." Premiumsamen abgegeben!", "bad" )
					laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) + samen )
					setElementVisibleTo ( ComptonDeliver, source, false )
					setElementVisibleTo ( ComptonDeliverBlip, source, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(samenclean, 3600000, 1)
				end
			end
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonDeliver, ComptonDeliver_func )