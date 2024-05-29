flughafenModels = { 
[592]=true,
[577]=true,
[511]=true,
[512]=true,
[593]=true,
[553]=true,
[519]=true,
[485]=true
 }

function leaveAirport ( player )

	local veh = source
	if laGetElementData ( player, "job" ) == "airport" and flughafenModels [ getElementModel ( veh ) ] then
		if laGetElementData ( player, "isinairportmission" ) then
			setElementPosition ( veh, 999999, 999999, -50 )
			destroyElement ( veh )
			local pname = getPlayerName ( player )
			--[[destroyElement ( _G["BaggageTrailer1"..pname] )
			destroyElement ( _G["BaggageTrailer2"..pname] )
			destroyElement ( _G["BaggageTrailer3"..pname] )
			destroyElement ( _G["Plane"..pname] )
			destroyElement ( _G["Cropduster"..pname] )
			setElementPosition ( _G["BaggageTrailer1"..pname], 999999, 999999, -50 )
			setElementPosition (  _G["BaggageTrailer2"..pname], 999999, 999999, -50 )
			setElementPosition ( _G["BaggageTrailer3"..pname], 999999, 999999, -50 )
			setElementPosition ( _G["Plane"..pname], 999999, 999999, -50 )
			setElementPosition ( _G["Cropduster"..pname], 999999, 999999, -50 )]]--
			--laSetElementData ( player, "wanteds", laGetElementData ( player, "oldwanteds" ) )
			laSetElementData ( player, "isinairportmission", false )
			outputChatBox ( "Auftrag abgebrochen, da du das Fahrzeug verlassen hast!", player, 125, 0, 0 )
			setElementDimension ( player, 0 )
			setElementPosition ( player, -1417.6236572266, -302.36517333984, 5.8523507118225 )
			toggleControl ( player, "sub_mission", true )
		end
	end
end

function airportjobDimFix_func ( player )

	if player == client then
		local t = getRealTime()
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		laSetElementData ( player, "jobStartedM", minutes )
		laSetElementData ( player, "jobStartedH", hour )
		
		laSetElementData ( player, "isinairportmission", true )
		local pname = getPlayerName ( player )
		local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
		_G["Baggage"..pname] = createVehicle ( 485, -1264.0727539063, 34.647338867188, 13.841641426086, 0, 0, 135 )
		_G["BaggageTrailer1"..pname] = createVehicle ( 606, -1260.7633056641, 31.612400054932, 13.841641426086, 0, 0, 135 )
		_G["BaggageTrailer2"..pname] = createVehicle ( 606, -1258.3664550781, 29.416164398193, 13.841641426086, 0, 0, 135 )
		_G["BaggageTrailer3"..pname] = createVehicle ( 607, -1255.9699707031, 27.217338867188, 13.841641426086, 0, 0, 135 )
		setElementDimension ( _G["Baggage"..pname], dim )
		setElementDimension ( _G["BaggageTrailer1"..pname], dim )
		setElementDimension ( _G["BaggageTrailer2"..pname], dim )
		setElementDimension ( _G["BaggageTrailer3"..pname], dim )
		setElementDimension ( player, dim )
		warpPedIntoVehicle ( player, _G["Baggage"..pname] )
		outputChatBox ( "[AUFGABE]: Liefere das Gepäck zu den Flugzeugen!", player, 0, 100, 200 )
		addEventHandler ( "onVehicleExit", _G["Baggage"..pname], leaveAirport )
		addEventHandler ( "onPlayerWasted", _G["Baggage"..pname], leaveAirport )
	end
end
addEvent ( "airportjobDimFix", true )
addEventHandler ( "airportjobDimFix", getRootElement(), airportjobDimFix_func )

function killTrailer_func ( player, trailer )

	local pname = getPlayerName ( player )
	if player == client then
		if isElement ( trailer ) then
			destroyElement ( trailer )
		end
	end
end
addEvent ( "killTrailer", true )
addEventHandler ( "killTrailer", getRootElement(), killTrailer_func )

function baggageMissionComplete_func ( player )

	if player == client then
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		local dist = getDistanceBetweenMinutes ( laGetElementData ( player, "jobStartedM" ), laGetElementData ( player, "jobStartedH" ), minutes, hour )
		if dist >= 1 then
			local veh = getPedOccupiedVehicle ( player )
			local trailer = getVehicleTowedByVehicle ( veh )
			laSetElementData ( player, "isinairportmission", false )
			local pname = getPlayerName ( player )
			removePedFromVehicle ( player )
			setElementDimension ( player, 0 )
			outputChatBox ( "Auftrag abgeschlossen! Du erhältst 100$!", player, 0, 125, 0 )
			increaseAirportLevel ( player, 1 )
			local pmoney = laGetElementData ( player, "money" )
			laSetElementData ( player, "money", pmoney +100 )
			givePlayerMoney ( player, 100 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )	
			setElementPosition ( player, -1417.6236572266, -302.36517333984, 5.8523507118225 )
			setElementPosition ( veh, 999999, 999999, -50 )
			setElementPosition ( trailer, 999999, 999999, -50 )
			destroyElement ( veh )
			destroyElement ( trailer )
		end
	end
