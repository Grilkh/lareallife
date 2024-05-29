------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

sleepBarX = math.floor ( screenwidth / 1.1707 ) - 1
sleepBarY = math.floor ( screenheight / 3.111 ) - 1
sleepBarWidth = math.floor ( screenwidth / 10.37 )
sleepBarHeight = math.floor ( screenheight / 51.42 )
sleepBarY = sleepBarY - ( ( 32 / 1080 ) * screenheight ) / 2 - sleepBarHeight / 2

local showingSleepBar = false

function showSchlafBar()

	if tonumber ( getElementData ( lp, "loggedin" ) ) == 1 and not isCursorShowing () then
		if not showingSleepBar then
			addEventHandler ( "onClientRender", getRootElement(), drawSleepBar )
			showingSleepBar = true
		end
	end
end
addEvent ( "showSchlafBar", true )
addEventHandler ( "showSchlafBar", getRootElement(), showSchlafBar )

function drawSleepBar ()

	local x, y, width, height = sleepBarX, sleepBarY, sleepBarWidth, sleepBarHeight
	
	local schlaf = getElementData ( lp, "schlaf" ) / 100
	
	local spaceBarSize = screenwidth / ( 1920 / 5 )
	local schlafWidth = ( width - spaceBarSize * 2 ) * schlaf
	schlafWidth = spaceBarSize + schlafWidth
	
	dxDrawImage ( x, y, width, height, "images/gui/sleep_empty.png", 0, 0, 0, nil, true )
	dxDrawImageSection ( x-1, y-1, schlafWidth, height, 1, 1, schlafWidth, height, "images/gui/sleep_full.png", 0, 0, 0, nil, true )
end

function schlafDeathFix ()

	if source == lp then
		setElementData ( lp, "schlaf", 60 )
	end
end
addEventHandler ( "onClientPlayerWasted", getRootElement(), schlafDeathFix )

function hideSchlafBar()

	if showingSleepBar then
		removeEventHandler ( "onClientRender", getRootElement(), drawSleepBar )
		showingSleepBar = false
	end
end
addEvent ( "hideSchlafBar", true )
addEventHandler ( "hideSchlafBar", getRootElement(), hideSchlafBar )

function moreSchlaf()

	if getElementData ( lp, "jailtime" ) then
		if getElementData ( lp, "jailtime" ) <= 0 and not pokering and not invulnerable then
			local curschlaf = getElementData ( lp, "schlaf" ) - 1
			if curschlaf < 0 then curschlaf = 0 end
			setElementData (lp, "schlaf", curschlaf)
			if curschlaf == 33 then
				if getElementData ( lp, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du wirst müde, such dir einen Schlafplatz! Verwende /sleep.", 125, 0, 0 )
				else
					outputChatBox ( "You get tired, look for a place to sleep! Use /sleep.", 125, 0, 0 )				
				end
			elseif curschlaf < 25 then
				if getElementData ( lp, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du bist erschöpft! Verwende /sleep oder geh in ein Haus!", 125, 0, 0 )
				else
					outputChatBox ( "You're exhausted! Use /sleep or go into a house!", 125, 0, 0 )				
				end
				local loss = math.floor((25-curschlaf)/2*20)/10
				setElementHealth ( lp, getElementHealth ( lp ) - loss )
				hudEinblendenDmg_func ( 0, 0, 0, 0, true )
			end
		end
	end
end
setTimer ( moreSchlaf, 200000, -1 )

function sleepSomething_func ( value )

	if not value then value = 100 end
	setElementData ( lp, "schlaf", getElementData ( lp, "schlaf" )+value, false )
	if getElementData ( lp, "schlaf" ) > 100 then
		setElementData ( lp, "schlaf", 100, false )
	end
	showSchlafBar()
	setTimer ( hideSchlafBar, 4000, 1 )
end
addEvent ( "sleepSomething", true )
addEventHandler ( "sleepSomething", getRootElement(), sleepSomething_func )