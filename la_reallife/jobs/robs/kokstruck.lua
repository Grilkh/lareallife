------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

koksTruck = createBlip (2537.723, -1452.889, 23.5, 59, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
local koksTruckEntrance = createMarker (2537.723, -1452.889, 22.9, "cylinder", 2, 255, 0, 0, 150)

function koksTruckEntrance_func ( player, dim )
if getElementType(player) == "player" and (dim) then
	if isPedInVehicle ( player ) == false then
			if isWatts(player) then
				outputChatBox ( "[INFO]: Verwende /kokstruck [Anzahl] um einen Truck zu starten! Maximal 200g Kokain und 1 Truck pro Stunde!", player, 200, 200, 0 )
			else
				outputChatBox ( "Du bist kein Mitglied der Watts Soldiers!", player, 200, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit",  koksTruckEntrance,  koksTruckEntrance_func )



function koksTruck_func ( player, cmd, koks )

if not koks then
	infobox ( player, "\n\nVerwende: /kokstruck [Anzahl]", 5000, 125, 0, 0 )
else
	if isWatts ( player ) then
		koksnumber = tonumber(koks)
		koksprice = koksnumber * 50
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( 2537.723, -1452.889, 22.9, x, y, z ) < 5 then
			if kokstransport == nil then kokstransport = 0 end
			if kokstransport == 0 then
				if (200 >= koksnumber) and (koksnumber > 0) then
					if laGetElementData ( player, "money" ) >= koksprice then
						laSetElementData ( player, "lastcrime", "kokstruck" )
						laSetElementData ( player, "money", laGetElementData(player,"money")-koksprice )
						takePlayerMoney ( player, koksprice )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						loadKoksTruck ( player, koksnumber, koksprice )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /kokstruck [Anzahl]\n(maximal 200g Kokain!)!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist bereits ein\nKokaintruck unterwegs!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Mitglied der Watts Soldiers!", 7000, 125, 0, 0 )
	end
end
end
addCommandHandler ( "kokstruck", koksTruck_func )

function loadKoksTruck ( player, koks, koksprice )
	koksanzahl = koks
	kokspreis = koksprice
	local msg = "[ILLEGAL]: Ein Kokaintruck wurde beladen!"
	sendMSGForFaction ( msg, 1, 200, 0, 0 )
	sendMSGForFaction ( msg, 2, 200, 200, 0 )
	sendMSGForFaction ( msg, 3, 200, 200, 0 )
	sendMSGForFaction ( msg, 6, 200, 0, 0 )
	sendMSGForFaction ( msg, 7, 200, 200, 0 )
	sendMSGForFaction ( msg, 8, 200, 0, 0 )
	sendMSGForFaction ( msg, 9, 200, 200, 0 )
	sendMSGForFaction ( msg, 10, 0, 150, 0 )
	outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat einen Kokaintruck gestartet!", "bad" )
	if kokstruckcount == nil then kokstruckcount = 1 else kokstruckcount = kokstruckcount + 1 end
	kokstransport = 1
	_G["kokstruck"..kokstruckcount] = createVehicle ( 609, 2526.686, -1465.826, 23.36, 0, 0, 270, "KOKAIN" )
	setVehiclePaintjob ( _G["kokstruck"..kokstruckcount], 2 )
	setVehicleColor ( _G["kokstruck"..kokstruckcount], 18, 18, 0, 0 )
	setElementHealth ( _G["kokstruck"..kokstruckcount], 1500 )
	laSetElementData ( _G["kokstruck"..kokstruckcount], "koks", koksanzahl )
	laSetElementData ( _G["kokstruck"..kokstruckcount], "kosten", kokspreis )
	laSetElementData ( _G["kokstruck"..kokstruckcount], "kokstruck", 1 )
	warpPedIntoVehicle ( player, _G["kokstruck"..kokstruckcount] )
	outputChatBox ( "[AUFGABE]: Bringe nun den Kokainruck zur Gangbase in SF!", player, 0, 100, 200 )
	setElementVisibleTo ( WattsDeliver, player, true )
	setElementVisibleTo ( WattsDeliverBlip, player, true )
	laSetElementData ( _G["kokstruck"..kokstruckcount], "illegalcar", 1 )
end




function vehicleEnterKoksTruck (veh)

local driver = source

	if laGetElementData ( veh, "kokstruck" ) == 1 then
		if laGetElementData ( driver, "fraktion" ) == 2 then
			setElementVisibleTo ( CamorraDeliver, driver, true )
			setElementVisibleTo ( CamorraDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 3 then
			setElementVisibleTo ( YakuzaDeliver, driver, true )
			setElementVisibleTo ( YakuzaDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 7 then
			setElementVisibleTo ( SurenosDeliver, driver, true )
			setElementVisibleTo ( SurenosDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 9 then
			setElementVisibleTo ( ComptonDeliver, driver, true )
			setElementVisibleTo ( ComptonDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 10 then
			setElementVisibleTo ( WattsDeliver, driver, true )
			setElementVisibleTo ( WattsDeliverBlip, driver, true )
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vehicleEnterKoksTruck )

function vehicleExitKoksTruck (veh)

	if laGetElementData ( veh, "kokstruck" ) == 1 then
		if laGetElementData ( source, "fraktion" ) == 2 then
			setElementVisibleTo ( CamorraDeliver, source, false )
			setElementVisibleTo ( CamorraDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 3 then
			setElementVisibleTo ( YakuzaDeliver, source, false )
			setElementVisibleTo ( YakuzaDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 7 then
			setElementVisibleTo ( SurenosDeliver, source, false )
			setElementVisibleTo ( SurenosDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 9 then
			setElementVisibleTo ( ComptonDeliver, source, false )
			setElementVisibleTo ( ComptonDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 10 then
			setElementVisibleTo ( WattsDeliver, source, false )
			setElementVisibleTo ( WattsDeliverBlip, source, false )
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), vehicleExitKoksTruck )



function vehicleDestroyedKoksTruck ()

	if laGetElementData ( source, "kokstruck" ) == 1 then
		setTimer(koksclean, 3600000, 1)
		destroyElement ( veh, "kokstruck" )
		destroyElement ( source )				
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[KOKAINTRUCK]: Der Kokaintruck ist explodiert!"
		sendMSGForFaction ( msg, 1, 0, 150, 0 )
		sendMSGForFaction ( msg, 2, 200, 200, 0 )
		sendMSGForFaction ( msg, 3, 200, 200, 0 )
		sendMSGForFaction ( msg, 6, 0, 150, 0 )
		sendMSGForFaction ( msg, 7, 200, 200, 0 )
		sendMSGForFaction ( msg, 8, 0, 150, 0 )
		sendMSGForFaction ( msg, 9, 200, 200, 0 )
		sendMSGForFaction ( msg, 10, 200, 0, 0 )
		outputLog ( "[KOKAINTRUCK]: Der Kokaintruck ist explodiert!", "bad" )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedKoksTruck )


function koksclean ()

kokstransport = 0

end