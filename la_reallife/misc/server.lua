------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

setOcclusionsEnabled(false) -- Deaktivert die Occlusionen

-- FUER DEN GABELSTABLER JOB --

removeWorldModel(10392, 50, -2339.859375, -53.90625, 40.296875)
removeWorldModel(10507, 50, -2339.859375, -53.90625, 40.296875)
removeWorldModel(10391, 50, -2338.7578125, -32.96875, 42.6328125)
removeWorldModel(10508, 50, -2338.7578125, -32.96875, 42.6328125)
removeWorldModel(10390, 50, -2302.140625, 10.5859375, 42.5546875)
removeWorldModel(10509, 50, -2302.140625, 10.5859375, 42.5546875)
removeWorldModel(705, 50, -2340.7734375, 13.8671875, 33.3515625)
removeWorldModel(0, 50, -2340.7734375, 13.8671875, 33.3515625)
removeWorldModel(708, 50, -2350.7265625, -1.4609375, 32.9296875)
removeWorldModel(0, 50, -2350.7265625, -1.4609375, 32.9296875)
removeWorldModel(672, 50, -2357.0546875, 22.375, 35.234375)
removeWorldModel(0, 50, -2357.0546875, 22.375, 35.234375)
removeWorldModel(673, 50, -2337.765625, -14, 34.3671875)
removeWorldModel(0, 50, -2337.765625, -14, 34.3671875)
removeWorldModel(669, 50, -2357.015625, -16.4140625, 34.6171875)


function giveVehicleBetterEngine(theVehicle)
	if(getElementType(theVehicle) == "vehicle") then
		if(getVehicleType(theVehicle) == "Boat") then return end
		setVehicleHandling(theVehicle, "engineAcceleration", (getVehicleHandling(theVehicle)['engineAcceleration']/100*150))
		setVehicleHandling(theVehicle, "maxVelocity", (getVehicleHandling(theVehicle)['maxVelocity']/100*150))
	end
end