freeDimensions = {}

function getFreeDimension ()

	for i = 1, 10 do
		local rnd = math.random ( 10, 65000 )
		if not freeDimensions[rnd] then
			freeDimensions[rnd] = true
			return rnd
		end
	end
	return 0
end

function setMoveable ( player, bool )

	if lp then
		bool = player
	elseif isElement ( player ) then
		
	end
end

function timestampOptical ()

	local regtime = getRealTime()
	local year = tostring ( regtime.year + 1900 )
	local month = tostring ( regtime.month + 1 )
	local day = tostring ( regtime.monthday )
	local hour = tostring ( regtime.hour )
	local minute = tostring ( regtime.minute )
	
	if #month == 1 then
		month = "0"..month
	end
	if #day == 1 then
		day = "0"..day
	end
	if #hour == 1 then
		hour = "0"..hour
	end
	if #minute == 1 then
		minute = "0"..minute
	end
			
	return tostring(day.."."..month.."."..year..", "..hour..":"..minute)
end

function getSecTime ( duration )

	if not duration then
		duration = 0
	end
	local time = getRealTime()
	local year = time.year
	local day = time.yearday
	local hour = time.hour
	local minute = time.minute
	
	local total = year * 365 * 24 * 60 + day * 24 * 60 + ( hour + duration ) * 60 + minute
	
	return total
end

function getMinTime ()

	return getSecTime ( 0 )
end

function getSecondTime ( duration )

	local time = getRealTime ()
	local year = time.year
	local day = time.yearday
	local hour = time.hour
	local minute = time.minute
	local seconds = time.second
	
	local total = 0
	total = year * 365 * 24 * 60 * 60
	total = total + day * 24 * 60 * 60
	total = total + hour * 60 * 60
	total = total + minute * 60
	total = total + seconds + duration
	
	return total
end

monthDays = {
 [1]=31,
 [2]=28,
 [3]=31,
 [4]=30,
 [5]=31,
 [6]=30,
 [7]=31,
 [8]=31,
 [9]=30,
 [10]=31,
 [11]=30,
 [12]=31
 }

function getDaysInMonth ( month, year )

	local leap = isYearALeapYear ( year )
	if month == 2 and leap then
		return 29
	else
		return monthDays[month]
	end
end

function isYearALeapYear(year)
    if (not year) then year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

function toggleVehicleTrunk ( veh )

	if laGetElementData ( veh, "stuning1" ) then
		local vx, vy, vz = getElementVelocity ( veh )
		local x, y, z = getElementPosition ( veh )
		setElementFrozen ( veh, true )
		setElementPosition ( veh, x, y, z - 50 )
		local state = laGetElementData ( veh, "trunkState" )
		if laGetElementData ( veh, "trunkState" ) == nil then
			laSetElementData ( veh, "trunkState", false )
			setVehicleDoorState ( veh, 1, 0 )
			state = false
		end
		laSetElementData ( veh, "trunkState", not state )
		if state then
			setVehicleDoorState ( veh, 1, 0 )
		else
			setVehicleDoorState ( veh, 1, 4 )
		end
		setVehicleFrozen ( veh, false )
		setElementPosition ( veh, x, y, z )
		setElementVelocity ( veh, vx, vy, vz )
	end
end

function getVehicleTrunkState ( veh )

	if laGetElementData ( veh, "trunkState" ) then
		return true
	end
	return false
end

function getDistanceBetweenMinutes ( m1, h1, m2, h2 )

	local t1 = m1 + h1 * 60
	local t2 = m2 + h2 * 60
	if t2 == t1 then
		return 0
	elseif t2 > t1 then
		return t2 - t1
	else
		return math.abs ( 1440 - t1 + t2 )
	end
end

function attachElementsInCorrectWay ( element1, element2 )
	
	local x1, y1, z1 = getElementPosition ( element1 )
	--local rx1, ry1, rz1 = getElementRotation ( element1 )
	local x2, y2, z2 = getElementPosition ( element2 )
	--local rx2, ry2, rz2 = getElementRotation ( element1 )
	attachElements ( element1, element2, x1-x2, y1-y2, z1-z2--[[, rx1-rx2, ry1-ry2, rz1-rz2]] )
end

function table.copy(tab)
    local ret = {}
    for key, value in pairs(tab) do
        if ( type ( value ) == "table" ) then
			ret [ key ] = table.copy ( value )
        else
			ret [ key ] = value
		end
    end
    return ret
end

function table.size ( tab )
    local length = 0
    for _ in pairs ( tab ) do length = length + 1 end
    return length
end

function findRotation ( x1, y1, x2, y2 )
 
	local t = - math.deg ( math.atan2 ( x2 - x1, y2 - y1 ) )
	if t < 0 then t = t + 360 end
	return t
end

function getPointFromDistanceRotation ( x, y, dist, angle )

	local a = math.rad ( 90 - angle )
	local dx = math.cos ( a ) * dist
	local dy = math.sin ( a ) * dist
	return x + dx, y + dy
end

function isString ( text )

	if not tonumber ( text ) and tostring ( text ) ~= "true" and tostring ( text ) ~= "false" and tostring ( text ) ~= "nil" then
		return true
	else
		return false
	end
end

function fadeElementInterior ( player, int, intx, inty, intz, rot, dim )

	if int then
		setElementInterior ( player, int )
	end
	if dim then
		setElementDimension ( player, dim )
	end
		setElementPosition (  player, intx, inty, intz )
	if rot then
		setPedRotation ( player, rot )
	end
end

function timestamp ()

	local regtime = getRealTime()
	local year = regtime.year + 1900
	local month = regtime.month + 1
	local day = regtime.monthday
	local hour = regtime.hour + winterzeit
	if hour == 24 then hour = 0 end
	local minute = regtime.minute
	local timestamp = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
	return timestamp
end

function setVehicleStatic ( vehicle, boolean )

	if boolean then
		local x, y, z = getElementPosition ( vehicle )
		local rx, ry, rz = getElementRotation ( vehicle )
		local master = createObject ( 1337, x, y, z )
		setElementRotation ( master, rx, ry, rz )
		setElementAlpha ( master, 0 )
		--attachElementsInCorrectWay ( vehicle, master )
		attachElementsInCorrectWay ( vehicle, master )
		setVehicleDamageProof ( vehicle, true )
		setVehicleDoorsUndamageable ( vehicle, true )
		setVehicleLocked ( vehicle, true )
	end
end

function isWithinNightTime ()

	return false
end


function vanishElement ( element )

	if isElement ( element ) then
		for i = 1, 25 do
			setTimer ( setElementAlpha, 100 * i, 1, element, 255 / 25 * ( 25 - i ) )
		end
		setTimer ( destroyElement, 2500, 1, element )
	end
end

function addPlayerHealth ( player, value )

	if isElement ( player ) then
		local total = getElementHealth ( player ) + value
		if total > 100 then
			setElementHealth ( player, 100 )
		else
			setElementHealth ( player, total )
		end
	end
end