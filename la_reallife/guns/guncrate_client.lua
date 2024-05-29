gWindow = {}
gButton = {}
gLabel = {}

weaponNames = { [0]="Faust", [2]="Golfschläger",  [3]="Schlagstock", [4]="Messer",[5]="Baseballschläger", [6]="Schaufel",  [7]="Pool Cue", [8]="Katana",
[9]="Chainsaw", [15]="Spazierstock",  [22]="Pistole", [23]="SD-Pistole",
[24]="Desert Eagle", [25]="Schrotflinte", [26]="Lupara", [27]="SPAZ-12",
[28]="Uzi", [29]="MP5", [32]="TEC-9", [30]="AK-47", [31]="M4",
[33]="Gewehr", [34]="S. Gewehr", [35]="Raketenwerfer", [36]="Javeline", [37]="Flammenwerfer", [38]="Minigun",
[16]="Granaten", [17]="Tränengas", [18]="Molotowcocktails", [39]="Rucksackbomben", [41]="Sprühdose",
[42]="Feuerlöscher", [43]="Kamera", [10]="Dildo", [11]="Dildo", [12]="Dildo", [14]="Blumen", [44]="Nachtsichtgerät", 
[45]="Infrarotgerät", [46]="Fallschirm" }

function gasCancel(attacker,weapon)

	if source == getLocalPlayer() then
		if weapon == 17 then
			if getElementModel ( source ) == 285 then
				cancelEvent()
			end
		end
		if getElementData ( lp, "tazered" ) then
			cancelEvent()
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), gasCancel )

