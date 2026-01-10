function showFLicenseTestWindow ()

	if gWindow["FragenWindow"] then
		guiSetVisible ( gWindow["FragenWindow"], true )
	else
		gWindow["FragenWindow"] = guiCreateWindow(screenwidth/2-281/2, screenheight/2-284/2,281,284,"Frage 1",false)
		guiSetAlpha(gWindow["FragenWindow"],1)
		guiWindowSetMovable(gWindow["FragenWindow"],false)
		guiWindowSetSizable(gWindow["FragenWindow"],false)
		gButton["sendAnswere"] = guiCreateButton(0.3061,0.82,0.3879,0.1444,"Bestätigen",true,gWindow["FragenWindow"])
		guiSetAlpha(gButton["sendAnswere"],1)
		gLabel["frageFtest"] = guiCreateLabel(0.0356,0.081,0.9146,0.25,"",true,gWindow["FragenWindow"])
		guiSetAlpha(gLabel["frageFtest"],1)
		guiLabelSetColor(gLabel["frageFtest"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["frageFtest"],"top")
		guiLabelSetHorizontalAlign(gLabel["frageFtest"],"left",false)
		gRadio["FLicenseAnswere1"] = guiCreateRadioButton(0.0391,0.3029,0.8,0.1162,"",true,gWindow["FragenWindow"])
		guiSetAlpha(gRadio["FLicenseAnswere1"],1)
		gRadio["FLicenseAnswere2"] = guiCreateRadioButton(0.0391,0.3821,0.8,0.1162,"",true,gWindow["FragenWindow"])
		guiSetAlpha(gRadio["FLicenseAnswere2"],1)
		gRadio["FLicenseAnswere3"] = guiCreateRadioButton(0.0391,0.4613,0.8,0.1162,"",true,gWindow["FragenWindow"])
		guiSetAlpha(gRadio["FLicenseAnswere3"],1)
		gRadio["FLicenseAnswere4"] = guiCreateRadioButton(0.0391,0.5405,0.8,0.1162,"",true,gWindow["FragenWindow"])
		guiSetAlpha(gRadio["FLicenseAnswere4"],1)
		addEventHandler("onClientGUIClick", gButton["sendAnswere"], goOnWithQuestions, true)
	end
	curquestion = 0
	curwrong = 0
	goOnWithQuestions ()
end

function goOnWithQuestions ()

	if curquestion == 0 then
		guiSetText ( gLabel["frageFtest"], "Wie schnell darf man unterwegs sein?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "60 km/h" )
		guiSetText ( gRadio["FLicenseAnswere2"], "80 km/h" )
		guiSetText ( gRadio["FLicenseAnswere3"], "100 km/h" )
		guiSetText ( gRadio["FLicenseAnswere4"], "120 km/h" )
	elseif curquestion == 1 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere2"] ) then
			curwrong = curwrong + 1
		end
		guiSetText ( gLabel["frageFtest"], "Gibt es StVO Punkte für Rasen?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "Ja, 2 Stück " )
		guiSetText ( gRadio["FLicenseAnswere2"], "Ja, 5 Stück" )
		guiSetText ( gRadio["FLicenseAnswere3"], "Ja, 7 Stück" )
		guiSetText ( gRadio["FLicenseAnswere4"], "Nein, keine." )
	elseif curquestion == 2 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere2"] ) then
			curwrong = curwrong + 1
		end
		guiSetText ( gLabel["frageFtest"], "Wofür steht StVO?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "Straf Verordnung" )
		guiSetText ( gRadio["FLicenseAnswere2"], "Stassenstrafs Ordnung" )
		guiSetText ( gRadio["FLicenseAnswere3"], "Straf Verkehrs Ordnung" )
		guiSetText ( gRadio["FLicenseAnswere4"], "Strassen Verkehrs Ordnung" )
	elseif curquestion == 3 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere4"] ) then
			curwrong = curwrong + 1
		end
		guiSetText ( gLabel["frageFtest"], "Was ist verboten während des Fahrens?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "Driveby" )
		guiSetText ( gRadio["FLicenseAnswere2"], "Radiosender wechseln" )
		guiSetText ( gRadio["FLicenseAnswere3"], "Licht anschalten" )
		guiSetText ( gRadio["FLicenseAnswere4"], "Mit Beifahrer reden" )
	elseif curquestion == 4 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere1"] ) then
			curwrong = curwrong + 1
		end
		guiSetText ( gLabel["frageFtest"], "Was ist an einer Kreuzung\nohne Ampeln zu beachten?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "Nichts" )
		guiSetText ( gRadio["FLicenseAnswere2"], "Die Strassenbeleuchtung" )
		guiSetText ( gRadio["FLicenseAnswere3"], "Rechts vor Links" )
		guiSetText ( gRadio["FLicenseAnswere4"], "Admin vor" )
	elseif curquestion == 5 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere3"] ) then
			curwrong = curwrong + 1
		end
		guiSetText ( gLabel["frageFtest"], "Was musst du tun, wenn ein\nPolizeifahrzeug mit Blaulicht sich nähert?" )
		guiSetText ( gRadio["FLicenseAnswere1"], "Hupen" )
		guiSetText ( gRadio["FLicenseAnswere2"], "An den Rand fahren" )
		guiSetText ( gRadio["FLicenseAnswere3"], "Weiterfahren" )
		guiSetText ( gRadio["FLicenseAnswere4"], "Die Strasse blockieren" )
	elseif curquestion == 6 then
		if not guiRadioButtonGetSelected ( gRadio["FLicenseAnswere2"] ) then
			curwrong = curwrong + 1
		end
		if curwrong >= 2 then
			outputChatBox ( "Durchgefallen!", 120, 0, 0 )
			hideTheoryWindow ()
		else
			triggerServerEvent ( "startDrivingSchoolPractise", getRootElement(), getLocalPlayer() )
			hideTheoryWindow ()
		end
	end
	guiRadioButtonSetSelected ( gRadio["FLicenseAnswere1"], true )
	guiRadioButtonSetSelected ( gRadio["FLicenseAnswere1"], false )
	curquestion = curquestion + 1
end

function hideTheoryWindow ()

	guiSetVisible ( gWindow["FragenWindow"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function showFLicenseWindow ()

	guiSetVisible(gWindow["license"], false)
	guiSetVisible(gWindow["rathausbg"], false)
	showCursor ( true )
	if gWindow["infoFscheinText"] then
		guiSetVisible ( gWindow["infoFscheinText"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["infoFscheinText"] = guiCreateWindow(screenwidth/2-470/2,screenheight/2-251/2,470,251,"Informationen",false)
		guiSetAlpha(gWindow["infoFscheinText"],1)
		guiWindowSetMovable(gWindow["infoFscheinText"],false)
		guiWindowSetSizable(gWindow["infoFscheinText"],false)
		gButton["weiterInfoFlicense"] = guiCreateButton(0.3638,0.745,0.2745,0.1873,"Weiter",true,gWindow["infoFscheinText"])
		guiSetAlpha(gButton["weiterInfoFlicense"],1)
		gLabel["Infotext"] = guiCreateLabel(0.0255,0.1036,0.9426,0.5936,"",true,gWindow["infoFscheinText"]) -- 10 Reihen
		guiSetAlpha(gLabel["Infotext"],1)
		guiLabelSetColor(gLabel["Infotext"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["Infotext"],"top")
		guiLabelSetHorizontalAlign(gLabel["Infotext"],"left",false)
		addEventHandler("onClientGUIClick", gButton["weiterInfoFlicense"], nextInfoText, true)
	end
	curtext = 0
	guiSetText ( gLabel["Infotext"], "Herzlich wilkommen bei der theoretischen Führerschein-\nPrüfung. Hier werden dir die Grundlagen beigebracht\nund anschliessend abgefragt, bevor du in die\nPraxis einsteigen kannst." )
end
addEvent ( "startFLicenseTest", true )
addEventHandler ( "startFLicenseTest", getRootElement(), showFLicenseWindow )

function nextInfoText ()

	curtext = curtext + 1
	if curtext == 1 then
		guiSetText ( gLabel["Infotext"], "Zuerst einige Grundregeln:\nEs herrscht Rechtsfahrgebot, d.h. dass - bis auf\neinige, wenige Ausnahmen wie die Polizei - alle\nFahrer rechts fahren sollten bzw. müssen. Ausserdem gibt\nes eine Geschwindigkeitsbegrenzung in der Stadt, die bei\nca. 80 km/h liegt - es handelt sich hierbei um einen RICHTWERT.\nSchneller zu fahren ist ein Risiko, da z.b. an Kreuzungen\nein zu grosses Risiko besteht, übersehen zu werden." )
	elseif curtext == 2 then
		guiSetText ( gLabel["Infotext"], "Jeder Verstoss gegen die Strassen-Verkehrs-Ordnung\n( StVO genannt ) wird von der Polizei bestraft werden -\nim Normalfall mit StVO-Punkten, in schweren Fällen sogar\nmit Wanteds. Hast du 15 Punkte, so wird dir beim nächsten\nder Führerschein abgenommen.\nFalls du eine Sirene hörst, fahre bitte an die Seite -\nausserdem ist es verboten, waehrend der Fahrt zu tele-\nfonieren oder SMS zu schreiben." )
	elseif curtext == 3 then
		guiSetVisible ( gWindow["infoFscheinText"], false )
		showFLicenseTestWindow ()
	end
end