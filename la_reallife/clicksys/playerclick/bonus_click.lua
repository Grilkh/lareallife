function _createBonusmenue_func()

	if gWindow["bonusmenue"] then
		guiSetVisible ( gWindow["bonusmenue"], true )
	else
		gWindow["bonusmenue"] = guiCreateWindow ( screenwidth/2-370/2, 120, 370, 424, "Bonusmenü", false )
		guiSetAlpha(gWindow["bonusmenue"],1)
		gGrid["bonusliste"] = guiCreateGridList(0.027,0.0637,0.4649,0.9104,true,gWindow["bonusmenue"])
		guiGridListSetSelectionMode(gGrid["bonusliste"],2)
		gColumn["bonusName"] = guiGridListAddColumn(gGrid["bonusliste"],"Bonus",0.6)
		gColumn["bonusKosten"] = guiGridListAddColumn(gGrid["bonusliste"],"Kosten",0.2)
		guiSetAlpha(gGrid["bonusliste"],1)
		gButton["buyBonus"] = guiCreateButton(0.5054,0.8797,0.2216,0.0896,"",true,gWindow["bonusmenue"])
		guiSetAlpha(gButton["buyBonus"],1)
		gButton["cancelBonus"] = guiCreateButton(0.7405,0.8797,0.2216,0.0896,"Menü schliessen",true,gWindow["bonusmenue"])
		guiSetAlpha(gButton["cancelBonus"],1)
		gLabel["Bonusname"] = guiCreateLabel(0.5027,0.0637,0.4838,0.0542,"",true,gWindow["bonusmenue"])
		guiSetAlpha(gLabel["Bonusname"],1)
		guiLabelSetColor(gLabel["Bonusname"],125,000,000)
		guiLabelSetVerticalAlign(gLabel["Bonusname"],"top")
		guiLabelSetHorizontalAlign(gLabel["Bonusname"],"left",false)
		guiSetFont(gLabel["Bonusname"],"default-bold-small")
		gLabel["Description"] = guiCreateLabel(0.5,0.1179,0.4784,0.592,"Herzlich Willkommen im\n\"Bonusmenü\"\nHier kannst du deine\nBonuspunkte, die durch\nAchievments und dem\nsammeln von versteckten\nPäckchen erhalten kannst,\nfuer besondere Belohnungen\nausgeben.",true,gWindow["bonusmenue"])
		guiSetAlpha(gLabel["Description"],1)
		guiLabelSetColor(gLabel["Description"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["Description"],"top")
		guiLabelSetHorizontalAlign(gLabel["Description"],"left",false)
		gLabel["yourPoints"] = guiCreateLabel(0.5108,0.7382,0.3081,0.0566,"Deine Bonuspunkte:",true,gWindow["bonusmenue"])
		guiSetAlpha(gLabel["yourPoints"],1)
		guiLabelSetColor(gLabel["yourPoints"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["yourPoints"],"top")
		guiLabelSetHorizontalAlign(gLabel["yourPoints"],"left",false)
		gLabel["bonusPoints"] = guiCreateLabel(0.5324,0.7854,0.2351,0.059,"0 Punkte",true,gWindow["bonusmenue"])
		guiSetAlpha(gLabel["bonusPoints"],1)
		guiLabelSetColor(gLabel["bonusPoints"],000,125,020)
		guiLabelSetVerticalAlign(gLabel["bonusPoints"],"top")
		guiLabelSetHorizontalAlign(gLabel["bonusPoints"],"left",false)
		addEventHandler("onClientGUIClick", gButton["cancelBonus"],
			function()
				guiSetVisible ( gWindow["bonusmenue"], false )
			end
		)
		addEventHandler("onClientGUIClick", getRootElement(),
			function()
				local row = guiGridListGetItemText ( gGrid["bonusliste"], guiGridListGetSelectedItem ( gGrid["bonusliste"] ), 1 )
				local state = guiGridListGetItemText ( gGrid["bonusliste"], guiGridListGetSelectedItem ( gGrid["bonusliste"] ), 2 )
				if row then
					if state == " [x]" then 
						state = "Gekauft"
						if row == " Boxen" or row == " Kung-Fu" or row == " Streetfighting" or row == " Cluckin Bell" then
							guiSetText ( gButton["buyBonus"], "Verwenden" )
						else
							guiSetText ( gButton["buyBonus"], "" )
						end
					else
						state = "NICHT gekauft"
						guiSetText ( gButton["buyBonus"], "Bonus kaufen" )
					end
					if row == " Lungenvolumen" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Lungenvolumen - 35 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus steigert\ndein Lungenvolumen, so dass\ndu in der Lage bist,\ndeutlich länger zu tauchen,\nohne zu ertrinken.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Muskeln" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Muskeln - 40 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus steigert\ndeine Muskeln, so dass\ndu in der Lage bist,\ndeutlich stärker zu zu-\nschlagen und somit mehr\nSchaden verursachst.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Kondition" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Kondition - 25 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus erlaubt es\ndir, laenger zu sprinten\nohne zu erschöpfen.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Boxen" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Boxen - 25 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus erlaubt es\ndir, Boxhiebe zu verteilen.\n\nInfo: Muss erst\naktiviert werden und kann\nnicht mit anderen\nKampfkünsten kombiniert\nwerden, Status: "..state )
					elseif row == " Kung-Fu" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Kung-Fu - 35 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus lässt dich\nzu einem Meister des Kong-Fu\nwerden.\n\nInfo: Muss erst\naktiviert werden und kann\nnicht mit anderen\nKampfkünsten kombiniert\nwerden, Status: "..state )
					elseif row == " Streetfighting" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Streetfighting - 40 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus lässt dich\nunfair kämpfen.\n\nInfo: Muss erst\naktiviert werden und kann\nnicht mit anderen\nKampfkünsten kombiniert\nwerden, Status: "..state )
					elseif row == " Pistole" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Pistolen - 20 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFähigkeiten mit der\nnormalen und der Schallge-\ndämpften Pistole.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Deagle" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Desert Eagle - 30 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFähigkeiten mit der\nDesert Eagle.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Sturmgewehr" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Sturmgewehre - 30 P." )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFähigkeiten mit der\n AK-47 und der M4.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Schrotflinten" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Schrotflinten - 20 P." )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFähigkeiten mit allen Schrot-\nflinten.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " MP5" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "MP5 - 35 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFähigkeiten mit der\nMP5.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Fahrzeugslots" then
						selectedBonus = row
						
						if getElementData ( player, "carslotupgrade2" ) == 1 then
							cost = 75
							maxCars = 10
						elseif getElementData ( player, "carslotupgrade" ) == "done" then
							cost = 60
							maxCars = 7
						else
							cost = 50
							maxCars = 5
						end
						
						guiSetText ( gLabel["Bonusname"], "Carsloterhöhung - "..cost.." P." )
						guiSetText ( gLabel["Description"], "Dieser Bonus erhöht deine\nFahrzeugslots auf maximal\n"..maxCars.." mögliche Fahrzeuge.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
					elseif row == " Coming Soon!" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Coming Soon!" )
						guiSetText ( gLabel["Description"], "DEAKTIVIERT\n Status: "..state )
					elseif row == " Coming Soon!" then
						selectedBonus = row
						guiSetText ( gLabel["Description"], "DEAKTIVIERT\n Status: "..state )
					elseif row == " Coming Soon!" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Coming Soon!" )
						guiSetText ( gLabel["Description"], "DEAKTIVIERT\n Status: "..state )
					elseif row == " Coming Soon!" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Coming Soon!" )
					guiSetText ( gLabel["Description"], "DEAKTIVIERT\n Status: "..state )
					
					elseif row == " Cluckin Bell" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Cluckin Bell - 25 Punkte" )
						guiSetText ( gLabel["Description"], "Dieser Bonus schaltet\nden Chickenskin\nfrei." )
					elseif row == " Notebook" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Notebook - 25 Punkte" )
						guiSetText ( gLabel["Description"], "Immer und überall\nins Internet!" )
					elseif row == " Spielekonsole" then
						selectedBonus = row
						guiSetText ( gLabel["Bonusname"], "Gameboy - 25 Punkte" )
						guiSetText ( gLabel["Description"], "Immer und überall\nspielen! Ideal\nim Knast!" )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["buyBonus"],
			function()
				triggerServerEvent ( "bonusBuy", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["bonusliste"], guiGridListGetSelectedItem ( gGrid["bonusliste"] ), 1 ) )
			end
		)
	end
	guiGridListSetSelectionMode ( gGrid["bonusliste"], 1 )
	fillBonusList ()
end
addEvent ( "_createBonusmenue", true )
addEventHandler ( "_createBonusmenue", getRootElement(), _createBonusmenue_func )

function refreshBonus_func ( newText )

	if not newText then
		newText = ""
	end
	
	guiSetText ( gLabel["bonusPoints"], getElementData(lp,"bonuspoints").." Punkte" )
	guiSetText ( gButton["buyBonus"], newText )
	local row, column = guiGridListGetSelectedItem ( gGrid["bonusliste"] )
	if guiGridListGetItemText ( gGrid["bonusliste"], guiGridListGetSelectedItem ( gGrid["bonusliste"] ), 1 ) == " Fahrzeugslots" then
		if getElementData ( player, "carslotupgrade2" ) == 1 then
			cost = 75
			maxCars = 10
		elseif getElementData ( player, "carslotupgrade" ) == "done" then
			cost = 60
			maxCars = 7
		else
			cost = 50
			maxCars = 5
		end
		
		guiSetText ( gLabel["Bonusname"], "Carsloterhöhung - "..cost.." P." )
		guiSetText ( gLabel["Description"], "Dieser Bonus erhoeht deine\nFahrzeugslots auf maximal\n"..maxCars.." mögliche Fahrzeuge.\n\nInfo: Automatisch u. dauerhaft\naktiv, Status: "..state )
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, 2, " [x]", false, false )
	guiGridListSetSelectedItem ( gGrid["bonusliste"], row, 1 )
