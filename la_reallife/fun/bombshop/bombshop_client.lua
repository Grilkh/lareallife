local player = getLocalPlayer()
loopTime = nil


function guiStart ()
	local x, y = guiGetScreenSize()
	
----------------------------FENTRE PRINCIPAL

	maFen = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFen )
	CostLabel = guiCreateLabel( 0.08, 0.35, 0.82, 0.04, "", true, maFen )
	guiWindowSetSizable (maFen, false )
	guiWindowSetMovable (maFen, false )

	TimeButton = guiCreateButton( 0.018, 0.41, 0.965, 0.05, "Zeitbombe", true, maFen )
	--TimeButton = guiCreateStaticImage( 0.018, 0.41, 0.5, 0.06, "timeBB.png", true, maFen )
	DetonatorButton = guiCreateButton( 0.018, 0.47, 0.965, 0.05, "Fernzündbombe", true, maFen )
	EngineButton = guiCreateButton( 0.018, 0.53, 0.965, 0.05, "Motorbombe", true, maFen )
	WeightButton = guiCreateButton( 0.018, 0.59, 0.965, 0.05, "Gewichtsbombe", true, maFen )
	AprochButton = guiCreateButton( 0.018, 0.65, 0.965, 0.05, "Kollisionsbombe", true, maFen )
	SensitiveButton = guiCreateButton( 0.018, 0.71, 0.965, 0.05, "empfindliche Bombe", true, maFen )
	SpeedButton = guiCreateButton( 0.018, 0.77, 0.965, 0.05, "Schnelligkeitsbombe", true, maFen )
	closeButton = guiCreateButton( 0.33, 0.89, 0.33, 0.10, "schliessen", true, maFen )
	
	addEventHandler( "onClientGUIClick", maFen, aClickGui ) 

	guiSetVisible ( maFen, false )


---------------------------- SPEED BOMB

	maFenSpeed = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 400, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenSpeed )
	
	speedTargetButton = guiCreateButton( 0.018, 0.32, 0.965, 0.065, "Ziel : ", true, maFenSpeed )
	speedPostMButton = guiCreateButton( 0.018, 0.39, 0.965, 0.065, "Warnung", true, maFenSpeed )
	
	chooseSpeed = guiCreateEdit(0.75, 0.47, 0.2, 0.065, "100", true, maFenSpeed )
		speedLabel = guiCreateLabel( 0.06, 0.48, 0.82, 0.04, "Explodiert bei", true, maFenSpeed )
		boolButton = guiCreateButton( 0.64, 0.47, 0.1, 0.065, ">", true, maFenSpeed )
	chooseSpeed2 = guiCreateEdit(0.75, 0.54, 0.25, 0.065, "50", true, maFenSpeed )
		applyASpeed = guiCreateCheckBox( 0.05, 0.55, 0.71, 0.04, "Explodiert bei =", false, true, maFenSpeed )
	
	lockBoxSpeed = guiCreateCheckBox( 0.05, 0.60, 0.73, 0.04, "Gesperrt bei Aktivierung", false, true, maFenSpeed )
	
	advertArmeBox = guiCreateRadioButton( 0.05, 0.665, 0.8, 0.04, "Warnung: Aktivierung", true, maFenSpeed )
	advertDieBox = guiCreateRadioButton( 0.05, 0.715, 0.8, 0.04, "Warning: Bei Explosion", true, maFenSpeed )
	neverBox = guiCreateRadioButton( 0.05, 0.765, 0.73, 0.04, "Keine Warnung", true, maFenSpeed )
		guiRadioButtonSetSelected ( neverBox, true )
	
	speedApplyButton = guiCreateButton( 0.05, 0.89, 0.33, 0.10, "Ok", true, maFenSpeed )
	speedCancelButton = guiCreateButton( 0.63, 0.89, 0.33, 0.10, "Abbrechen", true, maFenSpeed )
	
	guiSetProperty(speedPostMButton, "Disabled", "True")
	guiSetProperty(chooseSpeed2, "Disabled", "True")
	
	addEventHandler( "onClientGUIClick", maFenSpeed, aClickGui )
	guiSetVisible ( maFenSpeed, false )
	guiWindowSetSizable (maFenSpeed, false )
	guiWindowSetMovable (maFenSpeed, false )
	