end
addEvent ( "baggageMissionComplete", true )
addEventHandler ( "baggageMissionComplete", getRootElement(), baggageMissionComplete_func )

function airportJobInsektenkiller_func ( player )

	if player == client then
		local t = getRealTime()
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		laSetElementData ( player, "jobStartedM", minutes )
		laSetElementData ( player, "jobStartedH", hour )
		
		laSetElementData ( player, "isinairportmission", true )
		local pname = getPlayerName ( player )
		local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
		_G["Cropduster"..pname] = createVehicle ( 512, -1432.7407226563, -953.34649658203, 201.60592651367, 0, 0, 270 )
		warpPedIntoVehicle ( player, _G["Cropduster"..pname] )
		setControlState ( player, "sub_mission", true )
		setTimer ( setControlState, 200, 1, player, "sub_mission", false )
		toggleControl ( player, "sub_mission", false )
		setElementDimension ( _G["Cropduster"..pname], dim )
		setElementDimension ( player, dim )
		addEventHandler ( "onVehicleExit", _G["Cropduster"..pname], leaveAirport )
		addEventHandler ( "onPlayerWasted", _G["Cropduster"..pname], leaveAirport )
	end
end
addEvent ( "airportJobInsektenkiller", true )
addEventHandler ( "airportJobInsektenkiller", getRootElement(), airportJobInsektenkiller_func )

function cropdusterMissionComplete_func ( player )

	if player == client then
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		local dist = getDistanceBetweenMinutes ( laGetElementData ( player, "jobStartedM" ), laGetElementData ( player, "jobStartedH" ), minutes, hour )
		if dist >= 1 then
			if laGetElementData ( player, "isinairportmission" ) then	
				local t = getRealTime()
				local minutes = t.minute 
				local hour = t.hour
				laSetElementData ( player, "jobStartedM", minutes )
				laSetElementData ( player, "jobStartedH", hour )
			
				toggleControl ( player, "sub_mission", true )
				laSetElementData ( player, "isinairportmission", false )
				local pname = getPlayerName ( player )
				local veh = getPedOccupiedVehicle ( player )
				removePedFromVehicle ( player )
				if getElementModel ( veh ) == 512 then
					setElementPosition ( veh, 999999, 999999, -50 )
					destroyElement ( veh )
				end
				setElementDimension ( player, 0 )
				outputChatBox ( "Auftrag abgeschlossen! Du erhältst 250$!", player, 0, 125, 0 )
				increaseAirportLevel ( player, 2 )
				local pmoney = laGetElementData ( player, "money" )
				laSetElementData ( player, "money", pmoney + 250 )
				givePlayerMoney ( player, 250 )
				triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )	
				setElementPosition ( player, -1417.6236572266, -302.36517333984, 5.8523507118225 )
			end
		end
	end
end
addEvent ( "cropdusterMissionComplete", true )
addEventHandler ( "cropdusterMissionComplete", getRootElement(), cropdusterMissionComplete_func )

function increaseAirportLevel ( player, lvl )

	local airportlvl = tonumber ( laGetElementData ( player, "airportlvl" ) )
	if airportlvl < 20 then
		if airportlvl + lvl >= 20 then
			laSetElementData ( player, "airportlvl", 20 )
			outputChatBox ( "[INFO]: Dein Flughafenlevel ist nun auf Maximum.", player, 200, 200, 0 )
			triggerClientEvent ( player, "showAchievmentBox", player, " From Zero\n to Hero", 25, 10000 )
			laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 25 )
		else
			laSetElementData ( player, "airportlvl", airportlvl + lvl )
			outputChatBox ( "[INFO]: Dein Flughafenlevel wurde erhöht und liegt jetzt bei "..airportlvl+lvl.."/20", player, 150, 150, 0 )
		end
	end
end

