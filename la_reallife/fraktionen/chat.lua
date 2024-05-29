function teamchat_func ( player, cmd, ... )	
	
	local parametersTable = {...}
	local text = table.concat( parametersTable, " " )
	local Fraktion = tonumber(laGetElementData ( player, "fraktion" ))
	local Permission = laGetElementData ( player, "permission" )
	local FRank = tonumber(laGetElementData ( player, "rang" ))
	if Fraktion >= 1 then
		if text == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			local red = 0
			local green = 0
			local blue = 0
			local title = "Unbekannt"
			if Fraktion == 1 then
				if FRank == 0 then title = "Officer" end
				if FRank == 1 then title = "Detective" end
				if FRank == 2 then title = "Inspector" end
				if FRank == 3 then title = "Captain" end
				if FRank == 4 then title = "Commander" end
				if FRank == 5 then title = "Deputy Chief" end
				if FRank == 6 then title = "Chief" end
				red = 50
				green = 50
				blue = 255
			end
			if Fraktion == 2 then
				if FRank == 0 then title = "Contendente" end
				if FRank == 1 then title = "Venuto" end
				if FRank == 2 then title = "Guerriero" end
				if FRank == 3 then title = "Assasino" end
				if FRank == 4 then title = "Righello" end
				if FRank == 5 then title = "Corleone" end
				if FRank == 6 then title = "Il Padrino" end
				red = 50
				green = 50
				blue = 50
			end
			if Fraktion == 3 then
				if FRank == 0 then title = "Shinjin" end
				if FRank == 1 then title = "Ani" end
				if FRank == 2 then title = "Senshi" end
				if FRank == 3 then title = "Kobun" end
				if FRank == 4 then title = "Wakagashira" end
				if FRank == 5 then title = "Oyabun" end
				if FRank == 6 then title = "Masuta" end
				red = 100
				green = 150
				blue = 200
			end
			if Fraktion == 5 then
				if FRank == 0 then title = "Zeitungsjunge" end
				if FRank == 1 then title = "Klatschtante" end
				if FRank == 2 then title = "Zeitungsreporter" end
				if FRank == 3 then title = "Reporter" end
				if FRank == 4 then title = "Journalist" end
				if FRank == 5 then title = "Chefredakteur" end
				if FRank == 6 then title = "Leitender Redakteur" end
				red = 255
				green = 70
				blue = 0
			end
			if Fraktion == 6 then
				if FRank == 0 then title = "Agent" end
				if FRank == 1 then title = "Special Agent" end
				if FRank == 2 then title = "Supervisory Special Agent" end
				if FRank == 3 then title = "Special Agent-in-Charge" end
				if FRank == 4 then title = "Assistant Director" end
				if FRank == 5 then title = "Deputy Director" end
				if FRank == 6 then title = "Director" end
				red = 70
				green = 60
				blue = 140
			end
			if Fraktion == 7 then
				if FRank == 0 then title = "Ilegado" end
				if FRank == 1 then title = "Teniente" end
				if FRank == 2 then title = "Matador" end
				if FRank == 3 then title = "Traficante" end
				if FRank == 4 then title = "Abogado" end
				if FRank == 5 then title = "Padre" end
				if FRank == 6 then title = "Mandanze" end
				red = 255
				green = 215
				blue = 0
			end
			if Fraktion == 8 then
				if FRank == 0 then title = "Private" end
				if FRank == 1 then title = "Corporal" end
				if FRank == 2 then title = "Sergeant" end
				if FRank == 3 then title = "Lieutenant" end
				if FRank == 4 then title = "Major" end
				if FRank == 5 then title = "Colonel" end
				if FRank == 6 then title = "General" end
				red = 0
				green = 125
				blue = 0
			end
			if Fraktion == 9 then
				if FRank == 0 then title = "Newbie" end
				if FRank == 1 then title = "Coolman" end
				if FRank == 2 then title = "Homeboy" end
				if FRank == 3 then title = "Dealer" end
				if FRank == 4 then title = "Banger" end
				if FRank == 5 then title = "Big Boss" end
				if FRank == 6 then title = "Beatbanger" end
				red = 0
				green = 50
				blue = 0
			end
			if Fraktion == 10 then
				if FRank == 0 then title = "Driver" end
				if FRank == 1 then title = "Fighter" end
				if FRank == 2 then title = "Hustler" end
				if FRank == 3 then title = "Soldier" end
				if FRank == 4 then title = "Brain" end
				if FRank == 5 then title = "Drogenbaron" end
				if FRank == 6 then title = "Lowrida" end
				red = 100
				green = 0
				blue = 100
			end
			if Fraktion == 11 then
				if FRank == 0 then title = "Bombenersteller" end
				if FRank == 1 then title = "Bombenleger" end
				if FRank == 2 then title = "Selbstmordbomber" end
				if FRank == 3 then title = "Taliban" end
				if FRank == 4 then title = "Katjuschadriver" end
				if FRank == 5 then title = "Bin Laden" end
				if FRank == 6 then title = "Überlebender" end
				red = 100
				green = 0
				blue = 0
			end
			if Fraktion == 4 then
				if Permission == "mechaniker" then
					if FRank == 0 then title = "Praktikant" end
					if FRank == 1 then title = "Reifenmonteur" end
					if FRank == 2 then title = "Mechaniker" end
					if FRank == 3 then title = "Mechatroniker" end
					if FRank == 4 then title = "Chef-Mechaniker" end
					if FRank == 5 then title = "Garagenaufseher" end
					if FRank == 6 then title = "Notdienstleiter" end
					red = 50
					green = 50
					blue = 50
					local players = getElementsByType ( "player" )
						for theKey, thePlayer in ipairs ( players ) do
							if isMechaniker (thePlayer) then
								outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", thePlayer, red, green, blue )
							end
						end
					return
				elseif Permission == "medic" then
					if FRank == 0 then title = "Student" end
					if FRank == 1 then title = "Krankenpfleger" end
					if FRank == 2 then title = "Sanitäter" end
					if FRank == 3 then title = "Doktor" end
					if FRank == 4 then title = "Chirurg" end
					if FRank == 5 then title = "Oberarzt" end
					if FRank == 6 then title = "Notdienstleiter" end		
					red = 50
					green = 100
					blue = 150
					local players = getElementsByType ( "player" )
						for theKey, thePlayer in ipairs ( players ) do
							if isMedic (thePlayer) then
								outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", thePlayer, red, green, blue )
							end
						end
					return
				else
					title = "Uneingeteilt"
				end
			end
			for playeritem, index in pairs(fraktionMembers[Fraktion]) do 
				outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", playeritem, red, green, blue )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in keiner Fraktion!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "t", teamchat_func )

