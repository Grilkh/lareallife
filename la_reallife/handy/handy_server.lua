function handychange_func ( player )
		if laGetElementData ( player, "handyaway" ) == "yes" then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Handy bei dir!", 5000, 200, 0, 0 )
		else
			if laGetElementData ( player, "handystate" ) == "on" then
				laSetElementData ( player, "handystate", "off" )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHandy ausgeschaltet!", 5000, 200, 0, 0 )
			else
				laSetElementData ( player, "handystate", "on" )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHandy angeschaltet!", 5000, 0, 200, 0 )
			end
		end
end
addEvent ( "handychange", true )
addEventHandler ( "handychange", getRootElement(), handychange_func )
addCommandHandler ( "handychange", handychange_func )

function smscmd_func ( player, cmd, number, ... )

	if number then
		local parametersTable = {...}
		local sendtext = table.concat( parametersTable, " " )
		if sendtext then
			if #sendtext >= 1 then
				SMS_func ( player, tonumber(number), sendtext )
			else
				outputChatBox ( "Bitte gib einen Text ein!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte gib einen Text ein!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Bitte gib eine gültige Nummer an!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "sms", smscmd_func )

function callcmd_func ( player, cmd, number )

	callSomeone_func ( player, number )
end
addCommandHandler ( "call", callcmd_func )

function SMS_func ( player, sendnr, sendtext )
local currentabo = laGetElementData ( player, "handyType" )
local costs = laGetElementData ( player, "handyCosts" )
	if player == client or not client then
		if laGetElementData ( player, "handystate" ) == "on" then
			local pmoney = laGetElementData ( player, "money" )
			if ( currentabo == 2 and costs >= smsprice ) or currentabo ~= 2 then
				for id, playeritem in ipairs(getElementsByType("player")) do 
					if laGetElementData ( playeritem, "telenr" ) then
						if laGetElementData ( playeritem, "telenr" ) == sendnr then
							if laGetElementData ( playeritem, "handystate" ) == "on" then
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSMS versendet!", 5000, 0, 200, 0 )
								playSoundFrontEnd ( player, 40 )
								outputChatBox ( "SMS von "..getPlayerName(player).."("..laGetElementData(player,"telenr").."): "..sendtext, playeritem, 200, 200, 0 )
								if currentabo == 2 then
									laSetElementData ( player, "handyCosts", costs - smsprice )
								elseif currentabo == 1 then
									laSetElementData ( player, "handyCosts", costs + smspriceabo )
								elseif currentabo == 3 then
									laSetElementData ( player, "handyCosts", costs + smspriceflat )
								end
								return
							end
						end
					end
				end
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Handy des Spielers\nist ausgeschaltet oder der\nSpieler ist nicht online!", 7500, 125, 0, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht mehr\ngenug Guthaben!\nDu kannst im 24-7-Shop\ndein Guthaben aufladen.", 5000, 125, 0, 0 )
				outputChatBox ( "Du kannst dein Guthaben in einem 24/7 Shop aufladen. (Rotes S auf der Karte)", player, 125, 125, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Handy ist aus!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "SMS", true )
addEventHandler ( "SMS", getRootElement(), SMS_func )

