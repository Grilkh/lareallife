------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local login_doing = false
local cur_cam_pos = 1
local cur_cam_pos_timer

local canlogin = false
local canregister = false
local getsBanned = false

local b_ele = {}
local b_light = {}
b_light["login"] = false
b_light["register"] = false
b_light["help"] = false

local Guivar = {}
Guivar[1] = 0
Guivar[2] = 0
Guivar[3] = 0

local Fenster = {}
local TabPanel = {}
local Tab = {}
local Label = {}
local Edit = {}
local Bild = {}
local Radio = {}
local Knopf = {}
local loginsound
		
addEvent("ShowLoginWindow", true)
addEvent("ShowRegisterGui", true)
addEvent("ShowBannedWindow", true)
addEvent("DisableLoginWindow", true)

local cam_pos = {
	{-2003.1451416016, 994.40289306641, 75.748260498047, -1967.6363525391, 903.46746826172, 54.071701049805},
	{-1487.1851806641, 959.185546875, 47.184825897217, -1543.9299316406, 879.21813964844, 27.557083129883},
	{-1527.9423828125, 743.83679199219, 24.552722930908, -1616.470703125, 697.46551513672, 21.025955200195},
	{-1714.9029541016, 734.49957275391, 43.880352020264, -1632.3620605469, 682.16387939453, 22.715166091919},
	{-1613.1927490234, 392.39205932617, 94.868537902832, -1582.0834960938, 486.4758605957, 81.435302734375},
	{-1734.1821289063, -68.189117431641, 61.877647399902, -1806.2397460938, 0.21225738525391, 50.52222442627},
	{-2205.2971191406, -319.54095458984, 93.928131103516, -2155.7709960938, -237.74501037598, 64.660499572754},
	{-2211.9077148438, 217.99597167969, 91.279426574707, -2296.6184082031, 176.53701782227, 58.034015655518},
	{-2421.2731933594, 77.858360290527, 41.524158477783, -2518.4978027344, 95.378410339355, 26.019008636475},
	{-2732.9562988281, 36.468860626221, 35.596424102783, -2665.3347167969, 109.25875854492, 24.241016387939},
	{-2305.4050292969, 721.41198730469, 149.51162719727, -2234.2507324219, 658.73547363281, 117.75141143799},
	{-2068.4306640625, 774.38671875, 115.21590423584, -2005.0228271484, 840.52648925781, 75.153785705566}
}

local schriftart = dxCreateFont("fonts/COPRGTB.ttf", 30, true)

local sx, sy = guiGetScreenSize()

addEventHandler("ShowRegisterGui", getRootElement(), function()
	canlogin = false
	canregister = true
	getsBanned = false
	--enableLoginShow()
end)

addEventHandler("ShowLoginWindow", getRootElement(), function()
	canlogin = true
	canregister = false
	getsBanned = false
	--enableLoginShow()
end)

function ShowBannedWindow_func ( reason, admin, date, time )

	local reason = reason
	local admin = admin
	local date = date
	canlogin = false
	canregister = false
	getsBanned = true
	toggleBannedGui ( reason, admin, date, time )
	--enableLoginShow()
end
addEventHandler("ShowBannedWindow", getRootElement(), ShowBannedWindow_func )