--------------------------- TARGUETING par defaut  ------------------

	maFenSel = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenSel )
	
	selTargetButton = guiCreateButton( 0.018, 0.37, 0.965, 0.075, "Ziel : ", true, maFenSel )
	selPostMButton = guiCreateButton( 0.018, 0.45, 0.965, 0.075, "Warnung", true, maFenSel )
	guiSetProperty(selPostMButton, "Disabled", "True")
	
	selApplyButton = guiCreateButton( 0.05, 0.89, 0.33, 0.10, "Ok", true, maFenSel )
	selCancelButton = guiCreateButton( 0.63, 0.89, 0.33, 0.10, "Abbrechen", true, maFenSel )

	addEventHandler( "onClientGUIClick", maFenSel, aClickGui )
	guiSetVisible ( maFenSel, false )
	guiWindowSetSizable (maFenSel, false )
	guiWindowSetMovable (maFenSel, false )

---------------------------- REFUND REVENTE
	
	maFenUn = guiCreateWindow( x / 2 - 100, y / 2 - 125, 200, 250, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenUn )
	RefundLabel = guiCreateLabel( 0.08, 0.50, 0.82, 0.06, "", true, maFenUn )
	guiWindowSetSizable (maFenUn, false )
	guiWindowSetMovable (maFenUn, true )

	UnriggButton = guiCreateButton( 0.018, 0.59, 0.965, 0.075, "Bombe entfernen", true, maFenUn )
	close2Button = guiCreateButton( 0.33, 0.79, 0.33, 0.14, "schliessen", true, maFenUn )
	
	addEventHandler( "onClientGUIClick", maFenUn, aClickGui ) 

	guiSetVisible ( maFenUn, false )
	guiWindowSetSizable (maFenUn, false )
	guiWindowSetMovable (maFenUn, false )	
	
----------------------------CHOIX DE L ACTIVATION TIMING BOMB
	
	maFenAct = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenAct )
	activationLabel = guiCreateLabel( 0.14, 0.4, 0.82, 0.04, "Aktivierung bei", true, maFenAct )
	aTargetButton = guiCreateButton( 0.018, 0.5, 0.965, 0.1, "Einsteigen in das Fahrzeug", true, maFenAct )
	aClicButton = guiCreateButton( 0.018, 0.65, 0.965, 0.1, "Beim Mausklick", true, maFenAct )
	aCancelButton = guiCreateButton( 0.33, 0.89, 0.33, 0.10, "Abbrechen", true, maFenAct )

	addEventHandler( "onClientGUIClick", maFenAct, aClickGui )
	guiSetVisible ( maFenAct, false )
	guiWindowSetSizable (maFenAct, false )
	guiWindowSetMovable (maFenAct, false )

----------------------------LISTE DE JOUEUR
	
	playerList   = guiCreateGridList ( x / 2 - 75 , y / 2 - 45, 150, 250, false )
	guiGridListSetSortingEnabled( playerList, false )
	guiGridListAddColumn( playerList, "Player", 0.85 )
	
	--setTimer ( aJList, 1000, 1, player )
	

	guiSetVisible ( playerList, false )
	guiWindowSetSizable (playerList, false )
	guiWindowSetMovable (playerList, false )
	
	addEventHandler ( "onClientGUIDoubleClick", playerList, aAClientDoubleClick )

	
----------------------------FENETRE DE CHOIX DE CIBLE ET Du TIMING

	maFenTarg = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenTarg )
	aATargetButton = guiCreateButton( 0.018, 0.37, 0.965, 0.075, "Ziel : ", true, maFenTarg )
	aPostMButton = guiCreateButton( 0.018, 0.45, 0.965, 0.075, "Warnung", true, maFenTarg )
	
	chooseTime = guiCreateEdit(0.65, 0.55, 0.33, 0.075, "10", true, maFenTarg )
	guiCreateLabel( 0.07, 0.565, 0.6, 0.04, "Zeit in Sekunden : ", true, maFenTarg )
	
	EngineBox = guiCreateCheckBox( 0.05, 0.65, 0.73, 0.04, "Motor aus", false, true, maFenTarg )
	lockBox = guiCreateCheckBox( 0.05, 0.70, 0.55, 0.04, "Abgeschlossen", false, true, maFenTarg )
	
	aAApplyButton = guiCreateButton( 0.05, 0.89, 0.33, 0.10, "Ok", true, maFenTarg )
	aACancelButton = guiCreateButton( 0.63, 0.89, 0.33, 0.10, "Abbrechen", true, maFenTarg )
	
	
	
	
	
	addEventHandler( "onClientGUIClick", maFenTarg, aClickGui )
	guiSetVisible ( maFenTarg, false )
	guiWindowSetSizable (maFenTarg, false )
	guiWindowSetMovable (maFenTarg, false )

