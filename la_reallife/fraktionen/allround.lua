fraktionMembers = {}
for i = 0, 99 do
	fraktionMembers[i] = {}
end

fraktionNames = {}
fraktionNames = { [1]="LAPD", [2]="Camorra", [3]="Yakuza", [4]="Notdienst", [5]="Reporter", [6]="FBI", [7]="Surenos", [8]="Army", [9]= "Compton", [10]= "Watts", [11]= "Terroristen" }

function isAdmin(player)
	if tonumber(laGetElementData ( player, "adminlvl" )) >= 2 then return true else return false end
end
function isSMod(player)
	if tonumber(laGetElementData ( player, "adminlvl" )) >= 3 then return true else return false end
end
function isSupporter(player)
	if tonumber(laGetElementData ( player, "adminlvl" )) >= 1 then return true else return false end
end
function isServerleitung(player)
	if tonumber(laGetElementData ( player, "adminlvl" )) >= 4 then return true else return false end
end
function isHigherAdmin(player, target)
	if tonumber(laGetElementData ( player, "adminlvl" )) >= tonumber(laGetElementData ( target, "adminlvl" )) then return true else return false end
end

function isReporter(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 5 then return true else return false end
end
function isEmergency(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 4 then return true else return false end
end
function isMedic(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 4 then
		if laGetElementData ( player, "permission" ) == "medic" then
			return true 
		else 
			return false
		end
	else
		return false
	end
end
function isMechaniker(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 4 then
		if laGetElementData ( player, "permission" ) == "mechaniker" then
			return true 
		else 
			return false
		end
	else
		return false
	end
end

function isTerror(player)
	--if tonumber(laGetElementData ( player, "fraktion" )) == 11 or getTeamName(getPlayerTeam(player)) == "Terror" then return true else return false end
	if tonumber(laGetElementData ( player, "fraktion" )) == 11 then return true else return false end
end
function isYakuza(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 3 then return true else return false end
end
function isCamorra(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 2 then return true else return false end
end
function isCop(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 1 then return true else return false end
end
function isFBI(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 6 then return true else return false end
end
function isSurenos(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 7 then return true else return false end
end
function isArmy(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 8 then return true else return false end
end
function isCompton(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 9 then return true else return false end
end
function isWatts(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 10 then return true else return false end
end
function isZivi(player)
	if tonumber(laGetElementData ( player, "fraktion" )) == 0 then return true else return false end
end
function isNewsVeh(veh)
	if getElementModel(veh) == 488 or getElementModel(veh) == 582 or getElementModel(veh) == 586 or getElementModel(veh) == 409 or getElementModel(veh) == 431 or getElementModel(veh) == 480 then return true else return false end
end
function isGatePermitted(player)
	if fbiSkins[getElementModel(player)] and isFBI(player) or (armySkins[getElementModel(player)] and isArmy(player)) or (isCop(player) and laGetElementData(player, "rang") >= 4) then return true else return false end
end
function isStateFaction(player)
	if isArmy(player) or isCop(player) or isFBI(player) then return true else return false end
end

function isOnStateDuty(player)
	local model = getElementModel(player) 
	if armySkins[model] or fbiSkins[model] or copskins[model] then return true else return false end
end

function isOnDutyCar(player)
	local veh = getPedOccupiedVehicle(player)
	if (armyVehs[veh] or stateVehs[veh] or federalVehicles[veh]) and ( isOnStateDuty(player)) then return true else return false end
end

function isEvil(player)
	if isCamorra(player) or isYakuza(player) or isTerror(player) or isSurenos(player) or isCompton(player) or isWatts(player) then return true else return false end
end
function isInDepotFaction(player)
	if isCamorra(player) or isYakuza(player) or isTerror(player) or isSurenos(player) or isCompton(player) or isReporter(player) or isWatts(player) then return true else return false end
end
function sendMSGForFaction ( msg, faction, r, g, b )
	if not r then
		local r, g, b = 200, 200, 100
	end
	for playeritem, key in pairs ( fraktionMembers[faction] ) do
		outputChatBox ( msg, playeritem, r, g, b )
	end
end
function getFactionMembersOnline ( faction )
	if faction then
		counter = 0
		for playeritem, index in pairs ( fraktionMembers[faction] ) do
			counter = counter + 1
		end
		return counter
	else
		return false
	end
end

function tie_func ( player, cmd, target )

	local target = getPlayerFromName ( target )
	if target and target ~= player and getPedOccupiedVehicle ( target ) then
		if isEvil(player) or isOnStateDuty(player) then
			if getVehicleOccupant ( getPedOccupiedVehicle ( player ) ) ~= target and getPedOccupiedVehicleSeat ( target ) > 0 then
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( target )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
					local boolean = not laGetElementData ( target, "tied" )
					laSetElementData ( target, "tied", boolean )
					toggleAllControls ( target, boolean )
					if boolean then fix = "ent" else fix = "ge" end
					setElementData ( target, "tiedsecur", true)
					if fix == "ent" then
						fadeCamera ( target, true, 0.5, 0, 0, 0 )
						setElementData ( target, "tiedsecur", 0)
					elseif isEvil ( player ) then
						fadeCamera ( target, false, 0.5, 0, 0, 0 )
					end
					outputChatBox ( "Du hast "..getPlayerName(target).." "..fix.."fesselt!", player, 150, 150, 0 )
					if isEvil (player) then
						outputChatBox ( "Du wurdest vom Verbrecher "..getPlayerName(player).." "..fix.."fesselt!", target, 200, 200, 0 )
						outputLog ( "[TIE]: "..getPlayerName(player).." hat "..getPlayerName(target).." "..fix.."fesselt!", "bad")
						local fraktion = tonumber(laGetElementData (player, "fraktion"))
						sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..getPlayerName(target).." "..fix.."fesselt!", fraktion, 150, 150, 0 )
					else
						outputChatBox ( "Du wurdest vom Beamten "..getPlayerName(player).." "..fix.."fesselt!", target, 200, 200, 0 )
						outputLog ( "[TIE]: "..getPlayerName(player).." hat "..getPlayerName(target).." "..fix.."fesselt!", "pd")
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiges Ziel!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in einer\nungültigen Fraktion!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiges Ziel!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "tie", tie_func )

function takehandy_func ( player, cmd, targety )
	local target = getPlayerFromName ( targety )
	local pfraktion = laGetElementData (player, "fraktion")
	if target and target ~= player then
		if isEvil(player) or isOnStateDuty(player) then
			local x1, y1, z1 = getElementPosition ( player )
			local x2, y2, z2 = getElementPosition ( target )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
				if isEvil(player) then
					if laGetElementData ( target, "handsuped" ) or getElementData ( target, "tiedsecur") then
						if laGetElementData ( target, "handyaway" ) == "yes" then
							local entwenderfaction = laGetElementData ( target, "handyfaction")
							if pfraktion == entwenderfaction then
								laSetElementData ( target, "handyaway", "no" )
								laSetElementData ( target, "handystate", "off" )
								laSetElementData ( target, "handyfaction", "")
								outputChatBox ( "Du hast "..targety.." sein Handy zurückgegeben!", player, 150, 150, 0 )
								outputLog ( "[HANDY]: "..getPlayerName(player).." hat "..targety.." sein Handy zurueckgegeben!", "bad")
								local fraktion = tonumber(laGetElementData (player, "fraktion"))
								sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..targety.." sein Handy zurückgegeben!", fraktion, 150, 150, 0 )
								if getElementData ( target, "tiedsecur") then
									outputChatBox ( "Ein Verbrecher hat dir dein Handy zurückgegeben!", target, 0, 150, 0 )
								else
									outputChatBox ( "Verbrecher "..getPlayerName(player).." hat dir dein Handy zurückgegeben!", target, 0, 150, 0 )
								end
							else
								outputChatBox ( "Du hast das Handy von "..targety.." nicht!", player, 150, 0, 0 )
							end
						else
							laSetElementData ( target, "handyaway", "yes" )
							laSetElementData ( target, "handystate", "off" )
							laSetElementData ( target, "handyfaction", pfraktion)
							outputChatBox ( "Du hast "..targety.." sein Handy entwendet!", player, 0, 150, 0 )
							outputLog ( "[HANDY]: "..getPlayerName(player).." hat "..targety.." sein Handy entwendet!", "bad")
							local fraktion = tonumber(laGetElementData (player, "fraktion"))
							sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..targety.." sein Handy entwendet!", fraktion, 150, 150, 0 )
							if getElementData ( target, "tiedsecur") then
								outputChatBox ( "Ein Verbrecher hat dir dein Handy entwendet!", target, 150, 0, 0 )
							else
								outputChatBox ( "Verbrecher "..getPlayerName(player).." hat dir dein Handy entwendet!", target, 150, 0, 0 )
							end
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht gefesselt\nund hat sich nicht ergeben!", 5000, 125, 0, 0 )
					end
				elseif isOnStateDuty(player) then
					if laGetElementData ( target, "tazered" ) or laGetElementData ( target, "handsuped" ) or getElementData ( target, "tiedsecur") then
						if laGetElementData ( target, "handyaway" ) == "yes" then
							local entwenderfaction = laGetElementData ( target, "handyfaction")
							if pfraktion == entwenderfaction then
								laSetElementData ( target, "handyaway", "no" )
								laSetElementData ( target, "handystate", "off" )
								laSetElementData ( target, "handyfaction", "")
								outputChatBox ( "Du hast "..targety.." sein Handy zurückgegeben!", player, 150, 150, 0 )
								outputChatBox ( "Der Beamte "..getPlayerName(player).." hat dir dein Handy zurückgegeben!", target, 0, 150, 0 )
								outputLog ( "[HANDY]: "..getPlayerName(player).." hat "..targety.." sein Handy zurueckgegeben!", "pd")
							else
								outputChatBox ( "Du hast das Handy von "..targety.." nicht!", player, 150, 0, 0 )
							end
						else
							laSetElementData ( target, "handyaway", "yes" )
							laSetElementData ( target, "handystate", "off" )
							outputChatBox ( "Du hast "..targety.." sein Handy entwendet!", player, 0, 150, 0 )
							outputChatBox ( "Der Beamte "..getPlayerName(player).." hat dir dein Handy entwendet!", target, 150, 0, 0 )
							outputLog ( "[HANDY]: "..getPlayerName(player).." hat "..targety.." sein Handy entwendet!", "pd")
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht gefesselt\nund hat sich nicht ergeben!", 5000, 125, 0, 0 )
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in einer\nungültigen Fraktion!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiges Ziel!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "takehandy", takehandy_func )


function takemoney_func ( player, cmd, target )
	local playerid = getPlayerFromName ( target )
	if player == client or not client then
		if playerid then
			local x1, y1, z1 = getElementPosition ( player )
			local x2, y2, z2 = getElementPosition ( target )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
				if isOnStateDuty(player)then
					if getElementData ( playerid, "tiedsecur") then
						local fraktion = tonumber(laGetElementData (player, "fraktion"))
						local money = laGetElementData (playerid, "money")
						local wanteds = laGetElementData ( playerid, "wanteds" )
						if wanteds == 6 then
							if (tonumber(money) > 0) then
								outputChatBox ( "Du hast "..target.." seine gesamtes Bargeld abgenommen!", player, 0, 125, 0 )
								outputChatBox ( "Staatsbeamter "..getPlayerName(player).." hat dir dein gesamtes Bargeld abgenommen!", playerid, 125, 0, 0 )
								laSetElementData ( playerid, "money", 0 )
								local lohn = money/100
								laSetElementData ( player, "boni", laGetElementData ( player, "boni" ) + lohn)
								outputChatBox ( "Du kriegst beim nächsten Lohn "..lohn.."$ Bonus, da du "..money.."$ abgegeben hast!", player, 0, 150, 0 )
								local msg = getPlayerName(player).." hat "..money.."$ von "..target.." beschlagnahmt."
								sendMSGForFaction ( msg, 1, 0, 0, 200 )
								sendMSGForFaction ( msg, 6, 0, 0, 200 )
								sendMSGForFaction ( msg, 8, 0, 0, 200 )
								outputLog( "[TAKE]: "..getPlayerName(player).." hat "..money.."$ von "..target.." beschlagnahmt. ("..lohn.."$)", "pd")
								local fmoney = MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..fraktion.."'")
								MySQL_SetString("fraktionen", "DepotGeld", fmoney + money, "ID LIKE '"..fraktion.."'")			
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher hat kein\nBargeld bei sich!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Wantedlevel dieser Person\nist niedriger als 6!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht gefesselt!", 5000, 125, 0, 0 )
					end
				elseif isEvil (player) then
					if laGetElementData ( playerid, "handsuped" ) or getElementData ( playerid, "tiedsecur") then
						if laGetElementData (playerid, "ausgeraubt" ) == false then
							local money = laGetElementData (playerid, "money")
							if (tonumber(money) > 0) then
								local takenmoney
								if (tonumber(money) > 500) then
									takenmoney = 500
								else
									takenmoney = money
								end
								if getElementData ( playerid, "tiedsecur") then
									outputChatBox ( "Ein Verbrecher hat dir "..takenmoney.."$ abgenommen!", playerid, 125, 0, 0 )
								else
									outputChatBox ( "Verbrecher "..getPlayerName(player).." hat dir "..takenmoney.."$ abgenommen!", playerid, 125, 0, 0 )
								end
								outputChatBox ( "Dafür hast du jetzt 5 Minuten Immunität gegenüber Raubüberfällen!", playerid, 0, 150, 0 )
								laSetElementData (playerid, "ausgeraubt", true)
								laSetElementData ( playerid, "money", money - takenmoney )
								local pmoney = laGetElementData (player, "money")
								laSetElementData ( player, "money", pmoney + takenmoney )
								setTimer ( ausgeraubtreturn, 300000, 1, playerid )
								outputChatBox ( "Du hast von "..target.." "..takenmoney.."$ entwendet!", player, 0, 125, 0 )
								outputLog ( "[TAKE]: "..getPlayerName(player).." hat von "..target.." "..takenmoney.."$ entwendet!", "bad")
								local fraktion = tonumber(laGetElementData (player, "fraktion"))
								sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat von "..target.." "..takenmoney.."$ entwendet.", fraktion, 0, 150, 0 )
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler hat kein\nBargeld bei sich!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler wurde in den\nletzten 5 Minuten\nbereits ausgeraubt!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht gefesselt\nund hat sich nicht ergeben!", 5000, 125, 0, 0 )
					end	
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in einer\nungültigen Fraktion!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 5000, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "takemoneyGUI", true )
addEventHandler ( "takemoneyGUI", getRootElement(), takemoney_func )
addCommandHandler ( "takemoney", takemoney_func )

function ausgeraubtreturn (player)
	laSetElementData (player, "ausgeraubt", false)
	outputChatBox ( "[INFO]: Pass auf, du kannst wieder ausgeraubt werden!", player, 150, 0, 0 )
end

function fstate_func(player)

	if isCamorra ( player ) then
		fraktion = "Camorra"
	elseif isYakuza ( player ) then
		fraktion = "Yakuza"
	elseif isSurenos ( player ) then
		fraktion = "Suenos"
	elseif isCop ( player ) then
		outputChatBox ( "Geld in der Fraktionskasse: "..MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '1'"), player, 200, 200, 0 )
	elseif isFBI ( player ) then
		outputChatBox ( "Geld in der Fraktionskasse: "..MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '6'"), player, 200, 200, 0 )
	elseif isArmy ( player ) then
		outputChatBox ( "Geld in der Fraktionskasse: "..MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '8'"), player, 200, 200, 0 )
	end
	if isEvil(player) then
		Schlagringe = tonumber(MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE '" ..fraktion.."'"))
		Baseballschlaeger = tonumber(MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE '" ..fraktion.."'"))
		Messer = tonumber(MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE '" ..fraktion.."'"))
		Schaufeln = tonumber(MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE '" ..fraktion.."'"))
		Pistolen = tonumber(MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE '" ..fraktion.."'"))
		SDPistolen = tonumber(MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE '" ..fraktion.."'"))
		PistolenMagazine = tonumber(MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE '" ..fraktion.."'"))
		DesertEagles = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE '" ..fraktion.."'"))
		DesertEagleMunition = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE '" ..fraktion.."'"))
		Schrotflinten = tonumber(MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE '" ..fraktion.."'"))
		SchrotflintenMunition = tonumber(MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE '" ..fraktion.."'"))
		MP = tonumber(MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE '" ..fraktion.."'"))
		MPMunition = tonumber(MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE '" ..fraktion.."'"))
		AK = tonumber(MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE '" ..fraktion.."'"))
		AKMunition = tonumber(MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE '" ..fraktion.."'"))
		M = tonumber(MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE '" ..fraktion.."'"))
		MMunition = tonumber(MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE '" ..fraktion.."'"))
		Gewehre = tonumber(MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE '" ..fraktion.."'"))
		GewehrPatronen = tonumber(MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE '" ..fraktion.."'"))
		SGewehr = tonumber(MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE '" ..fraktion.."'"))
		SGewehrMunition = tonumber(MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE '" ..fraktion.."'"))
		Raketenwerfer = tonumber(MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE '" ..fraktion.."'"))
		Raketen = tonumber(MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE '" ..fraktion.."'"))
		Spezwaffen = tonumber(MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE '" ..fraktion.."'"))
		outputChatBox ( "Bestand:", player, 150, 150, 0 )
		if Schlagringe then
			local r, g, b
			local menge = Schlagringe
			local fassung = schlagringcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Schlagringe: "..menge.." von "..fassung, player, r, g, b )
		end
		if Baseballschlaeger then
			local r, g, b
			local menge = Baseballschlaeger
			local fassung = baseballcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Baseballschläger: "..menge.." von "..fassung, player, r, g, b )
		end
		if Messer then
			local r, g, b
			local menge = Messer
			local fassung = knifecap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Messer: "..menge.." von "..fassung, player, r, g, b )
		end
		if Schaufeln then
			local r, g, b
			local menge = Schaufeln
			local fassung = shovelscap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Schaufeln: "..menge.." von "..fassung, player, r, g, b )
		end
		if Pistolen then
			local r, g, b
			local menge = Pistolen
			local fassung = pistolcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Pistolen: "..menge.." von "..fassung, player, r, g, b )
		end
		if SDPistolen then
			local r, g, b
			local menge = SDPistolen
			local fassung = sdpistolcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "SD-Pistolen: "..menge.." von "..fassung, player, r, g, b )
		end
		if PistolenMagazine then
			local r, g, b
			local menge = PistolenMagazine
			local fassung = pistolammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "9mm Magazine: "..menge.." von "..fassung, player, r, g, b )
		end
		if DesertEagles then
			local r, g, b
			local menge = DesertEagles
			local fassung = eaglecap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Desert Eagles: "..menge.." von "..fassung, player, r, g, b )
		end
		if DesertEagleMunition then
			local r, g, b
			local menge = DesertEagleMunition
			local fassung = eagleammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Desert Eagle Magazine: "..menge.." von "..fassung, player, r, g, b )
		end
		if Schrotflinten then
			local r, g, b
			local menge = Schrotflinten
			local fassung = shotguncap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Schrotflinten: "..menge.." von "..fassung, player, r, g, b )
		end
		if SchrotflintenMunition then
			local r, g, b
			local menge = SchrotflintenMunition
			local fassung = shotgunammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Schrotkugeln: "..menge.." von "..fassung, player, r, g, b )
		end
		if MP then
			local r, g, b
			local menge = MP
			local fassung = mpcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "MP5: "..menge.." von "..fassung, player, r, g, b )
		end
		if MPMunition then
			local r, g, b
			local menge = MPMunition
			local fassung = mpammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "MP5 Magazine: "..menge.." von "..fassung, player, r, g, b )
		end
		if AK then
			local r, g, b
			local menge = AK
			local fassung = akcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "AK-47: "..menge.." von "..fassung, player, r, g, b )
		end
		if AKMunition then
			local r, g, b
			local menge = AKMunition
			local fassung = akammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "AK-47 Magazine: "..menge.." von "..fassung, player, r, g, b )
		end
		--outputChatBox ( "M4: "..M.." von "..mcap, player, 0, 125, 0 )
		if MMunition then
			local r, g, b
			local menge = MMunition
			local fassung = mammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "M4 Magazine: "..menge.." von "..fassung, player, r, g, b )
		end
		if Gewehre then
			local r, g, b
			local menge = Gewehre
			local fassung = gewehrcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Gewehre: "..menge.." von "..fassung, player, r, g, b )
		end
		if GewehrPatronen then
			local r, g, b
			local menge = GewehrPatronen
			local fassung = gewehrammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Gewehrpatronen: "..menge.." von "..fassung, player, r, g, b )
		end
		if SGewehr then
			local r, g, b
			local menge = SGewehr
			local fassung = sgewehrcap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Scharfschützengewehre: "..menge.." von "..fassung, player, r, g, b )
		end
		if SGewehrMunition then
			local r, g, b
			local menge = SGewehrMunition
			local fassung = sgewehrammocap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Scharfschützengewehr-Patronen: "..menge.." von "..fassung, player, r, g, b )
		end
		if Raketenwerfer then
			local r, g, b
			local menge = Raketenwerfer
			local fassung = raketenwerfercap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Raketenwerfer: "..menge.." von "..fassung, player, r, g, b )
		end
		if Raketen then
			local r, g, b
			local menge = Raketen
			local fassung = raketencap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			outputChatBox ( "Raketen: "..menge.." von "..fassung, player, r, g, b )
		end
		if Spezwaffen then
			local r, g, b
			local menge = Spezwaffen
			local fassung = spezguncap
			if menge == fassung then
				r, g, b = 0, 200, 0
			elseif menge == 0 then
				r, g, b = 255, 0, 0
			else 
				local menge = menge/fassung
				if menge >= 0.5 then
					local green = math.round(menge * 200, 0)
					r, g, b = 0, green, 0
				else
					local red = math.round(255 - (menge * 200), 0)
					r, g, b = red, 0, 0
				end
			end
			local weaponspez
			if isCamorra(player) then
				weaponspez = "Luparas"
			elseif isYakuza(player) then
				weaponspez = "Katanas"
			elseif isSurenos(player) then
				weaponspez = "Molotows"
			else
				weaponspez = "Spezialwaffen"
			end
			outputChatBox ( ""..weaponspez..": "..menge.." von "..fassung, player, r, g, b )
		end
	end
end
addCommandHandler ( "fstate", fstate_func )

function fskin_func ( player )
	
	curskin = getElementModel ( player )
	suc = false
	if getPedOccupiedVehicle ( player ) then
		outputChatBox ( "Bitte nutze diesen Befehl nur ausserhalb von Fahrzeugen!", player, 125, 0, 0 )
	elseif copskins[getElementModel ( player )] and getElementModel ( player ) ~= 285 then
		if laGetElementData ( player, "rang" ) == 0 then
			setElementModel ( player, 284 )
		elseif laGetElementData ( player, "rang" ) == 1 then
			setElementModel ( player, 282 )
		elseif laGetElementData ( player, "rang" ) == 2 then
			setElementModel ( player, 280 )
		elseif laGetElementData ( player, "rang" ) == 3 then
			setElementModel ( player, 281 )
		elseif laGetElementData ( player, "rang" ) == 4 then
			local model = getElementModel ( player )
			if model == 265 then
				setElementModel ( player, 266 )
			elseif model == 266 then
				setElementModel ( player, 267 )
			else
				setElementModel ( player, 265 )
			end
		elseif laGetElementData ( player, "rang" ) == 5 then
			local model = getElementModel ( player )
			if model == 288 then
				setElementModel ( player, 283 )
			else
				setElementModel ( player, 288 )
			end
		elseif laGetElementData ( player, "rang" ) == 6 then
			setElementModel ( player, 295 )
		end
	elseif laGetElementData ( player, "fraktion" ) == 2 then
		for i = curskin+1, 320 do
			if camorraSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if camorraSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 3 then
		for i = curskin+1, 320 do
			if yakuzaSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if yakuzaSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 4 then
		if laGetElementData ( player, "permission" ) == "medic" then
			for i = curskin+1, 320 do
				if medicSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
			if suc == false then
				for i = 0, curskin do
					if medicSkins[i] then
						suc = true
						setElementModel ( player, i )
						laSetElementData ( player, "skinid", i )
						break
					end
				end
			end
		elseif laGetElementData ( player, "permission" ) == "mechaniker" then
			for i = curskin+1, 320 do
				if mechanikSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
			if suc == false then
				for i = 0, curskin do
					if mechanikSkins[i] then
						suc = true
						setElementModel ( player, i )
						laSetElementData ( player, "skinid", i )
						break
					end
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 5 then
		for i = curskin+1, 320 do
			if newsreporterSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if newsreporterSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 7 then
		for i = curskin+1, 320 do
			if surenosSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if surenosSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 8 then
		for i = curskin+1, 320 do
			if armySkins[i] then
				suc = true
				setElementModel ( player, 121 )
				laSetElementData ( player, "skinid", 121 )
				takeAllWeapons ( player )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if armySkins[i] then
					suc = true
					setElementModel ( player, 121 )
					laSetElementData ( player, "skinid", 121 )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 9 then
		for i = curskin+1, 320 do
			if comptonSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if comptonSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 10 then
		for i = curskin+1, 320 do
			if wattsSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if wattsSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	elseif laGetElementData ( player, "fraktion" ) == 11 then
		for i = curskin+1, 320 do
			if terrorSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if terrorSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	else
		outputChatBox ( "Du darfst diesen Befehl nicht benutzen!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "fskin", fskin_func )

function invite_func ( player, cmd, target )
local pname = getPlayerName (player)
local fraktion = laGetElementData ( player, "fraktion")
local fraktionsname = fraktionNames[fraktion]
	if fraktion > 0 and laGetElementData( player, "rang" ) >= 5 then
		local target = getPlayerFromName ( target )
		local tname = getPlayerName(target)
		if target ~= false then
			if laGetElementData ( target, "fraktion" ) == 0 then
				if (fraktion == 1) and tonumber(laGetElementData ( target, "gwd" ) < 60) then
					outputChatBox ( "Der Spieler hat eine zu niedrige GWD-Note!", player, 150, 0, 0 )			
				elseif (fraktion == 6) and tonumber(laGetElementData ( target, "gwd" ) < 80) then
					outputChatBox ( "Der Spieler hat eine zu niedrige GWD-Note!", player, 150, 0, 0 )	
				else
					outputChatBox ( ""..pname.." möchte dich in die Fraktion "..fraktionsname.." aufnehmen.", target, 0, 100, 200 )
					outputChatBox ( "Mit /acceptinvite nimmst du an. Verwende /leavefaction um die Fraktion zu verlassen.", target, 0, 100, 200 )
					outputChatBox ( "Du hast "..tname.." eine Fraktionsaufnahme angeboten.", player, 0, 100, 200 )
					laSetElementData ( target, "factionseller", pname )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist bereits\nin einer Fraktion!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nichtbefugt!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "invite", invite_func )
addEvent ("invite", true )
addEventHandler ("invite", getRootElement(), invite_func )

function acceptinvite_func ( player )
	local tname = laGetElementData ( player, "factionseller" )
	local target = getPlayerFromName ( tname )
	local pname = getPlayerName(player)
	local fraktion = laGetElementData ( target, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
	laSetElementData ( player, "fraktion", fraktion )
	laSetElementData ( player, "rang", 0 )
	fraktionMembers[fraktion][player] = laGetElementData ( target, "fraktion" )
	outputChatBox ( "Du wurdest soeben in die Fraktion "..fraktionsname.." aufgenommen!", player, 0, 125, 0 )
	outputChatBox ( "Tippe /t [Text] für den Chat und F1, um mehr zu erfahren! /leavefaction um die Fraktion zu verlassen.", player, 0, 125, 0 )
	outputChatBox ( "Du hast den Spieler "..pname.." in deine Fraktion aufgenommen!", target, 0, 125, 0 )
	MySQL_SetString ( "userdata", "LastInvite", timestampOptical (), "Name LIKE '"..pname.."'")
	sendMSGForFaction ( "[FR]: "..tname.." hat "..pname.." in die Fraktion aufgenommen.", tonumber(fraktion), 0, 200, 0 )
	laSetElementData ( player, "factionseller", "" )
	local lastuninvite = tostring ( MySQL_GetString ( "userdata", "LastUninvite", "Name LIKE '"..getPlayerName(player).."'") )
	outputLog( "[INVITE]: "..pname.." wurde von "..tname.." in die Fraktion "..fraktionsname.." aufgenommen! (LU: "..lastuninvite..")", "fraktions")
end
addCommandHandler ( "acceptinvite", acceptinvite_func )

function leavefaction_func ( player )
	local pname = getPlayerName(player)
	local fraktion = laGetElementData (player, "fraktion")
	local fraktionsname = fraktionNames[fraktion]
	local model = malehomeless[math.random ( 1, 5 )]
	setElementModel ( player, model )
	laSetElementData ( player, "skinid", model )
	laSetElementData ( player, "rang", 0 )
	fraktionMembers[laGetElementData ( player, "fraktion" )][player] = nil
	laSetElementData ( player, "fraktion", 0 )
	outputChatBox ( "Du hast deine Fraktion verlassen.", player, 0, 125, 0 )
	MySQL_SetString ( "userdata", "LastUninvite", timestampOptical (), "Name LIKE '"..getPlayerName(player).."'")
	sendMSGForFaction ( "[FR]: "..pname.." hat die Fraktion verlassen.", tonumber(fraktion), 200, 0, 0 )
	local lastinvite = tostring ( MySQL_GetString ( "userdata", "LastInvite", "Name LIKE '"..getPlayerName(player).."'") )
	outputLog( "[UNINVITE]: "..pname.." hat die Fraktion "..fraktionsname.." verlassen! (LI: "..lastuninvite..")", "fraktions")
end
addCommandHandler ( "leavefaction", leavefaction_func )

function uninvite_func ( player, cmd, target )

	if laGetElementData ( player, "fraktion" ) > 0 and laGetElementData( player, "rang" ) >= 5 then
		local target = getPlayerFromName ( target )
		if target ~= false then
			if laGetElementData ( target, "fraktion" ) == laGetElementData ( player, "fraktion" ) and laGetElementData ( target, "rang" ) <= 4 then
				local pname = getPlayerName(player)
				local tname = getPlayerName(target)
				local fraktion = laGetElementData ( player, "fraktion" )
				local fraktionsname = fraktionNames[fraktion]
				local model = malehomeless[math.random ( 1, 5 )]
				setElementModel ( target, model )
				laSetElementData ( target, "skinid", model )
				laSetElementData ( target, "rang", 0 )
				fraktionMembers[laGetElementData ( target, "fraktion" )][target] = nil
				laSetElementData ( target, "fraktion", 0 )
				outputChatBox ( "Du wurdest soeben von "..pname.." aus deiner Fraktion geworfen!", target, 200, 0, 0 )
				MySQL_SetString ( "userdata", "LastUninvite", timestampOptical (), "Name LIKE '"..tname.."'")
				outputChatBox ( "Du hast den Spieler "..tname.." aus deiner Fraktion entfernt!", player, 0, 150, 0 )
				sendMSGForFaction ( "[FR]: "..pname.." hat "..tname.." aus der Fraktion geworfen.", tonumber(fraktion), 200, 0, 0 )
				local lastinvite = tostring ( MySQL_GetString ( "userdata", "LastInvite", "Name LIKE '"..getPlayerName(player).."'") )
				outputLog( "[UNINVITE]: "..tname.." wurde von "..pname.." aus der Fraktion "..fraktionsname.." geworfen! (LI: "..lastinvite..")", "fraktions")
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu kannst den Spieler nicht\naus der Fraktion entfernen!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht befugt!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "uninvite", uninvite_func )
addEvent ("uninvite", true )
addEventHandler ("uninvite", getRootElement(), uninvite_func )

function offuninvite_func ( player, cmd, target )

	if laGetElementData ( player, "fraktion" ) > 0 and laGetElementData( player, "rang" ) >= 5 then
		local tfraktion = tonumber(MySQL_GetString ( "userdata", "Fraktion", "Name LIKE '"..target.."'"))
		if tfraktion then
		if tfraktion == tonumber(laGetElementData ( player, "fraktion" )) then
			local trank = tonumber(MySQL_GetString ( "userdata", "FraktionsRang", "Name LIKE '"..target.."'"))
			if trank <= 4 then
				local pname = getPlayerName(player)
				local tname = target
				local fraktion = laGetElementData ( player, "fraktion" )
				local fraktionsname = fraktionNames[fraktion]
				local model = malehomeless[math.random ( 1, 5 )]
				MySQL_SetString ( "userdata", "Skinid", model, "Name LIKE '"..tname.."'")
				MySQL_SetString ( "userdata", "Fraktion", 0, "Name LIKE '"..tname.."'")
				MySQL_SetString ( "userdata", "FraktionsRang", 0, "Name LIKE '"..tname.."'")
				MySQL_SetString ( "userdata", "LastUninvite", timestampOptical (), "Name LIKE '"..tname.."'")
				outputChatBox ( "Du hast den Spieler "..tname.." offline aus deiner Fraktion entfernt!", player, 0, 150, 0 )
				sendMSGForFaction ( "[FR]: "..pname.." hat "..tname.." offline aus der Fraktion geworfen.", tonumber(fraktion), 200, 0, 0 )
				local lastinvite = tostring ( MySQL_GetString ( "userdata", "LastInvite", "Name LIKE '"..getPlayerName(player).."'") )
				outputLog( "[UNINVITE]: "..tname.." wurde von "..pname.." offline aus der Fraktion "..fraktionsname.." geworfen! (LI: "..lastinvite..")", "fraktions")
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist ein Leader!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
		end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht befugt!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "offuninvite", offuninvite_func )




function getchangestate_func ( player, cmd, target )

	local target = getPlayerFromName ( target )
	if isElement ( target ) then
		if laGetElementData ( player, "adminlvl" ) >= 1 or laGetElementData ( player, "rang" ) >= 4 then
			outputChatBox ( "Letzter Fraktions-Uninvite: "..tostring ( MySQL_GetString ( "userdata", "LastUninvite", "Name LIKE '"..getPlayerName(target).."'") ), player, 200, 200, 0 )
			outputChatBox ( "Letzter Fraktions-Invite: "..tostring ( MySQL_GetString ( "userdata", "LastInvite", "Name LIKE '"..getPlayerName(target).."'") ), player, 200, 200, 0 )
		else
			outputChatBox ( "Du bist kein Admin/Leader/Co-Leader!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Der Spieler ist nicht online!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "getchangestate", getchangestate_func )
addEvent ("getchangestate", true )
addEventHandler ("getchangestate", getRootElement(), getchangestate_func )

function giverank_func ( player, cmd, target, newrank )

	local pname = getPlayerName(player)
	local newrank = tonumber(newrank)
	local tplayer = getPlayerFromName ( target )
	local fraktion = laGetElementData ( player, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
	if laGetElementData ( player, "fraktion" ) >= 1 and laGetElementData ( player, "rang" ) >= 4 and laGetElementData ( player, "rang" ) > laGetElementData ( tplayer, "rang" ) and laGetElementData ( tplayer, "fraktion" ) == laGetElementData ( player, "fraktion" ) and newrank <  laGetElementData ( player, "rang" ) then
		if newrank >= 0 then
			if newrank > tonumber(laGetElementData ( tplayer, "rang" )) then
				outputChatBox ( "Glückwunsch, du wurdest soeben von "..pname.." befördert!", tplayer, 0, 150, 0 )
				outputChatBox ( "Du hast "..target.." soeben auf Rang "..newrank.." befördert!", player, 0, 150, 0 )
				sendMSGForFaction ( "[FR]: "..target.." wurde von "..pname.." auf Rang "..newrank.." befördert!", fraktion, 0, 150, 0 )
				outputLog( "[RANG]: "..target.." wurde von "..pname.." auf Rang "..newrank.." befoerdert! ("..fraktionsname..")", "fraktions")
			else
				outputChatBox ( "Du wurdest soeben von "..pname.." degradiert!", tplayer, 150, 0, 0 )
				outputChatBox ( "Du hast "..target.." soeben auf Rang "..newrank.." degradiert!", player, 150, 0, 0 )
				sendMSGForFaction ( "[FR]: "..target.." wurde von "..pname.." auf Rang "..newrank.." degradiert!", fraktion, 150, 0, 0 )
				outputLog( "[RANG]: "..target.." wurde von "..pname.." auf Rang "..newrank.." degradiert! ("..fraktionsname..")", "fraktions")
			end
			laSetElementData ( tplayer, "rang", newrank )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Wert muss zwischen 0-5 liegen!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht befugt!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "giverank", giverank_func )
addEvent ("giverank", true )
addEventHandler ("giverank", getRootElement(), giverank_func )


function crab_func ( player, cmd, targetName )

	if not client or client == player then
		local target = getPlayerFromName ( targetName )
		if isEvil ( player ) then
			if isElement ( target ) then
				if laGetElementData ( target, "handsuped" ) then
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( target )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 10 then
						local veh = getPedOccupiedVehicle ( player )
						local model = getElementModel ( veh )
						local validSeats = {}
							for i = 2, 3 do
								if not getVehicleOccupant ( veh, i ) then
								validSeats[i] = true
								end
							end
						for key, index in pairs ( validSeats ) do
							warpPedIntoVehicle ( target, veh, key )
							executeCommandHandler ( "tie", player, targetName )
							return
						end
						infobox ( player, "\n\n\nDu hast keinen\nfreien Sitz!", 5000, 125, 0, 0 )
					else
						infobox ( player, "\n\n\nDas Ziel ist\nzu weit entfernt!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "\n\n\nDer Spieler muss\nsich ergeben!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\n\nDu bist kein\nVerbrecher!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "crab", crab_func )
addEvent ( "crab", true )
addEventHandler ( "crab", getRootElement(), crab_func )


local timers = {} -- timers for existing pickups

local function onWeaponPickupHit ( player, matchingDimension )
	if matchingDimension then
		killTimer ( timers[source] )
		timers[source] = nil
		removeEventHandler ( "onPickupHit", source, onWeaponPickupHit )
		local weapid = getPickupWeapon ( source )
		local weapammo = getPickupAmmo ( source )
		destroyElement ( source )
		giveWeapon ( player, weapid, weapammo, false )
	end
end

local function destroyWeaponPickup ( pickup )
	timers[pickup] = nil
	removeEventHandler ( "onPickupHit", pickup, onWeaponPickupHit )
	destroyElement ( pickup )
end

function dropeweaponsfree( source, cmd, source_ammo)
	local pX, pY, pZ = getElementPosition ( source )
	local timeout = 30000
	if isOnStateDuty ( source ) then
		infobox ( source, "\n\nDu bist im Dienst!", 5000, 125, 0, 0 )
		return
	elseif isPedDead ( source ) then
		infobox ( source, "\n\nDu bist tot!", 5000, 125, 0, 0 )
		return
	elseif laGetElementData ( source, "frischabgelegt") == true then
		infobox ( source, "\n\nBitte warte 5 Sekunden!", 5000, 125, 0, 0 )
		return
	elseif laGetElementData ( source, "savetimer") == true then
		infobox ( source, "\n\nDu savest gerade!", 5000, 125, 0, 0 )
		return
	elseif laGetElementData ( source, "curplayingtime" ) >= 2 then
		if false then
			local source_weapon = getPedWeapon ( source )
			if ( source_weapon and source_weapon ~= 0 and source_ammo ) then
				local pickup = createPickup ( pX+1, pY+1, pZ, 2, source_weapon, timeout, source_ammo )
				addEventHandler ( "onPickupHit", pickup, onWeaponPickupHit )
				timers[pickup] = setTimer ( destroyWeaponPickup, timeout, 1, pickup )
			end
		else
			local droppedWeapons = {}
				if (getPedWeapon(source, slot) ~= 0) then
						local slot = getPedWeapon(source, slot)
						local weapon = getPedWeapon(source)
						local ammo = getPedTotalAmmo(source)
						table.insert(droppedWeapons, {weapon, ammo}) 	
						if weapon ~= nil then
							DropTheWeapons(source, droppedWeapons)
							takeWeapon ( source, weapon )
							laSetElementData ( source, "frischabgelegt", true )
							setTimer ( refresh_frischabgelegt, 5000, 1, source )
						else
							infobox ( source, "\n\nDu kannst diese Waffe nicht geben!", 5000, 125, 0, 0 )
						end
				end
		end
	else
		infobox ( source, "\n\nDu musst 2 Minuten warten!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "dropweapon", dropeweaponsfree )
addCommandHandler ( "ablegen", dropeweaponsfree )


function DropTheWeapons ( source, droppedWeapons )
	local radius = 1
	local numberDropped = #droppedWeapons
	for i, t in ipairs(droppedWeapons) do
		local pX, pY, pZ = getElementPosition ( source )
		local x = pX + radius * math.cos((i-1) * 2 * math.pi / numberDropped)
		local y = pY + radius * math.sin((i-1) * 2 * math.pi / numberDropped)
		local timeout = 30000
		local pickup = createPickup(x+1, y+1, pZ, 2, t[1], timeout, t[2])
		addEventHandler ( "onPickupHit", pickup, onWeaponPickupHit )
		timers[pickup] = setTimer ( destroyWeaponPickup, timeout, 1, pickup )
	end	
end

function giveweaponfree( source, cmd, target, source_ammo)
if isOnStateDuty ( source ) then
	infobox ( source, "\n\nDu bist im Dienst!", 5000, 125, 0, 0 )
	return
elseif isPedDead ( source ) then
	infobox ( source, "\n\nDu bist tot!", 5000, 125, 0, 0 )
	return
elseif laGetElementData ( source, "frischabgelegt") == true then
	infobox ( source, "\n\nBitte warte 5 Sekunden!", 5000, 125, 0, 0 )
	return
	elseif laGetElementData ( source, "savetimer") == true then
		infobox ( source, "\n\nDu savest gerade!", 5000, 125, 0, 0 )
		return
elseif laGetElementData ( source, "curplayingtime" ) >= 2 then
	local target = getPlayerFromName ( target )
	if target then
		local x1, y1, z1 = getElementPosition ( source )
		local x2, y2, z2 = getElementPosition ( target )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
			local droppedWeapons = {}
				if (getPedWeapon(source, slot) ~= 0) then
					local weapon = getPedWeapon(source)
					local ammo = getPedTotalAmmo(source)
					if weapon ~= nil then
						takeWeapon ( source, weapon) 
						giveWeapon ( target, weapon, ammo ) 
						local chatSphere = createColSphere( x1, y1, z1, 10 )
						local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
						destroyElement ( chatSphere )
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do
						outputChatBox ( ""..getPlayerName(source).." hat "..getPlayerName(target).." eine Waffe übergeben!", nearbyPlayer, 100, 100, 200 )
						infobox ( source, "\n\nDu hast deine Waffe "..getPlayerName(target).." gegeben!", 5000, 0, 125, 0 )
						infobox ( target, "\n\nDu hast eine Waffe von "..getPlayerName(source).." gekriegt!", 5000, 0, 125, 0 )
						outputLog ( "[WAFFEN]: "..getPlayerName ( source ).." hat "..getPlayerName(target).." Waffe "..weapon.." gegeben!", "bad" )
						laSetElementData ( source, "frischabgelegt", true )
						setTimer ( refresh_frischabgelegt, 5000, 1, source )
					end
					else
						infobox ( source, "\n\nDu hast diese Waffe nicht!", 5000, 125, 0, 0 )
					end
				end
		else
			infobox ( source, "\n\nDer Spieler ist nicht bei dir!", 5000, 125, 0, 0 )
		end
	else
		infobox ( source, "\n\nVerwende /givegun [NAME]!", 5000, 125, 0, 0 )
	end
else
	infobox ( source, "\n\nDu musst 2 Minuten warten!", 5000, 125, 0, 0 )
end
end
addCommandHandler ( "givegun", giveweaponfree )


function ShowFraktionPCDepots_func (player)
	local fraktion = laGetElementData( player, "fraktion" )
	local money
	local weed
	local mats
	local koks
	if fraktion == 0 then
		infobox ( player, "\n\nDu bist in keiner Fraktion!", 5000, 125, 0, 0 )
	else
		if tonumber ( laGetElementData ( player, "rang" ) ) >= 4 then
			money = MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..fraktion.."'")
			weed = MySQL_GetString("fraktionen", "DepotDrogen", "ID LIKE '"..fraktion.."'")
			mats = MySQL_GetString("fraktionen", "DepotMaterials", "ID LIKE '"..fraktion.."'")
			koks = MySQL_GetString("fraktionen", "DepotKokain", "ID LIKE '"..fraktion.."'")
			triggerClientEvent ( player, "ShowFraktionComputerGui", getRootElement(), money, weed, mats, koks )
		else
			infobox ( player, "\n\nDu bist nicht befugt!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "fraktion", ShowFraktionPCDepots_func )


function fdraw_func ( player, cmd, amount )

	if isArmy ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '8'") )
	elseif isCop ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '1'") )
	elseif isFBI ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '6'") )
	else
		return
	end
		if laGetElementData ( player, "rang" ) >= 4 then
			local amount = tonumber ( amount )
			if amount then
				amount = math.abs ( math.floor ( amount ) )
				--local fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '8'") )
				if fmoney >= amount then
						if isArmy ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney - amount, "ID LIKE '8'")
						elseif isCop ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney - amount, "ID LIKE '1'")
						elseif isFBI ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney - amount, "ID LIKE '6'")
						end
					local fraktion = laGetElementData ( player, "fraktion")
					local fraktionsname = fraktionNames[fraktion]
					local money = laGetElementData ( player, "money" )
					laSetElementData ( player, "money", money + amount )
					givePlayerMoney ( player, amount )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					infobox ( player, "\n\nDu hast "..amount.."$ abgehoben!", 7500, 0, 125, 0 )
					sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..amount.."$ aus der Fraktionskasse abgehoben.", fraktion, 150, 0, 0 )
					if amount > 100000 then
						outputLog( "[DEPOT+]: "..getPlayerName(player).." hat "..amount.."$ aus der Kasse abgehoben. ("..fraktionsname..")", "fraktions")
					else
						outputLog( "[DEPOT]: "..getPlayerName(player).." hat "..amount.."$ aus der Kasse abgehoben. ("..fraktionsname..")", "fraktions")	
					end
				else
					infobox ( player, "\n\nEs ist nicht mehr genug Geld in der Kasse!", 7500, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\nGebrauch: /fdraw [Summe]", 7500, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nDu bist nicht befugt!", 7500, 125, 0, 0 )
		end
	end
addCommandHandler ( "fdraw", fdraw_func )

function fstore_func ( player, cmd, amount )

	if isArmy ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '8'") )
	elseif isCop ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '1'") )
	elseif isFBI ( player ) then
		fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '6'") )
	else
		return
	end
		--if laGetElementData ( player, "rang" ) >= 4 then
			local amount = tonumber ( amount )
			if amount then
				amount = math.abs ( math.floor ( amount ) )
				local fraktion = laGetElementData ( player, "fraktion")
				local fraktionsname = fraktionNames[fraktion]
				local money = laGetElementData ( player, "money" )
				---local fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '8'") )
				if money >= amount then
						if isArmy ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney + amount, "ID LIKE '8'")
						elseif isCop ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney + amount, "ID LIKE '1'")
						elseif isFBI ( player ) then
							MySQL_SetString("fraktionen", "DepotGeld", fmoney + amount, "ID LIKE '6'")
						end
					laSetElementData ( player, "money", money - amount )
					takePlayerMoney ( player, amount )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					infobox ( player, "\n\nDu hast "..amount.."$ eingezahlt!", 7500, 0, 125, 0 )
					sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..amount.."$ in die Fraktionskasse eingezahlt.", fraktion, 0, 150, 0 )
					if amount > 100000 then
						outputLog( "[DEPOT+]: "..getPlayerName(player).." hat "..amount.."$ in die Kasse eingezahlt. ("..fraktionsname..")", "fraktions")
					else					
						outputLog( "[DEPOT]: "..getPlayerName(player).." hat "..amount.."$ in die Kasse eingezahlt. ("..fraktionsname..")", "fraktions")
					end
				else
					infobox ( player, "\n\nDu hast nicht genug Geld!", 7500, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\nGebrauch: /fdraw [Summe]", 7500, 125, 0, 0 )
			end
		--else
		--	infobox ( player, "\n\nDu bist nicht befugt!", 7500, 125, 0, 0 )
		--end
end
addCommandHandler ( "fstore", fstore_func )

local respawnpricebad = 1000
local respawnpricegood = 500
local respawnpriceneutral = 250
function respawn_faction_func (player, cmd)
if laGetElementData ( player, "rang" ) >= 5 then
	local fraktion = tonumber(laGetElementData ( player, "fraktion"))
	local fraktionsname = fraktionNames[fraktion]
	local respawningprice
	if isEvil(player) then
		respawningprice = respawnpricebad
	elseif isStateFaction(player) then
		respawningprice = respawnpricegood
	elseif isReporter(player) then
		respawningprice = respawnpriceneutral
	else
		respawningprice = 0
	end
	if isEmergency(player) then
		for key, index in pairs ( mechanikerVehicles ) do
			local maxpasseng = getVehicleMaxPassengers (key)
			local maximum = maxpasseng + 1
			local schrittweite = 0
			for i=0, maxpasseng, 1 do
				if not getVehicleOccupant ( key ) then
					schrittweite = schrittweite + 1
					if schrittweite >= maximum then
						respawnVehicle ( key )
					end
				end
			end
		end
		for key, index in pairs ( medicVehicles ) do
			local maxpasseng = getVehicleMaxPassengers (key)
			local maximum = maxpasseng + 1
			local schrittweite = 0
			for i=0, maxpasseng, 1 do
				if not getVehicleOccupant ( key ) then
					schrittweite = schrittweite + 1
					if schrittweite >= maximum then
						respawnVehicle ( key )
					end
				end
			end
		end			
		outputChatBox ( "[INFO]: Fraktionsfahrzeuge respawnt!", player, 225, 225, 0 )
		sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat die Fahrzeuge respawnt!", fraktion, 0, 150, 0 )
		outputLog( "[RESPAWN]: "..getPlayerName(player).." hat die Fahrzeuge der Fraktion "..fraktionsname.." respawnt.", "fraktions")
		return
	end
	local fmoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..fraktion.."'") )
	if fmoney >= respawningprice then
		if fraktion == 1 then
			for key, index in pairs ( stateVehs ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 2 then
			for key, index in pairs ( camorraVehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 3 then
			for key, index in pairs ( yakuzavehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 5 then
			for key, index in pairs ( NewsVehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 6 then
			for key, index in pairs ( federalVehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 7 then
			for key, index in pairs ( surenosVehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 8 then
			for key, index in pairs ( armyVehs ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 9 then
			for key, index in pairs ( comptonvehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 10 then
			for key, index in pairs ( wattsvehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		elseif fraktion == 11 then
			for key, index in pairs ( terrorvehicles ) do
				local maxpasseng = getVehicleMaxPassengers (key)
				local maximum = maxpasseng + 1
				local schrittweite = 0
				for i=0, maxpasseng, 1 do
					if not getVehicleOccupant ( key ) then
						schrittweite = schrittweite + 1
						if schrittweite >= maximum then
							respawnVehicle ( key )
						end
					end
				end
			end
		end
		MySQL_SetString("fraktionen", "DepotGeld", fmoney - respawningprice, "ID LIKE '"..fraktion.."'")
		outputChatBox ( "[INFO]: Fraktionsfahrzeuge respawnt!", player, 225, 225, 0 )
		sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat die Fahrzeuge respawnt!", fraktion, 0, 150, 0 )
		outputLog( "[RESPAWN]: "..getPlayerName(player).." hat die Fahrzeuge der Fraktion "..fraktionsname.." respawnt.", "fraktions")
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nZu wenig Geld in der Kasse!", 5000, 255, 0, 0 )
	end
else
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Leader!", 5000, 255, 0, 0 )
end
end
addCommandHandler ( "resp", respawn_faction_func )
addEvent ( "respawn_faction", true )
addEventHandler ( "respawn_faction", getRootElement(), respawn_faction_func )