------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local robdim = 0

local RobMarkerOut = createMarker(-2649.9, 376.2, 5.1999998092651, "cylinder", 1.5, 255, 0, 0)

local function RobTel(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, -100.4, -23.7, 1000)
		setElementInterior(hitElement, 3)
		infobox ( hitElement, "\n\nWillkommen im XXX-Shop,\nfühl dich wie zu Hause!", 5000, 0, 125, 0 )
		outputBadLog ( getPlayerName ( hitElement ).." hat einen Shop betreten." )
		if xxxtransport == 1 then
			setPedAnimation(sexshopped, "ped", "cower")
		else
		setPedAnimation(sexshopped, "dealer", "dealer_deal",-1)
		end
	end
end
end
addEventHandler("onMarkerHit",RobMarkerOut,RobTel)

local Rob2MarkerOut = createMarker(-113.80001068115, -7.9625797271729, 1000, "cylinder", 1.5, 255, 0, 0)
setElementInterior (Rob2MarkerOut, 3)

local function Rob2Tel(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, -2622, 377, 7)
		setElementInterior(hitElement, 0)
	end
end
end
addEventHandler("onMarkerHit",Rob2MarkerOut,Rob2Tel)

function robbank_func ( player, cmd )
local pdim = getElementDimension (player)
if pdim == robdim then
	--if isEvil( player ) then
		local x, y, z = getElementPosition ( player )
		local px, py, pz = -106, -11, 1000
			outputChatBox ( "Der XXX-Shop wird überfallen!", getRootElement(), 125, 0, 0 )
			setElementPosition(player, -2622, 377, 7)
			setElementInterior(player, 0)
			robsecur = createVehicle ( 428, -2615, 352, 5, 0, 0, 180, "MONEY" )
			setVehiclePaintjob ( robsecur, 0 )
			setVehicleColor (robsecur, 0, 0, 0, 0 )
			warpPedIntoVehicle ( player, robsecur )
			laSetElementData ( robsecur, "robtruck", 1 )
			if laGetElementData ( player, "wanteds" ) >= 3 then
				laSetElementData ( player, "wanteds", 6 )
			else
				laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 3 )
			end
			setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
			giveWeapon ( player, 10, 1, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), 10, 1 )
			setTimer(xxxtransportertimer, 2400000, 1)
			setTimer(raubueberfallxxxtimer, 300000, 1)
end
end
addEventHandler ( "robbank", getRootElement(), robbank_func )


function xxxtransportertimer()
	if xxxtransport == 1 then
	xxxtransport = 0
	setPedAnimation(sexshopped, "dealer", "dealer_deal",-1)
	end
end

function raubueberfallxxxtimer()
	if raubueberfall == 1 then
		raubueberfall = 0
	end
end

