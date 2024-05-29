------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

addEventHandler ("onResourceStart", getRootElement(), 
function()
  local allGreenzones = getElementsByType ("radararea")
  for i,v in ipairs (allGreenzones) do
    local r,g,b,a = getRadarAreaColor (v)
    if (r == 0) and (g == 255) and (b == 0) and (a == 127) then
      local x,y = getElementPosition (v)
      local sx,sy = getRadarAreaSize (v)
      local col = createColCuboid (x,y, -50, sx,sy, 7500)
      setElementID (col, "greenzoneColshape")
    end
  end
end)

addEventHandler ("onColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
  if (getElementType (hitElement) == "player") and (getElementID (source) == "greenzoneColshape") then
	if getElementData ( hitElement, "sprache" ) == "Deutsch" then
		infobox ( hitElement, "\n\nDu hast eine Schutzzone betreten!", 5000, 0, 150, 0 )
	else
		infobox ( hitElement, "\n\nYou are entering a security area!", 5000, 0, 150, 0 )	
	end
	setElementData ( hitElement, "nodmzone", 1)
    toggleControl (hitElement, "fire", false)
    toggleControl (hitElement, "next_weapon", false)
    toggleControl (hitElement, "prelaus_weapon", false)
    toggleControl (hitElement, "aim_weapon", false)
    toggleControl (hitElement, "vehicle_fire", false)
    showPlayerHudComponent (hitElement, "ammo", false)
    showPlayerHudComponent (hitElement, "weapon", false)
    --triggerClientEvent (hitElement, "enableGodMode", hitElement)
  end
end)

addEventHandler ("onColShapeLeave", getRootElement(), 
function(leaveElement, matchingDimension)
  if (getElementType (leaveElement) == "player") and (getElementID (source) == "greenzoneColshape") then
 	if getElementData ( leaveElement, "sprache" ) == "Deutsch" then
		infobox ( leaveElement, "\n\nDu hast die Schutzzone verlassen!", 5000, 150, 0, 0 )
	else
		infobox ( leaveElement, "\n\nYou left the safety zone!", 5000, 150, 0, 0 )	
	end
	setElementData ( leaveElement, "nodmzone", 0)
    toggleControl (leaveElement, "fire", true)
    toggleControl (leaveElement, "next_weapon", true)
    toggleControl (leaveElement, "prelaus_weapon", true)
    toggleControl (leaveElement, "aim_weapon", true)
    toggleControl (leaveElement, "vehicle_fire", true)
    showPlayerHudComponent (leaveElement, "ammo", true)
    showPlayerHudComponent (leaveElement, "weapon", true)
    --triggerClientEvent (leaveElement, "disableGodMode", leaveElement)
  end
end)