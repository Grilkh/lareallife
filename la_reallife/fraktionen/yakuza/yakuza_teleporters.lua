createObject ( 7245, -2213.9482421875, 774.56787109375, 5.2562294006348 )

local extraheight = 1.2
local YakuzaDownEntrance = createMarker ( -2172.6772460938, 679.87579345703, 54.16397857666+extraheight, "corona", 1.5, 255, 0, 0, 150 )
local YakuzaDownExit = createMarker ( -2170.3583984375, 635.75671386719, 1051.3493652344+extraheight, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior ( YakuzaDownExit, 1 )
local YakuzaRoofEntrance = createMarker ( -2163.9565429688, 676.29083251953, 82.131492614746+extraheight, "corona", 1.5, 255, 0, 0, 150 )
local YakuzaToRoof = createMarker ( -2171.1403808594, 645.33117675781, 1056.5302734375+extraheight, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior ( YakuzaToRoof, 1 )

function YakuzaDownEntrance_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isYakuza(hitElement) or isGatePermitted(hitElement) then
			fadeElementInterior ( hitElement, 1, -2170.2390136719, 637.73980712891, 1052.0241699219 )
			infobox ( hitElement, "\n\nWillkommen, Yakuzi!", 5000, 0, 125, 0 )
		end
	else
		outputChatBox ( "Du bist kein Yakuza oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaDownEntrance, YakuzaDownEntrance_func )

function YakuzaDownExit_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isYakuza(hitElement) or isGatePermitted(hitElement) then
			fadeElementInterior ( hitElement, 0, -2173.5454101563, 682.26794433594, 54.813526153564 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaDownExit, YakuzaDownExit_func )

function YakuzaRoofEntrance_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isYakuza(hitElement) or isGatePermitted(hitElement) then
			setElementInterior ( hitElement, 1,  -2170.518, 643.596, 1057.594 )
			infobox ( hitElement, "\n\nWillkommen, Yakuzi!", 5000, 0, 125, 0 )
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Yakuza oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaRoofEntrance, YakuzaRoofEntrance_func )

function YakuzaToRoof_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isYakuza(hitElement) or isGatePermitted(hitElement) then
			setElementInterior ( hitElement, 0, -2163.9748535156, 674.06390380859, 82.821098327637 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", YakuzaToRoof, YakuzaToRoof_func )

yakuzaCasinoTeleporters = {}
	local i = 0
	
	i = i + 1
	-- Roof -> Inner
	local optic
	local x, y, z, int, tx, ty, tz, tint, trot = 2018.0836181641, 1007.6577758789, 38.091094970703, 0, 1963.1157226563, 1062.2529296875, 994.11798095703, 10, 210
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	yakuzaCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( yakuzaCasinoTeleporters[i], int )
	laSetElementData ( yakuzaCasinoTeleporters[i], "x", tx )
	laSetElementData ( yakuzaCasinoTeleporters[i], "y", ty )
	laSetElementData ( yakuzaCasinoTeleporters[i], "z", tz )
	laSetElementData ( yakuzaCasinoTeleporters[i], "int", tint )
	laSetElementData ( yakuzaCasinoTeleporters[i], "rot", trot )
	-- Inner -> Roof
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1963.8132324219, 1063.4484863281, 993.42401123047, 10, 2016.6575927734, 1007.6748046875, 38.74, 0, 90
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	yakuzaCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( yakuzaCasinoTeleporters[i], int )
	laSetElementData ( yakuzaCasinoTeleporters[i], "x", tx )
	laSetElementData ( yakuzaCasinoTeleporters[i], "y", ty )
	laSetElementData ( yakuzaCasinoTeleporters[i], "z", tz )
	laSetElementData ( yakuzaCasinoTeleporters[i], "int", tint )
	laSetElementData ( yakuzaCasinoTeleporters[i], "rot", trot )
	-- Garage -> Inner
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1919.9337158203, 992.11108398438, 9.8066940307617, 0, 1963.1610107422, 973.486328125, 994.11798095703, 10, 330
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	yakuzaCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( yakuzaCasinoTeleporters[i], int )
	laSetElementData ( yakuzaCasinoTeleporters[i], "x", tx )
	laSetElementData ( yakuzaCasinoTeleporters[i], "y", ty )
	laSetElementData ( yakuzaCasinoTeleporters[i], "z", tz )
	laSetElementData ( yakuzaCasinoTeleporters[i], "int", tint )
	laSetElementData ( yakuzaCasinoTeleporters[i], "rot", trot )
	-- Inner -> Garage
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1963.8889160156, 972.15161132813, 993.41467285156, 10, 1918.3533935547, 992.06750488281, 10.461921691895, 0, 270 - 180
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	yakuzaCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( yakuzaCasinoTeleporters[i], int )
	laSetElementData ( yakuzaCasinoTeleporters[i], "x", tx )
	laSetElementData ( yakuzaCasinoTeleporters[i], "y", ty )
	laSetElementData ( yakuzaCasinoTeleporters[i], "z", tz )
	laSetElementData ( yakuzaCasinoTeleporters[i], "int", tint )
	laSetElementData ( yakuzaCasinoTeleporters[i], "rot", trot )

for i, index in pairs ( yakuzaCasinoTeleporters ) do

	addEventHandler ( "onMarkerHit", yakuzaCasinoTeleporters[i],
		function ( hit, dim )
			if getElementType(hit) == "player" and (dim) then
				if isPedInVehicle ( hit ) == false then
					if isYakuza ( hit ) then
						local x, y, z, int, rot = laGetElementData ( source, "x" ), laGetElementData ( source, "y" ), laGetElementData ( source, "z" ), laGetElementData ( source, "int" ), laGetElementData ( source, "rot" )
						fadeElementInterior ( hit, int, x, y, z, rot )
					end
				end
			end
		end
	)
end