------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

local robdim = 0
local robfaction

local DonutMarkerIn = createMarker(-2767.870, 788.8588, 52.68125, "corona", 1.5, 0, 255, 0, 150)

local function DonutTelIn (hitElement, dim)
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			setElementPosition(hitElement, 377.131, -192.052, 1000.6328)
			setElementInterior(hitElement, 17)
			infobox ( hitElement, "\n\nWillkommen im Donutladen.", 5000, 0, 125, 0 )
			--outputBadLog ( getPlayerName ( hitElement ).." hat den Donutladen betreten." )
			if donuttransport == 1 then
				setPedAnimation(donutshopped, "ped", "cower")
			else
			setPedAnimation(donutshopped, "dealer", "dealer_deal",-1)
			end
		end
	end
end
addEventHandler("onMarkerHit",DonutMarkerIn,DonutTelIn)

local DonutMarkerOut = createMarker(377.1536, -192.9832, 1000.5, "corona", 1.5, 0, 255, 0, 150)
setElementInterior (DonutMarkerOut, 17)

local function DonutTelOut(hitElement, dim)
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			setElementPosition(hitElement, -2765.870, 788.8588, 52.78125)
			setElementInterior(hitElement, 0)
		end
	end
end
addEventHandler("onMarkerHit",DonutMarkerOut,DonutTelOut)

function robdonut_func ( player, cmd )
local pdim = getElementDimension (player)
	if pdim == robdim then
		setPedAnimation(donutshopped, "ped", "cower")
		setTimer(createDonutDeliverMarker,1000,1,player)
		local x, y, z = getElementPosition ( player )
		local px, py, pz = -106, -11, 1000
		local msg = "[ILLEGAL]: Der Donutladen wird überfallen!"
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
		outputLog ( "[DONUTLADEN]: "..getPlayerName(player).." ("..robfaction..") ueberfaellt den Donutladen!", "bad")
		setElementPosition(player, -2777.1, 766.536, 51.376)
		setElementInterior(player, 0)
		donutcar = createVehicle ( 423, -2777.1, 766.536, 51.376, 0, 0, 90, "DONUT" )
		setVehiclePaintjob ( donutcar, 0 )
		setVehicleColor (donutcar, 1, 1, 1, 0 )
		warpPedIntoVehicle ( player, donutcar )
		laSetElementData ( donutcar, "donuttruck", 1 )
		laSetElementData ( donutcar, "illegalcar", 1 )
		if laGetElementData ( player, "wanteds" ) >= 4 then
			laSetElementData ( player, "wanteds", 6 )
		else
			laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 2 )
		end
		setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
		setTimer(donuttimer, 10800000, 1)
		donuttimerTime = setTimer(raubueberfalldonuttimer, 900000, 1)
	end
end
addEventHandler ( "robdonut", getRootElement(), robdonut_func )


function donuttimer()
	if donuttransport == 1 then
		donuttransport = 0
		setPedAnimation(donutshopped, "dealer", "dealer_deal",-1)
	end
end

function raubueberfalldonuttimer()
	if raubueberfall == 1 then
		raubueberfall = 0
		donutunterwegs = 0
		setElementVisibleTo ( DonutDeliver, getRootElement(), false )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), false )
		destroyElement( DonutDeliver )
		destroyElement( DonutDeliverBlip )
	end
end

function createDonutDeliverMarker ()
local rnd = math.random ( 1, 4 )
	if rnd == 1 then
		DonutDeliver = createMarker ( 2625.2678, 824.0264, 4.3157, "checkpoint", 7, 0, 125, 0, getRootElement() )
		DonutDeliverBlip = createBlip ( 2625.2678, 824.0264, 5.3157, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), true )
	elseif rnd == 2 then
		DonutDeliver = createMarker ( 2843.221, 1675.5335, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		DonutDeliverBlip = createBlip ( 2843.221, 1675.5335, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), true )
	elseif rnd == 3 then
		DonutDeliver = createMarker ( 2255.545, 2051.341, 9.820, "checkpoint", 7, 0, 125, 0, getRootElement() )
		DonutDeliverBlip = createBlip ( 2255.545, 2051.341, 10.820, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), true )
	elseif rnd == 4 then
		DonutDeliver = createMarker ( 1664.414, 1935.505, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		DonutDeliverBlip = createBlip ( 1664.414, 1935.505, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), true )
	end

local function DonutDeliver_func ( hitElement, dim )
local bezahlung = math.random ( 5000, 7500 )
local bezahlungzuruck = math.random ( 500, 750 )
	local veh = getPedOccupiedVehicle ( hitElement )
	if veh then
		if getPedOccupiedVehicleSeat ( hitElement ) == 0 then
			if veh == donutcar then
				if donutunterwegs == 1 then
					if isEvil( hitElement ) then
						outputChatBox ( "Donutcar abgegeben. Du erhältst "..bezahlung.."$ für diese Lieferung!", hitElement, 0, 125, 0 )
						local robfactionnew = laGetElementData (hitElement, "fraktion")
						local msg = "[DONUTLADEN]: Der Überfall wurde erfolgreich beendet!"
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
						outputLog ( "[DONUTLADEN]: "..getPlayerName(hitElement).." ("..robfactionnew..") hat das Donutcar abgeliefert!", "bad")
						local pmoney = laGetElementData ( hitElement, "money" )
						laSetElementData ( hitElement, "money", pmoney + bezahlung )
						givePlayerMoney(hitElement, bezahlung)
					else
						outputChatBox ( "Donutcar abgegeben. Danke für deine Mithilfe! Belohnung: "..bezahlungzuruck.."$", hitElement, 0, 125, 0 )
						local msg = "[DONUTLADEN]: Der Überfall wurde erfolgreich verhindert!"
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
						outputLog ( "[DONUTLADEn]: "..getPlayerName ( hitElement ).." hat das Donutcar in Sicherheit gebracht!", "bad" )
						local pmoney = laGetElementData ( hitElement, "money" )
						laSetElementData ( hitElement, "money", pmoney + bezahlungzuruck )
						givePlayerMoney(hitElement, bezahlungzuruck)
					end
						triggerClientEvent ( hitElement, "HudEinblendenMoney", getRootElement() )
						destroyElement ( veh, "donutcar" )
						setElementVisibleTo ( DonutDeliver, getRootElement(), false )
						setElementVisibleTo ( DonutDeliverBlip, getRootElement(), false )
						destroyElement( DonutDeliver )
						destroyElement( DonutDeliverBlip )
						raubueberfall = 0
						donutunterwegs = 0
						killTimer(donuttimerTime)
						robfaction = nil
				else
					outputChatBox ( "Die Zeit ist bereits abgelaufen!", hitElement, 150, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", DonutDeliver, DonutDeliver_func )
end

local function vehicleDestroyedDonutTruck ()
	if laGetElementData ( source, "donuttruck" ) == 1 then
		raubueberfall = 0
		donutunterwegs = 0
		destroyElement ( veh, "donutcar" )
		destroyElement ( source )				
		setElementVisibleTo ( DonutDeliver, getRootElement(), false )
		setElementVisibleTo ( DonutDeliverBlip, getRootElement(), false )
		destroyElement ( DonutDeliver )
		destroyElement ( DonutDeliverBlip )
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[DONUTLADEN]: Der Transporter ist explodiert!"
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
		outputLog ( "[DONUTLADEN]: Der Transporter ist explodiert!", "bad")
		robfaction = nil
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedDonutTruck )