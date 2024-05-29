------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

matsTruck = createBlip (1674.131, -2122.079, 13.7, 62, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
local matsTruckEntrance = createMarker (1674.131, -2122.079, 13.1, "cylinder", 2, 255, 0, 0, 150)

function matsTruckEntrance_func ( player, dim )
if getElementType(player) == "player" and (dim) then
	if isPedInVehicle ( player ) == false then
			if isCompton(player) then
				outputChatBox ( "[INFO]: Verwende /matstruck [Anzahl] um einen Truck zu starten! Maximal 2000 Mats und 1 Truck pro Stunde!", player, 0, 200, 200 )
			else
				outputChatBox ( "Du bist kein Mitglied der Compton Families!", player, 200, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit",  matsTruckEntrance,  matsTruckEntrance_func )



function matsTruck_func ( player, cmd, mats )

if not mats then
	infobox ( player, "\n\nVerwende: /matstruck [Anzahl]", 5000, 125, 0, 0 )
else
	if isCompton ( player ) then
		matsnumber = tonumber(mats)
		matsprice = matsnumber * 5
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( 1674.131, -2122.079, 13.1, x, y, z ) < 5 then
			if matstransport == nil then matstransport = 0 end
			if matstransport == 0 then
				if (2000 >= matsnumber) and (matsnumber > 0) then
					if laGetElementData ( player, "money" ) >= matsprice then
						laSetElementData ( player, "lastcrime", "matstruck" )
						laSetElementData ( player, "money", laGetElementData(player,"money")-matsprice )
						takePlayerMoney ( player, matsprice )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						loadMatsTruck ( player, matsnumber, matsprice )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /matstruck [Anzahl]\n(maximal 2000 Mats!)!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist bereits ein\nMatstruck unterwegs!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Mitglied der Compton Families!", 7000, 125, 0, 0 )
	end
end
end
addCommandHandler ( "matstruck", matsTruck_func )

function loadMatsTruck ( player, mats, matsprice )
	matsanzahl = mats
	matspreis = matsprice
	local msg = "[ILLEGAL]: Ein Matstruck wurde beladen!"
	sendMSGForFaction ( msg, 1, 200, 0, 0 )
	sendMSGForFaction ( msg, 2, 200, 200, 0 )
	sendMSGForFaction ( msg, 3, 200, 200, 0 )
	sendMSGForFaction ( msg, 6, 200, 0, 0 )
	sendMSGForFaction ( msg, 7, 200, 200, 0 )
	sendMSGForFaction ( msg, 8, 200, 0, 0 )
	sendMSGForFaction ( msg, 9, 0, 150, 0 )
	sendMSGForFaction ( msg, 10, 200, 200, 0 )
	outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat einen Matstruck gestartet!", "bad" )
	if matstruckcount == nil then matstruckcount = 1 else matstruckcount = matstruckcount + 1 end
	matstransport = 1
	_G["matstruck"..matstruckcount] = createVehicle ( 609, 1668.6999511719, -2112.8000488281, 13.5, 0, 0, 270, "MATS" )
	setVehiclePaintjob ( _G["matstruck"..matstruckcount], 2 )
	setVehicleColor ( _G["matstruck"..matstruckcount], 86, 86, 0, 0 )
	setElementHealth ( _G["matstruck"..matstruckcount], 1500 )
	laSetElementData ( _G["matstruck"..matstruckcount], "mats", matsanzahl )
	laSetElementData ( _G["matstruck"..matstruckcount], "kosten", matspreis )
	laSetElementData ( _G["matstruck"..matstruckcount], "matstruck", 1 )
	warpPedIntoVehicle ( player, _G["matstruck"..matstruckcount] )
	outputChatBox ( "[AUFGABE]: Bringe nun den Matstruck zur Gangbase in SF!", player, 0, 100, 200 )
	setElementVisibleTo ( ComptonDeliver, player, true )
	setElementVisibleTo ( ComptonDeliverBlip, player, true )
	laSetElementData ( _G["matstruck"..kokstruckcount], "illegalcar", 1 )
end




function vehicleEnterMatsTruck (veh)

local driver = source

	if laGetElementData ( veh, "matstruck" ) == 1 then
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
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vehicleEnterMatsTruck )

function vehicleExitMatsTruck (veh)

	if laGetElementData ( veh, "matstruck" ) == 1 then
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
addEventHandler ( "onPlayerVehicleExit", getRootElement(), vehicleExitMatsTruck )



function vehicleDestroyedMatsTruck ()

	if laGetElementData ( source, "matstruck" ) == 1 then
		setTimer(matsclean, 3600000, 1)
		destroyElement ( veh, "matstruck" )
		destroyElement ( source )				
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[MATSTRUCK]: Der Matstruck ist explodiert!"
		sendMSGForFaction ( msg, 1, 0, 150, 0 )
		sendMSGForFaction ( msg, 2, 200, 200, 0 )
		sendMSGForFaction ( msg, 3, 200, 200, 0 )
		sendMSGForFaction ( msg, 6, 0, 150, 0 )
		sendMSGForFaction ( msg, 7, 200, 200, 0 )
		sendMSGForFaction ( msg, 8, 0, 150, 0 )
		sendMSGForFaction ( msg, 9, 200, 0, 0 )
		sendMSGForFaction ( msg, 10, 200, 200, 0 )
		outputLog ( "[MATSTRUCK]: Der Matstruck ist explodiert!", "bad" )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedMatsTruck )


function matsclean ()

matstransport = 0

end