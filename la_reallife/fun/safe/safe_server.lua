--Moeglichkeiten: 10x9x8x7 = 5040
code = ""
startAmount = 25000
maxAmount = 50000
playPrice = 10
timeOut = 10
totalMoney = startAmount
prevAtt = { }
--lights = { }
function startUp()
	safeTable = createObject ( 2635, -2161.3000488281, 241.5, 34.700000762939 )
	createCode()
	--loadConfig()
end
addEventHandler( "onResourceStart", getResourceRootElement( getThisResource() ), startUp)

--[[function loadConfig()
	local xmlFile = xmlLoadFile("config.xml")
	startnode = xmlFindChild(xmlFile, "startAmount", 0)
	maxnode = xmlFindChild(xmlFile, "maxAmount", 0)
	pricenode = xmlFindChild(xmlFile, "playPrice", 0)
	timenode = xmlFindChild(xmlFile, "timeOut", 0)
	if(startnode) then
		startAmount = tonumber(xmlNodeGetValue(startnode))
		if startAmount <= 0 then
			startAmount = 250
		end
		if(maxnode) then
			maxAmount = tonumber(xmlNodeGetValue(maxnode))
			if(pricenode) then
				playPrice = tonumber(xmlNodeGetValue(pricenode))
				if(timenode) then
					timeOut = tonumber(xmlNodeGetValue(timenode))
					timeOut = timeOut * 60000
				end
			end
		end
	end
	xmlUnloadFile(xmlFile)
	totalMoney = startAmount
	createCode()
end]]

function createCode()
	numOne = math.random(0,9)
	repeat
		numTwo = math.random(0,9)
	until numTwo ~= numOne
	
	repeat
		numThree = math.random(0,9)
	until numThree ~= numOne and numThree ~= numTwo
	
	repeat
		numFour = math.random(0,9)
	until numFour ~= numOne and numFour ~= numTwo and numFour ~= numThree
	if(openSafe) then
		destroyElement( openSafe )
	end
	closedSafe = createObject ( 2332, -2161.2700195313, 241.5, 35.599998474121 )
	setObjectRotation ( closedSafe, 0, 0, 180 )
	SafeMarker = createMarker ( -2161.1999511719, 242.60000610352, 34.11, "cylinder", 2, 0, 0, 255, 150 )
	setElementData ( SafeMarker, "Safe", "Crack" )
	code = tostring(numOne)..tostring(numTwo)..tostring(numThree)..tostring(numFour)
	outputChatBox( "Der Tresor wurde mit #FFFF00"..tostring(startAmount).."$ #00FF00aufgefüllt!",getRootElement(),0,255,0,true)
end

function dataRequest()
	previousAtt = table.concat(prevAtt, ",")
	triggerClientEvent ( source, "showStartWindow", getRootElement(), playPrice, totalMoney, previousAtt )
end
addEvent( "dataRequest", true )
addEventHandler( "dataRequest", getRootElement(), dataRequest )

function codeCheck(checkCode)
	if checkCode == code then
		outputChatBox( "Du hast den Code geknackt, herzlichen Glückwunsch! Du erhältst: "..tostring(totalMoney).."$.",source,255,255,0)
		local playermoney = laGetElementData ( source, "money" )
		laSetElementData ( source, "money", playermoney + totalMoney )
		destroyElement( closedSafe )
		destroyElement( SafeMarker )
		openSafe = createObject ( 1829, 2000.6286621094, 1537.7554443359, 13.89 )
		setObjectRotation ( openSafe, 0, 0, 180 )
		setTimer( loadConfig, timeOut, 1)
		outputChatBox( "Der Tresor wurde von #FFFF00"..getPlayerName(source).." geknackt!",getRootElement(),0,255,0,true)
		outputChatBox( "Der Tresor wird in #FFFF00"..tostring(timeOut/60000).."#00FF00 Minuten erneut aufgefüllt!",getRootElement(),0,255,0,true)
	else
		outputChatBox( "Leider nicht der korrekte Code! Viel Glück beim nächsten Mal!",source,255,0,0)
		if #prevAtt == 10 then
			table.insert(prevAtt, 1 , checkCode)
			table.remove(prevAtt, 11)
		else
			table.insert(prevAtt, 1 , checkCode)
		end
	end
end
addEvent( "codeCheck", true )
addEventHandler( "codeCheck", getRootElement(), codeCheck )

function takePlayPrice()
	local playermoney = laGetElementData ( source, "money" )
	laSetElementData ( source, "money", playermoney - playPrice )
	totalMoney = totalMoney + playPrice
	if totalMoney > maxAmount then
		totalMoney = maxAmount
	end
end
addEvent( "takePlayPrice", true )
addEventHandler( "takePlayPrice", getRootElement(), takePlayPrice )

