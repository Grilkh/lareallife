allTeam = createTeam ( "ChatTeam", 255, 255, 255 )

function playerJoinTeam ()

	setPlayerTeam ( source, allTeam )
end
addEventHandler ( "onPlayerJoin", getRootElement(), playerJoinTeam )

function chatAble ( player )
	
	if laGetElementData ( player, "loggedin" ) == 1 and not isPedDead ( player ) then
		return true
	end
	return false
end

function sendMessageToNearbyPlayers ( message, messageType )

	local pname = getPlayerName ( source )
	
	if messageType == 0 and chatAble ( source ) then
		if tonumber(laGetElementData ( source, "muted" )) == 0 then
			local posX, posY, posZ = getElementPosition( source )
			local chatSphere = createColSphere( posX, posY, posZ, 10 )
			local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
			destroyElement( chatSphere )
			if laGetElementData ( source, "isLive" ) then
				if isReporter ( source ) then name = "Reporter "..getPlayerName(source).." : " else name = "Gast "..getPlayerName(source).." : " end
				outputChatBox ( name..message, getRootElement(), 200, 150, 0 )
			else
				local x1, y1, z1 = getElementPosition ( source )
				for i = 1, 3 do
					if _G["Wanze"..i] then
						local x2, y2, z2 = getElementPosition ( _G["Wanze"..i] )
						local x3, y3, z3 = getElementPosition ( FederalSecuricar )
						local x4, y4, z4 = getElementPosition ( FederalSecuricar1 )
						local distance = getDistanceBetweenPoints3D ( x1,y1,z1,x2,y2,z2 )
						if distance then
							if distance <= 10 then
								if getDistanceBetweenPoints3D ( x3, y3, z3, x2, y2, z2 ) <= wanzenrange then
									local msg = "[Wanze "..i.."]: "..getPlayerName(source)..": "..message
									sendMSGToSecuricar ( msg )
								elseif getDistanceBetweenPoints3D ( x4, y4, z4, x2, y2, z2 ) <= wanzenrange then
									local msg = "[Wanze "..i.."]: "..getPlayerName(source)..": "..message
									sendMSGToSecuricar1 ( msg )
								end
							end
						end
					end
				end
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do
					local x2, y2, z2 = getElementPosition ( nearbyPlayer )
					local distance = getDistanceBetweenPoints3D ( x1,y1,z1,x2,y2,z2 )
					local rgb = 15 * distance - 125
					local rgb = math.abs ( rgb - 255 ) + 125
					if getElementDimension ( source ) == getElementDimension ( nearbyPlayer ) then
						if laGetElementData ( source, "call" ) == true then
							if isElement ( nearbyPlayer ) then
								outputChatBox ( pname.. " (Handy) sagt: " ..message, nearbyPlayer, rgb, rgb, rgb )
							end
						else
							--[[if laGetElementData ( source, "callswithpolice" ) == true then
								local taeter = getPlayerFromName ( message )
								if taeter then
									outputChatBox ( "Wir werden der Sache nachgehen.", source, 0, 0, 200 )
									crime = "none"
									if laGetElementData ( taeter, "lastcrime" ) == "mord" then
										crime = "Mord"
									elseif laGetElementData ( taeter, "lastcrime" ) == "drogen" then
										crime = "Drogennehmen"
									elseif laGetElementData ( taeter, "lastcrime" ) == "drugdealing" then
										crime = "Drogenhandel"
									elseif laGetElementData ( taeter, "lastcrime" ) == "mats" then
										crime = "Waffenhandel"
									elseif laGetElementData ( taeter, "lastcrime" ) == "lalance" then
										crime = "Koerperverletzung"
									end
									if crime ~= "none" then
										outputChatBox ( "Du hast ein Verbrechen begangen: "..crime..", gemeldet von: "..getPlayerName(source), taeter, 0, 0, 150 )
										if laGetElementData ( taeter, "wanteds" ) <= 5 then
											laSetElementData ( taeter, "wanteds", laGetElementData ( taeter, "wanteds" ) + 1 )
											setPlayerWantedLevel ( taeter, laGetElementData ( taeter, "wanteds" ) )
										end
										laSetElementData ( taeter, "lastcrime", "none" )
									end
								else
									outputChatBox ( "Es tut uns leid Sir, der Täter ist uns unbekannt.", source, 0, 0, 200 )
								end
								laSetElementData ( source, "callswithpolice", false )
							else]]
								if getElementData ( source, "adminduty" ) == true then
									outputChatBox ( "[ADMIN]"..pname.." sagt: " ..message, nearbyPlayer, rgb, 0, 0 )
								else
									outputChatBox ( pname.. " sagt: " ..message, nearbyPlayer, rgb, rgb, rgb )
								end
							--end
						end
					end
				end
			end
			if laGetElementData ( source, "call" ) == true then
				local target = getPlayerFromName(laGetElementData(source,"callswith"))
				outputChatBox ( pname.." am Handy: "..message, target, 200, 200, 50 )
			end
		else
			outputChatBox ( "Du bist gemuted und kannst deshalb nicht sprechen!", source, 125, 0, 0 )
		end
	else
		if messageType == 2 then
			executeCommandHandler ( "t", source, message )
		elseif messageType == 1 then
			if tonumber(laGetElementData ( source, "muted" )) == 0 then
				local posX, posY, posZ = getElementPosition( source )
				local chatSphere = createColSphere( posX, posY, posZ, 20 )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				destroyElement( chatSphere )
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do
					local pname = getPlayerName ( source )
					outputChatBox ( pname.." "..message, nearbyPlayer, 100, 0, 200 )
				end
			else
				outputChatBox ( "Du bist gemuted und kannst deshalb nicht sprechen!", source, 125, 0, 0 )
			end
		end
	end
