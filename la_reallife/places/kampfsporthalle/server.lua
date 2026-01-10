local marker = {}

marker["in"] = createMarker(-2269.8073730469, -156.02883911133, 35.3203125, "corona", 1.5, 0, 255, 0)

addEventHandler("onMarkerHit", marker["in"], function(hitElement, dim)
if (dim) then
	if(getElementType(hitElement) == "player") and (isPedInVehicle(hitElement) == false) then
		setInPosition(hitElement, 774.174, -75.887, 1000.654, 7)
		infobox ( hitElement, "\n\nWillkommen in der Kampfsporthalle!", 5000, 0, 125, 0 )
		laSetElementData ( hitElement, "inKampfsport", true )
	end
end
end)


marker["out"] = createMarker(773.92095947266, -78.402938842773, 1000.6621704102, "corona", 1.50, 0, 255, 0)
setElementInterior(marker["out"], 7)

addEventHandler("onMarkerHit", marker["out"], function(hitElement, dim)
if (dim) then
	if(getElementType(hitElement) == "player") and (isPedInVehicle(hitElement) == false) then
		setInPosition(hitElement, -2268.0764160156, -156.06053161621, 35.3203125, 0)
		laSetElementData ( hitElement, "inKampfsport", false )
	end
end
end)



local fadeP = {}
function setInPosition(thePlayer, x, y, z, interior, typ, dim)
	if not(thePlayer) then return end
	if (getElementType(thePlayer) == "vehicle") then return end
	if(isPedInVehicle(thePlayer)) then return end
	if not(x) or not(y) or not(z) then return end
	if not(interior) then interior = 0 end
	if(fadeP[thePlayer] == 1) then return end
	fadeP[thePlayer] = 1
	fadeCamera(thePlayer, false)
	setElementFrozen(thePlayer, true)
	setTimer(
		function()
		fadeP[thePlayer] = 0
		setElementPosition(thePlayer, x, y, z)
		setElementInterior(thePlayer, interior)
		if(dim) then setElementDimension(thePlayer, dim) end
		fadeCamera(thePlayer, true)
		if not(typ) then
			setElementFrozen(thePlayer, false)
		else
			if(typ == true)  then
				setTimer(setElementFrozen, 1000, 1, thePlayer, false)
			end
		end
	end, 1000, 1)
end

-- KAMPFART --

local lastdim = 2

local art_namen = {
	[1] = 4, -- Standard
	[2] = 5, -- Boxen
	[3] = 6, -- Kung-Fu
	[4] = 7, -- Knee-Head
	[5] = 15, -- Grab-kick
	[6] = 16, -- Ellenbogen

}

local fight_doing = {}

addEvent("doLALearnKampfart", true)
addEvent("doLALearnKampfartFinish", true)

addEventHandler("doLALearnKampfart", getRootElement(), function(art)
	if(fight_doing[source] == true) then return end
	fight_doing[source] = true
	fadeCamera(source, false)
	local thePlayer = source
	setTimer(function()
		fadeCamera(thePlayer, true)
		setElementDimension(thePlayer, lastdim)
		lastdim = lastdim+1
		triggerClientEvent(thePlayer, "doLALearnKampfartClient", thePlayer, art_namen[art])
		setPedFightingStyle(thePlayer, art_namen[art])
		setElementPosition(thePlayer, 766.75299072266, -66.204689025879, 1001.569152832)
		setPedRotation(thePlayer, 180)
		outputChatBox("Besiege den Profi, um die Kampfart zu lernen!", thePlayer, 0, 255, 0)
		outputChatBox("Verwende 'F' oder 'Enter', um die Kampfart zu benutzen!", thePlayer, 0, 255, 0)
		toggleControl(thePlayer, "jump", false)
		setPedWeaponSlot(thePlayer, 0)
		toggleControl(thePlayer, "previous_weapon", false)
		toggleControl(thePlayer, "next_weapon", false)
	end, 2000, 1)
end)

addEventHandler("doLALearnKampfartFinish", getRootElement(), function(art)
	-- SICHERHEITSHINWEIS, ART MUSS GESPEICHERT WERDEN --
	local art = getPedFightingStyle(source)
	setElementDimension(source, 0)
	setElementPosition(source, 762.25140380859, -76.384574890137, 1000.65625)
	outputChatBox("Glückwunsch, du hast diese Kampfart erfolgreich erlernt!", source, 0, 255, 0)
	local pname = getPlayerName(source)
	MySQL_SetString("bonustable", "CurStyle", ""..art.."", "Name LIKE '"..pname.."'")
	fight_doing[source] = false
	fadeCamera(source, true)
end)

addEventHandler("onPlayerWasted", getRootElement(), function()
	if(fight_doing[source] == true) then
		fight_doing[source] = false
		setElementDimension(source, 0)
		triggerClientEvent(source, "doLAKampfartFail", source)
	end
end)