----------------------------FENTRE DE CHOIX DE TEMPS KAN SIMPLE CLIC

	maFenClic = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenClic )
	
	chooseLabel = guiCreateLabel( 0.1, 0.4, 0.82, 0.04, "Countdown Methode", true, maFenClic )
	chooseLabel2 = guiCreateLabel( 0.75, 0.64, 0.82, 0.04, ":", true, maFenClic )
	
	chooseTime2 = guiCreateEdit(0.72, 0.475, 0.23, 0.075, "10", true, maFenClic )
	
	chooseOclock = guiCreateEdit(0.58, 0.625, 0.16, 0.075, "12", true, maFenClic )
	chooseOclock2 = guiCreateEdit(0.78, 0.625, 0.16, 0.075, "00", true, maFenClic )
	
	cTimeBox = guiCreateRadioButton( 0.05, 0.49, 0.65, 0.04, "Zeit Countdown", true, maFenClic )
	cClockBox = guiCreateRadioButton( 0.05, 0.65, 0.55, 0.04, "Uhrzeit", true, maFenClic )
	
	aCApplyButton = guiCreateButton( 0.05, 0.89, 0.33, 0.10, "Ok", true, maFenClic )
	aCCancelButton = guiCreateButton( 0.63, 0.89, 0.33, 0.10, "Abbrechen", true, maFenClic )
	
	addEventHandler( "onClientGUIClick", maFenClic, aClickGui )
	guiSetVisible ( maFenClic, false )
	guiWindowSetSizable (maFenClic, false )
	guiWindowSetMovable (maFenClic, false )

----------------------------POST MORTEM ecriture

	maFenMort = guiCreateWindow( x / 2 - 100, y / 2 - 175, 200, 350, "8Ball Auto's", false )
	guiCreateStaticImage( 10, 20, 230, 100, "8Ball.png", false, maFenMort )
	memo = guiCreateMemo ( 0.05, 0.37, 0.9, 0.5, "", true, maFenMort)
	okMortButton = guiCreateButton( 0.05, 0.89, 0.33, 0.10, "Ok", true, maFenMort )
	cancelMortButton = guiCreateButton( 0.63, 0.89, 0.33, 0.10, "Abbrechen", true, maFenMort )
	
	addEventHandler( "onClientGUIClick", maFenMort, aClickGui )
	guiSetVisible ( maFenMort, false )
	guiWindowSetSizable (maFenMort, false )
	guiWindowSetMovable (maFenMort, false )
	
----------------------------POSTE MORTEM lecture

	maFenMort2 = guiCreateWindow( x / 2 + (x / 3.7), y / 2 - (y / 3.8), x / 5.12 , y / 2.8 , "Warnung", false )
	memo2 = guiCreateMemo ( 0.1, 0.1, 0.8, 0.8, "", true, maFenMort2)
	guiMemoSetReadOnly ( memo2, true )

	guiSetVisible ( maFenMort2, false )
	guiWindowSetSizable (maFenMort2, false )
	guiWindowSetMovable (maFenMort2, false )
	

end

addEventHandler( "onClientResourceStart", getRootElement(), guiStart )


function aJList ()
	local gui1 = guiGridListSetItemText ( playerList, guiGridListAddRow ( playerList ), 1, "=> All <=", false, false )
	guiLabelSetColor ( gui1, 255, 0, 0 )
	guiSetProperty ( gui1, "TextColour" , "FFFFFF00" )
	guiSetProperty ( gui1, "BackgroundEnabled" , "true" )
	guiSetProperty ( gui1, "BackgroundColours" , "FFFFFF00" )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if player ~= getLocalPlayer() then
			guiGridListSetItemText ( playerList, guiGridListAddRow ( playerList ), 1, getPlayerName ( player ), false, false ) 
		end
	end
end