function _createGunboxMenue ()

	if gWindow["gunbox"] then
		guiSetVisible ( gWindow["gunbox"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["gunbox"] = guiCreateWindow(screenwidth/2-573/2, screenheight/2-185/2,573, 185,"Waffenbox",false)
		guiSetAlpha(gWindow["gunbox"],1)
	
		gButton["action1"] = guiCreateButton(20, 35, 171, 31, "Waffe 1 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action1"],1)
		gButton["action2"] = guiCreateButton(200, 35, 171, 31, "Waffe 2 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action2"],1)
		gButton["action3"] = guiCreateButton(380, 35, 171, 31, "Waffe 3 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action3"],1)
		
		gButton["action4"] = guiCreateButton(20, 75, 171, 31, "Waffe 4 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action4"],1)
		gButton["action5"] = guiCreateButton(200, 75, 171, 31, "Waffe 5 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action5"],1)
		gButton["action6"] = guiCreateButton(380, 75, 171, 31, "Waffe 6 | Munition", false,gWindow["gunbox"])
		guiSetAlpha(gButton["action6"],1)
		
		gButton["close"] = guiCreateButton(200, 125, 171, 31, "Schliessen", false, gWindow["gunbox"])
		guiSetAlpha(gButton["close"],1)
		--[[gLabel["infotext"] = guiCreateLabel(0.0225,0.6994,0.8648,0.2515,"Hier kannst du deine Waffen lagern und zu einem\nspäteren Zeitpunkt wieder mitnehmen.",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["infotext"],1)
		guiLabelSetColor(gLabel["infotext"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["infotext"],"top")
		guiLabelSetHorizontalAlign(gLabel["infotext"],"left",false)]]
		
		addEventHandler("onClientGUIClick", gButton["action1"], 
			function ()
				if source == gButton["action1"] then
					if guiGetText ( gButton["action1"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 1, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 1, "ex" )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action2"], 
			function ()
				if source == gButton["action2"] then
					if guiGetText ( gButton["action2"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 2, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 2, "ex" )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action3"], 
			function ()
				if source == gButton["action3"] then
					if guiGetText ( gButton["action3"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 3, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 3, "ex" )
					end
				end
			end
		)
		
		addEventHandler("onClientGUIClick", gButton["action4"], 
			function ()
				if source == gButton["action4"] then
					if guiGetText ( gButton["action4"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 4, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 4, "ex" )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action5"], 
			function ()
				if source == gButton["action5"] then
					if guiGetText ( gButton["action5"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 5, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 5, "ex" )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action6"], 
			function ()
				if source == gButton["action6"] then
					if guiGetText ( gButton["action6"] ) == "Einlagern" then
						if getPedWeapon(getLocalPlayer()) ~= 0 then
							triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 6, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 6, "ex" )
					end
				end
			end
		)
		
		addEventHandler("onClientGUIClick", gButton["close"], 
			function ()
				guiSetVisible ( gWindow["gunbox"], false )
				showCursor(false)
				triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			end
		)
	end
	refreshData()
end
addEvent ( "gunCrateMenue", true )
addEventHandler ( "gunCrateMenue", getRootElement(), _createGunboxMenue )

function refreshData ()

	local player = getLocalPlayer()
	local slot1, slot2, slot3, slot4, slot5, slot6 = getElementData ( player, "gunboxa" ), getElementData ( player, "gunboxb" ), getElementData ( player, "gunboxc" ), getElementData ( player, "gunboxd" ), getElementData ( player, "gunboxe" ), getElementData ( player, "gunboxf" )
	local gun1, ammo1 = gettok ( slot1, 1, string.byte('|') ), gettok ( slot1, 2, string.byte('|') )
	local gun2, ammo2 = gettok ( slot2, 1, string.byte('|') ), gettok ( slot2, 2, string.byte('|') )
	local gun3, ammo3 = gettok ( slot3, 1, string.byte('|') ), gettok ( slot3, 2, string.byte('|') )
	local gun4, ammo4 = gettok ( slot4, 1, string.byte('|') ), gettok ( slot4, 2, string.byte('|') )
	local gun5, ammo5 = gettok ( slot5, 1, string.byte('|') ), gettok ( slot5, 2, string.byte('|') )
	local gun6, ammo6 = gettok ( slot6, 1, string.byte('|') ), gettok ( slot6, 2, string.byte('|') )
	if tonumber(gun1) ~= 0 then
		--guiSetText ( gLabel["Slot1Gun"], weaponNames[tonumber(gun1)] )
		guiSetText ( gButton["action1"], weaponNames[tonumber(gun1)] )
	else
		guiSetText ( gButton["action1"], "-Leer-" )
	end
	if tonumber(gun2) ~= 0 then
		--guiSetText ( gLabel["Slot2Gun"], weaponNames[tonumber(gun2)] )
		guiSetText ( gButton["action2"], weaponNames[tonumber(gun2)] )
	else
		guiSetText ( gButton["action2"], "-Leer-" )
	end
	if tonumber(gun3) ~= 0 then
		--guiSetText ( gLabel["Slot3Gun"], weaponNames[tonumber(gun3)] )
		guiSetText ( gButton["action3"], weaponNames[tonumber(gun3)] )
	else
		guiSetText ( gButton["action3"], "-Leer-" )
	end
	if tonumber(gun4) ~= 0 then
		guiSetText ( gButton["action4"], weaponNames[tonumber(gun4)] )
	else
		guiSetText ( gButton["action4"], "-Leer-" )
	end
	if tonumber(gun5) ~= 0 then
		guiSetText ( gButton["action5"], weaponNames[tonumber(gun5)] )
	else
		guiSetText ( gButton["action5"], "-Leer-" )
	end
	if tonumber(gun6) ~= 0 then
		guiSetText ( gButton["action6"], weaponNames[tonumber(gun6)] )
	else
		guiSetText ( gButton["action6"], "-Leer-" )
	end
	if tonumber(gun1) ~= 0 then
		if tonumber(ammo1) <= 1 then
			guiSetText ( gButton["action1"], weaponNames[tonumber(gun1)] )
		else
			guiSetText ( gButton["action1"], weaponNames[tonumber(gun1)].." | "..ammo1 )
		end
	end
	if tonumber(gun2) ~= 0 then
		if tonumber(ammo2) <= 1 then
			guiSetText ( gButton["action2"], weaponNames[tonumber(gun2)] )
		else
			guiSetText ( gButton["action2"], weaponNames[tonumber(gun2)].." | "..ammo2 )
		end
	end
	if tonumber(gun3) ~= 0 then
		if tonumber(ammo3) <= 1 then
			guiSetText ( gButton["action3"], weaponNames[tonumber(gun3)] )
		else
			guiSetText ( gButton["action3"], weaponNames[tonumber(gun3)].." | "..ammo3 )
		end
	end
	if tonumber(gun4) ~= 0 then
		if tonumber(ammo4) <= 1 then
			guiSetText ( gButton["action4"], weaponNames[tonumber(gun4)] )
		else
			guiSetText ( gButton["action4"], weaponNames[tonumber(gun4)].." | "..ammo4 )
		end
	end
	if tonumber(gun5) ~= 0 then
		if tonumber(ammo5) <= 1 then
			guiSetText ( gButton["action5"], weaponNames[tonumber(gun5)] )
		else
			guiSetText ( gButton["action5"], weaponNames[tonumber(gun5)].." | "..ammo5 )
		end
	end
	if tonumber(gun6) ~= 0 then
		if tonumber(ammo6) <= 1 then
			guiSetText ( gButton["action6"], weaponNames[tonumber(gun6)] )
		else
			guiSetText ( gButton["action6"], weaponNames[tonumber(gun6)].." | "..ammo6 )
		end
	end
	if getPedWeapon ( getLocalPlayer() ) ~= 0 then
		if guiGetText ( gButton["action1"]) == "-Leer-" then 
			guiSetText ( gButton["action1"], "Einlagern" )
		end
		if guiGetText ( gButton["action2"]) == "-Leer-" then 
			guiSetText ( gButton["action2"], "Einlagern" )
		end
		if guiGetText ( gButton["action3"]) == "-Leer-" then 
			guiSetText ( gButton["action3"], "Einlagern" )
		end
		if guiGetText ( gButton["action4"]) == "-Leer-" then
			guiSetText ( gButton["action4"], "Einlagern" )
		end
		if guiGetText ( gButton["action5"]) == "-Leer-" then
			guiSetText ( gButton["action5"], "Einlagern" )
		end
		if guiGetText ( gButton["action6"]) == "-Leer-" then 
			guiSetText ( gButton["action6"], "Einlagern" )
		end
	end
end
addEvent ( "refreshGunCrateBox", true )
addEventHandler ( "refreshGunCrateBox", getRootElement(), refreshData )