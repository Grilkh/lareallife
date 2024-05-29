drugSettings = {}
drugColors = {}
drugSettings.interval = 10000
drugSettings.aimDisturbe = 10
drugSettings.maxColor = 0.7

timeToGo = 0
strenght = 0

drugRunSwitch = false

function startDrugEffect_func ( level, drug ) -- In 1000tel Sekunden bzw. MS; 0-1 in Heftigkeit -> 1 = Extrem, 0 = Nicht spürbar

	if drug == "drunk" then
		setElementData ( lp, "drunken", true)
		drunken = true
		drugy = drunken
		setGameSpeed ( 0.50 )
	elseif drug == "stone" then
		setElementData ( lp, "stoned", true)
		stoned = true
		drugy = stoned
		setGameSpeed ( 0.75 )
	--[[elseif drug == "koks" then
		koks = true
		setGameSpeed ( 1.50 )]]--
	end

	strenght = level
	time = level*60000
	
	if drugColors["white"] then
		guiSetVisible ( drugColors["white"], true )
		guiSetVisible ( drugColors["red"], true )
		guiSetVisible ( drugColors["green"], true )
		guiSetVisible ( drugColors["blue"], true )
	else
		if drugy == stoned then
			drugColors["white"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/white.bmp", false )
			guiSetAlpha ( drugColors["white"], 0 )
			guiMoveToBack ( drugColors["white"] )
			
			drugColors["red"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_red.jpg", false )
			guiSetAlpha ( drugColors["red"], 0 )
			guiMoveToBack ( drugColors["red"] )
			
			drugColors["green"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_green.jpg", false )
			guiSetAlpha ( drugColors["green"], 0.5 )
			guiMoveToBack ( drugColors["green"] )
			
			drugColors["blue"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_blue.jpg", false )
			guiSetAlpha ( drugColors["blue"], 0 )
			guiMoveToBack ( drugColors["blue"] )
		else
			drugColors["white"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/white.bmp", false )
			guiSetAlpha ( drugColors["white"], 0.5 )
			guiMoveToBack ( drugColors["white"] )
			
			drugColors["red"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_red.jpg", false )
			guiSetAlpha ( drugColors["red"], 0 )
			guiMoveToBack ( drugColors["red"] )
			
			drugColors["green"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_green.jpg", false )
			guiSetAlpha ( drugColors["green"], 0 )
			guiMoveToBack ( drugColors["green"] )
			
			drugColors["blue"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_blue.jpg", false )
			guiSetAlpha ( drugColors["blue"], 0 )
			guiMoveToBack ( drugColors["blue"] )		
		end
	end
	
	if isTimer ( drugEffectTimer ) then
		killTimer ( drugEffectTimer )
		timeToGo = time + timeToGo
	else
		timeToGo = time
	end
	
	if isTimer ( drugEntzugTimer ) then
		killTimer ( drugEntzugTimer )
	end
	
	drugEntzugTimer = setTimer ( drugEntzug, 60000, -1, drugy, strength )
	drugEffectTimer = setTimer ( drugEffectRepeat, drugSettings.interval, -1, drugy )
end
addEvent ( "startDrugEffect", true )
addEventHandler ( "startDrugEffect", getRootElement(), startDrugEffect_func )

function drugEntzug ( drugy )

--if laGetElementData ( lp, "aufEntzug" ) == true then
		if math.random ( 1, 10 ) <= strenght then
			laSetElementData ( lp, "aufEntzug", true)
			if drugy == drunken then
				triggerServerEvent ( "drunkAnimation", lp )
			elseif drugy == stoned then
				triggerServerEvent ( "crackAnimation", lp )
			--[[elseif koks then
				triggerServerEvent ( "crackAnimation", lp )]]
			end
		--end
	end
--end
end

function drugEffectRepeat ( drugy )
	drug = drugy
	if getElementHealth ( lp ) <= 0 then
		deactivateDrugEffect_func ()
		return
	end
	--[[if strenght >= 3 then
		--if math.random ( 1, 10 ) <= strenght then
			if drug == drunken then
				triggerServerEvent ( "drunkAnimation", lp )
			elseif drug == stoned then
				triggerServerEvent ( "crackAnimation", lp )
			elseif koks then
				triggerServerEvent ( "crackAnimation", lp )
			end
		--end
	end]]--
	local count = math.floor ( drugSettings.interval / 50 )
	--setTimer ( drugFalshEffect, 50, count )
	--setTimer ( drugAiming, 50, count )
	--if math.random ( 1, 10 ) <= strenght then
	setTimer ( drugFalshEffect, 500, count, drug )
	--end
	setTimer ( drugAiming, 50, count )
	if drug == drunken then
		if drugRunSwitch then
			drunkDiveMode ()
		end
		drugRunSwitch = not drugRunSwitch
		timeToGo = timeToGo - drugSettings.interval
	end
	if timeToGo <= 0 then
		deactivateDrugEffect_func ()
	else
		strenght = strenght * 0.8
	end
end

function drugFalshEffect ( drug )

	local rnd
	if drug == drunken then
		guiSetAlpha ( drugColors["white"], 0 )
		
		rnd = math.random ( 1, 10 ) / 100 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["red"], rnd )
		rnd = math.random ( 1, 10 ) / 100 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["green"], rnd )
		rnd = math.random ( 1, 10 ) / 100 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["blue"], rnd )
		
		guiMoveToBack ( drugColors["white"] )
		guiMoveToBack ( drugColors["red"] )
		guiMoveToBack ( drugColors["green"] )
		guiMoveToBack ( drugColors["blue"] )
	else
		local alpha = guiGetAlpha ( drugColors["green"] )
		if alpha > 0.05 then
			rnd = math.random ( -10, 10 )
		else
			rnd = math.random ( 1, 20 )
		end
		alpha = alpha + ( rnd / 100 )
		if alpha > 0.06 * strenght then
			alpha = 0.06 * strenght
		end
		guiSetAlpha ( drugColors["green"], alpha )
		guiMoveToBack ( drugColors["green"] )
	end
end

function deactivateDrugEffect_func ()

	guiSetAlpha ( drugColors["white"], 0 )
	
	killTimer ( drugEffectTimer )
	killTimer ( drugEntzugTimer )
	
	timeToGo = 0
	
	toggleControl ( "vehicle_left", true )
	toggleControl ( "vehicle_right", true )
	
	setControlState ( "vehicle_left", false )
	setControlState ( "vehicle_right", false )
	
	setElementData ( lp, "drunken", false)
	setElementData ( lp, "stoned", false)
	drunken = false
	stoned = false
	
	setGameSpeed ( 1 )
end
addEvent ( "deactivateDrugEffect", true )
addEventHandler ( "deactivateDrugEffect", getRootElement(), deactivateDrugEffect_func )

function drugAiming ()

	if getControlState ( "aim_weapon" ) then
		local x, y, z = getPedTargetEnd ( lp )
		local drugAimS = drugSettings.aimDisturbe * strenght
		x = x + math.random ( -drugAimS, drugAimS )
		y = y + math.random ( -drugAimS, drugAimS )
		z = z + math.random ( -drugAimS, drugAimS )
		--triggerServerEvent ( "drugAimTarget", lp, x, y, z )
		--setPedCameraRotation ( lp, float cameraRotation )
		setPedLookAt ( lp, x, y, z, 3000 )
		setPedRotation ( lp, getPedRotation ( lp ) + 2 )
		--[[rnd = math.random ( 1, 3 )
		if rnd == 1 then
			setTimer ( drugAiming, 2000, 1 )
		elseif rnd == 2 then
			setTimer ( drugAiming, 5000, 1 )
		elseif rnd == 3 then
		end]]--
	end
end

function drunkDiveMode ()

	if not isControlEnabled ( "vehicle_right" ) then
		toggleControl ( "vehicle_right", true )
		toggleControl ( "vehicle_left", true )
		if lastDrugControl == "left" then
			setControlState ( "vehicle_left", false )
		else
			setControlState ( "vehicle_right", false )
		end
	end
	
	local rnd = math.random ( 1, 100 ) / 10
	if rnd <= strenght then
		if math.random ( 1, 2 ) == 1 then
			setTimer ( drunkModeNothing, math.random ( 50, 250 ), 1 )
		else
			if math.random ( 1, 2 ) == 1 then
				setTimer ( drunkModeRight, math.random ( 50, 250 ), 1 )
			else
				setTimer ( drunkModeLeft, math.random ( 50, 250 ), 1 )			
			end
		end
	end
end

function drunkModeLeft ()

	toggleControl ( "vehicle_left", false )
	toggleControl ( "vehicle_right", false )
	lastDrugControl = "left"
	setControlState ( "vehicle_left", true )
end

function drunkModeRight ()

	toggleControl ( "vehicle_right", false )
	toggleControl ( "vehicle_left", false )
	lastDrugControl = "right"
	setControlState ( "vehicle_right", true )
end


function drunkModeNothing ()

	toggleControl ( "vehicle_right", false )
	toggleControl ( "vehicle_left", false )
	lastDrugControl = "none"
	setControlState ( "vehicle_right", false )
end






function startKokainEffect_func(level, drug)

	local strength = tonumber( level )
	if (isDrugActive) then
		killTimer(stopTimer)
		stopTimer = setTimer(function() stopDrug() end, strength*60*1000, 1)
	else
		startDrug(60*1000)
	end
end
addEvent ( "startKokainEffect", true )
addEventHandler ( "startKokainEffect", getRootElement(), startKokainEffect_func )


function startDrug(time)
	fadeCamera(false)
	setTimer(function(time)
		if (time == nil) then
			time = 10*1000
		else
			if (tonumber(time) < 5000) then
			time = 10*1000
			end
		end
		
		timerWeather = setTimer(function() timeCheck() end, 1000, 1)
		timerFades = setTimer(function() fades() end, 4000, 1)
		isDrugActive = true
		setTimer(function() fall() end, 1000, 1)
		addEventHandler("onClientRender", getRootElement(), drugSteer)
		addEventHandler("onClientPreRender", getRootElement(), drugCam)
		
		stopTimer = setTimer(function() stopDrug() end, time, 1)
	end, 1500, 1, time)
end

function stopDrug()
	fadeCamera(false)
	killTimer(timerFades)
	killTimer(timerWeather)
	isDrugActive = false
	fadeCamera(false)
	removeEventHandler("onClientRender", getRootElement(), drugSteer)
	removeEventHandler("onClientPreRender", getRootElement(), drugCam)
	fadeCamera(false)
	triggerServerEvent("restoreWeather", getLocalPlayer())
	setTimer(function()
		setCameraTarget(getLocalPlayer())
		fadeCamera(true)
	end, 2500, 1)
end

function timeCheck()
	local hh, mm = getTime()
	if (hh<7) then
		local ww, bb = getWeather()
		if (ww ~= -52123) then
			setWeather(-52123)
		end		
	else
		local ww, bb = getWeather()
		if (ww ~= 190) then
			setWeather(190)
		end
	end
end

function fall()
	if (isDrugActive) then
		setPedAnimation(getLocalPlayer(), "ped", "getup_front",1000, false, false)
		setTimer(function() fall() end, math.random(10000, 30000), 1)
		setTimer(function() setControlState ('jump',true) end, 1500, 1)
		setTimer(function() setControlState ('jump',false) end, 2000, 1)
	end
end

function fades()
	local rnd = math.random(2,4)
	fadeCamera(false, rnd, math.random(1,255), math.random(1,255), math.random(1,255))
	local xx, yy, zz = getElementPosition(getLocalPlayer())
	setTimer(function() fadeCamera(true, 1) end, rnd*1000/2, 1)
end

function drugSteer()
	left=false
	right=false
	up=false
	down=false
	
	local keys = getBoundKeys ('vehicle_left')
	if keys then
		tmpLeft = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpLeft=true
			end
		end
		if tmpLeft then
			left=true
			right=false
		end
	end

	local keys = getBoundKeys ('vehicle_right')
	if keys then
		tmpRight = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpRight=true
			end
		end
		if tmpRight then
			left=false
			right=true
		end
	end

	if (left) then
		setControlState('vehicle_left', false)
		setControlState('vehicle_right', true)
	elseif (right) then
		setControlState('vehicle_right', false)
		setControlState('vehicle_left', true)
	else 
		setControlState('vehicle_right', false)
		setControlState('vehicle_left', false)
	end
	
	
	local keys = getBoundKeys ('accelerate')
	if keys then
		tmpUp = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpUp=true
			end
		end
		if tmpUp then
			down=false
			up=true
		end
	end 
	
	local keys = getBoundKeys ('brake_reverse')
	if keys then
		tmpDown = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpDown=true
			end
		end
		if tmpDown then
			down=true
			up=false
		end
	end
	
	if (up) then
		setControlState('accelerate', false)
		setControlState('brake_reverse', true)
	elseif (down) then
		setControlState('brake_reverse', false)
		setControlState('accelerate', true)
	else 
		setControlState('brake_reverse', false)
		setControlState('accelerate', false)
	end
end

roll = 0
rollGrow = false
function drugCam()
	if (rollGrow) then
		if (roll > 15) then rollGrow = false end
		roll = roll + 1
	else
		if (roll < -15) then rollGrow = true end
		roll = roll -1
	end
	local xx, yy, zz = getElementPosition(getLocalPlayer())
	local rot = getPedRotation(getLocalPlayer())
	local lx = xx + math.sin (math.rad(-rot)) * -10
	local ly = yy + math.cos (math.rad(-rot)) * -10
	setCameraMatrix(lx, ly, zz + 4, xx, yy, zz, roll)
	fxAddBlood(xx, yy, zz, 0, 0, 0, 6)
end

function startDrug2()
	startDrug(4)
end
function stopDrug2()
	stopDrug()
end

----------------------------------
--addCommandHandler("sd", startDrug2)
--addCommandHandler("sds", stopDrug2)
----------------------------------

function restoreWeather(ww)
	setWeather(ww)
end

addEvent("restoreWeather", true)
addEventHandler("restoreWeather", getRootElement(), restoreWeather)

