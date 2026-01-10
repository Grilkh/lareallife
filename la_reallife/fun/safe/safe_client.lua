code = ""
currentPos = 1
usedNumbers = { }
prevAtt = {" "," "," "," "," "," "," "," "," "," "}
money = 0
payPrice = 0
local screenWidth, screenHeight = guiGetScreenSize()

function showStartWindow(price,safe,attempts)
	updateAtt = split(attempts, string.byte(', '))
	for i, attCode in pairs( updateAtt ) do
	table.remove(prevAtt,i)
	table.insert(prevAtt,i, tostring(attCode) )
	end
	startWindow = guiCreateWindow(screenWidth/2.6, screenHeight/3.5, 200, 300, "Knack den Tresor!", false)
	safelabel1 = guiCreateLabel(1, 20, 200, 20, "Herzlich willkommen!", false, startWindow)
	safelabel2 = guiCreateLabel(1, 35, 200, 20, "Um mitzumachen,", false, startWindow)
	safelabel3 = guiCreateLabel(1, 50, 200, 20, "musst du: "..tostring(price).."$ bezahlen.", false, startWindow)
	safelabel4 = guiCreateLabel(1, 80, 200, 20, "Zurzeit im Tresor: ", false, startWindow)
	info = guiCreateLabel(40, 140, 175, 20, "Die letzten 10 Codes:", false, startWindow)
	guiLabelSetHorizontalAlign(safelabel1,"center",false)
	guiLabelSetHorizontalAlign(safelabel2,"center",false)
	guiLabelSetHorizontalAlign(safelabel3,"center",false)
	guiLabelSetHorizontalAlign(safelabel4,"center",false)
	line1 = guiCreateLabel(57.5, 160, 175, 20, prevAtt[1].."        "..prevAtt[6], false, startWindow)
	line2 = guiCreateLabel(57.5, 175, 175, 20, prevAtt[2].."        "..prevAtt[7], false, startWindow)
	line3 = guiCreateLabel(57.5, 190, 175, 20, prevAtt[3].."        "..prevAtt[8], false, startWindow)
	line4 = guiCreateLabel(57.5, 205, 175, 20, prevAtt[4].."        "..prevAtt[9], false, startWindow)
	line5 = guiCreateLabel(57.5, 220, 175, 20, prevAtt[5].."        "..prevAtt[10], false, startWindow)
	guiLabelSetColor(info,255,0,0)
	guiLabelSetColor(line1,255,0,0)
	guiLabelSetColor(line2,255,0,0)
	guiLabelSetColor(line3,255,0,0)
	guiLabelSetColor(line4,255,0,0)
	guiLabelSetColor(line5,255,0,0)
	btnPay = guiCreateButton(20, 245, 65, 40, "Spielen", false, startWindow)
	btnNo = guiCreateButton(115, 245, 65, 40, "Abbrechen", false, startWindow)
	money = safe
	payPrice = price
	addEventHandler("onClientRender",getRootElement(), safeMoney)
	showCursor ( true )
	addEventHandler("onClientGUIClick", btnPay, btnPayClick, false)
	addEventHandler("onClientGUIClick", btnNo, btnNoClick, false)
end
addEvent( "showStartWindow", true )
addEventHandler( "showStartWindow", getRootElement(), showStartWindow )



function safeMoney ()
	len = string.len(tostring(money))
    dxDrawText( ""..tostring(money).."$", screenWidth/2.2-len*2.5, screenHeight/2.38, screenWidth, screenHeight, tocolor ( 0, 128, 0, 255 ), 1.05, "pricedown", "left" , "top", false, false, true )    -- Draw Zone Name text shadow.
    dxDrawText( ""..tostring(money).."$", screenWidth/2.2-len*2.5, screenHeight/2.4, screenWidth, screenHeight, tocolor ( 0, 255, 0, 255 ), 1, "pricedown", "left" , "top", false, false, true  ) -- Draw Zone Name text.
end

function showKeyPad()
	showCursor ( true )
	keyPadImage = guiCreateStaticImage( screenWidth/2.55, screenHeight/3.5, 225, 325, "images/safe/keypad.png", false)
	keyPad = guiCreateWindow(screenWidth/2.6, screenHeight/3.5, 225, 325, "Key Pad", false)
	guiWindowSetSizable ( keyPad, false )
	firstBlank = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	secondBlank = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	thirdBlank = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	fourthBlank = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	digiOne = firstBlank
	digiTwo = secondBlank
	digiThree = thirdBlank
	digiFour = fourthBlank
	btnOne = guiCreateButton(20, 112.5, 57.5, 40, "1", false, keyPad)
	btnTwo = guiCreateButton(85, 112.5, 57.5, 40, "2", false, keyPad)
	btnThree = guiCreateButton(145, 112.5, 57.5, 40, "3", false, keyPad)
	btnFour = guiCreateButton(20, 160, 57.5, 40, "4", false, keyPad)
	btnFive = guiCreateButton(85, 160, 57.5, 40, "5", false, keyPad)
	btnSix = guiCreateButton(145, 160, 57.5, 40, "6", false, keyPad)
	btnSeven = guiCreateButton(20, 210, 57.5, 40, "7", false, keyPad)
	btnEight = guiCreateButton(85, 210, 57.5, 40, "8", false, keyPad)
	btnNine = guiCreateButton(145, 210, 57.5, 40, "9", false, keyPad)
	btnClear = guiCreateButton(20, 260, 57.5, 40, "Clr", false, keyPad)
	btnZero = guiCreateButton(85, 260, 57.5, 40, "0", false, keyPad)
	btnEnter = guiCreateButton(145, 260, 57.5, 40, "Ent", false, keyPad)
	btnExit = guiCreateButton(187, 22.5, 20, 20, "X", false, keyPad)
	guiSetAlpha ( keyPad, 0 )
	
	addEventHandler("onClientGUIClick", btnOne, btnOneClick, false)
	addEventHandler("onClientGUIClick", btnTwo, btnTwoClick, false)
	addEventHandler("onClientGUIClick", btnThree, btnThreeClick, false)
	addEventHandler("onClientGUIClick", btnFour, btnFourClick, false)
	addEventHandler("onClientGUIClick", btnFive, btnFiveClick, false)
	addEventHandler("onClientGUIClick", btnSix, btnSixClick, false)
	addEventHandler("onClientGUIClick", btnSeven, btnSevenClick, false)
	addEventHandler("onClientGUIClick", btnEight, btnEightClick, false)
	addEventHandler("onClientGUIClick", btnNine, btnNineClick, false)
	addEventHandler("onClientGUIClick", btnClear, btnClearClick, false)
	addEventHandler("onClientGUIClick", btnZero, btnZeroClick, false)
	addEventHandler("onClientGUIClick", btnEnter, btnEnterClick, false)
	addEventHandler("onClientGUIClick", btnExit, btnExitClick, false)