function aAClientDoubleClick (button)
	flagL = getElementData ( playerList, "flag" )
	aACurrentPlayerName = guiGridListGetItemText ( playerList, guiGridListGetSelectedItem ( playerList ), 1 )
	if flagL == "time" then	
		guiSetText ( aATargetButton, "Ziel : "..aACurrentPlayerName.."" )
		guiSetVisible ( playerList, false )
	elseif flagL == "speed" then
		guiSetText ( speedTargetButton, "Ziel : "..aACurrentPlayerName.."" )
		guiSetVisible ( playerList, false )
	elseif flagL == "def" then
		guiSetText ( selTargetButton, "Ziel : "..aACurrentPlayerName.."" )
		guiSetVisible ( playerList, false )
	end
end

function aClickGui(button)
	local vehicle = getPedOccupiedVehicle ( getLocalPlayer())
	if ( button == "left") then
		if ( source == TimeButton ) then
			guiSetVisible ( maFen, false )
			guiSetVisible ( maFenAct, true )
			
		elseif ( source == aTargetButton ) then
			guiSetVisible ( maFenAct, false )
			guiSetVisible ( maFenTarg, true )
		
		elseif ( source == aATargetButton ) then
			setElementData ( playerList, "flag", "time" )
			guiGridListClear ( playerList )
			aJList (player)
			guiSetVisible ( playerList, true )
			guiBringToFront ( playerList )
			
		elseif ( source == aPostMButton ) then
			guiSetVisible ( maFenTarg, false )
			guiSetVisible ( maFenMort, true )
			guiSetInputEnabled ( true )
			setElementData ( maFenMort, "flag", "time" )
			
		elseif ( source == okMortButton ) then
			selectText = guiGetText ( memo )
			setElementData ( vehicle, "selectText", ""..selectText.."" )
			guiSetInputEnabled ( false )
			if getElementData ( maFenMort, "flag") == "time" then
				guiSetVisible ( maFenMort, false )
				guiSetVisible ( maFenTarg, true )
			elseif getElementData ( maFenMort, "flag") == "speed" then
				guiSetVisible ( maFenMort, false )
				guiSetVisible ( maFenSpeed, true )
			end
			
		elseif ( source == okMortButton2 ) then
			guiSetVisible ( maFenMort2, false )
			showCursor ( false )
			
		
		elseif ( source == cancelMortButton ) then
			if getElementData ( maFenMort, "flag") == "time" then
				guiSetVisible ( maFenMort, false )
				guiSetVisible ( maFenTarg, true )
				guiSetInputEnabled ( false )
				guiSetText ( memo, "" )
			elseif getElementData ( maFenMort, "flag") == "speed" then
				guiSetVisible ( maFenMort, false )
				guiSetVisible ( maFenSpeed, true )
				guiSetInputEnabled ( false )
				guiSetText ( memo, "" )
			end
			
		elseif ( source == aAApplyButton ) then
			if  aACurrentPlayerName ~= nil and aACurrentPlayerName ~= "" then
				selectTime = guiGetText ( chooseTime )
				setElementData ( vehicle, "selectTime", ""..selectTime.."" )
				setElementData ( vehicle, "bombType", "11" )
				setElementData ( vehicle, "targetBomb", aACurrentPlayerName )
				setElementData ( vehicle, "creatorPlayer", player )
				if guiCheckBoxGetSelected (lockBox) == true then
					setElementData ( vehicle, "lock", "1" )
				end
				if guiCheckBoxGetSelected (EngineBox) == true then
					setElementData ( vehicle, "start", "1" )
				end
				guiSetVisible ( maFenTarg, false )
				showCursor ( false )
				aACurrentPlayerName = nil
				guiSetText ( memo, "" )
				guiSetText ( aATargetButton, "Ziel : " )
				triggerServerEvent( "but_applyTimeButton", getRootElement(), player, vehicle )
			else
				outputChatBox ( "Kein Ziel ausgewählt", player )
			end
			
			
		elseif ( source == aACancelButton ) then
			guiSetVisible ( maFenAct, true )
			guiSetVisible ( maFenTarg, false )
			aACurrentPlayerName = nil
			guiSetText ( chooseTime, "10" )
			guiSetText ( aATargetButton, "Ziel : " )
		
		elseif ( source == aClicButton ) then
			guiSetVisible ( maFenAct, false )
			guiSetVisible ( maFenClic, true )
			
		elseif ( source == aCApplyButton ) then
			if guiRadioButtonGetSelected ( cTimeBox ) == true then
				selectTime2 = guiGetText ( chooseTime2 )
				setElementData ( vehicle, "selectTime", ""..selectTime2.."" )
				setElementData ( vehicle, "bombType", "1" )
				guiSetVisible ( maFenClic, false )
				showCursor ( false )
				triggerServerEvent( "but_applyTimeButton", getRootElement(), player, vehicle )
			elseif guiRadioButtonGetSelected ( cClockBox ) == true then
				selectHour = guiGetText ( chooseOclock )
				selectMins = guiGetText ( chooseOclock2)
				selTime = ( selectHour * 60 ) + selectMins
				setElementData ( vehicle, "selectTime", ""..selTime.."" )
				setElementData ( vehicle, "bombType", "12" )
				guiSetVisible ( maFenClic, false )
				showCursor ( false )
				triggerServerEvent( "but_applyTimeButton", getRootElement(), player, vehicle )				
			else
				outputChatBox ( "Kein Timer gewählt", player )
			end
			
		elseif ( source == aCCancelButton ) then
			guiSetVisible ( maFenAct, true )
			guiSetVisible ( maFenClic, false )
		
		elseif ( source == aCancelButton ) then
			guiSetVisible ( maFenAct, false )
			guiSetVisible ( maFen, true )
			
			
