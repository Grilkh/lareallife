addEvent("onCarRam")setPlayerHudComponentVisible
vehicle = nil
VehicleHealth = nil
RegenerationsTimer = nil

function StartUp(ressource)
	if(ressource == getThisResource()) then
		setTimer(CheckDamage,500,0)
		toggleAllControls(true,true,true)
		if(isPlayerInVehicle(getLocalPlayer())) then
			vehicle = getPlayerOccupiedVehicle(getLocalPlayer())
			VehicleHealth = getElementHealth(vehicle)
		end
	end
end
addEventHandler("onClientResourceStart",getRootElement(),StartUp)

local function vehicleEnter(player,seat)
	if(player == getLocalPlayer()) then
		vehicle = getPlayerOccupiedVehicle(player)
		VehicleHealth = getElementHealth(vehicle)
	end
end
addEventHandler("onClientVehicleEnter",getRootElement(),vehicleEnter)

local function vehicleExit(player,seat)
	if(player == getLocalPlayer()) then
		vehicle = nil
		VehicleHealth = nil
	end
end
addEventHandler("onClientVehicleExit",getRootElement(),vehicleExit)

function Unfreeze()
	toggleAllControls(true,true,true)
end
addEventHandler("onClientPlayerSpawn",getRootElement(),Unfreeze)

function CheckDamage()
	if(isPlayerInVehicle(getLocalPlayer())) then
		vehicle = getPlayerOccupiedVehicle(getLocalPlayer())
		if(getElementHealth(vehicle) < VehicleHealth) then
			local loss = VehicleHealth - getElementHealth(vehicle)
			if(loss > minimalDmg) then
				local newPlayerHealth = getElementHealth(getLocalPlayer()) - (loss * VehicleDmgMulti)
				setElementHealth(getLocalPlayer(),newPlayerHealth)
				showPlayerHudComponent ( "health", true )
				setTimer (hudAusblendenDmg, timetohide, 1)
				if(getElementHealth(getLocalPlayer()) <= 0) then
					toggleAllControls(false,true,false)
					killTimer(RegenerationsTimer)
				else
					RegenerationsTimer = setTimer(regenaration_car_func,(10/math.floor(loss)) * 1000,math.floor(loss))
				end
				local VehicleHP = getElementHealth(vehicle)
				VehicleHealth = VehicleHP
			end
		end
	end
end

function regenaration_car_func()
	currentPlayerHealth = getElementHealth(getLocalPlayer())
	setElementHealth(getLocalPlayer(),currentPlayerHealth + 0.4)
end