end

function isNumUsed(number)
	if usedNumbers then
		for i, nums in pairs( usedNumbers ) do
			if ( number == nums) then
			outputChatBox( "Du kannst keine Nummer doppelt wählen!",255,0,0)
			return true
			end
		end
	else
		return false
	end
end

function btnOneClick()
	local num = "1"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnTwoClick()
	local num = "2"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnThreeClick()
	local num = "3"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnFourClick()
	local num = "4"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnFiveClick()
	local num = "5"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnSixClick()
	local num = "6"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnSevenClick()
	local num = "7"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnEightClick()
	local num = "8"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnNineClick()
	local num = "9"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnClearClick()
	code = ""
	currentPos = 1
	usedNumbers = { }
	destroyElement( firstNumber )
	destroyElement( secondNumber )
	destroyElement( thirdNumber )
	destroyElement( fourthNumber )
	firstBlank = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	secondBlank = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	thirdBlank = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	fourthBlank = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/_.png", false)
	digiOne = firstBlank
	digiTwo = secondBlank
	digiThree = thirdBlank
	digiFour = fourthBlank
end

function btnZeroClick()
	local num = "0"
	if currentPos < 5 then
		if not isNumUsed(num) then
			code = code..num
			if currentPos == 1 then
				firstNumber = guiCreateStaticImage( screenWidth/2.35, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( firstBlank )
				digiOne = firstNumber
				table.insert(usedNumbers, num)
				currentPos = 2
	
			elseif currentPos == 2 then
				secondNumber = guiCreateStaticImage( screenWidth/2.25, screenHeight/2.80, 20, 37.5,"images/safe/"..num..".png", false)
				destroyElement( secondBlank )
				digiTwo = secondNumber
				table.insert(usedNumbers, num)
				currentPos = 3
	
			elseif currentPos == 3 then
				thirdNumber = guiCreateStaticImage( screenWidth/2.15, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( thirdBlank )
				digiThree = thirdNumber
				table.insert(usedNumbers, num)
				currentPos = 4
	
			elseif currentPos == 4 then
				fourthNumber = guiCreateStaticImage( screenWidth/2.07, screenHeight/2.80, 20, 37.5, "images/safe/"..num..".png", false)
				destroyElement( fourthBlank )
				digiFour = fourthNumber
				currentPos = 5
			end
		end
	end
end

function btnEnterClick()
	if string.len(code) ~= 4 then
		outputChatBox( "Du hast nicht 4 Zahlen ausgewählt!",255,0,0)
	else
	triggerServerEvent ( "codeCheck", getLocalPlayer(), code )
	showCursor ( false )
	destroyElement( keyPad )
	destroyElement( keyPadImage)
	code = ""
	currentPos = 1
	usedNumbers = { }
	destroyElement( digiOne )
	destroyElement( digiTwo )
	destroyElement( digiThree )
	destroyElement( digiFour )
	end
end

function btnExitClick()
	showCursor ( false )
	destroyElement( keyPad )
	destroyElement( keyPadImage)
	code = ""
	currentPos = 1
	usedNumbers = { }
	destroyElement( digiOne )
	destroyElement( digiTwo )
	destroyElement( digiThree )
	destroyElement( digiFour )
end

function btnPayClick()
	local cash = getElementData ( getLocalPlayer(), "money" )
	if payPrice <= cash then
		triggerServerEvent ( "takePlayPrice", getLocalPlayer())
		destroyElement(startWindow)
		showKeyPad()
		removeEventHandler("onClientRender", getRootElement(), safeMoney)
	else
		outputChatBox( "Du brauchst mindestens 50$ um mitzuspielen!",255,0,0)
		removeEventHandler("onClientRender", getRootElement(), safeMoney)
		destroyElement(startWindow)
		showCursor ( false )
	end
end

function btnNoClick()
	removeEventHandler("onClientRender", getRootElement(), safeMoney)
	destroyElement(startWindow)
	showCursor ( false )
end

function marker_hit( hitPlayer, matchingDimension )
	if (hitPlayer == getLocalPlayer()) and (isPedOnGround ( getLocalPlayer())) then
		if (getElementData ( source, "Safe" ) == "Crack" ) then
			triggerServerEvent ( "dataRequest", getLocalPlayer())
		end
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), marker_hit)