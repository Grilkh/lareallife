------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

--SICHERHEITSHINWEIS--
samenTruck = createBlip (2078.464, -1556.964, 12.4, 60, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
local samenTruckEntrance = createMarker (2078.464, -1556.964, 12.4, "cylinder", 2, 255, 0, 0, 150)

function samenTruckEntrance_func ( player, dim )
if getElementType(player) == "player" and (dim) then
	if isPedInVehicle ( player ) == false then
			if isSurenos(player) then
				outputChatBox ( "[INFO]: Verwende /hanfsamentruck [Anzahl] um einen Truck zu starten! Maximal 200 Samen und 1 Truck pro Stunde!", player, 200, 200, 0 )
			else
				outputChatBox ( "Du bist kein Mitglied der Surenos!", player, 200, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit",  samenTruckEntrance,  samenTruckEntrance_func )



function samenTruck_func ( player, cmd, samen )

if not samen then
	infobox ( player, "\n\nVerwende: /hanfsamentruck [Anzahl]", 5000, 125, 0, 0 )
else
	if isSurenos ( player ) then
		samennumber = tonumber(samen)
		samenprice = samennumber * 50
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( 2078.464, -1556.964, 12.4, x, y, z ) < 5 then
			if samentransport == nil then samentransport = 0 end
			if samentransport == 0 then
				if (200 >= samennumber) and (samennumber > 0) then
					if laGetElementData ( player, "money" ) >= samenprice then
						laSetElementData ( player, "lastcrime", "samentruck" )
						laSetElementData ( player, "money", laGetElementData(player,"money")-samenprice )
						takePlayerMoney ( player, samenprice )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						loadSamenTruck ( player, samennumber, samenprice )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /hanfsamentruck [Anzahl]\n(maximal 200 Stück)!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist bereits ein\nHanfsamentruck unterwegs!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Mitglied der Surenos!", 7000, 125, 0, 0 )
	end
end
end
addCommandHandler ( "hanfsamentruck", samenTruck_func )

function loadSamenTruck ( player, samen, samenprice )
	samenanzahl = samen
	samenpreis = samenprice
	local msg = "[ILLEGAL]: Ein Hanfsamentruck wurde beladen!"
	sendMSGForFaction ( msg, 1, 200, 0, 0 )
	sendMSGForFaction ( msg, 2, 200, 200, 0 )
	sendMSGForFaction ( msg, 3, 200, 200, 0 )
	sendMSGForFaction ( msg, 6, 200, 0, 0 )
	sendMSGForFaction ( msg, 7, 0, 150, 0 )
	sendMSGForFaction ( msg, 8, 200, 0, 0 )
	sendMSGForFaction ( msg, 9, 200, 200, 0 )
	sendMSGForFaction ( msg, 10, 200, 200, 0 )
	outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat einen Hanfsamentruck gestartet!", "bad" )
	if samentruckcount == nil then samentruckcount = 1 else samentruckcount = samentruckcount + 1 end
	samentransport = 1
	_G["samentruck"..samentruckcount] = createVehicle ( 609, 2092.189, -1557.526, 13.179, 0, 0, 180, "SAMEN" )
	setVehiclePaintjob ( _G["samentruck"..samentruckcount], 2 )
	setVehicleColor ( _G["samentruck"..samentruckcount], 255, 255, 0, 255, 255, 0, 255, 255, 0)
	setElementHealth ( _G["samentruck"..samentruckcount], 1500 )
	laSetElementData ( _G["samentruck"..samentruckcount], "samen", samenanzahl )
	laSetElementData ( _G["samentruck"..samentruckcount], "kosten", samenpreis )
	laSetElementData ( _G["samentruck"..samentruckcount], "samentruck", 1 )
	warpPedIntoVehicle ( player, _G["samentruck"..samentruckcount] )
	outputChatBox ( "[AUFGABE]: Bringe nun den Hanfsamentruck zur Gangbase in SF!", player, 0, 100, 200 )
	setElementVisibleTo ( SurenosDeliver, player, true )
	setElementVisibleTo ( SurenosDeliverBlip, player, true )
	laSetElementData ( _G["samentruck"..samentruckcount], "illegalcar", 1 )
end




function vehicleEnterSamenTruck (veh)

local driver = source

	if laGetElementData ( veh, "samentruck" ) == 1 then
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
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vehicleEnterSamenTruck )

function vehicleExitSamenTruck (veh)

	if laGetElementData ( veh, "samentruck" ) == 1 then
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
addEventHandler ( "onPlayerVehicleExit", getRootElement(), vehicleExitSamenTruck )



function vehicleDestroyedSamenTruck ()

	if laGetElementData ( source, "samentruck" ) == 1 then
		setTimer(samenclean, 3600000, 1)
		destroyElement ( veh, "samentruck" )
		destroyElement ( source )				
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[HANFSAMENTRUCK]: Der Hanfsamentruck ist explodiert!"
		sendMSGForFaction ( msg, 1, 0, 150, 0 )
		sendMSGForFaction ( msg, 2, 200, 200, 0 )
		sendMSGForFaction ( msg, 3, 200, 200, 0 )
		sendMSGForFaction ( msg, 6, 0, 150, 0 )
		sendMSGForFaction ( msg, 7, 200, 0, 0 )
		sendMSGForFaction ( msg, 8, 0, 150, 0 )
		sendMSGForFaction ( msg, 9, 200, 200, 0 )
		sendMSGForFaction ( msg, 10, 200, 200, 0 )
		outputLog ( "[HANFSAMENTRUCK]: Der Hanfsamentruck ist explodiert!", "bad" )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedSamenTruck )


function samenclean ()

samentransport = 0

end