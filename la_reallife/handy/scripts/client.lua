------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
--------- 2012 - 2013 --------
------------------------------
---- Script by Noneatme ------

local enabled = false
local menue = true

local gMe = getLocalPlayer()

local font = dxCreateFont("handy/data/fonts/harabara.ttf", 36)

addEvent("onMTHandyDataNeedBack", true)
addEvent("onMTHandyActionBack", true)
addEvent("onClientMTHandyIQCMessageSend", true)
addEvent("onMTHandyRadiosGetBack", true)
addEvent("onClientLAEmailBekomm", true)
addEvent("onLAClientInfobar", true)


local houseBlip 
local can_scroll = true
local can_scrolltimer

local noSoundButton = {}


-- Event handlers -

-- Variables --

-- VEHICLE COLOOR --
local vehBlipColor = {}
vehBlipColor["r"] = {}
vehBlipColor["g"] = {}
vehBlipColor["b"] = {}
local color = 1
vehBlipColor["r"][color] = 255
vehBlipColor["g"][color] = 0
vehBlipColor["b"][color] = 0
color = color + 1
vehBlipColor["r"][color] = 0
vehBlipColor["g"][color] = 255
vehBlipColor["b"][color] = 0
color = color + 1
vehBlipColor["r"][color] = 0
vehBlipColor["g"][color] = 0
vehBlipColor["b"][color] = 255
color = color + 1
vehBlipColor["r"][color] = 0
vehBlipColor["g"][color] = 0
vehBlipColor["b"][color] = 0
color = color + 1
vehBlipColor["r"][color] = 255
vehBlipColor["g"][color] = 255
vehBlipColor["b"][color] = 255
color = color + 1
vehBlipColor["r"][color] = 255
vehBlipColor["g"][color] = 255
vehBlipColor["b"][color] = 0
color = color + 1	
vehBlipColor["r"][color] = 255
vehBlipColor["g"][color] = 0
vehBlipColor["b"][color] = 255
color = color + 1
vehBlipColor["r"][color] = 0
vehBlipColor["g"][color] = 255
vehBlipColor["b"][color] = 255
color = color + 1
vehBlipColor["r"][color] = 125
vehBlipColor["g"][color] = 125
vehBlipColor["b"][color] = 125
color = color + 1
vehBlipColor["r"][color] = 255
vehBlipColor["g"][color] = 150
vehBlipColor["b"][color] = 0
color = color + 1
color = nil
local vehBlip = {}


-- WEATHER --
local temp = 28
local weather_v_1 = 9
local weather_v_2 = 8
local weather_v_3 = 8

-- SETTINGS --

local MAX_MEMO_LENGTH = "65535"

local empfang, akku = 4, 0
local auswahl = "0"
local c_url = "www.loogle.com"
local webserver = "la-rl.com"
local pfad = "handy/scripts/" -- zum beispiel handy/, falls in Gamemode eingebunden
local cal_anzeige = ""
local last_url = c_url
local bankgeld = 0

-- ANTI SPAM --

local antiSpam = {}
antiSpam["timesopen"] = 0

-- INFO BAR --
local infoBar = {}
infoBar["text"] = ""
infoBar["showing"] = false
infoBar["timer"] = false
infoBar["r"] = false
infoBar["g"] = false
infoBar["b"] = false
infoBar["sy"] = 0
infoBar["time"] = 3000

-- RADIO DATA --
local radioauswahl = 0
local radioData = {}
local radioSample = {}
local radioBalken = {}

radioData["playing"] = false
radioData["url"] = false
radioData["name"] = false
radioData["volume"] = 1
radioData["sound"] = false
radioData["maxlenght"] = false

-- RADIO EFFECTS --

local effect_names = {
	[1] = "gargle",
	[2] = "compressor",
	[3] = "echo",
	[4] = "i3dl2reverb",
	[5] = "distortion",
	[6] = "chorus",
	[7] = "parameq",
	[8] = "reverb",
	[9] = "flanger"
}

-- SPECIFIG MESSENGER EMAIL SETTINGS --
local messengersite = "1"
local memo_text = ""
local email_text = ""
local email_sender = ""
local email_betreff = ""
local email_id = 0
local emailget = false
local emailgettimer

local update_text = "Updates werden geladen..."

local iqc_text = ""

local current_background = 1

local allowedPersons = { -- Personen die die Updates/Ankuendigungen bearbeiten koennen
	["[LA]Leyynen"] = true,
	["[LA]Tobi"] = true,
	["[LA]Samuele"] = true,
	["[LA]None"] = true,
}

local handy_backgrounds = {
	[1] = "Standard Background",
	[2] = "Weidenbaum",
	[3] = "SIII Background",
	[4] = "Abstract Background",
	[5] = "Feuerzeug Background",
	[6] = "Mustang Background",
	[7] = "Augen Background",
	[8] = "Klee Background",
	[9] = "Fussball Background",
	[10] = "Planet Background",
	[11] = "Apocalypse Background",
}

local ammu_select = {}
local radiosite = 0
local standartbuttons = false
local appsite = false
local weapon_price = 0
-- AMMU DEFINNITION --

local temp_name = "9mm"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 250
ammu_select[temp_name]["ammoprice"] = 25

temp_name = "deagle"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 550
ammu_select[temp_name]["ammoprice"] = 50

temp_name = "shotgun"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 275
ammu_select[temp_name]["ammoprice"] = 5

temp_name = "mp5"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 550
ammu_select[temp_name]["ammoprice"] = 100


temp_name = "ak-47"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 1000
ammu_select[temp_name]["ammoprice"] = 100

--[[temp_name = "m4"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 1500
ammu_select[temp_name]["ammoprice"] = 150]]

temp_name = "rifle"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 350
ammu_select[temp_name]["ammoprice"] = 7

temp_name = "armour"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 250
ammu_select[temp_name]["ammoprice"] = ammu_select[temp_name]["gunprice"]

temp_name = "nachtsicht"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 25
ammu_select[temp_name]["ammoprice"] = ammu_select[temp_name]["gunprice"]

temp_name = "waerme"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 25
ammu_select[temp_name]["ammoprice"] = ammu_select[temp_name]["gunprice"]

temp_name = "knife"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 10
ammu_select[temp_name]["ammoprice"] = ammu_select[temp_name]["gunprice"]

temp_name = "bat"
ammu_select[temp_name] = {}
ammu_select[temp_name]["ammu"] = 0
ammu_select[temp_name]["selected"] = false
ammu_select[temp_name]["gunprice"] = 15
ammu_select[temp_name]["ammoprice"] = ammu_select[temp_name]["gunprice"]

local ammu_element = {}
local OPEN_KEY = "1"

guiSetInputMode("no_binds_when_editing")

local page_images = {
	["www.loogle.com"] = "startpage",
	["loogle.com"] = "startpage",
	["www.info.com"] = "info",
	["info.com"] = "info",
	["mta-sa.de"] = "mtasa",
	["www.mta-sa.de"] = "mtasa",
	["www.sfair.de"] = "sfair",
	["www.sfair.com"] = "sfair",
	["www.sanfierroairport.com"] = "sfair",
	["www.hospital.com"] = "hospital",
	["www.healme.com"] = "hospital",
	["www.krankenhaus.com"] = "hospital",
	["www.cluckingbell.com"] = "cluckingbell",
	["www.cluckingbell.de"] = "cluckingbell",
	["www.cluckingbellhappychicken.com"] = "cluckingbell",
	["www.paynspray.de"] = "pns",
	["www.paynspray.com"] = "pns",
	["www.pns.com"] = "pns",
	["www.pns.de"] = "pns",
	["www.house.de"] = "house",
	["www.myhomes.de"] = "house",
	["www.home.com"] = "house",
	["www.myhome.com"] = "house",
	["www.house.com"] = "house",
	["www.loogle.com/select"] = "auswahlpage",
	["www.loogle.com/selectmore"] = "auswahlpage2",
	["www.bank.com"] = "bank",
	["10060"] = "10060",
	["www.news.com"] = "newsmain",
	["www.pizza.com"] = "pizza",
	["www.pizza.de"] = "pizza",
	["www.ammunation.com"] = "ammunation",
	["404"] = "404",
	["www.iqc.com"] = "iqc",
	["www.casino.com"] = "casino",
	["www.casino.de"] = "casino",
	["www.updates.com"] = "updates",
	["www.updates.de"] = "updates",
	["www.nutte.de"] = "nutten",
	["www.nutte.com"] = "nutten",
	["www.fahrzeuge.com"] = "fahrzeuge",
	["www.vehinfos.de"] = "vehinfo",
	["www.vehinfos.com"] = "vehinfo",
	["www.backgrounds.de"] = "backgrounds",
	["www.backgrounds.com"] = "backgrounds",
	["www.lamc.de"] = "lamc",
	["www.lamc.com"] = "lamc",
	["www.medic.de"] = "lamc",
	["www.lamd.de"] = "lamc",
	["www.lamd.com"] = "lamc",
	-- NEWS SEITEN --
	["www.news.com/handyinfo"] = "news/handyinfo",
}

local news = {
	[1] = "13.08.2012|Galaxy SII veroeffentlicht!|handyinfo",
}

--[[
addCommandHandler("setempfang", function(cmd, t)
	empfang = t
end)]]

addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	triggerServerEvent("onMTHandyDataNeed", localPlayer, "background")
end)

-- AKKU UND EMPFANG --

empfang = math.random(2, 4)

local lastarea = ""

function changeRandomEmpfang()
	if(lastarea == "") then
		empfang = 2
		local x, y, z = getElementPosition(getLocalPlayer())
		local zone = getZoneName(x, y, z, false)
		lastarea = zone
	else
		local x, y, z = getElementPosition(getLocalPlayer())
		local zone = getZoneName(x, y, z, false)
		if(zone ~= lastarea) then
			empfang = math.random(2, 4)
			lastarea = zone
			if(empfang == 1) then
				showInfobar("Information: Schwaches Netz", 3000, 100, 0, 0)
			end
			if(empfang == 0) then
				showInfobar("Information: Kein Netz", 3000, 200, 0, 0)
			end
		end
	end
end

-- setTimer(changeRandomEmpfang, 30000, -1)
setTimer(changeRandomEmpfang, 30000, 0)
--changeRandomEmpfang()

function changeRandomAkku()
	if(akku == 0) then
		akku = 4
	else
		akku = akku-1
		if(akku < 2) then
			showInfobar("Information: Akku schwach, bitte im Auto aufladen", 5000, 50, 0, 0)
		end
	end
end

-- setTimer(changeRandomAkku, 30*60*1000, -1)
setTimer(changeRandomAkku, 30*60*1000, 0)
changeRandomAkku()

--addCommandHandler("changeakku", changeRandomAkku)

-- AKKUCHECK --
setTimer(function()
	if(isPedInVehicle(localPlayer)) then
		if(akku < 4) then
			akku = akku+1
		end
	end
end, 60000, 0)

addEventHandler("onClientVehicleEnter", getRootElement(), function(thePlayer)
	if(thePlayer == localPlayer) then
		if(akku < 4) and (akku > 0) then
			showInfobar("Information: Akku wird geladen.", 5000, 0, 50, 50)
		end
	end
end)

-- VARIABLES --
local w_bilder = { 
	[0]="sunny",
	[1]="suncloud",
	[2]="suncloud",
	[3]="suncloud",
	[4]="suncloud",
	[5]="suncloud",
	[6]="suncloud",
	[7]="suncloud",
	[8]="stormy",
	[9]="foggy",
	[10]="sunny",
	[11]="sunny",
	[12]="sunny",
	[13]="sunny",
	[14]="sunny",
	[15]="sunny",
	[16]="rainy",
	[17]="sunny",
	[18]="sunny",
	[19]="sunny",
	[20]="foggy",
	[21]="cloudy",
	[22]="cloudy",
	[23]="sunny",
	[24]="sunny",
	[25]="sunny",
	[26]="sunny",
	[27]="cloudy",
	[28]="sunny",
	[29]="sunny",
	[30]="cloudy",
	[31]="cloudy",
	[32]="foggy",
	[33]="sunny",
	[34]="sunny",
	[35]="sunny",
	[36]="sunny",
	[37]="sunny",
	[38]="suncloud",
	[39]="suncloud",
	[40]="sunny",
	[41]="sunny",
	[42]="sunny",
	[43]="cloudy",
	[44]="cloudy",
	[45]="cloudy",
	[46]="sunny",
	[47]="sunny",
	[48]="sunny",
	[49]="cloudy"
 }
 

-- RENDER- FUCK YEA -
local buttonmain = false
local dialer = false
local browser = false
local memo = false
local calculator = false
local messeger = false
local radio = false
local faq = false
local faqsite = 0
local site = {}

local light = {}

local button = {}
local mes_labels = {}

addEventHandler("onMTHandyDataNeedBack", getLocalPlayer(), function(value, anzahl, wetter, wetter2, wetter3)
	if(value == "onlinegeld") then
		bankgeld = anzahl
	elseif(value == "wetter") then
		temp = anzahl
		weather_v_1 = wetter
		weather_v_2 = wetter2
		weather_v_3 = wetter3
	elseif(value == "memo") then
		memo_text = anzahl
		if(isElement(button["memo:memo"])) then
			guiSetText(button["memo:memo"], memo_text)
		end
	elseif(value == "updates") then
		update_text = anzahl
		if(isElement(button["browser:updates_memo"])) then
			guiSetText(button["browser:updates_memo"], update_text)
		end
	elseif(value == "background") then
		current_background = anzahl
	end
end)

addEventHandler("onClientLAEmailBekomm", getLocalPlayer(), function(absender)
	applyIncomingEffect()
	setTimer(function()
		if(emailget == true) then
			emailget = false
			if(isTimer(emailgettimer)) then
				killTimer(emailgettimer)
			end
		end
		emailget = true
		emailgettimer = setTimer(function()
			emailget = false
		end, 30000, 1)
		showInfobar("Neue E-Mail von "..absender.." empfangen!", 5000, 0, 50, 0)
	end, 3000, 1)
end)


function show_memo()
	if(memo == true) then return end
	memo = true
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	addx = 615
	addy = 58
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 488/1.5, 779/1.5
	width, height = width/1920*sx, height/1920*sx
	button["memo:memo"] = guiCreateMemo(x+addx, y-addy, width, height, "Testmemo", false)
	triggerServerEvent("onMTHandyDataNeed", gMe, "memo")
	guiSetProperty(button["memo:memo"], "MaxTextLength", MAX_MEMO_LENGTH)
end

function show_messenger(site, adress, subject, outboxonly)
	if(messenger == true) then return end
	messenger = true
	hide_browser()
	hide_browsersite("hospital")
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2

	local addx, addy, width, height, scale
	
	if(site == "1") then
		if(emailget == true) then
			emailget = false
			if(isTimer(emailgettimer)) then
				killTimer(emailgettimer)
			end
		end
		addx = 620
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:inbox"] = guiCreateButton(x+addx, y-addy, width, height, "Eingang", false)
		guiSetAlpha(button["messenger:inbox"], 0)
		
		addx = 725
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:outbox"] = guiCreateButton(x+addx, y-addy, width, height, "Ausgang", false)
		guiSetAlpha(button["messenger:outbox"], 0)
		
		addx = 830
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:recommend"] = guiCreateButton(x+addx, y-addy, width, height, "Empfohlen", false)
		guiSetAlpha(button["messenger:recommend"], 0)
		
		addx = 630
		addy = -420
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 75/1.5, 63/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:write"] = guiCreateButton(x+addx, y-addy, width, height, "Schreiben", false)
		guiSetAlpha(button["messenger:write"], 0)
		
		-- SCROLLPANE --
		
		addx = 630
		addy = 0
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 457/1.5, 597/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:scrollpane_inbox"] = guiCreateScrollPane(x+addx, y-addy, width, height, false)
		guiScrollPaneSetScrollBars(button["messenger:scrollpane_inbox"],false,true)
		
		triggerServerEvent("onMTHandyAction", gMe, "emailsinbox", webserver)
		
		addEventHandler("onClientGUIClick", button["messenger:outbox"], function()
			hide_messenger(messengersite)
			show_messenger("2")
			messengersite = "2"
		end, false)
		
		-- EVENT HANDLERS --
		addEventHandler("onClientGUIClick", button["messenger:inbox"], function()
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end, false)
		
		addEventHandler("onClientGUIClick", button["messenger:write"], function()
			hide_messenger(messengersite)
			show_messenger("3")
			messengersite = "3"
		end, false)
	elseif(site == "2") then
		addx = 620
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:inbox"] = guiCreateButton(x+addx, y-addy, width, height, "Eingang", false)
		guiSetAlpha(button["messenger:inbox"], 0)
		
		addx = 725
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:outbox"] = guiCreateButton(x+addx, y-addy, width, height, "Ausgang", false)
		guiSetAlpha(button["messenger:outbox"], 0)
		
		addx = 830
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 159/1.5, 68/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:recommend"] = guiCreateButton(x+addx, y-addy, width, height, "Empfohlen", false)
		guiSetAlpha(button["messenger:recommend"], 0)
		
		addx = 630
		addy = -420
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 75/1.5, 63/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:write"] = guiCreateButton(x+addx, y-addy, width, height, "Schreiben", false)
		guiSetAlpha(button["messenger:write"], 0)
		
		-- SCROLLPANE --
		
		addx = 630
		addy = 0
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 457/1.5, 597/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:scrollpane_inbox"] = guiCreateScrollPane(x+addx, y-addy, width, height, false)
		guiScrollPaneSetScrollBars(button["messenger:scrollpane_inbox"],false,true)
		
		triggerServerEvent("onMTHandyAction", gMe, "emailsoutbox", webserver)
		
		addEventHandler("onClientGUIClick", button["messenger:outbox"], function()
			hide_messenger(messengersite)
			show_messenger("2")
			messengersite = "2"
		end, false)
		
		-- EVENT HANDLERS --
		addEventHandler("onClientGUIClick", button["messenger:inbox"], function()
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end, false)
		
		addEventHandler("onClientGUIClick", button["messenger:write"], function()
			hide_messenger(messengersite)
			show_messenger("3")
			messengersite = "3"
		end, false)
	elseif(site == "3") then
		addx = 675
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 382/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		if not(adress) then adress = "" end
		button["messenger:edit_to"] = guiCreateEdit(x+addx, y-addy, width, height, adress, false)

		addx = 675
		addy = 0
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 382/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		if not(subject) then subject = "" end
		button["messenger:edit_subject"] = guiCreateEdit(x+addx, y-addy, width, height, subject, false)
		
		addx = 617
		addy = -50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 479/1.5, 552/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:memo_message"] = guiCreateMemo(x+addx, y-addy, width, height, "", false)
		
		addx = 632
		addy = -423
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 79/1.5, 48/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:button_send"] = guiCreateButton(x+addx, y-addy, width, height, "Senden", false)
		
		addx = 880
		addy = -423
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 79/1.5, 48/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:button_discard"] = guiCreateButton(x+addx, y-addy, width, height, "Abbrechen", false)
		guiSetAlpha(button["messenger:button_send"], 0)
		guiSetAlpha(button["messenger:button_discard"], 0)
		
		addEventHandler("onClientGUIClick", button["messenger:button_send"], function()
			local empfaenger = guiGetText(button["messenger:edit_to"])
			if(gettok(empfaenger, 2, "@") ~= webserver) then outputChatBox("Du kannst nur Emails an Spieler@"..webserver.." senden!", 255, 0, 0) return end
			local text = guiGetText(button["messenger:memo_message"])
			local betreff = guiGetText(button["messenger:edit_subject"])
			triggerServerEvent("onMTHandyAction", gMe, "emailsend", empfaenger, text, webserver, betreff)
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end, false)
		
		addEventHandler("onClientGUIClick", button["messenger:button_discard"], function()
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end, false)
	elseif(site == "4") then
		addx = 675
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 382/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		button["messenger:read_from"] = guiCreateEdit(x+addx, y-addy, width, height, email_sender, false)
		guiEditSetReadOnly(button["messenger:read_from"], true)
		
		addx = 675
		addy = 0
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 382/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		button["messenger:read_subject"] = guiCreateEdit(x+addx, y-addy, width, height, email_betreff, false)
		guiEditSetReadOnly(button["messenger:read_subject"], true)
		
		
		addx = 617
		addy = -50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 479/1.5, 552/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:memo_message"] = guiCreateMemo(x+addx, y-addy, width, height, email_text, false)
		guiMemoSetReadOnly(button["messenger:memo_message"], true)
		
		addx = 632
		addy = -423
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 79/1.5, 48/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:button_answer"] = guiCreateButton(x+addx, y-addy, width, height, "Antworten", false)
		guiSetAlpha(button["messenger:button_answer"], 0)
		
		addx = 880
		addy = -423
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 79/1.5, 48/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["messenger:button_delete"] = guiCreateButton(x+addx, y-addy, width, height, "Loeschen", false)
		guiSetAlpha(button["messenger:button_delete"], 0)
		addEventHandler("onClientGUIClick", button["messenger:button_delete"], function()
			if(outboxonly == true) then return end
			triggerServerEvent("onMTHandyAction", gMe, "maildelete", email_id)
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end, false)
		
		addEventHandler("onClientGUIClick", button["messenger:button_answer"], function()
			if(outboxonly == true) then return end
			local to = guiGetText(button["messenger:read_from"])
			local sub = "RE: "..guiGetText(button["messenger:read_subject"])
			hide_messenger(messengersite)
			show_messenger("3", to, sub)
			messengersite = "3"
		end, false)
	end
