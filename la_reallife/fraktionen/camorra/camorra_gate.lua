------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

removeWorldModel(11492,1000,-681.875,965.890625,11.125)
removeWorldModel(11654,1000,-681.875,965.890625,11.125)

--[[removeWorldModel(10992, 50, -2124.6953125, -60.3515625, 40.296875)
removeWorldModel(11038, 50, -2124.6953125, -60.3515625, 40.296875)
removeWorldModel(11092, 50, -2110.828125, -27.359375, 36.9765625)
removeWorldModel(11163, 50, -2110.828125, -27.359375, 36.9765625)
removeWorldModel(11093, 50, -2111.2578125, 11.0625, 37.390625)
removeWorldModel(11162, 50, -2111.2578125, 11.0625, 37.390625)
removeWorldModel(11102, 50, -2100.9448242188, -16.240036010742, 34.969539642334)]]

Camorragate1Moving = false

Camorragate1Moved = false
Camorragate4Moved = true
CamorraGate1 = createObject ( 971, -1666.13, 1295.8, 8.6, 0, 0, 315 )
CamorraGateLS1 = createObject ( 971, 712, -1417.5, 16.10000038147, 0, 0, 0 )
CamorraGateLS2 = createObject ( 971, 724.5, -1579.8994140625, 2.5999999046326, 0, 0, 0 )

CamorraGate4 = createObject ( 2634, 2147.8286132813, 1604.787109375, 1006.6293334961, 0, 0, 0 )
setElementInterior ( CamorraGate4, 1 )

CamorraDoorKeypadA = createObject ( 2886, 2149.0217285156, 1604.5771484375, 1006.5141601563, 0, 0, 0 )
setElementInterior ( CamorraDoorKeypadA, 1 )
CamorraDoorKeypadB = createObject ( 3052, 2149.0476074219, 1604.8155517578, 1006.5411987305, 0, 90, 90 )

CamorraCasinoKeypads = {
 [CamorraDoorKeypadA]=true,
 [CamorraDoorKeypadB]=true
}

local function Camorra_Gate_SF_func ( player )

	if isCamorra(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -1666.13, 1295.8, 8.6, getElementPosition ( player ) ) < 17 then
			if Camorragate1Moving == false then
				Camorragate1Moving = true
				if Camorragate1Moved == false then
					moveObject ( CamorraGate1, 1500, -1666.13, 1295.8, 0, 0, 0, 0 )
					setTimer ( triggerCamorraGate1Varb, 1500, 1 )
					Camorragate1Moved = true
				else
					moveObject ( CamorraGate1, 1500, -1666.13, 1295.8, 9.6, 0, 0, 0 )
					setTimer ( triggerCamorraGate1Varb, 1500, 1 )
					Camorragate1Moved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Camorra_Gate_SF_func )

local function Camorra_Gate_LS_1_func (player, command)
	tx,ty,tz = getElementPosition(CamorraGateLS1)
	px, py, pz = getElementPosition(player)
	if isCamorra(player) or isGatePermitted(player) then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if tonumber(tz) == 6 then
				moveObject( CamorraGateLS1, 1500, 712, -1417.5, 16.10000038147)
			else
				moveObject( CamorraGateLS1, 1500, 712, -1417.5, 6)
			end
		end
	end
end
addCommandHandler("move", Camorra_Gate_LS_1_func)

local function Camorra_Gate_LS_2_func (player, command)
	tx,ty,tz = getElementPosition(CamorraGateLS2)
	px, py, pz = getElementPosition(player)
	if isCamorra(player) or isGatePermitted(player) then
		if (tonumber(px) <= tonumber(tx)+25) and (tonumber(px) >= tonumber(tx)-25) and (tonumber(py) <= tonumber(ty)+25) and (tonumber(py) >= tonumber(ty)-25) and (tonumber(pz) <= tonumber(tz)+230) and (tonumber(pz) >= tonumber(tz)-30) then
			if tonumber(tz) == -7 then
				moveObject( CamorraGateLS2, 1500, 724.5, -1579.8994140625, 2.5999999046326)
			else
				moveObject( CamorraGateLS2, 1500, 724.5, -1579.8994140625, -7)
			end
		end
	end
end
addCommandHandler("move", Camorra_Gate_LS_2_func)


function triggerCamorraGate1Varb ()

	Camorragate1Moving = false
end


function moveCasinoDoor ( player )

	if (isCamorra(player) or isGatePermitted(player)) and not Camorragate4Moving then
		Camorragate4Moving = true
		Camorragate4Moved = not Camorragate4Moved
		if Camorragate4Moved then
			moveObject ( CamorraGate4, 1500, 2147.8286132813, 1604.787109375, 1006.6293334961, 0, 0, -70 )
		else
			moveObject ( CamorraGate4, 1500, 2147.2602539063, 1605.478515625, 1006.6293334961, 0, 0, 70 )
		end
		setTimer ( 
			function ()
				Camorragate4Moving = false
			end,
		1500, 1 )
	end
end