addEventHandler("onClientPreRender", getRootElement(), function()
	local x, y = sx/2, sy/2
	
	local addx, addy, width, height, scale, bx, by
	if(login_doing == true) then
		showCursor(true)
		showPlayerHudComponent("all", false)
		-- RAHMEN OBEN UND UNTEN --

		-- Oben --
		dxDrawRectangle(0, 0, sx, 200/1080*sy, tocolor(0, 0, 0, 100))
		dxDrawRectangle(0, 200/1080*sy, sx, 1, tocolor(0, 0, 0, 255))
		-- Unten
		dxDrawRectangle(0, sy, sx, -200/1080*sy, tocolor(0, 0, 0, 100))
		dxDrawRectangle(0, sy-200/1080*sy, sx, 1, tocolor(0, 0, 0, 255))
		
		-- Text --
		-- Oben LA --
		local fontbig = 1
		fontbig = fontbig/1920*sx
		dxDrawText("Los Angeles Reallife "..curVersion.."", sx/2-(270/1920*sx)+1, 80/1080*sy+1, "left", "top", tocolor(0, 0, 0, 220), fontbig, schriftart)
		dxDrawText("Los Angeles Reallife "..curVersion.."", sx/2-(270/1920*sx), 80/1080*sy, "left", "top", tocolor(255, 255, 255, 220), fontbig, schriftart)
		
		-- TEXTE UNTEN --
		
		-- Login --
		fontbig = 0.7
		fontbig = fontbig/1920*sx
		local a = 200
		if(b_light["login"] == true) then a = 255 end
		dxDrawText("Login", 50/1920*sx, sy-160/1080*sy, "left", "top", tocolor(255, 255, 255, a), fontbig, schriftart)
		-- Register --
		fontbig = 0.7
		fontbig = fontbig/1920*sx
		a = 200
		if(b_light["register"] == true) then a = 255 end
		dxDrawText("Register", 250/1920*sx, sy-160/1080*sy, "left", "top", tocolor(255, 255, 255, a), fontbig, schriftart)
		-- Help --
		fontbig = 0.7
		fontbig = fontbig/1920*sx
		a = 200
		if(b_light["help"] == true) then a = 255 end
		dxDrawText("Help", 500/1920*sx, sy-160/1080*sy, "left", "top", tocolor(255, 255, 255, a), fontbig, schriftart)
	end
end)

function toggleBannedGui( reason, admin, date, time)
	local reason = reason
	local admin = admin
	local date = date
	local time = time
	if(Guivar[3] == 1) then
		destroyElement(Fenster[3])
		Guivar[3] = 0
	else
		Guivar[3] = 1
		local X, Y, Width, Height = getMiddleGuiPosition(413,211)
		Fenster[3] = guiCreateWindow(X, Y, Width, Height, "Information",false)
		--Bild[1] = guiCreateStaticImage(10,20,391,52,"images/header.png",false,Fenster[1])
		Label[1] = guiCreateLabel(12,20,395,36,"Du bist gebannt! Melde dich im Forum, www.la-rl.com und schreibe\neine Entbannungsanfrage und wenn nötig, eine Freischaltungsanfrage.",false,Fenster[3])
		guiSetFont(Label[1],"default-bold-small")
		Label[2] = guiCreateLabel(9,60,395,16,"_____________________________________________________________________",false,Fenster[3])
		Label[3] = guiCreateLabel(12,80,395,19,"Bann-Informationen:",false,Fenster[3])
		guiSetFont(Label[3],"default-bold-small")
		guiLabelSetColor(Label[3], 0, 150, 250)
		Label[4] = guiCreateLabel(11,100,800,19,"Du wurdest gebannt von: "..admin.."",false,Fenster[3])
		guiSetFont(Label[4],"default-bold-small")
		
		Label[5] = guiCreateLabel(11,120,800,19,"Datum: "..date.."",false,Fenster[3])
		guiSetFont(Label[5],"default-bold-small")
		
		Label[6] = guiCreateLabel(11,140,800,19,"Dauer: "..time.."",false,Fenster[3])
		guiSetFont(Label[6],"default-bold-small")

		Label[7] = guiCreateLabel(11,160,800,19,"Grund: "..reason.."",false,Fenster[3])
		guiSetFont(Label[7],"default-bold-small")
	end
end

