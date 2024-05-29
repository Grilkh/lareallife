------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function onStart()
	turret1 = createColSphere ( 238.1611328125, 1698.6298828125, 23.875,350.0)
	turret2 = createColSphere ( 354.3291015625, 2026.6728515625, 23.867,350.0)
	turret3 = createColSphere ( 186.4150390625, 2081.6171875, 23.898,350.0)
	turret4 = createColSphere ( 15.6953125, 1717.3388671875, 23.87,350.0)
end
addEventHandler("onResourceStart",getRootElement(),onStart)

function shoot(player)
		if not isArmy( player ) then
			if getPedOccupiedVehicle(player, 0) then
				if getVehicleType(getPedOccupiedVehicle(player)) == "Helicopter" or getVehicleType(getPedOccupiedVehicle(player)) == "Plane" then
					if isElementWithinColShape(player,turret1) then
						triggerClientEvent(player,"createProj",getRootElement(),player,238.1611328125, 1698.6298828125, 23.875)
					elseif isElementWithinColShape(player,turret2) then
						triggerClientEvent(player,"createProj",getRootElement(),player,354.3291015625, 2026.6728515625, 23.867)
					elseif isElementWithinColShape(player,turret3) then
						triggerClientEvent(player,"createProj",getRootElement(),player,186.4150390625, 2081.6171875, 23.898)
					elseif isElementWithinColShape(player,turret4) then
						triggerClientEvent(player,"createProj",getRootElement(),player,15.6953125, 1717.3388671875, 23.87)
					end
				end 
			end
		end
end

function onHit(hitElement)
	shootTimer = setTimer(shoot,2500,0,hitElement)
end
addEventHandler("onColShapeHit",getRootElement(),onHit)

function onLeave()
	if isTimer(shootTimer) then
		killTimer(shootTimer)
	end
end
addEventHandler("onColShapeLeave",getRootElement(),onLeave)
