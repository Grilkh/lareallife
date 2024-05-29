newsPaperPath = ":"..getResourceName ( getThisResource () ).."/newspaper/newspaper.la"

newspaperPickup = createPickup ( -2015.6999511719, 453.70001220703, 34.799999237061, 3, 1239, 100 )

function newspaperPickupHit ( hit )

	if getElementType ( hit ) == "player" then
		outputChatBox ( "Tippe /newspaper, um hier eine Zeitung für 10 $ zu erwerben!", hit, 0, 125, 0 )
	end
end
addEventHandler ( "onPickupHit", newspaperPickup, newspaperPickupHit )

function newspaper_func ( player )

	if laGetElementData ( player, "money" ) >= 10 then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( newspaperPickup )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			laSetElementData ( player, "newspaper", true )
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 10 )
			outputChatBox ( "Zeitung erworben - du kannst sie jetzt im Inventar benutzen!", player, 0, 125, 0 )
			
			local fraktion = fraktionNames[5]
			_G[fraktion.."Money"] = _G[fraktion.."Money"] + 10
			MySQL_SetString("fraktionen", "DepotGeld", _G[fraktion.."Money"], "Name LIKE '"..fraktion.."'")
		else
			outputChatBox ( "Du bist nicht beim Los Angeles Times Gebäude!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du hast nicht genug Geld! Eine Zeitung kostet 10 $!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "newspaper", newspaper_func )

function readnewspaper_func ( player )

	if laGetElementData ( player, "newspaper" ) then
		triggerClientEvent ( player, "showNewspaper", player, newsPaperText )
	else
		outputChatBox ( "Du hast keine Zeitung!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "readnewspaper", readnewspaper_func )

function loadnewsPaper()

	local newsPaper = fileOpen ( newsPaperPath, false )
	local filesize = fileGetSize ( newsPaper )
	newsPaperText = fileRead ( newsPaper, filesize )
	if not newsPaperText then
		newsPaperText = ""
	end
	fileClose ( newsPaper )
end
loadnewsPaper()

function edit_func ( player )

	if isReporter ( player ) and laGetElementData ( player, "rang" ) >= 3 then
		triggerClientEvent ( player, "showNewspaperReporter", player, newsPaperText )
	else
		outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "edit", edit_func )

function redoNewspaperServer_func ( text )

	if source == client then
		laSetElementData ( getRootElement(), "newspaper", false )
		newsPaperText = text
		fileDelete ( newsPaperPath )
		local newsPaper = fileCreate ( newsPaperPath )
		fileWrite ( newsPaper, text )
		fileClose ( newsPaper )
		outputServerLog ( getPlayerName(source).." hat die Zeitung editiert." )
		outputChatBox ( "Du hast die Zeitung neu geschrieben!", source, 0, 125, 0 )
	end
end
addEvent ( "redoNewspaperServer", true )
addEventHandler  ( "redoNewspaperServer", getRootElement(), redoNewspaperServer_func )