function gteamchat_func ( player, cmd, ... )	
	
	local parametersTable = {...}
	local text = table.concat( parametersTable, " " )
	local Fraktion = tonumber(laGetElementData ( player, "fraktion" ))
	local Permission = laGetElementData ( player, "permission" )
	local FRank = tonumber(laGetElementData ( player, "rang" ))
	if Fraktion == 1 or Fraktion == 6 or Fraktion == 8 or Fraktion == 4 then
		if text == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			red = 140
			green = 10
			blue = 10
			local title = "Unbekannt"
			if Fraktion == 1 then
				if FRank == 0 then title = "[PD]Officer" end
				if FRank == 1 then title = "[PD]Detective" end
				if FRank == 2 then title = "[PD]Inspector" end
				if FRank == 3 then title = "[PD]Captain" end
				if FRank == 4 then title = "[PD]Commander" end
				if FRank == 5 then title = "[PD]Deputy Chief" end
				if FRank == 6 then title = "[PD]Chief" end
				red = 140
				green = 10
				blue = 10
			end
			if Fraktion == 6 then
				if FRank == 0 then title = "[FBI]Agent" end
				if FRank == 1 then title = "[FBI]Special Agent" end
				if FRank == 2 then title = "[FBI]Supervisory Special Agent" end
				if FRank == 3 then title = "[FBI]Special Agent-in-Charge" end
				if FRank == 4 then title = "[FBI]Assistant Director" end
				if FRank == 5 then title = "[FBI]Deputy Director" end
				if FRank == 6 then title = "[FBI]Director" end
				red = 140
				green = 10
				blue = 10
			end
			if Fraktion == 8 then
				if FRank == 0 then title = "[ARMY]Private" end
				if FRank == 1 then title = "[ARMY]Corporal" end
				if FRank == 2 then title = "[ARMY]Sergeant" end
				if FRank == 3 then title = "[ARMY]Lieutenant" end
				if FRank == 4 then title = "[ARMY]Major" end
				if FRank == 5 then title = "[ARMY]Colonel" end
				if FRank == 6 then title = "[ARMY]General" end
				red = 140
				green = 10
				blue = 10
			end
			if Fraktion == 4 then
				if Permission == "mechaniker" then
					if FRank == 0 then title = "[MEC]Praktikant" end
					if FRank == 1 then title = "[MEC]Reifenmonteur" end
					if FRank == 2 then title = "[MEC]Mechaniker" end
					if FRank == 3 then title = "[MEC]Mechatroniker" end
					if FRank == 4 then title = "[MEC]Chef-Mechaniker" end
					if FRank == 5 then title = "[MEC]Garagenaufseher" end
					if FRank == 6 then title = "[MEC]Notdienstleiter" end
				elseif Permission == "medic" then
					if FRank == 0 then title = "[MED]Student" end
					if FRank == 1 then title = "[MED]Krankenpfleger" end
					if FRank == 2 then title = "[MED]Sanitäter" end
					if FRank == 3 then title = "[MED]Doktor" end
					if FRank == 4 then title = "[MED]Chirurg" end
					if FRank == 5 then title = "[MED]Oberarzt" end
					if FRank == 6 then title = "[MED]Notdienstleiter" end						
				else
					title = "Uneingeteilt"
				end
				red = 100
				green = 100
				blue = 100
				local players = getElementsByType ( "player" )
					for theKey, thePlayer in ipairs ( players ) do
						if isEmergency (thePlayer) then
							outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", thePlayer, red, green, blue )
						end
					end
				return
			end
			for playeritem, key in pairs(fraktionMembers[1]) do
				outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", playeritem, red, green, blue )
			end
			for playeritem, key in pairs(fraktionMembers[6]) do
				outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", playeritem, red, green, blue )
			end
			for playeritem, key in pairs(fraktionMembers[8]) do
				outputChatBox ( "[ "..title.." "..getPlayerName(player)..": "..text.."]", playeritem, red, green, blue )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in keiner Staatsfraktion!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ("g", gteamchat_func )

--[[LAPD:

Chief
Deputy Chief
Commander
Captain
Inspector
Detective
Officer



FBI:


Director
Deputy Director
Assistant Director
Special Agent-in-Charge
Supervisory Special Agent
Special Agent
Agent



Army:

General
Colonel
Major
Lieutenant
Sergeant
Corporal
Private]]--