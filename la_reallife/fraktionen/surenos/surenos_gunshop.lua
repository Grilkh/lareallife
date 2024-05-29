SurenosDeliver = createMarker ( surenosx, surenosy, surenosz, "checkpoint", 7, 255, 0, 0, 150, getRootElement() )
SurenosDeliverBlip = createBlip ( surenosx, surenosy, surenosz, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( SurenosDeliver, getRootElement(), false )
setElementVisibleTo ( SurenosDeliverBlip, getRootElement(), false )
local SurenosGunshopEnter = createMarker ( -2177.06, 957.953, 78.5, "cylinder", 1.5, 255, 0, 0, 150)

local SurenosGunshopLVEnter = createMarker ( -789.407, 1561.705, 26.182, "cylinder", 1.5, 255, 0, 0, 150)

local function SurenosGunshopEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isSurenos(hitElement) then
			triggerClientEvent ( hitElement, "showSurenosGunshop", getRootElement() )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
		else
			outputChatBox ( "Nur für Mitglieder der Surenos!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", SurenosGunshopEnter, SurenosGunshopEnter_func )

local function SurenosGunshopLVEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isSurenos(hitElement) then
			triggerClientEvent ( hitElement, "showSurenosGunshop", getRootElement() )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
		else
			outputChatBox ( "Nur für Mitglieder der Surenos!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", SurenosGunshopLVEnter, SurenosGunshopLVEnter_func )

function SurenosDeliver_func ( player, dim )
if isSurenos (player) then
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if getElementModel ( veh ) == 455 then
				if laGetElementData ( veh, "guntruck" ) == 1 then
				
					mafiatransport = 0
					
					SurenosSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Surenos'")
					SurenosBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Surenos'")
					SurenosMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Surenos'")
					SurenosSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Surenos'")
					SurenosPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Surenos'")
					SurenosSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Surenos'")
					SurenosPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Surenos'")
					SurenosDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Surenos'")
					SurenosDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Surenos'")
					SurenosSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Surenos'")
					SurenosSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Surenos'")
					SurenosMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Surenos'")
					SurenosMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Surenos'")
					SurenosAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Surenos'")
					SurenosAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Surenos'")
					--SurenosM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Surenos'")
					SurenosMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Surenos'")
					SurenosGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Surenos'")
					SurenosGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Surenos'")
					SurenosSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Surenos'")
					SurenosSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Surenos'")
					SurenosRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Surenos'")
					SurenosRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Surenos'")
					SurenosSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Surenos'")
					SurenosFamkasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'"))
					
					MySQL_SetString("fraktionswaffen", "Schlagringe", laGetElementData ( veh, "schlagringe" )+SurenosSchlagringe, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Baseballschlaeger", laGetElementData ( veh, "baseball" )+SurenosBaseballschlaeger, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Messer", laGetElementData ( veh, "knife" )+SurenosMesser, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Schaufeln", laGetElementData ( veh, "shovels" )+SurenosSchaufeln, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Pistolen", laGetElementData ( veh, "pistol" )+SurenosPistolen, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "SDPistolen", laGetElementData ( veh, "sdpistol" )+SurenosSDPistolen, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "PistolenMagazine", laGetElementData ( veh, "pistolammo" )+SurenosPistolenMagazine, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "DesertEagles", laGetElementData ( veh, "eagle" )+SurenosDesertEagles, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "DesertEagleMunition", laGetElementData ( veh, "eagleammo" )+SurenosDesertEagleMunition, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Schrotflinten", laGetElementData ( veh, "shotgun" )+SurenosSchrotflinten, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "SchrotflintenMunition", laGetElementData ( veh, "shotgunammo" )+SurenosSchrotflintenMunition, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "MP", laGetElementData ( veh, "mp" )+SurenosMP, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "MPMunition", laGetElementData ( veh, "mpammo" )+SurenosMPMunition, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "AK", laGetElementData ( veh, "ak" )+SurenosAK, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "AKMunition", laGetElementData ( veh, "akammo" )+SurenosAKMunition, "Fraktion LIKE 'Surenos'")
					--MySQL_SetString("fraktionswaffen", "M", laGetElementData ( veh, "m" )+SurenosM, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "MMunition", laGetElementData ( veh, "mammo" )+SurenosMMunition, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Gewehre", laGetElementData ( veh, "gewehr" )+SurenosGewehre, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "GewehrPatronen", laGetElementData ( veh, "gewehrammo" )+SurenosGewehrPatronen, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "SGewehr", laGetElementData ( veh, "sgewehr" )+SurenosSGewehr, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "SgewehrMunition", laGetElementData ( veh, "sgewehrammo" )+SurenosSGewehrMunition, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Raketenwerfer", laGetElementData ( veh, "rakwerfer" )+SurenosRaketenwerfer, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Raketen", laGetElementData ( veh, "rak" )+SurenosRaketen, "Fraktion LIKE 'Surenos'")
					MySQL_SetString("fraktionswaffen", "Spezwaffen", laGetElementData ( veh, "spezgun" )+SurenosSpezwaffen, "Fraktion LIKE 'Surenos'")
					
					SurenosSchlagringe = MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE 'Surenos'")
					SurenosBaseballschlaeger = MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE 'Surenos'")
					SurenosMesser = MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE 'Surenos'")
					SurenosSchaufeln = MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE 'Surenos'")
					SurenosPistolen = MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE 'Surenos'")
					SurenosSDPistolen = MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE 'Surenos'")
					SurenosPistolenMagazine = MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE 'Surenos'")
					SurenosDesertEagles = MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE 'Surenos'")
					SurenosDesertEagleMunition = MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE 'Surenos'")
					SurenosSchrotflinten = MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE 'Surenos'")
					SurenosSchrotflintenMunition = MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE 'Surenos'")
					SurenosMP = MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE 'Surenos'")
					SurenosMPMunition = MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE 'Surenos'")
					SurenosAK = MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE 'Surenos'")
					SurenosAKMunition = MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE 'Surenos'")
					--SurenosM = MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE 'Surenos'")
					SurenosMMunition = MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE 'Surenos'")
					SurenosGewehre = MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE 'Surenos'")
					SurenosGewehrPatronen = MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE 'Surenos'")
					SurenosSGewehr = MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE 'Surenos'")
					SurenosSGewehrMunition = MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE 'Surenos'")
					SurenosRaketenwerfer = MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE 'Surenos'")
					SurenosRaketen = MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE 'Surenos'")
					SurenosSpezwaffen = MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE 'Surenos'")
					local SurenosFamkasseNew = SurenosFamkasse - laGetElementData ( veh, "costs" )

				
					MySQL_SetString("fraktionen", "DepotGeld", SurenosFamkasseNew, "Name LIKE 'Surenos'")
					outputChatBox ( "Lieferung abgegeben. Du erhältst "..laGetElementData ( veh, "costs" ).."$ aus der Fraktionskasse zurück!", player, 0, 125, 0 )
					local msg = "[WAFFENTRUCK]: Der Waffentruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 0, 150, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[WAFFENTRUCK]: "..getPlayerName ( player ).." hat bei den Surenos einen Waffentruck fuer "..laGetElementData ( veh, "costs" ).."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + laGetElementData ( veh, "costs" ) )
					givePlayerMoney ( player, laGetElementData ( veh, "costs" ) )
					setElementVisibleTo ( SurenosDeliver, player, false )
					setElementVisibleTo ( SurenosDeliverBlip, player, false )
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
					
					SurenosMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Surenos'") )
					SurenosFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
					
				
					local Fammatsneu = SurenosMats + mats
					local SurenosFamkasseNew = SurenosFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE 'Surenos'")
					MySQL_SetString("fraktionen", "DepotGeld", SurenosFamkasseNew, "Name LIKE 'Surenos'")		
							
					SurenosMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Surenos'") )
					SurenosFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
	
					outputChatBox ( "Matslieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[MATSTRUCK]: Der Matstruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 0, 150, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 0, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat bei den Surenos einen Matstruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( SurenosDeliver, player, false )
					setElementVisibleTo ( SurenosDeliverBlip, player, false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					--removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(matsclean, 3600000, 1)
				elseif laGetElementData ( veh, "kokstruck" ) == 1 then
				
					local koks = laGetElementData ( veh, "koks" )
					local kosten = laGetElementData ( veh, "kosten" )
					
					SurenosKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Surenos'") )
					SurenosFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
					
				
					local Famkoksneu = SurenosKoks + koks
					local SurenosFamkasseNew = SurenosFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE 'Surenos'")
					MySQL_SetString("fraktionen", "DepotGeld", SurenosFamkasseNew, "Name LIKE 'Surenos'")		
							
					SurenosKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Surenos'") )
					SurenosFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
	
					outputChatBox ( "Kokainlieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse!", player, 0, 200, 0 )
					local msg = "[KOKAINTRUCK]: Der Kokaintruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 0, 150, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 0, 0 )
					outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat bei den Surenos einen Kokaintruck fuer "..kosten.."$ abgegeben!", "bad" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( SurenosDeliver, player, false )
					setElementVisibleTo ( SurenosDeliverBlip, player, false )
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
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 0, 150, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat bei den Surenos einen Hanfsamentruck mit "..samen.." Premiumsamen abgegeben!", "bad" )
					laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) + samen )
					setElementVisibleTo ( SurenosDeliver, player, false )
					setElementVisibleTo ( SurenosDeliverBlip, player, false )
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
addEventHandler ( "onMarkerHit", SurenosDeliver, SurenosDeliver_func )