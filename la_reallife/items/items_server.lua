function putFoodInSlot ( player, item )

	for i = 1, 3 do
		if laGetElementData ( player, "food"..i ) == 0 then
			if item == 5 then
				outputChatBox ( "Frohe Ostern wünscht dir LA-Reallife!", player, 125, 0, 0 )
				laSetElementData ( player, "food"..i, item )
				break
			else
				laSetElementData ( player, "food"..i, item )
				outputChatBox ( "Dein "..foodName[item].." wurde in Slot NR. "..i.." abgelegt, nutze es mit /eat "..i.." !", player, 0, 125, 0 )
				break
			end
		elseif i == 3 then
			if item == 5 then
				outputChatBox ( "Frohe Ostern wünscht dir LA-Reallife!", player, 125, 0, 0 )
				laSetElementData ( player, "food"..i, item )
			else
				outputChatBox ( "Du hast leider keinen freien Slot mehr!", player, 125, 0, 0 )
			end
		end
	end
end

function executeCommand_func ( player, cmd, arg1 )

	if player == client then
		if arg1 then
			eat ( player, "eat", arg1 )
		elseif cmd == "grow" then
			if arg1 == "weed" then
				grow_func ( player, "grow", "weed" )
			elseif arg1 == "bigweed" then
				grow_func ( player, "grow", "bigweed" )
			end
		else
			executeCommandHandler ( cmd, player )
		end
		triggerClientEvent ( player, "refreshItems", getRootElement() )
	end
end
addEvent ( "executeCommand", true )
addEventHandler ( "executeCommand", getRootElement(), executeCommand_func )

function internet_func ( player )

	if laGetElementData ( player, "fruitNotebook" ) >= 1 then
		triggerClientEvent ( player, "showFruitDesktop", getRootElement() )
	end
end
addCommandHandler ( "internet", internet_func )