function acceptcall_func ( player, cmd, callid )
	if isCop(player) and isOnStateDuty(player) then
		if tonumber(callid) then
		callid = tonumber(callid)
		if callid > 0 then
			for id, caller in pairs(getElementsByType("player")) do
				--outputChatBox ( "1", getRootElement(), 150, 150, 255 )
				if tonumber(laGetElementData(caller, "officercall")) == callid then
					--outputChatBox ( "2", getRootElement(), 150, 150, 255 )
					if caller ~= player then
						--outputChatBox ( "3", getRootElement(), 150, 150, 255 )
						if laGetElementData(caller, "callswithpolice") == true then
							--outputChatBox ( "4", getRootElement(), 150, 150, 255 )
							for id, officer in pairs(getElementsByType("player")) do
								--outputChatBox ( "5", getRootElement(), 150, 150, 255 )
								if(isOnStateDuty(officer)) and (isCop(officer)) then
									--outputChatBox ( "6", getRootElement(), 150, 150, 255 )
									outputChatBox ( ""..getPlayerName(player).." hat den Notruf ["..callid.."] entgegengenommen!", officer, 150, 150, 255 )
								end
							end
							laSetElementData ( player, "call", true )
							laSetElementData ( caller, "call", true )
							laSetElementData ( player, "callswith", getPlayerName ( caller ) )
							laSetElementData ( caller, "callswith", getPlayerName ( player ) )
							outputChatBox ( "Notruf entgegengenommen! Es ist Officer "..getPlayerName(player).."!", caller, 0, 150, 0 )
						else
							outputChatBox ( "Dieser Notruf wurde bereits bearbeitet oder ist nicht mehr aktuell!", player, 150, 0, 0 )
						end
					end
				end
			end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
	elseif isMedicDuty(player) then
		if tonumber(callid) then
		callid = tonumber(callid)
		if callid > 0 then
			for id, caller in pairs(getElementsByType("player")) do
				if tonumber(laGetElementData(caller, "mediccall")) == callid then
					if caller ~= player then
						if laGetElementData(caller, "callswithmedic") == true then
							for id, officer in pairs(getElementsByType("player")) do
								if isMedicDuty(officer) then
									outputChatBox ( ""..getPlayerName(player).." hat den Notruf ["..callid.."] entgegengenommen!", officer, 150, 150, 255 )
								end
							end
							laSetElementData ( player, "call", true )
							laSetElementData ( caller, "call", true )
							laSetElementData ( player, "callswith", getPlayerName ( caller ) )
							laSetElementData ( caller, "callswith", getPlayerName ( player ) )
							outputChatBox ( "Notruf entgegengenommen! Es ist Sanitäter "..getPlayerName(player).."!", caller, 0, 150, 0 )
						else
							outputChatBox ( "Dieser Notruf wurde bereits bearbeitet oder ist nicht mehr aktuell!", player, 150, 0, 0 )
						end
					end
				end
			end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
	elseif isMechanikerDuty(player) then
		if tonumber(callid) then
		callid = tonumber(callid)
		if callid > 0 then
			for id, caller in pairs(getElementsByType("player")) do
				if tonumber(laGetElementData(caller, "mechanikcall")) == callid then
					if caller ~= player then
						if laGetElementData(caller, "callswithmechanik") == true then
							for id, officer in pairs(getElementsByType("player")) do
								if isMechanikerDuty(officer) then
									outputChatBox ( ""..getPlayerName(player).." hat den Notruf ["..callid.."] entgegengenommen!", officer, 150, 150, 255 )
								end
							end
							laSetElementData ( player, "call", true )
							laSetElementData ( caller, "call", true )
							laSetElementData ( player, "callswith", getPlayerName ( caller ) )
							laSetElementData ( caller, "callswith", getPlayerName ( player ) )
							outputChatBox ( "Notruf entgegengenommen! Es ist Mechaniker "..getPlayerName(player).."!", caller, 0, 150, 0 )
						else
							outputChatBox ( "Dieser Notruf wurde bereits bearbeitet oder ist nicht mehr aktuell!", player, 150, 0, 0 )
						end
					end
				end
			end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
		else
			outputChatBox ( "Verwende /acceptcall [ID]", player, 150, 0, 0 )
		end
	else
		outputChatBox ( "Du bist nicht befugt!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "acceptcall", acceptcall_func )

local officercall = 0
local mediccall = 0
local mechanikcall = 0
function callSomeone_func ( player, number )
local currentabo = laGetElementData ( player, "handyType" )
local costs = laGetElementData ( player, "handyCosts" )
	if player == client or not client then
		if laGetElementData ( player, "handystate" ) == "on" then
			local pmoney = laGetElementData ( player, "money" )
			if number == "*100#" then
				if currentabo == 2 then
					outputChatBox ( "Aktuelles Guthaben: "..costs.."$", player, 200, 200, 0 )
					outputChatBox ( "Kosten: "..callprice.."$/Anruf und "..smsprice.."$/SMS!", player, 200, 200, 0 )
				elseif currentabo == 3 then
					outputChatBox ( "Du hast eine Flatrate, Kosten pro Stunde: "..flatrateprice.."$. Kosten zurzeit: "..costs.."$", player, 200, 200, 0 )
					outputChatBox ( "Kosten: "..callpriceflat.."$/Anruf und "..smspriceflat.."$/SMS!", player, 200, 200, 0 )
				elseif currentabo == 1 then
					outputChatBox ( "Dein Handyvertrag kostet pro Stunde "..aboprice.."$. Du hast bereits "..costs.."$ verbraucht.", player, 200, 200, 0 )
					outputChatBox ( "Kosten: "..callpriceabo.."$/Anruf und "..smspriceabo.."$/SMS!", player, 200, 200, 0 )
				end
			elseif not speznr[tonumber(number)] then
				number = tonumber ( number )
				if ( currentabo == 2 and costs >= callprice ) or currentabo ~= 2 then
					for id, playeritem in ipairs(getElementsByType("player")) do 
						if laGetElementData ( playeritem, "telenr" ) then
							if laGetElementData ( playeritem, "telenr" ) == number then
								if laGetElementData ( playeritem, "handystate" ) == "on" then
									if laGetElementData ( player, "call" ) == false then
										if laGetElementData ( playeritem, "call" ) == false then
											outputChatBox ( "Verwende /h, um aufzulegen!", player, 200, 200, 0 )
											outputChatBox ( getPlayerName(player).." (Nummer: "..laGetElementData(player,"telenr")..") ruft an, verwende /p um abzuheben!", playeritem, 200, 200, 0 )
											laSetElementData ( player, "calls", getPlayerName ( playeritem ) )
											laSetElementData ( playeritem, "calledby", getPlayerName ( player ) )
											laGetElementData ( player, "call", true )
											triggerClientEvent ( playeritem, "phonesound", getRootElement() )
											--[[if currentabo == 2 then
												laSetElementData ( player, "handyCosts", costs - callprice )
											elseif currentabo == 1 then
												laSetElementData ( player, "handyCosts", costs + callpriceabo )
											elseif currentabo == 3 then
												laSetElementData ( player, "handyCosts", costs + callpriceflat )
											end]]
											return
										else
											outputChatBox ( "Der Spieler telefoniert bereits.", player, 125, 0, 0 )
										end
									else
										outputChatBox ( "Du telefonierst bereits!", player, 125, 0, 0 )
									end
								else
									outputChatBox ( "Der Spieler hat sein Handy ausgeschaltet!", player, 125, 0, 0 )
								end
							end
						end
					end
					if laGetElementData ( player, "money" ) == pmoney then
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nWenn nichts im Chat steht,\nist der Spieler offline!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Guthaben!\nEin Anruf kostet "..callprice.."$!", 7500, 125, 0, 0 )
					outputChatBox ( "Du kannst dein Guthaben in einem 24/7 Shop aufladen. (Rotes S auf der Karte)", player, 125, 125, 0 )
				end
			else
				--speznr = { [911]=true, [1]=true, [400]=true, [666]=true }
				number = tonumber ( number )
				if (number == 911) or (number == 110) then
					local officers = 0
					for index, officer in pairs(getElementsByType("player")) do
						if(isOnStateDuty(officer)) and (isCop(officer)) then
							officers = officers + 1
							outputChatBox ( "[NOTRUF]: "..getPlayerName(player).." [ID: "..(officercall+1).."] hat einen Notruf getätigt! Verwende /acceptcall [ID]!", officer, 150, 150, 255 )
						end
					end
					if officers > 0 then
						outputChatBox ( "Sie sprechen mit dem Los Angeles Police Department - Ein Officer kümmert sich gleich um Sie!", player, 200, 200, 0 )
						laSetElementData ( player, "callswithpolice", true )
						officercall = officercall + 1
						laSetElementData ( player, "officercall", officercall)
					else
						outputChatBox ( "Sie sprechen mit dem Anrufbeantworter des LAPDs - Leider ist kein Officer im Dienst!", player, 200, 200, 0 )
					end
				elseif number == 112 then
					local officers = 0
					for index, officer in pairs(getElementsByType("player")) do
						if isMedicDuty(officer) then
							officers = officers + 1
							outputChatBox ( "[NOTRUF]: "..getPlayerName(player).." [ID: "..(mediccall+1).."] hat einen Notruf getätigt! Verwende /acceptcall [ID]!", officer, 150, 150, 255 )
						end
					end
					if officers > 0 then
						outputChatBox ( "Sie sprechen mit dem Los Angeles Emergency Medics - Ein Sanitäter kümmert sich gleich um Sie!", player, 200, 200, 0 )
						laSetElementData ( player, "callswithmedic", true )
						mediccall = mediccall + 1
						laSetElementData ( player, "mediccall", mediccall)
					else
						outputChatBox ( "Sie sprechen mit dem Anrufbeantworter der LAE-Medics - Leider ist kein Sanitäter im Dienst!", player, 200, 200, 0 )
					end
				elseif number == 7676 then
					local officers = 0
					for index, officer in pairs(getElementsByType("player")) do
						if isMechanikerDuty(officer) then
							officers = officers + 1
							outputChatBox ( "[NOTRUF]: "..getPlayerName(player).." [ID: "..(mechanikcall+1).."] hat einen Notruf getätigt! Verwende /acceptcall [ID]!", officer, 150, 150, 255 )
						end
					end
					if officers > 0 then
						outputChatBox ( "Sie sprechen mit den Los Angeles Emergency Mechanikern - Ein Mechaniker kümmert sich gleich um Sie!", player, 200, 200, 0 )
						laSetElementData ( player, "callswithmechanik", true )
						mechanikcall = mechanikcall + 1
						laSetElementData ( player, "mechanikcall", mechanikcall)
					else
						outputChatBox ( "Sie sprechen mit dem Anrufbeantworter der LAE-Mechaniker - Leider ist kein Mechaniker im Dienst!", player, 200, 200, 0 )
					end
				elseif number == 400 then
					orderTaxi ( player )
				elseif number == 666 then
					outputChatBox ( "Der Teufel ist gerade beschäfigt!", player, 0, 0, 125 )
				elseif number == 111 then
					outputChatBox ( "Guten Tag, Sie sprechen mit der Auskunft. Wie kann ich Ihnen helfen?", player, 0, 0, 125 )
					laSetElementData ( player, "callswithinfo", true )
				elseif number == 100 then
					if currentabo == 2 then
						outputChatBox ( "Aktuelles Guthaben: "..costs.."$", player, 200, 200, 0 )
						outputChatBox ( "Kosten: "..callprice.."$/Anruf und "..smsprice.."$/SMS!", player, 200, 200, 0 )
					elseif currentabo == 3 then
						outputChatBox ( "Du hast eine Flatrate, Kosten pro Stunde: "..flatrateprice.."$. Kosten zurzeit: "..costs.."$", player, 200, 200, 0 )
						outputChatBox ( "Kosten: "..callpriceflat.."$/Anruf und "..smspriceflat.."$/SMS!", player, 200, 200, 0 )
					elseif currentabo == 1 then
						outputChatBox ( "Dein Handyvertrag kostet pro Stunde "..aboprice.."$. Du hast bereits "..costs.."$ verbraucht.", player, 200, 200, 0 )
						outputChatBox ( "Kosten: "..callpriceabo.."$/Anruf und "..smspriceabo.."$/SMS!", player, 200, 200, 0 )
					end
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Handy ist aus!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "callSomeone", true )
addEventHandler ( "callSomeone", getRootElement(), callSomeone_func )

