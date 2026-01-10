------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

--[[function refreshSavety ()

	if guiGetVisible ( gWindow["register"] ) then
		local pw = guiGetText ( gEdit["passwort_register"] )
		safety = # pw
		if safety >= 10 then
			safety = 50
		elseif safety >= 7 then
			safety = 30
		else
			safety = 10
		end
		if tonumber ( pw ) then	
			safety = safety
		else
			safety = safety + 25
		end
		if pw ~= "123456" then
			safety = safety + 25
		end
		if # pw < 6 then
			safety = 0
		end
		guiProgressBarSetProgress ( gProgress["password"], safety )
		setTimer ( refreshSavety, 250, 1 )
	end
end

function SubmitRegisterBtn(button)
	
	if button == "left" then
		local pname = getPlayerName ( lp )
		local passwort = guiGetText ( gEdit["passwort_register"] )
		local pwlaenge = #passwort
		if guiGetText ( gEdit["passwort_register2"] ) ~= passwort then
			outputChatBox ( "Die beiden Passwörter stimmen nicht überein!", 125, 0, 0 )
		elseif pwlaenge < 6 or passwort == "******" or passwort == pname or passwort == "123456" then
			outputChatBox ("Fehler: Ungültiges Passwort", 255, 0 ,0 )
		else
			local birth_correct = 0
			bday = tonumber(guiGetText ( gEdit["registerDay"] ))
			bmon = tonumber(guiGetText ( gEdit["registerMonth"] ))
			byear = tonumber(guiGetText ( gEdit["registerYear"] ))
			if math.floor(bday) == bday and math.floor(bmon) == bmon and byear == math.floor (byear) then
				if bday < 32 and  bday > 0 and byear < 2009 and byear > 1900 and bmon < 13 and bmon > 0 then
					if bday < 29 then
						birth_correct = 1
					elseif (bday == 29 or bday == 30) and bmon ~= 2 then
						birth_correct = 1
					elseif bday == 31 and ( bmon == 1 or bmon == 3 or bmon == 5 or bmon == 7 or bmon == 8 or bmon == 10 or bmon == 12 ) then
						birth_correct = 1
					elseif bday == 29 and bmony == 2 and math.floor((byear/4)) == byear/4 then
						birth_correct = 1
					end
				else
					birth_correct = 0
				end
			else
				birth_correct = 0
			end
			if birth_correct == 1 then
				if guiRadioButtonGetSelected(gRadio["male"]) == true then
					geschlecht = 0
				else
					geschlecht = 1
				end
				player = lp
				triggerServerEvent ( "register", lp, player, passwort, bday, bmon, byear, geschlecht )
			else
				outputChatBox ("Fehler: Ungültiges Geburtsdatum!", 255, 0 , 0 )
			end
		end
	end
end

function showRegisterGui_func ()

	gWindow["register"] = guiCreateWindow(screenwidth/2-818/2,screenheight/2-491/2,818,491,"Registrierungsformular",false)
	guiSetAlpha(gWindow["register"],1)
	
	showCursor ( true )
	
	-- Texte --
	gLabel[1] = guiCreateLabel(8,182,798,45,"Herzlich willkommen auf Los Angeles Reallife! Um mitspielen zu können, musst du dich zuerst registrieren.\nSobald du das gemacht hast, kannst du an unserer grossartigen Community teilhaben und gemeinsam mit anderen Spielern Abenteuer erleben!\nWelcome to Los Angeles Reallife! First, you have to register your account!",false,gWindow["register"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],255,255,255)
	guiLabelSetHorizontalAlign(gLabel[1],"center",false)
	gLabel[5] = guiCreateLabel(11,273,255,43,"Geburtsdatum (date of birth):",false,gWindow["register"])
	guiSetAlpha(gLabel[5],1)
	guiLabelSetColor(gLabel[5],0,0,200)
	guiSetFont(gLabel[5],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[5],"center",false)
	gLabel[6] = guiCreateLabel(11,412,190,43,"Geschlecht (sex):",false,gWindow["register"])
	guiSetAlpha(gLabel[6],1)
	guiLabelSetColor(gLabel[6],0,0,200)
	guiSetFont(gLabel[6],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[6],"center",false)
	gLabel[66] = guiCreateLabel(11,462,230,43,"Mehr Infos / More info: www.la-rl.com",false,gWindow["register"])
	guiSetAlpha(gLabel[66],1)
	guiLabelSetColor(gLabel[66],0,200,0)
	guiSetFont(gLabel[66],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[6],"center",false)
	if isWithinNightTime () then
		img = "header_night.png"
	else
		img = "header.png"
	end
	gImage[1] = guiCreateStaticImage(9,22,800,151,"images/"..img,false,gWindow["register"])
	guiSetAlpha(gImage[1],1)
	gLabel[7] = guiCreateLabel(412,273,169,33,"(DD, MM, JJJJ)",false,gWindow["register"])
	guiSetAlpha(gLabel[7],1)
	guiLabelSetColor(gLabel[7],255,255,255)
	guiLabelSetVerticalAlign(gLabel[7],"center")
	guiSetFont(gLabel[7],"default-bold-small")
	gLabel[8] = guiCreateLabel(11,319,182,43,"Passwort (password):",false,gWindow["register"])
	guiSetAlpha(gLabel[8],1)
	guiLabelSetColor(gLabel[8],255,0,0)
	guiSetFont(gLabel[8],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[8],"center")
	gLabel[9] = guiCreateLabel(11,362,265,43,"Passwort wdh (rep. password):",false,gWindow["register"])
	guiSetAlpha(gLabel[9],1)
	guiLabelSetColor(gLabel[9],255,0,0)
	guiSetFont(gLabel[9],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[9],"center")
	gLabel[13] = guiCreateLabel(11,230,212,43,"Dein Name (Your nickname):",false,gWindow["register"])
	guiSetAlpha(gLabel[13],1)
	guiLabelSetColor(gLabel[13],200,200,0)
	guiSetFont(gLabel[13],"default-bold-small")
	guiLabelSetVerticalAlign(gLabel[13],"center")
	gLabel[14] = guiCreateLabel(228,230,174,29,getPlayerName(lp),false,gWindow["register"])
	guiSetAlpha(gLabel[14],1)
	guiLabelSetColor(gLabel[14],255,255,255)
	guiLabelSetVerticalAlign(gLabel[14],"center")
	guiSetFont(gLabel[14],"clear-normal")
	gLabel[15] = guiCreateLabel(412,230,364,33,"Veränderbar unter MTA-Settings (changeable in settings)",false,gWindow["register"])
	guiSetAlpha(gLabel[15],1)
	guiLabelSetColor(gLabel[15],255,255,255)
	guiLabelSetVerticalAlign(gLabel[15],"center")
	guiSetFont(gLabel[15],"default-bold-small")
	gLabel[16] = guiCreateLabel(451,319,189,33,"mind. 6 Zeichen (6+ characters)",false,gWindow["register"])
	guiSetAlpha(gLabel[16],1)
	guiLabelSetColor(gLabel[16],255,255,255)
	guiLabelSetVerticalAlign(gLabel[16],"center")
	guiSetFont(gLabel[16],"default-bold-small")
	gLabel[17] = guiCreateLabel(526,362,169,33,"PW wiederholen (repeat PW)",false,gWindow["register"])
	guiSetAlpha(gLabel[17],1)
	guiLabelSetColor(gLabel[17],255,255,255)
	guiLabelSetVerticalAlign(gLabel[17],"center")
	guiSetFont(gLabel[17],"default-bold-small")
	
	-- Buttons --
	gButtons["register"] = guiCreateButton(388,413,421,69,"Los Angeles betreten!\nJoin Los Angeles!",false,gWindow["register"])
	guiSetAlpha(gButtons["register"],1)
	guiSetFont(gButtons["register"],"default-bold-small")
	
	gEdit["passwort_register"] = guiCreateEdit(151,325,240,33,"",false,gWindow["register"])
	guiSetAlpha(gEdit["passwort_register"],1)
	guiEditSetMasked ( gEdit["passwort_register"], true )
	gEdit["passwort_register2"] = guiCreateEdit(207,368,240,33,"",false,gWindow["register"])
	guiSetAlpha(gEdit["passwort_register2"],1)
	guiEditSetMasked ( gEdit["passwort_register2"], true )
	
	gRadio["male"] = guiCreateRadioButton(137,425,120,23,"Männlich (male)",false,gWindow["register"])
	guiSetAlpha(gRadio["male"],1)
	guiLabelSetVerticalAlign(gRadio["male"],"center")
	guiSetFont(gRadio["male"],"default-bold-small")
	gRadio["female"] = guiCreateRadioButton(252,425,1200,23,"Weiblich (female)",false,gWindow["register"])
	guiSetAlpha(gRadio["female"],1)
	guiLabelSetVerticalAlign(gRadio["female"],"center")
	guiSetFont(gRadio["female"],"default-bold-small")
	guiRadioButtonSetSelected(gRadio["male"],true)
	
	gEdit["registerDay"] = guiCreateEdit(220,279,40,34,"",false,gWindow["register"])
	guiSetAlpha(gEdit["registerDay"],1)
	gEdit["registerMonth"] = guiCreateEdit(262,279,40,34,"",false,gWindow["register"])
	guiSetAlpha(gEdit["registerMonth"],1)
	gEdit["registerYear"] = guiCreateEdit(304,279,48,34,"",false,gWindow["register"])
	guiSetAlpha(gEdit["registerYear"],1)
	addEventHandler("onClientGUIClick", gButtons["register"], SubmitRegisterBtn, false)

	setTimer ( refreshSavety, 250, 1 )
end
addEvent ( "ShowRegisterGui", true)
addEventHandler ( "ShowRegisterGui", getRootElement(), showRegisterGui_func )

function GUI_DisableRegisterGui()

	cancelCameraIntro ()
	destroyElement ( gWindow["register"] )
	showCursor ( false )
	removeEventHandler ( "onClientRender", getRootElement(), showVersionInfo )
	destroyElement ( gImage["versionInfoDraw1"] )
	destroyElement ( gImage["versionInfoDraw2"] )
	killTimer ( LVCamFlightTimer )
end
addEvent ( "DisableRegisterGui", true )
addEventHandler ( "DisableRegisterGui", getRootElement(), GUI_DisableRegisterGui)
]]--

