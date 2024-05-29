PagePed = createPed ( 172, 2224.2, -1141.31, 1025.31 )
SecurPed1 = createPed ( 165, 2220.2, -1140.8, 1027.78 )
SecurPed2 = createPed ( 166, 2221.3, -1140.8, 1027.78 )
SecurPed3 = createPed ( 163, 2229.14, -1150.52, 1029.79 )
	
GastPed4 = createPed ( 26, 2223.46, -1152.7, 1025.79 )
GastPed5 = createPed ( 41, 2222.48, -1152.68, 1025.79 )
	
PageSpeakPed = createPed ( 171, 2214.9, -1146.7, 1025.8 )
setPedRotation ( PageSpeakPed, 270 )
	
setElementInterior ( PagePed, 15 )
setElementInterior ( SecurPed1, 15 )
setElementInterior ( SecurPed2, 15 )
setElementInterior ( SecurPed3, 15 )
setElementInterior ( GastPed4, 15 )
setElementInterior ( GastPed5, 15 )
setElementInterior ( PageSpeakPed, 15 )
setPedRotation ( PagePed, 180 )
setPedRotation ( SecurPed1, 180 )
setPedRotation ( SecurPed2, 180 )
setPedRotation ( SecurPed3, 90 )
setPedRotation ( GastPed4, 90 )
setPedRotation ( GastPed5, 270 )
setElementFrozen ( PagePed, true)
setElementFrozen ( SecurPed1, true)
setElementFrozen ( SecurPed2, true)
setElementFrozen ( SecurPed3, true)
setElementFrozen ( GastPed4, true)
setElementFrozen ( GastPed5, true)
setElementFrozen ( PageSpeakPed, true)

function chatPeds ( ped1, ped2 )

	local x1, y1, z1 = getElementPosition ( ped1 )
	local x2, y2, z2 = getElementPosition ( ped2 )
	local r1 = findRotation ( x1, y1, x2, y2 )
	local r2 = findRotation ( x2, y2, x1, y1 )
	setPedRotation ( ped1, r1 )
	setPedRotation ( ped2, r2 )
	setPedAnimation ( ped1, "ped", "IDLE_chat", -1, true, true, true )
	setTimer ( setPedAnimation, 500, 1, ped2, "ped", "IDLE_chat", -1, true, true, true )
end

chatPeds ( GastPed4, GastPed5 )

function startintro_func ( player )

setElementPosition ( player, 2215.053, -1150.637, 1025.797 )
setPedRotation( player, 270 )
setElementInterior ( player, 15 )
fadeCamera ( player, true )
setElementInterior ( player, 15 )
setElementPosition ( player, 2215.053, -1150.637, 1025.797 )
setPedRotation( player, 270)
setCameraTarget ( player, player )
	
triggerClientEvent ( player, "startIntro", player )

bindKey ( player, "ralt", "down", showcurser, player )
bindKey ( player, "m", "down", showcurser, player )
bindKey ( player, "f1", "down", showhmenue, player )
bindKey ( player, "r", "down", reload )
setElementAlpha ( player, 255)
end
--addCommandHandler ( "startintro", startintro_func )

function intfix_func ()

	local player = client
	setElementInterior ( player, 15 )
	setElementAlpha ( player, 255 )
	showPlayerHudComponent ( player, "radar", true )
end
addEvent ( "intfix", true )
addEventHandler ( "intfix", getRootElement(), intfix_func )

function tutfix_func ()

	local player = client
	setElementInterior ( player, 0 )
	setElementAlpha ( player, 255 )
	showPlayerHudComponent ( player, "radar", true )
	laSetElementData ( player, "isInTut", false )
end
addEvent ( "tutfix", true )
addEventHandler ( "tutfix", getRootElement(), tutfix_func )

function werber_func (lp, player, werber)

local player = MySQL_Save ( lp )
local werber = MySQL_Save ( werber )
MySQL_SetString("players", "Werber", werber, "Name LIKE '"..player.."'")

end
addEvent ( "werber", true )
addEventHandler ( "werber", getRootElement(), werber_func )