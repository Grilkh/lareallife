------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

addEvent("onMTHandyAction", true)
addEvent("onMTOnlineTransfer", true)
addEvent("onMTGeldLieferung", true)
addEvent("onMTAmmunationBuy", true)
addEvent("onMTHandyCasinoAction", true)
addEvent("onMTHandyUpdatesNeed", true)
addEvent("onMTHandyUpdatesEdit", true)

addEvent("onMTHandyRadioInsert", true)
addEvent("onMTHandyRadioDelete", true)
addEvent("onMTHandyRadiosGet", true)

addEvent("onMTHandyDataNeed", true)

addEvent("onMTHandyIQCQuit", true)
addEvent("onMTHandyIQCJoin", true)
addEvent("onMTHandyIQCSend", true)

addEvent("doHandyKickAntiSpam", true)

addEvent("doLAHandyCarAction", true)


local mysqlhost1 = "IP"
local mysqluser1 = "BENUTZER"
local mysqlpassword1 = "PASSWORT"
local mysqldatabase1 = "DATENBANK"

-- SECOND CONNECTION, OPTIONAL IF CONNECTION 1 DON'T WORK

local mysqlhost2 = "IP2"
local mysqluser2 = "BENUTZER2"
local mysqlpassword2 = "PASSWORT2"
local mysqldatabase2 = "DATENBANK2"

local FUNC = {}

local ghandler

local dbpTime = -1 -- Zeit zum anpingen des MySQL Servers
local delivertime = 15000 -- nicht aendern :D

local ammo_boxid = 2358 -- ID fuer die Box beim Ammu Nation bestellen

local preis = {}
local chatter = {}
local chatTimer = {}
local casinoTimer = {}


local updatetext = ""

local nutten_skins = {
	[1] = 63,
	[2] = 87,
	[3] = 178,
	[4] = 244,
	[5] = 257,
}

preis["pizza"] = 25 -- Preis fuer die Pizza
preis["heilung"] = 250 -- Preis fuer die Heilung

local function flyPlaneOverPosition(x, y, z)
	local ox, oy, oz = x-150, y+150, z+70
	local nx, ny, nz = x+150, y-150, z+70
	local car = createVehicle(getVehicleModelFromName("Dodo"), ox, oy, oz, 0, 0, 90)
	local ped = createPed(60, ox, oy, oz)
	warpPedIntoVehicle(ped, car)
	local ob = createObject(1337, ox, oy, oz)
	setElementAlpha(ob, 0)
	attachElements(car, ob, 0, 0, 0, 0, 0, 180+45)
	moveObject(ob, delivertime, nx, ny, nz)
	setTimer(function()
		vanishElement(car)
		setTimer(destroyElement, 2500, 1, ob)
		destroyElement(ped)
	end, delivertime-2500, 1)
end

addEventHandler("onMTHandyIQCSend", getRootElement(), function(text)
	if(chatter[source]) and not(isTimer(chatTimer[source])) then
		triggerClientEvent(getRootElement(), "onClientMTHandyIQCMessageSend", getRootElement(), getPlayerName(source)..": "..text)
		chatTimer[source] = setTimer(function() end, 1000, 1)
	else
		outputChatBox("Du musst einige Sekunden warten bevor du eine neue Nachricht senden kannst.", source, 150, 0, 0)
	end
end)

addEventHandler("onMTHandyUpdatesNeed", getRootElement(), function()
	triggerClientEvent(source, "onMTHandyDataNeedBack", source, "updates", updatetext)
end)

addEventHandler("doLAHandyCarAction", getRootElement(), function(id, cmd)
	executeCommandHandler(cmd, source, id)
end)

-- ANTISPAM ACTION --

addEventHandler("doHandyKickAntiSpam", getRootElement(), function()
	local name = getPlayerName(source)
	outputChatBox(name.." wurde wegen Spam vom Server gekickt!", getRootElement(), 255, 0, 0)
	outputLog ( "[KICK]: "..name.." wurde wegem Spam (Handy) vom Server gekickt.", "ban" )
	kickPlayer(source, "Anti-Spam", "Spam")
end)

-- HANDY RADIO EVENTS --


