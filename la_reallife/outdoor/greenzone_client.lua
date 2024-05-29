------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

addEvent("enableGodMode", true)
addEvent("disableGodMode", true)
addEventHandler ("enableGodMode", getRootElement(), 
function()
  addEventHandler ("onClientPlayerDamage", getRootElement(), cancelEventEvent)
--	local sound = playSound("sounds/herzschlag.wav")
--	setSoundVolume(sound, 1)
end)

addEventHandler ("disableGodMode", getRootElement(), 
function()
  removeEventHandler ("onClientPlayerDamage", getRootElement(), cancelEventEvent)
end)

function cancelEventEvent () cancelEvent() end 

--liedje in piratenschip
--[[MusicBahnhof = createColCuboid (-2025.285, 165.560, 28.83,10,10,10)
addEventHandler ("onClientColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
  if (source == MusicBahnhof) and (hitElement == getLocalPlayer()) then
    setRadioChannel (7)
  end
end)
addEventHandler ("onClientColShapeLeave", getRootElement(), 
function(leaveElement, matchingDimension)
  if (source == MusicBahnhof) and (leaveElement == getLocalPlayer()) then
    setRadioChannel (0)
  end
end)]]


function stopDriveBy()
if isPedDoingGangDriveby ( getLocalPlayer () ) then
        if getElementData ( getLocalPlayer (), "nodmzone") == 1 then
				setPedWeaponSlot ( getLocalPlayer (), 0 )
                setPedDoingGangDriveby ( getLocalPlayer (), false )
				--outputChatBox("Du bist in einer Schutzzone!") -- Warnung
        end
end
end
setTimer ( stopDriveBy, 1000, 0 )

function wastedsound (killer, weapon, bodypart) 
	local sound = playSound("sounds/herzschlag.wav")
	setSoundVolume(sound, 10)
end
 
addEventHandler("onClientPlayerWasted", getLocalPlayer(), wastedsound)