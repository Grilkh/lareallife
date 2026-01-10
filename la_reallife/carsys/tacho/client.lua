------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local sx, sy = guiGetScreenSize()
local enabled = true

local KMDistance = 0
local maxDistanceKilometer = 999999

addEventHandler("onClientPreRender", getRootElement(), function()
	if(isPedInVehicle(gMe) == true) and (getPedOccupiedVehicle(gMe)) and (enabled == true) then
		local veh = getPedOccupiedVehicle(gMe)
		-- TACHO RENDER --
		-- RENDER BACKGROUND --
		dxDrawRectangle(sx-2, sy-2, (-400/1920*sx), (-286/1080*sy), tocolor(0, 0, 0, 150))
		local r, g, b = 100, 100, 100
		if(getVehicleEngineState(veh) == true) then
			r, g, b= 255, 255, 255
		end
		dxDrawImage(sx-2-(400/1920*sx), sy-2-(286/1080*sy), (400/1920*sx), (286/1080*sy), "images/tacho/background.png", 0, 0, 0, tocolor(r, g, b, 255))
	
		-- FUEL --
		local vehFuel = tonumber(getElementData ( veh, "fuelstate" ))
		if not vehFuel then
			setElementData ( veh, "fuelstate", 100 )
			vehFuel = 100
		end	
		if(vehFuel > 100) or (vehFuel < 0) then vehFuel = 0 end
		if vehFuel <= 0 then
			r, g, b = 0, 0, 0
								
		else
			vehFuel = math.abs ( vehFuel - 0.01 )
			r, g, b = ( 100 - vehFuel ) * 2.55 / 2, ( vehFuel * 2.55 ), 0
		end
		dxDrawImage(sx-(240/1920*sx), sy-(180/1080*sy), ((vehFuel/100*80)/1920*sx), (20/1080*sy), "images/tacho/fuelkasten.png", 0, 0, 0, tocolor(r, g, b, 255))
		dxDrawImage(sx-(240/1920*sx), sy-(180/1080*sy), (80/1920*sx), (20/1080*sy), "images/tacho/kasten.png", 0, 0, 0, tocolor(255, 255, 255, 150))
		dxDrawImage(sx-(215/1920*sx), sy-(183/1080*sy), (25/1920*sx), (25/1080*sy), "images/tacho/fuel.png", 0, 0, 0, tocolor(0, 0, 0, 225))
		-- NADEL --
		r, g, b = 150, 150, 150
		if(getVehicleOverrideLights(veh) == 2) then
			r, g, b= 255, 255, 255
		end
		local x,y,z = getElementVelocity(veh)
		local speed = (x^2 + y^2 + z^2) ^ 0.5 * 1.61 * 100
		if(speed < 1) then speed = 0 end
		dxDrawImage(sx-2-(320/1920*sx), sy-2-(220/1080*sy), ((240)/1920*sx), ((259)/1080*sy), "images/tacho/nadel.png", speed-150, 0, 0, tocolor(r, g, b, 255))
		-- KILOMETERSTAND
		local fontbig = 1.5
		fontbig = fontbig/1920*sx
		local NR1, NR2, NR3, NR4, NR5, NR6 = getVehicleTraveledDistance ( veh )
		-- dxDrawText(NR1..NR2..NR3..NR4..NR5..NR6, sx-(238/1920*sx), sy-(40/1080*sy), sx-(240/1920*sx), sy-(180/1080*sy), tocolor(0, 0, 0, 200), fontbig, "default-bold")
		if NR1 == nil then
			outputDebugString("Vehicle -> "..tostring( veh ))
			outputDebugString("NR1 -> "..tostring(NR1).." NR2 -> "..tostring(NR2).." NR3 -> "..tostring(NR3).." NR4 -> "..tostring(NR4).." NR5 -> "..tostring(NR5).." NR6 -> "..tostring(NR6))
		else	
			dxDrawText(NR1..NR2..NR3..NR4..NR5..NR6, sx-(238/1920*sx), sy-(40/1080*sy), sx-(240/1920*sx), sy-(180/1080*sy), tocolor(0, 0, 0, 200), fontbig, "default-bold")
		end
	end
end)


function refreshVehDistance_client ()
	veh = getPedOccupiedVehicle ( gMe )
	if veh then
		if getPedOccupiedVehicleSeat ( gMe ) == 0 then
			if not getElementData ( veh, "distance" ) then
			else
				triggerServerEvent ( "refreshVehDistance", getRootElement(), veh, KMDistance + getElementData ( veh, "distance" ) )
				KMDistance = 0
				setTimer ( refreshVehDistance_client, 60000, 1 )
			end
		end
	end
end

function getDistanceTraveled ( veh, x1, y1, z1 )
	local veh = getPedOccupiedVehicle ( gMe )
	if veh then
		if getPedOccupiedVehicleSeat ( gMe ) == 0 then
			local x2, y2, z2 = getElementPosition ( veh )
			local nd = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / 100
			KMDistance = KMDistance + nd
			setTimer ( getDistanceTraveled, 500, 1, veh, x2, y2, z2 )
		end
	end
end

function getVehicleTraveledDistance ( veh )
	if veh then
		local dis = getElementData ( veh, "distance" )
	else
		outputDebugString("[ERROR] Vehicle is not set in Function getVehicleTraveledDistance!")
		return 9,9,9,9,9,9
	end
	if not dis then
		setElementData ( veh, "distance", 0 )
		outputDebugString("Distance is not set for vehicle -> "..tostring(veh))
		dis = 0
	end
	if dis then
		distance = math.floor ( dis ) + math.floor ( KMDistance )
		if distance > maxDistanceKilometer then
			setElementData ( veh, "distance", 0, true )
		end
		minus = math.abs ( ( # ( tostring ( distance ) ) ) - 6 )
		for i = 1, 6 do
			_G["v"..i] = 0
		end
		counter = 0
		while counter < 10 do 
			i = # ( tostring ( distance ) ) - 1
			z = math.floor ( distance / ( 10 ^ ( i ) ) )
			distance = distance - z * ( 10 ^ ( i ) )
			counter = counter + 1
			_G["v"..(counter+minus)] = z
		end
		return v1, v2, v3, v4, v5, v6
	end
end

addEventHandler("onClientVehicleStartExit", root,
	function(thePlayer)
		if thePlayer == gMe then
			enabled = false
			KMDistance = 0
		end
	end
)

local function showSpeedometer()
	local x1, y1, z1 = getElementPosition ( getPedOccupiedVehicle ( gMe ) )
	refreshVehDistance_client ()
	getDistanceTraveled ( getPedOccupiedVehicle ( gMe ), x1, y1, z1 )
	enabled = true
end

addEventHandler("onClientVehicleEnter", root,
	function(player, seat)
		if (player == gMe) then
			if (seat == 0) then
				showSpeedometer()

			end
		end
	end
)

function getPedOccupiedVehicleSeat ( player )
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		for i = 0, getVehicleMaxPassengers ( veh ) do
			if getVehicleOccupant ( veh, i ) == player then
				return i
			end
		end
	else
		return false
	end
end