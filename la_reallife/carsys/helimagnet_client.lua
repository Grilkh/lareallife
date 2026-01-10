function clientRenderMagnet ()

	local vehitem = getPedOccupiedVehicle ( getLocalPlayer() )
	if vehitem then
		local mv = getElementData ( vehitem, "magnet" )
		if mv then
			local x1, y1, z1 = getElementPosition ( mv )
			local x2, y2, z2 = getElementPosition ( vehitem )
			dxDrawLine3D ( x1, y1, z1, x2, y2, z2, tocolor ( 100, 100, 100, 255 ), 10 )
		end
	end
end
addEventHandler ( "onClientRender", getRootElement(), clientRenderMagnet )



-- Variablen
local cFunc = {}
local cSetting = {}
 
 
-- FUNCTIONS --
 
cSetting["allowed"] = { -- Die Modelle die Erlaubt sind
        [606] = true, -- Trailer #1
                                  -- Weiter eintragen
}
 
cFunc["checkTrailer"] = function() -- Die Check Trailer Funktion
        if(isPedInVehicle(localPlayer) == false) then -- Wenn der Client nicht in einem Auto sitzt
                local x, y, z = getElementPosition(localPlayer) -- Erhalte die Position
                local vehicle, dis = getNearestElement(x, y, z, "vehicle") -- Bekomme das naheste Fahrzeug und die Entfernung
                if(vehicle) then -- Wenn ueberhaupt eins exestiert
                        if(dis < 10) and (cSetting["allowed"][getElementModel(vehicle)]) then -- Wenn es weniger als 10 Meter entfernt ist und ein zulaessiges Fahrzeug ist
                                triggerServerEvent("doTrailerEinsteigen", localPlayer, vehicle) -- Triggere das Event
                        end -- Block zuende
                end -- Block zuende
        end -- Block zuende
end -- Funktion zuende
 
bindKey("enter_exit", "down", cFunc["checkTrailer"]) -- Binde die Funktion auf die Einsteigen Taste
 
 
function getNearestElement(x, y, z, theElement) -- Funktionsname
        if not(theElement) then -- Wenn kein Element angegeben wurde
                theElement = "player" -- Default Player
        end -- Block zuende
        local pos = math.huge -- Erstelle neue Variable die sehr gross ist
        local lastelement = false -- Das Element, bis jetzt False
        for index, element in pairs(getElementsByType(theElement)) do -- Gehe alle Elemente des Types durch
                local x2, y2, z2 = getElementPosition(element) -- Erhalte die Position
                if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) < pos) then -- Wenn die Distanz kleiner ist als die Distanz, die schon exestiert
                        pos = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) -- Speichere die neue Distanz
                        lastelement = element -- Speichere das neue Element
                end -- Block zuende
        end -- Block zuende
        if(pos == math.huge) then -- Wenn kein Element Gefunden wurde(huge)
                pos = false -- Automatisch false
        end -- Block Zuende
        return lastelement, pos; -- Gibt das Element und die Distance wieder
end