end
addEvent ( "refreshBonus", true )
addEventHandler ( "refreshBonus", getRootElement(), refreshBonus_func )

function fillBonusList ()

	guiSetText ( gButton["buyBonus"], "" )
	local player = lp
	guiGridListClear ( gGrid["bonusliste"] )
	selectedBonus = "none"
	guiSetText ( gLabel["bonusPoints"], getElementData(lp,"bonuspoints").." Punkte" )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Körperlich", true, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Lungenvolumen", false, false )
	if getElementData ( player, "lungenvol" ) ~= "none" then
		fix = " [x]"
	else
		fix = "35 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Muskeln", false, false )
	if getElementData ( player, "muscle" ) ~= "none" then
		fix = " [x]"
	else
		fix = "40 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Kondition", false, false )
	if getElementData ( player, "stamina" ) ~= "none" then
		fix = " [x]"
	else
		fix = "25 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Kampfstile", true, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Boxen", false, false )
	if getElementData ( player, "boxen" ) ~= "none" then
		fix = " [x]"
	else
		fix = "25 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Kung-Fu", false, false )
	if getElementData ( player, "kungfu" ) ~= "none" then
		fix = " [x]"
	else
		fix = "35 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Streetfighting", false, false )
	if getElementData ( player, "streetfighting" ) ~= "none" then
		fix = " [x]"
	else
		fix = "40 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	--[[guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Waffenskills", true, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Pistole", false, false )
	if getElementData ( player, "pistolskill" ) ~= "none" then
		fix = " [x]"
	else
		fix = "20 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Deagle", false, false )
	if getElementData ( player, "deagleskill" ) ~= "none" then
		fix = " [x]"
	else
		fix = "30 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Sturmgewehr", false, false )
	if getElementData ( player, "assaultskill" ) ~= "none" then
		fix = " [x]"
	else
		fix = "30 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Schrotflinten", false, false )
	if getElementData ( player, "shotgunskill" ) ~= "none" then
		fix = " [x]"
	else
		fix = "20 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " MP5", false, false )
	if getElementData ( player, "mp5skill" ) ~= "none" then
		fix = " [x]"
	else
		fix = "35 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Coming Soon!", true, false )
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Coming Soon!", false, false )
	if getElementData ( player, "vortex" ) ~= "none" then
		fix = " [x]"
	else
		fix = "30 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )

	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Coming Soon!", false, false )
	if getElementData ( player, "quad" ) ~= "none" then
		fix = " [x]"
	else
		fix = "30 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	]]
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Skins", true, false )
	
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Cluckin Bell", false, false )
	if getElementData ( player, "bonusskin1" ) ~= "none" then
		fix = " [x]"
	else
		fix = "25 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], "Items", true, false )
	
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Notebook", false, false )
	if getElementData ( player, "fruitNotebook" ) >= 1 then
		fix = " [x]"
	else
		fix = "25 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
	
	local row = guiGridListAddRow(gGrid["bonusliste"])
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusName"], " Gameboy", false, false )
	if getElementData ( player, "gameboy" ) >= 1 then
		fix = " [x]"
	else
		fix = "25 P"
	end
	guiGridListSetItemText ( gGrid["bonusliste"], row, gColumn["bonusKosten"], fix, false, false )
end