function dice_func ( player )

	if laGetElementData ( player, "dice" ) == 1 then
		local posX, posY, posZ = getElementPosition( player )
		local chatSphere = createColSphere ( posX, posY, posZ, 15 )
		local nearbyPlayers = getElementsWithinColShape ( chatSphere, "player" )
		destroyElement ( chatSphere )
		rnd = math.random(1,6)
		for index, nearbyPlayer in ipairs ( nearbyPlayers ) do
			local pname = getPlayerName ( player )
			outputChatBox ( "*"..pname.." hat eine "..rnd.." gewürfelt!", nearbyPlayer, 100, 0, 200 )
		end
	else
		outputChatBox ( "Du hast keinen Würfel!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "dice", dice_func )

function throw_func ( player, cmd, item, count )

	if player == client then
		if item == "mats" then
			laSetElementData ( player, "mats", 0 )
			outputChatBox ( "Du hast deine Materialien weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einige Materialien weg..." )
		elseif item == "weed" then
			laSetElementData ( player, "weed", 0 )
			outputChatBox ( "Du hast dein Weed weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft ein grünes Päckchen weg..." )
		elseif item == "koks" then
			laSetElementData ( player, "koks", 0 )
			outputChatBox ( "Du hast dein Kokain weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft ein weisses Päckchen weg..." )
		elseif item == "food" then
			laSetElementData ( player, "food"..count, 0 )
			outputChatBox ( "Du hast dein Essen in Slot NR. "..count.." weggeworfen!", player, 125, 0, 0 )
		elseif item == "fuel" then
			laSetElementData ( player, "benzinkannister", 0 )
			outputChatBox ( "Du hast deinen Benzinkanister weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einen Benzinkanister weg..." )
		elseif item == "dice" then
			laSetElementData ( player, "dice", 0 )
			outputChatBox ( "Du hast deinen Würfel weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einen Würfel weg..." )
		elseif item == "zigaretten" then
			laSetElementData ( player, "zigaretten", 0 )
			outputChatBox ( "Du hast deine Zigaretten weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einige Zigaretten weg..." )
		elseif item == "grow" then
			laSetElementData ( player, "flowerseeds", 0 )
			outputChatBox ( "Du hast deine Hanfsamen weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einige Hanfsamen weg..." )
		elseif item == "biggrow" then
			laSetElementData ( player, "premiumseeds", 0 )
			outputChatBox ( "Du hast deine Premiumsamen weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einige Premiumsamen weg..." )
		elseif item == "object" then
			laSetElementData ( player, "object", 0 )
			outputChatBox ( "Du hast dein Objekt weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft ein Objekt weg." )
		elseif item == "chips" then
			laSetElementData ( player, "casinoChips", 0 )
			outputChatBox ( "Du hast deine Casino-Chips weggeworfen!", player, 125, 0, 0 )
			executeCommandHandler ( "meCMD", player, " wirft einige Chips weg." )
		else
			outputChatBox ( "Dieses Item kannst du nicht wegwerfen!", player, 125, 0, 0 )
		end
		triggerClientEvent ( player, "refreshItems", getRootElement() )
	end
end
addEvent ( "throw", true )
addEventHandler ( "throw", getRootElement(), throw_func )

function giveitem_func ( target, item, food, amount )

	if source == client then
		local player = source
		local target = getPlayerFromName ( target )
		if isElement ( player ) and isElement ( target ) then
			if item == "object" then
				if laGetElementData ( target, "object" ) == 0 then
					if laGetElementData ( player, "object" ) > 0 then
						laSetElementData ( target, "object", laGetElementData ( player, "object" ) )
						laSetElementData ( player, "object", 0 )
						executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." ein Objekt." )
					else
						infobox ( "Du hast kein Objekt, das du vergeben kannst!", player, 5000, 200, 0, 0 )
					end
				else
					infobox ( "Der Spieler hat bereits ein Objekt!", player, 5000, 200, 0, 0 )
				end
			else
				amount = math.abs ( math.floor ( amount ) )
				if food then
					if laGetElementData ( target, "food1" ) or laGetElementData ( target, "food2" ) or laGetElementData ( target, "food3" ) then
						slot = laGetElementData ( player, "food"..food )
						putFoodInSlot ( target, laGetElementData ( player, "food"..food ) )
						laSetElementData ( player, "food"..food, 0 )
						outputChatBox ( "Du hast "..getPlayerName ( target ).." folgendes Item gegeben: "..foodName[slot]".", player, 10, 125, 10 )
						outputChatBox ( "Du hast von "..getPlayerName ( player ).." folgendes Item erhalten: "..foodName[slot]".", target, 10, 125, 10 )
						executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." etwas zu essen." )
					else
						outputChatBox ( "Der Spieler hat keinen freien Inventarslot mehr!", player, 125, 0, 0 )
					end
				else
					if not amount then amount = 1 end
					if item == "fill" then
						if laGetElementData ( target, "benzinkannister" ) == 0 then
							laSetElementData ( target, "benzinkannister", 1 )
							laSetElementData ( player, "benzinkannister", laGetElementData ( player, "benzinkannister" ) - 1 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." einen Benzinkanister gegeben!", player, 10, 125, 10 )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." einen Benzinkanister erhalten!", target, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." einen Benzinkanister." )
						else
							outputChatBox ( "Der Spieler hat bereits einen Kanister!", player, 125, 0, 0 )
						end
					elseif item == "grow" then
						local weed = laGetElementData ( player, "flowerseeds" )
						if weed >= amount then
							laSetElementData ( player, "flowerseeds", laGetElementData ( player, "flowerseeds" ) - amount )
							laSetElementData ( target, "flowerseeds", laGetElementData ( target, "flowerseeds" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." Hanfsamen erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." Hanfsamen gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." einige Hanfsamen..." )
						else
							outputChatBox ( "Du hast nicht so viele Hanfsamen!", player, 125, 0, 0 )
						end
					elseif item == "biggrow" then
						local weed = laGetElementData ( player, "premiumseeds" )
						if weed >= amount then
							laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) - amount )
							laSetElementData ( target, "premiumseeds", laGetElementData ( target, "premiumseeds" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." Premiumsamen erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." Premiumsamen gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." einige Premiumsamen..." )
						else
							outputChatBox ( "Du hast nicht so viele Premiumsamen!", player, 125, 0, 0 )
						end
					elseif item == "smokeweed" then
						local weed = laGetElementData ( player, "weed" )
						if weed >= amount then
							laSetElementData ( player, "weed", weed - amount )
							laSetElementData ( target, "weed", laGetElementData ( target, "weed" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." g Weed erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." g Weed gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." ein grünes Päckchen." )
						else
							outputChatBox ( "Du hast nicht so viel Weed!", player, 125, 0, 0 )
						end
					elseif item == "takekokain" then
						local koks = laGetElementData ( player, "koks" )
						if koks >= amount then
							laSetElementData ( player, "koks", koks - amount )
							laSetElementData ( target, "koks", laGetElementData ( target, "koks" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." g Kokain erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." g Kokain gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." ein weisses Päckchen." )
						else
							outputChatBox ( "Du hast nicht so viel Kokain", player, 125, 0, 0 )
						end
					elseif item == "mats" then
						local mats = laGetElementData ( player, "mats" )
						if mats >= amount then
							laSetElementData ( player, "mats", mats - amount )
							laSetElementData ( target, "mats", laGetElementData ( target, "mats" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." Materialien erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." Materialien gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." einige Materialien..." )
						else
							outputChatBox ( "Du hast nicht so viele Materialien!", player, 125, 0, 0 )
						end
					elseif item == "dice" then
						outputChatBox ( "Dieses Item kannst du nicht abgeben.", player, 125, 0, 0 )
					elseif item == "smoke" then
						local cig = laGetElementData ( player, "zigaretten" )
						if cig >= amount then
							laSetElementData ( player, "zigaretten", cig - amount )
							laSetElementData ( target, "zigaretten", laGetElementData ( target, "zigaretten" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." Zigaretten erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." Zigaretten gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." eine Packung Zigaretten." )
						else
							outputChatBox ( "Du hast nicht so viele Zigaretten!", player, 125, 0, 0 )
						end
					elseif item == "chips" then
						local chips = laGetElementData ( player, "casinoChips" )
						if chips >= amount then
							laSetElementData ( player, "casinoChips", chips - amount )
							laSetElementData ( target, "casinoChips", laGetElementData ( target, "casinoChips" ) + amount )
							outputChatBox ( "Du hast von "..getPlayerName ( player ).." "..amount.." Chips erhalten!", target, 10, 125, 10 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." "..amount.." Chips gegeben!", player, 10, 125, 10 )
							executeCommandHandler ( "meCMD", player, " gibt "..getPlayerName(target).." einige Chips." )
						end
					else
						outputChatBox ( "Dieses Item kannst du nicht abgeben.", player, 125, 0, 0 )
					end
				end
			end
		end
	end
end
addEvent ( "giveitem", true )
addEventHandler ( "giveitem", getRootElement(), giveitem_func )


--[[function medikit_func ( player )

	if laGetElementData ( player, "medikit" ) >= 1 then
		setElementHealth ( player, 100 )
		laSetElementData ( player, "medikit", 0 )
		outputChatBox ( "Du hast dich geheilt!", player, 0, 255, 0 )
		executeCommandHandler ( "meCMD", player, " hat "..getPlayerName(player).." geheilt!" )
		outputUseLog ( getPlayerName ( player ).." hat ein Medikit verwendet!" )
		laSetElementData(Player,"anim", 1)
		setPedAnimation(Player, "shop", "ROB_Shifty",10000,true,false,true)
		setTimer ( setPedAnimation, 10000, 1, Player )
	else
		outputChatBox ( "Du hast kein Medikit!", player, 255, 0, 0 )
	end
end
addCommandHandler ( "heal", medikit_func )
]]
