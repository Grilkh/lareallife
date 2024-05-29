--[[<object id="GateClosed|Open: 199.85" dimension="0" interior="0" model="7657" posX="217.9140625, 1875.8994140625, 13.863801956177" rotX="0" rotY="0" rotZ="180" />

	<object id="GateBClosed" dimension="0" interior="0" model="988" posX="96.729438781738, 1921.6207275391, 18.170719146729" rotX="0" rotY="0" rotZ="90" />
    <object id="GateBOpen" dimension="0" interior="0" model="988" posX="96.8125, 1925.6676025391, 17.978801727295" rotX="0" rotY="0" rotZ="90" />
	]]

removeWorldModel(966,1000,-1526.390625,481.3828125,6.1796875)
removeWorldModel(968,1000,-1526.4375,481.3828125,6.90625)
	
local armyTeleporterA = createMarker ( 281.34356689453, 1858.0793457031, 16.590633392334, "corona", 5, 255, 0, 0, 150 )
local armyTeleporterB = createMarker ( 290.01748657227, 1857.9688720703, 16.590633392334, "corona", 5, 255, 0, 0, 150 )

local function armyTeleportA ( hit )
	if isArmy ( hit ) then
	elseif getElementType ( hit ) == "vehicle" then
		setVehicleFrozen ( hit, true )
		setTimer ( setVehicleFrozen, 500, 1, hit, false )
	else
		return nil
	end
	setElementPosition ( hit, 301.18362426758, 1858.2447509766, 17.289850234985 )
end
addEventHandler ( "onMarkerHit", armyTeleporterA, armyTeleportA )

local function armyTeleportB ( hit )
	if isArmy ( hit ) then
	elseif getElementType ( hit ) == "vehicle" then
		setVehicleFrozen ( hit, true )
		setTimer ( setVehicleFrozen, 500, 1, hit, false )
	else
		return nil
	end
	setElementPosition ( hit, 271.25347900391, 1857.4809570313, 17.289850234985 )
end
addEventHandler ( "onMarkerHit", armyTeleporterB, armyTeleportB )

armyGate1 = createObject ( 988, 96.8125, 1921.62, 17.9788, 0, 0, 90 )
armyGate2 = createObject ( 7657, 217.9140625, 1875.8994140625, 13.863801956177, 0, 0, 180 )
	
armyGate1Moving = false
armyGate2Moving = false

armyGate1Moved = false
armyGate2Moved = false

local function Army_Gate_LV_func ( player )

	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( armyGate1 )
	local x3, y3, z3 = getElementPosition ( armyGate2 )
	if isArmy ( player ) then
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			if not armyGate1Moving then
				if armyGate1Moved then
					setTimer ( armyGateMoveSwitch, 1500, 1, 1 )
					moveObject ( armyGate1, 1500, 96.8125, 1921.62, 17.9788 )
					armyGate1Moved = false
					armyGate1Moving = true
				else
					setTimer ( armyGateMoveSwitch, 1500, 1, 1 )
					moveObject ( armyGate1, 1500, 96.8125, 1925.62, 17.9788 )
					armyGate1Moved = true 
					armyGate1Moving = true
				end
			end
		elseif getDistanceBetweenPoints3D ( x1, y1, z1, x3, y3, z3 ) <= 20 then
			if not armyGate2Moving then
				if armyGate2Moved then
					setTimer ( armyGateMoveSwitch, 1500, 1, 2 )
					moveObject ( armyGate2, 1500, 217.9140625, 1875.8994140625, 13.863801956177 )
					armyGate2Moved = false
					armyGate2Moving = true
				else
					setTimer ( armyGateMoveSwitch, 1500, 1, 2 )
					moveObject ( armyGate2, 1500, 200, 1875.8994140625, 13.863801956177 )
					armyGate2Moved = true
					armyGate2Moving = true
				end
			end
		end
	end
end
addCommandHandler ( "move", Army_Gate_LV_func )

function armyGateMoveSwitch ( i )
	_G["armyGate"..i.."Moving"] = false
end

sfarmyzaun = createObject(986, -1522.8876953125,482.0810546875,6.8689527511597,0,0,352.05688476)
sfarmygate = createObject(986, -1530.7382,482.61816,6.87969017,359.7473144,0,0)
sfarmygatestate = true

local function Army_Gate_SF_func(player)
	tx,ty,tz = getElementPosition(sfarmygate)
	px, py, pz = getElementPosition(player)
	local dis = getDistanceBetweenPoints3D ( tx, ty, tz, px, py, pz )
	if isArmy (player) then
		if (dis <= 30) then
			if (sfarmygatestate == true) then
				moveObject( sfarmygate, 1500, -1530.7382,482.61816,0)
				sfarmygatestate = false
			else
				moveObject( sfarmygate, 1500, -1530.7382,482.618164,6.879690)
				sfarmygatestate = true
			end
		end
	end
end
addCommandHandler("move", Army_Gate_SF_func)