--------------------------------------------------------TAGET SELECT PAR DEF -------------------------------------------			
			
		elseif ( source == selApplyButton ) then
			if  aACurrentPlayerName ~= nil and aACurrentPlayerName ~= "" then
				if getElementData ( vehicle, "flag" ) == "6" then
					setElementData ( vehicle, "bombType", "6" )
					setElementData ( vehicle, "targetBomb", aACurrentPlayerName )				
				else
					setElementData ( vehicle, "bombType", "3" )
					setElementData ( vehicle, "targetBomb", aACurrentPlayerName )
				end
				setElementData ( vehicle, "creatorPlayer", player )
				guiSetVisible ( maFenSel, false )
				guiSetVisible ( playerList, false )
				showCursor ( false )
				aACurrentPlayerName = nil
				guiSetText ( selTargetButton, "Ziel : " )
				triggerServerEvent( "but_applyEngineButton", getRootElement(), player, vehicle )
			else
				outputChatBox ( "Kein Ziel ausgewählt", player )
			end

		elseif ( source == selTargetButton ) then
			setElementData ( playerList, "flag", "def" )
			if ( guiGetVisible ( playerList ) == true ) then           
                		guiSetVisible ( playerList, false )
        		else
				guiGridListClear ( playerList )
				aJList (player)
				guiSetVisible ( playerList, true )
				guiBringToFront ( playerList )
			end

		elseif ( source == selCancelButton ) then
			guiSetText ( selTargetButton, "Ziel : " )
			aACurrentPlayerName = nil
			guiSetVisible ( maFenSel, false )
			guiSetVisible ( playerList, false )
			guiSetVisible ( maFen, true )
			setElementData ( vehicle, "flag", "" )
