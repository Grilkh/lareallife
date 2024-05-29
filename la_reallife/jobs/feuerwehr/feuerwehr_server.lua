------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
----- Script by The_CreeD ----

local matchDim = 1
matchDim= 1 + 1

notfallauto1 = createVehicle(407, -2022, 91.900001525879, 28.299999237061, 357.88403320313, 0, 270)
setElementDimension(notfallauto1, matchDim)

local feuerwehrauto1 = createVehicle(407, -2022, 91.900001525879, 28.299999237061, 357.88403320313, 0, 270)
local feuerwehrauto2 = createVehicle(407, -2022, 84.099998474121, 28.299999237061, 357.87963867188, 0, 270)
local feuerwehrauto3 = createVehicle(407, -2022, 75.800003051758, 28.299999237061, 357.87963867188, 0, 270)
local feuerwehrauto4 = createVehicle(407, -2054.1999511719, 92.800003051758, 28.799999237061, 0, 0, 90)
local feuerwehrauto5 = createVehicle(407, -2054.1999511719, 84.300003051758, 28.799999237061, 0, 0, 90)
local feuerwehrauto6 = createVehicle(407, -2054.3000488281, 76.199996948242, 28.799999237061, 0, 0, 90)

setVehicleLocked(feuerwehrauto1, true)
setVehicleLocked(feuerwehrauto2, true)
setVehicleLocked(feuerwehrauto3, true)
setVehicleLocked(feuerwehrauto4, true)
setVehicleLocked(feuerwehrauto5, true)
setVehicleLocked(feuerwehrauto6, true)

local feuerwehrmarker = createMarker(-2024.4000244141, 67.099998474121, 27.39999961853, 'cylinder', 1.5, 0, 255, 0, 150)
local explosionsmarker1 = createMarker(-2059.8999023438, -583.90002441406, 29.299999237061, 'cylinder', 80, 255, 0, 0)
local rettenmarker1 = createMarker(-2059.8999023438, -583.90002441406, 29.299999237061, 'cylinder', 10, 255, 0, 0)
setElementAlpha(explosionsmarker1, 0)
setElementAlpha(rettenmarker1, 0)

local function feuerwehr_info( hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		outputChatBox("Gebe hier /feuerwehr ein, um als Feuerwehrmann zu arbeiten!", hitElement, 120, 120, 0)
	end
end
end
addEventHandler("onMarkerHit", feuerwehrmarker, feuerwehr_info)

brand = math.random(1)

local function aktion(player)
	if isElementWithinMarker(player, feuerwehrmarker)
	and brand == 1 then
		feuerjobstate = "angenommen"
		zielblip1 = createBlip(-2059.8999023438, -583.90002441406, 29.299999237061, 41)
		unfallauto1 = createVehicle(580, -2059.8999023438, -583.90002441406, 29.299999237061, 3.9100341796875, 0, 130)
		unfallauto2 = createVehicle(405, -2061.5, -585.40002441406, 30.299999237061, 14.803833007813)
		hurt1 = createPed(125, -2057.8999023438, -583.90002441406, 29.299999237061)
		hurt2 = createPed(126, -2058.5, -584.40002441406, 30.299999237061, 14.803833007813)
		setElementDimension(player, matchDim)
		setElementDimension(zielblip1, getElementDimension(player))
		setElementDimension(unfallauto1, getElementDimension(player))
		setElementDimension(unfallauto2, getElementDimension(player))
		setElementDimension(hurt1, getElementDimension(player))
		setElementDimension(hurt2, getElementDimension(player))
		outputChatBox("Fahre zu dem Feuer, lösche es und gebe bei der Unfallstelle /retten ein, um die Opfer zu retten", player, 255, 0, 0)
		feuerstate = "brennend"
		geld = "ausstehend"
	end
end
addCommandHandler("feuerwehr", aktion)

local function feuer(hitPlayer, dim)
if getElementType(hitPlayer) == "player" and (dim) then
	if isPedInVehicle ( hitPlayer ) == false then
		if feuerstate == "brennend" then
			triggerClientEvent(hitPlayer, "onExplosion1", hitPlayer)
			blowVehicle(unfallauto1)
			setPedOnFire(hurt1, true)
			setPedOnFire(hurt2, true)
		end
	end
end
end
addEventHandler("onMarkerHit", explosionsmarker1, feuer)

function rescue(player)
if isElementWithinMarker(player, rettenmarker1) then
	outputChatBox("Du hast die Opfer gerettet! Begebe dich nun zur Feuerwehrwache zurück, um das Geld zu erhalten!", player, 0, 120, 120)
	destroyElement(zielblip1)
	abgebenblip = createBlip(-2024.4000244141, 67.099998474121, 27.39999961853, 41)
	abgebenmarker = createMarker(-2007.5, 75.800003051758, 28.299999237061, 357.87963867188, 'checkpoint', 2.5, 255, 0, 0)
	setElementDimension(abgebenmarker, getElementDimension(player))
	setElementDimension(abgebenblip, getElementDimension(player))
	feuerstate = "geloescht"
else
	outputChatBox("Du bist nicht nah genug dran! Gehe noch etwas näher an das Feuer!", player, 255, 0, 0)
end
end
addCommandHandler("retten", rescue)

local function beenden(hitPlayer, matchingDimension)
if getElementType(hitPlayer) == "player" and (dim) then
	if isPedInVehicle ( hitPlayer ) == false then
		if feuerstate == "geloescht" and
			geld == "ausstehend" then
			setElementPosition(unfallauto1, 0, 0, 0)
			setElementPosition(unfallauto2, 0, 0, 0)
			setElementPosition(abgebenmarker, 9999999, 0, 0, 0)
			setElementPosition(abgebenblip, 999999999, 0, 0, 0)
			setElementDimension(hitPlayer, 0)
			setElementPosition(hitPlayer, -2024.4000244141, 67.099998474121, 27.39999961853)
			setElementPosition(notfallauto1, -2022, 91.900001525879, 28.299999237061, 357.88403320313, 0, 270)
			givePlayerMoney(hitPlayer, 500)
			setElementPosition(hitPlayer, -2024.4000244141, 67.099998474121, 27.39999961853)
			removePedFromVehicle(hitPlayer, notfallauto1)
			outputChatBox("Du hast 1000$ erhalten!", hitPlayer, 200, 231, 12)--weil das geld zweimal gegeben wird(bug?)
			feuerjobstate = "beendet"
			geld = "ausgezahlt"
		end
	end
end
end
addEventHandler("onMarkerHit", getRootElement(), beenden)