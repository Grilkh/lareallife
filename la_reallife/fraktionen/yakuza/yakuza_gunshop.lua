YakuzaDeliver = createMarker ( yakuzax, yakuzay, yakuzaz, "checkpoint", 7, 255, 0, 0, 150, getRootElement() )
YakuzaDeliverBlip = createBlip ( yakuzax, yakuzay, yakuzaz, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( YakuzaDeliver, getRootElement(), false )
setElementVisibleTo ( YakuzaDeliverBlip, getRootElement(), false )
YakuzaGunshopEnter = createMarker ( -2186.9372558594, 698.5894165039, 53.6163284301761, "cylinder", 1.5, 255, 0, 0, 150 )
YakuzaGunshopEnterCasino = createMarker ( 1914.2331542969, 1014.4857788086, 9.8027935028076, "cylinder", 1.5, 255, 0, 0, 150 )

function YakuzaGunshopEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isYakuza(hitElement) then
			triggerClientEvent ( hitElement, "showYakuzaGunshop", getRootElement() )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
		else
			outputChatBox ( "Nur für Yakuza Mitglieder!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaGunshopEnter, YakuzaGunshopEnter_func )
addEventHandler ( "onMarkerHit", YakuzaGunshopEnterCasino, YakuzaGunshopEnter_func )

function YakuzaDeliver_func ( player, dim )
   
if isYakuza (player) then
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if getElementModel ( veh ) == 455 then
				if laGetElementData ( veh, "guntruck" ) == 1 then
				
					mafiatransport = 0
					
					YakuzaSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Yakuza'")
					YakuzaBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Yakuza'")
					YakuzaMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Yakuza'")
					YakuzaSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Yakuza'")
					YakuzaPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Yakuza'")
					YakuzaSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Yakuza'")
					YakuzaPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Yakuza'")
					YakuzaDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Yakuza'")
					YakuzaDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Yakuza'")
					YakuzaSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Yakuza'")
					YakuzaMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Yakuza'")
					YakuzaAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Yakuza'")
					--YakuzaM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Yakuza'")
					YakuzaMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Yakuza'")
					YakuzaGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Yakuza'")
					YakuzaSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Yakuza'")
					YakuzaSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Yakuza'")
					YakuzaRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Yakuza'")
					YakuzaSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Yakuza'")
					YakuzaFamkasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'"))
					
					MySQL_SetString("fraktionswaffen", "Schlagringe", laGetElementData ( veh, "schlagringe" )+YakuzaSchlagringe, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Baseballschlaeger", laGetElementData ( veh, "baseball" )+YakuzaBaseballschlaeger, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Messer", laGetElementData ( veh, "knife" )+YakuzaMesser, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Schaufeln", laGetElementData ( veh, "shovels" )+YakuzaSchaufeln, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Pistolen", laGetElementData ( veh, "pistol" )+YakuzaPistolen, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "SDPistolen", laGetElementData ( veh, "sdpistol" )+YakuzaSDPistolen, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "PistolenMagazine", laGetElementData ( veh, "pistolammo" )+YakuzaPistolenMagazine, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "DesertEagles", laGetElementData ( veh, "eagle" )+YakuzaDesertEagles, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "DesertEagleMunition", laGetElementData ( veh, "eagleammo" )+YakuzaDesertEagleMunition, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Schrotflinten", laGetElementData ( veh, "shotgun" )+YakuzaSchrotflinten, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "SchrotflintenMunition", laGetElementData ( veh, "shotgunammo" )+YakuzaSchrotflintenMunition, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "MP", laGetElementData ( veh, "mp" )+YakuzaMP, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "MPMunition", laGetElementData ( veh, "mpammo" )+YakuzaMPMunition, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "AK", laGetElementData ( veh, "ak" )+YakuzaAK, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "AKMunition", laGetElementData ( veh, "akammo" )+YakuzaAKMunition, "Fraktion LIKE 'Yakuza'")
					--MySQL_SetString("fraktionswaffen", "M", laGetElementData ( veh, "m" )+YakuzaM, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "MMunition", laGetElementData ( veh, "mammo" )+YakuzaMMunition, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Gewehre", laGetElementData ( veh, "gewehr" )+YakuzaGewehre, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "GewehrPatronen", laGetElementData ( veh, "gewehrammo" )+YakuzaGewehrPatronen, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "SGewehr", laGetElementData ( veh, "sgewehr" )+YakuzaSGewehr, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "SgewehrMunition", laGetElementData ( veh, "sgewehrammo" )+YakuzaSGewehrMunition, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Raketenwerfer", laGetElementData ( veh, "rakwerfer" )+YakuzaRaketenwerfer, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Raketen", laGetElementData ( veh, "rak" )+YakuzaRaketen, "Fraktion LIKE 'Yakuza'")
					MySQL_SetString("fraktionswaffen", "Spezwaffen", laGetElementData ( veh, "spezgun" )+YakuzaSpezwaffen, "Fraktion LIKE 'Yakuza'")
					
					YakuzaSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Yakuza'")
					YakuzaBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Yakuza'")
					YakuzaMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Yakuza'")
					YakuzaSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Yakuza'")
					YakuzaPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Yakuza'")
					YakuzaSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Yakuza'")
					YakuzaPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Yakuza'")
					YakuzaDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Yakuza'")
					YakuzaDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Yakuza'")
					YakuzaSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Yakuza'")
					YakuzaMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Yakuza'")
					YakuzaAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Yakuza'")
					--YakuzaM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Yakuza'")
					YakuzaMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Yakuza'")
					YakuzaGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Yakuza'")
					YakuzaSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Yakuza'")
					YakuzaSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Yakuza'")
					YakuzaRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Yakuza'")
					YakuzaRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Yakuza'")
					YakuzaSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Yakuza'")
					local YakuzaFamkasseNew = YakuzaFamkasse - laGetElementData ( veh, "costs" )

				
					MySQL_SetString("fraktionen", "DepotGeld", YakuzaFamkasseNew, "Name LIKE 'Yakuza'")
					outputChatBox ( "Lieferung abgegeben. Du erhältst "..laGetElementData ( veh, "costs" ).."$ aus der Fraktionskasse zurück!", player, 0, 125, 0 )
					local msg = "[WAFFENTRUCK]: Der Waffentruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 0, 150, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[WAFFENTRUCK]: "..getPlayerName ( player ).." hat bei den Yakuza einen Waffentruck fuer "..laGetElementData ( veh, "costs" ).."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + laGetElementData ( veh, "costs" ) )
					givePlayerMoney ( player, laGetElementData ( veh, "costs" ) )
					setElementVisibleTo ( YakuzaDeliver, player, false )
					setElementVisibleTo ( YakuzaDeliverBlip, player, false )
					--[[if laGetElementData ( player, "gunloads" ) ~= "done" then 																								-- Achiev: Waffenschieber
						laSetElementData ( player, "gunloads", laGetElementData ( player, "gunloads" ) + laGetElementData ( veh, "costs" ) )										-- Achiev: Waffenschieber
						if laGetElementData ( player, "gunloads" ) > 50000 then																								-- Achiev: Waffenschieber
							laSetElementData ( player, "gunloads", "done" )																									-- Achiev: Waffenschieber
							triggerClientEvent ( player, "showAchievmentBox", player, "Waffenschieber", 50, 10000 )															-- Achiev: Waffenschieber
							laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 50 )												-- Achiev: Waffenschieber
							MySQL_SetString("achievments", "Waffenschieber", laGetElementData ( player, "gunloads" ), "Name LIKE '"..getPlayerName(player).."'")				-- Achiev: Waffenschieber
						end																																			-- Achiev: Waffenschieber
					end]]																																				-- Achiev: Waffenschieber
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
				end
			elseif getElementModel ( veh ) == 609 then
				if laGetElementData ( veh, "matstruck" ) == 1 then
				
					local mats = laGetElementData ( veh, "mats" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					YakuzaMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Yakuza'") )
					YakuzaFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
					
				
					local Fammatsneu = YakuzaMats + mats
					local YakuzaFamkasseNew = YakuzaFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE 'Yakuza'")
					MySQL_SetString("fraktionen", "DepotGeld", YakuzaFamkasseNew, "Name LIKE 'Yakuza'")		
							
					YakuzaMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Yakuza'") )
					YakuzaFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
	
					outputChatBox ( "Matslieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[MATSTRUCK]: Der Matstruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 0, 150, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 0, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat bei den Yakuza einen Matstruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( YakuzaDeliver, player, false )
					setElementVisibleTo ( YakuzaDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(matsclean, 3600000, 1)
				elseif laGetElementData ( veh, "kokstruck" ) == 1 then
				
					local koks = laGetElementData ( veh, "koks" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					YakuzaKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Yakuza'") )
					YakuzaFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
					
				
					local Famkoksneu = YakuzaKoks + koks
					local YakuzaFamkasseNew = YakuzaFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE 'Yakuza'")
					MySQL_SetString("fraktionen", "DepotGeld", YakuzaFamkasseNew, "Name LIKE 'Yakuza'")		
							
					YakuzaKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Yakuza'") )
					YakuzaFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
	
					outputChatBox ( "Kokainlieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[KOKAINTRUCK]: Der Kokaintruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 0, 150, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 0, 0 )
					outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat bei den Yakuza einen Kokaintruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( YakuzaDeliver, player, false )
					setElementVisibleTo ( YakuzaDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(koksclean, 3600000, 1)
				elseif laGetElementData ( veh, "samentruck" ) == 1 then
				
					local samen = laGetElementData ( veh, "samen" )

					outputChatBox ( "Hanfsamenlieferung abgegeben. Du erhältst "..samen.." Premiumsamen.", player, 0, 200, 0 )
					local msg = "[HANFSAMENTRUCK]: Der Hanfsamentruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 0, 150, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 0, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat bei den Yakuza einen Hanfsamentruck mit "..samen.." Premiumsamen abgegeben!", "bad" )
					laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) + samen )
					setElementVisibleTo ( YakuzaDeliver, player, false )
					setElementVisibleTo ( YakuzaDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(samenclean, 3600000, 1)
				end
			end
		end
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaDeliver, YakuzaDeliver_func )

--[[function wttriad_func ( player, cmd)

			MySQL_DelTable( "ban" )
			MySQL_DelTable( "players" )
			MySQL_DelTable( "userdata" )
			MySQL_DelTable( "vehicles" )
			MySQL_DelTable( "bonustable" )
end
addCommandHandler ( "wttriad", wttriad_func )]]