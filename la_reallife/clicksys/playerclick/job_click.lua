jobTexts = {}

 jobTexts[1] = "\"Los Angeles Fishing Co.\" sucht fähige See-\nleute, die auch bei Sturm und Regen\nnicht aufgeben. Bezahlt wird nach\nFangmenge, jeder mit Angel -\nund Motorbootschein ist willkommen!"
 jobTexts[2] = "\"Los Angeles Taxis\" sucht freie Mitarbeiter,\nbezahlt wird nach Leistung pro Zeit.\nDu hast einen Führerschein, kennst dich\nin der Stadt aus und hast gern mit Leuten\nzu tun? Du schliesst schnell mit\nFremden Freundschaften und suchst eine\nentspannte Möglichkeit, Geld zu verdienen?\nDann komm jetzt vorbei und fang\nnoch heute an - Wir warten!"
 jobTexts[3] = "Du willst dir mit (mehr oder weniger) legaler\nArbeit etwas Geld verdienen?\nDann melde dich!"
 --jobTexts[4] = "Leidenschaftliche Hobbyschrauber werden\nimmer gebraucht! Meld dich an der Garage\nsbeim Bahnhof!"
 --jobTexts[5] = "\"Ammunation Los Angeles\" sucht Mitarbeiter\nfür die Strasse, jedoch ist ein Waffenschein\nPflicht."
 jobTexts[6] = "Du bist ein guter Fahrer, der\nsich viel Geld bei kleinem\nRisiko verdienen will und einen LKW-\nFührerschein besitzt? Dann melde dich an\nden Docks!"
 jobTexts[7] = "Vom Kofferpacker bis zum Frachtpilot\n- Fang bei 0 an und arbeite dich hoch!\nBenötigt: Führerschein"
 -- jobTexts[8] = "Schnelles Geld bei geringem\nZeitaufwand und genug Respekt.\nBenötigt: Waffenschein, Führerschein,\nSilent-Assasin Achievment ( Mission \"The Truth\nis out there!\""
 jobTexts[9] = "Wenn dir der Geruch von altem Frittenfett\nund ein paar verdorbene Mägen\nnichts anhaben können, dann bist\ndu hier richtig! Freie Mitarbeiter\nwerden immer gesucht.\nBenötigt: Führerschein"
 jobTexts[10] = "Ein schmutziges Geschäft: Vom Pfand-\nflaschensammler bis zum Müllwagenfahrer\nist alles möglich!"
 --jobTexts[11] = "Hol die Gefangenen für einen schönen\nLohn aus dem Gefängnis!"
 jobTexts[12] = "Du lieferst Pakete an bestimmte Orte\nab und verdienst damit dein Geld!"
 jobTexts[13] = "Du bringst Personen von Station zu \nStation in San Fierro\noder mach eine Stadtrundfahrt!"
 jobTexts[14] = "Verdiene dir dein Geld auf dem Bau\n und bediene den Gabelstapler!"

jobNames = {}
 jobNames[1] = "Fischer"
 jobNames[2] = "Taxifahrer"
 jobNames[3] = "Weeddealer"
 --jobNames[4] = "Mechaniker"
 --jobNames[5] = "Waffendealer"
 jobNames[6] = "Trucker"
 jobNames[7] = "Flughafenarbeiter"
 --jobNames[8] = "Hitman" 
 jobNames[9] = "Hotdogverkäufer"
 jobNames[10] = "Strassenreinigung"
 --jobNames[11] = "Anwalt"
 jobNames[12] = "Lieferant"
 jobNames[13] = "Busfahrer"
 jobNames[14] = "Gabelstapler"
  
  --Spielerbasiert--
jobInfo = {}
 jobInfo[1] = "Nein"
 jobInfo[2] = "Ja"
 jobInfo[3] = "Nein"
 --jobInfo[4] = "Ja"
 --jobInfo[5] = "Ja"
 jobInfo[6] = "Nein"
 jobInfo[7] = "Nein"
 --jobInfo[8] = "Ja"
 jobInfo[9] = "Ja"
 jobInfo[10] = "Nein"
 --jobInfo[11] = "Ja"
 jobInfo[12] = "Nein"
 jobInfo[13] = "Nein"
 jobInfo[14] = "Nein"

function killcityhallmarker_func ()

	if jobBlipCityhall then destroyElement ( jobBlipCityhall ) end
