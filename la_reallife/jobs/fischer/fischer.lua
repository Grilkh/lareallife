function fischpreissteigung ()

	if fishprice == nil then fishprice = 8 end
	if fishprice <= 12 then
		fishprice = fishprice + 0.5
	end
	setTimer ( fischpreissteigung, 300000, 1 )
end

setTimer ( fischpreissteigung, 3600000, 1 )

reefer1 = createVehicle ( 453, -1705.2114257813,1443.5505371094,0,0,0,0, "ROW YOUR BOAT" )
local reefer = reefer1
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer1, true )
setVehicleRespawnDelay ( reefer1, 1000 )
setVehicleIdleRespawnDelay ( reefer1, 1000 )

reefer2 = createVehicle ( 453, -1704.8940429688,1455.3642578125,0,0,0,0, "ROW YOUR BOAT" )
local reefer = reefer2
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer2, true )
setVehicleRespawnDelay ( reefer2, 1000 )
setVehicleIdleRespawnDelay ( reefer2, 1000 )

reefer3 = createVehicle ( 453, -1705.0718994141,1467.1142,0,0,0,0, "ROW YOUR BOAT" )
local reefer = reefer3
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer3, true )
setVehicleRespawnDelay ( reefer3, 1000 )
setVehicleIdleRespawnDelay ( reefer3, 1000 )

reefer4 = createVehicle ( 453, -1720.39,1443.024,0,0,0,0, "ROW YOUR BOAT" )
local reefer = reefer4
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer4, true )
setVehicleRespawnDelay ( reefer4, 1000 )
setVehicleIdleRespawnDelay ( reefer4, 1000 )

reefer5 = createVehicle ( 453, -1720.6491699219,1456.108,0,0,0,0, "ROW YOUR BOAT" )
local reefer = reefer5
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer5, true )
setVehicleRespawnDelay ( reefer5, 1000 )
setVehicleIdleRespawnDelay ( reefer5, 1000 )

reefer6 = createVehicle ( 453, -1705.2717285156, 1497.1535644531, 0, 0, 0, 0, "ROW YOUR BOAT" )
local reefer = reefer6
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer6, true )
setVehicleRespawnDelay ( reefer6, 1000 )
setVehicleIdleRespawnDelay ( reefer6, 1000 )

reefer7 = createVehicle ( 453, -1705.1030273438, 1484.3663330078, 0, 0, 0, 0, "ROW YOUR BOAT" )
local reefer = reefer7
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ) )
toggleVehicleRespawn ( reefer6, true )
setVehicleRespawnDelay ( reefer6, 1000 )
setVehicleIdleRespawnDelay ( reefer6, 1000 )

reefer8 = createVehicle ( 453, -1717.7352294922, 1429.986328125, 0, 0, 0, 270, "ROW YOUR BOAT" )
local reefer = reefer8
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ), getElementRotation ( reefer ) )
toggleVehicleRespawn ( reefer6, true )
setVehicleRespawnDelay ( reefer6, 1000 )
setVehicleIdleRespawnDelay ( reefer6, 1000 )

reefer9 = createVehicle ( 453, -1705.8044433594, 1430.0561523438, 0, 0, 0, 270, "ROW YOUR BOAT" )
local reefer = reefer9
setVehicleRespawnPosition ( reefer, getElementPosition ( reefer ), getElementRotation ( reefer ) )
toggleVehicleRespawn ( reefer6, true )
setVehicleRespawnDelay ( reefer6, 1000 )
setVehicleIdleRespawnDelay ( reefer6, 1000 )

function VehicleFischerEnter ( player )

	source = player
	if laGetElementData ( source, "job" ) ~= "fischer" then
		opticExitVehicle ( source )
		triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist kein Fischer!", 5000, 125, 0, 0 )
	elseif laGetElementData ( source, "job" ) == "fischer" then
		triggerClientEvent ( source , "Fischer_GUI" , source )
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		laSetElementData ( source, "fishingStartedM", minutes )
		laSetElementData ( source, "fishingStartedH", hour )
	end
end

for i = 1, 9 do
	addEventHandler ( "onVehicleEnter", _G["reefer"..i], VehicleFischerEnter )
end

function VehicleFischerExit ( veh )

	if isElement ( veh ) then
		if getElementModel ( veh ) == 453 and laGetElementData ( source, "job" ) == "fischer" then
			triggerClientEvent ( source, "cancelfishing", getRootElement() )
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), VehicleFischerExit )

function endfishing_func ( fische )

	if source == client then
		if fishprice == nil then fishprice = 8 end
		if fische == nil then fische = 0 end
		
		-- ANTICHEAT --
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		local dist = getDistanceBetweenMinutes ( laGetElementData ( source, "fishingStartedM" ), laGetElementData ( source, "fishingStartedH" ), minutes, hour )
		if dist * 7 > fische then
		-- ANTICHEAT --
			if fische >= 1 then
				local einnahmen = fishprice*fische
				local einnahmen = math.floor(einnahmen)*3
				triggerClientEvent ( source, "infobox_start", getRootElement(), "Du hast "..fische.."\nFische gefangen und\nerhältst "..einnahmen.." $\ndafür!", 15000, 125, 0, 0 )
				
				fishprice = fishprice - fische*0.05
				if fishprice < 3 then
					fishprice = 3
				end
				respawnVehicle ( getPedOccupiedVehicle ( source ) )
				setElementVelocity ( getPedOccupiedVehicle ( source ), 0, 0, 0 )
				opticExitVehicle ( source )
				setElementPosition ( source, -1725, 1464, 6.5 )
				
				laSetElementData ( source, "money", laGetElementData ( source, "money" ) + einnahmen )
				givePlayerMoney ( source, einnahmen )
				triggerClientEvent ( source, "HudEinblendenMoney", source )
				triggerClientEvent ( source, "achievsound", source )
				if laGetElementData ( source, "angler_achiev" ) ~= "done" then																							-- Achiev: Angler
					laSetElementData ( source, "angler_achiev", tonumber(laGetElementData ( source, "angler_achiev" ))+fische )												-- Achiev: Angler
					if laGetElementData ( source, "angler_achiev" ) >= 200 then																							-- Achiev: Angler
						triggerClientEvent ( source, "showAchievmentBox", source, "  Angler", 25, 10000 )																-- Achiev: Angler
						laSetElementData ( source, "bonuspoints", tonumber(laGetElementData ( source, "bonuspoints" )) + 25 )												-- Achiev: Angler
						laSetElementData ( source, "angler_achiev", "done" )																								-- Achiev: Angler
						MySQL_SetString("achievments", "Angler", laGetElementData ( source, "angler_achiev" ), "Name LIKE '"..getPlayerName(source).."'")					-- Achiev: Angler
					end																																					-- Achiev: Angler
				end																																						-- Achiev: Angler
			end
		end
	end
end
addEvent ( "endfishing", true )
addEventHandler ( "endfishing", getRootElement(), endfishing_func )


function increaseFishLevel_func (player)
local pname = getPlayerName(player)
local fischerpoints = tonumber(laGetElementData(player, "fischerlevel"))
local newfischerpoints = fischerpoints+1
laSetElementData(player, "fischerlevel", newfischerpoints)
MySQL_SetString ( "jobdata", "Fischer", newfischerpoints, "Name LIKE '"..pname.."'" )
end
addEvent ( "increaseFishLevel", true )
addEventHandler ( "increaseFishLevel", getRootElement(), increaseFishLevel_func )