function showBeginGui_func ()
if getElementData ( player, "sprache" ) == "Deutsch" then
	gWindow["welcomeInfo"] = guiCreateWindow(screenwidth/2-429/2,screenheight/2-280/2,429,280, "Fast geschafft!",false)
	guiSetAlpha(gWindow["welcomeInfo"],1)
	gLabel["anfangsText"] = guiCreateLabel(11,22,411,52,"Hiermit hast du das Tutorial erfolgreich abgeschlossen!\nNun empfehlen wir dir, zuerst in das Hilfemenü (Shortcut F1) einzusehen.\n Darin findest du hilfreiche Tipps, die Serverregeln und weitere Infos.",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsText"],1)
	guiLabelSetHorizontalAlign(gLabel["anfangsText"],"center",false)
	gLabel["anfangsText1"] = guiCreateLabel(11,75,411,52,"Viel Spass auf LA!",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsText1"],1)
	guiLabelSetHorizontalAlign(gLabel["anfangsText1"],"center",false)
	guiLabelSetColor(gLabel["anfangsText1"],150,0,0)
	guiSetFont(gLabel["anfangsText1"],"sa-header")
	gButton["HelmenueOpen"] = guiCreateButton(11,132,409,38,"Hilfemenü aufrufen",false,gWindow["welcomeInfo"])
	guiSetAlpha(gButton["HelmenueOpen"],1)
	guiSetFont(gButton["HelmenueOpen"],"sa-header")
	--gButton["closeAnfangsWindow"] = guiCreateButton(11,178,409,38,"Fenster schliessen",false,gWindow["welcomeInfo"])
	--guiSetAlpha(gButton["closeAnfangsWindow"],1)
	--guiSetFont(gButton["closeAnfangsWindow"],"sa-header")
	gLabel["anfangsPS"] = guiCreateLabel(11,178,411,52,"weitere Infos:",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsPS"],1)
	guiLabelSetColor(gLabel["anfangsPS"],0,150,0)
	guiLabelSetHorizontalAlign(gLabel["anfangsPS"],"center",false)
	guiSetFont(gLabel["anfangsPS"],"sa-header")
	gLabel["anfangsAdresse"] = guiCreateLabel(11,217,411,52,"www.la-rl.com",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsAdresse"],1)
	guiLabelSetColor(gLabel["anfangsAdresse"],0,0,200)
	guiLabelSetHorizontalAlign(gLabel["anfangsAdresse"],"center",false)
	guiSetFont(gLabel["anfangsAdresse"],"sa-gothic")
	addEventHandler("onClientGUIClick", gButton["HelmenueOpen"], SubmitOpenHelpMenueBtn, false)
--	addEventHandler("onClientGUIClick", gButton["closeAnfangsWindow"], SubmitCloseThisWindowBtn, false)
else
	gWindow["welcomeInfo"] = guiCreateWindow(screenwidth/2-429/2,screenheight/2-280/2,429,280, "Almost there!",false)
	guiSetAlpha(gWindow["welcomeInfo"],1)
	gLabel["anfangsText"] = guiCreateLabel(11,22,411,52,"You've successfully completed the tutorial!\nFirst, take a look in the Helpmenu(shortcut F1).\nThere are helpful tips, the server rules and other information.",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsText"],1)
	guiLabelSetHorizontalAlign(gLabel["anfangsText"],"center",false)
	gLabel["anfangsText1"] = guiCreateLabel(11,75,411,52,"Have fun in LA!",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsText1"],1)
	guiLabelSetHorizontalAlign(gLabel["anfangsText1"],"center",false)
	guiLabelSetColor(gLabel["anfangsText1"],150,0,0)
	guiSetFont(gLabel["anfangsText1"],"sa-header")
	gButton["HelmenueOpen"] = guiCreateButton(11,132,409,38,"Help menu",false,gWindow["welcomeInfo"])
	guiSetAlpha(gButton["HelmenueOpen"],1)
	guiSetFont(gButton["HelmenueOpen"],"sa-header")
	--gButton["closeAnfangsWindow"] = guiCreateButton(11,178,409,38,"Close window",false,gWindow["welcomeInfo"])
	--guiSetAlpha(gButton["closeAnfangsWindow"],1)
	--guiSetFont(gButton["closeAnfangsWindow"],"sa-header")
	gLabel["anfangsPS"] = guiCreateLabel(11,178,411,52,"More information:",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsPS"],1)
	guiLabelSetColor(gLabel["anfangsPS"],0,150,0)
	guiLabelSetHorizontalAlign(gLabel["anfangsPS"],"center",false)
	guiSetFont(gLabel["anfangsPS"],"sa-header")
	gLabel["anfangsAdresse"] = guiCreateLabel(11,217,411,52,"www.la-rl.com",false,gWindow["welcomeInfo"])
	guiSetAlpha(gLabel["anfangsAdresse"],1)
	guiLabelSetColor(gLabel["anfangsAdresse"],0,0,200)
	guiLabelSetHorizontalAlign(gLabel["anfangsAdresse"],"center",false)
	guiSetFont(gLabel["anfangsAdresse"],"sa-gothic")
	addEventHandler("onClientGUIClick", gButton["HelmenueOpen"], SubmitOpenHelpMenueBtn, false)
	--addEventHandler("onClientGUIClick", gButton["closeAnfangsWindow"], SubmitCloseThisWindowBtn, false)
end
end
addEvent ( "showBeginGui", true )
addEventHandler ( "showBeginGui", getRootElement(), showBeginGui_func )

function SubmitCloseThisWindowBtn ( lp )

	guiSetVisible ( gWindow["welcomeInfo"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", lp )
	if getElementData ( getLocalPlayer(), "sprache" ) == "Deutsch" then
		outputChatBox ( "Am Besten gehst du zu Beginn zum Bulldozer-Icon um einen Job anzunehmen!", getLocalPlayer(), 0, 150, 0 )
	else
		outputChatBox ( "First, you've to go to the Bulldozer-Icon to accept a job!", getLocalPlayer(), 0, 150, 0 )
	end
end
function SubmitOpenHelpMenueBtn ( lp )

	guiSetVisible ( gWindow["welcomeInfo"], false )
	_CreateHelpmenueGui()
	if getElementData ( getLocalPlayer(), "sprache" ) == "Deutsch" then
		outputChatBox ( "Am Besten gehst du zu Beginn zum Bulldozer-Icon um einen Job anzunehmen!", 0, 150, 0 )
	else
		outputChatBox ( "First, you've to go to the Bulldozer-Icon to accept a job!", 0, 150, 0 )
	end
end