addEventHandler("onMTHandyRadioInsert", getRootElement(), function(name, url)
	local string = name.."|"..url
	-- CHEK IF ALREADY EXIST --
	local query = dbQuery(ghandler, "SELECT * FROM galaxy_radiosender WHERE NAME = '"..getPlayerName(source).."' AND RADIO = '"..string.."';")
	local result, numrows = dbPoll(query, dbpTime)
	if(result and numrows > 0) then
		dbFree(query)
		outputChatBox("Dieser Radiosender existiert bereits in deiner Liste!", source, 150, 0, 0)
		return
	end
	query = dbQuery(ghandler, "INSERT INTO galaxy_radiosender (NAME, RADIO) values ('"..getPlayerName(source).."', '"..string.."');")
	result = dbPoll(query, dbpTime)
	if(result) then
		dbFree(query)
		outputChatBox("Radio wurde erfolgreich angelegt!", source, 0, 150, 0)
		FUNC["getplayerradios"](source)
	else
		outputChatBox("Radio konnte nicht angelegt werden! Maximal 255 Zeichen!", source, 150, 0, 0)
	end
end)

addEventHandler("onMTHandyRadiosGet", getRootElement(), function()
	FUNC["getplayerradios"](source)
end)

addEventHandler("onMTHandyRadioDelete", getRootElement(), function(name, url)
	local string = name.."|"..url
	local query = dbQuery(ghandler, "DELETE FROM galaxy_radiosender WHERE NAME = '"..getPlayerName(source).."' AND RADIO = '"..string.."';")
	local result = dbPoll(query, dbpTime)
	if(result) then
		dbFree(query)
		outputChatBox("Radio wurde erfolgreich gelöscht!", source, 0, 150, 0)
		FUNC["getplayerradios"](source)
	else
		outputChatBox("Radio konnte nicht gelöscht werden!", source, 150, 0, 0)
	end
end)


addEventHandler("onMTHandyCasinoAction", getRootElement(), function(nummer, einsatz, typ)
	if(isTimer(casinoTimer[source])) then outputChatBox("Du musst noch warten!", source, 150, 0, 0) return end
	-- SICHERHEITSHINWEIS --
	if(tonumber(laGetElementData ( source, "bankmoney" )) < einsatz) then outputChatBox("Du hast nicht soviel Geld auf der Bank!", source, 150, 0, 0) return end
	--givePlayerMoney(source, -einsatz)
	laSetElementData(source, "bankmoney", laGetElementData ( source, "bankmoney" )-einsatz)
	outputChatBox("Die Zahl wird gezogen, bitte warten...", source, 200, 200, 0)
	local thePlayer = source
	casinoTimer[source] = setTimer(function()
		local anfang, ende = 0, 0
		if(typ == 1) then
			anfang, ende = 1, 10
		else
			anfang, ende = 1, 50
		end
		local gezogen = math.random(anfang, ende)
		local gewinn
		if(gezogen == nummer) then
			if(typ == 1) then
				gewinn = einsatz*2
			else
				gewinn = einsatz*3
			end
			givePlayerMoney(thePlayer, gewinn)
			outputChatBox("Glückwunsch! Die Zahl "..gezogen.." wurde gezogen und du hast "..gewinn.."$ erhalten!", thePlayer, 0, 175, 0)
		elseif(gezogen == nummer-1) or (gezogen == nummer+1) then
			givePlayerMoney(thePlayer, einsatz)
			outputChatBox("Die Nummer "..gezogen.." wurde gezogen, und du hast dein Geld wieder bekommen.", thePlayer, 0, 175, 0)
		else
			outputChatBox("Die Zahl "..gezogen.." wurde gezogen und du hast nichts erhalten.", thePlayer, 150, 0, 0)
		end
	end, 3000, 1)
end)

addEventHandler("onMTHandyIQCJoin", getRootElement(), function()
	chatter[source] = source
	local chat = 0
	for index, player in next, chatter do
		chat = chat+1
	end
	triggerClientEvent(getRootElement(), "onClientMTHandyIQCMessageSend", getRootElement(), getPlayerName(source).." ist dem Chat beigetreten.", chat)
end)

addEventHandler("onMTHandyIQCQuit", getRootElement(), function(typ)
	if not(typ) then typ = "Verlassen" end
	chatter[source] = nil
	triggerClientEvent(getRootElement(), "onClientMTHandyIQCMessageSend", getRootElement(), getPlayerName(source).." hat den Chat verlassen.("..typ..")")
end)

addEventHandler("onPlayerQuit", getRootElement(), function(typ)
	if(chatter[source]) then
		triggerEvent("onMTHandyIQCQuit", source, typ)
	end
end)


