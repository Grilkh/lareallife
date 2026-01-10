-- VARIABLEN --

function setemergencypermission_func ( player, cmd, target, perm)
	
	local target = getPlayerFromName ( target )
	if target then
		if isEmergency ( player ) then
			if perm then
				if (perm == "medic") or (perm == "mechaniker") then
					if laGetElementData ( player, "rang" ) == 6 then
						if perm == "medic" then
							laSetElementData ( target, "permission", "medic")
						elseif perm == "mechaniker" then
							laSetElementData ( target, "permission", "mechaniker")
						end
						outputChatBox ( ""..getPlayerName ( player ).." hat dich zum "..perm.." gemacht.", target, 0, 0, 100 )
						outputChatBox ( "Du hast "..getPlayerName ( target ).." zum "..perm.." gemacht.", player, 0, 0, 100 )
					elseif laGetElementData ( player, "rang" ) == 5 then
						if isMedic ( player ) then
							if perm == "medic" then
								if not isMechaniker ( player ) then
									laSetElementData ( target, "permission", "medic")							
									outputChatBox ( ""..getPlayerName ( player ).." hat dich zum "..perm.." gemacht.", target, 0, 0, 100 )
									outputChatBox ( "Du hast "..getPlayerName ( target ).." zum "..perm.." gemacht.", player, 0, 0, 100 )
								else
									outputChatBox ( "Der Spieler ist bereits Notarzt!", player, 150, 0, 0 )
								end
							else
								outputChatBox ( "Gebrauch: /permission [Name] medic", player, 150, 0, 0 )
							end
						elseif isMechaniker ( player ) then
							if perm == "mechaniker" then
								if not isMedic ( player ) then
									laSetElementData ( target, "permission", "mechaniker")							
									outputChatBox ( ""..getPlayerName ( player ).." hat dich zum "..perm.." gemacht.", target, 0, 0, 100 )
									outputChatBox ( "Du hast "..getPlayerName ( target ).." zum "..perm.." gemacht.", player, 0, 0, 100 )
								else
									outputChatBox ( "Der Spieler ist bereits Mechaniker!", player, 150, 0, 0 )
								end
							else
								outputChatBox ( "Gebrauch: /permission [Name] mechaniker", player, 150, 0, 0 )
							end
						end
					end
				else
					outputChatBox ( "Gebrauch: /permission [Name] [mechaniker oder medic]", player, 150, 0, 0 )
				end
			else
				outputChatBox ( "Gebrauch: /permission [Name] [mechaniker oder medic]", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du bist kein Mitglied des Notdienstes!", player, 175, 0, 0 )
		end
	else
		outputChatBox ( "Gebrauch: /permission [Name] [mechaniker oder medic]", player, 150, 0, 0 )
	end
end
addCommandHandler ( "permission", setemergencypermission_func )


local debugmodus = false

--[[local wasted_spawnpos = { -- Die Position wo man spawnt wenn man Tot ist, bzw sollte(An den  betten)
	{429.7522277832, 266.53988647461, 996.81188964844, 180},
	{425.37951660156, 267.01010131836, 996.81188964844, 180},
	{421.30526733398, 266.46600341797, 996.81188964844, 180},
	{417.05532836914, 266.48602294922, 996.81188964844, 180},
	{412.98022460938, 266.76217651367, 996.81188964844, 180},
	{408.82968139648, 266.78668212891, 996.81188964844, 180},
	{450.75161743164, 260.63830566406, 996.81188964844, 90},
	{450.458984375, 263.92669677734, 996.81188964844, 90},
	{450.48785400391, 257.06845092773, 996.81188964844, 90},
	{450.69598388672, 253.56640625, 996.81188964844, 90},
	{450.66326904297, 248.30767822266, 996.81188964844, 90},
}
-- 2103

local wasted_spawnint = 3
local wasted_spawndim = 0]]

--[[
Hier ein Beispiel:

local spawnpunkt = math.random(1, #wasted_spawnpos)
local x, y, z = wasted_spawnpos[spawnpunkt][1], wasted_spawnpos[spawnpunkt][2], wasted_spawnpos[spawnpunkt][3]
local rot = wasted_spawnpos[spawnpunkt][4]

setElementPosition(thePlayer, x, y, z)
setElementInterior(thePlayer, wasted_spawnint)
setElementDimension(thePlayer, wasted_spawndim)
setPedRotation(thePlayer, rot)
]]

-- DUTY --

--[[addCommandHandler("medic", function(thePlayer, cmd)
	if(debugmodus == true) then
		local f = getElementData(thePlayer, "fraktion")
		if(f == "medic") then
			setElementData(thePlayer, "fraktion", nil)
			outputChatBox("Du bist nun kein Sanitäter mehr!", thePlayer, 150, 0, 0)
		else
			setElementData(thePlayer, "fraktion", "medic")
			outputChatBox("Du bist nun Sanitäter!", thePlayer, 0, 150, 0)
		end
	end
end)]]

-- INTERIOR OBJECT --

local radio = createObject(2103, 409.51727294922, 262.29370117188, 997.16198730469, 0, 0, 130)
setElementInterior(radio, 3)

local innenraum = createObject(14594, 242.4009552002, 995.79626464844, 0, 0, 179.99450683594)
setElementInterior(innenraum, 3)

-- INT MARKER --

local marker1 = createMarker(437.60995483398, 230.7248840332, 996.91188964844, "corona", 1.5, 0, 255, 0, 150)
setElementInterior(marker1, 3)

local marker2 = createMarker(-2655.1066894531, 640.07641601563, 14.554549789429, "corona", 1.5, 0, 255, 0, 150)

addEventHandler("onMarkerHit", marker1, function(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, -2655.2829589844, 638.32342529297, 14.453125)
		setElementInterior(hitElement, 0)
		infobox ( hitElement, "\n\nPass besser auf dich auf!", 5000, 0, 125, 0 )
	end
end
end)

addEventHandler("onMarkerHit", marker2, function(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition(hitElement, 435.42782592773, 230.65969848633, 996.81188964844)
		setElementInterior(hitElement, 3)
		infobox ( hitElement, "\n\nWillkommen im Krankenhaus!", 5000, 0, 125, 0 )
	end
end
end)

local m_pick = {}
local m_mark = {}
local m_blip = {}

-- MEDIPACK AUFLADEN --

local marker_medipack = createMarker(398.35266113281, 258.39260864258, 996.01188964844, "cylinder", 2.0, 255, 0, 0, 150)
setElementInterior(marker_medipack, 3)

addEventHandler("onMarkerHit", marker_medipack, function(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if(isMedic(hitElement)) then
		outputChatBox("[INFO]: Nutze /loadmedikits um deine Medipacks wieder aufzuladen!", hitElement, 150, 150, 0)
	else
		outputChatBox("[INFO]: Nur für Mitarbeiter der Los Angeles Emergency!", hitElement, 175, 0, 0)
	end
end
end)

addCommandHandler("loadmedikits", function(thePlayer)
	if(isMedic(thePlayer)) and (isMedicDuty(thePlayer)) and (isElementWithinMarker(thePlayer, marker_medipack)) then
		laSetElementData(thePlayer, "medic:medikits", 10)
		outputChatBox("Du hast deine Medikits erfolgreich aufgeladen! Du hast nun 10 Stück. Nutze /usekit um jemanden zu heilen!", thePlayer, 0, 150, 0)
	else
		outputChatBox("Du bist kein Mitarbeiter/Nicht onDuty/Zu weit entfernt!", thePlayer, 150, 0, 0)
	end
end)

addCommandHandler("usekit", function(thePlayer, cmd, target)
	if(target) and (getPlayerFromName(target)) and (getPlayerName(thePlayer) ~= target) then
		if(isMedic(thePlayer)) and (isMedicDuty(thePlayer)) then
			target = getPlayerFromName(target)
			local carheal = false
			if(isPedInVehicle(thePlayer)) and (isPedInVehicle(target)) and (getElementModel(getPedOccupiedVehicle(thePlayer) == 416)) and (getElementModel(getPedOccupiedVehicle(target) == 416)) then
				carheal = true
			end
			local x, y, z = getElementPosition(thePlayer)
			local x2, y2, z2 = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 20) then
				outputChatBox("Du bist nicht nahe genug am Ziel!", thePlayer, 150, 0, 0)
				return
			end
			local kits = tonumber(laGetElementData(thePlayer, "medic:medikits"))
			if not(kits) or (kits < 1) and (carheal == false) then
				outputChatBox("Du hast keine Medikits bei dir! Lade in dem Krankenhaus in SF welche auf.", thePlayer, 150, 0, 0)
				return
			end
			if(carheal == false) then
				laSetElementData(thePlayer, "medic:medikits", kits-1)
				local x1, y1, z1 = getElementPosition(target)
				local x2, y2, z2 = getElementPosition(thePlayer)
				local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
				rot = rot-90
				setPedRotation(target, rot)
				
				x1, y1, z1 = getElementPosition(thePlayer)
				x2, y2, z2 = getElementPosition(target)
				rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
				rot = rot-90
			setPedRotation(thePlayer, rot)
			end
			toggleAllControls(target, false)
			toggleAllControls(thePlayer, false)
			setPedAnimation(thePlayer, "INT_SHOP", "shop_self", -1, true, false, false)
			outputChatBox("Heile Spieler...", thePlayer, 0, 255, 255)
			setTimer(function()
				toggleAllControls(target, true)
				toggleAllControls(thePlayer, true)
				setPedAnimation(thePlayer)
				outputChatBox("[INFO]: Du wurdest von Sanitäter "..getPlayerName(thePlayer).." geheilt!", target, 200, 200, 0)
				if(carheal == false) then
					outputChatBox("[INFO]: Du hast "..getPlayerName(target).." geheilt! Verbleibene Kits: "..(kits-1), thePlayer, 0, 150, 0)
					setElementData(thePlayer, "medic:medickits", kits-1)
				else
					outputChatBox("[INFO]: Du hast "..getPlayerName(target).." geheilt! Da du in einem Krankenwagen sitzt, hast du kein Kit verbraucht.", thePlayer, 0, 150, 0)
				end
				setElementHealth(target, 100)
				if(getPedArmor(target) < 50) then
					setPedArmor(target, 50)
				end
			end, 2000, 1)
		else
			outputChatBox("Du bist kein Sanitäter/Nicht im Dienst!", thePlayer, 150, 0, 0)
		end
	else
		outputChatBox("Spieler ist nicht online/Ungültig!", thePlayer, 175, 0, 0)
	end
end)

-- DUTY FUNC --

local duty_marker = createMarker(413.16009521484, 257.68475341797, 995.51188964844, "cylinder", 1.5, 255, 0, 0, 150)
setElementInterior(duty_marker, 3)

addEventHandler("onMarkerHit", duty_marker, function(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if(isMedic(hitElement)) then
		outputChatBox("[INFO]: Nutze /medic um in Dienst zu gehen/den Dienst zu verlassen!", hitElement, 200, 200, 0)
	else
		outputChatBox("Nur für Mitarbeiter der Los Angeles Emergency!", hitElement, 175, 0, 0)
	end
end
end)

addCommandHandler("medic", function(thePlayer)
	if(isMedic(thePlayer)) and (isElementWithinMarker(thePlayer, duty_marker)) then
		local duty = getElementData(thePlayer, "medic:duty")
		if(duty == true) then
			setElementData(thePlayer, "medic:duty", false)
			outputChatBox("[INFO]: Du bist nun nicht mehr als Sanitäter im Dienst!", thePlayer, 200, 200, 0)
			takeWeapon(thePlayer, 41)
			setElementModel ( thePlayer, laGetElementData ( thePlayer, "skinid" ) )
		else
			setElementData(thePlayer, "medic:duty", true)
			outputChatBox("[INFO]: Du bist nun als Sanitäter im Dienst!", thePlayer, 200, 200, 0)
			outputChatBox("[INFO]: Ausserdem hast du 5 Medikits erhalten, /usekit!", thePlayer, 200, 200, 0)
			setElementModel ( thePlayer, 276 )
			giveWeapon(thePlayer, 41, 1000, true)
			laSetElementData(thePlayer, "medic:medikits", 5)
		end
	else
		outputChatBox("Du bist kein Mitarbeiter/Nicht nahe genug am Marker!", thePlayer, 150, 0, 0)
	end
end)

-- SICHERHEITSHINWEIS --
--[[
function isMedic(thePlayer)
	if(getElementData(thePlayer, "fraktion") == "medic") then
		return true;
	else
		return false;
	end
end]]

-- Sollte so bleiben --
function isMedicDuty(thePlayer)
	if(getElementData(thePlayer, "medic:duty") == true) then
		return true;
	else
		return false;
	end
end