end

	

-- HANDY ACTION BACK --

addEventHandler("onMTHandyActionBack", getLocalPlayer(), function(typ, value1, value2, value3)
	if(typ == "emailsinbox") then
		if(isElement(button["messenger:scrollpane_inbox"])) then
			local sx, sy = guiGetScreenSize()
			local x, y = sx/2, sy/2

			local addx, addy, width, height, scale
			local result = value1
			local i = 1
			for index, row in pairs(result) do
				local sender = row['FROM_NAME']
				local betreff = row['SUBJECT_TEXT']
				local add = 40*i
				addx = 600
				addy = add
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 450/1.5, 60/1.5
				width, height = width/1920*sx, height/1920*sx
				button["messenger:scrollpane_label_"..i] = guiCreateLabel(x+addx, y-addy, width, height, "E-Mail "..row['MAILID']..", Von: "..sender.."@"..webserver.."\nBetreff: "..betreff, false, button["messenger:scrollpane_inbox"])
				
				local this = button["messenger:scrollpane_label_"..i]
				local id = row['MAILID']
				guiSetFont(this, "default-bold-small")
				
				addEventHandler("onClientMouseEnter", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 150, 150, 255)
				end)
				addEventHandler("onClientMouseLeave", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 255, 255, 255)
				end)
				addEventHandler("onClientGUIClick", this, function()
					if(source ~= this) then return end
					email_text = row['MESSAGE_TEXT']
					email_sender = row['FROM_NAME']
					email_betreff = row['SUBJECT_TEXT']
					email_id = row['MAILID']
					hide_messenger(messengersite)
					show_messenger("4")
					messengersite = "4"
				end)
				i = i+1
			end
		end
	elseif(typ == "emailsoutbox") then
		if(isElement(button["messenger:scrollpane_inbox"])) then
			local sx, sy = guiGetScreenSize()
			local x, y = sx/2, sy/2

			local addx, addy, width, height, scale
			local result = value1
			local i = 1
			for index, row in pairs(result) do
				local sender = row['TO_NAME']
				local betreff = row['SUBJECT_TEXT']
				local add = 40*i
				addx = 600
				addy = add
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 450/1.5, 50/1.5
				width, height = width/1920*sx, height/1920*sx
				button["messenger:scrollpane_label_"..i] = guiCreateLabel(x+addx, y-addy, width, height, "E-Mail "..row['MAILID']..", Zu: "..sender.."\nBetreff: "..betreff, false, button["messenger:scrollpane_inbox"])
				
				local this = button["messenger:scrollpane_label_"..i]
				local id = row['MAILID']
				guiSetFont(this, "default-bold-small")
				
				addEventHandler("onClientMouseEnter", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 150, 150, 255)
				end)
				addEventHandler("onClientMouseLeave", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 255, 255, 255)
				end)
				addEventHandler("onClientGUIClick", this, function()
					if(source ~= this) then return end
					email_text = row['MESSAGE_TEXT']
					email_sender = row['FROM_NAME']
					email_betreff = row['SUBJECT_TEXT']
					email_id = row['MAILID']
					hide_messenger(messengersite)
					show_messenger("4", nil, nil, true)
					messengersite = "4"
				end)
				i = i+1
			end
		end
	end
end)


function hide_messenger(site)
	if(messenger == false) then return end
	hide_messengersite(site)
	messenger = false
end

function hide_messengersite(site)
	if(messenger == true) then
		if(site == "1") or (site == "2") then
			destroyElement(button["messenger:inbox"])
			destroyElement(button["messenger:outbox"])
			destroyElement(button["messenger:recommend"])
			destroyElement(button["messenger:write"])
			destroyElement(button["messenger:scrollpane_inbox"])
		elseif(site == "3") then
			destroyElement(button["messenger:edit_to"])
			destroyElement(button["messenger:edit_subject"])
			destroyElement(button["messenger:memo_message"])
			destroyElement(button["messenger:button_send"])
			destroyElement(button["messenger:button_discard"])
		elseif(site == "4") then
			destroyElement(button["messenger:read_from"])
			destroyElement(button["messenger:read_subject"])
			destroyElement(button["messenger:memo_message"])
			destroyElement(button["messenger:button_answer"])
			destroyElement(button["messenger:button_delete"])
		end
	end
end

function hide_memo()
	if(memo == false) then return end
	memo = false
	destroyElement(button["memo:memo"])
end

-- INFOBAR --
--[[
	infoBar["text"] = ""
	infoBar["showing"] = false
	infoBar["timer"] = false
]]

function applyIncomingEffect(lenght)
	if not(lenght) then
		lenght = math.random(3000, 5000)
	end
	local s = playSound("handy/data/sounds/interference.mp3", false)
	setTimer(destroyElement, lenght, 1, s)
end

function hideInfobar()
	infoBar["showing"] = false
	infoBar["text"] = ""
end

function showInfobar(text, time, r, g, b, silent)
	if(isTimer(infoBar["timer"])) then
		killTimer(infoBar["timer"])
	end
	if not(r) then r = 255 end
	if not(g) then g = 255 end
	if not(b) then b = 255 end
	if not(time) then time = 3000 end
	infoBar["text"] = text
	infoBar["showing"] = true
	infoBar["r"] = r
	infoBar["g"] = g
	infoBar["b"] = b
	infoBar["time"] = time
	if(silent ~= true) then
		playSound("handy/data/sounds/notification1.mp3", false)
		playSound("handy/data/sounds/vibration1.mp3", false)
	end
	if(enabled) then
		infoBar["timer"] = setTimer(hideInfobar, infoBar["time"], 1)
	end
end

addEventHandler("onLAClientInfobar", getLocalPlayer(), showInfobar)

--[[
addCommandHandler("infobar", function(cmd, text)
	showInfobar(text)
--	applyIncomingEffect()
end)]]

local faq_label = {}
local faq_words = {}

local faq_suche = 0

local last_scrollpos = 0



function show_faq(id)
	if not(id) then id = 0 end
	if(faq == false) then
		if(id == 0) then 
			guiSetInputMode("no_binds_when_editing")
			faq = true
			local sx, sy = guiGetScreenSize()
			local x, y = sx/2, sy/2
			local addx, addy, width, height, scale
			addx = 680
			addy = 47
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 236, 25
			width, height = width/1920*sx, height/1920*sx
			button["faq:searchedit"] = guiCreateEdit(x+addx, y-addy, width, height, "Suche...", false)
			
			
			addx = 630
			addy = 0
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 457/1.5, 697/1.5
			width, height = width/1920*sx, height/1920*sx
			button["faq:pane"] = guiCreateScrollPane(x+addx, y-addy, width, height, false)
			local i = 1
			for index, wert in pairs(handy_help_titel) do
				local add = (40/1920*sx)*i
				addx = 600
				addy = add
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 450/1.5, 60/1.5
				width, height = width/1920*sx, height/1920*sx
				faq_label[i] = guiCreateLabel(x+addx, y-addy, width, height, wert, false, button["faq:pane"])
				guiLabelSetColor(faq_label[i], 0, 0, 0)
				guiSetFont(faq_label[i], "default-bold-small")
				
				addEventHandler("onClientMouseEnter", faq_label[i], function()
					guiLabelSetColor(source, 100, 100, 100)
					playSoundFrontEnd(42)
				end, false)
				addEventHandler("onClientMouseLeave", faq_label[i], function()
					guiLabelSetColor(source, 0, 0, 0)
				end, false)
				
				addEventHandler("onClientGUIClick", faq_label[i], function()
					last_scrollpos = guiScrollPaneGetVerticalScrollPosition(button["faq:pane"])
					playSoundFrontEnd(41)
					for index, key in pairs(handy_help_titel) do
						if(key == guiGetText(source)) then
							faq_suche = index
							break;
						end
					end
					hide_faq(0)
					show_faq(1)
					faqsite = 1
				end, false)
				
				i = i+1
			end
			
			addEventHandler("onClientGUIClick", button["faq:searchedit"], function()
				if(guiGetText(source) == "Suche...") then
					guiSetText(source, " ")
				end
			end, false)
			
			addEventHandler("onClientGUIChanged", button["faq:searchedit"], function()
				local text = guiGetText(source)
				for index, label in pairs(faq_label) do
					if(isElement(label)) then
						destroyElement(label)
					end
				end
				if(text == "Suche...") or (text == "") then
					local i = 1
					for index, wert in pairs(handy_help_titel) do
						local add = (40/1920*sx)*i
						addx = 600
						addy = add
						addx = addx/1920*sx
						addy = addy/1920*sx
						width, height = 450/1.5, 60/1.5
						width, height = width/1920*sx, height/1920*sx
						faq_label[i] = guiCreateLabel(x+addx, y-addy, width, height, wert, false, button["faq:pane"])
						guiLabelSetColor(faq_label[i], 0, 0, 0)
						guiSetFont(faq_label[i], "default-bold-small")
						addEventHandler("onClientMouseEnter", faq_label[i], function()
							guiLabelSetColor(source, 100, 100, 100)
							playSoundFrontEnd(42)
						end, false)
						addEventHandler("onClientMouseLeave", faq_label[i], function()
							guiLabelSetColor(source, 0, 0, 0)
						end, false)
						addEventHandler("onClientGUIClick", faq_label[i], function()
							playSoundFrontEnd(41)
							for index, key in pairs(handy_help_titel) do
								if(key == guiGetText(source)) then
									faq_suche = index
									break;
								end
							end
							hide_faq(0)
							show_faq(1)
							faqsite = 1
						end, false)
						i = i+1
					end
				else
					for index, words in pairs(faq_words) do
						faq_words[index] = false
					end
					local i = 1
					text2 = string.gsub(text, "?", "%")
					text2 = string.lower(text2)
					for index, wert in pairs(handy_help_titel) do
						wert2 = string.gsub(wert, "?", "%")
						wert2 = string.lower(wert2)
						for index, cut in pairs(string.explode(wert2, " ")) do
							cut = string.gsub(cut, "?", "%")
							cut = string.gsub(cut, " ", "")
							for index2, cut2 in pairs(string.explode(text2, " ")) do
								cut2 = string.gsub(cut2, "?", "%")
								cut2 = string.gsub(cut2, " ", "")
								if(cut == cut2) then
									if(faq_words[wert] ~= true) then
										local add = (40/1920*sx)*i
										addx = 600
										addy = add
										addx = addx/1920*sx 
										addy = addy/1920*sx
										width, height = 450/1.5, 60/1.5
										width, height = width/1920*sx, height/1920*sx
										faq_label[i] = guiCreateLabel(x+addx, y-addy, width, height, wert, false, button["faq:pane"])
										guiLabelSetColor(faq_label[i], 0, 0, 0)
										guiSetFont(faq_label[i], "default-bold-small")
										faq_words[wert] = true
										addEventHandler("onClientMouseEnter", faq_label[i], function()
											guiLabelSetColor(source, 100, 100, 100)
											playSoundFrontEnd(42)
										end, false)
										addEventHandler("onClientMouseLeave", faq_label[i], function()
											guiLabelSetColor(source, 0, 0, 0)
										end, false)
										
										addEventHandler("onClientGUIClick", faq_label[i], function()
											playSoundFrontEnd(41)
											for index, key in pairs(handy_help_titel) do
												if(key == guiGetText(source)) then
													faq_suche = index
													break;
												end
											end
											hide_faq(0)
											show_faq(1)
											faqsite = 1
										end, false)
										i = i+1
									end
								end
							end
						end
					end
				end
			end, false)
			guiScrollPaneSetVerticalScrollPosition(button["faq:pane"], last_scrollpos)
			--[[local addx, addy, width, height, scale
			local result = value1
			local i = 1
			for index, row in pairs(result) do
				local sender = row['FROM_NAME']
				local betreff = row['SUBJECT_TEXT']
				local add = 40*i
				addx = 600
				addy = add
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 450/1.5, 60/1.5
				width, height = width/1920*sx, height/1920*sx
				button["messenger:scrollpane_label_"..i] = guiCreateLabel(x+addx, y-addy, width, height, "E-Mail "..row['MAILID']..", Von: "..sender.."@"..webserver.."\nBetreff: "..betreff, false, button["messenger:scrollpane_inbox"])
				
				local this = button["messenger:scrollpane_label_"..i]
				local id = row['MAILID']
				guiSetFont(this, "default-bold-small")
				
				addEventHandler("onClientMouseEnter", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 150, 150, 255)
				end)
				addEventHandler("onClientMouseLeave", this, function()
					if(source ~= this) then return end
					guiLabelSetColor(source, 255, 255, 255)
				end)
				addEventHandler("onClientGUIClick", this, function()
					if(source ~= this) then return end
					email_text = row['MESSAGE_TEXT']
					email_sender = row['FROM_NAME']
					email_betreff = row['SUBJECT_TEXT']
					email_id = row['MAILID']
					hide_messenger(messengersite)
					show_messenger("4")
					messengersite = "4"
				end)
				i = i+1
			end]]
		elseif(id == 1) then
			local sx, sy = guiGetScreenSize()
			local x, y = sx/2, sy/2
			local addx, addy, width, height, scale
			
			addx = 680
			addy = 47
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 236, 25
			width, height = width/1920*sx, height/1920*sx
			button["faq:searchedit"] = guiCreateEdit(x+addx, y-addy, width, height, handy_help_titel[faq_suche], false)
			faq = true
			addEventHandler("onClientGUIChanged", button["faq:searchedit"], function()
				hide_faq(faqsite)
				show_faq(0)
				faqsite = 0
			end, false)
		end
	end
end


function hide_faq(id)
	if not(id) then id = 0 end
	if(faq == true) then
		if(id == 0) then
			faq = false
			destroyElement(button["faq:searchedit"])
			destroyElement(button["faq:pane"])
			for index, label in pairs(faq_label) do
				if(isElement(label)) then
					destroyElement(label)
				end
			end
		elseif(id == 1) then
			faq = false
			destroyElement(button["faq:searchedit"])
		end
	end
end

-- FAQ --

