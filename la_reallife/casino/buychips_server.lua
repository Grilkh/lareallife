function buyChips_func ( amount, buy )

	local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
	if amount then
		local player = client
		if buy then
			if laGetElementData ( player, "money" ) >= amount then
				laSetElementData ( player, "casinoChips", laGetElementData ( player, "casinoChips" ) + amount )
				takePlayerSaveMoney ( player, amount )
				infobox ( player, "\n\nDu hast dir\n"..amount.." Chips\ngekauft!", 5000, 0, 125, 0 )
				outputLog ( "[CHIPS]: "..getPlayerName ( player ).." hat "..amount.." Chips gekauft!", "pay" )
			else
				infobox ( player, lang.val ( 2, player ), 5000, 125, 0, 0 )
			end
		else
			if laGetElementData ( player, "casinoChips" ) >= amount then
				laSetElementData ( player, "casinoChips", laGetElementData ( player, "casinoChips" ) - amount )
				givePlayerSaveMoney ( player, amount )
				infobox ( player, "\n\nDu hast fuer\n"..amount.." Chips\nverkauft!", 5000, 0, 125, 0 )
				outputLog ( "[CHIPS]: "..getPlayerName ( player ).." hat "..amount.." Chips verkauft!", "pay" )
			else
				infobox ( player, "\n\n\nDu hast nicht\ngenug Chips!", 5000, 125, 0, 0 )
			end
		end
	else
		infobox ( player, "\n\n\nUngültiger Wert!", 5000, 125, 0, 0 )
	end
	casinoMoneySave ( player )
end
addEvent ( "buyChips", true )
addEventHandler ( "buyChips", getRootElement(), buyChips_func )