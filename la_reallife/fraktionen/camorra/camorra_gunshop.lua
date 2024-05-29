--[[CamorraExit = createMarker ( -42.649452209473, 1405.7553710938, 1084.0788574219, "corona", 1, getColorFromString ( "#FF000099" ) )
setElementInterior (CamorraExit, 8)

vincenzo = createPed ( 46, -50.07, 1403.25, 1084.42 )
setElementData ( vincenzo, "undeadbarped", true )
setElementInterior (vincenzo, 8)
setPedRotation(vincenzo, 0)
local x, y, z = getElementPosition ( vincenzo )
laSetElementData ( vincenzo, "bot", true )
laSetElementData ( vincenzo, "sx", x )
laSetElementData ( vincenzo, "sy", y )
laSetElementData ( vincenzo, "sz", z )
laSetElementData ( vincenzo, "dim", 0 )
laSetElementData ( vincenzo, "int", 8 )
laSetElementData ( vincenzo, "rot", getPedRotation ( vincenzo ) )
laSetElementData ( vincenzo, "botname", "vincenzo" )]]

CamorraGunshopEnter = createMarker ( -1695.496, 1375.092, 6.782352, "cylinder", 1.5, 255, 0, 0, 150 )
CamorraGunshopEnterCasino = createMarker ( 2176.7465820313, 1619.2484130859, 998.951171875, "cylinder", 1.5, 255, 0, 0, 150 )
setElementInterior ( CamorraGunshopEnterCasino, 1 )