function show_calculator()
	if(calculator == true) then return end
	calculator = true
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2

	local addx, addy, width, height, scale
	
	
	-- Special numbers --
	
	addx = 620
	addy = -375
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num."] = guiCreateButton(x+addx, y-addy, width, height, ".", false)
	
	addx = 780
	addy = -375
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num="] = guiCreateButton(x+addx, y-addy, width, height, "=", false)
	
	addx = 860
	addy = -375
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num+"] = guiCreateButton(x+addx, y-addy, width, height, "+", false)
	
	addx = 860
	addy = -285
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num-"] = guiCreateButton(x+addx, y-addy, width, height, "-", false)
	
	addx = 860
	addy = -195
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num*"] = guiCreateButton(x+addx, y-addy, width, height, "*", false)
	
	addx = 860
	addy = -105
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num/"] = guiCreateButton(x+addx, y-addy, width, height, "/", false)
	
	addx = 700
	addy = -375
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num0"] = guiCreateButton(x+addx, y-addy, width, height, "0", false)
	
	addx = 620
	addy = -285
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num1"] = guiCreateButton(x+addx, y-addy, width, height, "1", false)
	
	addx = 700
	addy = -285 -- 200 das ist 5!
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num2"] = guiCreateButton(x+addx, y-addy, width, height, "2", false)
	

	
	addx = 780
	addy = -285
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num3"] = guiCreateButton(x+addx, y-addy, width, height, "3", false)
	
	addx = 620
	addy = -195
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num4"] = guiCreateButton(x+addx, y-addy, width, height, "4", false)
	
	addx = 700
	addy = -195
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num5"] = guiCreateButton(x+addx, y-addy, width, height, "5", false)
	
	addx = 780
	addy = -195
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num6"] = guiCreateButton(x+addx, y-addy, width, height, "6", false)
	
	addx = 620
	addy = -105
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num7"] = guiCreateButton(x+addx, y-addy, width, height, "7", false)
	
	addx = 700
	addy = -105
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num8"] = guiCreateButton(x+addx, y-addy, width, height, "8", false)
	
	addx = 780
	addy = -105
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 127/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:num9"] = guiCreateButton(x+addx, y-addy, width, height, "9", false)
	
	addx = 860
	addy = -55
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 114/1.5, 74/1.5
	width, height = width/1920*sx, height/1920*sx
	button["cal:numdel"] = guiCreateButton(x+addx, y-addy, width, height, "del", false)
	
	guiSetAlpha(button["cal:num0"], 0)
	guiSetAlpha(button["cal:num1"], 0)
	guiSetAlpha(button["cal:num2"], 0)
	guiSetAlpha(button["cal:num3"], 0)
	guiSetAlpha(button["cal:num4"], 0)
	guiSetAlpha(button["cal:num5"], 0)
	guiSetAlpha(button["cal:num6"], 0)
	guiSetAlpha(button["cal:num7"], 0)
	guiSetAlpha(button["cal:num8"], 0)
	guiSetAlpha(button["cal:num9"], 0)
	guiSetAlpha(button["cal:num+"], 0)
	guiSetAlpha(button["cal:num-"], 0)
	guiSetAlpha(button["cal:num*"], 0)
	guiSetAlpha(button["cal:num/"], 0)
	guiSetAlpha(button["cal:numdel"], 0)
	guiSetAlpha(button["cal:num."], 0)
	guiSetAlpha(button["cal:num="], 0)
	
	-- EVENT HANDLERS --
	addEventHandler("onClientGUIClick", button["cal:num+"], function()
		local l = #cal_anzeige
		if(l > 29) or (l < 1) then return end
		local last = string.sub(cal_anzeige, #cal_anzeige, #cal_anzeige)
		if(last == "+") or (last == "-") or (last == "*") or (last == "/") or (last == ".") then return end
		cal_anzeige = cal_anzeige.."+"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num-"], function()
		local l = #cal_anzeige
		if(l > 29) or (l < 1) then return end
		local last = string.sub(cal_anzeige, #cal_anzeige, #cal_anzeige)
		outputChatBox(last)
		if(last == "+") or (last == "-") or (last == "*") or (last == "/") or (last == ".") then return end
		cal_anzeige = cal_anzeige.."-"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num*"], function()
		local l = #cal_anzeige
		if(l > 29) or (l < 1) then return end
		local last = string.sub(cal_anzeige, #cal_anzeige, #cal_anzeige)
		if(last == "+") or (last == "-") or (last == "*") or (last == "/") or (last == ".") then return end
		cal_anzeige = cal_anzeige.."*"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num/"], function()
		local l = #cal_anzeige
		if(l > 29) or (l < 1) then return end
		local last = string.sub(cal_anzeige, #cal_anzeige, #cal_anzeige)
		if(last == "+") or (last == "-") or (last == "*") or (last == "/") or (last == ".") then return end
		cal_anzeige = cal_anzeige.."/"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num."], function()
		local l = #cal_anzeige
		if(l > 29) or (l < 1) then return end
		local last = string.sub(cal_anzeige, #cal_anzeige, #cal_anzeige)
		if(last == "+") or (last == "-") or (last == "*") or (last == "/") or (last == ".") then return end
		cal_anzeige = cal_anzeige.."."
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num0"], function()
		local l = #cal_anzeige
		if(l > 29)  then return end
		cal_anzeige = cal_anzeige.."0"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num1"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."1"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num2"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."2"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num3"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."3"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num4"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."4"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num5"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."5"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num6"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."6"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num7"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."7"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num8"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."8"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num9"], function()
		local l = #cal_anzeige
		if(l > 29) then return end
		cal_anzeige = cal_anzeige.."9"
	end, false)
	addEventHandler("onClientGUIClick", button["cal:num="], function()
		local wert = string.format("%f", tostring(loadstring("return "..cal_anzeige)()))
		cal_anzeige = wert
	end, false)
	addEventHandler("onClientGUIClick", button["cal:numdel"], function()
		cal_anzeige = string.sub(cal_anzeige, 1, #cal_anzeige-1)
	end, false)
end

function hide_calculator()
	if(calculator == false) then return end
	calculator = false
	destroyElement(button["cal:num0"])
	destroyElement(button["cal:num1"])
	destroyElement(button["cal:num2"])
	destroyElement(button["cal:num3"])
	destroyElement(button["cal:num4"])
	destroyElement(button["cal:num5"])
	destroyElement(button["cal:num6"])
	destroyElement(button["cal:num7"])
	destroyElement(button["cal:num8"])
	destroyElement(button["cal:num9"])
	destroyElement(button["cal:num="])
	destroyElement(button["cal:num*"])
	destroyElement(button["cal:num/"])
	destroyElement(button["cal:num+"])
	destroyElement(button["cal:num-"])
	destroyElement(button["cal:numdel"])
	destroyElement(button["cal:num."])
end

-- DEBUB SHIT --
--[[
addCommandHandler("ammu", function()
	local url = "www.ammunation.com"
	local curl = c_url
	last_url = c_url
	hide_browsersite(page_images[curl])
	local image = page_images[url]
	if not(image) then image = "404" end
	show_browsersite(image)
	c_url = url
end)]]

function show_browsersite(name)
	if(site[name] == name) then return end
	site[name] = name
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	local this
	local addx, addy, width, height, scale
	guiSetInputMode("no_binds_when_editing")
	if(name == "startpage") then
		addx = 621
		addy = -138
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 410/1.5, 62/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:startpage_edit"] = guiCreateEdit(x+addx, y-addy, width, height, last_url, false)
		
		addx = 891
		addy = -138
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 62/1.5, 62/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:startpage_button"] = guiCreateButton(x+addx, y-addy, width, height, "Los", false)
		guiSetAlpha(button["browser:startpage_button"], 0)
		
		addx = 630
		addy = -350
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 421/1.5, 129/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:startpage_btn_auswahl"] = guiCreateButton(x+addx, y-addy, width, height, "Auswahl", false)
		guiSetAlpha(button["browser:startpage_btn_auswahl"], 0)
		
		addx = 640
		addy = -252
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 421/1.5, 129/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:startpage_btn_auswahl2"] = guiCreateButton(x+addx, y-addy, width, height, "Auswahl", false)
		guiSetAlpha(button["browser:startpage_btn_auswahl2"], 0)
		addEventHandler("onClientGUIClick", button["browser:startpage_btn_auswahl2"], function()
			local url = "www.loogle.com/selectmore"
			if(tonumber(empfang) > 1) then
				
			else
				url = "10060"
			end
			local curl = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			show_browsersite(image)
			c_url = url
		end, false)
		
		addEventHandler("onClientGUIClick", button["browser:startpage_btn_auswahl"], function()
			local url = "www.loogle.com/select"
			if(tonumber(empfang) > 1) then
				
			else
				url = "10060"
			end
			local curl = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			show_browsersite(image)
			c_url = url
		end, false)
		
		-- EVENT HANDLERS --
		addEventHandler("onClientGUIClick", button["browser:startpage_button"], function()
			local url = guiGetText(button["browser:startpage_edit"])
			if(tonumber(empfang) > 1) then
				
			else
				url = "10060"
			end
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then 
				image = "404"
			end
			show_browsersite(image)
			c_url = url
		end, false)
	elseif(name == "404") then
		--[[
		 for i, player in ipairs(getElementsByType("player")) do
            if string.find(getPlayerName(player):lower(), tostring(name):lower(), 1, true) then
                return player 
            end
        end]]
	addx = 675
	addy = -220
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 400/1.5, 50/1.5
	width, height = width/1920*sx, height/1920*sx
	button["browser:404_infolabel"] = guiCreateLabel(x+addx, y-addy, width, height, "Die von dir angeforderte Seite\nkann nicht gefunden werden.", false)
	local this = button["browser:404_infolabel"]
	guiSetFont(this, "default-bold-small")
	guiLabelSetColor(this, 0, 0, 0)
	-- CHECK --
	-- Buggy, it finds only loogle.com --
	local url = c_url
	local teil = ""
	local sitefound = {}
	sitefound["state"] = false
	sitefound["site"] = ""
	if(gettok(c_url, 1, ".")) and (gettok(c_url, 2, ".")) and (gettok(c_url, 3, ".")) then
		teil = gettok(c_url, 2, ".")
	else
		teil = c_url
	end
	for site, image in next, page_images do
		if(gettok(c_url, 1, ".")) and (gettok(c_url, 2, ".")) and (gettok(c_url, 3, ".")) then
			if string.find(site:lower(), "%s"..tostring(teil):lower(), 1, true) then
				sitefound["state"] = true
				sitefound["site"] = site
				break;
			end
		else
			if string.find(image:lower(), "%s"..tostring(teil):lower(), 1, true) then
				sitefound["state"] = true
				sitefound["site"] = site
				break;
			end
		end
	end
	if(sitefound["state"] == true) then
		guiSetText(this, "Did you mean\n"..sitefound["site"].."?")
	end
	elseif(name == "auswahlpage") then
		-- Knoepfe 
		addx = 615
		addy = -132+88
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_google"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_google"], 0)
		addEventHandler("onClientGUIClick", button["browser:auswahl_google"], function()
			local url = "www.loogle.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 615
		addy = -132
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_clucking"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_clucking"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_clucking"], function()
			local url = "www.cluckingbell.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		
		addx = 615
		addy = -220
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_hospital"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_hospital"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_hospital"], function()
			local url = "www.hospital.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 615
		addy = -220-88
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_pns"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_pns"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_pns"], function()
			local url = "www.paynspray.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 615
		addy = -220-(88*2)
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 103/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_bank"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_bank"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_bank"], function()
			local url = "www.bank.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
	elseif(name == "auswahlpage2") then
		-- Knoepfe 
		addx = 615
		addy = -132+88
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_google"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_google"], 0)
		addEventHandler("onClientGUIClick", button["browser:auswahl_google"], function()
			local url = "www.loogle.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 615
		addy = -132
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_ammu"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_ammu"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_ammu"], function()
			local url = "www.ammunation.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 617
		addy = -220
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_casino"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_casino"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_casino"], function()
			local url = "www.casino.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 617
		addy = -220-88
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 130/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_background"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_background"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_background"], function()
			local url = "www.backgrounds.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
		
		addx = 615
		addy = -220-(88*2)
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 103/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:auswahl_pizza"] = guiCreateButton(x+addx, y-addy, width, height, "", false)
		guiSetAlpha(button["browser:auswahl_pizza"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:auswahl_pizza"], function()
			local url = "www.pizza.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
	elseif(name == "backgrounds") then
		addx = 630
		addy = -120
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 448/1.5, 442/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:backgrounds_grid"] = guiCreateGridList(x+addx, y-addy, width, height, false)
		guiGridListAddColumn(button["browser:backgrounds_grid"], "ID", 0.3)
		guiGridListAddColumn(button["browser:backgrounds_grid"], "Name", 0.55)
		
		for i = 1, #handy_backgrounds, 1 do
			local index = i
			local key = handy_backgrounds[i]
			local row = guiGridListAddRow(button["browser:backgrounds_grid"])
			guiGridListSetItemText(button["browser:backgrounds_grid"], row, 1, index, false, false)
			guiGridListSetItemText(button["browser:backgrounds_grid"], row, 2, key, false, false)
		end
		
		guiSetFont(button["browser:backgrounds_grid"], "default-bold-small")
		addx = 630
		addy = -420
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 177/1.5, 47/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:backgrounds_button"] = guiCreateButton(x+addx, y-addy, width, height, "Aktivieren", false)
		
		addEventHandler("onClientGUIClick", button["browser:backgrounds_button"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:backgrounds_grid"], guiGridListGetSelectedItem(button["browser:backgrounds_grid"]), 1))
			if(id) then
				if not(fileExists("handy/dataimages/galaxy/icons/backgrounds/background"..id..".jpg")) then
					downloadFile("handy/dataimages/galaxy/icons/backgrounds/background"..id..".jpg")
				end
				current_background = id
				outputChatBox("Hintergrund ausgewählt! Solltest du ihn nicht gedownloadet haben, wirst du es spätestens jetzt tun.", 0, 255, 0)
				triggerServerEvent("onMTHandyAction", gMe, "backgroundupdate", current_background)
			else
				outputChatBox("Du musst ein Item aus der Liste auswählen!", 255, 0, 0)
			end
		end, false)
	elseif(name == "pizza") then
	
		addx = 630
		addy = -350
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 120/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:pizza_buy"] = guiCreateButton(x+addx, y-addy, width, height, "Pizza liefern\n25$", false)
	
		addEventHandler("onClientGUIClick", button["browser:pizza_buy"], function()
			triggerServerEvent("onMTHandyAction", getLocalPlayer(), "pizza")
		end, false)
	elseif(name == "hospital") then
	
		addx = 630
		addy = -350
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 120/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:hospital_buy"] = guiCreateButton(x+addx, y-addy, width, height, "Medikit liefern\n250$", false)
	
		addEventHandler("onClientGUIClick", button["browser:hospital_buy"], function()
			triggerServerEvent("onMTHandyAction", getLocalPlayer(), "medicine")
		end, false)
	elseif(name == "house") then
	
		addx = 620
		addy = -430
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 191/1.5, 48/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:house_mark"] = guiCreateButton(x+addx, y-addy, width, height, "Mark", false)
		guiSetAlpha(button["browser:house_mark"], 0)
		
		addx = 620
		addy = -150
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 439/1.5, 407/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:house_grid"] = guiCreateGridList(x+addx, y-addy, width, height, false)
		
		guiGridListAddColumn(button["browser:house_grid"], "ID", 0.2)
		guiGridListAddColumn(button["browser:house_grid"], "Ort", 0.5)
		guiGridListAddColumn(button["browser:house_grid"], "Preis", 0.3)
		guiGridListSetSelectionMode(button["browser:house_grid"], 1)
		local housePos = {}
		
		-- List fill
		for index, colshape in pairs(getElementsByType("pickup")) do
			if(getElementData(colshape, "OWNER") ) and (getElementData(colshape, "OWNER") == getPlayerName(gMe)) then
				local x1, y1, z1 = getElementPosition(colshape)
				local zone1, zone2 = getZoneName(x1, y1, z1, false), getZoneName(x1, y1, z1, true)
				local id = getElementData(colshape, "ID")
				local preis = getElementData(colshape, "PRICE")
				local row = guiGridListAddRow(button["browser:house_grid"])
				guiGridListSetItemText(button["browser:house_grid"], row, 1, id, false, false)
				guiGridListSetItemText(button["browser:house_grid"], row, 2, zone1..", "..zone2, false, false)
				guiGridListSetItemText(button["browser:house_grid"], row, 3, "$"..preis, false, false)
				housePos[id] = {}
				housePos[id]["x"] = x1
				housePos[id]["y"] = y1
				housePos[id]["z"] = z1
			end
		end
		-- EVENT HANDLERS --
		addEventHandler("onClientGUIClick", button["browser:house_mark"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:house_grid"], guiGridListGetSelectedItem(button["browser:house_grid"]), 1))
			if not (id) then outputChatBox("Du musst eines deiner Häuser auswählen, solange du eins besitzt!", 255, 0, 0) return end
			local x, y, z = housePos[id]["x"], housePos[id]["y"], housePos[id]["z"]
			if(isElement(houseBlip)) then return end
			houseBlip = createBlip(x, y, z, 0, 2, 0, 255, 255, 255, 0, 99999.0)
			setTimer(destroyElement, 10000, 1, houseBlip)
			outputChatBox("Dein Haus wird dir auf deinem Radar angezeigt!", 0, 255, 0)
		end, false)
	elseif(name == "fahrzeuge") then
		addx = 620
		addy = -50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 480/1.5, 450/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_grid"] = guiCreateGridList(x+addx, y-addy, width, height, false)
		-- Creates the Grid-List (Table) for the cars that are owned by the user
		-- Column definition
		guiGridListAddColumn(button["browser:car_grid"], "Slot", 0.2)
		guiGridListAddColumn(button["browser:car_grid"], "Name", 0.3)
		guiGridListAddColumn(button["browser:car_grid"], "Standort", 0.4)
		-- Gird Settings
		guiGridListSetSelectionMode(button["browser:car_grid"], 1)
		guiSetFont(button["browser:car_grid"], "default-bold-small")
		color = 0
		-- Gets trough each element in the dictionary 'vehicle' 
		for index, k in pairs(getElementsByType("vehicle")) do
			if(getElementData(k, "owner") ) and (getElementData(k, "owner") == getPlayerName(gMe)) then
				-- x,y,z Postition of car by index
				outputDebugString("Coordinates of the car"..index.." "..x.." "..y.." "..z);
				local x1, y1, z1 = getElementPosition(k)
				if(isElement(vehBlip[k])) then
					destroyElement(vehBlip[k])
				end
				
				local zone1, zone2 = getZoneName(x1, y1, z1, false), getZoneName(x1, y1, z1, true)
				-- Gets the id,name from the database and adds a new row for the car
				local id = getElementData(k, "carslotnr_owner")
				local name = getVehicleNameFromModel(getElementModel(k))
				local row = guiGridListAddRow(button["browser:car_grid"])
				guiGridListSetItemText(button["browser:car_grid"], row, 1, id, false, false)
				guiGridListSetItemText(button["browser:car_grid"], row, 2, name, false, false)
				guiGridListSetItemText(button["browser:car_grid"], row, 3, zone1..", "..zone2, false, false)
				-- GPS --
				if(getElementData(k, "gps")) then
					outputDebugString("In GPS Function to create the Blip");
					color = color + 1
					vehBlip[k] = createBlip ( x1, y1, z1, 0, 2, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color], 255, 0, 99999.0)
					setTimer ( function() if(isElement(vehBlip[k])) then destroyElement(vehBlip[k]) end end, 10000, 1)
					for i = 1, 3, 1 do guiGridListSetItemColor(button["browser:car_grid"], row, i, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color]) end
				end
			end
		end
			
		addx = 630
		addy = -385
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 145/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_button1"] = guiCreateButton(x+addx, y-addy, width, height, "Abschliessen", false)
		guiSetFont(button["browser:car_button1"], "default-bold-small")
		guiSetAlpha(button["browser:car_button1"], 0)
		addEventHandler("onClientGUIClick", button["browser:car_button1"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:car_grid"], guiGridListGetSelectedItem(button["browser:car_grid"]), 1))
			if not(id) then
				outputChatBox("Du musst ein Fahrzeug aus der Liste auswählen!", 255, 0, 0)
			return end
			triggerServerEvent("doLAHandyCarAction", gMe, id, "lock")
		end, false)
		
		addx = 630
		addy = -430
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 145/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_button2"] = guiCreateButton(x+addx, y-addy, width, height, "Orten", false)
		guiSetFont(button["browser:car_button2"], "default-bold-small")
		guiSetAlpha(button["browser:car_button2"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:car_button2"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:car_grid"], guiGridListGetSelectedItem(button["browser:car_grid"]), 1))
			if not(id) then
				outputChatBox("Du musst ein Fahrzeug aus der Liste auswählen!", 255, 0, 0)
			return end
			triggerServerEvent("doLAHandyCarAction", gMe, id, "orten")
		end, false)
		
		addx = 825
		addy = -430
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 145/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_button3"] = guiCreateButton(x+addx, y-addy, width, height, "Respawnen", false)
		guiSetFont(button["browser:car_button3"], "default-bold-small")
		guiSetAlpha(button["browser:car_button3"], 0)
		
		addEventHandler("onClientGUIClick", button["browser:car_button3"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:car_grid"], guiGridListGetSelectedItem(button["browser:car_grid"]), 1))
			if not(id) then
				outputChatBox("Du musst ein Fahrzeug aus der Liste auswählen!", 255, 0, 0)
			return end
			triggerServerEvent("doLAHandyCarAction", gMe, id, "towveh")
		end, false)
		
		addx = 825
		addy = -385
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 145/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_button4"] = guiCreateButton(x+addx, y-addy, width, height, "Verkaufen", false)
		guiSetFont(button["browser:car_button4"], "default-bold-small")
		guiSetAlpha(button["browser:car_button4"], 0)

		
		addx = 730
		addy = -350
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 145/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:car_checkbox1"] = guiCreateCheckBox(x+addx, y-addy, width, height, "Bestätigung", false, false)
		guiSetFont(button["browser:car_checkbox1"], "default-bold-small")
		
		
			
		addEventHandler("onClientGUIClick", button["browser:car_button4"], function()
			local id = tonumber(guiGridListGetItemText(button["browser:car_grid"], guiGridListGetSelectedItem(button["browser:car_grid"]), 1))
			if not(id) then
				outputChatBox("Du musst ein Fahrzeug aus der Liste auswählen!", 255, 0, 0)
			return end
			if(guiCheckBoxGetSelected(button["browser:car_checkbox1"]) == true) then
				triggerServerEvent("doLAHandyCarAction", gMe, id, "sellcar")
			else
				outputChatBox("Du musst dies bestätigen!", 255, 0, 0)
			end
		end, false)
		
	elseif(name == "bank") then
		addx = 725
		addy = -225
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 120/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_label"] = guiCreateLabel(x+addx, y-addy, width+10, height, "Dein Geld:\n"..bankgeld.."$", false)
		guiLabelSetColor(button["browser:bank_account_label"], 0, 255, 0)
		guiSetFont(button["browser:bank_account_label"], "default-bold-small")
		
		addx = 660
		addy = -280
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 120/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_label_value"] = guiCreateLabel(x+addx, y-addy, width, height, "Menge:", false)
		guiSetFont(button["browser:bank_account_label_value"], "default-bold-small")
		
		addx = 700
		addy = -275
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 215/1.5, 47/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_edit_value"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		guiSetFont(button["browser:bank_account_edit_value"], "default-bold-small")
		-- To --
		addx = 660
		addy = -325
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 120/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_label_to"] = guiCreateLabel(x+addx, y-addy, width, height, "Zu:", false)
		guiSetFont(button["browser:bank_account_label_to"], "default-bold-small")
		
		addx = 700
		addy = -320
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 215/1.5, 47/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_edit_to"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		guiSetFont(button["browser:bank_account_edit_to"], "default-bold-small")
		
		addx = 675
		addy = -360
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 285/1.5, 47/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_button"] = guiCreateButton(x+addx, y-addy, width, height, "Senden", false)
		guiSetFont(button["browser:bank_account_button"], "default-bold-small")
		
		addEventHandler("onClientGUIClick", button["browser:bank_account_button"], function()
			local to = guiGetText(button["browser:bank_account_edit_to"])
			local value = tonumber(guiGetText(button["browser:bank_account_edit_value"]))
			value = math.floor(value)
			--triggerServerEvent("onMTOnlineTransfer", gMe, to, value)
			triggerServerEvent ( "cashPointTransfer", gMe, value, to, true)
		end, false)
		
		addx = 675
		addy = -400
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 285/1.5, 47/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:bank_account_button_liefern"] = guiCreateButton(x+addx, y-addy, width, height, "Geld per Luftpost liefern", false)
		guiSetFont(button["browser:bank_account_button_liefern"], "default-bold-small")
		
		addEventHandler("onClientGUIClick", button["browser:bank_account_button_liefern"], function()
			local value = tonumber(guiGetText(button["browser:bank_account_edit_value"]))
			if not(value) or (value < 1) or (value > 500000) then outputChatBox("Ungültige Menge!", 255, 0, 0) return end
			value = math.floor(value)
			triggerServerEvent("onMTGeldLieferung", gMe, value)
		end, false)
	elseif(name == "newsmain") then
		local add = 0
		local newsid = 0
		local newsidn = {}
		local newsurl = {}
		local function addNews(text, url)
			addx = 620
			addy = -100-add
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = #text*10/1.5, 60/1.5
			width, height = width/1920*sx, height/1920*sx
			button["browser:news_"..newsid] = guiCreateLabel(x+addx, y-addy, width, height, text.."\n________________________________________", false)
			guiSetFont(button["browser:news_"..newsid], "default-bold-small")
			guiLabelSetColor(button["browser:news_"..newsid], 0, 0, 255)
			
			newsidn[button["browser:news_"..newsid]] = newsid
			newsurl[button["browser:news_"..newsid]] = url
			
			addEventHandler("onClientMouseEnter", button["browser:news_"..newsid], function()
				guiLabelSetColor(button["browser:news_"..newsidn[source]], 100, 100, 255)
			end)
			addEventHandler("onClientMouseLeave", button["browser:news_"..newsid], function()
				guiLabelSetColor(button["browser:news_"..newsidn[source]], 0, 0, 255)
			end)
			
			addEventHandler("onClientGUIClick", button["browser:news_"..newsid], function()
				local url = "www.news.com/"..newsurl[source]
				if(tonumber(empfang) > 1) then
					
				else
					url = "10060"
				end
				local curl = c_url
				hide_browsersite(page_images[curl])
				local image = page_images[url]
				show_browsersite(image)
				c_url = url
			end)
			
			
		end
		for i = 1, #news, 1 do
			local zeile = news[i]
			local uhrzeit = gettok(zeile, 1, "|")
			local titel = gettok(zeile, 2, "|")
			titel = uhrzeit.."|"..titel
			local url = gettok(zeile, 3, "|")
			addNews(titel, url)
			newsid = newsid+1
			add = add+40
		end
	elseif(name == "ammunation") then

		-- HANDGUNS --
		local this
		local add = 20
		local temp_name = "9mm"
		
		-- LABEL 'Name'
		
		addx = 640
		addy = -70
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 156/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_label_info1"] = guiCreateLabel(x+addx, y-addy, width, height, "Name",false)
		this = button["browser:ammu_label_info1"]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		guiLabelSetColor(this, 0, 255, 0)
		
		-- SECTION SEPERATOR LINE

		addx = 630
		addy = -72
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 400/1.5, 69/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_label_info2"] = guiCreateLabel(x+addx, y-addy, width, height, "___________________________________________________________________",false)
		this = button["browser:ammu_label_info2"]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		-- HEADLINE 'Munition'

		addx = 825
		addy = -70
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 156/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_label_info3"] = guiCreateLabel(x+addx, y-addy, width, height, "Munition",false)
		this = button["browser:ammu_label_info3"]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		guiLabelSetColor(this, 0, 255, 0)
		
		-- 9MM
		
		local temp_name = "9mm"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "9mm ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25

		-- DEAGLE
		
		local temp_name = "deagle"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Deagle ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25

		-- SHOTGUN
		
		local temp_name = "shotgun"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Shotgun ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25

		-- MP5
		
		local temp_name = "mp5"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "MP5 ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25
		
		-- AK-47

		local temp_name = "ak-47"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 285/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "AK-47 ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25

		-- M4
		
		-- local temp_name = "m4"
		
		-- addx = 630
		-- addy = -55-add-17.25
		-- addx = addx/1920*sx
		-- addy = addy/1920*sx
		-- width, height = 275/1.5, 34.5/1.5
		-- width, height = width/1920*sx, height/1920*sx
		-- button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "M4 ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		-- this = button["browser:ammu_checkbox_"..temp_name]
		-- guiSetFont(this, "default-bold-small")
		-- ammu_element[this] = this
		
		-- addx = 825
		-- addy = -67-add
		-- addx = addx/1920*sx
		-- addy = addy/1920*sx
		-- width, height = 100/1.5, 32/1.5
		-- width, height = width/1920*sx, height/1920*sx
		-- button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		-- this = button["browser:ammu_edit_"..temp_name]
		-- guiSetFont(this, "default-bold-small")
		-- ammu_element[this] = this
		-- add = add+25

		-- RIFLE
		
		local temp_name = "rifle"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Gewehr ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		add = add+25

		-- NACHTSICHT
		
		local temp_name = "nachtsicht"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Nachts. ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		guiSetEnabled(this, false)
		ammu_element[this] = this
		add = add+25

		-- WAERME
		
		local temp_name = "waerme"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Wärmes. ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		guiSetEnabled(this, false)
		ammu_element[this] = this
		add = add+25
		
		-- ARMOUR

		local temp_name = "armour"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Weste ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		guiSetEnabled(this, false)
		ammu_element[this] = this
		add = add+25

		-- KNIFE
		
		local temp_name = "knife"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Messer ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		guiSetEnabled(this, false)
		ammu_element[this] = this
		add = add+25

		-- BAT
		
		local temp_name = "bat"
		
		addx = 630
		addy = -55-add-17.25
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 275/1.5, 34.5/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_checkbox_"..temp_name] = guiCreateCheckBox(x+addx, y-addy, width, height, "Baseball ($"..ammu_select[temp_name]["gunprice"].."/$"..ammu_select[temp_name]["ammoprice"]..")", false, false)
		this = button["browser:ammu_checkbox_"..temp_name]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		addx = 825
		addy = -67-add
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 32/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_edit_"..temp_name] = guiCreateEdit(x+addx, y-addy, width, height, "0", false)
		this = button["browser:ammu_edit_"..temp_name]
		guiSetFont(this, "default-bold-small")
		guiSetEnabled(this, false)
		ammu_element[this] = this
		add = add+25

		-- AMU LABEL WAFFEN LIEFERN
		
		addx = 710
		addy = -430
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 300/1.5, 30/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:ammu_label_info3"] = guiCreateLabel(x+addx, y-addy, width, height, "Waffen liefern (0$)",false)
		this = button["browser:ammu_label_info3"]
		guiSetFont(this, "default-bold-small")
		ammu_element[this] = this
		
		guiLabelSetColor(this, 255, 255, 255)
		
		addEventHandler("onClientMouseEnter", this, function()
			guiLabelSetColor(source, 255, 0, 0)
		end)
		
		addEventHandler("onClientMouseLeave", this, function()
			guiLabelSetColor(source, 255, 255, 255)
		end)
		
		local function updateWeaponPrice()
			local accept = {}
			local accept2 = {}
			local price = 0
			accept["9mm"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_9mm"])
			accept["deagle"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_deagle"])
			accept["shotgun"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_shotgun"])
			accept["mp5"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_mp5"])
			accept["ak-47"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_ak-47"])
			--accept["m4"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_m4"])
			accept["rifle"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_rifle"])
			accept["nachtsicht"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_nachtsicht"])
			accept["waerme"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_waerme"])
			accept["armour"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_armour"])
			accept["knife"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_knife"])
			accept["bat"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_bat"])
			local weap = "9mm"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "deagle"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "shotgun"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "mp5"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "ak-47"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			--weap = "m4"
			--if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "rifle"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "nachtsicht"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "waerme"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "armour"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "knife"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			weap = "bat"
			if(accept[weap]) then price = price+ammu_select[weap]["gunprice"] end
			
			accept2["9mm"] = tonumber(guiGetText(button["browser:ammu_edit_9mm"]))
			accept2["deagle"] = tonumber(guiGetText(button["browser:ammu_edit_deagle"]))
			accept2["shotgun"] = tonumber(guiGetText(button["browser:ammu_edit_shotgun"]))
			accept2["mp5"] = tonumber(guiGetText(button["browser:ammu_edit_mp5"]))
			accept2["ak-47"] = tonumber(guiGetText(button["browser:ammu_edit_ak-47"]))
			--accept2["m4"] = tonumber(guiGetText(button["browser:ammu_edit_m4"]))
			accept2["rifle"] = tonumber(guiGetText(button["browser:ammu_edit_rifle"]))
			accept2["nachtsicht"] = tonumber(guiGetText(button["browser:ammu_edit_nachtsicht"]))
			accept2["waerme"] = tonumber(guiGetText(button["browser:ammu_edit_waerme"]))
			accept2["armour"] = tonumber(guiGetText(button["browser:ammu_edit_armour"]))
			accept2["knife"] = tonumber(guiGetText(button["browser:ammu_edit_knife"]))
			accept2["bat"] = tonumber(guiGetText(button["browser:ammu_edit_bat"]))
			for index, var in pairs(accept2) do
				if(var < 0) then var = 0 end
			end
			local weap = "9mm"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "deagle"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "shotgun"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "mp5"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "ak-47"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			--weap = "m4"
			--if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "rifle"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "nachtsicht"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "waerme"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "armour"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "knife"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			weap = "bat"
			if(accept2[weap]) and (accept[weap]) then price = price+ammu_select[weap]["ammoprice"]*accept2[weap] end
			-- Ammu --
			weapon_price = price
			guiSetText(button["browser:ammu_label_info3"], "Waffen liefern ("..price.."$)")
		end
		for index, ele in pairs(ammu_element) do
			addEventHandler("onClientGUIChanged", ele, updateWeaponPrice)
			addEventHandler("onClientGUIClick", ele, updateWeaponPrice)
		end
		addEventHandler("onClientGUIClick", this, function()
			local accept = {}
			local accept2 = {}
			accept["9mm"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_9mm"])
			accept["deagle"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_deagle"])
			accept["shotgun"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_shotgun"])
			accept["mp5"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_mp5"])
			accept["ak-47"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_ak-47"])
			--accept["m4"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_m4"])
			accept["rifle"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_rifle"])
			accept["nachtsicht"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_nachtsicht"])
			accept["waerme"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_waerme"])
			accept["armour"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_armour"])
			accept["knife"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_knife"])
			accept["bat"] = guiCheckBoxGetSelected(button["browser:ammu_checkbox_bat"])
			accept2["9mm"] = tonumber(guiGetText(button["browser:ammu_edit_9mm"]))
			accept2["deagle"] = tonumber(guiGetText(button["browser:ammu_edit_deagle"]))
			accept2["shotgun"] = tonumber(guiGetText(button["browser:ammu_edit_shotgun"]))
			accept2["mp5"] = tonumber(guiGetText(button["browser:ammu_edit_mp5"]))
			accept2["ak-47"] = tonumber(guiGetText(button["browser:ammu_edit_ak-47"]))
			-- accept2["m4"] = tonumber(guiGetText(button["browser:ammu_edit_m4"]))
			accept2["rifle"] = tonumber(guiGetText(button["browser:ammu_edit_rifle"]))
			
			if(accept["9mm"]) and (accept2["9mm"] < 1) or (accept["deagle"]) and (accept2["deagle"] < 1) or (accept["shotgun"]) and (accept2["shotgun"] < 1) or (accept["mp5"]) and (accept2["mp5"] < 1) or (accept["ak-47"]) and (accept2["ak-47"] < 1) or (accept["rifle"]) and (accept2["rifle"] < 0) then outputChatBox("Bad ammo input!", 255, 0, 0) return end
			triggerServerEvent("onMTAmmunationBuy", gMe, weapon_price, accept, accept2)
			triggerServerEvent("onMTAmmunationBuy", gMe, weapon_price, accept["9mm"], accept2["9mm"], accept["deagle"], accept2["deagle"], accept["shotgun"], accept2["shotgun"], accept["mp5"], accept2["mp5"], accept["ak-47"], accept2["ak-47"],accept["m4"], accept2["m4"], accept["rifle"], accept2["rifle"], accept["nachtsicht"], accept["waerme"], accept["armour"], accept["knife"], accept["bat"])
		end)
	elseif(name == "iqc") then
		iqc_text = ""
		triggerServerEvent("onMTHandyIQCJoin", gMe)
		addx = 725
		addy = -100
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 220/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:iqc_online"] = guiCreateLabel(x+addx, y-addy, width, height, "Leute im Chat: 0", false)
		this = button["browser:iqc_online"]
		guiLabelSetColor(this, 0, 255, 0)
		guiSetFont(this, "default-bold-small")
		
		addx = 620
		addy = -120
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 472/1.5, 430/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:iqc_memo"] = guiCreateMemo(x+addx, y-addy, width, height, iqc_text, false)
		this = button["browser:iqc_memo"]
		guiSetFont(this, "default-bold-small")
		guiMemoSetReadOnly(this, true)
		
		addx = 620
		addy = -421
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 325/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:iqc_edit"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		this = button["browser:iqc_edit"]
		guiSetFont(this, "default-bold-small")
		guiEditSetMaxLength(this, 128)
		
		addx = 860
		addy = -430
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 30/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:iqc_senden"] = guiCreateLabel(x+addx, y-addy, width, height, "Absenden", false)
		this = button["browser:iqc_senden"]
		guiSetFont(this, "default-bold-small")
		guiLabelSetColor(this, 0, 255, 0)
		addEventHandler("onClientGUIClick", this, function()
			local text = guiGetText(button["browser:iqc_edit"])
			triggerServerEvent("onMTHandyIQCSend", gMe, text)
			guiSetText(button["browser:iqc_edit"], "")
		end)
		addEventHandler("onClientMouseEnter", this, function()
			guiLabelSetColor(source, 100, 255, 100)
		end)
		addEventHandler("onClientMouseLeave", this, function()
			guiLabelSetColor(source, 0, 255, 0)
		end)
	elseif(name == "vehinfo") then
	
		addx = 615
		addy = 1
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 488/1.5, 650/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:vehinfos_memo"] = guiCreateMemo(x+addx, y-addy, width, height, "ID oder Name eines Fahrzeuges unten eintippen.", false)
		guiMemoSetReadOnly(button["browser:vehinfos_memo"], true)

		local function refrehVehInfoMemo(id)
			local mstring = "Fahrzeugdaten fuer Fahrzeug "..getVehicleNameFromModel(id)..":"
			local handling = getOriginalHandling(id)
			if(handling) then
				mstring = mstring.."\nAllgemeine Daten:"
				mstring = mstring.."\nMasse: "..handling["mass"].." kg"
				mstring = mstring.."\nAnzahl der Gaenge: "..handling["numberOfGears"]
				mstring = mstring.."\nHoechstgeschwindigkeit: "..handling["maxVelocity"].." km/h"
				mstring = mstring.."\nBeschleunigung: "..math.floor((handling["engineAcceleration"])).." m/s"
				mstring = mstring.."\nAntrieb: "..handling["driveType"]
				mstring = mstring.."\nMotortype: "..handling["engineType"]
				mstring = mstring.."\nBremskraft: "..handling["brakeDeceleration"].." m/s"
				local anzahl = 0
				for i, k in pairs(getElementsByType("vehicle")) do if(getElementModel(k) == id) then anzahl = anzahl+1 end end
				mstring = mstring.."\nZurzeit gespawnte Modelle auf dem Server: "..anzahl
				mstring = mstring.."\n\nTechnische Daten:"
				mstring = mstring.."\nABS: "..tostring(handling["ABS"])
				mstring = mstring.."\nLenkkraft: "..handling["steeringLock"]
				mstring = mstring.."\nUebersetzungsmultiplizierer: "..handling["tractionMultiplier"]
				mstring = mstring.."\nUebersetzungsverlust: "..handling["tractionLoss"]
				mstring = mstring.."\nUebersetzungsBias: "..handling["tractionBias"]
				mstring = mstring.."\nKoordinaten der Masse:\nX: "..handling["centerOfMass"][1]..", Y: "..handling["centerOfMass"][2]..", Z: "..handling["centerOfMass"][3]
				mstring = mstring.."\nDrehmasse: "..handling["turnMass"]
				mstring = mstring.."\n\nDiese Daten entsprechen der Wirklichkeit.\nAlle Angaben der Einheit ohne Gewähr!"
				guiSetText(button["browser:vehinfos_memo"], mstring)
			end
		end		
		if(isPedInVehicle(gMe) == true) and (getPedOccupiedVehicle(gMe)) then
			local veh = getElementModel(getPedOccupiedVehicle(gMe))
			refrehVehInfoMemo(veh)
		end
		addx = 615
		addy = -435
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 488/1.5, 40/1.5
		width, height = width/1920*sx, height/1920*sx
		local id = "Suche..."
		if(isPedInVehicle(gMe) == true) and (getPedOccupiedVehicle(gMe)) then
			id = getElementModel(getPedOccupiedVehicle(gMe))
		end
		button["browser:vehinfos_edit"] = guiCreateEdit(x+addx, y-addy, width, height, id, false)
		addEventHandler("onClientGUIChanged", button["browser:vehinfos_edit"], function()
			local text = guiGetText(source)
			if(tonumber(text) == nil) then
				if(getVehicleModelFromName(text)) then
					refrehVehInfoMemo(getVehicleModelFromName(text))
				else
					guiSetText(button["browser:vehinfos_memo"], "Fahrzeug konnte nicht gefunden werden.")
				end
			else
				text = tonumber(text)
				if(text > 410) and (text < 611) then
					refrehVehInfoMemo(text)
				else
					guiSetText(button["browser:vehinfos_memo"], "ID des Fahrzeuges ist nicht richtig. Richtige ID's sind von 411 bis 611.")
				end
			end
		end)
	elseif(name == "updates") then
		triggerServerEvent("onMTHandyUpdatesNeed", gMe)
		addx = 623
		addy = -80
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 461/1.5, 492/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:updates_memo"] = guiCreateMemo(x+addx, y-addy, width, height, update_text, false)
		this = button["browser:updates_memo"]
		guiSetFont(this, "default-bold-small")
		guiMemoSetReadOnly(this, true)
		
		addx = 623
		addy = -420
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 231/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:updates_button1"] = guiCreateButton(x+addx, y-addy, width, height, "Bearbeiten", false)
		this = button["browser:updates_button1"]
		guiSetFont(this, "default-bold-small")
		local name = getPlayerName(gMe)
		if not(allowedPersons[name]) then
			guiSetVisible(this, false)
		end
		addEventHandler("onClientGUIClick", this, function()
			if(guiGetText(source) == "Bearbeiten") then
				guiSetText(source, "Fertig!")
				guiMemoSetReadOnly(button["browser:updates_memo"], false)
			else
				guiSetText(source, "Bearbeiten")
				guiMemoSetReadOnly(button["browser:updates_memo"], true)
				local text = guiGetText(button["browser:updates_memo"])
				triggerServerEvent("onMTHandyUpdatesEdit", gMe, text)
			end
		end, false)
	elseif(name == "nutten") then
		addx = 650
		addy = -90
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 410/1.5, 400/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:nutten_label"] = guiCreateLabel(x+addx, y-addy, width, height, "Willkommen Süsser! Du hast Lust\nauf was anderes oder bist alleine?\nKein Problem, wir liefern dir eine\nperfekte Nutte per Luftpost zu\ndeiner Position! Der Partyknaller\nfür Events schlechthin. Wir haben\nfür jeden das Richtige! Mit einem\nKlick auf 'Bestellen' geht die Party ab!\n\nFür einmalige 200$ bieten wir dir\nalles, was dein Herz begehrt.\nSolltest du mit uns nicht zufrieden\nsein, kannst du uns jederzeit\numbringen.", false)
		this = button["browser:nutten_label"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 650
		addy = -360
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 406/1.5, 121/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:nutten_button"] = guiCreateButton(x+addx, y-addy, width, height, "Nutte bestellen:\n$200", false)
		this = button["browser:nutten_button"]
		
		addEventHandler("onClientGUIClick", this, function()
			triggerServerEvent("onMTHandyAction", gMe, "nuttebestellung")
		end, false)
	elseif(name == "casino") then
		guiSetInputMode("no_binds_when_editing")
		addx = 650
		addy = -90
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 400/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label1"] = guiCreateLabel(x+addx, y-addy, width, height, "Willkommen auf www.casino.com!\nHier sind dem Glück\nkeine Grenzen gesetzt!", false)
		this = button["browser:casino_label1"]
		guiLabelSetColor(this, 0, 0, 0)
		guiSetFont(this, "default-bold-small")
		
		addx = 650
		addy = -150
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label2"] = guiCreateLabel(x+addx, y-addy, width, height, "1 aus 10:", false)
		this = button["browser:casino_label2"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 620
		addy = -190
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 50/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label3"] = guiCreateLabel(x+addx, y-addy, width, height, "Zahl:", false)
		this = button["browser:casino_label3"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 655
		addy = -185
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 58/1.5, 36/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_edit1"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		this = button["browser:casino_edit1"]
		guiEditSetMaxLength(this, 2)
		guiSetFont(this, "default-bold-small")
		
		addx = 700
		addy = -190
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 95/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label4"] = guiCreateLabel(x+addx, y-addy, width, height, ", Einsatz: $", false)
		this = button["browser:casino_label4"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 775
		addy = -185
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 80/1.5, 36/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_edit2"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		this = button["browser:casino_edit2"]
		guiEditSetMaxLength(this, 4)
		guiSetFont(this, "default-bold-small")
		
		addx = 835
		addy = -185
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 150/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_button1"] = guiCreateButton(x+addx, y-addy, width, height, "Auf gut Glück!", false)
		this = button["browser:casino_button1"]
		guiSetFont(this, "default-bold-smal3")
		
		addEventHandler("onClientGUIClick", this, function()
			local nummer = tonumber(guiGetText(button["browser:casino_edit1"]))
			if not(nummer) or (nummer < 1) or (nummer > 10) then outputChatBox("Ungültige Nummer!", 255, 0, 0) return end
			local einsatz = tonumber(guiGetText(button["browser:casino_edit2"]))
			if not(einsatz) or (einsatz < 0) then outputChatBox("Ungültiger Einsatz!", 255, 0, 0) return end
			triggerServerEvent("onMTHandyCasinoAction", gMe, nummer, einsatz, 1)
		end, false)
		
		addx = 630
		addy = -220
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 450/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label5"] = guiCreateLabel(x+addx, y-addy, width, height, "Wähle eine Zahl von 1-10 aus.\nWird deine Zahl gezogen, erhältst du\ndas Doppelte deines Einsatzes.", false)
		this = button["browser:casino_label5"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		-- 1 aus 50 --
		
		addx = 650
		addy = -350+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 100/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label6"] = guiCreateLabel(x+addx, y-addy, width, height, "1 aus 50:", false)
		this = button["browser:casino_label6"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 620
		addy = -390+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 50/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label7"] = guiCreateLabel(x+addx, y-addy, width, height, "Zahl:", false)
		this = button["browser:casino_label7"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 655
		addy = -385+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 58/1.5, 38/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_edit3"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		this = button["browser:casino_edit3"]
		guiEditSetMaxLength(this, 2)
		guiSetFont(this, "default-bold-small")
		
		addx = 700
		addy = -390+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 95/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label8"] = guiCreateLabel(x+addx, y-addy, width, height, ", Einsatz: $", false)
		this = button["browser:casino_label8"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
		
		addx = 775
		addy = -385+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 80/1.5, 38/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_edit4"] = guiCreateEdit(x+addx, y-addy, width, height, "", false)
		this = button["browser:casino_edit4"]
		guiEditSetMaxLength(this, 5)
		guiSetFont(this, "default-bold-small")
		
		addx = 835
		addy = -385+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 150/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_button2"] = guiCreateButton(x+addx, y-addy, width, height, "Auf gut Glück!", false)
		this = button["browser:casino_button2"]
		guiSetFont(this, "default-bold-smal3")
		
		addEventHandler("onClientGUIClick", this, function()
			local nummer = tonumber(guiGetText(button["browser:casino_edit3"]))
			if not(nummer) or (nummer < 1) or (nummer > 50) then outputChatBox("Ungültige Nummer!", 255, 0, 0) return end
			local einsatz = tonumber(guiGetText(button["browser:casino_edit4"]))
			if not(einsatz) or (einsatz < 0) then outputChatBox("Ungueltiger Einsatz!", 255, 0, 0) return end
			triggerServerEvent("onMTHandyCasinoAction", gMe, nummer, einsatz, 2)
		end, false)
		
		addx = 630
		addy = -420+50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 450/1.5, 100/1.5
		width, height = width/1920*sx, height/1920*sx
		button["browser:casino_label9"] = guiCreateLabel(x+addx, y-addy, width, height, "Wähle eine Zahl von 1-50 aus.\nWird deine Zahl gezogen, erhältst du\ndas Dreifache deines Einsatzes.", false)
		this = button["browser:casino_label9"]
		guiLabelSetColor(this, 255, 255, 255)
		guiSetFont(this, "default-bold-small")
	end
end

addEventHandler("onClientMTHandyIQCMessageSend", getLocalPlayer(), function(message, value)
	iqc_text = iqc_text.."\n"..message
	if(isElement(button["browser:iqc_memo"])) then
		guiSetText(button["browser:iqc_memo"], iqc_text)
		guiMemoSetCaretIndex(button["browser:iqc_memo"], #iqc_text)
		if(value) then
			guiSetText(button["browser:iqc_online"], "Leute im Chat: "..value)
		end
	end
end)

function hide_browsersite(name)
	if not(page_images[c_url]) then name = "404" end
	if(site[name] ~= name) then return end
	site[name] = false
	if(name == "startpage") then
		destroyElement(button["browser:startpage_edit"])
		destroyElement(button["browser:startpage_button"])
		destroyElement(button["browser:startpage_btn_auswahl"])
		destroyElement(button["browser:startpage_btn_auswahl2"])
	elseif(name == "vehinfo") then
		destroyElement(button["browser:vehinfos_memo"])
		destroyElement(button["browser:vehinfos_edit"])
	elseif(name == "backgrounds") then
		destroyElement(button["browser:backgrounds_grid"])
		destroyElement(button["browser:backgrounds_button"])
	elseif(name == "fahrzeuge") then
		destroyElement(button["browser:car_grid"])
		destroyElement(button["browser:car_button1"])
		destroyElement(button["browser:car_button2"])
		destroyElement(button["browser:car_button3"])
		destroyElement(button["browser:car_button4"])
		destroyElement(button["browser:car_checkbox1"])
	elseif(name == "updates") then
		destroyElement(button["browser:updates_memo"])
		destroyElement(button["browser:updates_button1"])
	elseif(name == "nutten") then
		destroyElement(button["browser:nutten_label"])
		destroyElement(button["browser:nutten_button"])
	elseif(name == "casino") then
		destroyElement(button["browser:casino_label1"])
		destroyElement(button["browser:casino_label2"])
		destroyElement(button["browser:casino_label3"])
		destroyElement(button["browser:casino_label4"])
		destroyElement(button["browser:casino_label5"])
		destroyElement(button["browser:casino_label6"])
		destroyElement(button["browser:casino_label7"])
		destroyElement(button["browser:casino_label8"])
		destroyElement(button["browser:casino_label9"])
		
		destroyElement(button["browser:casino_edit1"])
		destroyElement(button["browser:casino_edit2"])
		destroyElement(button["browser:casino_edit3"])
		destroyElement(button["browser:casino_edit4"])
		
		destroyElement(button["browser:casino_button1"])
		destroyElement(button["browser:casino_button2"])
	elseif(name == "iqc") then
		destroyElement(button["browser:iqc_online"])
		destroyElement(button["browser:iqc_memo"])
		destroyElement(button["browser:iqc_edit"])
		destroyElement(button["browser:iqc_senden"])
		triggerServerEvent("onMTHandyIQCQuit", gMe)
		
	elseif(name == "hospital") then
		destroyElement(button["browser:hospital_buy"])
	elseif(name == "pizza") then
		destroyElement(button["browser:pizza_buy"])
	elseif(name == "house") then
		destroyElement(button["browser:house_grid"])
		destroyElement(button["browser:house_mark"])
	elseif(name == "auswahlpage") then
		destroyElement(button["browser:auswahl_clucking"])
		destroyElement(button["browser:auswahl_google"])
		destroyElement(button["browser:auswahl_pns"])
		destroyElement(button["browser:auswahl_bank"])
		destroyElement(button["browser:auswahl_hospital"])
	elseif(name == "auswahlpage2") then
		destroyElement(button["browser:auswahl_ammu"])
		destroyElement(button["browser:auswahl_casino"])
		destroyElement(button["browser:auswahl_google"])
		destroyElement(button["browser:auswahl_background"])
		destroyElement(button["browser:auswahl_pizza"])
	elseif(name == "newsmain") then
		for i = 0, 20, 1 do
			if(isElement(button["browser:news_"..i])) then
				destroyElement(button["browser:news_"..i])
			end
		end
	elseif(name == "bank") then
		destroyElement(button["browser:bank_account_button"])
		destroyElement(button["browser:bank_account_button_liefern"])
		destroyElement(button["browser:bank_account_label_to"])
		destroyElement(button["browser:bank_account_edit_to"])
		destroyElement(button["browser:bank_account_edit_value"])
		destroyElement(button["browser:bank_account_label_value"])
		destroyElement(button["browser:bank_account_label"])
	elseif(name == "404") then
		destroyElement(button["browser:404_infolabel"])
	elseif(name == "ammunation") then
		for index, ele in pairs(ammu_element) do
			destroyElement(ele)
		end
		ammu_element = nil
		ammu_element = {}
	end
end

--[[
addCommandHandler("outofthandy", function()
	for index, but in pairs(button) do
		destroyElement(but)
	end
	for index, ele in pairs(ammu_element) do
		destroyElement(ele)
	end
	outputChatBox("Handy Items wurden geelernt. Falls ein Fehler auftrat, bitte Reconnecten", 0, 255, 0)
end)
-]]
function show_browser()
	if(browser == true) then return end
	browser = true
	-- browser buttons --
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	addx = 891
	addy = 50
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["browser:button_ioogle"] = guiCreateButton(x+addx, y-addy, width, height, "ioogle", false)
	guiSetAlpha(button["browser:button_ioogle"], 0)
	
	addEventHandler("onClientGUIClick", button["browser:button_ioogle"], function()
			local url = "www.loogle.com"
			local curl = c_url
			last_url = c_url
			hide_browsersite(page_images[curl])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
	
	addx = 625
	addy = 50
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["browser:button_refresh"] = guiCreateButton(x+addx, y-addy, width, height, "refresh", false)
	guiSetAlpha(button["browser:button_refresh"], 0)
	
	addEventHandler("onClientGUIClick", button["browser:button_refresh"], function()
			local url = c_url
			hide_browsersite(page_images[url])
			local image = page_images[url]
			if not(image) then image = "404" end
			show_browsersite(image)
			c_url = url
		end, false)
end

function hide_browser()
	if(browser == false) then return end
	browser = false
	for index, page in pairs(site) do
		hide_browsersite(page)
	end
	destroyElement(button["browser:button_ioogle"])
	destroyElement(button["browser:button_refresh"])
end

function show_dialer()
	if(dialer == true) then return end
	dialer = true
	hide_browser()
	hide_browsersite("hospital")
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	
	local addx, addy, width, height, scale
	
	
	-- Special numbers --
	
	addx = 640
	addy = -410
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["CALL"] = guiCreateButton(x+addx, y-addy, width, height, "ANRUFEN", false)
	
	addx = 840
	addy = -410
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["DELETE"] = guiCreateButton(x+addx, y-addy, width, height, "LÖSCHEN", false)
	
	-- Define the numbers --
	addx = 740
	addy = -350
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM0"] = guiCreateButton(x+addx, y-addy, width, height, "NUM0", false)

	addx = 740
	addy = -290
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM8"] = guiCreateButton(x+addx, y-addy, width, height, "NUM8", false)
	
	addx = 840
	addy = -290
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM9"] = guiCreateButton(x+addx, y-addy, width, height, "NUM9", false)
	
	addx = 640
	addy = -290
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM7"] = guiCreateButton(x+addx, y-addy, width, height, "NUM7", false)
	
	addx = 740
	addy = -230
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM5"] = guiCreateButton(x+addx, y-addy, width, height, "NUM5", false)
	
	addx = 840
	addy = -230
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM6"] = guiCreateButton(x+addx, y-addy, width, height, "NUM6", false)
	
	addx = 640
	addy = -230
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM4"] = guiCreateButton(x+addx, y-addy, width, height, "NUM4", false)
	
	addx = 740
	addy = -170
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM2"] = guiCreateButton(x+addx, y-addy, width, height, "NUM2", false)
	
	addx = 640
	addy = -170
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM1"] = guiCreateButton(x+addx, y-addy, width, height, "NUM1", false)
	
	addx = 840
	addy = -170
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 100/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["NUM3"] = guiCreateButton(x+addx, y-addy, width, height, "NUM3", false)
	
	guiSetAlpha(button["NUM0"], 0)
	guiSetAlpha(button["NUM1"], 0)
	guiSetAlpha(button["NUM2"], 0)
	guiSetAlpha(button["NUM3"], 0)
	guiSetAlpha(button["NUM4"], 0)
	guiSetAlpha(button["NUM5"], 0)
	guiSetAlpha(button["NUM6"], 0)
	guiSetAlpha(button["NUM7"], 0)
	guiSetAlpha(button["NUM8"], 0)
	guiSetAlpha(button["NUM9"], 0)
	guiSetAlpha(button["DELETE"], 0)
	guiSetAlpha(button["CALL"], 0)
	
	addEventHandler("onClientGUIClick", button["NUM0"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."0"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM1"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."1"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM2"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."2"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM3"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."3"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM4"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."4"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM5"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."5"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM6"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."6"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM7"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."7"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM8"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."8"
	end, false)
	
	addEventHandler("onClientGUIClick", button["NUM9"], function()
		local l = #auswahl
		if(l > 38) then return end
		auswahl = auswahl.."9"
	end, false)
	
	addEventHandler("onClientGUIClick", button["DELETE"], function()
		local length = #auswahl
		auswahl = string.sub(auswahl, 1, length-1)
	end, false)
end

function hide_dialer()
	if(dialer == false) then return end
	dialer = false
	destroyElement(button["NUM0"])
	destroyElement(button["NUM9"])
	destroyElement(button["NUM8"])
	destroyElement(button["NUM7"])
	destroyElement(button["NUM6"])
	destroyElement(button["NUM5"])
	destroyElement(button["NUM4"])
	destroyElement(button["NUM3"])
	destroyElement(button["NUM2"])
	destroyElement(button["NUM1"])
	destroyElement(button["CALL"])
	destroyElement(button["DELETE"])
end
addCommandHandler("handyinfo", function() outputChatBox("Galaxy SII made by Noneatme! You are not allowed to copy this.", 0, 200, 200) end)

local function refreshRadio(table)
	if(radio == true) and (isElement(button["radio:button_grid"])) then
		guiGridListClear(button["radio:button_grid"])
		for index, spalte in pairs(table) do
			local string = spalte['RADIO']
			local name, url = gettok(string, 1, "|"), gettok(string, 2, "|")
			local row = guiGridListAddRow(button["radio:button_grid"])
			guiGridListSetItemText(button["radio:button_grid"], row, 1, name, false, false)
			guiGridListSetItemText(button["radio:button_grid"], row, 2, url, false, false)
		end
	end
end
addEventHandler("onMTHandyRadiosGetBack", getLocalPlayer(), refreshRadio)

function show_radio(id)
	if(radio == true) then return end
	if not(id) then id = 0 end
	radioauswahl = id
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	
	local addx, addy, width, height, scale
	if(id == 0) then
		radiosite = 1
		addx = 618
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_radio"] = guiCreateButton(x+addx, y-addy, width, height, "Radio", false)
		this = button["radio:button_radio"]
		guiSetAlpha(this, 0)
		
		addx = 730
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_settings"] = guiCreateButton(x+addx, y-addy, width, height, "Settings", false)
		this = button["radio:button_settings"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(1)
			radio = true
		end, false)
		
		addx = 845
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 130/1.5, 60/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_more"] = guiCreateButton(x+addx, y-addy, width, height, "More", false)
		this = button["radio:button_more"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(2)
			radio = true
		end, false)
		
		
		addx = 620
		addy = 10
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 470/1.5, 430/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_grid"] = guiCreateGridList(x+addx, y-addy, width, height, false)
		this = button["radio:button_grid"]
		
		guiGridListAddColumn(this, "Name", 0.3)
		guiGridListAddColumn(this, "URL", 0.65)
		guiGridListSetSortingEnabled(this, false)
		guiGridListSetSelectionMode(this, 0)
		guiSetFont(this, "default-bold-small")
		
		addEventHandler("onClientGUIClick", this, function(b)
			if(b == "right") then
				local url = guiGridListGetItemText(button["radio:button_grid"], guiGridListGetSelectedItem(button["radio:button_grid"]), 2)
				if(url ~= "") then
					setClipboard(url)
					showInfobar("Information: Ausgewählte Stream-URL in Zwischenablage kopiert.", 5000, 0, 100, 0, true)
				end
			end
		end, false)
		
		addx = 620
		addy = -280
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 400/1.5, 30/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:label_1"] = guiCreateLabel(x+addx, y-addy, width, height, "Neuen Sender Einfügen: (Name, URL)", false)
		this = button["radio:label_1"]
		guiSetFont(this, "default-bold-small")
		
		addx = 620
		addy = -300
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 133/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:edit_1"] = guiCreateEdit(x+addx, y-addy, width, height, "", false) -- Name
		this = button["radio:edit_1"]
		guiSetFont(this, "default-bold-small")
		guiEditSetMaxLength(this, 50)
		
		addx = 720
		addy = -300
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 266/1.5, 35/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:edit_2"] = guiCreateEdit(x+addx, y-addy, width, height, "", false) -- url
		this = button["radio:edit_2"]
		guiSetFont(this, "default-bold-small")
		guiEditSetMaxLength(this, 205)
		
		addx = 620
		addy = -330
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 133/1.5, 40/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_einfuegen"] = guiCreateButton(x+addx, y-addy, width, height, "Einfügen", false) 
		this = button["radio:button_einfuegen"]
		guiSetFont(this, "default-bold-small")
		
		addEventHandler("onClientGUIClick", this, function()
			local name, url = guiGetText(button["radio:edit_1"]), guiGetText(button["radio:edit_2"])
			if(name == "") or (name == " ") or (url == "") or (url == " ") or (gettok(name, 2, "|") ~= false) or (gettok(url, 2, "|") ~= false) then outputChatBox("Bitte gebe einen richtigen Namen und eine richtige URL ein!", 150, 0, 0) return end
			triggerServerEvent("onMTHandyRadioInsert", gMe, name, url)
		end, false)
		
		addx = 730
		addy = -330
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 133/1.5, 40/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_loeschen"] = guiCreateButton(x+addx, y-addy, width, height, "Loeschen", false) 
		this = button["radio:button_loeschen"]
		guiSetFont(this, "default-bold-small")
		
		addEventHandler("onClientGUIClick", this, function()
			local name, url = guiGridListGetItemText(button["radio:button_grid"], guiGridListGetSelectedItem(button["radio:button_grid"]), 1), guiGridListGetItemText(button["radio:button_grid"], guiGridListGetSelectedItem(button["radio:button_grid"]), 2)
			if(name == "") or (name == " ") or (url == "") or (url == " ") then outputChatBox("Bitte wähle ein Radiosender aus!", 150, 0, 0) return end
			triggerServerEvent("onMTHandyRadioDelete", gMe, name, url)
		end, false)

		addx = 640
		addy = -375
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 92/1.5, 89/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_play"] = guiCreateButton(x+addx, y-addy, width, height, "play", false) 
		this = button["radio:button_play"]
		guiSetFont(this, "default-bold-small")
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			local name, url = guiGridListGetItemText(button["radio:button_grid"], guiGridListGetSelectedItem(button["radio:button_grid"]), 1), guiGridListGetItemText(button["radio:button_grid"], guiGridListGetSelectedItem(button["radio:button_grid"]), 2)
			if(name == "") or (name == " ") or (url == "") or (url == " ") then outputChatBox("Bitte wähle ein Radiosender aus!", 250, 0, 0) return end
			if(radioData["playing"] == true) then 
				outputChatBox("Das Radio läuft bereits! Stoppe es erst, bevor du ein anderen Sender hören möchtest.", 150, 0, 0) 
				return
			end
			radioData["playing"] = true
			radioData["sound"] = playSound(url, false)
			radioData["url"] = url
			radioData["name"] = name
			radioData["starttick"] = getTickCount()
			radioData["titel"] = ""
			setSoundVolume(radioData["sound"], radioData["volume"])
			outputChatBox("Das Radio versucht, den Stream abzuspielen.", 200, 200, 0)
			-- STREAM CHECK --
			addEventHandler("onClientSoundStream", radioData["sound"], function(suc,length,streamN)
				if not (suc) then outputChatBox("Der Stream "..radioData["name"].." konnte nicht gefunden werden.", 150, 0, 0) return end
				showInfobar("Der Stream '"..radioData["name"].."' wird abgespielt.", 3000, 0, 50, 50, true)
				outputChatBox("Stream wird abgespielt! Übertragungslatenzzeit(Ping): "..getTickCount()-radioData["starttick"].." MS ("..math.round(((getTickCount()-radioData["starttick"])/1000), 2, "round").." Sekunden)", 0, 100, 200)
			end)
			addEventHandler("onClientSoundChangedMeta", radioData["sound"], function(streamTitle)
				if(radioData["titel"] == streamTitle) then return end
				radioData["titel"] = streamTitle
				outputChatBox("#FFFFFF[#00FF00RADIO#FFFFFF] #00FFFFStream Info: Titel: "..streamTitle, 0, 100, 200, true)
				showInfobar("Radio Stream Titel: "..streamTitle, 3000, 0, 0, 50, true)
			end)
		end, false)
		
		addx = 848
		addy = -375
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 92/1.5, 89/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_stop"] = guiCreateButton(x+addx, y-addy, width, height, "stop", false) 
		this = button["radio:button_stop"]
		guiSetFont(this, "default-bold-small")
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			if(radioData["playing"] == false) then 
				outputChatBox("Das Radio läuft nicht.", 150, 0, 0) 
				return
			end
			radioData["playing"] = false
			destroyElement(radioData["sound"])
			radioData["url"] = false
			radioData["name"] = false
			outputChatBox("Das Radio wurde gestoppt.", 0, 100, 200)
			
		end, false)
		
		triggerServerEvent("onMTHandyRadiosGet", gMe)
	elseif(id == 1) then
		radiosite = 2
		addx = 618
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_radio"] = guiCreateButton(x+addx, y-addy, width, height, "Radio", false)
		this = button["radio:button_radio"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(0)
			radio = true
		end, false)
		
		addx = 730
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_settings"] = guiCreateButton(x+addx, y-addy, width, height, "Settings", false)
		this = button["radio:button_settings"]
		guiSetAlpha(this, 0)
	
		addx = 845
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 130/1.5, 60/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_more"] = guiCreateButton(x+addx, y-addy, width, height, "More", false)
		this = button["radio:button_more"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(2)
			radio = true
		end, false)
		
		addx = 620
		addy = 0
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 458/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		button["radio:scrollbar_1"] = guiCreateScrollBar(x+addx, y-addy, width, height, true, false)
		this = button["radio:scrollbar_1"]
		guiScrollBarSetScrollPosition(this, radioData["volume"]*100)
		
		addEventHandler("onClientGUIScroll", this, function()
			radioData["volume"] = math.round(guiScrollBarGetScrollPosition(source)/100, 2, "round")
			if(isElement(button["radio:label_2"])) then
				guiSetText(button["radio:label_2"], "Lautstärke: "..radioData["volume"])
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
					setSoundVolume(radioData["sound"], radioData["volume"])
				end
			end
		end)
		
		addx = 620
		addy = -40
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 458/1.5, 49/1.5
		width, height = width/1920*sx, height/1920*sx
		button["radio:label_2"] = guiCreateLabel(x+addx, y-addy, width, height, "Laustärke: "..radioData["volume"], false)
		this = button["radio:label_2"]
		guiSetFont(this, "default-bold-small")
		guiLabelSetColor(this, 0, 255, 0)
		guiLabelSetHorizontalAlign(this, "center")
		
		
		addx = 640
		addy = -375
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 92/1.5, 89/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_play"] = guiCreateButton(x+addx, y-addy, width, height, "play", false) 
		this = button["radio:button_play"]
		guiSetFont(this, "default-bold-small")
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			outputChatBox("Du musst ein Radiosender auswählen!", 150, 0, 0)
		end, false)
		
		addx = 848
		addy = -375
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 92/1.5, 89/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_stop"] = guiCreateButton(x+addx, y-addy, width, height, "stop", false) 
		this = button["radio:button_stop"]
		guiSetFont(this, "default-bold-small")
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			if(radioData["playing"] == false) then 
				outputChatBox("Das Radio läuft nicht.", 150, 0, 0) 
				return
			end
			radioData["playing"] = false
			destroyElement(radioData["sound"])
			radioData["url"] = false
			radioData["name"] = false
			outputChatBox("Das Radio wurde gestoppt.", 0, 100, 200)
			
		end, false)
	elseif(id == 2) then
		radiosite = 3
		addx = 618
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_radio"] = guiCreateButton(x+addx, y-addy, width, height, "Radio", false)
		this = button["radio:button_radio"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(0)
			radio = true
		end, false)
		
		addx = 730
		addy = 50
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 164/1.5, 50/1.5
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_settings"] = guiCreateButton(x+addx, y-addy, width, height, "Settings", false)
		this = button["radio:button_settings"]
		guiSetAlpha(this, 0)
		
		addEventHandler("onClientGUIClick", this, function()
			hide_radio(radioauswahl)
			radio = false
			show_radio(1)
			radio = true
		end, false)
		
		addx = 845
		addy = 55
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 130, 60
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:button_more"] = guiCreateButton(x+addx, y-addy, width, height, "More", false)
		this = button["radio:button_more"]
		guiSetAlpha(this, 0)
		
		-- THE THINGS --
		
		addx = 1602
		addy = 543
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 254, 27
		width, height = width/1920*sx, height/1920*sx
		
		button["radio:more_label1"] = guiCreateLabel(addx, addy, width, height, "Soundposition: 0:0/0:0",false)
		guiLabelSetHorizontalAlign(button["radio:more_label1"],"center",false)
		guiSetFont(button["radio:more_label1"], "default-bold-small")
		
		local t1, t2, t3, t4 -- Ich mach das so weil ich zu faul bin

		addx = 1587
		addy = 908
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 121, 35
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_button1"] = guiCreateButton(addx, addy, width, height,"Aktivieren",false)
		guiSetFont(button["radio:more_button1"], "default-bold-small")
		
		addx = 1765
		addy = 907
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 121, 35
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_button2"] = guiCreateButton(addx, addy, width, height,"Deaktivieren",false)
		guiSetFont(button["radio:more_button2"], "default-bold-small")
		
		addx = 1591
		addy = 581
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 299, 23
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_scrollbar1"] = guiCreateScrollBar(addx, addy, width, height, true, false)
		addEventHandler("onClientGUIScroll", button["radio:more_scrollbar1"] , function()
			if(can_scroll == true) then
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
					local l = getSoundLength(radioData["sound"])
					if(l ~= 0) then
						setSoundPosition(radioData["sound"], l/100*guiScrollBarGetScrollPosition(source))
					end
				end
			end
		end)
		if(isElement(radioData["sound"])) then
			can_scroll = false
			guiScrollBarSetScrollPosition(button["radio:more_scrollbar1"], getSoundPosition(radioData["sound"])*100/getSoundLength(radioData["sound"]))
			setTimer(function()
				can_scroll = true
			end, 50, 1)
		end
		if(isTimer(can_scrolltimer)) then killTimer(can_scrolltimer) end
		can_scrolltimer = setTimer(function()
			if(isElement(radioData["sound"])) and (isElement(button["radio:more_scrollbar1"])) then
				can_scroll = false
				guiScrollBarSetScrollPosition(button["radio:more_scrollbar1"], getSoundPosition(radioData["sound"])*100/getSoundLength(radioData["sound"]))
				setTimer(function()
					can_scroll = true
				end, 50, 1)
			else
				killTimer(can_scrolltimer)
			end
		end, 1000, -1)
		t1, t2, t3, t4 = 1590,616,97,16
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_label2"] = guiCreateLabel(addx, addy, width, height, "Einstellungen:", false)
		guiSetFont(button["radio:more_label2"], "default-bold-small")
		
		t1, t2, t3, t4 = 1591,645,72,18
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_label3"] = guiCreateLabel(addx, addy, width, height, "Sample rate:", false)
		guiSetFont(button["radio:more_label3"], "default-bold-small")
		
		t1, t2, t3, t4 = 1590,676,72,18
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_label4"] = guiCreateLabel(addx, addy, width, height, "Tempo:", false)
		guiSetFont(button["radio:more_label4"], "default-bold-small")
		
		t1, t2, t3, t4 = 1591,702,72,18
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_label5"] = guiCreateLabel(addx, addy, width, height, "Pitch:", false)
		guiSetFont(button["radio:more_label5"], "default-bold-small")
		
		t1, t2, t3, t4 = 1768,641,69,25
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_edit1"] = guiCreateEdit(addx, addy, width, height, "", false) -- rate
		guiSetFont(button["radio:more_edit1"], "default-bold-small")
		
		t1, t2, t3, t4 = 1768,670,69,25
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_edit2"] = guiCreateEdit(addx, addy, width, height, "", false) -- tempo
		guiSetFont(button["radio:more_edit2"], "default-bold-small")
		
		t1, t2, t3, t4 = 1768,698,69,25
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_edit3"] = guiCreateEdit(addx, addy, width, height, "", false) -- pitch
		guiSetFont(button["radio:more_edit3"], "default-bold-small")
		
		if(isRadioPlaying()) then
			local sample, tempo, pitch = getSoundProperties( radioData["sound"] )
			guiSetText(button["radio:more_edit1"], sample)
			guiSetText(button["radio:more_edit2"], tempo)
			guiSetText(button["radio:more_edit1"], pitch)
		end
		t1, t2, t3, t4 = 1587,749,301,144
		addx = t1
		addy = t2
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = t3, t4
		width, height = width/1920*sx, height/1920*sx
		button["radio:more_grid1"] = guiCreateGridList(addx, addy, width, height, false)
		guiSetFont(button["radio:more_grid1"], "default-bold-small")
		
		guiGridListAddColumn(button["radio:more_grid1"],"Effekt name",0.4)
		guiGridListAddColumn(button["radio:more_grid1"],"Zurzeit aktiviert",0.4)
		
		
		-- SOUND EFFECTS --
		local function refreshMoreGrid()
			guiGridListClear(button["radio:more_grid1"])
			for index, name in pairs(effect_names) do
				local row = guiGridListAddRow(button["radio:more_grid1"])
				guiGridListSetItemText(button["radio:more_grid1"], row, 1, name, false, false)
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then	
					local enabled = getSoundEffects(radioData["sound"])[name]
					local text = "Nein"
					if(enabled) then text = "Ja" end
					guiGridListSetItemText(button["radio:more_grid1"], row, 2, text, false, false)
				else
					guiGridListSetItemText(button["radio:more_grid1"], row, 2, "Nein", false, false)
				end
			end
		end
		
		refreshMoreGrid()
		-- EVENT HANDLERS --
		
		addEventHandler("onClientGUIClick", button["radio:more_button1"], function()
			if(isRadioPlaying()) then
				local text, enabled = guiGridListGetItemText(button["radio:more_grid1"], guiGridListGetSelectedItem(button["radio:more_grid1"]), 1), guiGridListGetItemText(button["radio:more_grid1"], guiGridListGetSelectedItem(button["radio:more_grid1"]), 2)
				if(enabled == "Ja") then
					outputChatBox("Diesen Sound-Effekt hast du bereits aktiviert!", 150, 0, 0)
					return
				end
				if(text ~= "") then
					setSoundEffectEnabled(radioData["sound"], text, true)
					outputChatBox("Der Sound Effekt: "..text.." wurde aktiviert.", 0, 100, 200)
					refreshMoreGrid()
				else
					outputChatBox("Du musst ein Sound Effekt auswählen!", 150, 0, 0)
				end
			else
				outputChatBox("Du musst einen Stream abgespielt haben!", 150, 0, 0)
			end
		end, false)
		
		addEventHandler("onClientGUIClick", button["radio:more_button2"], function()
			if(isRadioPlaying()) then
				local text, enabled = guiGridListGetItemText(button["radio:more_grid1"], guiGridListGetSelectedItem(button["radio:more_grid1"]), 1), guiGridListGetItemText(button["radio:more_grid1"], guiGridListGetSelectedItem(button["radio:more_grid1"]), 2)
				if(enabled == "Nein") then
					outputChatBox("Diesen Sound-Effekt hast du nicht aktiviert!", 150, 0, 0)
					return
				end
				if(text ~= "") then
					setSoundEffectEnabled(radioData["sound"], text, false)
					outputChatBox("Der Sound Effekt: "..text.." wurde deaktiviert.", 0, 100, 200)
					refreshMoreGrid()
				else
					outputChatBox("Du musst ein Sound Effekt auswählen!", 150, 0, 0)
				end
			else
				outputChatBox("Du musst ein Stream abgespielt haben!", 150, 0, 0)
			end
		end, false)
		if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
			local l = getSoundLength(radioData["sound"])
			if not(l) then
				outputChatBox("Diese Einstellungen funktionieren nicht bei Radio-Streams.", 175, 0, 0)
			else
				local pos = getSoundPosition(radioData["sound"])
				pos = math.round(pos, 2, "round")
				guiSetText(button["radio:more_label1"], "Soundposition: "..pos.."/"..math.round(l, 2, "round"))
			end
		else

		end
	end
end


function hide_radio(id)
	if(radio == false) then return end
	if(id == 0) then
		destroyElement(button["radio:button_settings"])
		destroyElement(button["radio:button_radio"])
		destroyElement(button["radio:button_more"])
		destroyElement(button["radio:button_grid"])
		destroyElement(button["radio:label_1"])
		destroyElement(button["radio:edit_1"])
		destroyElement(button["radio:edit_2"])
		destroyElement(button["radio:button_loeschen"])
		destroyElement(button["radio:button_einfuegen"])
		destroyElement(button["radio:button_play"])
		destroyElement(button["radio:button_stop"])
	elseif(id == 1) then
		destroyElement(button["radio:button_settings"])
		destroyElement(button["radio:button_radio"])
		destroyElement(button["radio:button_more"])
		destroyElement(button["radio:button_play"])
		destroyElement(button["radio:button_stop"])
		destroyElement(button["radio:scrollbar_1"])
		destroyElement(button["radio:label_2"])
	elseif(id == 2) then
		destroyElement(button["radio:button_settings"])
		destroyElement(button["radio:button_radio"])
		destroyElement(button["radio:button_more"])
		destroyElement(button["radio:more_label1"])
		destroyElement(button["radio:more_label2"])
		destroyElement(button["radio:more_label3"])
		destroyElement(button["radio:more_label4"])
		destroyElement(button["radio:more_label5"])
		destroyElement(button["radio:more_scrollbar1"])
		destroyElement(button["radio:more_button1"])
		destroyElement(button["radio:more_button2"])
		destroyElement(button["radio:more_edit1"])
		destroyElement(button["radio:more_edit2"])
		destroyElement(button["radio:more_edit3"])
		destroyElement(button["radio:more_grid1"])
	end
end


function show_startartbuttons()
	if(standartbuttons == true) then return end
	standartbuttons = true
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	
	local addx, addy, width, height, scale
		-- HOME --
	addx = 750
	addy = -485
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 70/1.5, 60/1.5
	width, height = width/1920*sx, height/1920*sx
	button["home"] = guiCreateButton(x+addx, y-addy, width, height, "Home", false)
	guiSetAlpha(button["home"], 0)
	noSoundButton[button["home"]] = true
	
	addEventHandler("onClientGUIClick", button["home"], function()
		
		hide_dialer()
		hide_browser()
		hide_radio(radioauswahl)
		hide_appsite()
		hide_faq(faqsite)
		radio = false
		if(memo == true) then
			local text = guiGetText(button["memo:memo"])
			triggerServerEvent("onMTHandyAction", gMe, "memoupdate", text)
			hide_memo()
		end
		hide_calculator()
		hide_browsersite(page_images[c_url])
		hide_messenger(messengersite)
		menue = true
		show_buttonMain()
	end, false)
	
	-- BACK --
	addx = 850
	addy = -485
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 70/1.5, 60/1.5
	width, height = width/1920*sx, height/1920*sx
	button["back"] = guiCreateButton(x+addx, y-addy, width, height, "Zurück", false)
	guiSetAlpha(button["back"], 0)
	noSoundButton[button["back"]] = true
	addEventHandler("onClientGUIClick", button["back"], function()
		if(browser == true) then
			if(page_images[c_url]) then
				hide_browsersite(page_images[c_url])
			else
				hide_browsersite("404")
			end
			c_url = last_url
			if not(c_url) then c_url = "www.loogle.com" end
			show_browsersite(page_images[last_url])
		end
		if(memo == true) then
			hide_memo()
			memo = false
			menue = true
			show_buttonMain()
		end
		if(messenger == true) then
			hide_messenger(messengersite)
			show_messenger("1")
			messengersite = "1"
		end
		if(radio == true) then
			hide_radio(radioauswahl)
			radio = false
			menue = true
			show_buttonMain()
		end
		if(faq == true) then
			if(faqsite == 1) then
				hide_faq(faqsite)
				show_faq(0)
				faqsite = 0
			end
		end
	end, false)
end

addCommandHandler("faq", function()
	outputChatBox(faq)
	outputChatBox(faqsite)
end)

function hide_standartbuttons()
	if(standartbuttons == false) then return end
	standartbuttons = false
	destroyElement(button["home"])
	destroyElement(button["back"])
end


function show_appsite()
	if(appsite == false) then
		appsite = true
		
		-- CLOCK --
		local sx, sy = guiGetScreenSize()
		local x, y = sx/2, sy/2
		
		local addx, addy, width, height, scale
		addx = 640
		addy = 40
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 62/1.5, 62/1.5
		width, height = width/1920*sx, height/1920*sx
		button["app:clock"] = guiCreateButton(x+addx, y-addy, width, height, "Clock", false)
		guiSetAlpha(button["app:clock"], 0)
		
		addEventHandler("onClientMouseEnter", button["app:clock"], function()
			light["app:clock"] = true
		end)
		
		addEventHandler("onClientMouseLeave", button["app:clock"], function()
			light["app:clock"] = false
		end)
		
		addEventHandler("onClientGUIClick", button["app:clock"], function()
		local time = timestampOptical()
		outputChatBox("[DATUM / UHRZEIT]: "..time.."", 0, 100, 200)
	end)
	end
end
function hide_appsite()
	if(appsite == true) then
		appsite = false
		destroyElement(button["app:clock"])
	end
end

function show_buttonMain()
	if(buttonmain == true) then return end
	buttonmain = true
	-- KNOEPFTE MAIN --
	
	-- CALL --
	local sx, sy = guiGetScreenSize()
	local x, y = sx/2, sy/2
	
	local addx, addy, width, height, scale
	addx = 640
	addy = -390
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Phone"] = guiCreateButton(x+addx, y-addy, width, height, "Telefon", false)
	guiSetAlpha(button["Phone"], 0)
	
	addEventHandler("onClientMouseEnter", button["Phone"], function()
		light["Phone"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Phone"], function()
		light["Phone"] = false
	end)
	
	addEventHandler("onClientGUIClick", button["Phone"], function()
		--hide_buttonMain()
		--menue = false
		--show_dialer()
		outputChatBox("[INFO]: Verwende /call und /sms [NUMMER]", 0, 100, 200)
	end)
	


	
	addx = 640+75
	addy = -390
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Contacts"] = guiCreateButton(x+addx, y-addy, width, height, "Kontakte", false)
	guiSetAlpha(button["Contacts"], 0)
	
	addEventHandler("onClientMouseEnter", button["Contacts"], function()
		light["Contacts"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Contacts"], function()
		light["Contacts"] = false
	end)
	
	addEventHandler("onClientGUIClick", button["Contacts"], function()
		--menue = false
		--hide_buttonMain()
		--show_browser()
		outputChatBox("[INFO]: Verwende /number [NAME]", 0, 100, 200)
	end, false)
	
	addx = 640+(75*2)
	addy = -390
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Messaging"] = guiCreateButton(x+addx, y-addy, width, height, "Nachrichten", false)
	guiSetAlpha(button["Messaging"], 0)
	
	addEventHandler("onClientMouseEnter", button["Messaging"], function()
		light["Messaging"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Messaging"], function()
		light["Messaging"] = false
	end)
	addEventHandler("onClientGUIClick", button["Messaging"], function()
		menue = false
		hide_buttonMain()
		show_messenger("1")
		messengersite = "1"
	end)
	addx = 640+(75*3)
	addy = -390
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Apps"] = guiCreateButton(x+addx, y-addy, width, height, "Apps", false)
	guiSetAlpha(button["Apps"], 0)
	
	addEventHandler("onClientMouseEnter", button["Apps"], function()
		light["Apps"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Apps"], function()
		light["Apps"] = false
	end)
	addEventHandler("onClientGUIClick", button["Apps"], function()
		menue = false
		hide_buttonMain()
		show_appsite()
	end)
	addx = 640
	addy = -220
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Browser"] = guiCreateButton(x+addx, y-addy, width, height, "Browser", false)
	guiSetAlpha(button["Browser"], 0)
	
	addEventHandler("onClientMouseEnter", button["Browser"], function()
		light["Browser"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Browser"], function()
		light["Browser"] = false
	end)
	addEventHandler("onClientGUIClick", button["Browser"], function()
		menue = false
		hide_buttonMain()
		show_browser()
	end, false)
	
	addx = 640
	addy = -295
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["FAQ"] = guiCreateButton(x+addx, y-addy, width, height, "FAQ", false)
	guiSetAlpha(button["FAQ"], 0)
	
	addEventHandler("onClientMouseEnter", button["FAQ"], function()
		light["FAQ"] = true
	end)


	
	addEventHandler("onClientMouseLeave", button["FAQ"], function()
		light["FAQ"] = false
	end)
	addEventHandler("onClientGUIClick", button["FAQ"], function()
		menue = false
		hide_buttonMain()
		show_faq(faqsite)
	end, false)

	
	addx = 640+75
	addy = -295
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Update"] = guiCreateButton(x+addx, y-addy, width, height, "Update", false)
	guiSetAlpha(button["Update"], 0)
	
	addEventHandler("onClientMouseEnter", button["Update"], function()
		light["Update"] = true
	end)

	addEventHandler("onClientMouseLeave", button["Update"], function()
		light["Update"] = false
	end)
	addEventHandler("onClientGUIClick", button["Update"], function()
		menue = false
		hide_buttonMain()
		show_browser()
		c_url = "www.updates.com"
		show_browsersite("updates")
	end, false)
	
	addx = 640+(75*2)
	addy = -295
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Radio"] = guiCreateButton(x+addx, y-addy, width, height, "Radio", false)
	guiSetAlpha(button["Radio"], 0)
	
	addEventHandler("onClientMouseEnter", button["Radio"], function()
		light["Radio"] = true
	end)

	addEventHandler("onClientMouseLeave", button["Radio"], function()
		light["Radio"] = false
	end)
	addEventHandler("onClientGUIClick", button["Radio"], function()
		menue = false
		hide_buttonMain()
		show_radio(0)
		radio = true
	end, false)
	
	addx = 640+(73*3)
	addy = -295
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 62/1.5, 62/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Car"] = guiCreateButton(x+addx, y-addy, width, height, "Car", false)
	guiSetAlpha(button["Car"], 0)
	
	addEventHandler("onClientMouseEnter", button["Car"], function()
		light["Car"] = true
	end)

	addEventHandler("onClientMouseLeave", button["Car"], function()
		light["Car"] = false
	end)
	addEventHandler("onClientGUIClick", button["Car"], function()
		menue = false
		hide_buttonMain()
		show_browser()
		c_url = "www.fahrzeuge.com"
		show_browsersite("fahrzeuge")
	end, false)
	
	addx = 640+75
	addy = -220
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	button["Memo"] = guiCreateButton(x+addx, y-addy, width, height, "Notiz", false)
	guiSetAlpha(button["Memo"], 0)
	
	addEventHandler("onClientMouseEnter", button["Memo"], function()
		light["Memo"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Memo"], function()
		light["Memo"] = false
	end)
	
	addEventHandler("onClientGUIClick", button["Memo"], function()
		menue = false
		hide_buttonMain()
		show_memo()
	end, false)
	-- Calculator --
	addx = 640+(75*2)
	addy = -220
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	
	button["Calculator"] = guiCreateButton(x+addx, y-addy, width, height, "Rechner", false)
	guiSetAlpha(button["Calculator"], 0)
	
	addEventHandler("onClientMouseEnter", button["Calculator"], function()
		light["Calculator"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["Calculator"], function()
		light["Calculator"] = false
	end)
	
	addEventHandler("onClientGUIClick", button["Calculator"], function()
		menue = false
		hide_buttonMain()
		show_calculator()
	end, false)
	-- House --
	addx = 640+(75*3)
	addy = -220
	addx = addx/1920*sx
	addy = addy/1920*sx
	width, height = 64/1.5, 61/1.5
	width, height = width/1920*sx, height/1920*sx
	
	button["House"] = guiCreateButton(x+addx, y-addy, width, height, "Haus", false)
	guiSetAlpha(button["House"], 0)
	
	addEventHandler("onClientMouseEnter", button["House"], function()
		light["House"] = true
	end)
	
	addEventHandler("onClientMouseLeave", button["House"], function()
		light["House"] = false
	end)
	
	addEventHandler("onClientGUIClick", button["House"], function()
		menue = false
		hide_buttonMain()
		show_browser()
		c_url = "www.house.com"
		show_browsersite("house")
	end, false)
end

function hide_buttonMain()
	if(buttonmain == false) then return end
	destroyElement(button["Phone"])
	destroyElement(button["Contacts"])
	destroyElement(button["Messaging"])
	destroyElement(button["Apps"])
	destroyElement(button["Browser"])
	destroyElement(button["Memo"])
	destroyElement(button["House"])
	destroyElement(button["Calculator"])
	destroyElement(button["FAQ"])
	destroyElement(button["Update"])
	destroyElement(button["Radio"])
	destroyElement(button["Car"])
	buttonmain = false
end

-- Draws the BACKGROUND/FRAME/APP Icons etc. for the Phone
addEventHandler("onClientRender", getRootElement(), function()
	if(enabled == true) then
		for index, knopf in pairs(button) do
			--if(isElement(knopf)) then
			--	guiBringToFront(knopf)
			--end
		end
		local sx, sy = guiGetScreenSize()
		local x, y = sx/2, sy/2
	
		local addx, addy, width, height, scale, bx, by
		
		-- RAHMEN --
		addx = 590
		addy = 160
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 370, 713
		width, height = width/1920*sx, height/1920*sx
		dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/rahmen.png")
		
		-- BACKGROUND & RAHMEN --
--		addx = 630
--		addy = 45
		addx = 615
		addy = 80
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 488/1.5, 815/1.5
		width, height = width/1920*sx, height/1920*sx
		
		-- BACKGROUND DRAW NOT WORKING CAUSE OF .JPG INSTED OF .PNG CAN BE FIXED!
		-- outputDebugString("handy/data/images/galaxy/icons/backgrounds/background"..current_background..".jpg")
		-- if(fileExists("handy/data/images/galaxy/icons/backgrounds/background"..current_background..".jpg")) then
		-- 	dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/backgrounds/background"..current_background..".jpg")
		-- else
		-- dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/backgrounds/background2.jpg")
		-- end

		-- EMPFANG & AKKU --
		addx = 840
		addy = 75
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 23/1.5, 21/1.5
		width, height = width/1920*sx, height/1920*sx
		dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/empfang"..empfang..".png")
		-- AKKU --
		addx = 860
		addy = 76
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 20/1.5, 24/1.5
		width, height = width/1920*sx, height/1920*sx
		dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/batterie"..akku..".png")
		-- STATUSLEISTE --
		local s_add = 0
		if(radioData["playing"] == true) then
			addx = 620+s_add
			addy = 76
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 24/1.5, 24/1.5
			width, height = width/1920*sx, height/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/play.png")
			s_add = s_add+30
		end
		if(emailget == true) then
			addx = 620+s_add
			addy = 76
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 24/1.5, 24/1.5
			width, height = width/1920*sx, height/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/messagearrived.png")
			s_add = s_add+30
		end
		-- TIME --
		local hour, min = getTime()
		if(hour < 10) then hour = "0"..hour end
		if(min < 10) then min = "0"..min end
		addx = 885
		addy = 77.5
		addx = addx/1920*sx
		addy = addy/1920*sx
		width, height = 20/1.5, 24/1.5
		width, height = width/1920*sx, height/1920*sx
		scale = 0.35/1920*sx
		dxDrawText(hour..":"..min, x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
		-- BROWSER --
		-- CALCULATOR --
		if(calculator == true) then
			addx = 615
			addy = 80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 815/1.5
			width, height = width/1920*sx, height/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/calculatorbackground.png")
			-- anzeige --
			addx = 620
			addy = 60
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 20/1.5, 24/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.8/1920*sx
			bx = 940
			by = -100
			dxDrawText(cal_anzeige, x+addx, y-addy, x+bx, y-by, tocolor(255, 255, 255, 200), scale, font, "left", "top", false, true)
		end
		if(browser == true) then
			addx = 615
			addy = 1
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 705/1.5
			width, height = width/1920*sx, height/1920*sx
			local page = page_images[c_url]
			if not(page) then page = "404" end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/browser/"..page..".jpg")
			-- BROWSER LABEL OBEN --
			addx = 614
			addy = 57
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 83/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.3/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/browser/url.jpg")
			
			addx = 700
			addy = 35
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 20/1.5, 24/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.3/1920*sx
			bx = 940
			by = -100
			dxDrawText(c_url, x+addx, y-addy, x+bx, y-by, tocolor(255, 255, 255, 200), scale, font, "left", "top", false, true)
			-- PAGE DESIGNS --
			if(page == "startpage") then
				addx = 700
				addy = -444
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 20/1.5, 24/1.5
				width, height = width/1920*sx, height/1920*sx
				scale = 0.3/1920*sx
				local x2, y2, z2 = getElementPosition(getLocalPlayer())
				local zone1, zone2 = getZoneName(x2, y2, z2, false), getZoneName(x2, y2, z2, true)
				dxDrawText(zone1..", "..zone2, x+addx, y-addy, x+addx, y-addy, tocolor(20, 20, 20, 200), scale, font, "left", "top", false, true)
			elseif(page == "404") then
				addx = 700
				addy = -200
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 20/1.5, 24/1.5
				width, height = width/1920*sx, height/1920*sx
				scale = 0.3/1920*sx
				local x2, y2, z2 = getElementPosition(getLocalPlayer())
				local zone1, zone2 = getZoneName(x2, y2, z2, false), getZoneName(x2, y2, z2, true)
				dxDrawText("404 - Website not found", x+addx, y-addy, x+addx, y-addy, tocolor(20, 20, 20, 200), scale, font, "left", "top", false, true)
			elseif(page == "10060") then
				addx = 700
				addy = -200
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 20/1.5, 24/1.5
				width, height = width/1920*sx, height/1920*sx
				scale = 0.3/1920*sx
				local x2, y2, z2 = getElementPosition(getLocalPlayer())
				local zone1, zone2 = getZoneName(x2, y2, z2, false), getZoneName(x2, y2, z2, true)
				dxDrawText("10060 - Connection timed out", x+addx, y-addy, x+addx, y-addy, tocolor(20, 20, 20, 200), scale, font, "left", "top", false, true)
			end
			show_browsersite(page)
		end
		-- DIALER --
		if(dialer == true) then
			addx = 615
			addy = 80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 815/1.5
			width, height = width/1920*sx, height/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/dialer.jpg")
			addx = 620
			addy = -10
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 20/1.5, 24/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.8/1920*sx
			bx = 940
			by = -100
			dxDrawText(auswahl, x+addx, y-addy, x+bx, y-by, tocolor(255, 255, 255, 200), scale, font, "left", "top", false, true)
		end
		-- MENUE --
		-- FAQ--
		if(faq == true) then
			addx = 615
			addy = 55
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 780/1.5
			width, height = width/1920*sx, height/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/faqbackground.jpg")
		end
		-- FAQ 2 --
		if(faq == true) and (faqsite == 1) then
			addx = 615
			addy = 0
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 780/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.5/1920*sx
			dxDrawText(handy_help_text[faq_suche], x+addx, y-addy, x+addx+width, y-addy+height, tocolor(0, 0, 0, 200), scale, "arial", "center", "top", true, true, true)
		end
		-- Messanger
		if(messenger == true) then
			addx = 615
			addy = 80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 815/1.5
			width, height = width/1920*sx, height/1920*sx
			local url = messengersite
			if(messengersite == "2") then url = "1" end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/messenger/"..url..".png")
		end
		if(radio == true) then
			addx = 615
			addy = 80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 488/1.5, 815/1.5
			width, height = width/1920*sx, height/1920*sx
			local background = 1
			if(radiosite == 3) then background = 2 end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/radiobackground"..background..".png")
			if(radiosite == 3) then
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
					local pos = getSoundPosition(radioData["sound"])
					local l = getSoundLength(radioData["sound"])
					l = l*1000
					pos = pos*1000
					pos = math.round(pos, 1, "round")
					l = math.round(l, 1, "round")
					local m1, s1 = convertTime(pos)
					local m2, s2 = convertTime(l)
					m1, s1, m2, s2 = tonumber(m1), tonumber(s1), tonumber(m2), tonumber(s2)
					if(m1 < 10) then m1 = "0"..m1 end
					if(m2 < 10) then m2 = "0"..m2 end
					if(s1 < 10) then s1 = "0"..s1 end
					if(s2 < 10) then s2 = "0"..s2 end
					guiSetText(button["radio:more_label1"], m1..":"..s1.." / "..m2..":"..s2)
					--l/100*guiScrollBarGetScrollPosition(source)
				end
			end
			if(radiosite == 2) then
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
					-- BEATS PER MINUTE --
					local bpm = getSoundBPM(radioData["sound"])
					local r, g, b = 0, 0, 0
					if(bpm == false) or not(bpm) then 
						r, g, b = 0, 255, 0
					else
						if(bpm < 10) then
							r, g, b = 0, 255, 0
						end
						if(bpm > 10) then
							r, g, b = 0, 255, 255
						end
						if(bpm > 70) then
							r, g, b = 0, 0, 255
						end
						if(bpm > 100) then
							r, g, b = 255, 150-(bpm/1.5), 0
						end
						if(bpm > 150) then
							r, g, b = 255, 20, 20
						end
						if(bpm > 200) then
							r, g, b = 255, 0, 0
						end
					end
					addx = 640
					addy = -325
					addx = addx/1920*sx
					addy = addy/1920*sx
					width, height = 400/1.5, 5/1.5
					width, height = width/1920*sx, height/1920*sx
					scale = 0.3/1920*sx
					dxDrawRectangle(x+addx, y-addy, width, height, tocolor(r, g, b, 50))
					--dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/misc/visualiser.png", 0, 0, 0, tocolor(r, g, b, 50))
				end
				-- FTT DATA --
				local table
				if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
					table = getSoundFFTData(radioData["sound"], 512)
					if (table) then else
						table = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
					end
				else
					table = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
				end
				addx = 640
				addy = -320
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 10/1.5, 10/1.5
				width, height = width/1920*sx, height/1920*sx
				local add = 15/1920*sx
				local curadd = add
				local r, g, b = 0, 255, 0
				for i = 1, 16, 1 do
					if not(radioSample[i]) then
						radioSample[i] = 7
					end
					local height2 = (height*(table[i]*2048)/100*10)/100*(radioData["volume"]*100)
					if(height2 > 150) then
						height2 = 150
					end
					if (height2 < 7) then 
						height2 = 7
					end
					if(radioSample[i] < height2) then
						radioSample[i] = height2
					end
					if not(radioBalken[i]) then
						radioBalken[i] = 7
					end
					if(radioData["playing"] == true) and (isElement(radioData["sound"])) then 
						radioBalken[i] = height2
					else
						radioBalken[i] = radioBalken[i]-1.2
					end
					if (radioBalken[i] < 7) then 
						radioBalken[i] = 7
					end
					r, g, b = r+14, g-14, b
					dxDrawRectangle(x+addx+curadd-1, y-addy, width+1, height-radioBalken[i], tocolor(0, 0, 0, 100))
					dxDrawRectangle(x+addx+curadd, y-addy, width, height-radioBalken[i], tocolor(r, g, b))
					dxDrawRectangle(x+addx+curadd, y-addy-radioSample[i]+5, width, 1, tocolor(255, 255, 255, 150))
					curadd = curadd+add
					radioSample[i] = radioSample[i]-1	
				end
				-- TITEL --
				addx = 640
				addy = -100
				addx = addx/1920*sx
				addy = addy/1920*sx
				width, height = 50/1.5, 50/1.5
				width, height = width/1920*sx, height/1920*sx
				scale = 0.3/1920*sx
				local name = radioData["name"]
				if not(name) then name = "-" end
				local titel = radioData["titel"]
				if not(titel) then titel = "-" end
				dxDrawText("Stream: "..name.."\nTitel: "..titel, x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font, "left", "top", false, true)
			end
		end
		-- APPS --
		if(appsite == true) then
			-- CLOCK --
			addx = 640
			addy = 40
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["app:clock"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/clock.png", 0, 0, 0, tocolor(r, g, b, a))
			
			addx = 647
			addy = 0
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Uhr", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
		end
		if(menue == true) then
			show_buttonMain()
			-- ICONS --
			-- BROWSER --
			addx = 640
			addy = -220
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Browser"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/browser.png", 0, 0, 0, tocolor(r, g, b, a))
			-- FAQ --
			addx = 640
			addy = -295
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["FAQ"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/faq.png", 0, 0, 0, tocolor(r, g, b, a))
			-- Phone 
			addx = 640
			addy = -390
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Phone"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/call.png", 0, 0, 0, tocolor(r, g, b, a))
			-- Contacts --
			addx = 640+75
			addy = -390
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Contacts"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/contacts.png", 0, 0, 0, tocolor(r, g, b, a))
			-- memo --
			addx = 640+75
			addy = -220
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Memo"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/memo.png", 0, 0, 0, tocolor(r, g, b, a))
			-- Calculator --
			addx = 640+(75*2)
			addy = -220
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Calculator"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/calculator.png", 0, 0, 0, tocolor(r, g, b, a))
			-- House --
			addx = 640+(75*3)
			addy = -220
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["House"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/house.png", 0, 0, 0, tocolor(r, g, b, a))
			-- MESSAGING --
			addx = 640+(75*2)
			addy = -390
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Messaging"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/messaging.png", 0, 0, 0, tocolor(r, g, b, a))
			-- Application --
			addx = 640+(75*3)
			addy = -390
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 61/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Apps"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/apps.png", 0, 0, 0, tocolor(r, g, b, a))
			
			-- Updates --
			addx = 640+75
			addy = -295
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Update"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/update.png", 0, 0, 0, tocolor(r, g, b, a))
			
			-- Radio --
			addx = 640+(75*2)
			addy = -295
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Radio"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/radio.png", 0, 0, 0, tocolor(r, g, b, a))
			
			-- CAR --
			addx = 640+(73*3)
			addy = -295
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			local done = light["Car"]
			local r, g, b, a = 255, 255, 255, 200
			if(done) and (done == true) then
				r, g, b, a = 255, 255, 255, 255
			end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/car.png", 0, 0, 0, tocolor(r, g, b, a))
			-- LABELS --
			-- PHONE 
			-- Calculator 
			addx = 652+(65*2)
			addy = -260
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Rechner", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- Memo
			addx = 652+65
			addy = -260
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Notiz", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- House
			addx = 672+(65*3)
			addy = -260
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Haus", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- Radio --
			addx = 660+(65*2)
			addy = -335
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Radio", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- Car --
			addx = 660+(63*3)
			addy = -335
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Fahrzeuge", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- Updates --
			addx = 652+60
			addy = -335
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Updates", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- FAQ --
			addx = 645
			addy = -335
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Hilfe", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- Browser --
			addx = 632
			addy = -260
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Browser", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- old: 735
			addx = 633
			addy = -434
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Telefon", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- CONTACTS --
			addx = 642+65
			addy = -434
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Kontakte", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- MESSAGING --
			addx = 638+(75*2)
			addy = -434
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("E-Mail", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			-- APPS --
			addx = 640+(76*3)
			addy = -434
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 62/1.5, 62/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawText("Apps", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "sans")
			
			-- TIME --
			addx = 620.5
			addy = 50
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 470/1.5, 144/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/timerahmen.png", 0, 0, 0, tocolor(255, 255, 255, 200))
			-- TIMELABEL --
			addx = 640-12
			addy = -37.5+75
			addx = addx/1920*sx
			addy = addy/1920*sx
			scale = 5/1920*sx
			local hour, min = getTime()
			if(hour < 10) then hour = "0"..hour end
			if(min < 10) then min = "0"..min end
			dxDrawText(hour..":"..min, x+addx, y-addy, x+addx, y-addy, tocolor(0, 0, 0, 200), scale, "arial")
			dxDrawText(hour..":"..min, x+addx-3, y-addy-3, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, "arial")
			local name = FormatDate("w").."."
			addx = 825
			addy = 37.5
			addx = addx/1920*sx
			addy = addy/1920*sx
			scale = 2.5/1920*sx
			dxDrawText(name, x+addx, y-addy, x+addx, y-addy, tocolor(0, 0, 0, 200), scale, "arial")
			dxDrawText(name, x+addx-1, y-addy-1, x+addx, y-addy, tocolor(100, 255, 0, 200), scale, "arial")
			addx = 823
			addy = 37.5
			addx = addx/1920*sx
			addy = addy/1920*sx
			dxDrawText("___", x+addx, y-addy, x+addx, y-addy, tocolor(100, 255, 0, 200), scale, "arial")
			-- DARUNTER --
			addx = 810
			addy = 0
			addx = addx/1920*sx
			addy = addy/1920*sx
			scale = 2.5/1920*sx
			local day, month = getRealTime()["monthday"], getRealTime()["month"]
			if(day < 10) then day = "0"..day end
			month = month+1
			if(month < 10) then month = "0"..month end
			dxDrawText(day.."/"..month, x+addx, y-addy, x+addx, y-addy, tocolor(0, 0, 0, 200), scale, "arial")
			dxDrawText(day.."/"..month, x+addx-1, y-addy-1, x+addx, y-addy, tocolor(100, 255, 0, 200), scale, "arial")
			-- WEATHER --
			addx = 620.5
			addy = -50
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 470/1.5, 234/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/weatherrahmen.png", 0, 0, 0, tocolor(255, 255, 255, 150))
			-- THE WEATHER --
			local weather = getWeather()
			local typ = w_bilder[weather]
			if not(typ) then typ = "sunny" end
			addx = 750
			addy = -120
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 120/1.5, 120/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/weather/"..typ..".png", 0, 0, 0, tocolor(255, 255, 255, 255))
			-- Temperature --
			addx = 640
			addy = -130
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 120/1.5, 120/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.8/1920*sx
			dxDrawText(temp.."'C", x+addx, y-addy, x+addx, y-addy, tocolor(0, 0, 0, 200), scale, font)
			dxDrawText(temp.."'C", x+addx-1.5, y-addy-1.5, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
			-- ORT TEMP --
			addx = 840
			addy = -140
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 120/1.5, 120/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.30/1920*sx
			local x3, y3, z3 = getElementPosition(getLocalPlayer())
			local zone1, zone2 = getZoneName(x3, y3, z3, false), getZoneName(x3, y3, z3, true)
			dxDrawText(zone1..",\n"..zone2 , x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
			
			-- 3 STUNDEN VORRAUSSCHAU --
			-- STUNDE 1--
			addx = 640
			addy = -53
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 120/1.5, 120/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.40/1920*sx
			local hour, min = getTime()
			local nexthour = math.ceil(hour)
			if(nexthour == hour) then nexthour = hour+1 end
			if(nexthour < 10) then nexthour = "0"..nexthour end
			if(nexthour == 24) then nexthour = 0 end
			dxDrawText(nexthour..":00", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
			-- icon 
			addx = 640
			addy = -80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			local weather = weather_v_1
			local typ = w_bilder[weather]
			if not(typ) then typ = "sunny" end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/weather/"..typ..".png", 0, 0, 0, tocolor(255, 255, 255, 255))
			-- STUNDE 2--
			addx = 740
			addy = -53
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 120/1.5, 120/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.40/1920*sx
			local hour, min = getTime()
			local nexthour = math.ceil(hour)
			if(nexthour == hour) then nexthour = hour+2 end
			if(nexthour < 10) then nexthour = "0"..nexthour end
			if(nexthour == 24) then nexthour = 0 end
			dxDrawText(nexthour..":00", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
			-- icon 
			addx = 740
			addy = -80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			local weather = weather_v_2
			local typ = w_bilder[weather]
			if not(typ) then typ = "sunny" end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/weather/"..typ..".png", 0, 0, 0, tocolor(255, 255, 255, 255))
			-- STUNDE 3--
			addx = 840
			addy = -53
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.40/1920*sx
			local hour, min = getTime()
			local nexthour = math.ceil(hour)
			if(nexthour == hour) then nexthour = hour+3 end
			if(nexthour < 10) then nexthour = "0"..nexthour end
			if(nexthour == 24) then nexthour = 0 end
			dxDrawText(nexthour..":00", x+addx, y-addy, x+addx, y-addy, tocolor(255, 255, 255, 200), scale, font)
			-- icon 
			addx = 840
			addy = -80
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 64/1.5, 64/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 1.2/1920*sx
			local weather = weather_v_3
			local typ = w_bilder[weather]
			if not(typ) then typ = "sunny" end
			dxDrawImage(x+addx, y-addy, width, height, "handy/data/images/galaxy/icons/weather/"..typ..".png", 0, 0, 0, tocolor(255, 255, 255, 255))
		end
		
		-- INFOBAR --
		if(infoBar["showing"] == true) then
			addx = 616
			addy = 55
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 482/1.5, 150/1.5
			width, height = width/1920*sx, height/1920*sx
			local addy2 = infoBar["sy"]
			if(addy2 < height) then
				addy2 = addy2+2
				infoBar["sy"] = addy2
			end			
			dxDrawImage(x+addx, y-addy, width, addy2, "handy/data/images/galaxy/misc/infobar.jpg", 0, 0, 0, tocolor(255, 255, 255, 230), true)
			addx = 616
			addy = 55
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 482/1.5, 150/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.5/1920*sx
			dxDrawText(infoBar["text"], x+addx, y-addy, x+addx+width, y-addy+height, tocolor(infoBar["r"], infoBar["g"], infoBar["b"], 200), scale, font, "center", "center", true, true, true)
		else
			addx = 616
			addy = 55
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 482/1.5, 150/1.5
			width, height = width/1920*sx, height/1920*sx
			local addy2 = infoBar["sy"]
			if(addy2 > 0) then
				addy2 = addy2-2
				infoBar["sy"] = addy2
				dxDrawImage(x+addx, y-addy, width, addy2, "handy/data/images/galaxy/misc/infobar.jpg", 0, 0, 0, tocolor(255, 255, 255, 230), true)
			end
			addx = 616
			addy = 55
			addx = addx/1920*sx
			addy = addy/1920*sx
			width, height = 482/1.5, 150/1.5
			width, height = width/1920*sx, height/1920*sx
			scale = 0.5/1920*sx
			dxDrawText(infoBar["text"], x+addx, y-addy, x+addx+width, y-addy+height, tocolor(infoBar["r"], infoBar["g"], infoBar["b"], 200), scale, font, "center", "center", true, true, true)
		end
	end
end)


--bindKey(OPEN_KEY, "down", function ()
function openthehandy_func ()
if laGetElementData ( gMe, "loggedin" ) == 1 then
if laGetElementData ( gMe, "handystate" ) == "on" then
	enabled = not enabled
	if(antiSpam["timesopen"] < 10) then
		antiSpam["timesopen"] = antiSpam["timesopen"]+1
	else
		triggerServerEvent("doHandyKickAntiSpam", localPlayer)
	end

	if(enabled) then
		if(akku < 1) then
			outputChatBox("[INFO]: Dein Akku ist Leer! Lade ihn im Auto wieder auf.", 0, 100, 200)
			enabled = false
			return
		end
		triggerServerEvent("onMTHandyDataNeed", gMe, "onlinegeld")
		triggerServerEvent("onMTHandyDataNeed", gMe, "wetter")
		setElementData(gMe, "galaxy_handy:show", true)
		showCursor(true)
		if(browser == true) then
			show_browsersite(page_images[c_url])
		end
		if(memo == true) then
			guiSetVisible(button["memo:memo"], true)
		end
		local sx, sy = guiGetScreenSize()
		if(sx < 1025) or (sy < 769) then 
			outputChatBox("Warnung: Du besitzt einen 19.Hundert Anno Tabak Monitor & hast eine Aufloesung von/kleiner als 1024x768 Pixeln.", 255, 0, 0)
			outputChatBox("Das Handy wird bei dir falsch Dargestellt sein!", 255, 0, 0)
		end
		if(radio == true) then
			radio = false
			show_radio(radioauswahl)
			radio = true
		end
		if(appsite == true) then
			appsite = false
			show_appsite()
			appsite = true
		end
		show_startartbuttons()
		if(infoBar["showing"] == true) and (isTimer(infoBar["timer"]) == false) then
			infoBar["timer"] = setTimer(hideInfobar, infoBar["time"], 1)
		end
		if(faq == true) then
			faq = false
			show_faq(faqsite)
			faq = true
		end
	else
		hide_standartbuttons()
		hide_buttonMain()
		showCursor(false)
		if(faq == true) then
			hide_faq(faqsite)
			faq = true
		end
		if(messenger == true) then
			hide_messenger(messengersite)
			menue = true
		end
		if(browser == true) then
			hide_browsersite(page_images[c_url])
		end
		if(memo == true) then
			guiSetVisible(button["memo:memo"], false)
		end
		if(radio == true) then
			hide_radio(radioauswahl)
			radio = true
		end
		if(calculator == true) then
			hide_calculator()
			menue = true
		end
		setElementData(gMe, "galaxy_handy:show", false)
		local block, anim = getPedAnimation(gMe)
		if(block == "ped") and (anim == "phone_talk") then
			setPedAnimation(gMe)
		end
		if(appsite == true) then
			hide_appsite()
			appsite = true
		end
	end
else
	triggerEvent ( "infobox_start", gMe, "\n\nDein Handy ist\naus!", 5000, 125, 0, 0 )
end
end
end
addCommandHandler("galaxy", openthehandy_func )
bindKey ( OPEN_KEY, "down", openthehandy_func ) 

-- ANTISPAM --

local function refreshAntiSpam()
	if(antiSpam["timesopen"] > 0) then
		antiSpam["timesopen"] = antiSpam["timesopen"]-1
	end
end

-- setTimer(refreshAntiSpam, 500, -1)
setTimer(refreshAntiSpam, 500, 0)

-- ANIMATION CHECK --

local function checkAnimationForPlayers()
	for index, player in pairs(getElementsByType("player", getRootElement(), true)) do
		if(getElementData(player, "galaxy_handy:show") ~= true) then
			local block, anim = getPedAnimation(player)
			if(block == "ped") and (anim == "phone_talk") then
				setPedAnimation(player)
			end
		else
			local block, anim = getPedAnimation(player)
			if not(block) and not(anim) then
				setPedAnimation(player)
				setPedAnimation(player, "ped", "phone_talk", -1, true, false, false)
			end
		end
	end
end

-- setTimer(checkAnimationForPlayers, 500, -1)
setTimer(checkAnimationForPlayers, 500, 0)

-- EVENT HANDLERS --
addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	fileDelete(pfad.."client.lua")
end)

addEventHandler("onClientVehicleEnter", getLocalPlayer(), function()
	if(radioData["playing"] == true) then
		setTimer(setRadioChannel, 50, 1, 0)
	end
end)

addEventHandler("onClientMouseEnter", getRootElement(), function()
	for index, k in pairs(button) do
		if(k == source) then
			if not(noSoundButton[source]) then
				if(getElementType(source) == "gui-button") then
					playSoundFrontEnd(42)
				end
			end
		end
	end
end)

-- FUNCTIONS --


-- Token from the MTA WIKI- http://wiki.multitheftauto.com/wiki/Useful_Functions

function string.explode(self, separator)
    Check("string.explode", "string", self, "ensemble", "string", separator, "separator")
 
    if (#self == 0) then return {} end
    if (#separator == 0) then return { self } end
 
    return loadstring("return {\""..self:gsub(separator, "\",\"").."\"}")()
end


function Check(funcname, ...)
    local arg = {...}
 
    if (type(funcname) ~= "string") then
        error("Argument type mismatch at 'Check' ('funcname'). Expected 'string', got '"..type(funcname).."'.", 2)
    end
    if (#arg % 3 > 0) then
        error("Argument number mismatch at 'Check'. Expected #arg % 3 to be 0, but it is "..(#arg % 3)..".", 2)
    end
 
    for i=1, #arg-2, 3 do
        if (type(arg[i]) ~= "string" and type(arg[i]) ~= "table") then
            error("Argument type mismatch at 'Check' (arg #"..i.."). Expected 'string' or 'table', got '"..type(arg[i]).."'.", 2)
        elseif (type(arg[i+2]) ~= "string") then
            error("Argument type mismatch at 'Check' (arg #"..(i+2).."). Expected 'string', got '"..type(arg[i+2]).."'.", 2)
        end
 
        if (type(arg[i]) == "table") then
            local aType = type(arg[i+1])
            for _, pType in next, arg[i] do
                if (aType == pType) then
                    aType = nil
                    break
                end
            end
            if (aType) then
                error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..table.concat(arg[i], "' or '").."', got '"..aType.."'.", 3)
            end
        elseif (type(arg[i+1]) ~= arg[i]) then
            error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..arg[i].."', got '"..type(arg[i+1]).."'.", 3)
        end
    end
end

-- Thanks to solidsnake
function convertTime(ms)
	local min = math.floor ( ms/60000 )
	local sec = math.floor( (ms/1000)%60 )
	return min, sec
end

local gWeekDays = { "Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag" }
function FormatDate(format, escaper, timestamp)
	Check("FormatDate", "string", format, "format", {"nil","string"}, escaper, "escaper", {"nil","string"}, timestamp, "timestamp")
 
	escaper = (escaper or "'"):sub(1, 1)
	local time = getRealTime(timestamp)
	local formattedDate = ""
	local escaped = false
 
	time.year = time.year + 1900
	time.month = time.month + 1
 
	local datetime = { d = ("%02d"):format(time.monthday), h = ("%02d"):format(time.hour), i = ("%02d"):format(time.minute), m = ("%02d"):format(time.month), s = ("%02d"):format(time.second), w = gWeekDays[time.weekday+1]:sub(1, 2), W = gWeekDays[time.weekday+1], y = tostring(time.year):sub(-2), Y = time.year }
 
	for char in format:gmatch(".") do
		if (char == escaper) then escaped = not escaped
		else formattedDate = formattedDate..(not escaped and datetime[char] or char) end
	end
 
	return formattedDate
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function isRadioPlaying()
	if(radioData["playing"] == true) and (isElement(radioData["sound"])) then
		return true;
	else
		return false;
	end
end
 --[[
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), function(weapon, ammo, clip, x, y, z, element)
	if(weapon == 35) then 
		cancelEvent()
		x,y,z = getElementPosition(getLocalPlayer())
		for i = 1, 0, 1 do
			createProjectile(gMe, 19, x, y, z, 0.01)
		end
	end
end)]]

addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	if fileExists(pfad.."client.lua") then
		fileDelete(pfad.."client.lua")
	end
end)