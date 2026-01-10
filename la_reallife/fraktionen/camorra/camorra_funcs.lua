mincontract = 5000

local kopfgeldmarker = createMarker ( -1673.942, 1302.516, 6, "cylinder", 1.5, 0, 0, 255, 150 )

local function kopfgeldmarker_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			if isCamorra(hitElement) then
				outputChatBox ( "Für mehr Informationen zum Kopfgeld verwende /kopfgeldinfo.", hitElement, 200, 200, 0 )
			elseif isOnStateDuty(hitElement) then
				outputChatBox ( "Die Pizza am Pier69. Die beste Pizza in der Stadt!", hitElement, 200, 200, 0 )
			else
				outputChatBox ( "Du möchtest jemanden loswerden? Verwende /kopfgeldinfo für mehr Informationen...", hitElement, 200, 200, 0 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", kopfgeldmarker, kopfgeldmarker_func )

function kopfgeldinfo_func ( player, cmd)
local x, y, z = getElementPosition ( player )
local px, py, pz = getElementPosition ( kopfgeldmarker )
	if getDistanceBetweenPoints3D ( x, y, z, px, py, pz ) <= 5 then
		if isCamorra(player) then
			outputChatBox ( "Mit /kopfgeld [Name] [Summe] können Leute einen Auftragsmord einleiten.", player, 200, 200, 0 )
			outputChatBox ( "Es müssen mindestens 5000$ ausgesetzt werden, damit ihr den Auftrag bekommt.", player, 225, 225, 0 )
			outputChatBox ( "Mit /kopfgeldliste siehst du, wer sich auf der Tötungsliste befindet.", player, 200, 200, 0 )
			outputChatBox ( "Wenn ein Gesuchter erfolgreich getötet wird, kommt das Geld in die Fraktionskasse.", player, 225, 225, 0 )		
		elseif isOnStateDuty(player) then
			outputChatBox ( "Wir liefern auch Pizzen! Einfach im Internetbrowser nach Pizza suchen!", player, 200, 200, 0 )
		else
			outputChatBox ( "Du interessierst dich also für einen Auftragsmord.", player, 200, 200, 0 )
			outputChatBox ( "Du musst dir bewusst sein, dass sowas nicht rückgängig gemacht werden kann!", player, 225, 225, 0 )
			outputChatBox ( "Die Camorra kümmert sich um jeden Auftrag. Jedoch verlangen wir mindestens 5000$/Kopf!", player, 200, 200, 0 )
			outputChatBox ( "Verwende /kopfgeld [Name] [Summe], um Kopfgeld auszusetzen.", player, 225, 225, 0 )
		end
	else
		infobox ( player, "\n\nBegib dich zum Pier69!", 5000, 150, 0, 0 )
	end
end
addCommandHandler ( "kopfgeldinfo", kopfgeldinfo_func )


function kopfgeld_func ( player, cmd, name, summe )
local x, y, z = getElementPosition ( player )
local px, py, pz = getElementPosition ( kopfgeldmarker )
	if getDistanceBetweenPoints3D ( x, y, z, px, py, pz ) <= 5 then
		if (not isCamorra ( player )) and (not isOnStateDuty ( player )) then
			local target = getPlayerFromName ( name )
			if target and laGetElementData ( target, "loggedin" ) then
				if not isCamorra ( target ) then
					if not isOnStateDuty ( target ) then
						local summe = tonumber ( summe )
						if summe then
							local pmoney = tonumber ( laGetElementData ( player, "money" ) )
							if pmoney >= summe then
								if summe >= mincontract then
									laSetElementData ( player, "money", pmoney - summe )
									takePlayerMoney ( player, summe )
									playSoundFrontEnd ( player, 40 )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									laSetElementData ( target, "contract", tonumber ( laGetElementData ( target, "contract" ) ) + summe )
									outputChatBox ( "Du hast "..summe.."$ Kopfgeld auf "..name.." ausgesetzt. Jetzt heisst es abwarten...", player, 0, 150, 0 )
								else
									infobox ( player, "\n\nDie Camorra akzeptiert Aufträge\nerst ab "..mincontract.."$!", 5000, 150, 0, 0 )
								end
							else
								infobox ( player, "\n\nDein Bargeld reicht nicht aus,\num diesen Auftragsmord in Auftrag zu geben!", 5000, 150, 0, 0 )
							end
						else
							infobox ( player, "\n\nVerwende /kopfgeld [Name] [Kopfgeld]!", 5000, 150, 0, 0 )
						end
					else
						infobox ( player, "\n\nStaatsbeamte sind ein zu\ngrosses Risiko!", 5000, 150, 0, 0 )
					end
				else
					infobox ( player, "\n\nDie Camorra tötet nicht\nihre eigenen Mitglieder!", 5000, 150, 0, 0 )
				end
			else
				infobox ( player, "\n\nUngültiger Spieler oder\ner ist nicht online!", 5000, 150, 0, 0 )
			end
		else
			infobox ( player, "\n\nDiese Funktion kannst du nicht verwenden!", 5000, 150, 0, 0 )
		end
	else
		infobox ( player, "\n\nBegib dich zum Pier69!", 5000, 150, 0, 0 )
	end
end
addCommandHandler ( "kopfgeld", kopfgeld_func )

function contract_func ( player, cmd)
outputChatBox ( "[INFO]: Die Camorra führt Auftragsmorde aus. Verwende /kopfgeld", player, 200, 200, 0 )
end
addCommandHandler ( "contract", contract_func )

function kopfgeldliste_func ( player )
	if isCamorra ( player ) then
		outputChatBox ( "5 der zurzeit Gesuchten:", player, 50, 50, 150 )
		for id, playeritem in ipairs(getElementsByType("player")) do
			if laGetElementData ( player, "loggedin" ) == 1 then
				local contract = tonumber ( laGetElementData ( playeritem, "contract" ) )
				local i = 0
				if contract >= mincontract then
					local i = i + 1
					outputChatBox ( getPlayerName ( playeritem )..", Kopfgeld: "..contract.."$", player, 200, 200, 100 )
					if i == 5 then
						outputChatBox ( "Verwende /kopfgeldall um alle Gesuchte zu sehen.", player, 0, 150, 0 )
						break
					end
				end
			end
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Camorra!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "kopfgeldliste", kopfgeldliste_func )

function kopfgeldall_func ( player )
	if isCamorra ( player ) then
		outputChatBox ( "Alle Gesuchte:", player, 50, 50, 150 )
		for id, playeritem in ipairs(getElementsByType("player")) do
			if laGetElementData ( player, "loggedin" ) == 1 then
				local contract = tonumber ( laGetElementData ( playeritem, "contract" ) )
				local i = 0
				if contract >= mincontract then
					local i = i + 1
					outputChatBox ( getPlayerName ( playeritem )..", Kopfgeld: "..contract.."$", player, 200, 200, 100 )
					if i == 100 then
						break
					end
				end
			end
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Camorra!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "kopfgeldall", kopfgeldall_func )

function contracts_func ( player )
	if isCamorra ( player ) then
		outputChatBox ( "[INFO]: /kopfgeldliste", player, 200, 200, 0 )
	end
end
addCommandHandler ( "contracts", contracts_func )