function number_func ( player, cmd, target )

	local targetNR = getPlayerFromName ( target )
	if targetNR then
		outputChatBox ( "Rufnummer von "..target..": "..laGetElementData ( targetNR, "telenr" ), player, 200, 200, 0 )
	end
end
addCommandHandler ( "number", number_func )

function sprunkAutomatUse_func ( player )

	if player == client then
		takePlayerMoney ( player, 1 )
		playSoundFrontEnd ( player, 40 )
		triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 1 )
		if getElementHealth ( player ) + sprunkheal < 100 then
			setElementHealth ( player, getElementHealth ( player ) + sprunkheal )
		else
			setElementHealth ( player, 100 )
		end
		sprunkKasse = sprunkKasse + 1
		triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
	end
end
addEvent ( "sprunkAutomatUse", true )
addEventHandler ( "sprunkAutomatUse", getRootElement(), sprunkAutomatUse_func )

function radiochange_func ( player, favchannel )

	if tostring ( favchannel ) == MySQL_Save ( tostring ( favchannel ) ) then
		laSetElementData ( player, "favchannel", favchannel )
	end
end
addEvent ( "radiochange", true )
addEventHandler ( "radiochange", getRootElement(), radiochange_func )

function showLicenses_func ( player )

	if player == client then
		local target = getPlayerFromName ( getElementData ( player, "curclicked" ) )
		local pname = getPlayerName ( player )
		local licenses = ""
		local waffen = ""
		local other = ""
		if getElementData ( player, "carlicense" ) == 1 then licenses = licenses.."Führerschein" end
		if getElementData ( player, "bikelicense" ) == 1 then licenses = licenses..", Motorrad" end
		if getElementData ( player, "lkwlicense" ) == 1 then licenses = licenses..", LKW" end
		if getElementData ( player, "motorbootlicense" ) == 1 then licenses = licenses..", Boots" end
		if getElementData ( player, "segellicense" ) == 1 then licenses = licenses..", Segel" end
		if getElementData ( player, "planelicenseb" ) == 1 then licenses = licenses..", Flug A" end
		if getElementData ( player, "planelicensea" ) == 1 then licenses = licenses.."+ B" end
		if getElementData ( player, "helilicense" ) == 1 then licenses = licenses.." und Helikopterschein." end

		if getElementData ( player, "gunlicense" ) == 1 then waffen = waffen.."A" end
		if getElementData ( player, "gunlicenseB" ) == 1 then waffen = waffen..", B" end
		if getElementData ( player, "gunlicenseC" ) == 1 then waffen = waffen.." und C." end
		
		if getElementData ( player, "perso") == 1 then other = other.."Personalausweis" end
		if getElementData ( player, "fishinglicense" ) == 1 then other = other..", Angelschein." end
		
		outputChatBox ( "Vorhandene Scheine von "..pname..": ", target, 200, 0, 200 )
		outputChatBox ( "Fahrzeuge: "..licenses, target, 200, 200, 0 )
		outputChatBox ( "Waffenscheine: "..waffen, target, 200, 200, 0 )
		outputChatBox ( "Andere: "..other, target, 200, 200, 0 )
		outputChatBox ( "Du hast "..getPlayerName(target).." deine Scheine gezeigt!", player, 0, 125, 0 )
	end
end
addEvent ( "showLicenses", true )
addEventHandler ( "showLicenses", getRootElement(), showLicenses_func )

function showGWD_func ( player )

	if player == client then
		local target = getPlayerFromName ( getElementData ( player, "curclicked" ) )
		local pname = getPlayerName ( player )
		outputChatBox ( "Du hast "..getPlayerName ( target ).." deine GWD-Note gezeigt!", player, 0, 125, 0 )
		outputChatBox ( getPlayerName ( player ).." zeigt dir seine GWD-Note: "..tostring(laGetElementData(player,"gwd")).."%!", target, 125, 200, 125 )
	end
end
addEvent ( "showGWD", true )
addEventHandler ( "showGWD", getRootElement(), showGWD_func )