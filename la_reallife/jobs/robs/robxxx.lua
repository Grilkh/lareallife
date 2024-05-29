------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

local robdim = 0
local robfaction

local XXXMarkerIn = createMarker(-2159.33, 494.873, 33.8771, "cylinder", 1.5, 0, 255, 0, 150)

local function XXXTelIn(hitElement, dim)
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			setElementPosition(hitElement, -100.4, -23.66, 1000.71875)
			setElementInterior(hitElement, 3)
			infobox ( hitElement, "\n\nWillkommen im XXX-Shop,\nfühl dich wie zu Hause!", 5000, 0, 125, 0 )
			--outputBadLog ( getPlayerName ( hitElement ).." hat einen Shop betreten." )
			if xxxtransport == 1 then
				setPedAnimation(sexshopped, "ped", "cower")
			else
			setPedAnimation(sexshopped, "dealer", "dealer_deal",-1)
			end
		end
	end
end
addEventHandler("onMarkerHit",XXXMarkerIn,XXXTelIn)

local XXXMarkerOut = createMarker(-100.4, -24.46, 999.5, "cylinder", 1.5, 0, 255, 0, 150)
setElementInterior (XXXMarkerOut, 3)

local function XXXTelOut(hitElement, dim)
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			setElementPosition(hitElement, -2159.33, 496.25, 35.171)
			setElementInterior(hitElement, 0)
		end
	end
end
addEventHandler("onMarkerHit",XXXMarkerOut,XXXTelOut)

function robXXX_func ( player, cmd )
local pdim = getElementDimension (player)
	if pdim == robdim then
		setPedAnimation(sexshopped, "ped", "cower")
		setTimer(createXXXDeliverMarker,1000,1,player)
		local x, y, z = getElementPosition ( player )
		local px, py, pz = -106, -11, 1000
		local msg = "[ILLEGAL]: Der XXX-SHOP wird überfallen!"
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
		outputLog ( "[XXX-SHOP]: "..getPlayerName(player).." ("..robfaction..") ueberfaellt den XXX-SHOP!", "bad")
		setElementPosition(player, -2163.4094, 504.089, 34.657)
		setElementInterior(player, 0)
		XXXcar = createVehicle ( 414, -2163.4094, 501.089, 34.657, 0, 0, 270, "XXX" )
		setVehiclePaintjob ( XXXcar, 0 )
		setVehicleColor (XXXcar, 3, 3, 3, 0 )
		warpPedIntoVehicle ( player, XXXcar )
		laSetElementData ( XXXcar, "XXXtruck", 1 )
		laSetElementData ( XXXcar, "illegalcar", 1 )
		if laGetElementData ( player, "wanteds" ) >= 4 then
			laSetElementData ( player, "wanteds", 6 )
		else
			laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 2 )
		end
		setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
		giveWeapon ( player, 10, 1, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), 10, 1 )
		setTimer(xxxtransportertimer, 10800000, 1, "xxx")
		xxxtimerTime = setTimer(raubueberfallxxxtimer, 900000, 1)
	end
end
addEventHandler ( "robXXX", getRootElement(), robXXX_func )


function xxxtransportertimer()
	if xxxtransport == 1 then
		xxxtransport = 0
		setPedAnimation(sexshopped, "dealer", "dealer_deal",-1)
	end
end

function raubueberfallxxxtimer()
	if raubueberfall == 1 then
		raubueberfall = 0
		xxxunterwegs = 0
		setElementVisibleTo ( XXXDeliver, getRootElement(), false )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), false )
		destroyElement( XXXDeliver )
		destroyElement( XXXDeliverBlip )
	end
end

function createXXXDeliverMarker ()
local rnd = math.random ( 1, 4 )
	if rnd == 1 then
		XXXDeliver = createMarker ( 2625.2678, 824.0264, 4.3157, "checkpoint", 7, 0, 125, 0, getRootElement() )
		XXXDeliverBlip = createBlip ( 2625.2678, 824.0264, 5.3157, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), true )
	elseif rnd == 2 then
		XXXDeliver = createMarker ( 2843.221, 1675.5335, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		XXXDeliverBlip = createBlip ( 2843.221, 1675.5335, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), true )
	elseif rnd == 3 then
		XXXDeliver = createMarker ( 2255.545, 2051.341, 9.820, "checkpoint", 7, 0, 125, 0, getRootElement() )
		XXXDeliverBlip = createBlip ( 2255.545, 2051.341, 10.820, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), true )
	elseif rnd == 4 then
		XXXDeliver = createMarker ( 1664.414, 1935.505, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		XXXDeliverBlip = createBlip ( 1664.414, 1935.505, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), true )
	end

local function XXXDeliver_func ( player, dim )
local bezahlung = math.random ( 7500, 10000 )
local bezahlungzuruck = math.random ( 750, 1000 )
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if veh == XXXcar then
				if xxxunterwegs == 1 then
					if isEvil( player ) then
						outputChatBox ( "Fahrzeug abgegeben. Du erhältst "..bezahlung.."$ für diese Lieferung!", player, 0, 125, 0 )
						local robfactionnew = laGetElementData (player, "fraktion")
						local msg = "[XXX-SHOP]: Der Überfall wurde erfolgreich beendet!"
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
						outputLog ( "[XXX-SHOP]: "..getPlayerName(player).." ("..robfaction..") hat den Transporter abgeliefert!", "bad")
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney + bezahlung )
						givePlayerMoney(player, bezahlung)
					else
						outputChatBox ( "Fahrzeug abgegeben. Danke für deine Mithilfe! Belohnung: "..bezahlungzuruck.."$", player, 0, 125, 0 )
						local msg = "[XXX-SHOP]: Der Überfall wurde erfolgreich verhindert!"
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
						outputLog ( "[XXX-SHOP]: "..getPlayerName ( player ).." hat den Transporter in Sicherheit gebracht!", "bad" )
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney + bezahlungzuruck )
						givePlayerMoney(player, bezahlungzuruck )
					end
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						destroyElement ( veh, "XXXcar" )
						setElementVisibleTo ( XXXDeliver, getRootElement(), false )
						setElementVisibleTo ( XXXDeliverBlip, getRootElement(), false )
						destroyElement( XXXDeliver )
						destroyElement( XXXDeliverBlip )
						raubueberfall = 0
						xxxunterwegs = 0
						killTimer(xxxtimerTime)
						robfaction = nil
				else
					outputChatBox ( "Die Zeit ist bereits abgelaufen!", player, 150, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", XXXDeliver, XXXDeliver_func )
end

local function vehicleDestroyedXXXTruck ()
	if laGetElementData ( source, "XXXtruck" ) == 1 then
		raubueberfall = 0
		xxxunterwegs = 0
		destroyElement ( veh, "XXXcar" )
		destroyElement ( source )				
		setElementVisibleTo ( XXXDeliver, getRootElement(), false )
		setElementVisibleTo ( XXXDeliverBlip, getRootElement(), false )
		destroyElement ( XXXDeliver )
		destroyElement ( XXXDeliverBlip )
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[XXX-SHOP]: Der Transporter ist explodiert!"
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
		outputLog ( "[XXX-SHOP]: Der Transporter ist explodiert!", "bad")
		robfaction = nil
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedXXXTruck )