--cigarChokeTime = 3000

function removeAddicts_func ()

	local player = client
	local total = getTotalAddictLevel ( player )
	local totalCost = getTotalAddictLevel ( player ) * addictRemoveCost
	local money = laGetElementData ( player, "money" )
	if money >= totalCost then
		takePlayerSaveMoney ( player, totalCost )
		
		laSetElementData ( player, "cigarettAddictPoints", 0 )
		laSetElementData ( player, "alcoholAddictPoints", 0 )
		laSetElementData ( player, "weedAddictPoints", 0 )
		laSetElementData ( player, "koksAddictPoints", 0 )
		
		laSetElementData ( player, "cigarettFlushPoints", 0 )
		laSetElementData ( player, "alcoholFlushPoints", 0 )
		laSetElementData ( player, "weedFlushPoints", 0 )
		laSetElementData ( player, "koksFlushPoints", 0 )
		
		laSetElementData ( player, "aufEntzug", false )
		
		triggerClientEvent ( player, "showAddictInfo", player, true )
	else
		infobox ( player, "\n\n Du hast nicht genug Geld!", 7500, 125, 0, 0 )
	end
end
addEvent ( "removeAddicts", true )
addEventHandler ( "removeAddicts", getRootElement(), removeAddicts_func )

function takeWeed ( player )

	local weed = laGetElementData ( player, "weed" )
	if weed >= 3 then

		laSetElementData ( player, "lastcrime", "drogen" )
		laSetElementData ( player, "weed", weed - 3 )
		laSetElementData ( player, "aufEntzug", false )
		
		local curPoints = laGetElementData ( player, "weedAddictPoints" )
		local curFlush = laGetElementData ( player, "weedFlushPoints" )
		meCMD_func ( player, "cmd", "raucht Weed!" )
		outputLog ( "[WEED]: "..getPlayerName ( player ).." hat Weed geraucht!", "use" )
		local level = curFlush + 1
		
		laSetElementData ( player, "weedAddictPoints", curPoints + 1 )
		laSetElementData ( player, "weedFlushPoints", level )
		
		local drug = stone
		setPedAnimation ( player, "smoking", "M_smkstnd_loop", 5000, true, false, false)
		triggerClientEvent ( player, "eatSomething", getRootElement(), 5 )
		triggerClientEvent ( player, "startDrugEffect", getRootElement(), level, drug )
		triggerClientEvent ( player, "showAddictInfo", player, true )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Weed dabei\n( mind. 3 g)!", 7500, 200, 0, 0 )
	end
end
addCommandHandler ( "smokeweed", takeWeed )

function usedrugs_func ( player )

outputChatBox ( "Verwende /smokeweed oder /takekokain, um Drogen zu konsumieren!",  player, 125, 0, 0 )

end
addCommandHandler ( "usedrugs", usedrugs_func )

function takeKoks ( player )

	local koks = laGetElementData ( player, "koks" )
	if koks >= 1 then
		laSetElementData ( player, "lastcrime", "drogen" )
		laSetElementData ( player, "koks", koks - 1 )
		laSetElementData ( player, "aufEntzug", false )
		local curPoints = laGetElementData ( player, "koksAddictPoints" )
		local curFlush = laGetElementData ( player, "koksFlushPoints" )
		meCMD_func ( player, "cmd", "zieht Koks!" )
		outputLog ( "[KOKAIN]: "..getPlayerName ( player ).." hat Koks gezogen!", "use" )
		outputChatBox ( "Um trotzdem fahren zu können, musst du die M Taste im Auto drücken, dann erscheint der Mauszeiger.", player, 200, 0, 0 )
		local level = tonumber(curFlush) + 1
		
		laSetElementData ( player, "koksAddictPoints", tonumber (curPoints) + 1 )
		laSetElementData ( player, "koksFlushPoints", level )
		local drug = koks
		setPedAnimation ( player, "eat", "M_smkstnd_loop", 5000, true, false, false)
		--triggerClientEvent ( player, "eatSomething", getRootElement(), 5 )
		triggerClientEvent ( player, "startKokainEffect", player, level, drug )
		triggerClientEvent ( player, "showAddictInfo", player, true )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Kokain dabei\n( mind. 1 g)!", 7500, 200, 0, 0 )
	end
end
addCommandHandler ( "takekokain", takeKoks )

function drinkAlcohol ( player )

	laSetElementData ( player, "aufEntzug", false )

	local curPoints = laGetElementData ( player, "alcoholAddictPoints" )
	local curFlush = laGetElementData ( player, "alcoholFlushPoints" )
	meCMD_func ( player, "cmd", "trinkt Alkohol!" )
	outputLog ( "[ALKOHOL]: "..getPlayerName ( player ).." hat Alkohol getrunken!", "use" )
	local level = curFlush + 1	
	
	laSetElementData ( player, "alcoholAddictPoints", curPoints + 1 )
	laSetElementData ( player, "alcoholFlushPoints", level )
	
	local drug = drunk
	setPedAnimation ( player, "eat", "M_smkstnd_loop", 5000, true, false, false)
	triggerClientEvent ( playerSource, "eatSomething", getRootElement(), 10 )
	triggerClientEvent ( player, "startDrugEffect", getRootElement(), level, drug )
	triggerClientEvent ( player, "showAddictInfo", player, true )
