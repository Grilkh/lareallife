gWindow = {}
gProgress = {}
gLabel = {}

function showTime_func ( minutes, seconds )

	if gWindow["time"] then
		guiSetVisible ( gWindow["time"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["time"] = guiCreateWindow(screenwidth-102, 48,96,48,"Verbleibende Zeit",false)
		guiSetAlpha(gWindow["time"],1)
		guiWindowSetMovable(gWindow["time"],false)
		guiWindowSetSizable(gWindow["time"],false)
		gLabel["curTime"] = guiCreateLabel(0.3229,0.5,0.5313,0.4167,"0:00",true,gWindow["time"])
		guiSetAlpha(gLabel["curTime"],1)
		guiLabelSetColor(gLabel["curTime"],025,025,200)
		guiLabelSetVerticalAlign(gLabel["curTime"],"top")
		guiLabelSetHorizontalAlign(gLabel["curTime"],"left",false)
		guiSetFont(gLabel["curTime"],"default-bold-small")
	end
	truckRemMinutes = minutes
	truckRemSeconds = seconds
	-- remainingTimeTruck = setTimer ( checkTruckTime, 1000, -1 )
	remainingTimeTruck = setTimer ( checkTruckTime, 1000, 0 )
end
addEvent ( "showTime", true )
addEventHandler ( "showTime", getRootElement(), showTime_func )

function checkTruckTime ()

	local player = getLocalPlayer()
	if getPedOccupiedVehicle ( player ) then
		truckRemSeconds = tonumber ( truckRemSeconds )
		truckRemSeconds = truckRemSeconds - 1
		if truckRemSeconds < 0 then
			truckRemMinutes = truckRemMinutes - 1
			if truckRemMinutes < 0 then
				triggerServerEvent ( "removePedFromTruck", player, player )
				killTimer ( remainingTimeTruck )
				guiSetVisible ( gWindow["time"], false )
			else
				truckRemSeconds = 59
			end
		end
		if truckRemSeconds < 10 then
			guiSetText ( gLabel["curTime"], truckRemMinutes..":".."0"..truckRemSeconds )
		else
			guiSetText ( gLabel["curTime"], truckRemMinutes..":"..truckRemSeconds )
		end
	else
		killTimer ( remainingTimeTruck )
		guiSetVisible ( gWindow["time"], false )
	end
end

function showDamageBarReal_func ()

	if gWindow["damageBar"] then
		guiSetVisible ( gWindow["damageBar"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["damageBar"] = guiCreateWindow(screenwidth/2-173/2, screenheight-71,173,71,"Schaden",false)
		guiSetAlpha(gWindow["damageBar"],1)
		guiWindowSetMovable(gWindow["damageBar"],false)
		guiWindowSetSizable(gWindow["damageBar"],false)
		gProgress["damageBar"] = guiCreateProgressBar(0.052,0.338,0.896,0.507,true,gWindow["damageBar"])
		guiSetAlpha(gProgress["damageBar"],1)
		guiProgressBarSetProgress(gProgress["damageBar"],0)
	end
	-- damageUpdateTimer = setTimer ( refreshDamageBar, 200, -1 )
	damageUpdateTimer = setTimer ( refreshDamageBar, 200, 0 )
end
--addEvent ( "showDamageBar", true )
--addEventHandler ( "showDamageBar", getRootElement(), showDamageBar_func )

function refreshDamageBar()

	local player = getLocalPlayer()
	if getPedOccupiedVehicle ( player ) then
		local veh = getPedOccupiedVehicle ( player )
		local damage = 1000-getElementHealth ( veh )
		if damage > 100 then 
			damage = 100
			outputChatBox ( "Fahrt fehlgeschlagen!", 125, 0, 0 )
			triggerServerEvent ( "truckExplode", player, player )
			guiSetVisible ( gWindow["damageBar"], false )
			killTimer ( damageUpdateTimer )
		else
			guiProgressBarSetProgress(gProgress["damageBar"],damage)
		end
	else
		guiSetVisible ( gWindow["damageBar"], false )
		killTimer ( damageUpdateTimer )
	end
end




function showDamageBar_func ( player )
setTimer ( showDamageBarReal_func, 2000, 1, player )

end
addEvent ( "showDamageBar", true )
addEventHandler ( "showDamageBar", getRootElement(), showDamageBar_func )