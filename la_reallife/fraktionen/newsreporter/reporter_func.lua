function news_func ( player, cmd, ... )

	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isReporter ( player ) then
		if not laGetElementData ( player, "newsNotPostable" ) then
			if isNewsVeh(getPedOccupiedVehicle(player)) then
				if #stringWithAllParameters >= 1 then
					outputChatBox ( "Reporter "..getPlayerName(player)..": "..stringWithAllParameters, getRootElement(), 255, 125, 20 )
					laSetElementData ( player, "boni", tonumber ( laGetElementData ( player, "boni" ) ) + 10 )
					laSetElementData ( player, "newsNotPostable", true )
					setTimer ( laSetElementData, 3000, 1, player, "newsNotPostable", false )
				else
					outputChatBox ( "Dein Text ist zu kurz.", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du sitz in keinem News-Fahrzeug!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du kannst du nur alle 3 Sekunden News schreiben!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "news", news_func )

function live_func ( player, cmd, target )
	
if isReporter ( player ) then
	if laGetElementData ( player, "isLiveZahl" ) <= 5 then
		local target = getPlayerFromName ( target )
		if target then
			laSetElementData ( player, "isLiveZahl", (laGetElementData ( player, "isLiveZahl" ) + 1) )
			laSetElementData ( target, "isLive", true )
			laSetElementData ( player, "isLive", true )
			laSetElementData ( target, "isLiveWith", getPlayerName(player) )
			laSetElementData ( player, "isLiveWith", getPlayerName(target) )
			outputChatBox ( "Du bist nun in einem Interview mit "..getPlayerName(player)..", tippe /stoplive um es zu beenden.", target, 200, 200, 0 )
			outputChatBox ( "Du bist nun in einem Interview mit "..getPlayerName(target)..", tippe /endlive [NAME] um es zu beenden.", player, 200, 200, 0 )
		end
	else
		outputChatBox ( "Du hast bereits 5 Leute live gestellt!", player, 125, 0, 0 )
	end
else
	outputChatBox ( "Du bist kein Reporter!", player, 125, 0, 0 )
end
end
addCommandHandler ( "live", live_func )

function endlive_func ( player, cmd, name )
	
if name then
		local target = getPlayerFromName ( name )
	if laGetElementData ( player, "isLive" ) then
		if laGetElementData ( target, "isLive" ) then
			laSetElementData ( player, "isLiveZahl", (laGetElementData ( player, "isLiveZahl" ) - 1) )
			if laGetElementData ( player, "isLiveZahl" ) <= 0 then
				laSetElementData ( player, "isLiveZahl", 0)
				laSetElementData ( player, "isLive", false )
			end
		else
		outputChatBox ( "Der Spieler ist nicht live.", player, 125, 0, 0 )		
		end
		local tname = getPlayerName ( target )
		local pname = getPlayerName (player)
		outputChatBox ( "Du hast das Interview mit "..tname.." beendet.", player, 0, 200, 0 )
		if target then
			outputChatBox ( ""..pname.." hat das Interview beendet.", target, 0, 200, 0 )
			laSetElementData ( target, "isLive", false )
		end
	else
		outputChatBox ( "Du bist in keiner Live-Unterhaltung!", player, 125, 0, 0 )
	end
else
	outputChatBox ( "Verwende /endlive [NAME] um ein Interview zu beenden.", player, 125, 0, 0 )
end
end
addCommandHandler ( "endlive", endlive_func )


function stoplive_func ( player)
if laGetElementData ( player, "isLive" ) then
		laSetElementData ( player, "isLive", false )
		outputChatBox ( "Du hast das Interview beendet!", player, 0, 200, 0 )
		local target = laGetElementData ( player, "isLiveWith" )
		local target = getPlayerFromName ( target )
		local pname = getPlayerName (player)
		if target then
			outputChatBox ( ""..pname.." hat das Interview verlassen.", target, 0, 200, 0 )
			laSetElementData ( target, "isLiveZahl", (laGetElementData ( target, "isLiveZahl" ) - 1) )
			if laGetElementData ( target, "isLiveZahl" ) <= 0 then
				laSetElementData ( target, "isLiveZahl", 0)
				laSetElementData ( target, "isLive", false )
			end
		end
else
	outputChatBox ( "Du bist in keiner Live-Unterhaltung!", player, 125, 0, 0 )
end
end
addCommandHandler ( "stoplive", stoplive_func )


function spendennews_func ( player, cmd, amount )
	local fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '5'") )
	local amount = tonumber ( amount )
	if amount then
		if amount >= 100 then
			amount = math.abs ( math.floor ( amount ) )
			local fraktion = 5
			local fraktionsname = fraktionNames[fraktion]
			local money = laGetElementData ( player, "bankmoney" )
			if money >= amount then
				MySQL_SetString("fraktionen", "DepotGeld", fmoney + amount, "ID LIKE '5'")
				laSetElementData ( player, "bankmoney", money - amount )
				infobox ( player, "\n\nDu hast "..amount.."$ an die LAT gespendet!", 7500, 0, 125, 0 )
				sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..amount.."$ gespendet!", fraktion, 0, 150, 0 )
				outputLog( "[SPENDE]: "..getPlayerName(player).." hat "..amount.."$ and die LAT gespendet!", "pay")
				triggerClientEvent ( player, "createNewStatementEntry", player, "Spende LAT\n", amount * -1, "\n" )
			else
				infobox ( player, "\n\nDu hast nicht genug Geld!", 7500, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nMindestens 100$ (Spamschutz)!", 7500, 125, 0, 0 )
		end
	else
		infobox ( player, "\n\nVerwende: /spenden [Summe]", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "spenden", spendennews_func )