end

function smokeCigarett ( player )
	local curPoints = laGetElementData ( player, "cigarettAddictPoints" )
	local curFlush = laGetElementData ( player, "cigarettFlushPoints" )
	meCMD_func ( player, "cmd", "raucht eine Zigarette!" )
	outputLog ( "[ZIGARETTE]: "..getPlayerName ( player ).." hat eine Zigarette geraucht!", "use" )
	
	laSetElementData ( player, "cigarettAddictPoints", curPoints + 1 )
	laSetElementData ( player, "cigarettFlushPoints", curFlush + 1 )
	
	local level = laGetElementData ( player, "cigarettFlushPoints" )
	setPedAnimation ( player, "smoking", "M_smkstnd_loop", 5000, true, true, false )
	triggerClientEvent ( playerSource, "eatSomething", getRootElement(), 5 )
	--triggerClientEvent ( player, "startDrugEffect", getRootElement(), level, smoke )
	triggerClientEvent ( player, "showAddictInfo", player, true )
end


function checkForSymptoms ( player )
laSetElementData ( player, "aufEntzug", true )
end
function detoxSympton ( player )
end
function lowerFlush ( player )

	local cigarettFlush = laGetElementData ( player, "cigarettFlushPoints" )
	local alcoholFlush = laGetElementData ( player, "alcoholFlushPoints" )
	local weedFlush = laGetElementData ( player, "weedFlushPoints" )
	local koksFlush = laGetElementData ( player, "koksFlushPoints" )

	if cigarettFlush >= 1 then
		laSetElementData ( player, "cigarettFlushPoints", cigarettFlush - 1 )
	end

	if alcoholFlush >= 1 then
		laSetElementData ( player, "alcoholFlushAddictPoints", alcoholFlush - 1 )
	end
	
	if weedFlush >= 1 then
		laSetElementData ( player, "weedFlushPoints", weedFlush - 1 )
	end

	if koksFlush >= 1 then
		laSetElementData ( player, "koksFlushPoints", koksFlush - 1 )
	end

end
function lowerAddict ( player )

	local cigarettAddict = laGetElementData ( player, "cigarettAddictPoints" )
	local alcoholAddict = laGetElementData ( player, "alcoholAddictPoints" )
	local weedAddict = laGetElementData ( player, "weedAddictPoints" )
	local koksAddict = laGetElementData ( player, "koksAddictPoints" )
	
	if cigarettAddict >= 1 then
		laSetElementData ( player, "cigarettAddictPoints", cigarettAddict - 1 )
	end
	
	if alcoholAddict >= 1 then
		laSetElementData ( player, "alcoholAddictPoints", alcoholAddict - 1 )
	end
	
	if weedAddict >= 1 then
		laSetElementData ( player, "weedAddictPoints", weedAddict - 1 )
	end
	
	if koksAddict >= 1 then
		laSetElementData ( player, "koksAddictPoints", koksAddict - 1 )
	end
end


function drunkAnimation_func (  )
--if laGetElementData ( player, "aufEntzug") then
	local alcoholAddict = laGetElementData ( player, "alcoholAddictPoints" )
	local weedAddict = laGetElementData ( player, "weedAddictPoints" )
	local koksAddict = laGetElementData ( player, "koksAddictPoints" )
if alcoholAddict >= 8 then
	setElementHealth ( player, getElementHealth(player) - 25 )
elseif weedAddict >= 8 then
	setElementHealth ( player, getElementHealth(player) - 25 )
elseif koksAddict >= 8 then
	setElementHealth ( player, getElementHealth(player) - 25 )
elseif alcoholAddict >= 5 then
	setElementHealth ( player, getElementHealth(player) - 15 )
elseif weedAddict >= 5 then
	setElementHealth ( player, getElementHealth(player) - 15 )
elseif koksAddict >= 5 then
	setElementHealth ( player, getElementHealth(player) - 15 )
else
	setElementHealth ( player, getElementHealth(player) - 5 )
end

	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "WALK_drunk",-1,true,true,true)
	setTimer ( setPedAnimation, 10000, 1, player )
	toggleAllControls ( player, false, true, false )
	setTimer ( defreeze_tazer, 10000, 1, player )
	meCMD_func ( player, "cmd", "hat Entzugserscheinungen!" )
	outputChatBox ( "Stille dein Verlangen nach Drogen oder geh zur Entzugsklinik!", player, 125, 0, 0 )
--end
end
addEvent ( "drunkAnimation", true )
addEventHandler ( "drunkAnimation", getRootElement(), drunkAnimation_func )



function crackAnimation_func ( )
--if laGetElementData ( player, "aufEntzug") then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "crack", "crckdeth2",-1,true,true,true)
	setTimer ( setPedAnimation, 10000, 1, player )
	toggleAllControls ( player, false, true, false )
	setTimer ( defreeze_tazer, 10000, 1, player )
	setElementHealth ( player, getElementHealth(player) - 10 )
	meCMD_func ( player, "cmd", "hat Entzugserscheinungen!" )
	outputChatBox ( "Stille dein Verlangen nach Drogen oder geh zur Entzugsklinik!", player, 125, 0, 0 )
--end
end
addEvent ( "crackAnimation", true )
addEventHandler ( "crackAnimation", getRootElement(), crackAnimation_func )
