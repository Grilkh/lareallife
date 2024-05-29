function createHouse ( player, cmd, preis, playtime, int )

	if playtime ~= nil then local playtime = playtime*60 end
	local Preis = tonumber ( math.abs ( preis ) )
	local Mindestzeit = tonumber ( playtime )
	local CurrentInterior = tonumber ( int )
	if laGetElementData ( player, "adminlvl" ) >= 4 then
		if Preis > 10000 and Mindestzeit > 10 and CurrentInterior ~= nil then
			for i = 1, 9999 do
				local exist = MySQL_DatasetExist("houses", "ID LIKE '"..i.."'")
				if exist == true then
				else
					local ID = i
					local SymbolX, SymbolY, SymbolZ = getElementPosition ( player )
					local Besitzer = "none"
					local Preis = tonumber ( preis )
					local Mindestzeit = tonumber ( playtime )
					local CurrentInterior = tonumber ( int )
					local result = mysql_query(handler, "INSERT INTO houses (ID, SymbolX, SymbolY, SymbolZ, Besitzer, Preis, Mindestzeit, CurrentInterior, Kasse, Miete) VALUES ('"..ID.."', '"..SymbolX.."', '"..SymbolY.."', '"..SymbolZ.."', '"..Besitzer.."', '"..Preis.."', '"..Mindestzeit.."', '"..CurrentInterior.."', '0', '0')")
					if( not result) then
						outputLog ( "[HOUSE]: Error executing the query 1: ("		.. mysql_errno(handler) .. ") " .. mysql_error(handler), "mysql" )
					else
						mysql_free_result(result)
						outputLog ("[CREATE]: Haus (ID: "..i..") wurde angelegt!", "house")
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat ein Haus (ID: "..i..") angelegt!", playeritem, 200, 200, 0 )
						end
						createPickup ( SymbolX, SymbolY, SymbolZ, 3, 1273, 1000, 0 )
						break
					end
				end
			end
		else
			outputChatBox ( "Gebrauch: /newhouse [Preis] [Mind. Spielzeit in Stunden] [Interior ( iraum [1-30] )]", player )
		end
	end
end
addCommandHandler ( "newhouse", createHouse )

function iraeume ( player, cmd, i )

	if laGetElementData ( player, "adminlvl" ) >= 1 then
		local int = tonumber ( gettok ( _G["houseInt"..i], 1, string.byte('|') ) )
		local intx = tonumber ( gettok ( _G["houseInt"..i], 2, string.byte('|') ) )
		local inty = tonumber ( gettok ( _G["houseInt"..i], 3, string.byte('|') ) )
		local intz = tonumber ( gettok ( _G["houseInt"..i], 4, string.byte('|') ) )
		setElementInterior ( player, int, intx, inty, intz )
	end
end
addCommandHandler ( "iraum", iraeume )

function in_func ( player )

	local house = laGetElementData ( player, "house" )
	local px, py, pz = getElementPosition ( player )
	local hx, hy, hz = getElementPosition ( house )
	if getDistanceBetweenPoints3D ( px, py, pz, hx, hy, hz ) <= 5 then
		if ( getElementModel ( house ) == 1273 or getElementModel ( house ) == 1272 ) and laGetElementData ( house, "curint" ) > 0 then
			if not laGetElementData ( house, "locked" ) or math.abs ( laGetElementData ( player, "housekey" ) ) == laGetElementData ( house, "id" ) then
				local i = laGetElementData ( house, "curint" )
				laSetElementData ( player, "curIntIn", i )
				local int = tonumber ( gettok ( _G["houseInt"..i], 1, string.byte('|') ) )
				local intx = tonumber ( gettok ( _G["houseInt"..i], 2, string.byte('|') ) )
				local inty = tonumber ( gettok ( _G["houseInt"..i], 3, string.byte('|') ) )
				local intz = tonumber ( gettok ( _G["houseInt"..i], 4, string.byte('|') ) )
				local dim = laGetElementData ( house, "id" )
				if i == 0 then
					dim = 0
				end
				outputLog ("[IN]: "..getPlayerName(player).." hat ein Haus (ID: "..dim..") betreten!", "house")
				setElementDimension ( player, dim )
				fadeElementInterior ( player, int, intx, inty, intz )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /out, um das Haus zu verlassen.\nDrücke F2, um das Hausmenü zu öffnen.", 7500, 125, 0, 0 )
				bindKey ( player, "F2", "down", house_func )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist abgeschlossen!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Haus!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "in", in_func )