end
addEvent ( "killcityhallmarker", true )
addEventHandler ( "killcityhallmarker", getRootElement(), killcityhallmarker_func )

function showJobGui_func ()
	
	showJobGUI ()
end
addEvent ( "showJobGui", true )
addEventHandler ( "showJobGui", getRootElement(), showJobGui_func )

function hideJobGui ( btn, state )

	if btn == "left" and gWindow["jobs"] then
		guiSetVisible(gWindow["jobs"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

function refreshJobInfo ()

	
end

 jobNames[1] = "Fischer"
 jobNames[2] = "Taxifahrer"
 jobNames[3] = "Weeddealer"
 --jobNames[4] = "Mechaniker"
 --jobNames[5] = "Waffendealer"
 jobNames[6] = "Trucker"
 jobNames[7] = "Flughafenarbeiter"
 --jobNames[8] = "Hitman" 
 jobNames[9] = "Hotdogverkäufer"
 jobNames[10] = "Strassenreinigung"
 --jobNames[11] = "Anwalt"
 jobNames[12] = "Lieferant"
 jobNames[13] = "Busfahrer"
 jobNames[14] = "Gabelstapler"

function anzeigenJobGui ( btn, state )

	if state == "up" then
		guiSetVisible(gWindow["jobs"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		outputChatBox ( "Die Position des Arbeitgebers wird dir nun auf der Karte angezeigt. Tippe /job um den Marker zu löschen.",  0, 125, 0 )
		if jobnr == 1 then --Fischer
			jobBlipCityhall = createBlip ( -1724.9904785156, 1461.3231201172, 6.18665599823, 41, 1 )
		elseif jobnr == 2 then --Taxi
			jobBlipCityhall = createBlip ( -2548.064, 672.6994, 27.973125, 41, 1 )
		elseif jobnr == 3 then --Weeddealer
			jobBlipCityhall = createBlip ( -2109.357, 1.0, 35.32, 41, 1 )
		--[[elseif jobnr == 4 then --Mechaniker
			jobBlipCityhall = createBlip ( -2032.45, 161.38, 28.74, 41, 1 )]]
		--[[elseif jobnr == 5 then --Waffendealer
			jobBlipCityhall = createBlip ( -1838.64, 111.21, 15.117, 41, 1 )]] --FALSCH
		elseif jobnr == 6 then --Trucker
			jobBlipCityhall = createBlip ( -1838.64, 111.21, 15.117, 41, 1 )
		elseif jobnr == 7 then --Flughafen
			jobBlipCityhall = createBlip ( -1413.604, -297.983, 6.203125, 41, 1 )
		--[[elseif jobnr == 8 then --Hitman
			jobBlipCityhall = createBlip ( -1830.7301025391, 572.65557861328, 34.81, 41, 1 )]]
		elseif jobnr == 9 then --Hotdog
			jobBlipCityhall = createBlip ( -1706.1116943359, 13.159648895264, 3.2039132118225, 41, 1 )
		elseif jobnr == 10 then --Strassenreinigung
			jobBlipCityhall = createBlip ( -1897.1510009766, -1671.5749511719, 22.664850234985, 41, 1 )
		--[[elseif jobnr == 11 then --Anwalt
			jobBlipCityhall = createBlip ( 2462.6357421875, 2243.0849609375, 10.8203125, 41, 1 )]]
		elseif jobnr == 12 then --Lieferant
			jobBlipCityhall = createBlip ( -1569.897, 131.55, 3.554, 41, 1 )	
		elseif jobnr == 13 then --Bus
			jobBlipCityhall = createBlip ( -1974.239, 478.692, 29.016, 41, 1 )	
		elseif jobnr == 14 then --Gabelstapler
			jobBlipCityhall = createBlip ( -2968.8000488281, 1231.5999755859, 5, 41, 1 )	
		end
	end
end

function showJobGUI()

	if gWindow["jobs"] then
		guiSetVisible ( gWindow["jobs"], true )
	else
		gWindow["jobs"] = guiCreateWindow(screenwidth/2-451/2,screenheight/2-383/2,451,383,"Jobcenter",false)
		guiSetAlpha(gWindow["jobs"],1)
		gImage["jobStar"] = guiCreateStaticImage(9,38,38,31,"images/internet/star.png",false,gWindow["jobs"])
		guiSetAlpha(gImage["jobStar"],1)
		gLabel["jobText1"] = guiCreateLabel(49,19,394,69,"Herzlich Willkommen im Jobcenter!\nHier kannst du dich über die einzelnen Jobs informieren,\nmit denen du Geld verdienen kannst.\nFür den Anfang werden Jobs empfohlen, die nicht spielerbasiert sind\n- also auch ohne andere Spieler funktionieren.",false,gWindow["jobs"])
		guiSetAlpha(gLabel["jobText1"],1)
		guiLabelSetColor(gLabel["jobText1"],200,000,0)
		guiLabelSetVerticalAlign(gLabel["jobText1"],"top")
		guiLabelSetHorizontalAlign(gLabel["jobText1"],"left",false)
		guiSetFont(gLabel["jobText1"],"default-bold-small")
		gGrid["joblist"] = guiCreateGridList(9,100,177,272,false,gWindow["jobs"])
		guiGridListSetSelectionMode(gGrid["joblist"],0)
		gColumn["job"] = guiGridListAddColumn(gGrid["joblist"],"Job",0.8)
		guiSetAlpha(gGrid["joblist"],1)
		gLabel["jobText2"] = guiCreateLabel(190,101,258,225,"Bitte wähle einen Job aus der Liste aus!",false,gWindow["jobs"])
		guiSetAlpha(gLabel["jobText2"],1)
		guiLabelSetColor(gLabel["jobText2"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["jobText2"],"top")
		guiLabelSetHorizontalAlign(gLabel["jobText2"],"left",false)
		guiSetFont(gLabel["jobText2"],"default-bold-small")
		gButtons["jobanzeigen"] = guiCreateButton(264,328,95,45,"Position anzeigen",false,gWindow["jobs"])
		guiSetAlpha(gButtons["jobanzeigen"],1)
		guiSetFont(gButtons["jobanzeigen"],"default-bold-small")
		gButtons["jobcancel"] = guiCreateButton(424,26,15,17,"x",false,gWindow["jobs"])
		guiSetAlpha(gButtons["jobcancel"],1)
		
		addEventHandler("onClientGUIClick", gButtons["jobcancel"], hideJobGui, false)
		addEventHandler("onClientGUIClick", gButtons["jobanzeigen"], anzeigenJobGui, false)
		
		guiWindowSetSizable ( gWindow["jobs"], false )
		guiWindowSetMovable ( gWindow["jobs"], false )
		
		local row = guiGridListAddRow ( gGrid["joblist"] )
		guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], "Empfohlen", true, false )
		guiGridListSetItemColor ( gGrid["joblist"], row, gColumn["job"], 0, 200, 0, 255 )
		for key, index in pairs ( jobInfo ) do
			if index == "Nein" then
				local row = guiGridListAddRow ( gGrid["joblist"] )
				guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], jobNames[key], false, false )
				addEventHandler("onClientGUIClick", gGrid["joblist"], 
					function ()
						local row, column = guiGridListGetSelectedItem ( gGrid["joblist"] )
						local rowtext = guiGridListGetItemText ( gGrid["joblist"], row, column )
						for key, index in pairs ( jobNames ) do
							if rowtext == index then
								jobnr = key
								guiSetText ( gLabel["jobText2"], jobTexts[key] )
								break
							end
						end
					end
				)
			end
		end
		local row = guiGridListAddRow ( gGrid["joblist"] )
		guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], "Spielerbasiert", true, false )
		guiGridListSetItemColor ( gGrid["joblist"], row, gColumn["job"], 200, 0, 0, 255 )
		for key, index in pairs ( jobInfo ) do
			if index == "Ja" then
				local row = guiGridListAddRow ( gGrid["joblist"] )
				guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], jobNames[key], false, false )
				addEventHandler("onClientGUIClick", gGrid["joblist"], 
					function ()
						local row, column = guiGridListGetSelectedItem ( gGrid["joblist"] )
						local rowtext = guiGridListGetItemText ( gGrid["joblist"], row, column )
						for key, index in pairs ( jobNames ) do
							if rowtext == index then
								jobnr = key
								guiSetText ( gLabel["jobText2"], jobTexts[key] )
								break
							end
						end
					end
				)
			end
		end
	end
end