end
if not isThisTheBetaServer () then
	addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )
end

local root = getRootElement()

function meCMD_func ( player, cmd, ... )
	local tb = {...}
	local msg = table.concat ( tb, " " )
	
	local pname = getPlayerName ( player )
	local posX, posY, posZ = getElementPosition ( player )
	local chatSphere = createColSphere( posX, posY, posZ, 20 )
	local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
	destroyElement( chatSphere )
	for index, nearbyPlayer in pairs ( nearbyPlayers ) do
		local pname = getPlayerName ( player )
		outputChatBox ( pname.." "..msg, nearbyPlayer, 200, 0, 200 )
	end
end
addCommandHandler ( "meCMD", meCMD_func )

function blockmsg ( message, messageType )
	cancelEvent()
end
if not isThisTheBetaServer() then
	addEventHandler( "onPlayerChat", getRootElement(), blockmsg )
end

function s_func ( player, cmd, ... )

	if chatAble ( player ) then
		local posX, posY, posZ = getElementPosition( player )
		local chatSphere = createColSphere( posX, posY, posZ, 20 )
		local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
		destroyElement( chatSphere )
		local parametersTable = {...}
		local stringWithAllParameters = table.concat( parametersTable, " " )
		local pname = getPlayerName ( player )
		for index, nearbyPlayer in ipairs( nearbyPlayers ) do
			if getElementData ( player, "adminduty" ) == true then
				outputChatBox ( "[ADMIN]"..pname.." schreit: "..stringWithAllParameters.."!!!", nearbyPlayer, 255, 0, 0 )
			else
				outputChatBox ( pname.." schreit: "..stringWithAllParameters.."!!!", nearbyPlayer, 255, 255, 255 )
			end
		end
	end
end
addCommandHandler ( "s", s_func )

function l_func ( player, cmd, ... )

	if chatAble ( player ) then
		local posX, posY, posZ = getElementPosition( player )
		local chatSphere = createColSphere( posX, posY, posZ, 3 )
		local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
		destroyElement( chatSphere )
		local parametersTable = {...}
		local stringWithAllParameters = table.concat( parametersTable, " " )
		local pname = getPlayerName ( player )
		for index, nearbyPlayer in ipairs( nearbyPlayers ) do
			if getElementData ( player, "adminduty" ) == true then
				outputChatBox ( "[ADMIN]"..pname.." flüstert: "..stringWithAllParameters.."...", nearbyPlayer, 150, 0, 0 )
			else
				outputChatBox ( pname.." flüstert: "..stringWithAllParameters.."...", nearbyPlayer, 150, 150, 150 )
			end
		end
	end
end
addCommandHandler ( "l", l_func )