function out_func ( player )

	local dim = getElementDimension ( player )
	local haus = laGetElementData ( player, "house" )
	if not isElement ( haus ) then
		haus = _G["HouseNR"..getElementDimension(player)]
	end
	if isElement ( haus ) then
		local i = laGetElementData ( haus, "curint" )
		local int = tonumber ( gettok ( _G["houseInt"..i], 1, string.byte('|') ) )
		local intx = tonumber ( gettok ( _G["houseInt"..i], 2, string.byte('|') ) )
		local inty = tonumber ( gettok ( _G["houseInt"..i], 3, string.byte('|') ) )
		local intz = tonumber ( gettok ( _G["houseInt"..i], 4, string.byte('|') ) )
		local px, py, pz = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( px, py, pz, intx, inty, intz ) <= 10 then
			laGetElementData ( player, "curIntIn", 0 )
			local dim = getElementDimension ( player )
			local sx, sy, sz = getElementPosition ( haus )
			fadeElementInterior ( player, 0, sx, sy, sz )
			outputLog ("[OUT]: "..getPlayerName(player).." hat ein Haus (ID: "..dim..") verlassen!", "house")
			setElementDimension ( player, 0 )
			unbindKey ( player, "F2", "down", house_func )
		end
	else
		outputChatBox ( "Du bist in keinem Haus!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "out", out_func )

function rent_func ( player )

	local haus = laGetElementData ( player, "house" )
	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( haus )
	local pname = getPlayerName ( player )
	local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
	local miete = tonumber ( laGetElementData ( haus, "miete" ) )
	local id = laGetElementData ( haus, "id" )
	local owner = laGetElementData ( haus, "owner" )
	local kasse = MySQL_GetString ( "houses", "Kasse", "ID LIKE '"..laGetElementData ( haus, "id" ).."'")
	if distance < 5 then
		if laGetElementData ( haus, "miete" ) >= 1 and laGetElementData ( haus, "owner" ) ~= "none" then
			if laGetElementData ( player, "housekey" ) == 0 then
				if laGetElementData ( player, "money" ) >= miete then
					laSetElementData ( player, "housekey", tonumber ( laGetElementData ( haus, "id" ) ) * -1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dich erfolgreich eingemietet,\ntippe /unrent um auszuziehen!", 7500, 0, 200, 0 )
					moneychange ( player, miete*-1 )
					--kasse = MySQL_GetString ( "houses", "Kasse", "ID LIKE '" ..getElementDimension ( player ).."'" )
					MySQL_SetString("houses", "Kasse", kasse + miete, "ID LIKE '"..laGetElementData ( haus, "id" ).."'")
					laSetElementData ( haus, "kasse", kasse + miete )
					outputLog ("[RENT]: "..pname.." hat sich in das Haus von "..owner.." (ID: "..id..") fuer "..miete.."$ eingemietet!", "house")
					triggerClientEvent ( player, "createNewStatementEntry", player, "Einmietung", miete * - 1, owner.."\n" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7500, 125, 0, 0 )
				end
			elseif laGetElementData ( player, "housekey" ) < 0 then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bereits in ein Haus eingemietet!\nTippe /unrent, um auszuziehen!", 7500, 125, 0, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDir gehört bereits ein Haus!\nTippe zuerst /sellhouse!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHier kannst du dich nicht einmieten!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "rent", rent_func )

function sellhouse_func ( player )

	local ID = tonumber ( laGetElementData ( player, "housekey" ) )
	local haus = _G["HouseNR"..ID]
	local pname = getPlayerName ( player )
	if ID > 0 then
		if not MySQL_DatasetExist ( "buyit", "Anbieter LIKE '"..pname.."' AND Typ LIKE 'Houses'" ) then
			laSetElementData ( player, "spawnpos_x", -2458.288085 )
			laSetElementData ( player, "spawnpos_y", 774.354492 )
			laSetElementData ( player, "spawnpos_z", 35.171875 )
			laSetElementData ( player, "spawnrot_x", 52 )
			laSetElementData ( player, "spawnint", 0 )
			laSetElementData ( player, "spawndim", 0 )
			laSetElementData ( player, "housekey", 0 )
			local owner = laGetElementData ( haus, "owner" )
			laSetElementData ( haus, "owner", "none" )
			setElementModel ( haus, 1273 )
			MySQL_SetString("houses", "Besitzer", "none", "Besitzer LIKE '"..pname.."'")
			MySQL_SetString("userdata", "Hausschluessel", 0, "Name LIKE '"..pname.."'")
			local hauswert = tonumber(laGetElementData ( haus, "preis" ))
			local hauswertwithsteuern = hauswert - hauswert/5
			moneychange ( player, hauswert )
			datasave_remote(player)
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben dein Haus für "..hauswertwithsteuern.."$ (-20%) verkauft!", 7500, 0, 200, 0 )
			outputLog ("[SELL]: "..pname.." hat sein Haus (ID: "..ID..") fuer "..hauswertwithsteuern.."$ verkauft!", "house")
			triggerClientEvent ( player, "createNewStatementEntry", player, "Hausverkauf", hauswertwithsteuern, "\n" )
			
			local Hausverkaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Hausverkauf'") )
			local Hausverkaufkassenew = math.floor(Hausverkaufkasse + (hauswertwithsteuern))
			MySQL_SetString("staat", "Menge", Hausverkaufkassenew, "Name LIKE 'Hausverkauf'")
	
			local Hausverkaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Hausverkaufsteuern'") )
			local Hausverkaufsteuernkassenew = math.floor(Hausverkaufsteuernkasse + (hauswert/5))
			MySQL_SetString("staat", "Menge", Hausverkaufsteuernkassenew, "Name LIKE 'Hausverkaufsteuern'")
		
		else
			outputChatBox ( "Dein Haus wird momentan versteigert!", player, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDir gehört kein Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "sellhouse", sellhouse_func )

function unrent_func ( player )

	local ID = laGetElementData ( player, "housekey" )
	local haus = _G["HouseNR"..ID]
	if ID < 0 then
		laSetElementData ( player, "spawnpos_x", -2458.288085 )
		laSetElementData ( player, "spawnpos_y", 774.354492 )
		laSetElementData ( player, "spawnpos_z", 35.171875 )
		laSetElementData ( player, "spawnrot_x", 52 )
		laSetElementData ( player, "spawnint", 0 )
		laSetElementData ( player, "spawndim", 0 )
		laSetElementData ( player, "housekey", 0 )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dich ausgemietet!", 7500, 0, 200, 0 )
		outputLog ("[UNRENT]: "..getPlayerName(player).." hat sich ausgemietet (ID: "..ID..").", "house")
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nirgends eingemietet!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "unrent", unrent_func )

function setrent_func ( player, cmd, preis )

	local ID = laGetElementData ( player, "housekey" )
	local haus = _G["HouseNR"..ID]
	local preis = math.abs(math.floor(preis))
	if ID > 0 then
		local miete =  math.abs ( tonumber ( preis ) )
		if miete and miete <= 5000 then
			laSetElementData ( haus, "miete", miete )
			MySQL_SetString("houses", "Miete", miete, "ID LIKE '"..laGetElementData ( haus, "id" ).."'")
			outputLog ("[SETRENT]: "..getPlayerName(player).." hat die Miete seines Hauses (ID: "..ID..") auf "..miete.."$ gesetzt!", "house")
			if miete == 0 then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Haus ist nun nicht mehr zu mieten!", 7500, 0, 200, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Haus ist nun für "..miete.."$ zu mieten!", 7500, 0, 200, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFehler: Tippe /setrent [Summe],\n0$ = Nicht mietbar, maximal 5000 $!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDir gehört kein Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "setrent", setrent_func )

