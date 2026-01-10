------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

ComptonGate1 = createObject(969,-2178.347, 44.9, 34.3,0,0,270)
comptongateLS1 = createObject(2927,2418.8994140625,-1245.8994140625,24.60000038147,0,0,0)
comptongateLS2 = createObject(2927,2414.7998046875,-1245.8994140625,24.60000038147,0,0,0)

Comptongate1Moving = false

Comptongate1Moved = false

local function Compton_Gate_SF_func ( source )

	if isCompton(source) or isGatePermitted(source) then
		if getDistanceBetweenPoints3D ( -2178.347, 44.9, 34.3, getElementPosition ( source ) ) < 17 then
			if Comptongate1Moving == false then
				Comptongate1Moving = true
				if Comptongate1Moved == false then
					moveObject ( ComptonGate1, 1500, -2178.347, 34.9, 34.3, 0, 0, 0 )
					setTimer ( triggerComptonGate1Varb, 1500, 1 )
					Comptongate1Moved = true
				else
					moveObject ( ComptonGate1, 1500, -2178.347, 44.9, 34.3, 0, 0, 0 )
					setTimer ( triggerComptonGate1Varb, 1500, 1 )
					Comptongate1Moved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Compton_Gate_SF_func )

function triggerComptonGate1Varb ()

	Comptongate1Moving = false
end

local function comptongate_func_LS(source, command)
	tx,ty,tz = getElementPosition(comptongateLS1)
	px, py, pz = getElementPosition(source)
	if isCompton(source) or isGatePermitted(source) then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if tonumber(tz) == 21 then
				moveObject( comptongateLS1, 1500, 2418.8994140625,-1245.8994140625, 24.60000038147)
               	moveObject( comptongateLS2, 1500, 2414.7998046875,-1245.8994140625, 24.60000038147)
			else
				moveObject( comptongateLS1, 1500, 2418.8994140625,-1245.8994140625, 21)
               	moveObject( comptongateLS2, 1500, 2414.7998046875,-1245.8994140625, 21)
			end
		end
	end
end
addCommandHandler("move", comptongate_func_LS)