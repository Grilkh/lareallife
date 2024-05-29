function startDrivingSchoolPractise_func ( player )

	if player == client then
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		laSetElementData( player, "nodmzone", 0 )
		local pname = getPlayerName ( player )
		matchDim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
		setElementInterior ( player, 0 )
		setElementDimension ( player, matchDim )
		setElementPosition ( player, -2026.598, -97.1442, 35.164 )
		if getElementData ( player, "biketest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 581, -2047.1885, -85.340, 35.164 )
		elseif getElementData ( player, "lkwtest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 403, -2047.1885, -85.340, 35.164 )
		elseif getElementData ( player, "helitest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 487, -2029.595, -109.688, 38.92 )
		elseif getElementData ( player, "schifftest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 452, -1741.266, -199.420, 1.08, 0, 0, 315 )
		elseif getElementData ( player, "segeltest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 484, -1741.266, -199.420, 1.08, 0, 0, 315 )
		elseif getElementData ( player, "flugatest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 511, -1612.5, -119.29, 14.14, 0, 0, 315 )
		elseif getElementData ( player, "flugbtest", true ) then
			_G["FahrschoolCar"..pname] = createVehicle ( 592, -1612.5, -119.29, 14.14, 0, 0, 315 )
		else
			_G["FahrschoolCar"..pname] = createVehicle ( 421, -2047.1885, -85.340, 35.164 )		
		end
		setVehicleDamageProof ( _G["FahrschoolCar"..pname], true )
		setElementDimension ( _G["FahrschoolCar"..pname], matchDim )
		laSetElementData ( player, "isInDrivingSchool", true )
		warpPedIntoVehicle ( player, _G["FahrschoolCar"..pname] )
		triggerClientEvent ( player, "checkSpeed", getRootElement() )
		if getElementData ( player, "helitest", true ) then
			_G["FahrschoolMarker1"..pname] = createMarker ( -2029.219, -16.4757, 56.51, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -2029.219, -16.4757, 56.51, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -1951.55, 281.915, 47.7, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -1951.55, 281.915, 47.7, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -2091.869, 357.89, 67.169, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -2091.869, 357.89, 67.1699, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -2229.18, 53.676, 60.737, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip ( -2229.18, 53.676, 60.737, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -2029.595, -109.688, 38.92, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -2029.595, -109.688, 38.92, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		elseif getElementData ( player, "schifftest", true ) then
			_G["FahrschoolMarker1"..pname] = createMarker ( -1600, -30, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -1600, -30, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -1318, 245, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -1318, 245, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -1216, 433.5, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -1216, 433.5, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -1250, 640, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip ( -1250, 640, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -1468, 700, 0, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -1468, 700, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		elseif getElementData ( player, "segeltest", true ) then
			_G["FahrschoolMarker1"..pname] = createMarker ( -1600, -30, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -1600, -30, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -1318, 245, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -1318, 245, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -1216, 433.5, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -1216, 433.5, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -1250, 640, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip ( -1250, 640, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -1468, 700, 0, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -1468, 700, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		elseif getElementData ( player, "flugatest", true ) then
			_G["FahrschoolMarker1"..pname] = createMarker ( -750, 515, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -750, 515, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -430, 740, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -430, 740, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -450, 1220, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -450, 1220, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -970, 1420, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip ( -970, 1420, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -1350, 142, 0, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -1350, 142, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		elseif getElementData ( player, "flugbtest", true ) then
			_G["FahrschoolMarker1"..pname] = createMarker ( -750, 515, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -750, 515, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -430, 740, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -430, 740, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -450, 1220, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -450, 1220, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -970, 1420, 0, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip ( -970, 1420, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -1350, 142, 0, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -1350, 142, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		else
			_G["FahrschoolMarker1"..pname] = createMarker ( -2004.754, 32.573, 32.228, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip1"..pname] = createBlip ( -2004.754, 32.573, 32.228, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			setElementDimension ( _G["FahrschoolMarker1"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip1"..pname], matchDim )
			_G["FahrschoolMarker2"..pname] = createMarker ( -2025.334, 568.4498, 34.425, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip2"..pname] = createBlip ( -2025.334, 568.4498, 34.425, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker3"..pname] = createMarker ( -2360.919, 510.997, 28.63499, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip3"..pname] = createBlip ( -2360.919, 510.997, 28.63499, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker4"..pname] = createMarker ( -2707.7163, 125.692, 3.589, "checkpoint", 10, 255,255,255,150, player )
			_G["FahrschoolBlip4"..pname] = createBlip (-2707.7163, 125.692, 3.589, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
			_G["FahrschoolMarker5"..pname] = createMarker ( -2047.1885, -85.340, 35.164, "checkpoint", 10, 255,255,0,150, player )
			_G["FahrschoolBlip5"..pname] = createBlip ( -2047.1885, -85.340, 35.164, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
		end
		for i = 2, 5 do
			setElementDimension ( _G["FahrschoolBlip"..i..pname], -1 )
			setElementDimension ( _G["FahrschoolMarker"..i..pname], -1 )
		end
			if getElementData ( player, "sprache" ) == "Deutsch" then
				if getElementData ( player, "helitest", true ) then
					outputChatBox ( "Um die praktische Prüfung abzuschliessen, musst du die vorgegebene Strecke abfliegen.", player, 200, 200, 0 )
					outputChatBox ( "Drücke X und L, um Motor oder Licht ein- oder auszuschalten!", player, 200, 200, 0 )
					outputChatBox ( "Du darfst so schnell fliegen wie du willst!", player, 200, 200, 0 )
					outputChatBox ( "Verwende /exitfahrschule, wenn du die Prüfung abbrechen willst!", player, 200, 200, 0 )
				elseif getElementData ( player, "flugatest", true ) then
					outputChatBox ( "Um die praktische Prüfung abzuschliessen, musst du die vorgegebene Strecke abfliegen.", player, 200, 200, 0 )
					outputChatBox ( "Drücke X und L, um Motor oder Licht ein- oder auszuschalten!", player, 200, 200, 0 )
					outputChatBox ( "Du darfst so schnell fliegen wie du willst!", player, 200, 200, 0 )
					outputChatBox ( "Verwende /exitfahrschule, wenn du die Prüfung abbrechen willst!", player, 200, 200, 0 )
				elseif getElementData ( player, "flugatest", true ) then
					outputChatBox ( "Um die praktische Prüfung abzuschliessen, musst du die vorgegebene Strecke abfliegen.", player, 200, 200, 0 )
					outputChatBox ( "Drücke X und L, um Motor oder Licht ein- oder auszuschalten!", player, 200, 200, 0 )
					outputChatBox ( "Du darfst so schnell fliegen wie du willst!", player, 200, 200, 0 )
					outputChatBox ( "Verwende /exitfahrschule, wenn du die Prüfung abbrechen willst!", player, 200, 200, 0 )
				else
					outputChatBox ( "Um die praktische Prüfung abzuschliessen, musst du die vorgegebene Strecke abfahren.", player, 200, 200, 0 )
					outputChatBox ( "Drücke X und L, um Motor oder Licht ein- oder auszuschalten!", player, 200, 200, 0 )
					outputChatBox ( "Verwende /exitfahrschule, wenn du die Prüfung abbrechen willst!", player, 200, 200, 0 )
					if getElementData ( player, "schifftest", true ) then
						outputChatBox ( "Du darfst so schnell fahren wie du willst!", player, 200, 200, 0 )
					elseif getElementData ( player, "segeltest", true ) then
						outputChatBox ( "Du darfst so schnell fahren wie du willst!", player, 200, 200, 0 )
					else
						outputChatBox ( "Du darfst nicht schneller als 80 Km/h fahren!", player, 200, 200, 0 )
						outputChatBox ( "Kleiner Tipp: Verwende /limit [Km/h] um den Tempomat zu aktivieren!", player, 200, 200, 0 )
					end
				end
			else
				if getElementData ( player, "helitest", true ) then
					outputChatBox ( "To complete the practical examination, you'll need to fly the default path.", player, 200, 200, 0 )
					outputChatBox ( "Press X and L to turn the motor or the lights on or off!", player, 200, 200, 0 )
					outputChatBox ( "You may fly faster than 80 Km/h!", player, 200, 200, 0 )
					outputChatBox ( "Use /exitfahrschule, if you want to quit!", player, 200, 200, 0 )
				elseif getElementData ( player, "flugatest", true ) then
					outputChatBox ( "To complete the practical examination, you'll need to fly the default path.", player, 200, 200, 0 )
					outputChatBox ( "Press X and L to turn the motor or the lights on or off!", player, 200, 200, 0 )
					outputChatBox ( "You may fly faster than 80 Km/h!", player, 200, 200, 0 )
					outputChatBox ( "Use /exitfahrschule, if you want to quit!", player, 200, 200, 0 )
				elseif getElementData ( player, "flugbtest", true ) then
					outputChatBox ( "To complete the practical examination, you'll need to fly the default path.", player, 200, 200, 0 )
					outputChatBox ( "Press X and L to turn the motor or the lights on or off!", player, 200, 200, 0 )
					outputChatBox ( "You may fly faster than 80 Km/h!", player, 200, 200, 0 )
					outputChatBox ( "Use /exitfahrschule, if you want to quit!", player, 200, 200, 0 )
				else
					outputChatBox ( "To complete the practical examination, you'll need to drive the default path.", player, 200, 200, 0 )
					outputChatBox ( "Press X and L to turn the motor or the lights on or off!", player, 200, 200, 0 )
					outputChatBox ( "Use /exitfahrschule, if you want to quit!", player, 200, 200, 0 )
					if getElementData ( player, "schifftest", true ) then
						outputChatBox ( "You may drive faster than 80 Km/h!", player, 200, 200, 0 )
					elseif getElementData ( player, "segeltest", true ) then
						outputChatBox ( "You may drive faster than 80 Km/h!", player, 200, 200, 0 )
					else
						outputChatBox ( "You may not drive faster than 80 Km/h", player, 200, 200, 0 )
						outputChatBox ( "Use /limit 80 for Limit 80 Km/h!", player, 200, 200, 0 )
					end
				end
			end
	end
end
addEvent ( "startDrivingSchoolPractise", true )
addEventHandler ( "startDrivingSchoolPractise", getRootElement(), startDrivingSchoolPractise_func )

function FSchoolMarkerHit( hitElement, mDim )
    
	if getElementType ( hitElement ) == "player" then
		local player = hitElement
		local matchDim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
		local pname = getPlayerName ( player )
		if source == _G["FahrschoolMarker1"..pname] and mDim then
			setElementDimension ( _G["FahrschoolMarker1"..pname], -1 )
			setElementDimension ( _G["FahrschoolBlip1"..pname], -1 )
			setElementDimension ( _G["FahrschoolMarker2"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip2"..pname], matchDim )
			playSoundFrontEnd ( player, 43 )
		elseif source == _G["FahrschoolMarker2"..pname] and mDim then
			setElementDimension ( _G["FahrschoolMarker2"..pname], -1 )
			setElementDimension ( _G["FahrschoolBlip2"..pname], -1 )
			setElementDimension ( _G["FahrschoolMarker3"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip3"..pname], matchDim )
			playSoundFrontEnd ( player, 43 )
		elseif source == _G["FahrschoolMarker3"..pname] and mDim then
			setElementDimension ( _G["FahrschoolMarker3"..pname], -1 )
			setElementDimension ( _G["FahrschoolBlip3"..pname], -1 )
			setElementDimension ( _G["FahrschoolMarker4"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip4"..pname], matchDim )
			playSoundFrontEnd ( player, 43 )
		elseif source == _G["FahrschoolMarker4"..pname] and mDim then
			setElementDimension ( _G["FahrschoolMarker4"..pname], -1 )
			setElementDimension ( _G["FahrschoolBlip4"..pname], -1 )
			setElementDimension ( _G["FahrschoolMarker5"..pname], matchDim )
			setElementDimension ( _G["FahrschoolBlip5"..pname], matchDim )
			playSoundFrontEnd ( player, 43 )
		elseif source == _G["FahrschoolMarker5"..pname] and mDim then
			setElementDimension ( _G["FahrschoolMarker5"..pname], -1 )
			setElementDimension ( _G["FahrschoolBlip5"..pname], -1 )
			outputChatBox ( "Glückwunsch, du hast bestanden!", player, 0, 125, 0 )
			playSoundFrontEnd ( player, 40 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			if getElementData ( player, "biketest", true ) then
				laSetElementData ( player, "bikelicense", 1 )
				MySQL_SetString("userdata", "Motorradtfuehrerschein", laGetElementData ( player, "bikelicense" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 450 )
				takePlayerMoney ( player, 450 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nMotorradführerschein erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "lkwtest", true ) then
				laSetElementData ( player, "lkwlicense", 1 )
				MySQL_SetString("userdata", "LKWfuehrerschein", laGetElementData ( player, "lkwlicense" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 450 )
				takePlayerMoney ( player, 450 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nLKW-Führerschein erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "helitest", true ) then
				laSetElementData ( player, "helilicense", 1 )
				MySQL_SetString("userdata", "Helikopterfuehrerschein", laGetElementData ( player, "helilicense" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 20000 )
				takePlayerMoney ( player, 20000 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHelikopterflugschein erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "schifftest", true ) then
				laSetElementData ( player, "motorbootlicense", 1 )
				MySQL_SetString("userdata", "Motorbootschein", laGetElementData ( player, "motorbootlicense" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 400 )
				takePlayerMoney ( player, 400 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nMotorbootführerschein erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "segeltest", true ) then
				laSetElementData ( player, "segellicense", 1 )
				MySQL_SetString("userdata", "Segelschein", laGetElementData ( player, "segellicense" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 350 )
				takePlayerMoney ( player, 350 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSegellizenz erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "flugatest", true ) then
				laSetElementData ( player, "planelicensea", 1 )
				MySQL_SetString("userdata", "FlugscheinKlasseA", laGetElementData ( player, "planelicensea" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 15000 )
				takePlayerMoney ( player, 15000 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFlugschein Typ A erhalten!", 5000, 0, 255, 0 )
			elseif getElementData ( player, "flugbtest", true ) then
				laSetElementData ( player, "planelicenseb", 1 )
				MySQL_SetString("userdata", "FlugscheinKlasseB", laGetElementData ( player, "planelicenseb" ), "Name LIKE '"..pname.."'")
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 34950 )
				takePlayerMoney ( player, 34950 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFlugschein Typ B erhalten!", 5000, 0, 255, 0 )
			else
				laSetElementData ( player, "carlicense", 1 )
				MySQL_SetString("userdata", "Autofuehrerschein", laGetElementData ( player, "carlicense" ), "Name LIKE '"..pname.."'")				
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 750 )
				takePlayerMoney ( player, 750 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFührerschein erhalten!", 5000, 0, 255, 0 )
			end
			drivenToFast_func ( player )
		end
	end
end
addEventHandler( "onMarkerHit", getRootElement(), FSchoolMarkerHit )

function cancelDrivingSchoolPlayer ( player )

	if laGetElementData ( player, "isInDrivingSchool" ) then
		local pname = getPlayerName ( player )
		removePedFromVehicle ( player )
		laSetElementData ( player, "isInDrivingSchool", false )
		setElementDimension ( player, 0 )
		setElementPosition ( player, -2026.598, -97.1442, 35.164 )
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		laSetElementData( player, "nodmzone", 0 )
		cancelDrivingSchoolServer ( pname )
	end
end

function cancelDrivingSchoolServer ( pname )

	if isElement ( _G["FahrschoolCar"..pname] ) then
		destroyElement ( _G["FahrschoolCar"..pname] )
	end
	for i = 1, 5 do
		if isElement ( _G["FahrschoolBlip"..i..pname] ) then
			destroyElement ( _G["FahrschoolBlip"..i..pname] )
			destroyElement ( _G["FahrschoolMarker"..i..pname] )
		end
	end
end

function drivenToFast_func ( player )

	if player == client or not client then
		setElementPosition ( player, -2026.598, -97.1442, 35.164 )
		setElementData ( player, "biketest", false )
		setElementData ( player, "lkwtest", false )
		setElementData ( player, "helitest", false )
		setElementData ( player, "schifftest", false )
		setElementData ( player, "segeltest", false )
		setElementData ( player, "flugatest", false )
		setElementData ( player, "flugbtest", false )
		cancelDrivingSchoolPlayer ( player )
	end
end
addEvent ( "drivenToFast", true )
addEventHandler ( "drivenToFast", getRootElement(), drivenToFast_func )

function exitthelesson_func ( player )
if laGetElementData ( player, "isInDrivingSchool") then
drivenToFast_func ( player )
end
end
addCommandHandler ( "exitfahrschule", exitthelesson_func )