FUNC["getplayerradios"] = function(thePlayer)
	local query = dbQuery(ghandler, "SELECT * FROM galaxy_radiosender WHERE NAME = '"..getPlayerName(thePlayer).."';")
	local result, numrows = dbPoll(query, dbpTime)
	if(result and numrows > 0) then	
		triggerClientEvent(thePlayer, "onMTHandyRadiosGetBack", thePlayer, result)
		dbFree(query)
	else
		triggerClientEvent(thePlayer, "onMTHandyRadiosGetBack", thePlayer, {})
	end
end

-- UPDATES LOADING --


FUNC["loadupdates"] = function()
	local query = dbQuery(ghandler, "SELECT * FROM galaxy_updates;")
	local result, numrows = dbPoll(query, dbpTime)
	if(result) and (numrows > 0) then
		local text = result[1]['DATA']
		updatetext = text
		outputLog ( "[HANDY]: Updatetext geladen!", "mysql" )
		--outputDebugString("Updatetext geladen!: "..text)
		dbFree(query)
	else
		outputLog ( "[HANDY]: Keine Updatetable vorhanden. Erstelle neue...", "mysql" )
		query = dbQuery(ghandler, "INSERT INTO galaxy_updates (DATA) values ('Frische Updates kommen immer von Leyynen!');")
		result = dbPoll(query, dbpTime)
		if(result) then
			outputLog ( "[HANDY]: Updates erfolgreich in die Table inserted!", "mysql" )
			dbFree(query)
			FUNC["loadupdates"]()
		end
	end
end



FUNC["updateupdates"] = function(thePlayer, text)
	local query = dbQuery(ghandler, "UPDATE galaxy_updates SET DATA = '"..text.."';")
	local result = dbPoll(query, dbpTime)
	if(result) then
		updatetext = text
		outputLog ( "[HANDY]: Die Updates wurden von "..getPlayerName(thePlayer).." bearbeitet", "admin" )
		triggerClientEvent(getRootElement(), "onLAClientInfobar", thePlayer, "Updates wurden von "..getPlayerName(thePlayer).." bearbeitet.", 4000, 50, 50, 0)
	else
		outputChatBox("Updates konnten nicht gespeichert werden/Keine Änderungen entdeckt!", thePlayer, 150, 0, 0)
	end
end


-- EVENT --
addEventHandler("onMTHandyUpdatesEdit", getRootElement(), function(text)
	FUNC["updateupdates"](source, text)
end)

-- EVENT HANDLER STARTUP --

addEventHandler("onResourceStart", getResourceRootElement(), function()
	ghandler = dbConnect("mysql", "dbname="..mysqldatabase1..";host="..mysqlhost1, mysqluser1, mysqlpassword1, "autoreconnect=1")
	
	-- If the Handler 1 dont work
	if not(ghandler) then	
		ghandler = dbConnect("mysql", "dbname="..mysqldatabase2..";host="..mysqlhost2, mysqluser2, mysqlpassword2, "autoreconnect=1")
		if not(ghandler) then
			outputLog ( "[HANDY]: MySQl handler 2 not accepted! Shutting down...", "mysql" )
			cancelEvent()
		else
			FUNC["loadupdates"]()
			outputLog ( "[HANDY]: MySQl handler 2 accepted!", "mysql" )
		end
	else
		FUNC["loadupdates"]()
		outputLog ( "[HANDY]: MySQl handler 1 accepted!", "mysql" )

	end
end)