local function toggleLoginGui()
	if(Guivar[2] == 1) then
		destroyElement(Fenster[2])
		Guivar[2] = 0
	else
		Guivar[2] = 1
		local X, Y, Width, Height = getMiddleGuiPosition(413,211)
		Fenster[2] = guiCreateWindow(X, Y, Width, Height, "Login",false)
		Bild[1] = guiCreateStaticImage(10,20,391,52,"images/header.png",false,Fenster[2])
		Label[1] = guiCreateLabel(12,91,293,18,"Dein Account wurde gefunden. Bitte logge dich ein.",false,Fenster[2])
		guiSetFont(Label[1],"default-bold-small")
		Label[2] = guiCreateLabel(9,65,395,16,"_____________________________________________________________________",false,Fenster[2])
		Label[3] = guiCreateLabel(11,115,101,19,"Benutzername:",false,Fenster[2])
		guiSetFont(Label[3],"default-bold-small")
		Edit[1] = guiCreateEdit(108,110,166,25,getPlayerName(getLocalPlayer()),false,Fenster[2])
		guiEditSetReadOnly(Edit[1], true)
		Label[4] = guiCreateLabel(11,142,101,19,"Passwort:",false,Fenster[2])
		guiSetFont(Label[4],"default-bold-small")
		Edit[2] = guiCreateEdit(108,137,166,25,"",false,Fenster[2])
		guiEditSetMasked(Edit[2], true)
		Knopf[1] = guiCreateButton(14,166,390,30,"Los Angeles betreten!",false,Fenster[2])
		--Knopf[2] = guiCreateButton(204,165,186,30,"Hilfe!",false,Fenster[2])
		
		-- EVENT HANDELRS --
		addEventHandler("onClientGUIClick", Knopf[1], function()
			local pw = guiGetText(Edit[2])
			if(pw == "") or (pw == " ") then return end
			triggerServerEvent ( "einloggen", getLocalPlayer(), getLocalPlayer(), pw )
		end, false)
	end
end