----------------------------------------------------------------------------------------------------------------
		elseif ( source == DetonatorButton ) then
			if getElementData ( player, "detonaterVehicle" ) ~= false then
				outputChatBox ( "Du hast bereits einen Zünder !! ", player )
			else
				setElementData ( vehicle, "bombType", "2" )
				guiSetVisible ( maFen, false )
				showCursor ( false )
				triggerServerEvent( "but_applyDetonatorButton", getRootElement(), player, vehicle )
			end

		elseif ( source == EngineButton ) then
			guiSetVisible ( maFenSel, true )
			guiSetVisible ( maFen, false )

		elseif ( source == WeightButton ) then
			setElementData ( vehicle, "bombType", "4" )
			guiSetVisible ( maFen, false )
			showCursor ( false )
			triggerServerEvent( "but_applyWeightButton", getRootElement(), player, vehicle )

		elseif ( source == AprochButton ) then
			setElementData ( vehicle, "bombType", "5" )
			guiSetVisible ( maFen, false )
			showCursor ( false )
			triggerServerEvent( "but_applyTimeButton", getRootElement(), player, vehicle )

		elseif ( source == SensitiveButton ) then
			setElementData ( vehicle, "flag", "6" )
			guiSetVisible ( maFenSel, true )
			guiSetVisible ( maFen, false )

	-------------------------------------------------------------------------------------------------------------------------------SPEED BOMB		
			
		elseif ( source == SpeedButton ) then
			guiSetVisible ( maFen, false )
			guiSetVisible ( maFenSpeed, true )
			
		elseif ( source == speedTargetButton ) then
			setElementData ( playerList, "flag", "speed" )
			guiGridListClear ( playerList )
			aJList (player)
			guiSetVisible ( playerList, true )
			guiBringToFront ( playerList )
			
		elseif ( source == speedPostMButton ) then
			guiSetVisible ( maFenSpeed, false )
			guiSetVisible ( maFenMort, true )
			guiSetInputEnabled ( true )
			setElementData ( maFenMort, "flag", "speed" )
	
		elseif ( source == boolButton ) then
			boolT = guiGetText ( boolButton )
			if boolT == ">" then
				guiSetText ( boolButton , "<" )
			elseif boolT == "<" then
				guiSetText ( boolButton , ">" )
			
			end
			
		elseif ( source == applyASpeed ) then
			if guiCheckBoxGetSelected (applyASpeed)  == true then
				guiSetProperty(chooseSpeed2, "Disabled", "false")
			else
				guiSetProperty(chooseSpeed2, "Disabled", "true")
			end
			
			
		elseif ( source == advertArmeBox ) then
			guiSetProperty(speedPostMButton, "Disabled", "false")
		elseif ( source == advertDieBox ) then
			guiSetProperty(speedPostMButton, "Disabled", "false")
		elseif ( source == neverBox ) then
			guiSetProperty(speedPostMButton, "Disabled", "true")
			
			
			
		elseif ( source == speedApplyButton ) then
			if  aACurrentPlayerName ~= nil and aACurrentPlayerName ~= "" then
				setElementData ( vehicle, "targetBomb", aACurrentPlayerName )
				speedE = guiGetText (chooseSpeed )
				speedA = guiGetText (chooseSpeed2 )
				local boolO = guiGetText ( boolButton )
				setElementData ( vehicle, "speed1", ""..speedE.."" )
				setElementData ( vehicle, "bool", ""..boolO.."" )
				if guiCheckBoxGetSelected (applyASpeed)  == true then
					setElementData ( vehicle, "speed2", ""..speedA.."" )
					setElementData ( vehicle, "enclenche", "0" )
				end
				if guiCheckBoxGetSelected (lockBoxSpeed)  == true then
					setElementData ( vehicle, "lock", "1" )
				end
				if guiRadioButtonGetSelected ( advertArmeBox ) == true then
					setElementData ( vehicle, "advert", "0" )
				elseif guiRadioButtonGetSelected ( advertDieBox ) == true then
					setElementData ( vehicle, "advert", "1" )
				elseif guiRadioButtonGetSelected ( neverBox ) == true then
					setElementData ( vehicle, "advert", "2" )
				end
				setElementData ( vehicle, "bombType", "7" )
				showCursor ( false )
				guiSetVisible ( maFenSpeed, false )
				aACurrentPlayerName = nil
				guiSetText ( speedTargetButton, "Ziel : " )
				guiSetText ( memo, "" )
				guiSetText (chooseSpeed, "100" )
				guiSetText (chooseSpeed2, "50" )
				triggerServerEvent( "but_applyTimeButton", getRootElement(), player, vehicle )
			else
				outputChatBox ( "Kein Ziel ausgewählt", player )
			end
			
		elseif ( source == speedCancelButton ) then
			guiSetVisible ( maFen, true )
			guiSetVisible ( maFenSpeed, false )
			aACurrentPlayerName = nil
			guiSetText ( speedTargetButton, "Ziel : " )

		elseif ( source == closeButton ) then
			guiSetVisible ( maFen, false )
			showCursor ( false )

			----------------------------------------------------------------------------------------------------------------UNRIGG
			
		elseif ( source == UnriggButton ) then
			guiSetVisible ( maFenUn, false )
			showCursor ( false )
			triggerServerEvent( "but_applyUnriggButton", getRootElement(), player, vehicle )

		elseif ( source == close2Button ) then
			guiSetVisible ( maFenUn, false )
			showCursor ( false )
		else
			guiSetVisible ( playerList, false )
		end

		if (source == speedApplyButton) or ( source == DetonatorButton ) or ( source == SensitiveButton ) or ( source == EngineButton ) or ( source == WeightButton ) or ( source == aCApplyButton ) then
			setElementData ( vehicle, "creatorPlayer", player ) --<<===   Voire si il ne manque pas un truc !!
		end
	end