addEventHandler("onMTGeldLieferung", getRootElement(), function(menge)
if getElementInterior ( source ) == 0 and getElementDimension ( source ) == 0 then
	-- SICHERHEITSHINWEIS --
	if laGetElementData ( source, "bankmoney") <= 0 then outputChatBox("Du hast kein Geld auf der Bank!", source, 150, 0, 0) return end
	if(menge > laGetElementData ( source, "bankmoney" )) then outputChatBox("Du hast nicht soviel Geld auf der Bank!", source, 150, 0, 0) return end
	if(menge < 0) then outputChatBox("Die Menge muss mehr als 0$ sein!", source, 150, 0, 0) return end
if laGetElementData ( source, "bestellenhandy" ) == true then outputChatBox("Du hast gerade etwas bestellt, bitte warte diese Lieferung zuerst ab!", source, 150, 0, 0) return end
	outputChatBox("Geld wird zu dir gesendet!", source, 0, 175, 0)
	laSetElementData ( source, "bankmoney", laGetElementData ( source, "bankmoney" )-menge)
	laSetElementData ( source, "bestellenhandy", true )
	timeOutBestellung = setTimer(timeOut_Handy, 10000, 1, source)
	local x, y, z = getElementPosition(source)
	local sender = source
	flyPlaneOverPosition(x, y, z)
	local mengewithsteuern = menge - menge/10
	local mengesteuern = menge/10
	outputLog( "[BESTELLUNG]: "..getPlayerName(source).." hat "..menge.."$ (-"..mengesteuern.."$) bestellt!", "pay")
	local Geldlieferungsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Geldlieferung'") )
	local Geldlieferungsteuernkassenew = math.floor(Geldlieferungsteuernkasse + (mengesteuern))
	MySQL_SetString("staat", "Menge", Geldlieferungsteuernkassenew, "Name LIKE 'Geldlieferung'")
	
	setTimer(function()
		local fa = createObject ( 2903, x, y, z+50 )
		local veh = createVehicle(getVehicleModelFromName("Securicar"), x, y, z)
		attachElements(veh, fa, 0, 0, -8.8)
		moveObject ( fa, 9000, x, y, z+9, 0, 0, 0, "InQuad" )
		setTimer(function()
			detachElements(veh)
			setElementVelocity(veh, 0, 0, -0.1)
		end, 3000, 1)
		
		setTimer(function()
			vanishElement(veh)
			vanishElement(fa)
			local pickup = createPickup(x, y, z, 3, 1210, 50)
			setElementData(pickup, "for", getPlayerName(sender))
			setElementData(pickup, "menge", mengewithsteuern)
			addEventHandler("onPickupHit", pickup, function(hitElement)
				if(getElementType(hitElement) == "player") and (getElementData(source, "for") == getPlayerName(hitElement)) then
					givePlayerMoney(hitElement, getElementData(source, "menge"))
					laSetElementData ( hitElement, "money", laGetElementData(hitElement, "money")+getElementData(source, "menge"))
					destroyElement(source)
					outputChatBox("Geldlieferung von "..mengewithsteuern.."$ (-10%) erhalten!", hitElement, 0, 150, 0)
				end
			end)
		end, 10000, 1)
	end, delivertime/2, 1)
else
	outputChatBox ( "Bestellungen sind nur im Freien möglich!", source, 150, 0, 0 )
end
end)

addEventHandler("onMTAmmunationBuy", getRootElement(), function(price, table1, table2)
if getElementInterior ( source ) == 0 and getElementDimension ( source ) == 0 then
	if(price < 0) then return end
	-- SICHERHEITSHINWEIS --
	local money = laGetElementData ( source, "bankmoney" )
	if (money < price) then outputChatBox("Du benötigst mehr Geld um dies zu kaufen!", source, 150, 0, 0) return end
if laGetElementData ( source, "bestellenhandy" ) == true then outputChatBox("Du hast gerade etwas bestellt, bitte warte diese Lieferung zuerst ab!", source, 150, 0, 0) return end
	-- GELD MUSS NOCH ABGEZOGEN WERDEN, VARIABLE: PRICE
	laSetElementData ( source, "bankmoney", money - price )
	laSetElementData ( source, "bestellenhandy", true )
	timeOutBestellung = setTimer(timeOut_Handy, 10000, 1, source)
	outputChatBox("Lieferung kommt!", source, 0, 175, 0)
	local x, y, z = getElementPosition(source)
	flyPlaneOverPosition(x, y, z)
	outputLog( "[BESTELLUNG]: "..getPlayerName(source).." hat für "..price.."$ Waffen bestellt! ("..math.round(x,2)..", "..math.round(y,2)..", "..math.round(z,2)..")", "pay")
	setTimer(function()
		local fa = createObject ( 2903, x, y, z+50 )
		local box = createObject(ammo_boxid, x, y, z+50)
		setObjectScale(box, 3.0)
		attachElements(box, fa, 0, 0, -7.68)
		moveObject ( fa, 9000, x, y, z+7, 0, 0, 0, "InOutQuad" )
		setTimer(vanishElement, 10000, 1, fa)
		setTimer(vanishElement, 10000, 1, box)
		setTimer(function()
			local pickup = createPickup(x, y, z-0.5, 3, ammo_boxid, 100)
			setElementData(pickup, "weap:table1", table1)
			setElementData(pickup, "weap:table2", table2)
			addEventHandler("onPickupHit", pickup, function(hitElement)
				if(getElementType(hitElement) == "player") then
					local accept, accept2 = getElementData(source, "weap:table1"), getElementData(source, "weap:table2")
					local weap = "9mm"
					if(accept[weap] == true) then giveWeapon(hitElement, 22, 17*accept2[weap]) end
					weap = "deagle"
					if(accept[weap] == true) then giveWeapon(hitElement, 24, 7*accept2[weap]) end
					weap = "shotgun"
					if(accept[weap] == true) then giveWeapon(hitElement, 25, 5+accept2[weap]) end
					weap = "mp5"
					if(accept[weap] == true) then giveWeapon(hitElement, 29, 30*accept2[weap]) end
					weap = "ak-47"
					if(accept[weap] == true) then giveWeapon(hitElement, 30, 30*accept2[weap]) end
					--weap = "m4"
					--if(accept[weap] == true) then giveWeapon(hitElement, 31, 50*accept2[weap]) end
					weap = "rifle"
					if(accept[weap] == true) then giveWeapon(hitElement, 33, 1*accept2[weap]) end
					weap = "nachtsicht"
					if(accept[weap] == true) then giveWeapon(hitElement, 44, 1) end
					weap = "waerme"
					if(accept[weap] == true) then giveWeapon(hitElement, 45, 1) end
					weap = "armour"
					if(accept[weap] == true) then setPedArmor(hitElement, 100) end
					weap = "knife"
					if(accept[weap] == true) then giveWeapon(hitElement, 4, 1) end
					weap = "bat"
					if(accept[weap] == true) then giveWeapon(hitElement, 5, 1) end
					destroyElement(source)
				end
			end)
		end, 10000, 1)
	end, delivertime/2, 1)
else
	outputChatBox ( "Bestellungen sind nur im Freien möglich!", source, 150, 0, 0 )
end
end)

