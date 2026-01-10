maxPlayersOnServer = 100

function tabPressed ( key, state )
	
	if state == "down" then
		showNewPlist ()
	else
		guiSetVisible ( gWindow["plist"], false )
	end
end
--bindKey ( "tab", "both", tabPressed )
--[[
function plistTabShow_func ()

	if gWindow["plist"] then
		guiSetVisible ( gWindow["plist"], true )
		fill_plistTab()
	else
		gWindow["plist"] = guiCreateWindow(screenwidth/2-463/2,screenheight/2-514/2,463,514,"Spielerliste - 0/"..maxPlayersOnServer,false)
		guiSetAlpha ( gWindow["plist"], 1 )
		
		for i = 1, 32 do
			_G["gLabelPlayer"..i] = guiCreateLabel ( 0.0259,0.062+(0.9066/32*(i))-0.0545,0.2376,(0.9066/32), "", true, gWindow["plist"] )
		end
		for i = 33, 64 do
			_G["gLabelPlayer"..i] = guiCreateLabel ( 0.2678,0.062+(0.9066/32*(i)-0.9066)-0.0545,0.2376,(0.9066/32), "", true, gWindow["plist"] )
		end
		for i = 65, 96 do
			_G["gLabelPlayer"..i] = guiCreateLabel ( 0.5119,0.062+(0.9066/32*(i)-0.9066*2)-0.0545,0.2376,(0.9066/32), "", true, gWindow["plist"] )
		end
		for i = 97, 128 do
			_G["gLabelPlayer"..i] = guiCreateLabel ( 0.7538,0.062+(0.9066/32*(i)-0.9066*3)-0.0545,0.2376,(0.9066/32), "", true, gWindow["plist"] )
		end
		fill_plistTab()
	end
end
addEvent ( "plistTabShow", true )
addEventHandler ( "plistTabShow", getRootElement(), plistTabShow_func )
]]
function showNewPlist ()

	if gWindow["plist"] then
		guiSetVisible ( gWindow["plist"], true )
	else
		gWindow["plist"] = guiCreateWindow(screenwidth/2-650/2,screenheight/2-520/2,650,520,"Spielerliste",false)
		guiSetAlpha(gWindow["plist"],1)
		
		for k = 1, 4 do
			for i = 1, 32 do
				gLabel["player"..i.."|"..k] = guiCreateLabel(10+(k-1)*160,24+(i-1)*15,75,13,"",false,gWindow["plist"])
				gLabel["rank"..i.."|"..k] = guiCreateLabel(90+(k-1)*160,24+(i-1)*15,75,13,"",false,gWindow["plist"])
				guiLabelSetColor ( gLabel["rank"..i.."|"..k], 200, 200, 0 )
				setElementAlpha ( gLabel["player"..i.."|"..k], 1 )
				setElementAlpha ( gLabel["rank"..i.."|"..k], 1 )
				guiSetFont(gLabel["player"..i.."|"..k],"default-small")
				guiSetFont(gLabel["rank"..i.."|"..k],"default-small")
			end
		end
	end
	fill_plistTabNew()
end

function fill_plistTabNew()

	local count = 0
	factionMembers = nil
	factionMembers = {}
	for i = -1, factioncount do
		factionMembers[i] = {}
	end
	for id, player in pairs(getElementsByType("player")) do
		if getElementData ( player, "loggedin" ) == 1 then
			if not factionMembers[getElementData(player,"fraktion")] then
				factionMembers[getElementData(player,"fraktion")] = {}
			end
			table.insert ( factionMembers[getElementData(player,"fraktion")], player )
		else
			table.insert ( factionMembers[-1], player )
		end
	end
	
	for k = 1, 4 do
		for i = 1, 32 do
			guiSetText ( gLabel["player"..i.."|"..k], "" )
			guiSetText ( gLabel["rank"..i.."|"..k], "" )
			guiLabelSetColor ( gLabel["player"..i.."|"..k], 255, 255, 255 )
		end
	end
	
	k = 1
	h = 1
	for i = -1, 8 do
		for key, player in pairs ( factionMembers[i] ) do
			socialState = getElementData ( player, "socialState" )
			if not socialState then
				socialState = "Verbinden..."
			end
			guiSetText ( gLabel["player"..h.."|"..k], getPlayerName ( player ) )
			guiLabelSetColor ( gLabel["player"..h.."|"..k], factionColors[i][1], factionColors[i][2], factionColors[i][3] )
			guiSetText ( gLabel["rank"..h.."|"..k], socialState )
			count = count + 1
			h = h + 1
			if h > 32 then
				h = 1
				k = k + 1
			end
		end
	end
	guiSetText ( gWindow["plist"], "Spielerliste - "..count.."/"..maxPlayersOnServer )
end
--[[
function fill_plistTab()

	local count = 0
	for i = 1, 128 do
		guiSetText(_G["gLabelPlayer"..i],"")
		guiLabelSetColor ( _G["gLabelPlayer"..i], 255, 255, 255 )
	end
	for id, playeritem in ipairs(getElementsByType("player")) do 
		count = count + 1
		guiSetText ( _G["gLabelPlayer"..count], getPlayerName(playeritem) )
		if getElementData ( playeritem, "playingtime" ) then
			if getElementData ( playeritem, "playingtime" ) <= 180 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 255, 150, 150 )
			end
		else
			guiLabelSetColor ( _G["gLabelPlayer"..count], 255, 255, 255 )
		end
		if getElementData ( playeritem, "loggedin" ) == 1 then
			local fraktion = getElementData ( playeritem, "fraktion" )
			if fraktion == 1 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 20, 150, 0 )
			elseif fraktion == 2 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 50, 50, 0 )
			elseif fraktion == 3 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 20, 50, 100 )
			elseif fraktion == 4 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 125, 0, 0 )
			elseif fraktion == 5 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 180, 130, 0 )
			elseif fraktion == 6 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 125, 125, 200 )
			elseif fraktion == 7 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 150, 150, 0 )
			elseif fraktion == 8 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 0, 255, 0 )
			elseif fraktion == 9 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 0, 50, 0 )
			elseif fraktion == 10 then
				guiLabelSetColor ( _G["gLabelPlayer"..count], 50, 0, 50 )
			end
		else
			guiLabelSetColor ( _G["gLabelPlayer"..count], 150, 150, 150 )
		end
	end
	guiSetText ( gWindow["plist"], "Spielerliste - "..count.."/"..maxPlayersOnServer )
end]]