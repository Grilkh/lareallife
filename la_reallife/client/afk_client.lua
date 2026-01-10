action = false
oldAFKXPos = 0
oldAFKYPos = 0

function setInvulnerable ( bool )

	invulnerable = bool
end

function isInvulnerable ()

	return invulnerable
end

function godModeHandler ()

	if invulnerable then
		cancelEvent()
	end
end
addEventHandler ( "onClientPedDamage", getLocalPlayer(), godModeHandler )

function afkCheck_func ()

	if getElementData ( lp, "loggedin" ) then
		if not action and getElementData ( lp, "jailtime" ) <= 0 then
			local x, y, z = getElementPosition ( lp )
			triggerServerEvent ( "logoutPlayer", lp, x, y, z, getElementInterior ( lp ), getElementDimension ( lp ), getPedArmor ( lp ) )
		else
			action = false
		end
	end
end
-- setTimer ( afkCheck_func, 600000, -1 )
setTimer ( afkCheck_func, 600000, 0 )

afkRun = 0
function positionAFKCheck ()

	local x, y, z = getElementPosition ( lp )
	local dist = getDistanceBetweenPoints2D ( oldAFKXPos, oldAFKYPos, x, y )
	afkRun = afkRun + 1
	if dist > 5 or getElementHealth ( lp ) <= 1 or isElement ( gImage["Back"] ) or gWindow["pokerOwnCards"] == true then
		afkRun = 0
		action = true
	end
	if afkRun == 27 then
		outputChatBox ( "[WARNUNG]: Du wirst in einer Minute ausgeloggt.", 175, 0, 0 )
	end
	oldAFKXPos = x
	oldAFKYPos = y
end
-- setTimer ( positionAFKCheck, 20000, -1 )
setTimer ( positionAFKCheck, 20000, 0 )

function AFKPlayerChat ( msg )

	local tok = gettok ( msg, 1, string.byte ( ':' ) )
	if tok then
		if string.find ( tok, getPlayerName ( lp ) ) then
			action = true
		end
	end
end
addEventHandler ( "onClientChatMessage", getRootElement(), AFKPlayerChat )

function save_func ()

	if not getPedOccupiedVehicle ( lp ) and not isTimer ( logoutTimer ) then
		if getElementData ( lp, "In_DMArena" ) == 1 then
			outputChatBox ( "[INFO]: Du kannst dich hier nicht ausloggen!", 125, 0, 0 )
		else
			outputChatBox ( "[INFO]: Du wirst in 30 Sekunden ausgeloggt, wenn du dich bewegst brichst du den Vorgang ab!", 0, 100, 200 )
			-- logoutTimer = setTimer ( checkLogout, 500, -1 )
			logoutTimer = setTimer ( checkLogout, 500, 0 )
			logoutRuns = 0
			logoutX, logoutY, logoutZ = getElementPosition ( lp )
			laSetElementData ( lp, "savetimer", true )
		end
	end
end
addCommandHandler ( "save", save_func )

function checkLogout ()

	local x, y, z = getElementPosition ( lp )
	logoutRuns = logoutRuns + 1
	if x == logoutX and y == logoutY and z == logoutZ and not isPedDead ( lp ) then
		if logoutRuns == 60 then
			triggerServerEvent ( "logoutPlayer", lp, x, y, z, getElementInterior ( lp ), getElementDimension ( lp ), getPedArmor ( lp) )
		elseif logoutRuns/10 == math.floor ( logoutRuns/10+.01 ) then
			outputChatBox ( "[INFO]: Du wirst in "..((60-logoutRuns)/2).." Sekunden ausgeloggt!", 0, 100, 250 )
		end
	else
		outputChatBox ( "[INFO]: Logout abgebrochen!", 175, 0, 0 )
		laSetElementData ( lp, "savetimer", false )
		killTimer ( logoutTimer )
	end
end