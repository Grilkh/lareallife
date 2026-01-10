------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

pissBarX = math.floor ( screenwidth / 1.1707 ) - 1
pissBarY = math.floor ( screenheight / 3.5 ) - 1
pissBarWidth = math.floor ( screenwidth / 10.37 )
pissBarHeight = math.floor ( screenheight / 51.42 )
pissBarY = pissBarY - ( ( 32 / 1080 ) * screenheight ) / 2 - pissBarHeight / 2

local showingPissBar = false

function showUrinBar()

	if tonumber ( getElementData ( lp, "loggedin" ) ) == 1 and not isCursorShowing () then
		if not showingPissBar then
			addEventHandler ( "onClientRender", getRootElement(), drawPissBar )
			showingPissBar = true
		end
	end
end
addEvent ( "showUrinBar", true )
addEventHandler ( "showUrinBar", getRootElement(), showUrinBar )

function drawPissBar ()

	local x, y, width, height = pissBarX, pissBarY, pissBarWidth, pissBarHeight
	
	local urin = getElementData ( lp, "urin" ) / 100
	
	local spaceBarSize = screenwidth / ( 1920 / 5 )
	local urinWidth = ( width - spaceBarSize * 2 ) * urin
	urinWidth = spaceBarSize + urinWidth
	
	dxDrawImage ( x, y, width, height, "images/gui/urin_empty.png", 0, 0, 0, nil, true )
	dxDrawImageSection ( x-1, y-1, urinWidth, height, 1, 1, urinWidth, height, "images/gui/urin_full.png", 0, 0, 0, nil, true )
end

function urinDeathFix ()

	if source == lp then
		setElementData ( lp, "urin", 60 )
	end
end
addEventHandler ( "onClientPlayerWasted", getRootElement(), urinDeathFix )

function hideUrinBar()

	if showingPissBar then
		removeEventHandler ( "onClientRender", getRootElement(), drawPissBar )
		showingPissBar = false
	end
end
addEvent ( "hideUrinBar", true )
addEventHandler ( "hideUrinBar", getRootElement(), hideUrinBar )

function moreUrin()

	if getElementData ( lp, "jailtime" ) then
		if getElementData ( lp, "jailtime" ) <= 0 and not pokering and not invulnerable then
			local cururin = getElementData ( lp, "urin" ) + 1
			if cururin > 100 then cururin = 100 end
			setElementData (lp, "urin", cururin)
			if cururin == 66 then
				if getElementData ( lp, "sprache" ) == "Deutsch" then
					outputChatBox ( "Deine Blase füllt sich, such dir einen geeigneten Platz um sie zu leeren.", 125, 0, 0 )
				else
					outputChatBox ( "You've to pie! Look for a suitable empty space around here.", 125, 0, 0 )				
				end
			elseif cururin > 75 then
				local loss = math.floor((cururin-75)/2*5)/10
				setElementHealth ( lp, getElementHealth ( lp ) - loss )
				hudEinblendenDmg_func ( 0, 0, 0, 0, true )
				if getElementData ( lp, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du musst dringend pinkeln, suche eine geeignete Ecke und verwende /piss!", 125, 0, 0 )
					outputChatBox ( "Pass auf, dass du nicht erwischt wirst, ansonsten kriegst du ein Wanted!", 125, 0, 0 )
				else
					outputChatBox ( "You have to pee urgently! Search a suitable corner and use / piss!", 125, 0, 0 )
					outputChatBox ( "Make sure that you will not get caught, otherwise you get a Wanted!", 125, 0, 0 )
				end
			end
		end
	end
end
-- setTimer ( moreUrin, 100000, -1 )
setTimer ( moreUrin, 100000, 0 )

function eaturinSomething_func ( value )

	if not value then value = 100 end
	setElementData ( lp, "urin", getElementData ( lp, "urin" )+value, false )
	if getElementData ( lp, "urin" ) > 100 then
		setElementData ( lp, "urin", 100, false )
	end
	showUrinBar()
	setTimer ( hideUrinBar, 4000, 1 )
end
addEvent ( "eaturinSomething", true )
addEventHandler ( "eaturinSomething", getRootElement(), eaturinSomething_func )

function pissSomething_func ( value )

	if not value then value = 100 end
	setElementData ( lp, "urin", getElementData ( lp, "urin" )-value, false )
	if getElementData ( lp, "urin" ) < 0 then
		setElementData ( lp, "urin", 0, false )
	end
	showUrinBar()
	setTimer ( hideUrinBar, 4000, 1 )
end
addEvent ( "pissSomething", true )
addEventHandler ( "pissSomething", getRootElement(), pissSomething_func )