CamorraDeliver = createMarker ( camorrax, camorray, camorraz, "checkpoint", 7, 255, 0, 0, 150, getRootElement() )
CamorraDeliverBlip = createBlip ( camorrax, camorray, camorraz, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( CamorraDeliver, getRootElement(), false )
setElementVisibleTo ( CamorraDeliverBlip, getRootElement(), false )

function CamorraGunshopEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCamorra(hitElement) then
			triggerClientEvent ( hitElement, "showCamorraGunshop", getRootElement() )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
		else
			outputChatBox ( "Nur für Camorra Mitglieder!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", CamorraGunshopEnter, CamorraGunshopEnter_func )
addEventHandler ( "onMarkerHit", CamorraGunshopEnterCasino, CamorraGunshopEnter_func )

function CamorraDeliver_func ( player, dim )
   
if isCamorra (player) then
	local veh = getPedOccupiedVehicle ( player )
	if getPedOccupiedVehicleSeat ( player ) == 0 then
		if getElementModel ( veh ) == 455 then
			if laGetElementData ( veh, "guntruck" ) == 1 then
				if laGetElementData ( player, "gunloads" ) then
					laSetElementData ( player, "gunloads", 0 )
				end
				
				mafiatransport = 0
				
				CamorraSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Camorra'")
				CamorraBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Camorra'")
				CamorraMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Camorra'")
				CamorraSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Camorra'")
				CamorraPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Camorra'")
				CamorraSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Camorra'")
				CamorraPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Camorra'")
				CamorraDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Camorra'")
				CamorraDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Camorra'")
				CamorraSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Camorra'")
				CamorraSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Camorra'")
				CamorraMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Camorra'")
				CamorraMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Camorra'")
				CamorraAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Camorra'")
				CamorraAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Camorra'")
				--CamorraM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Camorra'")
				CamorraMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Camorra'")
				CamorraGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Camorra'")
				CamorraGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Camorra'")
				CamorraSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Camorra'")
				CamorraSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Camorra'")
				CamorraRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Camorra'")
				CamorraRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Camorra'")
				CamorraSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Camorra'")
				CamorraFamkasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'"))
				
				MySQL_SetString("fraktionswaffen", "Schlagringe", laGetElementData ( veh, "schlagringe" )+CamorraSchlagringe, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Baseballschlaeger", laGetElementData ( veh, "baseball" )+CamorraBaseballschlaeger, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Messer", laGetElementData ( veh, "knife" )+CamorraMesser, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Schaufeln", laGetElementData ( veh, "shovels" )+CamorraSchaufeln, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Pistolen", laGetElementData ( veh, "pistol" )+CamorraPistolen, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "SDPistolen", laGetElementData ( veh, "sdpistol" )+CamorraSDPistolen, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "PistolenMagazine", laGetElementData ( veh, "pistolammo" )+CamorraPistolenMagazine, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "DesertEagles", laGetElementData ( veh, "eagle" )+CamorraDesertEagles, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "DesertEagleMunition", laGetElementData ( veh, "eagleammo" )+CamorraDesertEagleMunition, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Schrotflinten", laGetElementData ( veh, "shotgun" )+CamorraSchrotflinten, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "SchrotflintenMunition", laGetElementData ( veh, "shotgunammo" )+CamorraSchrotflintenMunition, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "MP", laGetElementData ( veh, "mp" )+CamorraMP, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "MPMunition", laGetElementData ( veh, "mpammo" )+CamorraMPMunition, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "AK", laGetElementData ( veh, "ak" )+CamorraAK, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "AKMunition", laGetElementData ( veh, "akammo" )+CamorraAKMunition, "Fraktion LIKE 'Camorra'")
				--MySQL_SetString("fraktionswaffen", "M", laGetElementData ( veh, "m" )+CamorraM, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "MMunition", laGetElementData ( veh, "mammo" )+CamorraMMunition, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Gewehre", laGetElementData ( veh, "gewehr" )+CamorraGewehre, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "GewehrPatronen", laGetElementData ( veh, "gewehrammo" )+CamorraGewehrPatronen, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "SGewehr", laGetElementData ( veh, "sgewehr" )+CamorraSGewehr, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "SgewehrMunition", laGetElementData ( veh, "sgewehrammo" )+CamorraSGewehrMunition, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Raketenwerfer", laGetElementData ( veh, "rakwerfer" )+CamorraRaketenwerfer, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Raketen", laGetElementData ( veh, "rak" )+CamorraRaketen, "Fraktion LIKE 'Camorra'")
				MySQL_SetString("fraktionswaffen", "Spezwaffen", laGetElementData ( veh, "spezgun" )+CamorraSpezwaffen, "Fraktion LIKE 'Camorra'")
				
				CamorraSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Camorra'")
				CamorraBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Camorra'")
				CamorraMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Camorra'")
				CamorraSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Camorra'")
				CamorraPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Camorra'")
				CamorraSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Camorra'")
				CamorraPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Camorra'")
				CamorraDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Camorra'")
				CamorraDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Camorra'")
				CamorraSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Camorra'")
				CamorraSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Camorra'")
				CamorraMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Camorra'")
				CamorraMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Camorra'")
				CamorraAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Camorra'")
				CamorraAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Camorra'")
				--CamorraM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Camorra'")
				CamorraMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Camorra'")
				CamorraGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Camorra'")
				CamorraGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Camorra'")
				CamorraSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Camorra'")
				CamorraSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Camorra'")
				CamorraRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Camorra'")
				CamorraRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Camorra'")
				CamorraSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Camorra'")
				local CamorraFamkasseNew = CamorraFamkasse - laGetElementData ( veh, "costs" )

				
				MySQL_SetString("fraktionen", "DepotGeld", CamorraFamkasseNew, "Name LIKE 'Camorra'")
				outputChatBox ( "Lieferung abgegeben! Du erhältst "..laGetElementData ( veh, "costs" ).."$ aus der Familienkasse zurück!", player, 0, 150, 0 )
				local msg = "[WAFFENTRUCK]: Der Waffentruck wurde erfolgreich abgegeben!"
				sendMSGForFaction ( msg, 1, 200, 0, 0 )
				sendMSGForFaction ( msg, 2, 0, 150, 0 )
				sendMSGForFaction ( msg, 3, 200, 200, 0 )
				sendMSGForFaction ( msg, 6, 200, 0, 0 )
				sendMSGForFaction ( msg, 7, 200, 200, 0 )
				sendMSGForFaction ( msg, 8, 200, 0, 0 )
				sendMSGForFaction ( msg, 9, 200, 200, 0 )
				sendMSGForFaction ( msg, 10, 200, 200, 0 )
				outputLog ( "[WAFFENTRUCK]: "..getPlayerName ( player ).." hat bei der Camorra einen Waffentruck fuer "..laGetElementData ( veh, "costs" ).."$ abgegeben!", "bad" )
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) + laGetElementData ( veh, "costs" ) )
				givePlayerMoney ( player, laGetElementData ( veh, "costs" ) )
				--[[if laGetElementData ( player, "gunloads" ) ~= "done" then 																								-- Achiev: Waffenschieber
					laSetElementData ( player, "gunloads", tonumber(laGetElementData ( player, "gunloads" )) + tonumber(laGetElementData ( veh, "costs" )) )					-- Achiev: Waffenschieber
					if laGetElementData ( player, "gunloads" ) > 50000 then																								-- Achiev: Waffenschieber
						laSetElementData ( player, "gunloads", "done" )																									-- Achiev: Waffenschieber
						triggerClientEvent ( player, "showAchievmentBox", player, "Waffenschieber", 50, 10000 )															-- Achiev: Waffenschieber
						laSetElementData ( player, "bonuspoints", laGetElementData ( player, "bonuspoints" ) + 50 )															-- Achiev: Waffenschieber
						MySQL_SetString("achievments", "Waffenschieber", laGetElementData ( player, "gunloads" ), "Name LIKE '"..getPlayerName(player).."'")				-- Achiev: Waffenschieber
					end																																		-- Achiev: Waffenschieber
				end]]																																					-- Achiev: Waffenschieber
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
					
					CamorraMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Camorra'") )
					CamorraFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
					
				
					local Fammatsneu = CamorraMats + mats
					local CamorraFamkasseNew = CamorraFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE 'Camorra'")
					MySQL_SetString("fraktionen", "DepotGeld", CamorraFamkasseNew, "Name LIKE 'Camorra'")		
							
					CamorraMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Camorra'") )
					CamorraFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
	
					outputChatBox ( "Matslieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[MATSTRUCK]: Der Matstruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 0, 150, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 0, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat bei den Camorra einen Matstruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( CamorraDeliver, player, false )
					setElementVisibleTo ( CamorraDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(matsclean, 3600000, 1)
				elseif laGetElementData ( veh, "kokstruck" ) == 1 then
				
					local koks = laGetElementData ( veh, "koks" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					CamorraKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Camorra'") )
					CamorraFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
					
				
					local Famkoksneu = CamorraKoks + koks
					local CamorraFamkasseNew = CamorraFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE 'Camorra'")
					MySQL_SetString("fraktionen", "DepotGeld", CamorraFamkasseNew, "Name LIKE 'Camorra'")		
							
					CamorraKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Camorra'") )
					CamorraFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
	
					outputChatBox ( "Kokainlieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[KOKAINTRUCK]: Der Kokaintruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 0, 150, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 0, 0 )
					outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat bei den Camorra einen Kokaintruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( CamorraDeliver, player, false )
					setElementVisibleTo ( CamorraDeliverBlip, player, false )
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
					sendMSGForFaction ( msg, 2, 0, 150, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 0, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat bei den Camorra einen Hanfsamentruck mit "..samen.." Premiumsamen abgegeben!", "bad" )
					laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) + samen )
					setElementVisibleTo ( CamorraDeliver, player, false )
					setElementVisibleTo ( CamorraDeliverBlip, player, false )
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
addEventHandler ( "onMarkerHit", CamorraDeliver, CamorraDeliver_func )