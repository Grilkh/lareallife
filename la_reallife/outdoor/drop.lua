function weedDropHit ( player )
	
	local pickup = source
	local amount = laGetElementData ( pickup, "amount" )
	if tonumber(amount) then
		amount = tonumber(amount)
		if amount >= 0 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben "..amount.."\nGramm Weed gefunden!", 7500, 200, 0, 0 )
			laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) + amount )
		end
	end
	playSoundFrontEnd ( player, 40 )
	destroyElement ( source )
end

function koksDropHit ( player )
	
	local pickup = source
	local amount = laGetElementData ( pickup, "amount" )
	if tonumber(amount) then
		amount = tonumber(amount)
		if amount >= 0 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben "..amount.."\nGramm Kokain gefunden!", 7500, 200, 0, 0 )
			laSetElementData ( player, "koks", laGetElementData ( player, "koks" ) + amount )
		end
	end
	playSoundFrontEnd ( player, 40 )
	destroyElement ( source )
end


function matDropHit ( player )
	
	local pickup = source
	local amount = laGetElementData ( pickup, "amount" )
	if tonumber(amount) then
		amount = tonumber(amount)
		if amount >= 0 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben "..amount.."\nMaterialien gefunden!", 7500, 200, 0, 0 )
			laSetElementData ( player, "mats", laGetElementData ( player, "mats" ) + amount )
		end
	end
	playSoundFrontEnd ( player, 40 )
	destroyElement ( source )
end

function moneyDropHit ( player )
	
	local money = laGetElementData ( pickup, "money" )
	if tonumber(money) then
		money = tonumber(money)
		if money >= 0 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben "..money.."$ gefunden!", 7500, 200, 0, 0 )
			givePlayerSaveMoney ( player, money )
		end
	end
	destroyElement ( source )
end

function deleteObject ( object )

	if getElementModel ( object ) == 1210 then
		destroyElement ( object )
	elseif getElementModel ( object ) == 1212 then
		destroyElement ( object )
	end
end

function getDropAmount ( amount, player )
if isPremium(player) then
	return math.floor ( amount / 10 )
else
	return math.floor ( amount / 5 )
end
end