function hangup ( player )

	if laGetElementData ( player, "call") == true then
		laSetElementData ( getPlayerFromName ( laGetElementData ( player, "calls" ) ), "calledby", "none" )
		local caller = getPlayerFromName ( laGetElementData ( player, "callswith" ) )
		if caller then
			laSetElementData ( caller, "callswith", "none" )
			laSetElementData ( caller, "call", false )
			laSetElementData ( caller, "calls", "none" )
			laSetElementData ( caller, "callswith", "none" )
			laSetElementData ( caller, "calledby", "none" )
			laSetElementData ( caller, "callswithpolice", false )
			laSetElementData ( player, "callswithmedic", false )
			laSetElementData ( player, "callswithmechanik", false )
		end
		laSetElementData ( player, "callswith", "none" )
		laSetElementData ( player, "call", false )
		laSetElementData ( player, "calls", "none" )
		laSetElementData ( player, "callswith", "none" )
		laSetElementData ( player, "calledby", "none" )
		outputChatBox ( "Du hast die Verbindung beendet.", player, 200, 200, 0 )
		if getPlayerPing ( caller ) ~= false then outputChatBox ( "Dein Gesprächspartner hat die Verbindung beendet.", caller, 200, 200, 0 ) end
		if laGetElementData ( player, "tazered") == false then
			setTimer(phonein,500,1,player)
		end
	else
		outputChatBox ( "Du wirst nicht angerufen!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "h", hangup )

function pickup ( player )

	local caller = getPlayerFromName ( laGetElementData ( player, "calledby" ) )
	laSetElementData ( player, "calledby", "none" )
	if caller and laGetElementData ( player, "call" ) == false then
		laSetElementData ( player, "call", true )
		laSetElementData ( caller, "call", true )
		laSetElementData ( player, "callswith", getPlayerName ( caller ) )
		laSetElementData ( caller, "callswith", getPlayerName ( player ) )
		outputChatBox ( "Abgehoben.", player, 0, 125, 0 )
		outputChatBox ( "Abgehoben.", caller, 0, 125, 0 )
		setTimer(phoneout,500,1,player)
		local currentabo = laGetElementData ( caller, "handyType" )
		local costs = laGetElementData ( caller, "handyCosts" )
		if currentabo == 2 then
			laSetElementData ( caller, "handyCosts", costs - callprice )
		elseif currentabo == 1 then
			laSetElementData ( caller, "handyCosts", costs + callpriceabo )
		elseif currentabo == 3 then
			laSetElementData ( caller, "handyCosts", costs + callpriceflat )
		end
	else
		outputChatBox ( "Du kannst keinen Anruf entgegennehmen.", player, 125, 0, 0 )
	end
end
addCommandHandler ( "p", pickup )

function changeTarif_func (player, abo)
local currentabo = laGetElementData ( player, "handyType" )
local costs = laGetElementData ( player, "handyCosts" )
local bmoney = laGetElementData ( player, "bankmoney" )
if currentabo == 1 then
cost = costs + 50
elseif currentabo == 2 then
cost = costs
elseif currentabo == 3 then
cost = costs + 25
end
if cost <= bmoney then
	if abo == 1 then --Vertrag
		laSetElementData ( player, "handyType", 1 )
		laSetElementData ( player, "handyCosts", 0 )
		if currentabo == 2 then
			outputChatBox ( "Du hast jetzt einen Handyvertrag! Dein Restguthaben kann nicht weiter verwendet werden.", player, 150, 150, 0 )
		else
			outputChatBox ( "Du hast jetzt einen Handyvertrag! Du hast deine jetzige Handyrechnung + "..cost.."$ bezahlt.", player, 150, 150, 0 )
		end
		outputChatBox ( "Du bezahlst jetzt jede Stunde "..aboprice.."$. Kosten: "..callpriceabo.."$/Anruf und "..smspriceabo.."$/SMS!", player, 150, 150, 0 )
	elseif abo == 2 then --Prepaid
		laSetElementData ( player, "handyType", 2 )
		laSetElementData ( player, "handyCosts", 0 )
		outputChatBox ( "Du hast jetzt ein Prepaid-Handy! Du hast deine jetzige Handyrechnung bezahlt und "..cost.."$ bezahlt.", player, 150, 150, 0 )
		outputChatBox ( "Guthaben kannst du hier im 24/7 Shop erwerben. Kosten: "..callprice.."$/Anruf und "..smsprice.."$/SMS!", player, 150, 150, 0 )
	elseif abo == 3 then --Flatrate
		laSetElementData ( player, "handyType", 3 )
		laSetElementData ( player, "handyCosts", 0 )
		if currentabo == 2 then
			outputChatBox ( "Du hast jetzt eine Flatrate! Dein Restguthaben kann nicht weiter verwendet werden.", player, 150, 150, 0 )
		else
			outputChatBox ( "Du hast jetzt eine Flatrate! Du hast deine jetzige Handyrechnung + "..cost.."$ bezahlt.", player, 150, 150, 0 )
		end
		outputChatBox ( "Du bezahlst jetzt jede Stunde "..flatrateprice.."$, Kosten: "..callpriceflat.."$/Anruf und "..smspriceflat.."$/SMS!", player, 150, 150, 0 )
	end
else
	outputChatBox ( "Du hast nicht genug Geld auf der Bank um die jetzige Handyrechnung + Wechselgebühren zu bezahlen!.", player, 150, 0, 0 )
end
end
addEvent ( "changeTarif", true )
addEventHandler ( "changeTarif", getRootElement(), changeTarif_func )