end
	
	

function guiToggleVisible ( bombcost )
	if bombcost == 0 then
  	guiSetText ( CostLabel, "Preis: Konstenlos!" )
  else
  	guiSetText ( CostLabel, "Preis: $" .. tonumber(bombcost) )
  end
	if ( guiGetVisible ( maFen ) == true ) then
		guiSetVisible ( maFen, false )
		showCursor ( false )
	else
		showCursor ( true )
		guiSetVisible ( maFen, true )
	end
end

function messageMort ( vehicle )
	messM = getElementData ( vehicle, "selectText" )
	if getElementData ( vehicle, "affWarnMess" ) == false then
		guiSetText ( memo2, messM )
		guiSetVisible ( maFenMort2 , true )
		setElementData ( vehicle, "affWarnMess", "1")
		setTimer ( guiSetVisible, 10000, 1, maFenMort2, false )
	end
	
	bindKey ( "F2", "down", showSouri )
end

function showSouri ( key, keyState )
	if isCursorShowing (player) == true then
		showCursor ( false )
	else
		showCursor ( true )
	end
end

addEvent( "gui_bombshopEnter", true )
addEvent( "gui_postMortem", true )
addEventHandler( "gui_bombshopEnter", getLocalPlayer(), guiToggleVisible )
addEventHandler( "gui_postMortem", getLocalPlayer(), messageMort )
	
	

function guiToggleVisibleUnrigg ( refundcost )
  if refundcost > 0 then
  	guiSetText ( RefundLabel, "Gefunden: $" .. tonumber(refundcost) )
  elseif refundcost == 0 then
  	guiSetText ( RefundLabel, "Preis: Kostenlos!" )
	else
  	guiSetText ( RefundLabel, "Preis: $" .. tonumber(-refundcost) )
  end
	if ( guiGetVisible ( maFenUn ) == true ) then
		guiSetVisible ( maFenUn, false )
		showCursor ( false )
	else
		showCursor ( true )
		guiSetVisible ( maFenUn, true )
	end
end

addEvent( "gui_bombshopEnterUnrigg", true )
addEventHandler( "gui_bombshopEnterUnrigg", getLocalPlayer(), guiToggleVisibleUnrigg )


function aClientPlayerJoin ()
	if (playerList) then
		local row = guiGridListAddRow ( playerList )
		guiGridListSetItemText ( playerList, row, 1, getPlayerName ( source ), false, false )
	end
end
addEventHandler( "onClientPlayerJoin", getRootElement(), aClientPlayerJoin )




function aClientPlayerQuit ()
	if (playerList) then
		local id = 0
		while ( id <= guiGridListGetRowCount( playerList ) ) do
			if ( guiGridListGetItemText ( playerList, id, 1 ) == getPlayerName ( source ) ) then
				guiGridListRemoveRow ( playerList, id )
			end
			id = id + 1
		end
	end
end

addEventHandler( "onClientPlayerQuit", getRootElement(), aClientPlayerQuit )




function startCountSpeed ( )
	loopTime = setTimer( countSpeedT , 100, 0 )
end
addEvent( "startCountSpeed", true )
addEventHandler( "startCountSpeed", getRootElement(), startCountSpeed )

function countSpeedT ()
	local vehicle = getPedOccupiedVehicle ( getLocalPlayer() )
	speed1 = getElementData ( vehicle, "speed1" )
	speed2 = getElementData ( vehicle, "speed2" )
	speedBool = getElementData ( vehicle, "bool" )
    triggerServerEvent ( "getSpeed" , getRootElement(), getLocalPlayer(), vehicle, speed1, speed2, speedBool )
end

function killCount ()
	if ( loopTime ) ~= nil then
		killTimer ( loopTime )
		loopTime = nil
	end
end
addEvent( "killCount", true )
addEventHandler( "killCount", getRootElement(), killCount )


function aReset ()
	local vehicle = getPedOccupiedVehicle ( getLocalPlayer())
	setElementData ( vehicle, "bombType", "0" )
	setElementData ( vehicle, "targetBomb", "" )
end
addEvent( "reset", true )
addEventHandler( "reset", getRootElement(), aReset )
