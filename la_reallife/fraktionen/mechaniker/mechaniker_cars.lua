------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local car = {}
car[1] = createVehicle(525, -2690.48046875, 438.7607421875, 4.2260584831238, 358.2861328125, 0.120849609375, 87.352294921875) -- Towtruck
car[2] = createVehicle(525, -2690.3076171875, 441.896484375, 4.2090520858765, 358.06091308594, 0, 89.093627929688) -- Towtruck
car[3] = createVehicle(525, -2690.2548828125, 444.849609375, 4.214093208313, 358.14331054688, 0, 89.67041015625) -- Towtruck
car[4] = createVehicle(525, -2659.16796875, 456.1650390625, 4.2194962501526, 358.23669433594, 0, 90.758056640625) -- Towtruck
car[5] = createVehicle(525, -2669.1005859375, 456.0322265625, 4.2138733863831, 358.14331054688, 0, 90.763549804688) -- Towtruck
car[6] = createVehicle(525, -2678.951171875, 455.673828125, 4.191376209259, 357.76977539063, 359.99450683594, 90.148315429688) -- Towtruck
car[7] = createVehicle(525, -2687.8173828125, 455.8154296875, 4.2132520675659, 358.13232421875, 0, 90.082397460938) -- Towtruck
car[8] = createVehicle(525, -2675.111328125, 452.1552734375, 4.2166185379028, 358.04992675781, 0.0494384765625, 91.224975585938) -- Towtruck
car[9] = createVehicle(525, -2683.7529296875, 452.1123046875, 4.2096977233887, 358.07739257813, 0, 90.362548828125) -- Towtruck
car[10] = createVehicle(489, -2640.5693359375, 358.2734375, 4.2574977874756, 358.01147460938, 0.0164794921875, 179.30786132813) -- Rancher
car[11] = createVehicle(489, -2635.7724609375, 358.5341796875, 4.2612628936768, 358.04443359375, 359.96704101563, 177.55554199219) -- Rancher
car[12] = createVehicle(489, -2630.9853515625, 358.4326171875, 4.2628078460693, 358.14331054688, 359.86267089844, 176.48986816406) -- Rancher
car[13] = createVehicle(489, -2625.615234375, 358.521484375, 4.2416858673096, 358.40698242188, 359.66491699219, 180.71411132813) -- Rancher
car[14] = createVehicle(417, -2876.1000976563, 486.60000610352, 3.9000000953674, 0, 0, 0) -- Leviathan

setVehicleAsMagnetHelicopter(car[14])

function Mechaniker_magnet (car)
if getElementData (car, "magnet") == false then
	setVehicleAsMagnetHelicopter(car)
end
end

mechanikerVehicles = {
[car[1]] = true,
[car[2]] = true,
[car[3]] = true,
[car[4]] = true,
[car[5]] = true,
[car[6]] = true,
[car[7]] = true,
[car[8]] = true,
[car[9]] = true,
[car[10]] = true,
[car[11]] = true,
[car[12]] = true,
[car[13]] = true,
[car[14]] = true
}


function VehicleMechanikerEnter ( player, seat )
	local veh = source
if veh == car[14] then
	Mechaniker_magnet(veh)
end
	if seat == 0 then
			if not isMechanikerDuty ( player ) then
				opticExitVehicle ( player )
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du bist kein Mechaniker oder nicht im Dienst!", player, 125, 0, 0 )
				else
					outputChatBox ( "You are not a mechanic!", player, 125, 0, 0 )			
				end
			end
	end
end

for index, c in next, car do
	toggleVehicleRespawn(c, true)
	setVehicleRespawnDelay(c, 5000)
	setVehicleIdleRespawnDelay(c, 30*60*1000) -- Halbe stunde
	setVehicleColor(c, 255, 255, 255, 0, 255, 0, 0, 0, 0)
if getElementModel(c) == 525 then
	addVehicleSirens(c, 3, 2, false, true, true, true)
	setVehicleSirens(c, 1, 0.55, -0.5, 1.5, 255, 0, 0, 200, 200)
	setVehicleSirens(c, 2, -0.55, -0.5, 1.5, 255, 0, 0, 255, 200)
	setVehicleSirens(c, 3, 0, -0.5, 1.5, 255, 255, 0, 255, 200)
	giveVehicleBetterEngine(c)
end
	addEventHandler("onVehicleEnter", c, VehicleMechanikerEnter )
end

function MechanikerMagnetExplode()
setElementData( car[14], "magnet", false)
end
addEventHandler("onVehicleExplode", car[14], MechanikerMagnetExplode)