local function toggleRegisterGui()
	if(Guivar[1] == 1) then
		destroyElement(Fenster[1])
		Guivar[1] = 0
	else
		Guivar[1] = 1
		local X, Y, Width, Height = getMiddleGuiPosition(401,316)
		Fenster[1] = guiCreateWindow(X, Y, Width, Height,"Registrieren",false)
		Bild[1] = guiCreateStaticImage(9,21,376,37,"images/header.png",false,Fenster[1])
		Label[1] = guiCreateLabel(9,49,378,16,"_______________________________________________________________________",false,Fenster[1])
		TabPanel[1] = guiCreateTabPanel(11,69,381,238,false,Fenster[1])
		Tab[1] = guiCreateTab("Daten",TabPanel[1])
		Label[2] = guiCreateLabel(10,7,300,38,"Bitte gebe hier deine richtigen Daten an!\nDas Passwort muss mindestens 6 Zeichen enthalten.",false,Tab[1])
		guiSetFont(Label[2],"default-bold-small")
		Label[4] = guiCreateLabel(11,54,119,14,"Passwort:",false,Tab[1])
		guiSetFont(Label[4],"default-bold-small")
		Edit[2] = guiCreateEdit(10,73,151,22,"",false,Tab[1])
		guiEditSetMasked(Edit[2], true)
		Label[3] = guiCreateLabel(11,96,130,14,"Passwort wiederholen:",false,Tab[1])
		guiSetFont(Label[3],"default-bold-small")
		Edit[1] = guiCreateEdit(10,115,151,22,"",false,Tab[1])
		guiEditSetMasked(Edit[1], true)
		Label[5] = guiCreateLabel(10,144,186,19,"Geburtsdatum: (TT.MM.JJJJ)",false,Tab[1])
		guiSetFont(Label[5],"default-bold-small")
		Edit[3] = guiCreateEdit(13,168,151,25,"",false,Tab[1])
		Label[6] = guiCreateLabel(175,52,189,15,"Werber: (Wenn keiner, freilassen)",false,Tab[1])
		guiSetFont(Label[6],"default-bold-small")
		Edit[4] = guiCreateEdit(181,71,163,25,"",false,Tab[1])
		Label[7] = guiCreateLabel(203,116,119,18,"Ich bin...",false,Tab[1])
		guiSetFont(Label[7],"default-bold-small")
		Radio[1] = guiCreateRadioButton(202,138,124,18,"Männlich",false,Tab[1])
		guiSetFont(Radio[1],"default-bold-small")
		Radio[2] = guiCreateRadioButton(202,158,124,18,"Weiblich",false,Tab[1])
		guiRadioButtonSetSelected(Radio[1],true)
		guiSetFont(Radio[2],"default-bold-small")
		Tab[2] = guiCreateTab("Abschliessen",TabPanel[1])
		Label[8] = guiCreateLabel(9,41,363,83,"Klicke zum Schluss auf 'Account erstellen.'\nSobald du dies getan hast, kannst du dich einloggen!\nFalls du Probleme mit dem Erstellen deines Accounts hast,\nkannst du dich an einem Admin im Forum unter\nwww.la-rl.com wenden.",false,Tab[2])
		guiLabelSetHorizontalAlign(Label[8],"center",false)
		guiSetFont(Label[8],"default-bold-small")
		Knopf[1] = guiCreateButton(124,176,126,27,"Account erstellen",false,Tab[2])
		addEventHandler("onClientGUIClick", Knopf[1], function()
			local pw1, pw2 = guiGetText(Edit[1]), guiGetText(Edit[2])
			if(pw ~= pw) or (#pw1 < 6) then outputChatBox("Dein Passwort muss mindestens 6 Zeichen enthalten und muss zweimal gleich eingetippt werden!", 255, 0, 0) return end
			local datum = guiGetText(Edit[3])
			if(datum == "") or (datum == " ") then outputChatBox("Ungültiges Geburtsdatum!", 255, 0, 0) return end
			local tag, monat, jahr = tonumber(gettok(datum, 1, ".")), tonumber(gettok(datum, 2, ".")), tonumber(gettok(datum, 3, "."))
			if not(tag) or not (monat) or not(jahr) then outputChatBox("Ungültiges Geburtsdatum!", 255, 0, 0) return end
			local birth_correct = 0
			if math.floor(tag) == tag and math.floor(monat) == monat and jahr == math.floor (jahr) then
				if tag < 32 and  tag > 0 and jahr < 2009 and jahr > 1900 and monat < 13 and monat > 0 then
					if tag < 29 then
						birth_correct = 1
					elseif (tag == 29 or tag == 30) and monat ~= 2 then
						birth_correct = 1
					elseif tag == 31 and ( monat == 1 or monat == 3 or monat == 5 or monat == 7 or monat == 8 or monat == 10 or monat == 12 ) then
						birth_correct = 1
					elseif tag == 29 and monaty == 2 and math.floor((jahr/4)) == jahr/4 then
						birth_correct = 1
					end
				else
					birth_correct = 0
				end
			else
				birth_correct = 0
			end
			if(birth_correct == 1) then
				local geschlecht = 0
				if(guiRadioButtonGetSelected(Radio[1]) == true) then
					geschlecht = 0
				else
					geschlecht = 1
				end
				local werber = guiGetText(Edit[4])
				triggerServerEvent ( "register", getLocalPlayer(), getLocalPlayer(), pw1, tag, monat, jahr, geschlecht, werber )
			else
				outputChatBox("Ungültiges Geburtsdatum!", 255, 0, 0)
			end
			
		end, false)
	end
end

function toggleBannedGui( reason, admin, date, time)
	local reason = reason
	local admin = admin
	local date = date
	local time = time
	if(Guivar[3] == 1) then
		destroyElement(Fenster[1])
		Guivar[3] = 0
	elseif(Guivar[2] == 1) then
		destroyElement(Fenster[1])
		Guivar[2] = 0	
	elseif(Guivar[1] == 1) then
		destroyElement(Fenster[1])
		Guivar[1] = 0
	else
		Guivar[3] = 1
		local X, Y, Width, Height = getMiddleGuiPosition(413,211)
		Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Information",false)
		--Bild[1] = guiCreateStaticImage(10,20,391,52,"images/header.png",false,Fenster[1])
		Label[1] = guiCreateLabel(12,20,395,36,"Du bist gebannt! Melde dich im Forum, www.la-rl.com und schreibe\neine Entbannungsanfrage und wenn nötig, eine Freischaltungsanfrage.",false,Fenster[1])
		guiSetFont(Label[1],"default-bold-small")
		Label[2] = guiCreateLabel(9,60,395,16,"_____________________________________________________________________",false,Fenster[1])
		Label[3] = guiCreateLabel(12,80,395,19,"Bann-Informationen:",false,Fenster[1])
		guiSetFont(Label[3],"default-bold-small")
		guiLabelSetColor(Label[3], 0, 150, 250)
		Label[4] = guiCreateLabel(11,100,800,19,"Du wurdest gebannt von: "..admin.."",false,Fenster[1])
		guiSetFont(Label[4],"default-bold-small")
		
		Label[5] = guiCreateLabel(11,120,800,19,"Datum: "..date.."",false,Fenster[1])
		guiSetFont(Label[5],"default-bold-small")
		
		Label[6] = guiCreateLabel(11,140,800,19,"Dauer: "..time.."",false,Fenster[1])
		guiSetFont(Label[6],"default-bold-small")

		Label[7] = guiCreateLabel(11,160,800,19,"Grund: "..reason.."",false,Fenster[1])
		guiSetFont(Label[7],"default-bold-small")
	end
end

function toggleHelpGui()
	if(Guivar[4] == 1) then
		destroyElement(Fenster[1])
		Guivar[4] = 0
	else
		Guivar[4] = 1
		local X, Y, Width, Height = getMiddleGuiPosition(413,211)
		Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Hilfe",false)
		--Bild[1] = guiCreateStaticImage(10,20,391,52,"images/header.png",false,Fenster[1])
		Label[1] = guiCreateLabel(12,20,395,36,"Verwende unten Login oder Register\num dich einzuloggen bzw. zu registrieren.",false,Fenster[1])
		guiSetFont(Label[1],"default-bold-small")
		guiLabelSetHorizontalAlign(Label[1],"center",false)
		Label[2] = guiCreateLabel(9,60,395,16,"_____________________________________________________________________",false,Fenster[1])
		Label[4] = guiCreateLabel(12,100,395,19,"Du kannst weder auf Login noch Register klicken?",false,Fenster[1])
		guiSetFont(Label[4],"default-bold-small")
		guiLabelSetHorizontalAlign(Label[4],"center",false)
		
		Label[5] = guiCreateLabel(12,120,395,19,"Tippe /newlogin um den Fehler zu beheben!",false,Fenster[1])
		guiSetFont(Label[5],"default-bold-small")
		guiLabelSetHorizontalAlign(Label[5],"center",false)
		
		Label[6] = guiCreateLabel(12,140,395,19,"Wen es immernoch nicht funktioniert, wende dich an das Forum!",false,Fenster[1])
		guiSetFont(Label[6],"default-bold-small")
		guiLabelSetHorizontalAlign(Label[6],"center",false)

		Label[7] = guiCreateLabel(12,160,395,19,"www.la-rl.com",false,Fenster[1])
		guiSetFont(Label[7],"default-bold-small")
		guiLabelSetHorizontalAlign(Label[7],"center",false)
	end
end


local function setToNextLoginCam()
	if(login_doing == true) then
		cur_cam_pos = cur_cam_pos+1
		if(cur_cam_pos > #cam_pos) then cur_cam_pos = 1 end 
		local x, y, z, x2, y2, z2 = cam_pos[cur_cam_pos][1], cam_pos[cur_cam_pos][2], cam_pos[cur_cam_pos][3], cam_pos[cur_cam_pos][4], cam_pos[cur_cam_pos][5], cam_pos[cur_cam_pos][6]
		local x3, y3, z3, x4, y4, z4 = getCameraMatrix()
		smoothMoveCamera(x3, y3, z3, x4, y4, z4, x, y, z, x2, y2, z2, 7000)
	end
end




local function enableLoginShow()
	--lp = getLocalPlayer()
	guiSetInputMode("no_binds_when_editing")
	triggerServerEvent("regcheck", getLocalPlayer(), getLocalPlayer())
	for i = 1, 30, 1 do
		outputChatBox(" ")
	end
	if(isElement(loginsound)) then
		destroyElement(loginsound)
	end
	loginsound = playSound("sounds/pianochill.mp3", true)
	login_doing = true
	
	if(isTimer(cur_cam_pos_timer)) then
		killTimer(cur_cam_pos_timer)
	end
	local rand = math.random(1, #cam_pos)
	cur_cam_pos = rand
	local x, y, z, x2, y2, z2 = cam_pos[rand][1], cam_pos[rand][2], cam_pos[rand][3], cam_pos[rand][4], cam_pos[rand][5], cam_pos[rand][6]
	setCameraMatrix(x, y, z, x2, y2, z2)
	setToNextLoginCam()
	cur_cam_pos_timer = setTimer(setToNextLoginCam, 10000, -1)
	-- BUTTONS --
	b_ele["login"] = guiCreateButton(50/1920*sx, sy-160/1080*sy, 150/1920*sx, 40/1080*sy, "login", false)
	b_ele["register"] = guiCreateButton(250/1920*sx, sy-160/1080*sy, 170/1920*sx, 40/1080*sy, "register", false)
	b_ele["help"] = guiCreateButton(500/1920*sx, sy-160/1080*sy, 150/1920*sx, 40/1080*sy, "help", false)
	guiSetAlpha(b_ele["login"], 0)
	guiSetAlpha(b_ele["register"], 0)
	guiSetAlpha(b_ele["help"], 0)
	
	addEventHandler("onClientMouseEnter", b_ele["login"], function()
		if(canlogin == true) then
			b_light["login"] = true
			playSoundFrontEnd(42)
		end
	end)
	addEventHandler("onClientMouseLeave", b_ele["login"], function()
		if(canlogin == true) then
			b_light["login"] = false
		end
	end)
	addEventHandler("onClientGUIClick", b_ele["login"], function()
		if(canlogin == true) then
			if(Guivar[1] == 1) then
				destroyElement(Fenster[1])
				Guivar[1] = 0
			elseif (Guivar[4] == 1) then
				destroyElement(Fenster[1])
				Guivar[4] = 0
			end
			toggleLoginGui()
		end
	end, false)
	
	addEventHandler("onClientMouseEnter", b_ele["register"], function()
		if(canregister == true)then
			b_light["register"] = true
			playSoundFrontEnd(42)
		end
	end)
	addEventHandler("onClientMouseLeave", b_ele["register"], function()
		if(canregister == true) then
			b_light["register"] = false		
		end
	end)
	addEventHandler("onClientGUIClick", b_ele["register"], function()
		if(canregister == true) then
			if(Guivar[2] == 1) then
				destroyElement(Fenster[1])
				Guivar[2] = 0
			elseif (Guivar[4] == 1) then
				destroyElement(Fenster[1])
				Guivar[4] = 0
			end
			toggleRegisterGui()
		end
	end, false)
	
	addEventHandler("onClientMouseEnter", b_ele["help"], function()
		b_light["help"] = true
		playSoundFrontEnd(42)
	end)
	addEventHandler("onClientMouseLeave", b_ele["help"], function()
		b_light["help"] = false
	end)
	
	addEventHandler("onClientGUIClick", b_ele["help"], function()
	if(canregister == true) then
	
	elseif(canlogin == true) then
	
	else
			if(Guivar[4] == 1) then
				destroyElement(Fenster[1])
				Guivar[4] = 0
			end
			toggleHelpGui()
	end
	end, false)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), enableLoginShow )

local function disableLoginShow()
	for index, b in next, b_ele do
		destroyElement(b)
	end
end


addEventHandler("DisableLoginWindow", getLocalPlayer(), function()
	disableLoginShow()
	killTimer(cur_cam_pos_timer)
	removeCamHandler ()
	if(Guivar[2] == 1) then
		destroyElement(Fenster[2])
		Guivar[2] = 0
	else
		destroyElement(Fenster[1])	
	end
	Guivar[1] = 0
	Guivar[2] = 0
	Guivar[3] = 0
	Guivar[4] = 0
	login_doing = false
	showCursor(false)
	setTimer ( checkForSocialStateChanges, 10000, -1 )
	setTimer ( getPlayerSocialAvailableStates, 1000, 1 )
	setTimer(function()
		for i = 1, 10, 1 do
			local v = getSoundVolume(loginsound)
			setTimer(setSoundVolume, i*100, 1, loginsound, v-0.1)
		end
		setTimer(destroyElement, 1000, 1, loginsound)
	end, 2000, 1)
end)

--enableLoginShow()

--
--[[addCommandHandler("logindoing", function()
	enableLoginShow()
end)]]