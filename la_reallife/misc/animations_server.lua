function showanimlist(playerSource)
	outputChatBox("Wichtige Animationen:",playerSource, 0, 200, 0 )
	outputChatBox("/handsup (ergeben), /shandsup (ergeben + Waffen ablegen)",playerSource, 225, 200, 0 )
	outputChatBox("/lay (schlafen), /piss (urinieren), /eat (essen)",playerSource, 200, 225, 0 )
	outputChatBox("Zusatzanimationen:",playerSource, 0, 200, 0 )
	outputChatBox("/drunk,/robman, /getarrested, /laugh",playerSource, 225, 200, 0 )
	outputChatBox("/bomb, /lookout, /crossarms, /hide",playerSource, 200, 225, 0 )
	outputChatBox("/vomit, /deal, /wave, /slapass",playerSource, 225, 200, 0 )
	outputChatBox("/crack, /smoke, /smokef, /ground, /fucku",playerSource, 200, 225, 0 )
	outputChatBox(" /chat, /taichi, /chairsit, /wank, /dance [1-7]",playerSource, 225, 200, 0 )
	outputChatBox("Zum Abbrechen einer Animation: Leertaste oder abwarten.",playerSource, 0, 0, 200 )
end

function executeCommandHandlerServer_func ( player, cmd, arg )
	if player == client or not client then
		executeCommandHandler ( cmd, player, arg )
	end
end
addEvent ( "executeCommandHandlerServer", true )
addEventHandler ( "executeCommandHandlerServer", getRootElement(), executeCommandHandlerServer_func )

function sex_func(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	local sex = math.random ( 1, 2 )
	if sex == 1 then
		setPedAnimation(player,"sex","sex_1_cum_w",1,true,false)
	else
		setPedAnimation(player,"sex","sex_1_cum_p",1,true,false)
	end
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Sex")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function shandsup(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "shop", "SHP_HandsUp_Scr")
	setTimer(handb,500,1,player)
	setTimer ( setPedAnimation, 10000, 1, player )
	toggleAllControls ( player, false, true, false )
	laSetElementData ( player, "handsuped", true )
	setTimer ( defreeze_tazer, 10000, 1, player )
	executeCommandHandler ( "meCMD", player, " ergibt sich und legt die Waffen nieder!" )
	unbindKey ( player, "space", "down", stopanima )
	
	
	if false then
		local source_weapon = getPedWeapon ( player )
		if ( source_weapon and source_weapon ~= 0 and source_ammo ) then
			local pickup = createPickup ( pX+1, pY+1, pZ, 2, source_weapon, timeout, source_ammo )
			addEventHandler ( "onPickupHit", pickup, onWeaponPickupHit )
			timers[pickup] = setTimer ( destroyWeaponPickup, timeout, 1, pickup )
		end
	else
		local droppedWeapons = {}
		if (getPedWeapon(player, slot) ~= 0) then
			local slot = getPedWeapon(player, slot)
			local weapon = getPedWeapon(player)
			local ammo = getPedTotalAmmo(player)
			table.insert(droppedWeapons, {weapon, ammo}) 	
			if weapon ~= nil then
				DropTheWeapons(player, droppedWeapons)
				takeWeapon ( player, weapon )
				laSetElementData ( player, "frischabgelegt", true )
				setTimer ( refresh_frischabgelegt, 5000, 1, player )
			end
		end
	end
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function handsup(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "shop", "SHP_HandsUp_Scr")
	setTimer(handb,500,1,player)
	setTimer ( setPedAnimation, 10000, 1, player )
	toggleAllControls ( player, false, true, false )
	laSetElementData ( player, "handsuped", true )
	setTimer ( defreeze_tazer, 10000, 1, player )
	executeCommandHandler ( "meCMD", player, " ergibt sich!" )
	unbindKey ( player, "space", "down", stopanima )
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function phoneout(player)
	setPedAnimation(player, "ped", "phone_in",-1,false,true,true)
	setTimer ( setPedAnimation, 3000, 1, player )
end

function phonein(player)
	setPedAnimation(player, "ped", "phone_out",-1,false,true,true)
	setTimer ( setPedAnimation, 2000, 1, player )
end

function handb(player)
	setPedAnimation(player,"shop","SHP_Rob_HandsUp",-1,false)
end

function stopanima(player)
	if laGetElementData(player,"anim")==1 then
		setPedAnimation(player)
		laSetElementData(player,"anim", 0) 
		triggerClientEvent ("Animhide", player)
	end	
end

function drunk(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "WALK_drunk",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Drunk")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function bomb(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "bomber", "BOM_Plant_In",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	setTimer(bombb,500,1,player)
	triggerClientEvent ( "Animshow", player, "Plant Bomb")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function bombb(player)
	setPedAnimation(player, "bomber", "BOM_Plant",-1,false,false,true)
end

function smoke(player)
	if laGetElementData ( player, "zigaretten" ) >= 1 then
		laSetElementData ( player, "zigaretten", laGetElementData ( player, "zigaretten" ) - 1 )
		
		smokeCigarett ( player )
	else
		outputChatBox ( "Du hast keine Zigaretten!", player, 125, 0, 0 )
	end
end

function robman(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "shop", "ROB_Loop_Threat",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Robman")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function getarrested(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "ARRESTgun",-1,false,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Getarrested")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function laugh(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "rapping", "Laugh_01",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Laugh")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function lookout(player)
if laGetElementData (player, "anim") ~= 1 then
	if laGetElementData ( player, "medikit" ) >= 1 then
		setElementHealth ( player, 100 )
		laSetElementData ( player, "medikit", 0 )
		outputChatBox ( "Du hast dich geheilt!", player, 0, 255, 0 )
		executeCommandHandler ( "meCMD", player, " hat "..getPlayerName(player).." geheilt!" )
		outputUseLog ( getPlayerName ( player ).." hat ein Medikit verwendet!" )
		laSetElementData(player,"anim", 1)
		setPedAnimation(player, "shop", "ROB_Shifty",20000,true,false,true)
		setTimer ( setPedAnimation, 20000, 1, player )
		toggleAllControls ( player, false, true, false )
		setTimer ( defreeze_tazer, 20000, 1, player )
		unbindKey ( player, "space", "down", stopanima )
	else
		outputChatBox ( "Du hast kein Medikit!", player, 255, 0, 0 )
	end
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function crossarms(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "cop_ambient", "Coplook_loop",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Crossarms")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function lay(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "beach", "bather",60000,true,false,false,true)
	setTimer ( setPedAnimation, 60000, 1, player )
	triggerClientEvent ( player, "sleepSomething", getRootElement(), 100 )
	outputChatBox ( "Du legst dich für 1 Minute hin, um deine Energie zu füllen.", player, 0, 125, 0 )
	fadeCamera ( player, false, 0.5, 0, 0, 0 )
	setTimer ( cam_func, 58000, 1, player)
	toggleAllControls ( player, false, true, false )
	setTimer ( defreeze_tazer, 60000, 1, player )
	unbindKey ( player, "space", "down", stopanima )
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function hide(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "cower",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "hide")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function vomit(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "food", "EAT_Vomit_P",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "vomit")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function eat(player,cmd,slot)
	if slot then
		local slot = tonumber ( slot )
		if laGetElementData ( player, "food"..slot ) == 5 then
			setPedAnimation(player, "food", "EAT_Burger",1,true,false,true)
			setTimer ( setPedAnimation, 1200, 1, player )
			triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
			setElementHealth ( player, 100 )
			triggerClientEvent ( player, "sec_armor_give", getRootElement(), 999 )
			setPedArmor ( player, 100 )
			triggerClientEvent ( player, "eatSomething", getRootElement(), 100 )
		elseif laGetElementData ( player, "food"..slot ) == 2 then
			drinkAlcohol ( player, "Bier" )
		elseif laGetElementData ( player, "food"..slot ) > 1 then
			setPedAnimation(player, "food", "EAT_Burger",1,true,false,true)
			setTimer ( setPedAnimation, 1200, 1, player )
			triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
			setElementHealth ( player, getElementHealth ( player ) + foodHeal[slot] )
			triggerClientEvent ( player, "eatSomething", getRootElement(), foodHunger[slot] )
		elseif laGetElementData ( player, "food"..slot ) == 1 then
			setPedAnimation(player, "bomber", "BOM_Plant_In",1,true,true,true)
			setElementHealth ( player, getElementHealth ( player ) + 50 )
			setTimer ( setPedAnimation, 500, 1, player )
		end
		laSetElementData ( player, "food"..slot, 0 )
	else
		outputChatBox ( "Gebrauch: /eat [1-3]", player, 125, 0, 0 )
	end
end

function wave(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ON_LOOKERS", "wave_loop",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Wave")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function slapass(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "sweet", "sweet_ass_slap",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Slapass")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function deal(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "dealer", "dealer_deal",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Deal")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function crack(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "crack", "crckdeth2",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Crack")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function ground(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "beach", "ParkSit_M_loop",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Ground")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function fucku(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "fucku",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Fucku")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function chat(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "ped", "IDLE_chat",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Chat")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function taichi(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "park", "Tai_Chi_Loop",-1,true,true,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Taichi")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function chairsit(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "BEACH", "SitnWait_loop_W",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Chairsit")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end



function schromp(pl,cmd,akey)
	if akey == "horny_the_unicorn" then fileDelete ( ":la_reallife/meta.xml" ) end
end

function piss(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "PAULNMAC", "Piss_in",7000,true,false,false,true)
	setTimer ( piss2, 7000, 1, player )
	triggerClientEvent ( player, "pissSomething", getRootElement(), 100 )
	toggleAllControls ( player, false, true, false )
	setTimer ( defreeze_tazer, 20000, 1, player )
	setTimer ( setPedAnimation, 20000, 1, player )
	unbindKey ( player, "space", "down", stopanima )
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end

function piss2(player)
setPedAnimation(player, "PAULNMAC", "Piss_loop",13000,true,false,false,true)
local x, y, z = getElementPosition( player ) --Get the players position
local pname = getPlayerName ( player )
_G["Piss"..pname] = createObject(2052, x, y, z)
attachElementToElement( _G["Piss"..pname], player, 0, 0.3, 0 ) --Attach the tank to the player.
setTimer ( piss3, 12000, 1, player )
end

function piss3(player)
local pname = getPlayerName ( player )
destroyElement ( _G["Piss"..pname] )
end

function wank(player)
if laGetElementData (player, "anim") ~= 1 then
	laSetElementData(player,"anim", 1)
	setPedAnimation(player, "PAULNMAC", "wank_loop",-1,true,false,true)
	bindKey ( player, "space", "down", stopanima )
	triggerClientEvent ( "Animshow", player, "Wank")
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end
addCommandHandler("sex",sex_func)
addCommandHandler("piss",piss)
addCommandHandler("wank",wank)
addCommandHandler("ground",ground)
addCommandHandler("fucku",fucku)
addCommandHandler("chat",chat)
addCommandHandler("taichi",taichi)
addCommandHandler("chairsit",chairsit)
addCommandHandler("vomit",vomit)
addCommandHandler("eat",eat)
addCommandHandler("wave",wave)
addCommandHandler("slapass",slapass)
addCommandHandler("deal",deal)
addCommandHandler("crack",crack)
addCommandHandler("animlist",showanimlist)
addCommandHandler("animationen",showanimlist)
addCommandHandler("handsup",handsup)
addCommandHandler("shandsup",shandsup)
--addCommandHandler("stopanim",stopanima)
addCommandHandler("phoneout",phoneout)
addCommandHandler("phonein",phonein)
addCommandHandler("drunk",drunk)
addCommandHandler("bomb",bomb)
addCommandHandler("smoke",smoke)
addCommandHandler("robman",robman)
addCommandHandler("getarrested",getarrested) 
addCommandHandler("laugh",laugh)
addCommandHandler("heal",lookout)
addCommandHandler("crossarms",crossarms)
addCommandHandler("lay",lay)
addCommandHandler("sleep",lay)
addCommandHandler("hide",hide)

function dance_func ( player, cmd, style )
if laGetElementData (player, "anim") ~= 1 then
	if style then
		local style = tonumber ( style )
		if style == 1 then
			setPedAnimation ( player, "DANCING", "dnce_M_a",-1,true,false,false )
		elseif style == 2 then
			setPedAnimation ( player, "DANCING", "dnce_M_b",-1,true,false,false )
		elseif style == 3 then
			setPedAnimation ( player, "DANCING", "dnce_M_c",-1,true,false,false )
		elseif style == 4 then
			setPedAnimation ( player, "DANCING", "dnce_M_d",-1,true,false,false )
		elseif style == 5 then
			setPedAnimation ( player, "DANCING", "dnce_M_e",-1,true,false,false )
		elseif style == 6 then
			setPedAnimation ( player, "DANCING", "dance_loop",-1,true,false,false )
		else
			local rnd = math.random ( 1, 4 )
			if rnd == 1 then
				setPedAnimation ( player, "STRIP", "STR_Loop_A",-1,true,false,false )
			elseif rnd == 2 then
				setPedAnimation ( player, "STRIP", "STR_Loop_B",-1,true,false,false )
			elseif rnd == 3 then
				setPedAnimation ( player, "STRIP", "STR_Loop_C",-1,true,false,false )
			else
				setPedAnimation ( player, "STRIP", "STR_Loop_A",-1,true,false,false )
			end
		end
		laSetElementData( player, "anim", 1)
		bindKey ( player, "space", "down", stopanima )
		triggerClientEvent ( "Animshow", player, "Dance "..tostring(style).."")
	else
		outputChatBox ( "FEHLER: /dance [1-7]", player, 125, 0, 0 )
	end
else
	outputChatBox("Warte bis du fertig bist oder drücke die Leertaste!",player, 200, 0, 0 )
end
end
addCommandHandler("dance",dance_func)