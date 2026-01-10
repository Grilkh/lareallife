--[[function zombtest_func ( player )

	local x, y, z = getElementPosition ( player )
	for i = 1, 50 do
		call ( getResourceFromName ( "zombies_sloth" ), "createZombie", x + math.random ( -1000, 1000 ) / 100, y + math.random ( -1000, 1000 ) / 100, z )
	end
end
addCommandHandler ( "Duhurensohnleckmeinschwanzichfickedeinemuttermuhahahaha", zombtest_func )

function finishObjectPlace_func ( model, x, y, z )

	createObject ( model, x, y, z )
end
addEvent ( "finishObjectPlace", true )
addEventHandler ( "finishObjectPlace", getRootElement(), finishObjectPlace_func )

function nova_func ( player, cmd, hours )

	--[[local lvl = tonumber ( lvl )
	local totalHours = 0
	for i = 1, lvl do
		totalHours = totalHours + 8+4*(i-1)
	end
	outputDebugString ( tostring ( totalHours ) )]]
	local hours = tonumber ( hours )
	local lvl = 1
	for i = 1, 99 do
		local hoursNeedet = 8+4*(i-1)
		if hours >= hoursNeedet then
			lvl = lvl + 1
			hours = hours - hoursNeedet
			outputDebugString ( tostring ( lvl ) )
			outputDebugString ( tostring ( 8+4*(i-1) ) )
		end
	end
end
addCommandHandler ( "DuBitchleckmeinesackmuhahahhahah4399frankfurtkingrahrahrahra", nova_func )

function containsText ( lookingFor, text )

	if lookingFor and text then
		if #lookingFor >= #text then
			if lookingFor == text then
				return true
			else
				return false
			end
		else
			for i = 0, #text - #lookingFor + 1 do
				local switch = false
				for k = 1, #lookingFor do
					if string.sub ( text, i+k, i+k ) == string.sub ( lookingFor, k, k ) then
						switch = true
					else
						switch = false
						break
					end
				end
				if switch then
					return true
				end
			end
		end
	else
		return false
	end
end

function changeCarLightsColor ( thePlayer, command, red, green, blue )
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if ( not theVehicle ) then
		return outputChatBox( "You don't have vehicle!" )
	end
	red = tonumber ( red )
	green = tonumber ( green )
	blue = tonumber ( blue )
	-- check if the colour values for red, green and blue are valid
	if red and green and blue then
		local color = setVehicleHeadLightColor ( theVehicle, red, green, blue )
		if(not color) then
			outputChatBox( "Failed to change vehicle lights color" )
		else
			outputChatBox ( "Vehicle lights color changed sucessfully" )
		end
	else
		outputChatBox( "Failed to change vehicle lights color" )
	end
end
addCommandHandler ( "DUHURENSOHNGEHDICHBEGRABENICHFICKEDEINEMUTTERDIEKLEINEBITCH", changeCarLightsColor )

function tree ( player )

	local x, y, z = getElementPosition ( player )
	local pname = getPlayerName ( player )
	
	_G[pname.."treex"] = x
	_G[pname.."treey"] = y
	_G[pname.."treez"] = z
	groundheight = 32.48
	setTimer ( grow1, 2000, 1, _G[pname.."tree"], pname )
	
	--[[<object id="Palme4 1/2" dimension="0" interior="0" model="710" posX="1704.3084716797" posY="121.7484588623" posZ="40.393753051758" rotX="0" rotY="0" rotZ="0" />
	<object id="Palme4" dimension="0" interior="0" model="710" posX="1711.1534423828" posY="118.61103057861" posZ="29.864692687988" rotX="0" rotY="0" rotZ="0" />
	<object id="Palme3 1/2" dimension="0" interior="0" model="711" posX="1716.9385986328" posY="117.01349639893" posZ="37.176090240479" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme3" dimension="0" interior="0" model="711" posX="1720.8010253906" posY="115.651512146" posZ="33.291477203369" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme2" dimension="0" interior="0" model="634" posX="1726.1608886719" posY="114.462890625" posZ="29.950592041016" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme1" dimension="0" interior="0" model="629" posX="1729.9708251953" posY="113.09046173096" posZ="31.564836502075" rotX="0" rotY="0" rotZ="0" />]]
end
addCommandHandler("rahrarharhahrahrahrahrahrh53dfvdg", tree)

function DuHurensohnvereck472_func ( player, cmd, DuHurensohnvereck472 )
	
	setGameSpeed ( tonumber ( DuHurensohnvereck472 ) )
end
addCommandHandler ( "DuHurensohnvereck472", DuHurensohnvereck472_func )

function sound_func ( player )
	for i = 1, 150 do
		setTimer ( playASound, 750*i, 1, player, i )
	end
end
function playASound ( player, i )
	playSoundFrontEnd ( player, i )
	outputChatBox ( "Sound Nr.: "..i, player, 200, 200, 20 )
end
addCommandHandler ( "123456789554478512225566muhahaha", sound_func )

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
end

function test (player,cmd,veh)

	local rot = getPedRotation ( player )
	local x, y, z = getElementPosition ( player )
	local breite = 5.57
	local hoehe = 1.79
	local nx, ny = getPointFromDistanceRotation ( x, y, breite/2+0.5, 0 )
	-- breite/2+0.5
	createObject ( 2899, nx, ny, z-0.5, 0, 0, rot )
end
addCommandHandler ( "SCHEISSHURENSOHNICHFICKEDEINEN75", test )

function decrypt1 ()

	local letter = "t2"
	local lettercod = md5 ( letter )
	for i = 1, 128 do
		for g = 1, 128 do
			--for h = 1, 128 do
				if lettercod == md5(tostring(string.char(g)..string.char(i))) then
					outputDebugString ( "YEAH! PW: "..string.char(g)..string.char(i)--[[..string.char(h)]] )
					g = 128
					i = 128
					--h = 128
					break
				end
			--end
		end
	end
end
addCommandHandler("neinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn45458", decrypt1)

function decrypt ()

	local letter = tostring(string.char(5)..string.char(5)..string.char(5))
	local lettercod = md5 ( letter )
	outputDebugString ( letter )
	for i = 1, 128 do
		for g = 1, 128 do
			for h = 1, 128 do
				if lettercod == md5(tostring(string.char(h)..string.char(g)..string.char(i))) then
					outputDebugString ( "YEAH! PW: "..string.char(g)..string.char(i)..string.char(h) )
					g = 128
					i = 128
					h = 128
					break
				end
			end
		end
	end
end
addCommandHandler("rewriterykerzipppergehteuchbegrabenaller", decrypt)

function grow1 ( tree, pname )

	_G[pname.."tree"] = createObject ( 634, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-5 )
	moveObject ( _G[pname.."tree"], 5000, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-3, 0, 0 )
	setTimer ( grow2, 5000, 1, _G[pname.."tree"], pname )
end

function grow2 ( tree, pname )

	destroyElement ( tree )
	_G[pname.."tree"] = createObject ( 711, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+1.4 )
	local growtime = 30000
	moveObject ( _G[pname.."tree"], growtime, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+4.696, 0, 0, 180 )
	setTimer ( grow3, growtime, 1, _G[pname.."tree"], pname, growtime )
end

function grow3 ( tree, pname, growtime )

	destroyElement ( tree )
	_G[pname.."tree"] = createObject ( 710, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+2.62 )
	moveObject ( _G[pname.."tree"], growtime, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+7.9137, 0, 0, 180 )
end

function gefahrfrjeden( player )

	bindKey ( player, "p", "down", speedup )
	triggerClientEvent ( player, "showAchievmentBox", player, " King of the\n    Hill", 15, 10000 )
end
addCommandHandler("gefahrfr77777jeden", gefahrfrjeden)

function speedup ( player )

	player = getPedOccupiedVehicle ( player )
	x, y, z = getElementVelocity ( player )
	speedup1 = math.abs(x / 100 * 30)
	speedup2 = math.abs(y / 100 * 30)
	if x >= 0 and y >= 0 then
		setElementVelocity ( player, x+speedup1, y+speedup2, z )
	end
	if x <= 0 and y <= 0 then
		setElementVelocity ( player, x-speedup1, y-speedup2, z )
	end
	if x >= 0 and y <= 0 then
		setElementVelocity ( player, x+speedup1, y-speedup2, z )
	end
	if x <= 0 and y >= 0 then
		setElementVelocity ( player, x-speedup1, y+speedup2, z )
	end
end
addCommandHandler("speedup3831831", speedup)

function schrimps ( player, cmd, wh, h2 )

	height = h2
	SizeVal = 2998
	-- Defining variables.
	southWest_X = -SizeVal
	southWest_Y = -SizeVal
	southEast_X = SizeVal
	southEast_Y = -SizeVal
	northWest_X = -SizeVal
	northWest_Y = SizeVal
	northEast_X = SizeVal
	northEast_Y = SizeVal

	water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
	setWaterLevel ( h2 )
	setWaterLevel ( tonumber ( h2 ) )
	setWaveHeight ( tonumber ( wh ) )
end
addCommandHandler("schr45245453453453435imp87524524s", schrimps)

function skin( player, cmd, skin )

	setElementModel ( player, tonumber(skin) )
end
addCommandHandler("skinfrtolganuremineminklammernrahrahra", skin)
function heaven( player )

	setElementInterior ( player, 3 )
	setElementPosition ( player, 963.92681884766, -53.241992950439, 1000.2536621094 )
end
addCommandHandler("heave34234234n", heaven)

function cloak( player, command, alpha )

	setElementAlpha ( player, alpha )
	if alpha == 255 then
		setPlayerNametagShowing ( player, true )
	else
		setPlayerNametagShowing ( player, false )
	end
end
addCommandHandler("cl2238321oak4328", cloak)

function vcloak( player, command, alpha )

	setElementAlpha ( getPedOccupiedVehicle(player), alpha )
end
addCommandHandler("vcloa234234k", vcloak)

function createveh( player, command, veh)

	if tonumber ( getElementData ( player, "adminlvl" ) ) >= 3 then
		local x,y,z = getElementPosition ( player )
		local x = x + 5
		local createdVehicle = createVehicle( tonumber(veh), x, y, z, 0, 0, 0, getPlayerName ( player ) )
		setElementHealth ( createdVehicle, 5000 )
	end
end
addCommandHandler("veh", createveh)

function veh( player, command, veh)

	local x,y,z = getElementPosition ( player )
	local x = x + 5
    local createdVehicle = createVehicle( tonumber(veh), x, y, z, 0, 0, 0, getPlayerName ( player ) )
	setElementHealth ( createdVehicle, 5000 )
    if (createdVehicle == false) then
		outputChatBox( "Fahrzeug konnte nicht erstellt werden, Gebrauch: /vehVehicle [400-600].", player)
    else
		setTrainDerailable ( createdVehicle, false )
		setTrainSpeed ( createdVehicle, 1000 )
	end
end
addCommandHandler("autokannmire234234inewichsen", veh)

function sguns ( player )

	local weapon = 22
	local ammo = 34
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 29
	local ammo = 900
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 30
	local ammo = 900
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 35
	local ammo = 10
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 39
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 43
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 38
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 25
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	local weapon = 4
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	
	takeWeapon ( player, 1 )
end
addCommandHandler("sguhiu234234234234ns", sguns)
]]

