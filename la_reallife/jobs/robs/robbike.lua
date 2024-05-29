------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

local robdim = 0
local robfaction

function robbike_func ( player, cmd )
local pdim = getElementDimension (player)
	if pdim == robdim then
		setPedAnimation(bikeshopped, "ped", "cower")
		setTimer(createBikeDeliverMarker,1000,1,player)
		local x, y, z = getElementPosition ( player )
		local px, py, pz = -106, -11, 1000
		local msg = "[ILLEGAL]: Misty's wird überfallen!"
		local fraktion = laGetElementData (player, "fraktion")
		robfaction = fraktion
		sendMSGForFaction ( msg, 1, 200, 0, 0 )
		if robfaction ~= 2 then
			sendMSGForFaction ( msg, 2, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 3, 200, 0, 0 )
		sendMSGForFaction ( msg, 6, 200, 0, 0 )
		if robfaction ~= 7 then
			sendMSGForFaction ( msg, 7, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 8, 200, 0, 0 )
		if robfaction ~= 9 then
			sendMSGForFaction ( msg, 9, 200, 200, 0 )
		end
		if robfaction ~= 10 then
			sendMSGForFaction ( msg, 10, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
		outputLog ( "[MISTYS]: "..getPlayerName(player).." ("..robfaction..") ueberfaellt Misty's Bar!", "bad")
		setElementPosition(player, -2240.939, -93.5328, 35.320)
		setElementInterior(player, 0)
		bikecar = createVehicle ( 463, -2243.939, -93.5328, 35.320, 0, 0, 90, "BIKE" )
		setVehiclePaintjob ( bikecar, 0 )
		setVehicleColor (bikecar, 2, 2, 2, 0 )
		warpPedIntoVehicle ( player, bikecar )
		laSetElementData ( bikecar, "biketruck", 1 )
		laSetElementData ( bikecar, "illegalcar", 1 )
		if laGetElementData ( player, "wanteds" ) >= 4 then
			laSetElementData ( player, "wanteds", 6 )
		else
			laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 2 )
		end
		setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
		setTimer(biketimer, 10800000, 1)
		biketimerTime = setTimer(raubueberfallbiketimer, 900000, 1)
	end
end
addEventHandler ( "robbike", getRootElement(), robbike_func )


function biketimer()
	if biketransport == 1 then
		biketransport = 0
		setPedAnimation(bikeshopped, "dealer", "dealer_deal",-1)
	end
end

function raubueberfallbiketimer()
	if raubueberfall == 1 then
		raubueberfall = 0
		bikeunterwegs = 0
		setElementVisibleTo ( BikeDeliver, getRootElement(), false )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), false )
		destroyElement( BikeDeliver )
		destroyElement( BikeDeliverBlip )
	end
end

function createBikeDeliverMarker ()
local rnd = math.random ( 1, 4 )
	if rnd == 1 then
		BikeDeliver = createMarker ( 2625.2678, 824.0264, 4.3157, "checkpoint", 7, 0, 125, 0, getRootElement() )
		BikeDeliverBlip = createBlip ( 2625.2678, 824.0264, 5.3157, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), true )
	elseif rnd == 2 then
		BikeDeliver = createMarker ( 2843.221, 1675.5335, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		BikeDeliverBlip = createBlip ( 2843.221, 1675.5335, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), true )
	elseif rnd == 3 then
		BikeDeliver = createMarker ( 2255.545, 2051.341, 9.820, "checkpoint", 7, 0, 125, 0, getRootElement() )
		BikeDeliverBlip = createBlip ( 2255.545, 2051.341, 10.820, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), true )
	elseif rnd == 4 then
		BikeDeliver = createMarker ( 1664.414, 1935.505, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		BikeDeliverBlip = createBlip ( 1664.414, 1935.505, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), true )
	end

local function BikeDeliver_func ( hitElement, dim )
local bezahlung = math.random ( 2500, 5000 )
local bezahlungzuruck = math.random ( 250, 500 )  
	local veh = getPedOccupiedVehicle ( hitElement )
	if veh then
		if getPedOccupiedVehicleSeat ( hitElement ) == 0 then
			if veh == bikecar then
				if bikeunterwegs == 1 then
					if isEvil( hitElement ) then
						outputChatBox ( "Motorrad abgegeben! Du erhältst "..bezahlung.."$ für diese Lieferung!", hitElement, 0, 125, 0 )
						local robfactionnew = laGetElementData (hitElement, "fraktion")
						local msg = "[MISTYS]: Der Überfall wurde erfolgreich beendet!"
						sendMSGForFaction ( msg, 1, 200, 0, 0 )
						if robfactionnew == robfaction then
							if robfaction ~= 2 then
								sendMSGForFaction ( msg, 2, 200, 200, 0 )
							end
							sendMSGForFaction ( msg, 3, 200, 0, 0 )
							sendMSGForFaction ( msg, 6, 200, 0, 0 )
							if robfaction ~= 7 then
								sendMSGForFaction ( msg, 7, 200, 200, 0 )
							end
							sendMSGForFaction ( msg, 8, 200, 0, 0 )
							if robfaction ~= 9 then
								sendMSGForFaction ( msg, 9, 200, 200, 0 )
							end
							if robfaction ~= 10 then
								sendMSGForFaction ( msg, 10, 200, 200, 0 )
							end
							sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
						else
							if robfactionnew ~= 2 then
								if robfaction ~= 2 then
									sendMSGForFaction ( msg, 2, 200, 200, 0 )
								else
									sendMSGForFaction ( msg, 2, 200, 0, 0 )
								end
							end
							sendMSGForFaction ( msg, 3, 200, 0, 0 )
							sendMSGForFaction ( msg, 6, 200, 0, 0 )
							if robfactionnew ~= 7 then
								if robfaction ~= 7 then
									sendMSGForFaction ( msg, 7, 200, 200, 0 )
								else
									sendMSGForFaction ( msg, 7, 200, 0, 0 )
								end
							end
							sendMSGForFaction ( msg, 8, 200, 0, 0 )
							if robfactionnew ~= 9 then
								if robfaction ~= 9 then
									sendMSGForFaction ( msg, 9, 200, 200, 0 )
								else
									sendMSGForFaction ( msg, 9, 200, 0, 0 )
								end
							end
							if robfactionnew ~= 10 then
								if robfaction ~= 10 then
									sendMSGForFaction ( msg, 10, 200, 200, 0 )
								else
									sendMSGForFaction ( msg, 10, 200, 0, 0 )
								end
							end
							sendMSGForFaction ( msg, robfactionnew, 0, 150, 0 )
						end
						outputLog ( "[MISTYS]: "..getPlayerName(hitElement).." ("..robfactionnew..") hat das Motorrad abgeliefert!", "bad")
						local pmoney = laGetElementData ( hitElement, "money" )
						laSetElementData ( hitElement, "money", pmoney + bezahlung )
						givePlayerMoney(hitElement, bezahlung)
					else
						outputChatBox ( "Motorrad abgegeben! Danke für deine Mithilfe! Belohnung: "..bezahlungzuruck.."$", hitElement, 0, 125, 0 )
						local msg = "[MISTYS]: Der Überfall wurde erfolgreich verhindert!"
						sendMSGForFaction ( msg, 1, 0, 150, 0 )
						if robfaction ~= 2 then
							sendMSGForFaction ( msg, 2, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 3, 0, 150, 0 )
						sendMSGForFaction ( msg, 6, 0, 150, 0 )
						if robfaction ~= 7 then
							sendMSGForFaction ( msg, 7, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 8, 0, 150, 0 )
						if robfaction ~= 9 then
							sendMSGForFaction ( msg, 9, 200, 200, 0 )
						end
						if robfaction ~= 10 then
							sendMSGForFaction ( msg, 10, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
						outputLog ( "[MISTYS]: "..getPlayerName ( hitElement ).." hat das Motorrad in Sicherheit gebracht!", "bad" )
						local pmoney = laGetElementData ( hitElement, "money" )
						laSetElementData ( hitElement, "money", pmoney + bezahlungzuruck )
						givePlayerMoney(hitElement, bezahlungzuruck)
					end
						triggerClientEvent ( hitElement, "HudEinblendenMoney", getRootElement() )
						destroyElement ( veh, "bikecar" )
						setElementVisibleTo ( BikeDeliver, getRootElement(), false )
						setElementVisibleTo ( BikeDeliverBlip, getRootElement(), false )
						destroyElement( BikeDeliver )
						destroyElement( BikeDeliverBlip )
						raubueberfall = 0
						bikeunterwegs = 0
						killTimer(biketimerTime)
						robfaction = nil
				else
					outputChatBox ( "Die Zeit ist bereits abgelaufen!", hitElement, 150, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", BikeDeliver, BikeDeliver_func )
end

local function vehicleDestroyedBikeTruck ()
	if laGetElementData ( source, "biketruck" ) == 1 then
		raubueberfall = 0
		bikeunterwegs = 0
		destroyElement ( veh, "bikecar" )
		destroyElement ( source )				
		setElementVisibleTo ( BikeDeliver, getRootElement(), false )
		setElementVisibleTo ( BikeDeliverBlip, getRootElement(), false )
		destroyElement ( BikeDeliver )
		destroyElement ( BikeDeliverBlip )
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[MISTYS]: Das Motorrad ist explodiert!"
		sendMSGForFaction ( msg, 1, 0, 150, 0 )
		if robfaction ~= 2 then
			sendMSGForFaction ( msg, 2, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 3, 0, 150, 0 )
		sendMSGForFaction ( msg, 6, 0, 150, 0 )
		if robfaction ~= 7 then
			sendMSGForFaction ( msg, 7, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 8, 0, 150, 0 )
		if robfaction ~= 9 then
			sendMSGForFaction ( msg, 9, 200, 200, 0 )
		end
		if robfaction ~= 10 then
			sendMSGForFaction ( msg, 10, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
		outputLog ( "[MISTYS]: Das Motorrad ist explodiert!", "bad")
		robfaction = nil
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedBikeTruck )