------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local Caligulas_in = createMarker(2196.1999511719, 1677.1999511719, 12, "corona", 1.5, 0, 255, 0, 150)

local function Caligulas_in_func(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, 2233.97265625, 1712.4775390625, 1011.8397216797)
		setElementInterior(hitElement, 1)
		setElementDimension(hitElement, 0)
		infobox ( hitElement, "\n\nHerzlich willkommen im Caligulas!", 5000, 0, 125, 0 )
	end
end
end
addEventHandler("onMarkerHit",Caligulas_in,Caligulas_in_func)

local Caligulas_out = createMarker(2233.9963378906, 1714.1800537109, 1012.3666992188, "corona", 1.5, 0, 255, 0, 150)
setElementInterior ( Caligulas_out, 1 )

local function Caligulas_out_func(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	setElementPosition(hitElement, 2194.3999023438, 1677.1999511719, 12)
	setElementInterior(hitElement, 0)
	setElementDimension(hitElement, 0)
end
end
addEventHandler("onMarkerHit",Caligulas_out,Caligulas_out_func)

FourDragons_in = createMarker(2020.2043457031, 1007.7569580078, 10.2054075241089, "corona", 1.5, 0, 255, 0, 150)

function FourDragons_in_func(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, 2015.7701416016, 1017.8104858398, 996.52423095703)
		setElementInterior(hitElement, 10)
		setElementDimension(hitElement, 0)
		infobox ( hitElement, "\n\nHerzlich willkommen im Four Dragons!", 5000, 0, 125, 0 )
	end
end
end
addEventHandler("onMarkerHit",FourDragons_in,FourDragons_in_func)

local FourDragons_out = createMarker(2018.6097412109, 1017.8402099609, 996.84375, "corona", 1.5, 0, 255, 0, 150)
setElementInterior ( FourDragons_out, 10 )

function FourDragons_out_func(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	setElementPosition(hitElement, 2022.0834960938, 1007.7553710938, 10.469537734985)
	setElementInterior(hitElement, 0)
	setElementDimension(hitElement, 0)
end
end
addEventHandler("onMarkerHit",FourDragons_out,FourDragons_out_func)