function destroyFlights_func ( player)
	local pname = getPlayerName ( player )
	setElementPosition ( _G["BaggageTrailer1"..pname], 999999, 999999, -50 )
	setElementPosition (  _G["BaggageTrailer2"..pname], 999999, 999999, -50 )
	setElementPosition ( _G["BaggageTrailer3"..pname], 999999, 999999, -50 )
	setElementPosition ( _G["Plane"..pname], 999999, 999999, -50 )
	setElementPosition ( _G["Cropduster"..pname], 999999, 999999, -50 )
	destroyElement ( _G["BaggageTrailer1"..pname] )
	destroyElement ( _G["BaggageTrailer2"..pname] )
	destroyElement ( _G["BaggageTrailer3"..pname] )
	destroyElement ( _G["Plane"..pname] )
	destroyElement ( _G["Cropduster"..pname] )
end

function airportJobFlight_func ( player, veh, x, y, z, rot )

	if player == client then
		destroyFlights_func(player)
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		laSetElementData ( player, "jobStartedM", minutes )
		laSetElementData ( player, "jobStartedH", hour )
		
		laSetElementData ( player, "isinairportmission", true )
		local pname = getPlayerName ( player )
		local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
		_G["Plane"..pname] = createVehicle ( veh, x, y, z, 0, 0, rot )
		warpPedIntoVehicle ( player, _G["Plane"..pname] )
		setElementDimension ( _G["Plane"..pname], dim )
		setElementDimension ( player, dim )
		addEventHandler ( "onVehicleExit", _G["Plane"..pname], leaveAirport )
		addEventHandler ( "onPlayerWasted", _G["Plane"..pname], leaveAirport )
	end
end
addEvent ( "airportJobFlight", true )
addEventHandler ( "airportJobFlight", getRootElement(), airportJobFlight_func )

function airportJobFreightFinished_func ( player, vehid )

	if player == client then
		-- ANTICHEAT --
		
		-- ANTICHEAT --
		
		if laGetElementData ( player, "isinairportmission" ) then
			laSetElementData ( player, "isinairportmission", false )
			local veh = getPedOccupiedVehicle ( player )
			removePedFromVehicle ( player )
			setElementDimension ( player, 0 )
			if vehid == 593 or vehid == 511 then
				local t = getRealTime()
				local minutes = t.minute 
				local hour = t.hour
				local dist = getDistanceBetweenMinutes ( laGetElementData ( player, "jobStartedM" ), laGetElementData ( player, "jobStartedH" ), minutes, hour )
				if dist >= 2 then
					destroyElement ( veh )
					setElementPosition ( veh, 999999, 999999, -50 )
					earned = 400
				end
			elseif vehid == 553 or vehid == 519 then
			local t = getRealTime()
				local minutes = t.minute 
				local hour = t.hour
				local dist = getDistanceBetweenMinutes ( laGetElementData ( player, "jobStartedM" ), laGetElementData ( player, "jobStartedH" ), minutes, hour )
				if dist >= 1 then
					destroyElement ( veh )
					setElementPosition ( veh, 999999, 999999, -50 )
					earned = 600
				end
			elseif vehid == 592 or vehid == 577 then
				local t = getRealTime()
				local minutes = t.minute 
				local hour = t.hour
				local dist = getDistanceBetweenMinutes ( laGetElementData ( player, "jobStartedM" ), laGetElementData ( player, "jobStartedH" ), minutes, hour )
				if dist >= 1 then
					destroyElement ( veh )
					setElementPosition ( veh, 999999, 999999, -50 )
					earned = 1000
				end
			end
			outputChatBox ( "Auftrag abgeschlossen! Du erhältst "..earned.."$!", player, 0, 125, 0 )
			increaseAirportLevel ( player, 2 )
			local pmoney = laGetElementData ( player, "money" )
			laSetElementData ( player, "money", pmoney + earned )
			givePlayerMoney ( player, earned )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )	
			setElementPosition ( player, -1417.6236572266, -302.36517333984, 5.8523507118225 )
		end
	end
end
addEvent ( "airportJobFreightFinished", true )
addEventHandler ( "airportJobFreightFinished", getRootElement(), airportJobFreightFinished_func )

--[[function cancelAirportMission ( veh )

	if laGetElementData ( source, "isinairportmission" ) then
		if not getPedOccupiedVehicle ( source ) then
			if laGetElementData ( source, "isinairportmission" ) then
				local pname = getPlayerName ( source )
				if flughafenModels [ getElementModel ( veh ) ] then
					destroyElement ( veh )
					killTrailer_func ( source, 1 )
					killTrailer_func ( source, 2 )
					killTrailer_func ( source, 3 )
					setElementDimension ( source, 0 )
					toggleControl ( source, "sub_mission", true )
					laSetElementData ( source, "isinairportmission", false )
					outputChatBox ( "Auftrag gescheitert - Du hast das Fahrzeug verlassen!", source, 125, 0, 0 )
					setElementPosition ( source, -1417.6236572266, -302.36517333984, 5.8523507118225 )
				end
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), cancelAirportMission )]]