function createRobDeliverMarker ()
	local rnd = math.random ( 1, 4 )

	if rnd == 1 then
		RobDeliver = createMarker ( 2625.2678, 824.0264, 4.3157, "checkpoint", 7, 0, 125, 0, getRootElement() )
		RobDeliverBlip = createBlip ( 2625.2678, 824.0264, 5.3157, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( RobDeliverBlip, getRootElement(), true )
	elseif rnd == 2 then
		RobDeliver = createMarker ( 2843.221, 1675.5335, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		RobDeliverBlip = createBlip ( 2843.221, 1675.5335, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( RobDeliverBlip, getRootElement(), true )
	elseif rnd == 3 then
		RobDeliver = createMarker ( 2255.545, 2051.341, 9.820, "checkpoint", 7, 0, 125, 0, getRootElement() )
		RobDeliverBlip = createBlip ( 2255.545, 2051.341, 10.820, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( RobDeliverBlip, getRootElement(), true )
	else
		RobDeliver = createMarker ( 1664.414, 1935.505, 9.82, "checkpoint", 7, 0, 125, 0, getRootElement() )
		RobDeliverBlip = createBlip ( 1664.414, 1935.505, 10.82, 51, 1, 255, 0, 0, 255, 0, 99999 )
		setElementVisibleTo ( RobDeliverBlip, getRootElement(), true )
	end

	addEventHandler ( "onMarkerHit", RobDeliver, RobDeliver_func )
end

function RobDeliver_func ( player, dim )
	local veh = getPedOccupiedVehicle ( player )

	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if veh == robsecur then
				if isEvil( player ) then
					outputChatBox ( "Truck abgegeben - Du erhältst 10.000$ für diese Lieferung!", player, 0, 125, 0 )
					outputBadLog ( getPlayerName ( player ).." hat den Truck abgeliefert!" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 10000 )
					givePlayerMoney ( player, 10000 )
					destroyElement ( veh, "robsecur" )
					destroyElement( RobDeliver )
					setElementVisibleTo ( RobDeliver, getRootElement(), false )
					setElementVisibleTo ( RobDeliverBlip, getRootElement(), false )
					raubueberfall = 0
				else
					outputChatBox ( "Truck abgegeben - Danke für deine Mithilfe! Belohnung: 1000$", player, 0, 125, 0 )
					outputBadLog ( getPlayerName ( player ).." hat den Truck in Sicherheit gebracht!" )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 1000 )
					givePlayerMoney ( player, 1000 )
					setElementVisibleTo ( RobDeliver, getRootElement(), false )
					setElementVisibleTo ( RobDeliverBlip, getRootElement(), false )
					raubueberfall = 0
				end
			end
		end
	end
end

sexshopped = createPed(246, -104.77, -8.586, 1000.71875)
outputDebugString("robbank: 137 - PED erstellt sexshopped")
setElementInterior (sexshopped, 3)
laSetElementData(sexshopped,"anim", 1)
setPedRotation(sexshopped, 180)
setElementData ( sexshopped, "undeadbarped", true )

function playerTargetCheck ( )
    local target
    for i, player in ipairs ( getElementsByType("player") ) do
        target = getPedTarget ( player )
			if ( target ) then
				if target == sexshopped then
					if isEvil( player ) then
						if raubueberfall == 1 then
								outputChatBox ( "Es läuft gerade ein Überfall!", player, 125, 0, 0 )
						elseif xxxtransport == 2 then
								outputChatBox ( "Dieser Shop wurde bereits überfallen!", player, 125, 0, 0 )
						else
							setPedAnimation(sexshopped, "shop", "SHP_HandsUp_Scr")
							setTimer(handb,500,1,sexshopped)
							outputChatBox ( ""..getPlayerName(player)..": Wo ist der Tresorraum?!", player, 255, 255, 255 )
							outputChatBox ( "Ich bringe dich zum Tresorraum, aber lass mich leben!", player, 0, 0, 125 )
							setTimer ( darknessbeginn_func, 2000, 1, player)
							setTimer ( darknessend_func, 5000, 1, player)
							setTimer(robbank_func,4000,1,player)
							xxxtransport = 1
							raubueberfall = 1
						end
					else
						outputChatBox ( "Du bist nicht in einer bösen Fraktion!", player, 125, 0, 0 )
					end
				end
			end
    end
end
setTimer ( playerTargetCheck, 1000, 0 )


function darknessbeginn_func (player)
fadeCamera ( player, false, 0.5, 0, 0, 0 )
end

function darknessend_func (player)
fadeCamera ( player, true, 0.5, 0, 0, 0 )
outputChatBox ( "Scheisse, die Bullen wurden alamiert! Du musst dich beeilen!", player, 0, 0, 125 )
outputChatBox ( "Bringe nun den Truck zu dem LKW Zeichen in Las Venturas, um deine Belohnung zu erhalten!", player, 0, 125, 0 )
setPedAnimation(sexshopped, "ped", "cower")
setTimer(createRobDeliverMarker,1000,1,player)
end

function vehicleDestroyedRobTruck ()

	if laGetElementData ( source, "robtruck" ) == 1 then
		raubueberfall = 0
		destroyElement ( veh, "robsecur" )
		destroyElement ( source )				
		destroyElement ( RobDeliver )
		setElementVisibleTo ( RobDeliver, getRootElement(), false )
		setElementVisibleTo ( RobDeliverBlip, getRootElement(), false )
		setElementPosition ( veh, 999999, 999999, -50 )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedRobTruck )