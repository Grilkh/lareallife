local dutyIcon = createPickup ( 258.57006835938, 109.79203033447, 1002.7518310547, 3, 1239, 50, 0 )
setElementInterior ( dutyIcon, 10 )
--ticketIcon = createPickup ( 246.54, 118.03, 1002.86, 3, 1239, 50, 0 )
--setElementInterior ( ticketIcon, 10 )

function dutyhit ( player )

	outputChatBox ( "Verwende /duty oder /swat, um in Dienst zu gehen. /fskin für Skinchange.", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", dutyIcon, dutyhit )

function ticket_func ( player, cmd, target, price )

	local target = getPlayerFromName ( target )
	local price = tonumber ( price )
	if target then
		if price then
			price = math.floor ( math.abs ( price ) )
			if isCop ( player ) then
				if laGetElementData ( target, "wanteds" ) == 1 then
					if laGetElementData ( target, "money" ) >= price then
						outputChatBox ( getPlayerName ( player ).." bietet dir ein Ticket an: "..price.."$ für Straferlass.", target, 0, 125, 0 )
						outputChatBox ( "Verwende /accept ticket, um zuzustimmen.", target, 0, 125, 0 )
						laSetElementData ( target, "ticketprice", price )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast "..getPlayerName(target).."\nein Ticket angeboten.", 7500, 0, 125, 0 )
						outputLog( "[TICKET]: "..getPlayerName(player).." hat "..getPlayerName(target).." ein Ticket für "..price.." angeboten.", "pd")
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler hat\nnicht genug Geld\ndabei!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler muss\nein Wanted haben!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nPolizist im Dienst!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch:\n/ticket [Name] [Preis]!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch:\n/ticket [Name] [Preis]!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "ticket", ticket_func )

function grab_func ( player, cmd, targetName )
if not client or client == player then
	local veh = getPedOccupiedVehicle(player)
	if (isOnDutyCar(player)) or (isOnStateDuty(player) and ((veh == Undercover) or (veh == Undercover2))) then
		local target = getPlayerFromName ( targetName )
			if isElement ( target ) then
				if laGetElementData ( target, "tazered" ) or laGetElementData ( target, "handsuped" ) then
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( target )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 10 then
						local veh = getPedOccupiedVehicle ( player )
						local model = getElementModel ( veh )
						local validSeats = {}
						if staatvierplatz[model] then
							for i = 2, 3 do
								if not getVehicleOccupant ( veh, i ) then
								validSeats[i] = true
								end
							end
						elseif staatzweiplatz[model] then
							if not getVehicleOccupant ( veh, 1 ) then
								validSeats[1] = true
							end
						else
							infobox ( player, "\n\nDu sitzt in einem ungültigen Fahrzeug!", 5000, 125, 0, 0 )
							return
						end
						for key, index in pairs ( validSeats ) do
							warpPedIntoVehicle ( target, veh, key )
							executeCommandHandler ( "tie", player, targetName )
							outputLog( "[GRAB]: "..getPlayerName(player).." hat "..getPlayerName(target).." gegrabbt!", "pd")
							takeAllWeapons ( target )
							return
						end
						infobox ( player, "\n\nDu hast keinen freien Sitz!", 5000, 125, 0, 0 )
					else
						infobox ( player, "\n\nDas Ziel ist zu weit entfernt!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "\n\nDer Spieler muss getazert sein oder sich ergeben!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
			end
	else
		infobox ( player, "\n\nDu bist kein Beamter im Dienst!", 5000, 125, 0, 0 )
	end
end
end
addCommandHandler ( "grab", grab_func )
addEvent ( "grab", true )
addEventHandler ( "grab", getRootElement(), grab_func )

function accept_ticket_func ( player, cmd, after )

	if after == "ticket" then
		local price = laGetElementData ( player, "ticketprice" )
		local money = laGetElementData ( player, "money" )
		if price then
			if money >= price then
				if laGetElementData ( player, "wanteds" ) == 1 then
					laSetElementData ( player, "wanteds", 0 )
					setPlayerWantedLevel ( player, 0 )
					
					takePlayerSaveMoney ( player, price )
					
					laSetElementData ( player, "ticketprice", nil )
					
					infobox ( player, "\n\nDeine Strafe wurde dir erlassen.", 5000, 0, 200, 0 )
					outputLog( "[TICKET]: "..getPlayerName(player).." hat ein Ticket für "..price.." gekauft.", "pd")
					local fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '1'") )
					MySQL_SetString("fraktionen", "DepotGeld", fmoney + price, "ID LIKE '1'")
				else
					infobox ( player, "\n\n Du hast keine Wanteds!", 7500, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\n Du hast nicht genug Geld!", 7500, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\n Niemand hat dir ein Ticket angeboten!", 7500, 125, 0, 0 )
		end
	elseif after == "test" then
	
		local cop = laGetElementData ( player, "tester" )
		if isElement ( cop ) then
			local alc = laGetElementData ( player, "alcoholFlushPoints" ) * 0.25
			local weed = laGetElementData ( player, "weedFlushPoints" ) * 0.2
			local koks = laGetElementData ( player, "koksFlushPoints" ) * 1
			infobox ( player, "\n\nDu hast dem Test zugestimmt.", 5000, 0, 125, 0 )
			local result = "Ergebnis: Alkoholgehalt im Blut: "..alc.." Promil, THC-Gehalt im Blut: "..weed.." Kokain: "..koks.." Gramm konsumiert."
			outputChatBox ( result, cop, 200, 200, 0 )
			outputChatBox ( result, player, 200, 200, 0 )
		else
			infobox ( player, "\n\nNicht möglich.", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "accept", accept_ticket_func )

function m_func ( player, cmd, ... )

	if getPedOccupiedVehicle ( player ) then
		if isOnDutyCar(player) then
			local parametersTable = {...}
			local stringWithAllParameters = table.concat( parametersTable, " " )
			local posX, posY, posZ = getElementPosition ( player )
			local chatSphere = createColSphere( posX, posY, posZ, 30 )
			local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
			destroyElement( chatSphere )
			for index, nearbyPlayer in ipairs( nearbyPlayers ) do
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( nearbyPlayer)
				local distance = getDistanceBetweenPoints3D ( x1,y1,z1,x2,y2,z2 )
				local pname = getPlayerName ( player )
				if getElementDimension ( player ) == getElementDimension ( nearbyPlayer ) then
					if isFBI ( player ) then tag = "Agent" elseif isArmy ( player ) then tag = "Soldat" else tag = "Officer" end
					outputChatBox ( "["..tag.." "..pname.."]: " ..stringWithAllParameters, nearbyPlayer, 255, 255, 20 )
				end
			end
		else
			outputChatBox ( "Du bist nicht im Dienst/sitzt in keinem Polizeifahrzeug!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du sitzt in keinem Fahrzeug!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "m", m_func )

function test_func ( player, cmd, target )

	local target = getPlayerFromName ( target )
		if isCop(player) then
			if target then
				outputChatBox ( "Officer "..getPlayerName ( player ).." fordert dich zu einem Alkohol- und Drogentest auf.", target, 125, 0, 0 )
				outputChatBox ( "Tippe /accept test, um zuzustimmen.", target, 125, 125, 0 )
				outputChatBox ( "Du hast "..getPlayerName ( target ).." zu einem Test aufgefordert.", player, 0, 125, 0 )
				
				laSetElementData ( target, "tester", player )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch: /test [Name]", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht im Dienst!", 5000, 125, 0, 0 )
		end
end
addCommandHandler ( "test", test_func )
addEvent ( "test", true )
addEventHandler ( "test", getRootElement(), test_func )

function frisk_func ( player, cmd, target )
if isOnStateDuty(player) or isEvil (player) then
	local playerid = getPlayerFromName ( target )
	if player == client or not client then
		if playerid then
			if laGetElementData ( playerid, "tazered" ) or laGetElementData ( playerid, "handsuped" ) or getElementData ( playerid, "tiedsecur") then
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( playerid )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
					outputChatBox ( "Gegenstände von "..target..":", player, 0, 0, 125 )
					if isOnStateDuty(player) then
						outputChatBox ( "Materialien: "..laGetElementData(playerid,"mats")..", Weed: "..laGetElementData(playerid,"weed")..", Kokain: "..laGetElementData(playerid,"koks")..", Bargeld: "..laGetElementData(playerid,"money").."$",player,200,200,0)
						outputLog( "[FRISK]: "..getPlayerName(player).." hat "..getPlayerName(playerid).." durchsucht.", "pd")
						outputChatBox ( "Beamter "..getPlayerName(player).." hat dich durchsucht!", playerid, 0, 0, 150 )
					elseif isEvil (player) and (laGetElementData ( playerid, "tazered" ) == false) then
						local moneytarget
						local money = laGetElementData(playerid,"money")
						if money > 500 then
							moneytarget = "+500"
						else
							moneytarget = money
						end
						if getElementData ( playerid, "tiedsecur") then
							outputChatBox ( "Ein Verbrecher hat dich durchsucht!", playerid, 0, 0, 150 )
						else
							outputChatBox ( "Verbrecher "..getPlayerName(player).." hat dich durchsucht!", playerid, 0, 0, 150 )
						end
						outputChatBox ( "Materialien: "..laGetElementData(playerid,"mats")..", Weed: "..laGetElementData(playerid,"weed")..", Kokain: "..laGetElementData(playerid,"koks")..", Bargeld: "..moneytarget.."$",player,200,200,0)
						outputLog( "[FRISK]: "..getPlayerName(player).." hat "..getPlayerName(playerid).." durchsucht.", "bad")
					end
				else
					outputChatBox ( "Du bist zu weit entfernt!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Der Spieler ist nicht getazert oder gefesselt und hat sich nicht ergeben!", player, 125, 0, 0 )
			end
		end
	end
else
	outputChatBox ( "Du bist in keiner bösen Fraktion und kein Beamter in Dienst!", player, 125, 0, 0 )
end
end
addEvent ( "friskGUI", true )
addEventHandler ( "friskGUI", getRootElement(), frisk_func )
addCommandHandler ( "frisk", frisk_func )

function offduty_func ( player )
local model = getElementModel(player)
	if copskins[model] or fbiSkins[model] or armySkins[model] then
		if not getPedOccupiedVehicle ( player ) then
			if isArmy (player) then
				setElementModel ( player, 121 )
				laSetElementData ( player, "skinid", 121 )
			else
				setElementModel ( player, laGetElementData ( player, "skinid" ) )
			end
				takeAllWeapons ( player )
				setPlayerNametagColor ( player, 200, 200, 200 )
		else
			outputChatBox ( "Du darfst nicht in einem Fahrzeug sitzen.", player, 125, 0, 0 )
		end
	elseif medicSkins[model] or mechanikSkins[model] then
		if not getPedOccupiedVehicle ( player ) then
			if isMedic(player) then
				setElementModel ( player, 57 )
				laSetElementData ( player, "skinid", 57 )
				setElementData(player, "medic:duty", false)
				outputChatBox("[INFO]: Du bist nun nicht mehr als Sanitäter im Dienst!", player, 200, 200, 0)
				takeWeapon(player, 41)
			elseif isMechaniker(player) then
				setElementModel ( player, 98 )
				laSetElementData ( player, "skinid", 98 )
				setElementData(player, "mechaniker:duty", false)
				outputChatBox("[INFO]: Du bist nun nicht mehr als Mechaniker im Dienst!", player, 200, 200, 0)
				takeWeapon(player, 41)
			end
		else
			outputChatBox ( "Du darfst nicht in einem Fahrzeug sitzen.", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist kein Beamter im Dienst!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "offduty", offduty_func )

function takeillegal_func ( player, cmd, target )

	local playerid = getPlayerFromName ( target )
	if player == client or not client then
		if playerid then
			--if playerid == player then
			--	outputChatBox ( "Du kleiner Buguser!", player, 205, 0, 0 )
			--else
				if laGetElementData ( playerid, "tazered" ) or laGetElementData ( playerid, "handsuped" ) or getElementData ( playerid, "tiedsecur") then
					if isOnStateDuty(player) then
						local fraktion = tonumber(laGetElementData (player, "fraktion"))
						local weed = tonumber(laGetElementData (playerid, "weed"))
						local koks = tonumber(laGetElementData (playerid, "koks"))
						local mats = tonumber(laGetElementData (playerid, "mats"))
						if (weed > 0) or (koks > 0) or (mats > 0) then
							outputChatBox ( "Du hast "..target.." seine illegalen Gegenstände abgenommen!", player, 0, 125, 0 )
							outputChatBox ( "Staatsbeamter "..getPlayerName(player).." hat dir deine illegalen Gegenstände abgenommen!", playerid, 125, 0, 0 )
							laSetElementData ( playerid, "weed", 0 )
							laSetElementData ( playerid, "koks", 0 )
							laSetElementData ( playerid, "mats", 0 )
							local weedprice = weed * 2
							local koksprice = koks * 10
							local matsprice = mats * 1
							local lohn = weedprice + koksprice + matsprice
							local pmoney = laGetElementData ( player, "bankmoney")
							laSetElementData ( player, "bankmoney", pmoney + lohn )
							outputChatBox ( "Du hast die illegalen Gegenstände abgegeben! ("..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien.", player, 0, 125, 0 )
							outputChatBox ( "Du hast für "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien "..lohn.."$ bekommen!", player, 0, 125, 0 )
							local msg = getPlayerName(player).." hat "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien beschlagnahmt."
							sendMSGForFaction ( msg, 1, 0, 0, 200 )
							sendMSGForFaction ( msg, 6, 0, 0, 200 )
							sendMSGForFaction ( msg, 8, 0, 0, 200 )
							outputLog( "[BESCHLAGNAHMT]: "..getPlayerName(player).." hat "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien von "..getPlayerName(playerid).." beschlagnahmt. ("..lohn.."$)", "pd")
							local fmoney = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..fraktion.."'"))
							local fweed = tonumber(MySQL_GetString("fraktionen", "DepotDrogen", "ID LIKE '"..fraktion.."'"))
							local fmats = tonumber(MySQL_GetString("fraktionen", "DepotMaterials", "ID LIKE '"..fraktion.."'"))
							local fkoks = tonumber(MySQL_GetString("fraktionen", "DepotKokain", "ID LIKE '"..fraktion.."'"))
							
							if fmoney <= lohn then
								MySQL_SetString("fraktionen", "DepotGeld", 0, "ID LIKE '"..fraktion.."'")
							else
								MySQL_SetString("fraktionen", "DepotGeld", fmoney - lohn, "ID LIKE '"..fraktion.."'")			
							end
							MySQL_SetString("fraktionen", "DepotDrogen", fweed + weed, "ID LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotMaterials", fmats + mats, "ID LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotKokain", fkoks + koks, "ID LIKE '"..fraktion.."'")
						else
							outputChatBox ( "Es wurden keine illegalen Gegenstände gefunden!", player, 125, 0, 0 )
						end
					elseif isEvil (player) and (laGetElementData ( playerid, "tazered" ) == false) then
						outputChatBox ( "Du hast "..target.." seine illegalen Gegenstände abgenommen!", player, 0, 125, 0 )
						local weednew = laGetElementData ( playerid, "weed" )
						local matsnew = laGetElementData ( playerid, "mats" )
						local koksnew = laGetElementData ( playerid, "koks" )
						local weedold = laGetElementData ( player, "weed" )
						local matsold = laGetElementData ( player, "mats" )
						local koksold = laGetElementData ( player, "koks" )
						laSetElementData ( player, "weed", weednew + weedold )
						laSetElementData ( player, "mats", matsnew + matsold )
						laSetElementData ( player, "koks", koksnew + koksold )
						laSetElementData ( playerid, "weed", 0 )
						laSetElementData ( playerid, "mats", 0 )
						laSetElementData ( playerid, "koks", 0 )
						if getElementData ( playerid, "tiedsecur") then
							outputChatBox ( "Ein Verbrecher hat dir deine illegalen Gegenstände abgenommen!", playerid, 125, 0, 0 )
						else
							outputChatBox ( "Verbrecher "..getPlayerName(player).." hat dir deine illegalen Gegenstände abgenommen!", playerid, 125, 0, 0 )
						end
						outputChatBox ( "Du hast "..weednew.."g Weed, "..koksnew.."g Kokain und "..matsnew.." Mats von "..getPlayerName(playerid).." an dich genommen!", player, 0, 125, 0 )
						outputLog ( "[TAKE]: "..getPlayerName(player).." hat "..weednew.."g Weed, "..koksnew.."g Kokain, "..matsnew.." Stk. Materialien von "..getPlayerName(playerid).." entwendet.", "bad")
					else
						outputChatBox ( "Du bist in keiner bösen Fraktion und kein Beamter in Dienst!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Der Spieler ist nicht getazert oder gefesselt und hat sich nicht ergeben!", player, 125, 0, 0 )
				end
			--end
		end
	end
end
addEvent ( "takeillegalGUI", true )
addEventHandler ( "takeillegalGUI", getRootElement(), takeillegal_func )
addCommandHandler ( "takeillegal", takeillegal_func )


function deleteillegal_func ( player, cmd )

if isOnStateDuty(player) then
	if laGetElementData ( player, "tazered" ) or laGetElementData ( player, "handsuped" ) or getElementData ( player, "tiedsecur") then
		outputChatBox ( "Du bist getazert, gefesselt oder hast dich ergeben!", player, 125, 0, 0 )
	else
		local fraktion = tonumber(laGetElementData (player, "fraktion"))
		local weed = tonumber(laGetElementData (player, "weed"))
		local koks = tonumber(laGetElementData (player, "koks"))
		local mats = tonumber(laGetElementData (player, "mats"))
		if (weed > 0) or (koks > 0) or (mats > 0) then
			laSetElementData ( player, "weed", 0 )
			laSetElementData ( player, "koks", 0 )
			laSetElementData ( player, "mats", 0 )
			local weedprice = weed * 2
			local koksprice = koks * 10
			local matsprice = mats * 1
			local lohn = weedprice + koksprice + matsprice
			local pmoney = laGetElementData ( player, "bankmoney")
			laSetElementData ( player, "bankmoney", pmoney + lohn )
			outputChatBox ( "Du hast deine illegalen Gegenstände abgegeben! ("..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien.", player, 0, 125, 0 )
			outputChatBox ( "Du hast für "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien "..lohn.."$ bekommen!", player, 0, 125, 0 )
			local msg = getPlayerName(player).." hat "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien abgegeben."
			sendMSGForFaction ( msg, 1, 0, 0, 200 )
			sendMSGForFaction ( msg, 6, 0, 0, 200 )
			sendMSGForFaction ( msg, 8, 0, 0, 200 )
			outputLog( "[ITEMS]: "..getPlayerName(player).." hat "..weed.."g Weed, "..koks.."g Kokain, "..mats.." Stk. Materialien abgegeben. ("..lohn.."$)", "pd")
			
			local fmoney = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..fraktion.."'"))
			local fweed = tonumber(MySQL_GetString("fraktionen", "DepotDrogen", "ID LIKE '"..fraktion.."'"))
			local fmats = tonumber(MySQL_GetString("fraktionen", "DepotMaterials", "ID LIKE '"..fraktion.."'"))
			local fkoks = tonumber(MySQL_GetString("fraktionen", "DepotKokain", "ID LIKE '"..fraktion.."'"))
			
			if fmoney <= lohn then
				MySQL_SetString("fraktionen", "DepotGeld", 0, "ID LIKE '"..fraktion.."'")
			else
				MySQL_SetString("fraktionen", "DepotGeld", fmoney - lohn, "ID LIKE '"..fraktion.."'")			
			end
			MySQL_SetString("fraktionen", "DepotDrogen", fweed + weed, "ID LIKE '"..fraktion.."'")
			MySQL_SetString("fraktionen", "DepotMaterials", fmats + mats, "ID LIKE '"..fraktion.."'")
			MySQL_SetString("fraktionen", "DepotKokain", fkoks + koks, "ID LIKE '"..fraktion.."'")
		else
			outputChatBox ( "Du hast keine illegalen Gegenstände!", player, 125, 0, 0 )
		end
	end
else
	outputChatBox ( "Du bist kein Staatsbeamter im Dienst!", player, 125, 0, 0 )
end
end
addEvent ( "deleteillegal", true )
addEventHandler ( "deleteillegal", getRootElement(), deleteillegal_func )
addCommandHandler ( "deleteillegal", deleteillegal_func )


function duty_func ( player, cmd, skin )

	if laGetElementData ( player, "fraktion" ) == 1 or isFBI ( player ) then
		local x, y, z = getElementPosition ( player )
		local px, py, pz = getElementPosition ( dutyIcon )
		local px2, py2, pz2 = getElementPosition ( FBIDutyIcon )
		if getDistanceBetweenPoints3D ( x, y, z, px, py, pz ) <= 5 or ( isNearLVPDDutyIcon ( player ) and not isFBI ( player ) ) or ( isNearLSPDDutyIcon ( player ) and not isFBI ( player ) ) then
			if isCop (player) then
				local curskin = getElementModel ( player )
				if not copskins[curskin] and not chickenskin[curskin] then
					if laGetElementData ( player, "rang" ) == 0 then
						setElementModel ( player, 284 )
					elseif laGetElementData ( player, "rang" ) == 1 then
						setElementModel ( player, 282 )
					elseif laGetElementData ( player, "rang" ) == 2 then
						setElementModel ( player, 280 )
					elseif laGetElementData ( player, "rang" ) == 3 then
						setElementModel ( player, 281 )
					elseif laGetElementData ( player, "rang" ) == 4 then
						setElementModel ( player, math.random ( 265, 267 ) )
					elseif laGetElementData ( player, "rang" ) == 5 then
						local model = math.random( 1, 2 )
						if model == 1 then
							setElementModel ( player, 283 )
						else
							setElementModel ( player, 288 )
						end
					elseif laGetElementData ( player, "rang" ) == 6 then
						setElementModel ( player, 295 )
					end
					-- Schlagstock
					local weapon = 3		
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- Kamera
					local weapon = 43		
					local ammo = 10
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- Deagle
					if laGetElementData ( player, "rang" ) >= 4 then
						local weapon = 24
						local ammo = 84
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					else -- 9mm
						local weapon = 22
						local ammo = 340
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Schrotflinte
					if laGetElementData ( player, "rang" ) >= 1 then
					local weapon = 25
					local ammo = 100
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- MP5
					if laGetElementData ( player, "rang" ) >= 3 then
					local weapon = 29
					local ammo = 360
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					local armor = 100
					setPedArmor ( player, armor )
					triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
					bindKey ( player, "1", "down", tazer_func )
					setPlayerNametagColor ( player, 0, 100, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bereits im Dienst!\nChickenskin?", 7500, 125, 0, 0 )
				end
			end
		elseif getDistanceBetweenPoints3D ( x, y, z, px2, py2, pz2 ) <= 5 or ( isNearLVPDDutyIcon ( player ) and isFBI ( player ) ) or ( isNearFBILSDutyIcon ( player ) and isFBI ( player ) ) then
			local curskin = getElementModel ( player )
			if not fbiSkins[curskin] and not chickenskin[curskin] then
				if laGetElementData ( player, "rang" ) == 0 then
					setElementModel ( player, 17 )
				elseif laGetElementData ( player, "rang" ) == 1 then
					setElementModel ( player, 286 )
				elseif laGetElementData ( player, "rang" ) == 2 then
					setElementModel ( player, 163 )
				elseif laGetElementData ( player, "rang" ) == 3 then
					setElementModel ( player, 164 )
				elseif laGetElementData ( player, "rang" ) == 4 then
					setElementModel ( player, 165 )
				elseif laGetElementData ( player, "rang" ) == 5 then
					setElementModel ( player, 166 )
				elseif laGetElementData ( player, "rang" ) == 6 then
					setElementModel ( player, 228 )
				end
				-- Schlagstock
				local weapon = 3		
				local ammo = 1
				giveWeapon ( player, weapon, ammo, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				-- Deagle
				if laGetElementData ( player, "rang" ) >= 3 then
					local weapon = 24
					local ammo = 84
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				else -- 9mm
					local weapon = 22
					local ammo = 340
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				end
				-- Schrotflinte
				if laGetElementData ( player, "rang" ) >= 1 then
					local weapon = 25
					local ammo = 100
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				end
				-- MP5
				if laGetElementData ( player, "rang" ) >= 2 then
					local weapon = 29
					local ammo = 360
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				end
				-- M4
				if laGetElementData ( player, "rang" ) >= 4 then
					local weapon = 31
					local ammo = 300
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				end
				local armor = 100
				setPedArmor ( player, armor )
				triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
				bindKey ( player, "1", "down", tazer_func )
				setPlayerNametagColor ( player, 0, 100, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bereits im Dienst!\nChickenskin?", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht an der richtigen Stelle!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "duty", duty_func )

function swat_func ( player )

	if laGetElementData ( player, "fraktion" ) == 1 or isFBI ( player ) then
		local x, y, z = getElementPosition ( player )
		local px, py, pz = getElementPosition ( dutyIcon )
		local px2, py2, pz2 = getElementPosition ( FBIDutyIcon )
		if getDistanceBetweenPoints3D ( x, y, z, px, py, pz ) <= 5 or ( isNearLVPDDutyIcon ( player ) and not isFBI ( player ) ) or ( isNearLSPDDutyIcon ( player ) and not isFBI ( player ) ) then
			local curskin = getElementModel ( player )
			if not copskins[curskin] and not chickenskin[curskin] then
				if laGetElementData ( player, "rang" ) >= 3 then
					setElementModel ( player, 285 )
					-- Schlagstock
					local weapon = 3		
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- 9mm
					local weapon = 22
					local ammo = 340
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- Traenengas
					local weapon = 17
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- M4
					if laGetElementData ( player, "rang" ) >= 3 then
						local weapon = 31
						local ammo = 300
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					else -- MP5
						local weapon = 29
						local ammo = 360
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Combatshotgun
					if laGetElementData ( player, "rang" ) >= 5 then
						local weapon = 27
						local ammo = 42
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- Sniper
						local weapon = 34
						local ammo = 5
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					local armor = 100
					setPedArmor ( player, armor )
					triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
					bindKey ( player, "1", "down", tazer_func )
					setPlayerNametagColor ( player, 100, 100, 100 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nNur für Captain oder höher!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bereits im Dienst!\nChickenskin?", 7500, 125, 0, 0 )
			end
		elseif getDistanceBetweenPoints3D ( x, y, z, px2, py2, pz2 ) <= 5 or ( isNearLVPDDutyIcon ( player ) and isFBI ( player ) ) or ( isNearFBILSDutyIcon ( player ) and isFBI ( player ) ) then
			local curskin = getElementModel ( player )
			if curskin ~= 285 then
				if laGetElementData ( player, "rang" ) >= 2 then
					setElementModel ( player, 285 )
					-- Schlagstock
					local weapon = 3		
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- Deagle
					if laGetElementData ( player, "rang" ) >= 3 then
						local weapon = 24
						local ammo = 84
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					else -- 9mm SD
						local weapon = 22
						local ammo = 340
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Traenengas
					local weapon = 17
					local ammo = 3
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					-- M4
					if laGetElementData ( player, "rang" ) >= 3 then
						local weapon = 31
						local ammo = 500
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					else -- MP5
						local weapon = 29
						local ammo = 360
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Sniper
					if laGetElementData ( player, "rang" ) >= 4 then
						local weapon = 34
						local ammo = 10
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Wärmesicht
					if laGetElementData ( player, "rang" ) >= 5 then
						local weapon = 45
						local ammo = 1
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					-- Combatshotgun
					if laGetElementData ( player, "rang" ) >= 5 then
						local weapon = 27
						local ammo = 70
						giveWeapon ( player, weapon, ammo, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					end
					local armor = 100
					setPedArmor ( player, armor )
					triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
					bindKey ( player, "1", "down", tazer_func )
					setPlayerNametagColor ( player, 100, 100, 100 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nNur für Inspector\noder höher!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bereits\nim Dienst!\nChickenskin?", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht\nan der richtigen\nStelle", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "swat", swat_func )

function suspect_func ( player, cmd, target, wanteds, r1, r2, r3, r4)
	if player == client or not client then
		if tonumber(wanteds) then
			if (tonumber(wanteds) >= 1) and (tonumber(wanteds) <= 6) then
				if r1 == nil then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Grund angeben!", 7500, 125, 0, 0 )
				else
					if isOnDutyCar(player) then
						local tplayer = getPlayerFromName ( target )
						local wantedst = tonumber(laGetElementData ( tplayer, "wanteds" ))
						if not r2 then r2 = "" end
						if not r3 then r3 = "" end
						if not r4 then r4 = "" end
						local reason = r1..r2..r3..r4
						if reason == "" then reason = "Unbekannt" end
						local level = wantedst + wanteds
						if level >= 6 then
							level = 6
						elseif level <= 0 then
							level = 0
						end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
							if getElementData ( player, "securityzone" ) == 1 then
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nRaus aus der Schutzzone!", 7500, 125, 0, 0 )
							else
								outputChatBox ( "Dein Wantedlevel wurde auf "..level.." (+"..wanteds..") hochgesetzt.", tplayer, 255, 255, 0 )
								outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..level.." (+"..wanteds..") hochgesetzt."
								sendMSGForFaction ( msg, 1, 0, 0, 200 )
								sendMSGForFaction ( msg, 6, 0, 0, 200 )
								sendMSGForFaction ( msg, 8, 0, 0, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 0, 0, 200 )
								sendMSGForFaction ( msg2, 6, 0, 0, 200 )
								sendMSGForFaction ( msg2, 8, 0, 0, 200 )
								outputLog( "[WANTEDS]: "..getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..level.." hochgesetzt.", "pd")
								laSetElementData ( tplayer, "wanteds", tonumber(level))
								setPlayerWantedLevel (tplayer, tonumber(level))
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültiger Spieler!", 7500, 125, 0, 0 )
						end
					elseif isOnStateDuty(player) then
						local tplayer = getPlayerFromName ( target )
						local wantedst = tonumber(laGetElementData ( tplayer, "wanteds" ))					
						if not r2 then r2 = "" end
						if not r3 then r3 = "" end
						if not r4 then r4 = "" end
						local reason = r1..r2..r3..r4
						if reason == "" then reason = "Unbekannt" end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
							if getElementData ( player, "securityzone" ) == 1 then
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nRaus aus der Schutzzone!", 7500, 125, 0, 0 )
							else
								outputChatBox ( "Dein Verbrechen "..reason.." (+"..wanteds.." Wanteds) wurde weitergeleitet.", tplayer, 255, 255, 0 )
								outputChatBox ( "Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = "[Polizeifunk]: "..getPlayerName(player).." meldet folgendes Verbrechen von "..target..":"
								sendMSGForFaction ( msg, 1, 150, 150, 200 )
								sendMSGForFaction ( msg, 6, 150, 150, 200 )
								sendMSGForFaction ( msg, 8, 150, 150, 200 )
								local msg2 = ""..reason.." (+"..wanteds.." Wanteds)"
								sendMSGForFaction ( msg2, 1, 150, 150, 200 )
								sendMSGForFaction ( msg2, 6, 150, 150, 200 )
								sendMSGForFaction ( msg2, 8, 150, 150, 200 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültiger Spieler!", 7500, 125, 0, 0 )
						end
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWantedsanzahl zwischen 1 und 6!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /wanteds [Name] [Wanteds] [Grund]", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler("suspect", suspect_func)
addCommandHandler("wanteds", suspect_func)
addEvent ("suspect", true )
addEventHandler ("suspect", getRootElement(), suspect_func )

function clear_func ( player, cmd, target, what, anzahl, r1, r2, r3, r4)

	if player == client or not client then
		if r1 == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [wanteds/stvo]\n[Anzahl] [GRUND]", 7500, 125, 0, 0 )
		else
			if isOnDutyCar(player) then
				local tplayer = getPlayerFromName ( target )
				if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
					if what == "wanteds" then
						if tonumber(anzahl) then
							if (tonumber(anzahl) > 0) and (tonumber(anzahl) <= 6) then
								if not r2 then r2 = "" end
								if not r3 then r3 = "" end
								if not r4 then r4 = "" end
								local reason = r1..r2..r3..r4
								if reason == "" then reason = "Unbekannt" end
								local wanteds = tonumber(laGetElementData ( tplayer, "wanteds" ))
								local newwanteds
								if (wanteds - anzahl) <= 0 then
									newwanteds = 0
								elseif (wanteds - anzahl) >= 6 then
									newwanteds = 6
								else
									newwanteds = (wanteds - anzahl)
								end
								laSetElementData (tplayer, "wanteds", tonumber(newwanteds))
								setPlayerWantedLevel (tplayer, tonumber(newwanteds))
								outputChatBox ( "Dein Wantedlevel wurde auf "..newwanteds.." (-"..anzahl..") runtergesetzt.", tplayer, 255, 255, 0 )
								outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..newwanteds.." (-"..anzahl..") runtergesetzt."
								sendMSGForFaction ( msg, 1, 0, 0, 200 )
								sendMSGForFaction ( msg, 6, 0, 0, 200 )
								sendMSGForFaction ( msg, 8, 0, 0, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 0, 0, 200 )
								sendMSGForFaction ( msg2, 6, 0, 0, 200 )
								sendMSGForFaction ( msg2, 8, 0, 0, 200 )
								outputLog( "[WANTEDS]: "..getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..newwanteds.." runtergesetzt. ("..reason..")", "pd")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nZu entfernende Wanteds\nzwischen 1 und 6!", 7500, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [wanteds]\n[ANZAHL] [Grund]", 7500, 125, 0, 0 )
						end
					elseif what == "stvo" then
						if tonumber(anzahl) then
							if (tonumber(anzahl) > 0) and (tonumber(anzahl) <= 15) then
								if not r2 then r2 = "" end
								if not r3 then r3 = "" end
								if not r4 then r4 = "" end
								local reason = r1..r2..r3..r4
								if reason == "" then reason = "Unbekannt" end
								local stvo = tonumber(laGetElementData ( tplayer, "stvo" ))
								local newstvo
								if (stvo - anzahl) <= 0 then
									newstvo = 0
								elseif (stvo - anzahl) >= 15 then
									newstvo = 15
								else
									newstvo = (stvo - anzahl)
								end
								laSetElementData (tplayer, "stvo", tonumber(newstvo))
								outputChatBox ( "Deine StVo-Punkte wurden auf "..newstvo.." (-"..anzahl..") runtergesetzt.", tplayer, 255, 255, 0 )
								outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..newstvo.." (-"..anzahl..") runtergesetzt."
								sendMSGForFaction ( msg, 1, 0, 0, 200 )
								sendMSGForFaction ( msg, 6, 0, 0, 200 )
								sendMSGForFaction ( msg, 8, 0, 0, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 0, 0, 200 )
								sendMSGForFaction ( msg2, 6, 0, 0, 200 )
								sendMSGForFaction ( msg2, 8, 0, 0, 200 )
								outputLog( "[StVO]: "..getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..newstvo.." runtergesetzt. ("..reason..")", "pd")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nZu entfernende StVO-Punkte\nzwischen 1 und 15!", 7500, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [stvo]\n[ANZAHL] [Grund]", 7500, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [WANTEDS/STVO]\n[Anzahl] [Grund]", 7500, 125, 0, 0 )
					end
				end
			elseif isOnStateDuty(player) then
				local tplayer = getPlayerFromName ( target )
				if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
					if what == "wanteds" then
						if tonumber(anzahl) then
							if (tonumber(anzahl) > 0) and (tonumber(anzahl) <= 6) then
								if not r2 then r2 = "" end
								if not r3 then r3 = "" end
								if not r4 then r4 = "" end
								local reason = r1..r2..r3..r4
								if reason == "" then reason = "Unbekannt" end
								local wanteds = tonumber(laGetElementData ( tplayer, "wanteds" ))
								local newwanteds
								if (wanteds - anzahl) <= 0 then
									newwanteds = 0
								elseif (wanteds - anzahl) >= 6 then
									newwanteds = 6
								else
									newwanteds = (wanteds - anzahl)
								end
								local msg = "[Polizeifunk]: "..getPlayerName(player).." möchte das Wantedlevel von "..target.." auf "..newwanteds.." (-"..anzahl..") runtersetzen."
								sendMSGForFaction ( msg, 1, 150, 150, 200 )
								sendMSGForFaction ( msg, 6, 150, 150, 200 )
								sendMSGForFaction ( msg, 8, 150, 150, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 150, 150, 200 )
								sendMSGForFaction ( msg2, 6, 150, 150, 200 )
								sendMSGForFaction ( msg2, 8, 150, 150, 200 )
								outputLog( "[WANTEDS]: "..getPlayerName(player).." möchte das Wantedlevel von "..target.." auf "..newwanteds.." runtersetzen. ("..reason..")", "pd")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nZu entfernende Wanteds\nzwischen 1 und 6!", 7500, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [wanteds]\n[ANZAHL] [Grund]", 7500, 125, 0, 0 )
						end			
					elseif what == "stvo" then
						if tonumber(anzahl) then
							if (tonumber(anzahl) > 0) and (tonumber(anzahl) <= 15) then
								if not r2 then r2 = "" end
								if not r3 then r3 = "" end
								if not r4 then r4 = "" end
								local reason = r1..r2..r3..r4
								if reason == "" then reason = "Unbekannt" end
								local stvo = tonumber(laGetElementData ( tplayer, "stvo" ))
								local newstvo
								if (stvo - anzahl) <= 0 then
									newstvo = 0
								elseif (stvo - anzahl) >= 15 then
									newstvo = 15
								else
									newstvo = (stvo - anzahl)
								end
								local msg = "[Polizeifunk]: "..getPlayerName(player).." möchte die StVO-Punkte von "..target.." auf "..newstvo.." (-"..anzahl..") runtersetzen."
								sendMSGForFaction ( msg, 1, 150, 150, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 150, 150, 200 )
								outputLog( "[StVO]: "..getPlayerName(player).." möchte die StVO-Punkte von "..target.." auf "..newstvo.." runtersetzen. ("..reason..")", "pd")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nZu entfernende StVO-Punkte\nzwischen 1 und 15!", 7500, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [stvo]\n[ANZAHL] [Grund]", 7500, 125, 0, 0 )
						end	
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /clear [Name] [WANTEDS/STVO]\n[Anzahl] [Grund]", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addCommandHandler("clear", clear_func)
addEvent ("clear", true )
addEventHandler ("clear", getRootElement(), clear_func )

function stvopunkte_func ( player, cmd, target, anzahl, r1, r2, r3, r4 )
	if player == client or not client then
		if tonumber(anzahl) then
			if (tonumber(anzahl) >= 1) and (tonumber(anzahl) <= 15) then
				if r1 == nil then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Grund angeben", 7500, 125, 0, 0 )
				else
					if isOnDutyCar(player) then
						local tplayer = getPlayerFromName ( target )
						local stvot = tonumber(laGetElementData ( tplayer, "stvo" ))
						if not r2 then r2 = "" end
						if not r3 then r3 = "" end
						if not r4 then r4 = "" end
						local reason = r1..r2..r3..r4
						if reason == "" then reason = "Unbekannt" end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
							local newstvo = stvot + tonumber(anzahl)
							laSetElementData ( tplayer, "stvo", newstvo )
							outputChatBox ( "Deine StVO-Punkte wurden um "..tonumber(anzahl).." auf "..newstvo.." erhöht.", tplayer, 255, 255, 0 )							
							outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
							local msg = getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..newstvo.." erhöht."
							sendMSGForFaction ( msg, 1, 0, 0, 200 )
							sendMSGForFaction ( msg, 6, 0, 0, 200 )
							sendMSGForFaction ( msg, 8, 0, 0, 200 )
							local msg2 = "Grund: "..reason..""
							sendMSGForFaction ( msg2, 1, 0, 0, 200 )
							sendMSGForFaction ( msg2, 6, 0, 0, 200 )
							sendMSGForFaction ( msg2, 8, 0, 0, 200 )
							outputLog( "[StVO]: "..getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..newstvo.." erhoeht. ("..reason..")", "pd")
							if laGetElementData ( tplayer, "stvo" ) >= 15 then
								laSetElementData ( tplayer, "carlicense", 0 )
								laSetElementData ( tplayer, "stvo", 0 )
								MySQL_SetString("userdata", "Autofuehrerschein", laGetElementData ( tplayer, "carlicense" ), "Name LIKE '"..target.."'")
								outputChatBox ( "Wegen deines schlechten Fahrverhaltens wurde dir dein Führerschein abgenommen!", tplayer, 150, 0, 0 )
							else
								outputChatBox ( "Du hast bereits "..newstvo.." StVO-Punkte. Bei 15 wird dir dein Führerschein entzogen!", tplayer, 255, 255, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
						end
					elseif isOnStateDuty(player) then
						local tplayer = getPlayerFromName ( target )	
						if not r2 then r2 = "" end
						if not r3 then r3 = "" end
						if not r4 then r4 = "" end
						local reason = r1..r2..r3..r4
						if reason == "" then reason = "Unbekannt" end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
								outputChatBox ( "Dein Vergehen "..reason.." (+"..anzahl.." StVO-P.) wurde weitergeleitet.", tplayer, 255, 255, 0 )
								outputChatBox ( "Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = "[Polizeifunk]: "..getPlayerName(player).." meldet folgendes Vergehen von "..target..":"
								sendMSGForFaction ( msg, 1, 125, 125, 250 )
								local msg2 = ""..reason.." (+"..anzahl.." StVO-Punkte)"
								sendMSGForFaction ( msg2, 1, 125, 125, 250 )
								outputLog( "[StVO]: "..getPlayerName(player).." meldet das Vergehen von "..target..". ("..reason..")", "pd")
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültiger Spieler!", 7500, 125, 0, 0 )
						end
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nStVO-Punkte zwischen 1 und 15!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /stvo [Name] [Punkte] [Grund]", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler("stvo", stvopunkte_func)
addEvent ("stvopunkte", true )
addEventHandler ("stvopunkte", getRootElement(), stvopunkte_func )

	
function takeweapons_func ( player, cmd, target )

	if player == client or not client then
		if isOnStateDuty(player) then
			if getPlayerFromName ( target ) then
				local target = getPlayerFromName ( target )
				local x, y, z = getElementPosition ( player )
				local tx, ty, tz = getElementPosition ( target )
				if getDistanceBetweenPoints3D ( x, y, z, tx, ty, tz ) < 5 then
					laSetElementData ( player, "hasBomb", false )
					takeAllWeapons ( target )
					if getTeamName(getPlayerTeam(target)) == "Terror" then
						outputChatBox ( "Du hast einen Terroristen entwaffnet!", player, 0, 125, 0 )
						outputChatBox ( "Du wurdest von "..getPlayerName(player).." entwaffnet!", target, 125, 0, 0 )
					else
						outputChatBox ( "Du hast "..getPlayerName(target).." entwaffnet!", player, 0, 125, 0 )
						outputChatBox ( "Du wurdest von "..getPlayerName(player).." entwaffnet!", target, 125, 0, 0 )
						outputLog( "[ENTWAFFNET]: "..getPlayerName(player).." hat "..getPlayerName(target).." entwaffnet.", "pd")
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist zu\nweit entfernt!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Staatsbeamter\nim Dienst!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler("takeweapons", takeweapons_func)
addEvent ("takeweapons", true )
addEventHandler ("takeweapons", getRootElement(), takeweapons_func )





function suspectterror_func ( player, cmd, target, r1, r2, r3, r4 )

	if player == client or not client then
		--if r1 == nil then
			--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen\nGrund angegeben!", 7500, 125, 0, 0 )
		--else
			if isOnStateDuty(player) then
				local target = getPlayerFromName ( target )
				if not r1 then r1 = "" end
				if not r2 then r2 = "" end
				if not r3 then r3 = "" end
				if not r4 then r4 = "" end
				local reason = r1..r2..r3..r4
				if getElementType ( target ) == "player" and laGetElementData ( target, "loggedin" ) == 1 then
					if getTeamName(getPlayerTeam(target)) == "Terror" then
						if laGetElementData ( target, "wanteds" ) <= 5 then
							laSetElementData ( target, "wanteds", laGetElementData ( target, "wanteds" ) + 1 )
							setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
						end
						outputChatBox ( "Du hast ein Verbrechen begangen: "..reason..", Gemeldet von: "..getPlayerName(player), target, 255, 255, 0 )
						local msg = getPlayerName(player).." hat einem Terroristen ein Wanted wegen Terrorismus gegeben!"
						sendMSGForFaction ( msg, 1, 0, 0, 200 )
						sendMSGForFaction ( msg, 6, 0, 0, 200 )
						sendMSGForFaction ( msg, 8, 0, 0, 200 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültiger\nSpieler!", 7500, 125, 0, 0 )
				end
			end
		--end
	end
end
addCommandHandler("suspectterror", suspectterror_func)
addEvent ("suspectterror", true )
addEventHandler ("suspectterror", getRootElement(), suspectterror_func )


function melden_func ( player, cmd, target)

	if player == client or not client then
		local target = getPlayerFromName ( target )
			if getElementType ( target ) == "player" and laGetElementData ( target, "loggedin" ) == 1 then
				outputChatBox ( "Du hast einen Terroristen der Polizei gemeldet!", player, 255, 255, 0 )
				local msg = getPlayerName(player).." hat einen Terroristen gesehen!"
				sendMSGForFaction ( msg, 1, 150, 0, 0 )
				sendMSGForFaction ( msg, 6, 150, 0, 0 )
				sendMSGForFaction ( msg, 8, 150, 0, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 7500, 125, 0, 0 )
			end
	end
end
--addCommandHandler("melden", melden_func)
addEvent ("melden", true )
addEventHandler ("melden", getRootElement(), melden_func )

function playerSpeedCheck ( )
    for i, player in ipairs ( getElementsByType("player") ) do
		if isCop( player ) then
			local weaponType = getPedWeapon ( player )
			if ( weaponType ) == 43 then
				local target = getPedTarget ( player )
				if ( target ) then
					if ( getElementType ( target ) == "vehicle" ) then
						local driver = getVehicleOccupant ( target )
						if ( driver ) then
							local targetname = getPlayerName( driver )
							if ( targetname ) then
								speedx, speedy, speedz = getElementVelocity ( target )
								actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
								kmh = actualspeed * 180
								showChat ( player, true )
								outputChatBox ( "Spieler "..targetname.." ist mit "..math.round(kmh, 0).." Km/h unterwegs!", player, 200, 200, 0 )
							end
						end
					end
				end
			end
		end
    end
end
setTimer ( playerSpeedCheck, 1000, 0 )


function stellen_func ( player, cmd )
	if laGetElementData (player, "wanteds") >= 1 then
		local wanteds = laGetElementData (player, "wanteds")
		if wanteds == 1 then
			praefix = "Wanted"
		else
			praefix = "Wanteds"
		end
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = 241.099, 112.790, 1002.41875
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
			local msg = ""..getPlayerName(player).." ist im LAPD in San Fierro und möchte sich mit "..wanteds.." "..praefix.." stellen."
			sendMSGForFaction ( msg, 1, 0, 200, 0 )
			sendMSGForFaction ( msg, 6, 0, 200, 0 )
			sendMSGForFaction ( msg, 8, 0, 200, 0 )
			infobox ( player, "\n\nDie Polizei wurde informiert!", 5000, 0, 125, 0 )
			outputLog( "[STELLEN]: "..getPlayerName(player).." will sich stellen.", "pd")
		else
			infobox ( player, "\n\nDu bist am falschen Ort!", 5000, 125, 0, 0 )	
		end
	else
		infobox ( player, "\n\nDu wirst nicht gesucht!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "stellen", stellen_func )
addEvent ( "stellen", true )
addEventHandler ( "stellen", getRootElement(), stellen_func )


function getNotdienst_func (player, verletzte)
local x, y, z = getElementPosition (player)
local pname = getPlayerName (player)
		if _G[pname.."notarzt"] then
			destroyElement ( _G[pname.."notarzt"] )
			_G[pname.."notarzt"] = nil
			if deletetNotarztBlipTimer then
				killTimer ( deletetNotarztBlipTimer )
			end
			_G[pname.."notarzt"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."notarzt"], getRootElement(), false)
			deletetNotarztBlipTimer = setTimer ( deletetNotarztBlip, 20000, 1, pname )
		else
			_G[pname.."notarzt"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."notarzt"], getRootElement(), false)
			deletetNotarztBlipTimer = setTimer ( deletetNotarztBlip, 20000, 1, pname )
		end
	for index, player in pairs(getElementsByType("player")) do
		if(isMedic(player)) and (isMedicDuty(player)) then
			setElementVisibleTo (_G[pname.."notarzt"], player, true )
			outputChatBox("INFO: Beamter "..pname.." benötigt einen Notarzt in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).."", player, 0, 255, 150)
			outputChatBox("Anzahl Verletzte "..tonumber(verletzte).."", player, 0, 255, 150)
		end
	end
	outputLog( "[NOTARZT]: "..pname.." benoetigt einen Notarzt in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).." ","pd")
end
addEvent ("getNotdienst", true )
addEventHandler ("getNotdienst", getRootElement(), getNotdienst_func )

function deletetNotarztBlip (pname)

	destroyElement ( _G[pname.."notarzt"] )
	_G[pname.."notarzt"] = nil
end

function getVerstaerkung_func ( player, reason, faction )
local x, y, z = getElementPosition (player)
local pname = getPlayerName (player)
	if faction == "self" then
		local fraktion = laGetElementData (player, "fraktion")
		local msg = "[Polizeifunk]: "..getPlayerName(player).." benötigt Unterstützung in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).."."
		sendMSGForFaction ( msg, fraktion, 150, 150, 200 )
		local msg2 = "Grund: "..reason..""
		sendMSGForFaction ( msg2, fraktion, 150, 150, 200 )
		outputLog( "[HELP]: "..getPlayerName(player).." benoetigt Unterstuetzung in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true)..".", "pd")
		if _G[pname.."verstaerkung"] then
			destroyElement ( _G[pname.."verstaerkung"] )
			_G[pname.."verstaerkung"] = nil
			if deletetVerstaerkungBlipTimer then
				killTimer ( deletetVerstaerkungBlipTimer )
			end
			_G[pname.."verstaerkung"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."verstaerkung"], getRootElement(), false)
			for i, targetplayer in ipairs ( getElementsByType("player") ) do
				if laGetElementData( targetplayer, "fraktion" ) == fraktion then
					setElementVisibleTo(_G[pname.."verstaerkung"], targetplayer, true)
				end
			end
				deletetVerstaerkungBlipTimer = setTimer ( deletetVerstaerkungBlip, 20000, 1, pname )
		else
			_G[pname.."verstaerkung"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."verstaerkung"], getRootElement(), false)
			for i, targetplayer in ipairs ( getElementsByType("player") ) do
				if laGetElementData( targetplayer, "fraktion" ) == fraktion then
					setElementVisibleTo(_G[pname.."verstaerkung"], targetplayer, true)
				end
			end
			deletetVerstaerkungBlipTimer = setTimer ( deletetVerstaerkungBlip, 20000, 1, pname )
		end
	else
		local msg = "[Polizeifunk]: "..getPlayerName(player).." benötigt Unterstützung in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).."."
		sendMSGForFaction ( msg, 1, 150, 150, 200 )
		sendMSGForFaction ( msg, 6, 150, 150, 200 )
		sendMSGForFaction ( msg, 8, 150, 150, 200 )
		local msg2 = "Grund: "..reason..""
		sendMSGForFaction ( msg2, 1, 150, 150, 200 )
		sendMSGForFaction ( msg2, 6, 150, 150, 200 )
		sendMSGForFaction ( msg2, 8, 150, 150, 200 )
		outputLog( "[HELP]: "..getPlayerName(player).." benoetigt Unterstuetzung in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true)..".", "pd")
		if _G[pname.."verstaerkung"] then
			destroyElement ( _G[pname.."verstaerkung"] )
			_G[pname.."verstaerkung"] = nil
			if deletetVerstaerkungBlipTimer then
				killTimer ( deletetVerstaerkungBlipTimer )
			end
			_G[pname.."verstaerkung"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."verstaerkung"], getRootElement(), false)
			for i, targetplayer in ipairs ( getElementsByType("player") ) do
				if isOnStateDuty( targetplayer ) then
					setElementVisibleTo(_G[pname.."verstaerkung"], targetplayer, true)
				end
			end
				deletetVerstaerkungBlipTimer = setTimer ( deletetVerstaerkungBlip, 20000, 1, pname )
		else
			_G[pname.."verstaerkung"] = createBlip (x, y, z, 0, 2, 0, 0, 255, 255, 0, 99999.0)
			setElementVisibleTo(_G[pname.."verstaerkung"], getRootElement(), false)
			for i, targetplayer in ipairs ( getElementsByType("player") ) do
				if isOnStateDuty( targetplayer ) then
					setElementVisibleTo(_G[pname.."verstaerkung"], targetplayer, true)
				end
			end
			deletetVerstaerkungBlipTimer = setTimer ( deletetVerstaerkungBlip, 20000, 1, pname )
		end
	end
end
addEvent ("getVerstaerkung", true )
addEventHandler ("getVerstaerkung", getRootElement(), getVerstaerkung_func )

function deletetVerstaerkungBlip (pname)

	destroyElement ( _G[pname.."verstaerkung"] )
	_G[pname.."verstaerkung"] = nil
end

function suspectGUI_func ( player, target, wanteds, fix, r1)
	if player == client or not client then
		if tonumber(wanteds) then
			if (tonumber(wanteds) >= 1) and (tonumber(wanteds) <= 6) then
				if r1 == nil then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Grund angeben!", 7500, 125, 0, 0 )
				else
					if isOnStateDuty(player) then
						local tplayer = getPlayerFromName ( target )
						local wantedst = tonumber(laGetElementData ( tplayer, "wanteds" ))
						local reason = r1
						if reason == "" then reason = "Unbekannt" end
						local level
						local fixi
						local vorzeichen
						if fix == "delete" then
							level = wantedst - wanteds
							fixi = "runter"
							vorzeichen = "-"
						else
							level = wantedst + wanteds
							fixi = "hoch"
							vorzeichen = "+"
						end
						if level >= 6 then
							level = 6
						elseif level <= 0 then
							level = 0
						end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
							if getElementData ( player, "securityzone" ) == 1 then
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nRaus aus der Schutzzone!", 7500, 125, 0, 0 )
							else
								outputChatBox ( "Dein Wantedlevel wurde auf "..level.." ("..vorzeichen..""..wanteds..") "..fixi.."gesetzt.", tplayer, 255, 255, 0 )
								outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
								local msg = getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..level.." ("..vorzeichen..""..wanteds..") "..fixi.."gesetzt."
								sendMSGForFaction ( msg, 1, 0, 0, 200 )
								sendMSGForFaction ( msg, 6, 0, 0, 200 )
								sendMSGForFaction ( msg, 8, 0, 0, 200 )
								local msg2 = "Grund: "..reason..""
								sendMSGForFaction ( msg2, 1, 0, 0, 200 )
								sendMSGForFaction ( msg2, 6, 0, 0, 200 )
								sendMSGForFaction ( msg2, 8, 0, 0, 200 )
								laSetElementData ( tplayer, "wanteds", tonumber(level))
								setPlayerWantedLevel (tplayer, tonumber(level))
								outputLog( "[WANTEDS]: "..getPlayerName(player).." hat das Wantedlevel von "..target.." auf "..level.." "..fixi.."gesetzt.", "pd")
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültiger Spieler!", 7500, 125, 0, 0 )
						end
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWanteds zwischen 1 und 6!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWantedanzahl angeben!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ("suspectGUI", true )
addEventHandler ("suspectGUI", getRootElement(), suspectGUI_func )


function stvopunkteGUI_func ( player, target, anzahl, fix, r1 )
	if player == client or not client then
		if tonumber(anzahl) then
			if (tonumber(anzahl) >= 1) and (tonumber(anzahl) <= 15) then
				if r1 == nil then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Grund angeben!", 7500, 125, 0, 0 )
				else
					if isOnStateDuty(player) then
						local tplayer = getPlayerFromName ( target )
						local stvot = tonumber(laGetElementData ( tplayer, "stvo" ))
						local reason = r1
						if reason == "" then reason = "Unbekannt" end
						local level
						local fixi
						local vorzeichen
						if fix == "delete" then
							level = stvot - anzahl
							fixi = "runter"
							vorzeichen = "-"
						else
							level = stvot + anzahl
							fixi = "hoch"
							vorzeichen = "+"
						end
						if level >= 15 then
							level = 15
						elseif level <= 0 then
							level = 0
						end
						if getElementType ( tplayer ) == "player" and laGetElementData ( tplayer, "loggedin" ) == 1 then
							laSetElementData ( tplayer, "stvo", level )
							outputChatBox ( "Deine StVO-Punkte wurden um "..vorzeichen..""..anzahl.." auf "..level.." "..fixi.."gesetzt.", tplayer, 255, 255, 0 )
							outputChatBox ( "Grund: "..reason..", Gemeldet von: "..getPlayerName(player), tplayer, 255, 255, 0 )
							local msg = getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..level.." "..fixi.."gesetzt ("..vorzeichen..""..anzahl..")."
							sendMSGForFaction ( msg, 1, 0, 0, 200 )
							sendMSGForFaction ( msg, 6, 0, 0, 200 )
							sendMSGForFaction ( msg, 8, 0, 0, 200 )
							local msg2 = "Grund: "..reason..""
							sendMSGForFaction ( msg2, 1, 0, 0, 200 )
							sendMSGForFaction ( msg2, 6, 0, 0, 200 )
							sendMSGForFaction ( msg2, 8, 0, 0, 200 )
							outputLog( "[StVO]: "..getPlayerName(player).." hat die StVO-Punkte von "..target.." auf "..level.." "..fixi.."gesetzt.", "pd")
							if laGetElementData ( tplayer, "stvo" ) >= 15 then
								laSetElementData ( tplayer, "carlicense", 0 )
								laSetElementData ( tplayer, "stvo", 0 )
								MySQL_SetString("userdata", "Autofuehrerschein", laGetElementData ( tplayer, "carlicense" ), "Name LIKE '"..target.."'")
								outputChatBox ( "Wegen deines schlechten Fahrverhaltens wurde dir dein Führerschein abgenommen!", tplayer, 150, 0, 0 )
							else
								outputChatBox ( "Du hast bereits "..level.." StVO-Punkte. Bei 15 wird dir dein Führerschein entzogen!", tplayer, 255, 255, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
						end
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nStVO-Punkte zwischen 1 und 15!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nAnzahl StVO-Punkte angeben!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ("stvopunkteGUI", true )
addEventHandler ("stvopunkteGUI", getRootElement(), stvopunkteGUI_func )