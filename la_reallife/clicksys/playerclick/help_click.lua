------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function showHelpWindow ()

	if gWindow["helpWindow"] then
		guiSetVisible ( gWindow["helpWindow"], true )
	else
		gWindow["helpWindow"] = guiCreateWindow(screenwidth/2-716/2, screenheight/2-620/2,716,620,"Schnellhilfe",false)
		guiSetAlpha ( gWindow["helpWindow"], 1 )
		guiWindowSetMovable ( gWindow["helpWindow"], false )
		guiWindowSetSizable ( gWindow["helpWindow"], false )
		gButton["helpClose"] = guiCreateButton(214,547,493,64,"Zurück zum Spiel",false,gWindow["helpWindow"])
		guiSetFont(gButton["helpClose"],"sa-header")
		showCursor ( true )
		addEventHandler ( "onClientGUIClick", gButton["helpClose"],
			function ()
				guiSetVisible ( gWindow["helpWindow"], false )
				setElementData ( lp, "ElementClicked", false )
				showCursor ( false )
			end,
		false )
		
		gMemo["Memo1"] = guiCreateMemo(10,24,697,46,"Du hast /hilfe eingetippt um Hilfe zu kriegen. Hier sind die meist gefragten Fragen aufgelistet und die Antworten dazu. Viele Fragen werden auch beim drücken von F11 gelöst! Die Maus erscheint mit drücken der Taste M.",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo1"],true)
		gMemo["Memo2"] = guiCreateMemo(10,80,157,32,"1. Wie verdiene ich Geld?",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo2"],true)
		gMemo["Memo3"] = guiCreateMemo(10,120,697,46,"Es gibt viele Jobs in Los Angeles, am Besten gehst du zum Rathaus (gelber Punkt in SF) und wählst ein Job aus. Einige Jobs gehen ohne spezielle Lizensen!",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo3"],true)
		gMemo["Memo4"] = guiCreateMemo(10,175,164,32,"2. Wo kriege ich Lizensen?",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo4"],true)
		gMemo["Memo5"] = guiCreateMemo(10,215,697,46,"Die Lizensen gibts wie die Jobs, im Rathaus (gelber Punkt in SF). Für die meisten hast du bei Spielbeginn noch nicht genug Geld, daher musst du erst arbeiten!",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo5"],true)
		gMemo["Memo6"] = guiCreateMemo(10,269,295,32,"3. Wie kann ich meine allgemeinen Daten abrufen?",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo6"],true)
		gMemo["Memo7"] = guiCreateMemo(10,308,697,46,"Die Infos über deinen Charakter findest du indem du auf deinen Spieler klickst (M drücken und dann auf den Spieler), oder wenn du /self eintippst.",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo7"],true)
		gMemo["Memo8"] = guiCreateMemo(10,361,240,32,"4. Wie kann ich einer Fraktion beitreten?",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo8"],true)
		gMemo["Memo9"] = guiCreateMemo(10,401,697,46,"Um in eine Fraktion beizutreten, musst du dich im Forum bewerben. www.la-rl.com, registrieren und eine Freischaltungsanfrage schreiben. Dann findest du alle Bereiche der Fraktionen und kannst eine Bewerbung schreiben.",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo9"],true)
		gMemo["Memo10"] = guiCreateMemo(10,454,188,32,"5. Wie mache ich Screenshots?",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo10"],true)
		gMemo["Memo11"] = guiCreateMemo(10,493,697,46,"Mit F12 werden Screenshots erstellt, welche dann in deinem MTA Order zu finden sind.",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo11"],true)
		gMemo["Memo12"] = guiCreateMemo(10,547,188,63,"Wenn dir nichts geholfen hat, kontaktier einen Admin mit /kontakt und frag nach Hilfe!",false,gWindow["helpWindow"])
		guiMemoSetReadOnly(gMemo["Memo12"],true)
	end
end
addCommandHandler ( "hilfe", showHelpWindow )