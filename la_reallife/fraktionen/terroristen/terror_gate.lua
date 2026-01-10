terrorgate = createObject(986, -2097.537109375,-1877.4169921875,110,358.27514648438,0.1702880859375,324.26696777344)

local function terrorgate_func(player, command)
	tx,ty,tz = getElementPosition(terrorgate)
	px, py, pz = getElementPosition(player)
	if isTerror (player) or isGatePermitted(player) then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if tonumber(tz) == 110 then
				moveObject( terrorgate, 1500, -2097.537109375,-1877.4169921875, 100)
			elseif tonumber(tz) == 100 then
				moveObject( terrorgate, 1500, -2097.537109375,-1877.4169921875, 110)
			end
		end
	end
end
addCommandHandler("move", terrorgate_func)