function house_func ( player, key, state )

	if isInUserHouse ( player ) then
		local amount = MySQL_GetString ( "houses", "Kasse", "ID LIKE '" ..getElementDimension ( player ).."'" )
		if amount then
			if not getElementData ( player, "ElementClicked" ) then
				setElementData ( player, "ElementClicked", true )
				showCursor ( player, true )
				triggerClientEvent ( player, "showHouseGui", player, amount )
			end
		end
	end
end

function hlock_func ( player )

	local hkey = laGetElementData ( player, "housekey" )
	if hkey > 0 then
		laSetElementData ( _G["HouseNR"..hkey], "locked", not laGetElementData ( _G["HouseNR"..hkey], "locked" ) )
		if laGetElementData ( _G["HouseNR"..hkey], "locked" ) then fix = "ab" else fix = "auf" end
		outputChatBox ( "Haustür "..fix.."geschlossen!", player, 0, 125, 0 )
		outputLog ("[LOCK]: "..getPlayerName(player).." hat sein Haus (ID: "..hkey..") "..fix.."geschlossen!", "house")
	else
		outputChatBox ( "Dir gehört kein Haus!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "hlock", hlock_func )
			
function houseClickServer_func ( player, cmd, amount )

	playSoundFrontEnd ( player, 20 )
	if cmd == "eat" then
		setPedAnimation ( player, "food", "EAT_Burger", 1, true, false, true )
		setTimer ( setPedAnimation, 1200, 1, player )
		setTimer ( triggerClientEvent, 1200, 1, player, "eatSomething", getRootElement(), 100 )
		outputLog ("[EAT]: "..getPlayerName(player).." hat in einem Haus gegessen.", "house")
	elseif cmd == "healing" then
		setElementHealth ( player, 100 )
		executeCommandHandler ( "meCMD", player, " hat sich geheilt!" )
		outputLog ( "[MEDIKIT]: "..getPlayerName ( player ).." hat ein Medikit verwendet!", "use" )
		laSetElementData(player,"anim", 1)
		setPedAnimation(player, "shop", "ROB_Shifty",10000,true,false,true)
		setTimer ( setPedAnimation, 10000, 1, player )
		setTimer ( healaway_func, 10000, 1, player)
		outputLog ("[HEAL]: "..getPlayerName(player).." hat sich in einem Haus geheilt.", "house")
	elseif cmd == "sleep" then
		laSetElementData ( player, "schlaf", 100 )
		fadeCamera ( player, false, 0.5, 0, 0, 0 )
		setTimer ( cam_func, 5000, 1, player)
		laSetElementData(player,"anim", 1)
		outputChatBox ( "Du legst dich kurz hin...", player, 0, 125, 0 )
		outputLog ("[SLEEP]: "..getPlayerName(player).." hat in einem Haus geschlafen.", "house")
	elseif cmd == "take" or cmd == "give" then
		if amount then
			amount = math.abs(math.floor(amount))
			if getElementDimension ( player ) == laGetElementData ( player, "housekey" ) then
				local id = laGetElementData ( player, "housekey" )
				local houseAmount = tonumber ( MySQL_GetString ( "houses", "Kasse", "ID LIKE '" ..laGetElementData ( player, "housekey" ).."'" ) )
				if cmd == "take" then
					if houseAmount >= amount then
						givePlayerSaveMoney ( player, amount )
						MySQL_SetString("houses", "Kasse", houseAmount - amount, "ID LIKE '"..laGetElementData ( player, "housekey" ).."'")
						triggerClientEvent ( "showHouseGui", player, houseAmount - amount )
						outputLog ("[KASSE]: "..getPlayerName(player).." hat "..amount.."$ aus seinem Haus (ID: "..id..") genommen!", "house")
					else
						outputChatBox ( "Du hast nicht genug Geld in deiner Hauskasse!", player, 125, 0, 0 )
					end
				elseif cmd == "give" then
					if laGetElementData ( player, "money" ) >= amount then
						takePlayerSaveMoney ( player, amount )
						MySQL_SetString("houses", "Kasse", houseAmount + amount, "ID LIKE '"..laGetElementData ( player, "housekey" ).."'")
						triggerClientEvent ( "showHouseGui", player, houseAmount + amount )
						outputLog ("[KASSE]: "..getPlayerName(player).." hat "..amount.."$ i sein Haus (ID: "..id..") gelegt!", "house")
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Ungültiger Wert!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "houseClickServer", true )
addEventHandler ( "houseClickServer", getRootElement(), houseClickServer_func )

function cam_func (player)
	fadeCamera ( player, true, 0.5, 0, 0, 0 )
	outputChatBox ( "Du bist aufgewacht und wieder voller Energie.", player, 0, 125, 0 )
	laSetElementData(player,"anim", 0)
end

function healaway_func (player)
	outputChatBox ( "Du hast dich geheilt!", player, 0, 125, 0 )
	laSetElementData(player,"anim", 0)
end