------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
--[[
lottoPickup = createPickup ( -2017.0888671875, 467.5341796875, 35.171875, 3, 1239, 100 )

function lottoPickupHit ( hit )

	if getElementType ( hit ) == "player" then
		outputChatBox ( "Hier kannst du Lotto spielen, die Ziehung ist jeden Sonntag um circa 18 Uhr!", hit, 0, 125, 0 )
		outputChatBox ( "Tippe /lotto [1] [2] [3] [4] [5] [6]", hit, 0, 125, 0 )
		outputChatBox ( "Bei den Nummern eine Zahl zwischen 1 und 12 eintippen!", hit, 0, 125, 0 )
	end
end
addEventHandler ( "onPickupHit", lottoPickup, lottoPickupHit )


function lotto_func ( player, cmd, erste, zweite, dritte, vierte, fuenfte, sechste)

	if laGetElementData ( player, "money" ) >= 1000 then
		if tonumber ( sechste ) then
			local erste = math.abs ( math.floor ( tonumber ( erste ) ) )
			local zweite = math.abs ( math.floor ( tonumber ( zweite ) ) )
			local dritte = math.abs ( math.floor ( tonumber ( dritte ) ) )
			local vierte = math.abs ( math.floor ( tonumber ( vierte ) ) )
			local fuenfte = math.abs ( math.floor ( tonumber ( fuenfte ) ) )
			local sechste = math.abs ( math.floor ( tonumber ( sechste ) ) )
			local x1, y1, z1 = getElementPosition ( player )
			local x2, y2, z2 = getElementPosition ( lottoPickup )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
				outputLottoLog ( getPlayerName ( player ).." "..erste.." "..zweite.." "..dritte.." "..vierte.." "..fuenfte.." "..sechste.." " )
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 1000 )
				outputChatBox ( "Du hast einen Lottoschein gekauft! Du darfst nur 1 kaufen, alle anderen werden nicht gezählt!", player, 0, 125, 0 )
			
				local fraktion = fraktionNames[5]
				_G[fraktion.."Money"] = _G[fraktion.."Money"] + 1000
				MySQL_SetString("fraktionen", "DepotGeld", _G[fraktion.."Money"], "Name LIKE '"..fraktion.."'")
			else
				outputChatBox ( "Du bist nicht beim Liberty Tree Gebäude!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Tippe /lotto [1] [2] [3] [4] [5] [6] (Anstatt 1-6 Zahlen von 1-12 eintragen)", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du hast nicht genug Geld! Ein Lottoschein kostet 1000$!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "lotto", lotto_func )
]]
--[[function werber_func ( player, cmd, werber)

		if werber ~= nil then
			laSetElementData ( player, "werber", werber )
			outputChatBox ( "Erfolgreich eingetragen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast niemanden angegeben!", player, 125, 0, 0 )
		end
end
addEvent ( "werber", true )
addEventHandler ( "werber", getRootElement(), werber_func )
addCommandHandler ( "werber", werber_func )
]]