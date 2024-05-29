tutorialElements = {}

function startIntro_func ( player )
	tutorial = true
	--setElementData ( lp, "ElementClicked", true )
	setElementPosition ( lp, 2214.77, -1150.5, 1026 )
	setElementInterior ( lp, 15 )
	setElementDimension ( lp, 0 )
	
	showLanguageGui (lp)
	
	showCursor ( true )
end
addEvent ( "startIntro", true )
addEventHandler ( "startIntro", getRootElement(), startIntro_func )
---
function scene1Text ()

	local time = getRealTime()
	local day = time.monthday
	local month = time.month + 1
	local year = time.year + 1900
	setTimer ( slowDrawText, 1000, 1, ""..day.."."..month.."."..year.."" )
	setTimer ( fadeScreen, 1000, 1, true )
	setTimer ( scene1, 1000, 1 )
end

function scene1 ()

	local rot = findRotation ( -772.75, 504.88, -723.95, 507.06 )
	
	setElementPosition ( tutorialElements["player"], -772.75, 504.88 - 1, 1376.21 )
	setPedRotation ( tutorialElements["player"], rot )
	setElementModel ( tutorialElements["player"], getElementData ( lp, "skinid" ) )
	
	setElementPosition ( tutorialElements["guard"], -777.48, 504.88 - 1, 1376.21 )
	setPedRotation ( tutorialElements["guard"], rot )
	setElementModel ( tutorialElements["guard"], 124 )
	
	playerRoute1 ( tutorialElements["player"], tutorialElements["car"] )
	setTimer ( guardRoute1Step1, 750, 1, tutorialElements["guard"] )
	
	setTimer ( fadeScreen, 1000, 1 )
	setTimer ( scene2, 1000, 1 )
end

function scene2 ()

	clearScene ()
	
	tutorialElements["object"] = createObject ( 1337, -438.64, 368.93, 150 )
	tutorialElements["plane"] = createVehicle ( 577, -438.64, 368.93, 150 - 75, 0, 0, 90 )
	attachElements ( tutorialElements["plane"], tutorialElements["object"] )
	setVehicleEngineState ( tutorialElements["plane"], true )
	slowDrawText ( "Nach dem Flug..." )
	setTimer ( moveObject, 1000, 1, tutorialElements["object"], 10000, -438.64, 368.93 + 500, 150 - 75 )
	followElement ( -438.64, 368.93, 160 - 75 + 30 + 15, tutorialElements["plane"] )
	setTimer ( fadeScreen, 1000, 1, true )
	setTimer ( fadeScreen, 1000, 1, false )
	setTimer ( setCameraMatrix, 1000, 1, -1339.39, -224.66, 14.04, 0, 0, 135 )
	setTimer ( setElementInterior, 1000, 1, lp, 0 )
	setTimer ( slowDrawText, 10000, 1, "Los Angeles\nInternational Airport" )
	setTimer ( scene3, 1000, 1, false )
end

function scene3 ()

	clearScene ()
	
	fadeScreen ( true )
	
	tutorialElements["plane"] = createVehicle ( 577, -1339.39, -224.66, 14.04, 0, 0, 135 )
	tutorialElements["stairs"] = createVehicle ( 608, -1349.4572753906, -241.16963195801, 14.721450805664, 0, 0, 40 )
	tutorialElements["bus"] = createVehicle ( 431, -1335.4351806641, -255.80674743652, 14.3984375, 0, 0, 136 )
	
	tutorialElements["baggage"] = createVehicle ( 485, -1331.7799072266, -240.2734375, 13.848437309265, 0, 0, 30 )
	tutorialElements["baggage1"] = createVehicle ( 606, -1327.5131835938, -240.70295715332, 14.242143630981, 0, 0, 0 )
	tutorialElements["baggage2"] = createVehicle ( 606, -1330.6516113281, -247.7098236084, 14.242143630981, 0, 0, 357 )
	tutorialElements["baggage3"] = createVehicle ( 607, -1330.7696533203, -243.96444702148, 14.24843788147, 0, 0, 357 )
	
	tutorialElements["tanker"] = createVehicle ( 514, -1318.4530029297, -227.91925048828, 14.848112106323, 0, 0, 38 )
	tutorialElements["tanker1"] = createVehicle ( 584, -1313.2371826172, -236.26127624512, 14.802620887756, 0, 0, 30 )
	attachTrailerToVehicle ( tutorialElements["tanker"], tutorialElements["tanker1"] )
	
	local rot = findRotation ( -1350.30, -240.11, -1335.43, -255.80 )
	tutorialElements["player"] = createPed ( getElementData ( lp, "skinid" ), -1350.30, -240.11, 17.79, rot )
	setPedRotation ( tutorialElements["player"], rot )
	
	tutorialElements["ped1"] = createPed ( 16, -1340.16, -242.37, 13.79 )
	tutorialElements["ped2"] = createPed ( 16, -1340.00, -244.12, 13.79 )
	
	followElement ( -1350.59, -243.96, 13.79, tutorialElements["player"] )
	
	setTimer ( setPedControlState, 400, 1, tutorialElements["player"], "forwards", true )
	setPedControlState ( tutorialElements["player"], "walk", true )
	
	chatPeds ( tutorialElements["ped1"], tutorialElements["ped2"] )
	
	setTimer ( fadeScreen, 1000, 1, false )
	setTimer ( triggerServerEvent, 1000, 1, "intfix", lp )
	setTimer ( 
		function ()
			showPlayerHudComponent ( "radar", true )
			showChat ( true )
		end,
	12000, 1 )
	setTimer ( setCameraTarget, 1000, 1, lp )
	--setTimer ( setElementAlpha, 1000, 1, lp, 255 )
	setTimer ( fadeScreen, 1000, 1, true )
	setTimer ( setPlayerInTutorial_func, 1000, 1 )
end

function clearScene ()

	for key, index in pairs ( tutorialElements ) do
		if isElement ( key ) then
			destroyElement ( key )
		end
	end
	setCameraInterior ( 0 )
	tutorialElements = {}
end