-- Simple Police-Lights by MuLTi!

p_lights = {}
p_timer = {}
p_lvar = {}
p_pvar = {}
p_lvar2 = {}
p_lvar3 = {}
p_lvar4 = {}

function toggleLights(thePlayer, cmd)
	local veh = getPedOccupiedVehicle(thePlayer)
	local id = getElementModel(veh)
	if (id == 598) or (id == 596) or (id == 597) or (id == 599) or (id == 523) or (id == 470) or (id == 490) or (id == 427) then
				if(p_lights[veh] == 0) or(p_lights[veh] == nil) then
				p_lights[veh] = 1
				--outputChatBox("Lichter eingeschaltet.", thePlayer, 0, 200, 100, true)
				setVehicleOverrideLights ( veh, 2 )
				p_timer[veh] = setTimer(
				function()
					if(p_lvar3[veh] == 4) then
						setTimer(function() p_lvar3[veh] = 0 end, 1000, 1)
						setTimer(
						function()
							if(p_lvar4[veh] == 1)then
								p_lvar4[veh] = 0
								-- 0 = vorne links 1 = vorne rechts 2 = hinten links 3 = hinten rechts
								setVehicleLightState ( veh, 1, 0)
								setVehicleLightState ( veh, 2, 0)
								setVehicleLightState ( veh, 0, 1)
								setVehicleLightState ( veh, 3, 1)
								setVehicleHeadLightColor(veh, 77, 77, 255)
							else
								setVehicleLightState ( veh, 3, 0)
								setVehicleLightState ( veh, 0, 0)
								setVehicleLightState ( veh, 1, 1)
								setVehicleLightState ( veh, 2, 1)	
								setVehicleHeadLightColor(veh, 255, 77, 77)
								p_lvar4[veh] = 1
							end
						end, 50, 5)
					return end
					if(p_lvar2[veh] == 0) or (p_lvar2[veh] == nil) then
						p_lvar2[veh] = 1
						-- 0 = vorne links 1 = vorne rechts 2 = hinten links 3 = hinten rechts
						setVehicleLightState ( veh, 1, 0)
						setVehicleLightState ( veh, 2, 0)
						setVehicleLightState ( veh, 0, 1)
						setVehicleLightState ( veh, 3, 1)
						setVehicleHeadLightColor(veh, 0, 0, 255)
					else
						setVehicleLightState ( veh, 3, 0)
						setVehicleLightState ( veh, 0, 0)
						setVehicleLightState ( veh, 1, 1)
						setVehicleLightState ( veh, 2, 1)	
						setVehicleHeadLightColor(veh, 255, 0, 0)
						p_lvar2[veh] = 0
					end
					if(p_lvar3[veh] == nil) then p_lvar3[veh] = 0  end
					p_lvar3[veh] = (p_lvar3[veh]+1)
				end, 500, 0)
				else
					p_lights[veh] = 0
					--outputChatBox("Lichter ausgeschaltet.", thePlayer, 0, 100, 200, true)
					killTimer(p_timer[veh])
					setVehicleLightState ( veh, 0, 0)
					setVehicleLightState ( veh, 1, 0)
					setVehicleLightState ( veh, 2, 0)
					setVehicleLightState ( veh, 3, 0)	
					setVehicleHeadLightColor(veh, 255, 255, 255)
					setVehicleOverrideLights ( veh, 1 )
				end
				end
end
addCommandHandler("licht", toggleLights)
addEventHandler ( "onVehicleEnter", getRootElement(), toggleLights )

addEventHandler ( "onVehicleExplode", getRootElement(), 
function()
	if(p_lights[source] == 1) then
		killTimer(p_timer[source])	
	end
end )

addEventHandler ( "onVehicleRespawn", getRootElement(), 
function()
	if(p_lights[source] == 1) then
		killTimer(p_timer[source])	
	end
end )

addEventHandler("onElementDestroy", getRootElement(), 
function ()
	if getElementType(source) == "vehicle" then
		if(p_lights[source] == 1) then
			killTimer(p_timer[source])
		end
	end
end)








addEvent ("poopoutthemine", true )

function laymine(player)
if laGetElementData ( player, "job" ) == "special" then
	if ( isPedDucked ( player) ) then
		if laGetElementData ( player, "mine" ) == 1 then else laSetElementData ( player, "mine", 0 ) end
		if laGetElementData ( player, "mine" ) == 0 then
			local posx, posy, posz = getElementPosition ( player )
			local landmine = createObject ( 1510, posx, posy, posz - .999, 0, 0, 3.18 )
			local landminecol = createColSphere ( posx, posy, posz, 3 )
			setElementData ( landminecol, "type", "alandmine" )
			setElementData ( landminecol, "owner", player )
			setElementData ( landmine, "type", "proximity" )
			setElementParent ( landmine, landminecol )
			setPedAnimation(player, "bomber", "BOM_Plant",3000,false,false,true)
			laSetElementData ( player, "mine", 1 )
		else
			outputChatBox("Du hast bereits eine Mine gelegt!", player, 255, 0, 0 )
		end
	else
		outputChatBox("Du musst dich ducken!", player, 255, 0, 0 )
	end
else
	outputChatBox("Du bist kein Special Forces Soldat!", player, 255, 0, 0 )
end
end
addCommandHandler("mine", laymine)

--DETECTS THE HIT
function landminehit ( player, matchingDimension )
	if ( getElementData ( source, "type" ) == "alandmine" ) then
			local mineowner = getElementData ( source, "owner" )
				if mineowner ~= player then
					local posx, posy, posz = getElementPosition ( source )
					createExplosion (posx, posy, posz, 8, mineowner )
					setElementData ( source, "type", nil )
					destroyElement ( source )
					laSetElementData ( mineowner, "mine", 0 )
				else
					outputChatBox("Vorsicht, auf dem Boden sind Minen!", player, 255, 0, 0 )
				end
	end
end
addEventHandler ( "onColShapeHit", getRootElement(), landminehit )


--SHIELD

addEvent ("shieldup", true )

function maketheshield (player)
local posx, posy, posz = getElementPosition ( shield )
local curskin = getElementModel ( player )
if isOnDuty (player) and curskin == 285 then
	if laGetElementData ( player, "shield" ) == 1 then else laSetElementData ( player, "shield", 0 ) end
	if laGetElementData ( player, "shield" ) == 1 then
		if getDistanceBetweenPoints3D ( posx, posy, posz, getElementPosition ( player ) ) < 5 then
			destroyElement ( shield )
			laSetElementData ( player, "shield", 0 )
			outputChatBox("Schutzschild zerstört!", player, 0, 0, 255 )
		else
			outputChatBox("Du bist zu weit weg!", player, 255, 0, 0 )
			
		end
	else
		local x, y, z = getElementPosition( player )
		shield = createObject ( 1631, x, y, z, 0, 0, 0 )
		laSetElementData ( player, "shield", 1 )
		outputChatBox("Schutzschild erstellt!", player, 0, 255, 0 )
		setTimer(destroyShield, 300000, 1)
	end
else
	outputChatBox("Du bist kein S.W.A.T.!", player, 255, 0, 0 )
end
end
addCommandHandler("shield", maketheshield)
addEventHandler("shieldup", getRootElement() , maketheshield)

function destroyShield ()

destroyElement ( shield )
laSetElementData ( player, "shield", 0 )
end