addEventHandler("onMTHandyAction", getRootElement(), function(typ, text, text2, text3, text4)
if getElementInterior ( source ) == 0 and getElementDimension ( source ) == 0 then
	if(typ == "medicine") then
		-- SICHERHEITSHINWEIS --
		local money = tonumber(laGetElementData ( source, "bankmoney" ))
		if(money < 250) then outputChatBox("Du benötigst "..preis["heilung"].."$!", source, 150, 0, 0) return end
	if laGetElementData ( source, "bestellenhandy" ) == true then outputChatBox("Du hast gerade etwas bestellt, bitte warte diese Lieferung zuerst ab!", source, 150, 0, 0) return end
		laSetElementData ( source, "bankmoney", money - 250 )
		laSetElementData ( source, "bestellenhandy", true )
		timeOutBestellung = setTimer(timeOut_Handy, 10000, 1, source)
		--givePlayerMoney(source, -250)
		outputChatBox("Lieferung kommt!", source, 0, 175, 0)
		local x, y, z = getElementPosition(source)
		flyPlaneOverPosition(x, y, z)
		outputLog( "[MEDIKIT]: "..getPlayerName(source).." hat ein Medikit bestellt!", "use")
		outputLog( "[BESTELLUNG]: "..getPlayerName(source).." hat ein Medikit bestellt! ("..math.round(x,2)..", "..math.round(y,2)..", "..math.round(z,2)..")", "pay")
		setTimer(function()
			local fallschirm = createObject ( 2903, x, y, z+50 )
			moveObject ( fallschirm, 9000, x, y, z+6.3, 0, 0, 0, "InOutQuad" )
			setTimer ( vanishElement, 10000, 1, fallschirm )
			setTimer(
			function()
				local pickup = createPickup ( x, y, z-0.5, 3, 1240 )
				addEventHandler ( "onPickupHit", pickup,
				function ( player )
					if(getElementType(player) == "player") then
						playSoundFrontEnd ( player, 40 )
						destroyElement ( source )
						setElementHealth(player, 100)
						laSetElementData ( player, "medikit", 1 )
					end
				end)
			end, 10000, 1)
		end, delivertime/2, 1)
	elseif(typ == "pizza") then
		-- SICHERHEITSHINWEIS --
		local money = tonumber(laGetElementData ( source, "bankmoney" ))
		if(money < 25) then outputChatBox("Du benötigst "..preis["pizza"].."$!", source, 150, 0, 0) return end
	if laGetElementData ( source, "bestellenhandy" ) == true then outputChatBox("Du hast gerade etwas bestellt, bitte warte diese Lieferung zuerst ab!", source, 150, 0, 0) return end
		laSetElementData ( source, "bankmoney", money - 25 )
		laSetElementData ( source, "bestellenhandy", true )
		timeOutBestellung = setTimer(timeOut_Handy, 10000, 1, source)
		--givePlayerMoney(source, -25)
		triggerClientEvent ( source, "createNewStatementEntry", source, "Bestellung auf\nPizza.com", 50 * -1, "Mit extra\nKäse" )
		pizzaStackKasse = pizzaStackKasse + 10
		outputChatBox("Lieferung kommt!", source, 0, 175, 0)
		local x, y, z = getElementPosition(source)
		flyPlaneOverPosition(x, y, z)
		outputLog( "[PIZZA]: "..getPlayerName(source).." hat eine Pizza bestellt!", "use")
		outputLog( "[BESTELLUNG]: "..getPlayerName(source).." hat eine Pizza bestellt!", "pay")
		setTimer(function()
			local fallschirm = createObject ( 2903, x, y, z+50 )
			moveObject ( fallschirm, 9000, x, y, z+6.3, 0, 0, 0, "InOutQuad" )
			setTimer ( vanishElement, 10000, 1, fallschirm )
			setTimer(
			function()
				local pickup = createPickup ( x, y, z-0.5, 3, 1582 )
				addEventHandler ( "onPickupHit", pickup,
				function ( player )
					if(getElementType(player) == "player") then
						playSoundFrontEnd ( player, 40 )
						destroyElement ( source )
						setElementHealth(player, getElementHealth(player)+20)
						laSetElementData ( player, "hunger", 100 )
						setElementData ( player, "hunger", 100 )
						setElementData ( player, "urin", getElementData ( player, "urin" )+20 )
					end
				end)
			end, 10000, 1)
		end, delivertime/2, 1)
	elseif(typ == "nuttebestellung") then
		-- SICHERHEITSHINWEIS --
		local money = laGetElementData ( source, "bankmoney" )
		if(money < 200) then outputChatBox("Du benötigst 200$!", source, 150, 0, 0) return end
	if laGetElementData ( source, "bestellenhandy" ) == true then outputChatBox("Du hast gerade etwas bestellt, bitte warte diese Lieferung zuerst ab!", source, 150, 0, 0) return end
		laSetElementData ( source, "bankmoney", money - 200 )
		laSetElementData ( source, "bestellenhandy", true )
		timeOutBestellung = setTimer(timeOut_Handy, 10000, 1, source)
		--givePlayerMoney(source, -200)
		outputChatBox("Bestellung wird geliefert!", source, 0, 175, 0)
		local x, y, z = getElementPosition(source)
		local player = source
		flyPlaneOverPosition(x, y, z)
		setTimer(function()
			local fallschirm = createObject ( 2903, x, y, z+50 )
			moveObject ( fallschirm, 9000, x, y, z+6.3, 0, 0, 0, "InOutQuad" )
			setTimer ( vanishElement, 10000, 1, fallschirm )
			
			setTimer(
			function()
				local skin = nutten_skins[math.random(1, #nutten_skins)]
				local rot = getPedRotation(player)
				local ped = createPed (skin, x, y, z-0.5, rot )
				setElementFrozen(ped, true)
				local rnd = math.random ( 1, 4 )
				if (rnd == 1) then
					setPedAnimation ( ped, "STRIP", "STR_Loop_A",-1,true,false,false)
				elseif (rnd == 2) then
					setPedAnimation ( ped, "STRIP", "STR_Loop_B",-1,true,false,false )
				elseif (rnd == 3) then
					setPedAnimation ( ped, "STRIP", "STR_Loop_C",-1,true,false,false )
				else
					setPedAnimation ( ped, "STRIP", "STR_Loop_A",-1,true,false,false )
				end
				addEventHandler("onPedWasted", ped, function()
					vanishElement(source)
				end)
			end, 10000, 1)
		end, delivertime/2, 1)
	elseif(typ == "memoupdate") then
		local query = dbQuery(ghandler, string.format("UPDATE galaxy_users SET MEMO = '%s' WHERE NAME = '%s';", text, getPlayerName(source)))
		local result, numrows = dbPoll(query, dbpTime)
		if(result and numrows > 0) then
			dbFree(query)
			outputChatBox("Memo gespeichert! Du kannst die 'back' Taste benutzen, wenn du deine Änderungen verwerfen möchtest.", source, 0, 150, 0)
		else
			error("Can't update memo for user "..getPlayerName(source).." in galaxy table")
		end
	elseif(typ == "backgroundupdate") then
		local query = dbQuery(ghandler, string.format("UPDATE galaxy_users SET BACKGROUND = '%s' WHERE NAME = '%s';", text, getPlayerName(source)))
		local result, numrows = dbPoll(query, dbpTime)
		if(result and numrows > 0) then
			dbFree(query)
			outputLog ("[HANDY]: Background "..text.." fuer "..getPlayerName(source).." gespeichert.", "save")
		else
			error("Can't update memo for user "..getPlayerName(source).." in galaxy table")
		end
	elseif(typ == "emailsend") then
		local empfaenger = text
		local email = text2
		local webserver = text3
		local betreff = text4
		if(betreff == "") or (betreff == " ") then betreff = "no subject" end
		local query = dbQuery(ghandler, "INSERT INTO galaxy_messages (TO_NAME, FROM_NAME, MESSAGE_TEXT, SUBJECT_TEXT) VALUES ('"..empfaenger.."', '"..getPlayerName(source).."@"..webserver.."', '"..email.."', '"..betreff.."');")
		local result = dbPoll(query, dbpTime)
		if(result) then
			dbFree(query)
			outputChatBox("Email gesendet!", source, 0, 150, 0)
			if(getPlayerFromName(gettok(empfaenger, 1, "@"))) then
			--	outputChatBox("Du hast eine neue E-Mail von "..getPlayerName(source).."@"..webserver.." erhalten!", getPlayerFromName(gettok(empfaenger, 1, "@")), 0, 255, 0)
				triggerClientEvent(getPlayerFromName(gettok(empfaenger, 1, "@")), "onClientLAEmailBekomm", getPlayerFromName(gettok(empfaenger, 1, "@")), getPlayerName(source).."@"..webserver)
			end
		else
			error("Cant save email for user "..getPlayerName(source).."!")
			outputChatBox("Es ist ein Fehler beim Senden der E-Mail aufgetreten!", source, 150, 0, 0)
		end	
	elseif(typ == "emailsinbox") then
		local webserver = text
		local query = dbQuery(ghandler, "SELECT * FROM galaxy_messages WHERE TO_NAME = '"..getPlayerName(source).."@"..webserver.."';")
		local result = dbPoll(query, dbpTime)
		if(result) then
			triggerClientEvent(source, "onMTHandyActionBack", source, "emailsinbox", result)
			dbFree(query)
		else
			outputChatBox("Du hast keine E-Mails/Ein Fehler trat auf.", source, 255, 0, 0)
		end
	elseif(typ == "emailsoutbox") then
		local webserver = text
		local query = dbQuery(ghandler, "SELECT * FROM galaxy_messages WHERE FROM_NAME = '"..getPlayerName(source).."@"..webserver.."';")
		local result = dbPoll(query, dbpTime)
		if(result) then
			triggerClientEvent(source, "onMTHandyActionBack", source, "emailsoutbox", result)
			dbFree(query)
		else
			outputChatBox("Du hast keine E-Mails/Ein Fehler trat auf.", source, 150, 0, 0)
		end
	elseif(typ == "maildelete") then
		local webserver = text
		local query = dbQuery(ghandler, "DELETE FROM galaxy_messages WHERE MAILID = '"..text.."';")
		local result = dbPoll(query, dbpTime)
		if(result) then
			outputChatBox("Email erfolgreich gelöscht!", source, 0, 255, 0)
			dbFree(query)
		else
			outputChatBox("Du hast keine E-Mails/Ein Fehler trat auf.", source, 150, 0, 0)
		end
	end
else
	outputChatBox ( "Bestellungen sind nur im Freien möglich!", source, 150, 0, 0 )
end
end)

function timeOut_Handy (player)
laSetElementData ( player, "bestellenhandy", false )
end

local function checkPlayerHandyTable(thePlayer)
	local query = dbQuery(ghandler, "SELECT * FROM galaxy_users WHERE NAME = '"..getPlayerName(thePlayer).."';")
	local result, numrows = dbPoll(query, dbpTime)
	if(result and numrows > 0) then
		dbFree(query)
	else
		dbFree(query)
		local linie = "======================"
		local memo = linie.."\nNotiz von "..getPlayerName(thePlayer).."\n"..linie
		query = dbQuery(ghandler, "INSERT INTO galaxy_users (NAME, MEMO, BACKGROUND) values ('"..getPlayerName(thePlayer).."', '"..memo.."', '1');")
		result = dbPoll(query, dbpTime)
		if(result) then
			dbFree(query)
		else
			error("Can't insert data for user "..getPlayerName(thePlayer).." in galaxy table")
		end
	end
end


addEventHandler("onMTHandyDataNeed", getRootElement(), function(data)
	if(data == "onlinegeld") then
		triggerClientEvent(source, "onMTHandyDataNeedBack", source, data, laGetElementData(source, "bankmoney"))
	elseif(data == "memo") then
		checkPlayerHandyTable(source)
		local query = dbQuery(ghandler, "SELECT * FROM galaxy_users WHERE NAME = '"..getPlayerName(source).."';")
		local result, numrows = dbPoll(query, dbpTime)
		if(result) and (numrows > 0) then
			local memo = result[1]['MEMO']
			triggerClientEvent(source, "onMTHandyDataNeedBack", source, "memo", memo)
			dbFree(query)
		else
			error("Can't get data for user "..getPlayerName(source).." at Handy resource")
		end
	elseif(data == "background") then
		checkPlayerHandyTable(source)
		local query = dbQuery(ghandler, "SELECT * FROM galaxy_users WHERE NAME = '"..getPlayerName(source).."';")
		local result, numrows = dbPoll(query, dbpTime)
		if(result) and (numrows > 0) then
			local id = result[1]['BACKGROUND']
			triggerClientEvent(source, "onMTHandyDataNeedBack", source, "background", id)
			dbFree(query)
		else
			error("Can't get data for user "..getPlayerName(source).." at Handy resource")
		end
	end
end)

--[[
addEventHandler("onMTOnlineTransfer", getRootElement(), function(to, value)
	-- SICHERHEITSHINWEIS --
	local money = laGetElementData ( source, "bankmoney" )
	if(money < value) then sendInfoMessage("Du hast nicht soviel Geld auf der Bank!", source, "red") return end
	local reason = ""
--	triggerEvent("onMTATMAction", source, "ueberweisen", value, to, "Onlinetransfer")
	triggerEvent ( "cashPointTransfer", source, value, to, true, reason )
end)]]

-- EINFUEGEN --
--[[
addEventHandler("onVehicleExplode", getRootElement(), function()
	if(getVehicleType(source) == "Plane") or (getVehicleType(source) == "Helicopter") then
		local veh = source
		setTimer(function()
			if(isElement(veh)) then
				local x, y, z = getElementPosition(veh)
				createExplosion(x, y, z, 4)
				createExplosion(x, y, z, 1)
				setTimer(function()
					if(isElement(veh)) then
						local x, y, z = getElementPosition(veh)
						createExplosion(x, y, z, 7)
						createExplosion(x, y, z, 7)
						local x, y, z = getElementVelocity(veh)
						setElementVelocity(veh, x, y, z+math.random(1, 5)/10)
						x, y, z = getVehicleTurnVelocity(veh)
						setVehicleTurnVelocity(veh, x, y+math.random(1, 2)/10, z)
						setTimer(function()
							if(isElement(veh)) then
								local x, y, z = getElementPosition(veh)
								createExplosion(x, y, z+6, 7)
								setTimer(function()
									if(isElement(veh)) then
										local x, y, z = getElementPosition(veh)
										createExplosion(x, y, z, 0)
										setTimer(function()
											if(isElement(veh)) then
												local x, y, z = getElementPosition(veh)
												createExplosion(x, y, z, 0)
												setTimer(function()
													if(isElement(veh)) then
														local x, y, z = getElementPosition(veh)
														createExplosion(x, y, z, 0)
													end
												end, 700, 1)
											end
										end, 500, 1)
									end
								end, 500, 1)
							end
						end, 100, 1)
					end
				end, 100, 1)
			end
		end, 300, 1)
	end
end)
]]
-- FUNKTIONEN NICHT RAUSNEHMEN --

local v_e_doing = {}

function vanishElement(theElement)
	if(v_e_doing[theElement] == true) then return end
	v_e_doing[theElement] = true
	for i = 1, 25 do
		setTimer ( setElementAlpha, 100 * i, 1, theElement, 255 / 25 * ( 25 - i ) )
	end
	setTimer ( destroyElement, 2500, 1, theElement )
end

-- DEBUG --
-- SICHERHEITSHINWEIS --
function mtGetElementData(thePlayer, value)
	return 50000;
end

function mtGetPlayerMoney(thePlayer)
	return 10000
end

--[[function laGetElementData(thePlayer, value)
	return getElementData(thePlayer, value)
end

function laSetElementData(thePlayer, value, value2)
	return setElementData(thePlayer, value, value2)
end]]