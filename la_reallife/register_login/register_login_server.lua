function banCheck ( nick, ip, uname, serial )

	local i, j = string.find ( nick, "reallife" )
	if nick ~= MySQL_Save ( nick ) then
		cancelEvent ( true, "Dein Nickname enthält unnötige Zeichen" )
	elseif nick == "Player" then
		cancelEvent ( true, "Bitte wähle einen Nickname ( Unter \"Settings\" )" )
	elseif i and j then
		cancelEvent ( true, "Dein Name enthält das Wort Reallife!" )
	else
		local bantime = tonumber ( MySQL_GetString ( "ban", "STime", "Name LIKE '"..nick.."'" ) )
		if bantime then
			bool = not ( bantime == 0 )
		end
		if bool then
			if ( bantime - getTBanSecTime ( 0 ) ) < 0 then
				MySQL_DelRow ( "ban", "Name LIKE '"..nick.."'")
			elseif bantime > 0 then
				local reason = MySQL_GetString ( "ban", "Grund", "Name LIKE '"..nick.."'" )
				local admin = MySQL_GetString ( "ban", "Admin", "Name LIKE '"..nick.."'" )
				local date = MySQL_GetString ( "ban", "Eintragsdatum", "Name LIKE '" ..nick.."'" )
				local diff = math.floor ( ( ( bantime - getTBanSecTime ( 0 ) ) / 60 ) * 100 ) / 100
				setElementData (getPlayerFromName(nick), "isBanned", true )
				setElementData (getPlayerFromName(nick), "bannedtime", diff )
				setElementData (getPlayerFromName(nick), "bannedadmin", admin )
				setElementData (getPlayerFromName(nick), "bannedreason", reason )
				setElementData (getPlayerFromName(nick), "banneddate", date )
				--cancelEvent ( true, "Du bist noch "..diff.." Stunden von "..admin.." gesperrt, Grund: "..reason )
			end
		else
			local ipBanned = MySQL_GetString("ban", "Grund", "IP LIKE '" ..ip.."'" )
			local nickBanned = MySQL_GetString("ban", "Name", "Name LIKE '" ..nick.."'" )
			local serial2Banned = MySQL_GetString ( "ban", "Grund", "Serial LIKE '"..serial.."'" )
			-- IP-Ban deaktiviert --
			--ipBanned = false
			-- IP-Ban deaktiviert --
			if ipBanned then
				local reason = MySQL_GetString ( "ban", "Grund", "IP LIKE '" ..ip.."'" )
				local admin = MySQL_GetString ( "ban", "Admin", "IP LIKE '" ..ip.."'" )
				local date = MySQL_GetString ( "ban", "Eintragsdatum", "IP LIKE '" ..ip.."'" )
				local diff = "Permanent"
				setElementData (getPlayerFromName(nick), "isBanned", true )
				setElementData (getPlayerFromName(nick), "bannedtime", diff )
				setElementData (getPlayerFromName(nick), "bannedadmin", admin )
				setElementData (getPlayerFromName(nick), "bannedreason", reason )
				setElementData (getPlayerFromName(nick), "banneddate", date )
				--cancelEvent ( true, "Du bist von "..admin.." um "..date.." gebannt worden! Grund: "..reason..", www.la-rl.com" )
			elseif nickBanned then
				local reason = MySQL_GetString ( "ban", "Grund", "Name LIKE '" ..nick.."'" )
				local admin = MySQL_GetString ( "ban", "Admin", "Name LIKE '" ..nick.."'" )
				local date = MySQL_GetString ( "ban", "Eintragsdatum", "Name LIKE '" ..nick.."'" )
				local diff = "Permanent"
				setElementData (getPlayerFromName(nick), "isBanned", true )
				setElementData (getPlayerFromName(nick), "bannedtime", diff )
				setElementData (getPlayerFromName(nick), "bannedadmin", admin )
				setElementData (getPlayerFromName(nick), "bannedreason", reason )
				setElementData (getPlayerFromName(nick), "banneddate", date )
				--cancelEvent ( true, "Du bist von "..admin.." um "..date.." gebannt worden! Grund: "..reason..", www.la-rl.com" )
			elseif serial2Banned then
				local reason = MySQL_GetString ( "ban", "Grund", "Serial LIKE '"..serial.."'" )
				local admin = MySQL_GetString ( "ban", "Admin", "Serial LIKE '"..serial.."'" )
				local date = MySQL_GetString ( "ban", "Eintragsdatum", "Serial LIKE '" ..serial.."'" )
				local diff = "Permanent"
				setElementData (getPlayerFromName(nick), "isBanned", true )
				setElementData (getPlayerFromName(nick), "bannedtime", diff )
				setElementData (getPlayerFromName(nick), "bannedadmin", admin )
				setElementData (getPlayerFromName(nick), "bannedreason", reason )
				setElementData (getPlayerFromName(nick), "banneddate", date )
				--cancelEvent ( true, "Du bist von "..admin.." um "..date.." gebannt worden! Grund: "..reason..", www.la-rl.com" )
			else
				local serialBanned = MySQL_GetString ( "ban", "Grund", "Serial LIKE '%"..serial.."%'" )
				if serialBanned then
					local reason = MySQL_GetString ( "ban", "Grund", "Serial LIKE '"..serial.."'" )
					local admin = MySQL_GetString ( "ban", "Admin", "Serial LIKE '"..serial.."'" )
					local date = MySQL_GetString ( "ban", "Eintragsdatum", "Serial LIKE '" ..serial.."'" )
					local diff = "Permanent"
					setElementData (getPlayerFromName(nick), "isBanned", true )
					setElementData (getPlayerFromName(nick), "bannedtime", diff )
					setElementData (getPlayerFromName(nick), "bannedadmin", admin )
					setElementData (getPlayerFromName(nick), "bannedreason", reason )
					setElementData (getPlayerFromName(nick), "banneddate", date )
					--cancelEvent ( true, "Du bist von "..admin.." um "..date.." gebannt worden! Grund: "..reason..", www.la-rl.com" )
				end
			end
		end
	end
end
addEventHandler ( "onPlayerConnect", getRootElement(), banCheck )

function saltPassword ( pname, string )

	local salt = MySQL_GetString("players", "Salt", "Name LIKE '" ..MySQL_Save(pname).."'")
	if salt == "" then
		salt = generateNewSalt()
		MySQL_SetString("players", "Salt", salt, "Name LIKE '" ..MySQL_Save(pname).."'")
	end
	return string..salt
end

char = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","0","1","2","3","4","5","6","7","8","9", "@", "#", "$", "%", "&", "?"}


function generateNewSalt ()
 
 
local pass = {}
 
local s = 10
local l = 20
        size = math.random(s,l) -- random password length
 
        for z = 1,size do
 
                case = math.random(1,2) -- randomly choose case (caps or lower)
                a = math.random(1,#char) -- randomly choose a character from the "char" array
                if case == 1 then
                        x=string.upper(char[a]) -- uppercase if case = 1
                elseif case == 2 then
                        x=string.lower(char[a]) -- lowercase if case = 2
                end
        table.insert(pass, x) -- add new index into array.
        end
        return(table.concat(pass)) -- concatenate all indicies of the "pass" array, then print out concatenation.
end

function regcheck_func ( player )
if laGetElementData ( player, "loggedin" ) == 1 then

else
	setPedStat ( player, 22, 50 )
	
	laSetElementData  ( player, "loggedin", 0 )
	laSetElementData ( player, "pwfailed", 0 )
	
	pname = getPlayerName ( player )
	toggleAllControls ( player, false )
	--if player == client then
		if isSerialValid ( getPlayerSerial(player) ) or isRegistered ( pname ) or isRegisteredSecure ( pname ) then
			if hasInvalidChar ( player ) and not isRegistered ( pname ) then
				kickPlayer ( player, "Dein Name enthaelt ungueltige Zeichen!" )
			else
				if pname ~= "player" then
					if getElementData (player, "isBanned") then
						local bantime = tonumber ( MySQL_GetString ( "ban", "STime", "Name LIKE '"..pname.."'" ) )
						local reason = MySQL_GetString ( "ban", "Grund", "Name LIKE '"..pname.."'" )
						local admin = MySQL_GetString ( "ban", "Admin", "Name LIKE '"..pname.."'" )
						local date = MySQL_GetString ( "ban", "Eintragsdatum", "Name LIKE '" ..pname.."'" )
						if bantime == 0 then
							diff = "Permanent"
						else
							diff = math.floor ( ( ( bantime - getTBanSecTime ( 0 ) ) / 60 ) * 100 ) / 100
						end
						--setElementData (getPlayerFromName(nick), "bannedtime", diff )
						--setElementData (player, "bannedadmin", admin )
						--setElementData (player, "bannedreason", reason )
						--setElementData (player, "banneddate", date )
						--outputChatBox ("Guten Abend, "..reason.." "..admin.." "..date.." "..diff.."", player, 255, 0, 0 )
						triggerClientEvent ( player, "ShowBannedWindow", getRootElement(), reason, admin, date, diff )
					elseif isRegistered ( pname ) or isRegisteredSecure ( pname ) then
						triggerClientEvent ( player, "ShowLoginWindow", getRootElement() )
					else
						local clantag = gettok ( pname, 1, string.byte(']') )
						if testmode == true then
							triggerClientEvent ( player, "ShowRegisterGui", getRootElement() )
						else
							if clantag == "[" then
								outputChatBox ("Bitte verwende keine [Klammern]!", player, 255, 0, 0 )
							elseif #pname < 3 or #pname > 20 then
								kickPlayer ( player, "Bitte mindestens 3 und maximal 20 Zeichen als Nickname!" )
							elseif hasInvalidChar ( player ) then
								kickPlayer ( player, "Bitte nimm einen Nickname ohne ueberflüssige Zeichen!" )
							else
								triggerClientEvent ( player, "ShowRegisterGui", getRootElement() )
							end
						end
					end
				else
					kickPlayer ( player, "Bitte aendere deinen Nickname!" )
				end
			end
		else
			kickPlayer ( player, "Dein MTA verwendet einen ungueltigen Serial. Bitte neu installieren!" )
		end
	--end
end
end
addEvent ( "regcheck", true )
addEventHandler ("regcheck", getRootElement(), regcheck_func )
addCommandHandler("newlogin", regcheck_func)


function register_func ( player, passwort, bday, bmon, byear, geschlecht, werber )

	if player == client then
		local pname = MySQL_Save ( getPlayerName ( player ) )
		if passwort == MySQL_Save ( passwort ) then
			passwort = MySQL_Save ( passwort )
			bday = MySQL_Save ( bday )
			bmon = MySQL_Save ( bmon )
			byear = MySQL_Save ( byear )
			geschlecht = MySQL_Save ( geschlecht )
			if laGetElementData ( player, "loggedin" ) == 0 and not isRegistered ( pname ) and not isRegisteredSecure ( pname ) and player == client then
				toggleAllControls ( player, true )
				laSetElementData ( player, "loggedin", 1 )
				

				--triggerClientEvent ( source, "DisableRegisterGui", getRootElement() )
				triggerClientEvent ( player, "DisableLoginWindow", getRootElement() )

				local ip = getPlayerIP ( player )
				
				--MySQL_DelRow ( "userdata", "Name LIKE '"..pname.."'" )
				MySQL_DelRow ( "achievments", "Name LIKE '"..pname.."'" )
				MySQL_DelRow ( "packages", "Name LIKE '"..pname.."'" )
				MySQL_DelRow ( "inventar", "Name LIKE '"..pname.."'" )
				MySQL_DelRow ( "bonustable", "Name LIKE '"..pname.."'" )
				
				if geschlecht == nil then
					geschlecht = 1
				end
				
				local regtime = getRealTime()
				local year = regtime.year + 1900
				local month = regtime.month + 1
				local day = regtime.monthday
				local hour = regtime.hour
				local minute = regtime.minute
				
				local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
				local lastlogin = registerdatum
				
				local salt = generateNewSalt ()
				laSetElementData ( player, "salt", salt )
				
				local passwort = md5 ( passwort .. salt )
				local lastLoginInt = getSecTime ( 0 )
				
				-- local result = mysql_query(handler, "INSERT INTO players (Name, Serial, IP, Last_login, Geburtsdatum_Tag, Geburtsdatum_Monat, Geburtsdatum_Jahr, Passwort, Geschlecht, RegisterDatum, Salt, LastLogin) VALUES ( '"..pname.."', '"..getPlayerSerial(player).."', '"..getPlayerIP ( player ).."', '"..lastlogin.."', "..tonumber ( bday)..", "..tonumber ( bmon)..", "..tonumber ( byear)..", '"..passwort.."', '"..geschlecht.."', '"..registerdatum.."', '"..salt.."', '"..lastLoginInt.."' )")
				local result = dbQuery(handler, "INSERT INTO players (Name, Serial, IP, Last_login, Geburtsdatum_Tag, Geburtsdatum_Monat, Geburtsdatum_Jahr, Passwort, Geschlecht, Anreise, RegisterDatum, Salt, Werber, LastLogin, PWChange) VALUES ( '"..pname.."', '"..getPlayerSerial(player).."', '"..getPlayerIP ( player ).."', '"..lastlogin.."', "..tonumber ( bday)..", "..tonumber ( bmon)..", "..tonumber ( byear)..", '"..passwort.."', '"..geschlecht.."', '0', '"..registerdatum.."', '"..salt.."', '"..werber.."', '"..lastLoginInt.."', 0)")
				if( not result) then
					outputDebugString("Error executing the query 1: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 1: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Du hast dich erfolgreich registriert!\n\nDeine Daten werden nun gespeichert!", 7500, 0, 255, 0 )
				end
				
				-- local result = mysql_query(handler, "INSERT INTO achievments (Name) VALUES ('"..pname.."')")
				local result = dbQuery(handler, "INSERT INTO achievments (Name) VALUES ('"..pname.."')")
				if( not result) then
					outputDebugString("Error executing the query 2: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 2: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
				end
				-- local result = mysql_query(handler, "INSERT INTO inventar (Name) VALUES ('"..pname.."')")
				local result = dbQuery(handler, "INSERT INTO inventar (Name) VALUES ('"..pname.."')")
				if( not result) then
					outputDebugString("Error executing the query 3: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 3: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
				end
				-- local result = mysql_query(handler, "INSERT INTO jobdata (Name, Bus, Drogendealer, Farmer, Fischer, Flughafen, Gabelstapler, Hotdog, Lieferant, Strassenreinigung, Taxi, Trucker) VALUES ('"..pname.."','1','1','1','1','1','1','1','1','1','1','1' )")
				local result = dbQuery(handler, "INSERT INTO jobdata (Name, Bus, Drogendealer, Farmer, Fischer, Flughafen, Gabelstapler, Hotdog, Lieferant, Strassenreinigung, Taxi, Trucker) VALUES ('"..pname.."','1','1','1','1','1','1','1','1','1','1','1' )")
				if( not result) then
					outputDebugString("Error executing the query 4: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 4: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
				end
				-- local result = mysql_query(handler, "INSERT INTO packages (Name, Paket1, Paket2, Paket3, Paket4, Paket5, Paket6, Paket7, Paket8, Paket9, Paket10, Paket11, Paket12, Paket13, Paket14, Paket15, Paket16, Paket17, Paket18, Paket19, Paket20, Paket21, Paket22, Paket23, Paket24, Paket25) VALUES ('"..pname.."','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0' )")
				local result = dbQuery(handler, "INSERT INTO packages (Name, Paket1, Paket2, Paket3, Paket4, Paket5, Paket6, Paket7, Paket8, Paket9, Paket10, Paket11, Paket12, Paket13, Paket14, Paket15, Paket16, Paket17, Paket18, Paket19, Paket20, Paket21, Paket22, Paket23, Paket24, Paket25) VALUES ('"..pname.."','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0' )")
				if( not result) then
					outputDebugString("Error executing the query 5: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 5: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
				end
				-- local result = mysql_query(handler, "INSERT INTO bonustable (Name, Lungenvolumen, Muskeln, Kondition, Boxen, KungFu, Streetfighting, CurStyle, PistolenSkill, SilenceSkill, DeagleSkill, ShotgunSkill, AssaultSkill, AKSkill, UziSkill, MP5Skills) VALUES ('"..pname.."', 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none' )")
				local result = dbQuery(handler, "INSERT INTO bonustable (Name, Lungenvolumen, Muskeln, Kondition, Boxen, KungFu, Streetfighting, CurStyle, PistolenSkill, SilenceSkill, DeagleSkill, ShotgunSkill, AssaultSkill, AKSkill, UziSkill, MP5Skills) VALUES ('"..pname.."', 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none' )")
				if( not result) then
					outputDebugString("Error executing the query 6: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 6: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
				end
				mysql_la_query ( "INSERT INTO skills ( id, Name ) VALUES ( '"..getIDByName ( pname ).."', '"..pname.."' )" )
				
				local Geld = 500
				laSetElementData ( player, "money", Geld )
				givePlayerMoney ( player, Geld )
				local Punkte = 0
				laSetElementData ( player, "points", Punkte )
				local Paeckchen = "90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
				laSetElementData ( player, "packages", Paeckchen )
				local Spawnpos_X = -1971.461
				laSetElementData ( player, "spawnpos_x", Spawnpos_X )
				local Spawnpos_Y = 137.821
				laSetElementData ( player, "spawnpos_y", Spawnpos_Y )
				local Spawnpos_Z = 27.6875
				laSetElementData ( player, "spawnpos_z", Spawnpos_Z )
				local Spawnrot_X = 90
				laSetElementData ( player, "spawnrot_x", Spawnrot_X )
				local SpawnInterior = 0
				laSetElementData ( player, "spawnint", SpawnInterior )
				local SpawnDimension = 0
				laSetElementData ( player, "spawndim", SpawnDimension )
				local Fraktion = 0
				laSetElementData ( player, "fraktion", Fraktion )
				local FraktionsRang = 0
				laSetElementData ( player, "rang", FraktionsRang )
				local Adminlevel = 0
				laSetElementData ( player, "adminlvl", Adminlevel )
				local Spielzeit = 0
				laSetElementData ( player, "playingtime", Spielzeit )
				local CurrentCars = 0
				laSetElementData ( player, "curcars", CurrentCars )
				local Maximumcars = 10
				laSetElementData ( player, "maxcars", Maximumcars )
				local Carslot1 = 0
				laSetElementData ( player, "carslot1", Carslot1 )
				local Carslot2 = 0
				laSetElementData ( player, "carslot2", Carslot2 )
				local Carslot3 = 0
				laSetElementData ( player, "carslot3", Carslot3 )
				local Carslot4 = 0
				laSetElementData ( player, "carslot4", Carslot4 )
				local Carslot5 = 0
				laSetElementData ( player, "carslot5", Carslot5 )
				local Carslot6 = 0
				laSetElementData ( player, "carslot6", Carslot6 )
				local Carslot7 = 0
				laSetElementData ( player, "carslot7", Carslot7 )
				local Carslot8 = 0
				laSetElementData ( player, "carslot8", Carslot8 )
				local Carslot9 = 0
				laSetElementData ( player, "carslot9", Carslot9 )
				local Carslot10 = 0
				laSetElementData ( player, "carslot10", Carslot10 )
				local Tode = 0
				laSetElementData ( player, "deaths", Tode )
				local Kills = 0
				laSetElementData ( player, "kills", Kills )
				local Knastzeit = 0
				laSetElementData ( player, "jailtime", Knastzeit )
				local Alkazeit = 0
				laSetElementData ( player, "prisontime", Alkazeit )
				local Hoellenzeit = 0
				laSetElementData ( player, "helltime", Hoellenzeit )
				local Himmelszeit = 0
				laSetElementData ( player, "heaventime", Himmelszeit )
				local Hausschluessel = 0
				laSetElementData ( player, "housekey", 0 )
				local Bizschluessel = 0
				laSetElementData ( player, "bizkey", Bizschluessel )
				local Bankgeld = 7500
				laSetElementData ( player, "bankmoney", Bankgeld )
				--local Drogen  = 0
				--laSetElementData ( player, "drugs", Drogen )
				if geschlecht == 1 then
					local rnd = math.random ( 1, 5 )
					Skinid = femalehomeless[rnd]
					laSetElementData ( player, "skinid", Skinid )
				else
					local rnd = math.random ( 1, 10 )
					Skinid = malehomeless[rnd]
					laSetElementData ( player, "skinid", Skinid )
				end
				local Autofuehrerschein = 0
				laSetElementData ( player, "carlicense", Autofuehrerschein )
				local Motorradtfuehrerschein = 0
				laSetElementData ( player, "bikelicense", Motorradtfuehrerschein )
				local LKWfuehrerschein = 0
				laSetElementData ( player, "lkwlicense", LKWfuehrerschein )
				local Helikopterfuehrerschein = 0
				laSetElementData ( player, "helilicense", Helikopterfuehrerschein )
				local FlugscheinKlasseA = 0
				laSetElementData ( player, "planelicensea", FlugscheinKlasseA )
				local FlugscheinKlasseB = 0
				laSetElementData ( player, "planelicenseb", FlugscheinKlasseB )
				local Motorbootschein = 0
				laSetElementData ( player, "motorbootlicense", Motorbootschein )
				local Segelschein = 0
				laSetElementData ( player, "segellicense", Segelschein)
				local Angelschein = 0
				laSetElementData ( player, "fishinglicense", Angelschein)
				local Wanteds = 0
				laSetElementData ( player, "wanteds", Wanteds )
				local StvoPunkte = 0
				laSetElementData ( player, "stvo", StvoPunkte )
				local WaffenscheinA = 0
				laSetElementData ( player, "gunlicense", WaffenscheinA )
				local WaffenscheinB = 0
				laSetElementData ( player, "gunlicenseB", WaffenscheinB )
				local WaffenscheinC = 0
				laSetElementData ( player, "gunlicenseC", WaffenscheinC )
				local Perso = 1
				laSetElementData ( player, "perso", Perso )
				local IncomePayday = 0
				laSetElementData ( player, "incomepayday", IncomePayday )
				local Boni = 1000
				laSetElementData ( player, "boni", Boni )
				local PdayIncome = 0
				laSetElementData ( player, "pdayincome", PdayIncome )
				local PdayKosten = 0
				laSetElementData ( player, "pdaykosten", PdayKosten )
				run = 1
				while true do
					if run >= 20 then
						break
					else
						run = run + 1
					end
					local tnr = math.random ( 1000000, 9999999 )
					local result = MySQL_GetString( "userdata", "Telefonnr", "Telefonnr LIKE '"..tnr.."'" )
					if not result then
						if tonumber ( tnr ) ~= 911 and tonumber ( tnr ) ~= 333 and tonumber ( tnr ) ~= 400 and tonumber (tnr ) ~= 666666 then
							Telefonnr = tnr
							break
						end
					end
				end
				if Telefonnr == nil then
					Telefonnr = math.random ( 1000000, 9999999 )
				end
				laSetElementData ( player, "telenr", Telefonnr )
				local Warns = 0
				laSetElementData ( player, "warns", Warns )
				local GunboxA = "0|0"
				laSetElementData ( player, "gunboxa", GunboxA )
				local GunboxB = "0|0"
				laSetElementData ( player, "gunboxb", GunboxB )
				local GunboxC = "0|0"
				laSetElementData ( player, "gunboxc", GunboxC )
				local GunboxD = "0|0"
				laSetElementData ( player, "gunboxd", GunboxD )
				local GunboxE = "0|0"
				laSetElementData ( player, "gunboxe", GunboxE )
				local GunboxF = "0|0"
				laSetElementData ( player, "gunboxf", GunboxF )
				local Job = "none"
				laSetElementData ( player, "job", Job )
				local Jobtime = 0
				laSetElementData ( player, "jobtime", Jobtime )
				local Club = "none"
				laSetElementData ( player, "club", Club )
				local FavChannel = 0
				laSetElementData ( player, "favchannel", FavChannel )
				local BonusPunkte = 0
				laSetElementData ( player, "bonuspoints", BonusPunkte )
				local hunger = 50
				laSetElementData ( player, "hunger", hunger )
				local urin = 50
				laSetElementData ( player, "urin", urin )
				local schlaf = 50
				laSetElementData ( player, "schlaf", schlaf )
				--local werber = "none"
				laSetElementData ( player, "werber", werber )
				local sprache = "none"
				laSetElementData ( player, "sprache", sprache )
				local Contract = 0
				laSetElementData ( player, "contract", Contract )
				local socialState = "New in LA"
				laSetElementData ( player, "socialState", socialState )
				local Permission = "none"
				laSetElementData ( player, "permission", Permission )
				
				laSetElementData ( player, "handyType", 2 )
				laSetElementData ( player, "handyCosts", 0 )
				
				_G[pname.."paydaytime"] = setTimer ( playingtime, 60000, 1, player )
				
				laSetElementData  ( player, "loggedin", 1 )
				laSetElementData ( player, "muted", 0 )
				laSetElementData ( player, "ElementClicked", false )
				laSetElementData ( player, "curplayingtime", 0 )
				laSetElementData ( player, "housex", 0 )
				laSetElementData ( player, "housey", 0 )
				laSetElementData ( player, "housez", 0 )
				laSetElementData ( player, "house", "none" )
				laSetElementData ( player, "handystate", "on" )
				laSetElementData ( player, "object", 0 )

				--[[local Buslevel = 1
				laSetElementData ( player, "buslevel", Buslevel )
				local Drogendealerlevel = 1
				laSetElementData ( player, "drogendealerlevel", Drogendealerlevel )
				local Farmerlevel = 1
				laSetElementData ( player, "farmerlevel", Farmerlevel )
				local Fischerlevel = 1
				laSetElementData ( player, "fischerlevel", Fischerlevel )
				local Flughafenlevel = 1
				laSetElementData ( player, "flughafenlevel", Flughafenlevel )
				local Gabelstaplerlevel = 1
				laSetElementData ( player, "gabelstaplerlevel", Gabelstaplerlevel )
				local Hotdoglevel = 1
				laSetElementData ( player, "hotdoglevel", Hotdoglevel )
				local Lieferantlevel = 1
				laSetElementData ( player, "lieferantlevel", Lieferantlevel )				
				local Strassenreinigunglevel = 1
				laSetElementData ( player, "strassenreinigunglevel", Strassenreinigunglevel )
				local Taxilevel = 1
				laSetElementData ( player, "taxilevel", Taxilevel )		
				local Truckerlevel = 0
				laSetElementData ( player, "truckerlevel", Truckerlevel )]]	

				bindKey ( source, "r", "down", reload )
				
				triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
				spawnPlayer ( player, laGetElementData ( player, "spawnpos_z" ), laGetElementData ( player, "spawnpos_y" ), laGetElementData ( player, "spawnpos_z" ), laGetElementData ( player, "spawnrot_x" ), laGetElementData ( player, "spawnint" ), laGetElementData ( player, "spawndim" ) )
				triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
							
				checkPremium ( player )
				
				--fadeCamera ( player, true )
				--setCameraTarget( player, player )
				
				setPlayerWantedLevel ( player, Wanteds )
				
				packageLoad ( player )
				achievload ( player )
				inventoryload ( player )
				elementDataSettings ( player )
				bonusLoad ( player )
				jobload ( player )
				skillDataLoad ( player )

				-- local result = mysql_query(handler, "INSERT INTO userdata ( Name,Skinid,Telefonnr) VALUES('"..pname.."', '"..laGetElementData ( player, "skinid" ).."', '"..Telefonnr.."')")
				local result = dbQuery(handler, "INSERT INTO userdata ( Name,Skinid,Telefonnr,werber,Sprache) VALUES('"..pname.."', '"..laGetElementData ( player, "skinid" ).."', '"..Telefonnr.."', '"..werber.."', 'Deutsch')")
				if( not result) then
					outputDebugString("Error executing the query 7: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
					outputLog ( "[REGISTER]: Error executing the query 7: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
				else
					-- mysql_free_result(result)
					dbFree(result)
					outputDebugString ("Daten fuer Spieler "..pname.." wurden angelegt!")
					outputLog ( "[REGISTER]: Daten fuer Spieler "..pname.." wurden angelegt!" , "save" )
				end
				outputChatBox ( "Verwende /infos oder F1 für mehr Informationen über LA!", player, 200, 200, 0 )
				
				laSetElementData ( player, "gameboy", 0 )
				
				laSetElementData ( player, "medikit", 0 )
				
				loadAddictionsForPlayer ( player )
				
				-- Tutorial --
				laSetElementData ( player, "isInTut", true )
				--triggerClientEvent ( player, "setPlayerInTutorial", player )
				startintro_func ( player )
				datasave_remote ( player )
				triggerEvent ( "onLAPlayerLogin", player )
			end
		else
			outputChatBox ( "Dein Passwort enthält ungültige Sonderzeichen!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "register", true )
addEventHandler ( "register", getRootElement(), register_func)

function gameBeginGuiShow_func ( player )

	--if player == client then
		laSetElementData ( player, "isInTut", false )
		--triggerClientEvent ( player, "showBeginGui", getRootElement() )
		--showCursor ( player, true )
		--laSetElementData ( player, "ElementClicked", true )
		--toggleAllControls ( player, false )
		--setElementPosition ( player, -1971.466796875, 137.821890625, 27.6875 )
		--setElementInterior ( player, 0 )
		bindKey ( player, "ralt", "down", showcurser, player )
		bindKey ( player, "m", "down", showcurser, player )
		bindKey ( player, "f1", "down", showhmenue, player )
	--end
end
addEvent ( "gameBeginGuiShow", true )
addEventHandler ( "gameBeginGuiShow", getRootElement(), gameBeginGuiShow_func)

function isRegistered ( pname )

	return MySQL_DatasetExist ( "players", "Name LIKE '"..pname.."'" )
end

function isRegisteredSecure ( pname )

	return MySQL_DatasetExist ( "userdata", "Name LIKE '"..pname.."'" )
end

function login_func ( player, passwort )
	
	if player == client then
		if laGetElementData ( player, "loggedin" ) == 0 then
			local pname = MySQL_Save ( getPlayerName ( player ) )
			local passwortold = MySQL_Save ( passwort )
				
			local passwort = saltPassword ( pname, passwort )
			
			local result = MySQL_GetString("players", "Passwort", "Name LIKE '" ..pname.."'")
			local pwchanged = MySQL_GetString("players", "PWChange", "Name LIKE '" ..pname.."'")
			if ( not result ) then
				outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
				outputLog ( "[LOGIN]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
			else
				if (result == md5(passwort)) or (result == md5(passwortold)) then
					if result == md5(passwortold) then
						showCursor ( player, true )
						triggerClientEvent ( player, "showChangePasswordWindow", getRootElement() )
						showCursor ( player, true )
					end
					--[[if (( getMinTime() - pwchanged ) / 60 / 24 >= 30) or ( pwchanged == 0)   then
						showCursor ( player, true )
						triggerClientEvent ( player, "showChangePasswordWindow", getRootElement() )
						showCursor ( player, true )
					end]]
					
					--[[-- Alte Passwrter ohne Salt auf Salt umschreiben --
					local salt = MySQL_GetString("players", "Salt", "Name LIKE '" ..MySQL_Save(pname).."'")
					if salt == "" then
						salt = generateNewSalt()
						passwort = md5 ( passwort .. salt )
						MySQL_SetString("players", "Salt", salt, "Name LIKE '" ..pname.."'")
						MySQL_SetString("players", "Passwort", passwort, "Name LIKE '" ..pname.."'")
					end
					-- Salt --]]
					
					toggleAllControls ( player, true )

					laSetElementData ( player, "loggedin", 1 )
					
					laSetElementData  ( player, "loggedin", 1 )
					
					local logtime = getRealTime()
					local year = logtime.year + 1900
					local month = logtime.month + 1
					local day = logtime.monthday
					local hour = logtime.hour
					local minute = logtime.minute
					
					local lastLoginInt = getSecTime ( 0 )
					local lastlogin = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
					
					local dsatz
					-- local result = mysql_query ( handler, "SELECT * from userdata WHERE Name LIKE '"..pname.."'" )
					local result = dbQuery ( handler, "SELECT * from userdata WHERE Name LIKE '"..pname.."'" )
					if result then
						local re, num_rows = dbPoll(result, -1)
						-- if ( mysql_num_rows ( result ) > 0 ) then
						if re and num_rows > 0 then
							-- dsatz = mysql_fetch_assoc ( result )
							dsatz = re[1]
							-- mysql_free_result ( result )
							dbFree ( result )
						end
					end
					
					local money = tonumber ( dsatz["Geld"] )
					laSetElementData ( player, "money", money )
					if money >= 0 then
						givePlayerMoney ( player, money )
					else
						takePlayerMoney ( player, money )
					end
					setElementData( player , "bankmoney" , money )
					local fraktion = tonumber ( dsatz["Fraktion"] )
					laSetElementData ( player, "fraktion", fraktion )
					if fraktion > 0 then
						fraktionMembers[fraktion][player] = fraktion
					end
					local rang = tonumber ( dsatz["FraktionsRang"] )
					if rang == 1 then
						bindKey ( player, "1", "down", tazer_func, player )
					end
					laSetElementData ( player, "rang", tonumber ( rang ) )
					local admnlvl = tonumber ( dsatz["Adminlevel"] )
					laSetElementData ( player, "adminlvl", admnlvl )
					if admnlvl >= 1 then
						adminsIngame[player] = admnlvl
					end
					setElementData( player , "skinshop" , 0 )
					
					laSetElementData ( player, "points", tonumber ( dsatz["Punkte"] ) )
					laSetElementData ( player, "spawnpos_x", dsatz["Spawnpos_X"] )
					laSetElementData ( player, "spawnpos_y", dsatz["Spawnpos_Y"] )
					laSetElementData ( player, "spawnpos_z", tonumber ( dsatz["Spawnpos_Z"] ) )
					laSetElementData ( player, "spawnrot_x", tonumber ( dsatz["Spawnrot_X"] ) )
					laSetElementData ( player, "spawnint", tonumber ( dsatz["SpawnInterior"] ) )
					laSetElementData ( player, "spawndim", tonumber ( dsatz["SpawnDimension"] ) )
					laSetElementData ( player, "playingtime", tonumber ( dsatz["Spielzeit"] ) )
					laSetElementData ( player, "curcars", tonumber ( dsatz["CurrentCars"] ) )
					laSetElementData ( player, "isLiveZahl", 0 )
					curcars = 0
					local offerOnCar = false
					if laGetElementData (player, "premium") == true then
						zahl = 15
						else
						zahl = 10
					end
					for i = 1, zahl do
						carvalue = MySQL_GetString("vehicles", "Special", "Slot LIKE '" ..i.."' AND Besitzer LIKE '"..pname.."'")
						if carvalue == 2 then
							laSetElementData ( player, "yachtImBesitz", true )
						end
						if not carvalue then
							if MySQL_DatasetExist("buyit", "Hoechstbietender LIKE '"..pname.."' AND Typ LIKE 'Veh'") then
								carvalue = 3
								offerOnCar = true
							else
								carvalue = 0
							end
						else
							if carvalue == 2 then
								carvalue = 2
							else
								carvalue = 1
							end
							curcars = curcars + 1
						end
						laSetElementData ( player, "carslot"..i, carvalue )
					end
					laSetElementData ( player, "curcars", curcars )
					
					laSetElementData ( player, "deaths", tonumber ( dsatz["Tode"] ) )
					laSetElementData ( player, "kills", tonumber ( dsatz["Kills"] ) )
					laSetElementData ( player, "jailtime", tonumber ( dsatz["Knastzeit"] ) )
					laSetElementData ( player, "heaventime", tonumber ( dsatz["Himmelszeit"] ) )
					
					local Hausschluessel = MySQL_GetString("houses", "ID", "Besitzer LIKE '" ..pname.."'")
					local key = tonumber ( dsatz["Hausschluessel"] )
					if Hausschluessel then
						laSetElementData ( player, "housekey", tonumber ( Hausschluessel ) )
					elseif key <= 0 then
						laSetElementData ( player, "housekey", key )
					else
						laSetElementData ( player, "housekey", 0 )
					end
					
					laSetElementData ( player, "bizkey", tonumber ( dsatz["Bizschluessel"] ) )
					laSetElementData ( player, "bankmoney", tonumber ( dsatz["Bankgeld"] ) )
					--laSetElementData ( player, "drugs", tonumber ( dsatz["Drogen"] ) )
					laSetElementData ( player, "skinid", tonumber ( dsatz["Skinid"] ) )
					laSetElementData ( player, "carlicense", tonumber ( dsatz["Autofuehrerschein"] ) )
					laSetElementData ( player, "bikelicense", tonumber ( dsatz["Motorradtfuehrerschein"] ) )
					laSetElementData ( player, "lkwlicense", tonumber ( dsatz["LKWfuehrerschein"] ) )
					laSetElementData ( player, "helilicense", tonumber ( dsatz["Helikopterfuehrerschein"] ) )
					laSetElementData ( player, "planelicensea", tonumber ( dsatz["FlugscheinKlasseA"] ) )
					laSetElementData ( player, "planelicenseb", tonumber ( dsatz["FlugscheinKlasseB"] ) )
					laSetElementData ( player, "motorbootlicense", tonumber ( dsatz["Motorbootschein"] ) )
					laSetElementData ( player, "segellicense", tonumber ( dsatz["Segelschein"] ) )
					laSetElementData ( player, "fishinglicense", tonumber ( dsatz["Angelschein"] ) )
					laSetElementData ( player, "wanteds", tonumber ( dsatz["Wanteds"] ) )
					laSetElementData ( player, "stvo", tonumber ( dsatz["StvoPunkte"] ) )
					laSetElementData ( player, "gunlicense", tonumber ( dsatz["WaffenscheinA"] ) )
					laSetElementData ( player, "gunlicenseB", tonumber ( dsatz["WaffenscheinB"] ) )
					laSetElementData ( player, "gunlicenseC", tonumber ( dsatz["WaffenscheinC"] ) )
					laSetElementData ( player, "perso", tonumber ( dsatz["Perso"] ) )
					laSetElementData ( player, "boni", tonumber ( dsatz["Boni"] ) )
					laSetElementData ( player, "incomepayday", tonumber ( dsatz["IncomePayday"] ) )
					laSetElementData ( player, "pdayincome", tonumber ( dsatz["PdayIncome"] ) )
					laSetElementData ( player, "pdaykosten", tonumber ( dsatz["PdayKosten"] ) )
					laSetElementData ( player, "telenr", tonumber ( dsatz["Telefonnr"] ) )
					laSetElementData ( player, "warns", tonumber ( dsatz["Warns"] ) )
					laSetElementData ( player, "gunboxa", dsatz["Gunbox1"] )
					laSetElementData ( player, "gunboxb", dsatz["Gunbox2"] )
					laSetElementData ( player, "gunboxc", dsatz["Gunbox3"] )
					laSetElementData ( player, "gunboxd", dsatz["Gunbox4"] )
					laSetElementData ( player, "gunboxe", dsatz["Gunbox5"] )
					laSetElementData ( player, "gunboxf", dsatz["Gunbox6"] )
					laSetElementData ( player, "job", dsatz["Job"] )
					laSetElementData ( player, "jobtime", dsatz["Jobtime"] )
					laSetElementData ( player, "club", dsatz["Club"] )
					laSetElementData ( player, "favchannel", tonumber ( dsatz["FavRadio"] ) )
					laSetElementData ( player, "bonuspoints", tonumber ( dsatz["Bonuspunkte"] ) )
					laSetElementData ( player, "hunger", tonumber ( dsatz["hunger"] ) )
					laSetElementData ( player, "urin", tonumber ( dsatz["urin"] ) )
					laSetElementData ( player, "schlaf", tonumber ( dsatz["schlaf"] ) )
					laSetElementData ( player, "werber", dsatz["werber"] )
					laSetElementData ( player, "sprache", dsatz["Sprache"] )
					laSetElementData ( player, "permission", dsatz["Permission"] )
					laSetElementData ( player, "gwd", tonumber(dsatz["GWD"]) )
					--SICHERHEITSHINWEIS--
					laSetElementData ( player, "truckerlvl", tonumber ( dsatz["Truckerskill"] ) )
					laSetElementData ( player, "airportlvl", tonumber ( dsatz["AirportLevel"] ) )
					--SICHERHEITSHINWEIS--
					laSetElementData ( player, "contract", tonumber ( dsatz["Contract"] ) )
					laSetElementData ( player, "socialState", dsatz["SocialState"] )
					if dsatz["SocialState"] == "0" or dsatz["SocialState"] == 0 then
						laSetElementData ( player, "socialState", "Obdachloser" )
					end
					--SICHERHEITSHINWEIS--
					laSetElementData ( player, "streetCleanPoints", tonumber ( dsatz["StreetCleanPoints"] ) )
					--SICHERHEITSHINWEIS--
					
					local handyString = dsatz["Handy"] 
					local v1, v2
					v1 = tonumber ( gettok ( handyString, 1, string.byte ( '|' ) ) )
					v2 = tonumber ( gettok ( handyString, 2, string.byte ( '|' ) ) )
					laSetElementData ( player, "handyType", v1 )
					laSetElementData ( player, "handyCosts", v2 )
					
					loadAddictionsForPlayer ( player )
					
					checkPremium ( player )
					
					laSetElementData ( player, "housex", 0 )
					laSetElementData ( player, "housey", 0 )
					laSetElementData ( player, "housez", 0 )
					laSetElementData ( player, "house", "none" )
					laSetElementData ( player, "curplayingtime", 0 )
					laSetElementData ( player, "handystate", "on" )
					
					packageLoad ( player )
					achievload ( player )
					inventoryload ( player )
					elementDataSettings ( player )
					bonusLoad ( player )
					jobload ( player )
					skillDataLoad ( player )
					setMaximumCarsForPlayer ( player )
					setPremiumData ( player )
					
					
					showFittingBlipForPlayer ( player )
					
					_G[pname.."paydaytime"] = setTimer ( playingtime, 60000, 1, player )
					_G[pname.."newsnew"] = setTimer ( newsnew, 60000, 1, player )
					
					RemoteSpawnPlayer ( player )
					if laGetElementData ( player, "heaventime" ) >= 1 then setElementDimension ( player, 1 ) end
					laSetElementData ( player, "muted", 0 )
					triggerClientEvent ( player, "DisableLoginWindow", getRootElement() )
					if getElementData ( player, "sprache" ) == "Deutsch" then
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast dich erfolgreich eingeloggt!\nViel Spass auf Los Angeles Reallife!", 5000, 0, 255, 0 )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "You successfully logged in!\nHave fun on Los Angeles Reallife!", 5000, 0, 255, 0 )
					end
					-- setPlayerHudComponentVisible( player, "all", true)
					setPlayerHudComponentVisible( player, "all", true)
					outputDebugString ("Spieler "..pname.." wurde eingeloggt, IP: "..getPlayerIP(player))
					outputLog ( "[LOGIN]: Spieler "..pname.." hat sich eingeloggt, IP: "..getPlayerIP(player)..", Serial: "..getPlayerSerial(player).."", "login" )
					
					laSetElementData ( player, "loggedin", 1 )
					laSetElementData ( player, "ElementClicked", false )

					if laGetElementData ( player, "stvo" ) >= 15 then			-- SearchSTVO
						laSetElementData ( player, "carlicense", 0 )
						laSetElementData ( player, "stvo", 0 )
						MySQL_SetString("userdata", "Autofuehrerschein", laGetElementData ( player, "carlicense" ), "Name LIKE '"..pname.."'")
						outputChatBox ( "Wegen deines schlechten Fahrverhaltens wurde dir dein Führerschein abgenommen!", player, 150, 0, 0 )
					end
					
					laSetElementData ( player, "object", tonumber ( MySQL_GetString ( "inventar", "Objekt", "Name LIKE '" ..pname.."'" ) ) )
					
					checkmsgs ( player )
					
					blacklistLogin ( pname )
					whitelistLogin ( pname )
					
					-- *** EasterEgg ***
						if month == 4 and day == 4 then
							local oldlogin = MySQL_GetString("players", "Last_login", "Name LIKE '" ..pname.."'")
							local oldlogin1 = tonumber (  gettok ( oldlogin, 1, string.byte('.') ) )
							local oldlogin2 = tonumber (  gettok ( oldlogin, 2, string.byte('.') ) )
							if ( oldlogin1 ~= 4 or oldlogin2 ~= 4 ) or ( minute < 25 and hour < 16 ) then
								putFoodInSlot ( player, 5 )
							end
						elseif month == 4 and day == 5 then
							local oldlogin = MySQL_GetString("players", "Last_login", "Name LIKE '" ..pname.."'")
							local oldlogin1 = tonumber (  gettok ( oldlogin, 1, string.byte('.') ) )
							local oldlogin2 = tonumber (  gettok ( oldlogin, 2, string.byte('.') ) )
							if oldlogin1 ~= 4 or oldlogin2 ~= 5 then
								putFoodInSlot ( player, 5 )
							end
						end
					-- *** EasterEgg ***
					MySQL_SetString("players", "Last_login", lastlogin, "Name LIKE '"..pname.."'")
					MySQL_SetString("players", "LastLogin", lastLoginInt, "Name LIKE '"..pname.."'")
					
					local position = MySQL_GetString("logout", "Position", "Name LIKE '" ..pname.."'")
					if position then
						weapons = MySQL_GetString ( "logout", "Waffen", "Name LIKE '" ..pname.."'" )
						weste = MySQL_GetString ( "logout", "Weste", "Name LIKE '" ..pname.."'" )
						MySQL_DelRow ( "logout", "Name LIKE '"..pname.."'" )
						setPedArmor ( player, weste )
						for i = 1, 12 do
							local wstring = gettok ( weapons, i, string.byte( '|' ) )
							if wstring then
								if wstring then
									if #wstring >= 3 then
										local weapon = tonumber ( gettok ( wstring, 1, string.byte( ',' ) ) )
										local ammo = tonumber ( gettok ( wstring, 2, string.byte( ',' ) ) )
										giveWeapon ( player, weapon, ammo, true )
										triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
									end
								end
							end
						end
						if position ~= "false" then
							local x = tonumber ( gettok ( position, 1, string.byte( '|' ) ) )
							local y = tonumber ( gettok ( position, 2, string.byte( '|' ) ) )
							local z = tonumber ( gettok ( position, 3, string.byte( '|' ) ) )
							local int = tonumber ( gettok ( position, 4, string.byte( '|' ) ) )
							local dim = tonumber ( gettok ( position, 5, string.byte( '|' ) ) )
							setTimer ( setElementInterior, 1000, 1, player, int )
							setTimer ( setElementDimension, 1000, 1, player, dim )
							setTimer ( setElementPosition, 1000, 1, player, x, y, z )
						end
					end
					getMailsForClient_func ( pname )
					triggerEvent ( "onLAPlayerLogin", player )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Ungültiges Passwort -\nüberprüfe\ndeine Eingabe\noder melde dich\nim Forum.", 5000, 255, 0, 0 )
					-- triggerClientEvent ( player, "guiShowLoginAgain", getRootElement() )
					laSetElementData ( player, "pwfailed", tonumber ( laGetElementData ( player, "pwfailed" )) + 1 )
					if laGetElementData ( player, "pwfailed" ) >= 3 then
						outputDebugString ("Spieler "..tostring ( getPlayerName(player) ).." wurde aufgrund eines falschen Passworts gekickt! IP: "..tostring ( getPlayerIP(player) ) )
						outputLog ( "[PASSWORT]: Spieler "..tostring ( getPlayerName(player) ).." wurde aufgrund eines falschen Passworts gekickt! IP: "..tostring ( getPlayerIP(player) )..", Serial: "..tostring ( getPlayerSerial(player)).."", "login" )
						kickPlayer ( player, "Du hast 3x das falsche Passwort eingegeben - Bitte melde dich bei einem Admin!", 0 )
					end
				end
			end
			bindKey ( player, "ralt", "down", showcurser, player )
			bindKey ( player, "m", "down", showcurser, player )
			bindKey ( player, "f1", "down", showhmenue, player )
			bindKey ( player, "r", "down", reload )
		end
	end
end
addEvent ( "einloggen", true )
addEventHandler ( "einloggen", getRootElement(), login_func )

function datasave ( quitReason, reason )

	if tonumber ( laGetElementData ( source, "loggedin" ) ) == 1 then
		fraktionMembers[laGetElementData(source,"fraktion")][source] = nil
		adminsIngame[source] = nil
		local pname = MySQL_Save ( getPlayerName ( source ) )
		if getElementData ( source, "isInHighNoon" ) or laGetElementData ( source, "shootingRanchGun" ) then
		elseif quitReason and reason ~= "Ausgeloggt." then
			if laGetElementData ( source, "wanteds" ) >= 1 and ( quitReason == "Quit" or quitReason == "Unknown" ) then
				local x, y, z = getElementPosition ( source )
				local copShape = createColSphere ( x, y, z, 20 )
				local elementsInCopSphere = getElementsWithinColShape ( copShape, "player" )
				destroyElement ( copShape )
				for key, cPlayer in ipairs ( elementsInCopSphere ) do
					if isOnStateDuty ( cPlayer ) then
						local wanteds = laGetElementData ( source, "wanteds" )
						local newwanteds = wanteds + 2
						if newwanteds >= 6 then
							laSetElementData ( source, "wanteds", 0 )
							laSetElementData ( source, "jailtime", wanteds * 12 + laGetElementData ( source, "jailtime" ) )
							wantedCost = 100*wanteds*(wanteds*.5)
							laSetElementData ( source, "money", laGetElementData ( source, "money" ) - wantedCost )
							if laGetElementData ( source, "money" ) < 0 then
								laSetElementData ( source, "money", 0 )
							end
							outputChatBox ( "Der Gesuchte "..getPlayerName ( source ).." ist offline gegangen. Er wird beim nächsten Einloggen hinter Gittern sein.", cPlayer, 0, 125, 0 )
							offlinemsg ( "Du bist für "..(wanteds*12).." Minuten eingesperrt worden. Offlineflucht ist verboten!", "Server", getPlayerName(source) )
							break
						else
							laSetElementData ( source, "wanteds", newwanteds )
							outputChatBox ( "Der Gesuchte "..getPlayerName ( source ).." ist offline gegangen. Beim nächsten Einloggen ist sein Wantedlevel auf "..newwanteds..".", cPlayer, 0, 125, 0 )
							offlinemsg ( "Du hast für Offlineflucht das Wantedlevel "..newwanteds.." gekriegt und wirst gesucht!", "Server", getPlayerName(source) )
							break						
						end
					end
				end
			elseif laGetElementData ( source, "lastcrime") == "mord" then
				local x, y, z = getElementPosition ( source )
				local copShape = createColSphere ( x, y, z, 20 )
				local elementsInCopSphere = getElementsWithinColShape ( copShape, "player" )
				destroyElement ( copShape )
				for key, cPlayer in ipairs ( elementsInCopSphere ) do
					if isOnStateDuty ( cPlayer ) then
						local wanteds = 6
						laSetElementData ( source, "wanteds", wanteds )
						outputChatBox ( "Der Gesuchte "..getPlayerName ( source ).." ist offline gegangen. Beim nächsten Einloggen ist sein Wantedlevel auf "..wanteds..".", cPlayer, 0, 125, 0 )
						offlinemsg ( "Du hast für Offlineflucht "..wanteds.." gekriegt und wirst gesucht!", "Server", getPlayerName(source) )
						break
					end
				end
			end
			if quitReason == "Kicked" or quitReason == "Bad Connection" or quitReason == "Timed out" then
				local curWeaponsForSave = "|"
				for i = 1, 12 do
					if i ~= 10 and i ~= 12 then
						local weapon = laGetElementData ( source, "weaponInSlot"..i )
						local ammo = laGetElementData ( source, "weaponInSlot"..i.."Ammo" )
						if weapon > 0 and ammo > 0 then
							if #curWeaponsForSave <= 40 then
								curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
							end
						end
					end
				end
				if #curWeaponsForSave > 1 then
					mysql_la_query( "INSERT INTO logout (Position, Waffen, Name) VALUES ('false', '"..curWeaponsForSave.."', '"..pname.."')")
				end
			end
		end
		if quitReason ~= "Kicked" then
			if(doingbankrob[source] == true) then
				if(erbeutetbankrob[source]) then
					doingbankrob[source] = false
					local geld = erbeutetbankrob[source]
					local money = laGetElementData(source, "money")
					laSetElementData(source, "money", money-geld)
					if laGetElementData ( source, "money" ) < 0 then
						laSetElementData ( source, "money", 0 )
					end
					local name = "Server"
					local time = 12
					outputChatBox("Spieler "..pname.." wurde vom "..name.." für "..time.." Stunden gebannt! (Grund: Disconnecten beim Bankrob)", getRootElement(), 255, 0, 0)
					timebanPlayer( pname, time, name, "Disconnecten beim Bankrob")
				end
			elseif (laGetElementData ( source, "isinRob") == true) then
				local geld = 20000
				local money = laGetElementData(source, "money")
				laSetElementData(source, "money", money-geld)
				if laGetElementData ( source, "money" ) < 0 then
					laSetElementData ( source, "money", 0 )
				end
				local name = "Server"
				local time = 12
				outputChatBox("Spieler "..pname.." wurde vom "..name.." für "..time.." Stunden gebannt! (Grund: Disconnecten beim Casinoraub)", getRootElement(), 255, 0, 0)
				timebanPlayer( pname, time, name, "Disconnecten beim Casinoraub")
			end
		end
		if laGetElementData ( source, "callswith" ) then
			if laGetElementData ( source, "callswith" ) ~= "none" then
				local caller = getPlayerFromName ( laGetElementData ( source, "callswith" ) )
				if caller then
					laSetElementData ( caller, "callswith", "none" )
					laSetElementData ( caller, "call", false )
					laSetElementData ( caller, "calls", "none" )
					laSetElementData ( caller, "callswith", "none" )
					laSetElementData ( caller, "calledby", "none" )
					outputChatBox ( "Die Verbindung ist unterbrochen", caller, 125, 0, 0 )
				end
				laSetElementData ( source, "callswith", "none" )
				laSetElementData ( source, "call", false )
				laSetElementData ( source, "calls", "none" )
				laSetElementData ( source, "callswith", "none" )
				laSetElementData ( source, "calledby", "none" )
			end
		end
		MySQL_DelRow("loggedin", "Name LIKE '"..pname.."'")
		outputLog ( "[LOGOUT]: Spieler "..pname.." hat sich ausgeloggt, IP: "..getPlayerIP(source)..", Serial: "..getPlayerSerial(source).."", "login" )
		cancelDrivingSchoolServer ( pname )
		datasave_remote ( source )
		if laGetElementData ( source, "isInArea51Mission" ) then
			removeArea51Bots ( pname )
		end
		local veh = getPedOccupiedVehicle ( source )
		if veh then
			if getElementModel(veh) == 502 then
				destroyElement ( veh )
			end
		end
		killTimer ( _G[pname.."paydaytime"] )
		killTimer ( _G[pname.."newsnew"] )
		clearInv ( source )
		clearUserdata ( source )
		clearBonus ( source )
		clearAchiev ( source )
		clearPackage ( source )
		clearDataSettings ( source )
	end
end
addEventHandler ("onPlayerQuit", getRootElement(), datasave )

function elementDataSettings ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	laSetElementData ( player, "In_DMArena", 0 )
	laSetElementData ( player, "objectToPlace", false )
	laSetElementData ( player, "cheatingtrys", -1 )
	laSetElementData ( player, "growing", false )
	laSetElementData ( player, "isInRace", false )
	laSetElementData ( player, "callswithpolice", false )
	laSetElementData ( player, "isLive", false )
	laSetElementData ( player, "isInArea51Mission", false )
	laSetElementData ( player, "isInDrivingSchool", false )
	laSetElementData ( player, "armingBomb", false )
	laSetElementData ( player, "tied", true )
	laSetElementData ( player, "hasBomb", false )
	laSetElementData ( player, "wanzen", false )
	laSetElementData ( player, "isInHighNoon", false )
	ArmyPermissions = MySQL_GetString("userdata", "ArmyPermissions", "Name LIKE '" ..pname.."'")
	if not ArmyPermissions then
		for i = 1, 10 do
			laSetElementData ( player, "armyperm"..i, 0 )
		end
	else
		for i = 1, 8 do
			laSetElementData ( player, "armyperm"..i, tonumber ( gettok ( ArmyPermissions, i, string.byte( '|' ) ) ) )
		end
		laSetElementData ( player, "armyperm10", tonumber ( gettok ( ArmyPermissions, 10, string.byte( '|' ) ) ) )
		if tonumber ( gettok ( ArmyPermissions, 9, string.byte( '|' ) ) ) == 0 then
			laSetElementData ( player, "armyperm9", 0)
		else
			laSetElementData ( player, "gwd", tonumber ( gettok ( ArmyPermissions, 9, string.byte( '|' ) ) ) )
			laSetElementData ( player, "armyperm9", 0 )
		end
	end
	-- local result = mysql_query(handler, "INSERT INTO loggedin (Name) VALUES ('"..pname.."')")
	local result = dbQuery(handler, "INSERT INTO loggedin (Name) VALUES ('"..pname.."')")
	if( not result) then
		outputDebugString("Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		outputLog ( "[ELEMENTDATA]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- mysql_free_result(result)
		dbFree(result)
	end
	saveArmyPermissions(player)
end

function saveArmyPermissions ( player )

	local pname = MySQL_Save(getPlayerName ( player ))
	local empty = ""
	for i = 1, 8 do
		if (laGetElementData ( player, "armyperm"..i) == 1) or (laGetElementData ( player, "armyperm"..i) == 0) then
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm"..i ) )
		else
			laSetElementData ( player, "armyperm"..i, 0)
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm"..i ) )
		end
	end
		if (laGetElementData ( player, "armyperm9") == 9) or (laGetElementData ( player, "armyperm9") == 0) then
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm9" ) )
		else
			laSetElementData ( player, "armyperm9", 0)
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm9" ) )
		end
		if (laGetElementData ( player, "armyperm10") == 1) or (laGetElementData ( player, "armyperm10") == 0) then
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm10" ) )
		else
			laSetElementData ( player, "armyperm10", 0)
			empty = empty.."|"..MySQL_Save ( laGetElementData ( player, "armyperm10" ) )
		end
	empty = empty.."|"
	MySQL_SetString("userdata", "ArmyPermissions", empty, "Name LIKE '"..pname.."'")
	local gwd = laGetElementData ( player, "gwd")
	MySQL_SetString("userdata", "GWD", gwd, "Name LIKE '"..pname.."'")
end

function SaveCarData ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	MySQL_SetString("userdata", "Geld", MySQL_Save ( MySQL_Save ( laGetElementData ( player, "money" )) ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "CurrentCars", MySQL_Save ( MySQL_Save ( laGetElementData ( player, "curcars" )) ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "Maximumcars", MySQL_Save ( MySQL_Save ( laGetElementData ( player, "maxcars" )) ), "Name LIKE '"..pname.."'")
end

function datasave_remote ( player )
	
	local source = player
	if tonumber ( MySQL_Save ( laGetElementData ( source, "loggedin" ))) == 1 then
		local pname = getPlayerName ( source )
		local fields = "SET"
		fields = fields.." Geld = '"..math.abs ( math.floor ( laGetElementData ( source, "money" ) ) ).."'"
		fields = fields..", Punkte = '"..math.floor ( getElementData ( source, "points" ) ).."'"
		fields = fields..", Fraktion = '"..math.abs ( math.floor ( laGetElementData ( source, "fraktion") ) ).."'"
		fields = fields..", FraktionsRang = '"..math.floor ( laGetElementData ( source, "rang" ) ).."'"
		fields = fields..", Spielzeit = '"..math.floor ( laGetElementData ( source, "playingtime" ) ).."'"
		fields = fields..", CurrentCars = '"..math.floor ( laGetElementData ( source, "curcars" ) ).."'"
		fields = fields..", Maximumcars = '"..math.floor ( laGetElementData ( source, "maxcars" ) ).."'"
		fields = fields..", Tode = '"..math.floor ( laGetElementData ( source, "deaths" ) ).."'"
		fields = fields..", Kills = '"..math.floor ( laGetElementData ( source, "kills" ) ).."'"
		fields = fields..", Knastzeit = '"..math.floor ( laGetElementData ( source, "jailtime" ) ).."'"
		fields = fields..", Himmelszeit = '"..math.floor ( laGetElementData ( source, "heaventime" ) ).."'"
		fields = fields..", Hausschluessel = '"..math.floor ( laGetElementData ( source, "housekey" ) ).."'"
		fields = fields..", Bankgeld = '"..math.floor ( laGetElementData ( source, "bankmoney" ) ).."'"
		--fields = fields..", Drogen = '"..math.floor ( laGetElementData ( source, "drugs" ) ).."'"
		fields = fields..", Skinid = '"..math.floor ( laGetElementData ( source, "skinid" ) ).."'"
		fields = fields..", StvoPunkte = '"..math.floor ( laGetElementData ( source, "stvo" ) ).."'"
		fields = fields..", Boni = '"..math.floor ( laGetElementData ( source, "boni" ) ).."'"
		fields = fields..", IncomePayday = '"..math.floor ( laGetElementData ( source, "incomepayday" ) ).."'"
		fields = fields..", PdayIncome = '"..math.floor ( laGetElementData ( source, "pdayincome" ) ).."'"
		fields = fields..", PdayKosten = '"..math.floor ( laGetElementData ( source, "pdaykosten" ) ).."'"
		fields = fields..", Warns = '"..math.floor ( laGetElementData ( source, "warns" ) ).."'"
		fields = fields..", Gunbox1 = '"..laGetElementData ( source, "gunboxa" ).."'"
		fields = fields..", Gunbox2 = '"..laGetElementData ( source, "gunboxb" ).."'"
		fields = fields..", Gunbox3 = '"..laGetElementData ( source, "gunboxc" ).."'"
		fields = fields..", Gunbox4 = '"..laGetElementData ( source, "gunboxd" ).."'"
		fields = fields..", Gunbox5 = '"..laGetElementData ( source, "gunboxe" ).."'"
		fields = fields..", Gunbox6 = '"..laGetElementData ( source, "gunboxf" ).."'"
		fields = fields..", Job = '"..laGetElementData ( source, "job" ).."'"
		fields = fields..", Jobtime = '"..math.floor ( laGetElementData ( source, "jobtime" ) ).."'"
		fields = fields..", Club = '"..laGetElementData ( source, "club" ).."'"
		fields = fields..", FavRadio = '"..math.floor ( laGetElementData ( source, "favchannel" ) ).."'"
		fields = fields..", Bonuspunkte = '"..math.floor ( laGetElementData ( source, "bonuspoints" ) ).."'"
		fields = fields..", hunger = '"..math.floor ( getElementData ( source, "hunger" ) ).."'"
		fields = fields..", urin = '"..math.floor ( getElementData ( source, "urin" ) ).."'"
		fields = fields..", schlaf = '"..math.floor ( getElementData ( source, "schlaf" ) ).."'"
		fields = fields..", Sprache = '"..getElementData ( source, "sprache" ).."'"
		--SICHERHEITSHINWEIS--
		fields = fields..", Truckerskill = '"..math.floor ( laGetElementData ( source, "truckerlvl" ) ).."'"
		fields = fields..", AirportLevel = '"..math.floor ( laGetElementData ( source, "airportlvl" ) ).."'"
		--SICHERHEITSHINWEIS--
		fields = fields..", Contract = '"..math.floor ( laGetElementData ( source, "contract" ) ).."'"
		fields = fields..", SocialState = '"..MySQL_Save ( getElementData ( source, "socialState") ).."'"
		--SICHERHEITSHINWEIS--
		fields = fields..", StreetCleanPoints = '"..math.floor ( getElementData ( source, "streetCleanPoints" ) ).."'"
		--SICHERHEITSHINWEIS--
		fields = fields..", werber = '"..laGetElementData ( source, "werber" ).."'"
		fields = fields..", Permission = '"..laGetElementData ( source, "permission" ).."'"
		fields = fields..", Wanteds = '"..laGetElementData ( source, "wanteds" ).."'"
		local v1 = "|"..laGetElementData ( source, "handyType" ).."|"
		local v2 = laGetElementData ( source, "handyCosts" ).."|"
		local v3 = v1..v2
		fields = fields..", Handy = '"..v3.."'"
		mysql_la_query ( "UPDATE userdata "..fields.." WHERE Name LIKE '"..pname.."'" )
		
		saveAddictionsForPlayer ( source )
		packageSave(source)
		achievsave(source)
		inventorysave(source)
		bonusSave(source)
		jobsave(player)
		skillDataSave ( player )
		saveArmyPermissions ( player )
		--noobsave(source)
		--outputDebugString ("Daten fuer Spieler "..pname.." wurden gesichert!")
		--outputLog ( "[DATASAVE]: Daten fuer Spieler "..pname.." wurden gesichert!" , "save" )
	end
end

--[[function noobsave ( player)
	local source = player
	if tonumber ( MySQL_Save ( laGetElementData ( source, "loggedin" ))) == 1 then
		local pname = getPlayerName ( source )
		local fields = "SET"
		fields = fields..", Wanteds = '"..math.floor ( laGetElementData ( source, "wanteds" ) ).."'"
		mysql_la_query ( "UPDATE userdata "..fields.." WHERE Name LIKE '"..pname.."'" )
	end
end]]--

function achievsave ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	MySQL_SetString("achievments", "Waffenschieber", MySQL_Save ( laGetElementData ( player, "gunloads") ), "Name LIKE '"..pname.."'")
	MySQL_SetString("achievments", "Fahrzeugwahn", MySQL_Save ( laGetElementData ( player, "carwahn_achiev") ), "Name LIKE '"..pname.."'")
end

function achievload ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	local dsatz
	-- local result = mysql_query ( handler, "SELECT * from achievments WHERE Name LIKE '"..pname.."'" )
	local result = dbQuery ( handler, "SELECT * from achievments WHERE Name LIKE '"..pname.."'" )
	if result then
		local re, num_rows = dbPoll(result, -1)
		-- if ( mysql_num_rows ( result ) > 0 ) then
        if re and num_rows > 0 then
			-- dsatz = mysql_fetch_assoc ( result )
			dsatz = re[1]
			-- mysql_free_result ( result )
			dbFree ( result )
		end
	end
	laSetElementData ( player, "schlaflosinsa", dsatz["SchlaflosInSA"] )
	laSetElementData ( player, "gunloads", dsatz["Waffenschieber"] )
	laSetElementData ( player, "angler_achiev", dsatz["Angler"] )
	laSetElementData ( player, "licenses_achiev", dsatz["Lizensen"] )
	laSetElementData ( player, "carwahn_achiev", dsatz["Fahrzeugwahn"] )
	laSetElementData ( player, "collectr_achiev", dsatz["DerSammler"] )
	laSetElementData ( player, "rl_achiev", dsatz["ReallifeWTF"] )
	laSetElementData ( player, "own_foots", dsatz["EigeneFuesse"] )
	laSetElementData ( player, "kingofthehill_achiev", dsatz["KingOfTheHill"] )
	laSetElementData ( player, "thetruthisoutthere_achiev", dsatz["TheTruthIsOutThere"] )
	laSetElementData ( player, "silentassasin_achiev", dsatz["SilentAssasin"] )
	laSetElementData ( player, "highwaytohell_achiev", dsatz["HighwayToHell"] )
	
	laSetElementData ( player, "revolverheld_achiev", tonumber ( dsatz["Revolverheld"] ) )
	laSetElementData ( player, "chickendinner_achiev", tonumber ( dsatz["ChickenDinner"] ) )
	laSetElementData ( player, "nichtsgehtmehr_achiev", tonumber ( dsatz["NichtsGehtMehr"] ) )
	
	local dstring = dsatz["LookoutsA"]
	triggerClientEvent ( player, "hideLookoutMarkers", getRootElement(), dstring )
	local count = 0
	for i = 1, 10 do
		if tonumber ( gettok ( dstring, i, string.byte ( '|' ) ) ) == 1 then
			count = count + 1
		end
	end
	laSetElementData ( player, "viewpoints", count )
	dsatz = nil
	--[[
	laSetElementData ( player, "schlaflosinsa", MySQL_GetString("achievments", "SchlaflosInSA", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "gunloads", MySQL_GetString("achievments", "Waffenschieber", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "angler_achiev", MySQL_GetString("achievments", "Angler", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "licenses_achiev", MySQL_GetString("achievments", "Lizensen", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "carwahn_achiev", MySQL_GetString("achievments", "Fahrzeugwahn", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "collectr_achiev", MySQL_GetString("achievments", "DerSammler", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "rl_achiev", MySQL_GetString("achievments", "ReallifeWTF", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "own_foots", MySQL_GetString("achievments", "EigeneFuesse", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "kingofthehill_achiev", MySQL_GetString("achievments", "KingOfTheHill", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "thetruthisoutthere_achiev", MySQL_GetString("achievments", "TheTruthIsOutThere", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "silentassasin_achiev", MySQL_GetString("achievments", "SilentAssasin", "Name LIKE '" ..pname.."'") )
	laSetElementData ( player, "highwaytohell_achiev", MySQL_GetString("achievments", "HighwayToHell", "Name LIKE '" ..pname.."'") )
	
	laSetElementData ( player, "revolverheld_achiev", tonumber ( MySQL_GetString("achievments", "Revolverheld", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "chickendinner_achiev", tonumber ( MySQL_GetString("achievments", "ChickenDinner", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "nichtsgehtmehr_achiev", tonumber ( MySQL_GetString("achievments", "NichtGehtMehr", "Name LIKE '" ..pname.."'") ) )
	]]
end

function inventorysave ( player )

	local pname = getPlayerName ( player )
	--[[MySQL_SetString("inventar", "Blumensamen", MySQL_Save ( laGetElementData ( player, "flowerseeds") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Essensslot1", MySQL_Save ( laGetElementData ( player, "food1") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Essensslot2", MySQL_Save ( laGetElementData ( player, "food2") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Essensslot3", MySQL_Save ( laGetElementData ( player, "food3") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Zigaretten", MySQL_Save ( laGetElementData ( player, "zigaretten") ), "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Materials", MySQL_Save ( laGetElementData ( player, "mats") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Benzinkanister", MySQL_Save ( laGetElementData ( player, "benzinkannister") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "FruitNotebook", MySQL_Save ( laGetElementData ( player, "fruitNotebook" )) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Objekt", laGetElementData ( player, "object" ), "Name LIKE '" ..pname.."'" )
	MySQL_SetString("inventar", "Chips", laGetElementData ( player, "casinoChips" ), "Name LIKE '" ..pname.."'" )]]
	--[[MySQL_SetString("inventar", "Peilsender", MySQL_Save ( laGetElementData ( player, "peilsender")"Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Wuerfel", MySQL_Save ( laGetElementData ( player, "dice") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Palmensamen", MySQL_Save ( laGetElementData ( player, "palmseeds") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Telefonbuch", MySQL_Save ( laGetElementData ( player, "phonebook") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Lottoschein", MySQL_Save ( laGetElementData ( player, "lottozahlen") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Waffenslot1", MySQL_Save ( laGetElementData ( player, "guninv1") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Waffenslot2", MySQL_Save ( laGetElementData ( player, "guninv2") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Waffenslot3", MySQL_Save ( laGetElementData ( player, "guninv3") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Waffenslot4", MySQL_Save ( laGetElementData ( player, "guninv4") ) , "Name LIKE '"..pname.."'")
	MySQL_SetString("inventar", "Waffenslot5", MySQL_Save ( laGetElementData ( player, "guninv5") ) , "Name LIKE '"..pname.."'")]]

	local fields = "SET"
	fields = fields.." Blumensamen = '"..laGetElementData ( player, "flowerseeds" ).."'"
	fields = fields..", Premiumsamen = '"..laGetElementData ( player, "premiumseeds" ).."'"
	fields = fields..", Essensslot1 = '"..laGetElementData ( player, "food1" ).."'"
	fields = fields..", Essensslot2 = '"..laGetElementData ( player, "food2" ).."'"
	fields = fields..", Essensslot3 = '"..laGetElementData ( player, "food3" ).."'"
	fields = fields..", Zigaretten = '"..laGetElementData ( player, "zigaretten" ).."'"
	fields = fields..", Materials = '"..laGetElementData ( player, "mats" ).."'"
	fields = fields..", Weed = '"..laGetElementData ( player, "weed" ).."'"
	fields = fields..", Kokain = '"..laGetElementData ( player, "koks" ).."'"
	fields = fields..", Benzinkanister = '"..laGetElementData ( player, "benzinkannister" ).."'"
	fields = fields..", FruitNotebook = '"..laGetElementData ( player, "fruitNotebook" ).."'"
	fields = fields..", Objekt = '"..laGetElementData ( player, "object" ).."'"
	fields = fields..", Chips = '"..laGetElementData ( player, "casinoChips" ).."'"
	fields = fields..", Medikit = '"..laGetElementData ( player, "medikit" ).."'"
	mysql_la_query ( "UPDATE inventar "..fields.." WHERE Name LIKE '"..pname.."'" )
end

function inventoryload ( player )

	local pname = getPlayerName ( player )
	laSetElementData ( player, "playerid", tonumber ( MySQL_GetString("players", "id", "Name LIKE '" ..pname.."'")) )
	
	local dsatz
	-- local result = mysql_query ( handler, "SELECT * from inventar WHERE Name LIKE '"..pname.."'" )
	local result = dbQuery ( handler, "SELECT * from inventar WHERE Name LIKE '"..pname.."'" )
	if result then
		local re, num_rows = dbPoll(result, -1)
		-- if ( mysql_num_rows ( result ) > 0 ) then
        if re and num_rows > 0 then
			-- dsatz = mysql_fetch_assoc ( result )
			dsatz = re[1]
			-- mysql_free_result ( result )
			dbFree(result)
		end
	end
	
	laSetElementData ( player, "dice", tonumber ( dsatz["Wuerfel"] ) )
	laSetElementData ( player, "flowerseeds", tonumber ( dsatz["Blumensamen"] ) )
	laSetElementData ( player, "premiumseeds", tonumber ( dsatz["Premiumsamen"] ) )
	laSetElementData ( player, "food1", tonumber ( dsatz["Essensslot1"] ) )
	laSetElementData ( player, "food2", tonumber ( dsatz["Essensslot2"] ) )
	laSetElementData ( player, "food3", tonumber ( dsatz["Essensslot3"] ) )
	laSetElementData ( player, "zigaretten", tonumber ( dsatz["Zigaretten"] ) )
	laSetElementData ( player, "mats", tonumber ( dsatz["Materials"] ) )
	laSetElementData ( player, "weed", tonumber ( dsatz["Weed"] ) )
	laSetElementData ( player, "koks", tonumber ( dsatz["Kokain"] ) )
	laSetElementData ( player, "benzinkannister", tonumber ( dsatz["Benzinkanister"] ) )
	laSetElementData ( player, "fruitNotebook", tonumber ( dsatz["FruitNotebook"] ) )
	laSetElementData ( player, "casinoChips", tonumber ( dsatz["Chips"] ) )
	laSetElementData ( player, "gameboy", tonumber ( dsatz["Gameboy"] ) )
	laSetElementData ( player, "medikit", tonumber ( dsatz["Medikit"] ) )
	
	dsatz = nil
	--[[
	laSetElementData ( player, "dice", tonumber ( MySQL_GetString("inventar", "Wuerfel", "Name LIKE '" ..pname.."'")) )
	laSetElementData ( player, "flowerseeds", tonumber ( MySQL_GetString("inventar", "Blumensamen", "Name LIKE '" ..pname.."'")) )
	laSetElementData ( player, "food1", tonumber ( MySQL_GetString("inventar", "Essensslot1", "Name LIKE '" ..pname.."'")) )
	laSetElementData ( player, "food2", tonumber ( MySQL_GetString("inventar", "Essensslot2", "Name LIKE '" ..pname.."'")) )
	laSetElementData ( player, "food3", tonumber ( MySQL_GetString("inventar", "Essensslot3", "Name LIKE '" ..pname.."'")) )
	laSetElementData ( player, "zigaretten", tonumber ( MySQL_GetString("inventar", "Zigaretten", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "mats", tonumber ( MySQL_GetString("inventar", "Materials", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "benzinkannister", tonumber ( MySQL_GetString("inventar", "Benzinkanister", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "fruitNotebook", tonumber ( MySQL_GetString("inventar", "FruitNotebook", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "casinoChips", tonumber ( MySQL_GetString( "inventar", "Chips", "Name LIKE '" ..pname.."'") ) )
	laSetElementData ( player, "gameboy", tonumber ( MySQL_GetString ( "inventar", "Gameboy", "Name LIKE '"..pname.."'" ) ) )
	]]
end


function jobsave ( player )
	local pname = getPlayerName ( player )
	MySQL_SetString ( "jobdata", "Bus", laGetElementData ( player, "buslevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Drogendealer", laGetElementData ( player, "drogendealerlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Farmer", laGetElementData ( player, "farmerlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Fischer", laGetElementData ( player, "fischerlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Flughafen", laGetElementData ( player, "flughafenlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Gabelstapler", laGetElementData ( player, "gabelstaplerlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Hotdog", laGetElementData ( player, "hotdoglevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Lieferant", laGetElementData ( player, "lieferantlevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Strassenreinigung", laGetElementData ( player, "strassenreinigunglevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Taxi", laGetElementData ( player, "taxilevel" ), "Name LIKE '"..pname.."'" )
	MySQL_SetString ( "jobdata", "Trucker", laGetElementData ( player, "truckerlevel" ), "Name LIKE '"..pname.."'" )	
	--outputDebugString ("Jobs fuer Spieler "..pname.." wurden gesichert!")
	--outputLog ( "[JOBDATA]: Jobs fuer Spieler "..pname.." wurden gesichert!" , "save" )
end


function jobload ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	local dsatz
	-- local result = mysql_query ( handler, "SELECT * from jobdata WHERE Name LIKE '"..pname.."'" )
	local result = dbQuery ( handler, "SELECT * from jobdata WHERE Name LIKE '"..pname.."'" )
	if MySQL_DatasetExist ( "jobdata", "Name LIKE '"..pname.."'" ) then
		local re, num_rows = dbPoll(result, -1)
		-- if ( mysql_num_rows ( result ) > 0 ) then
		if re and num_rows > 0 then
			-- dsatz = mysql_fetch_assoc ( result )
			dsatz = re[1]
			-- mysql_free_result ( result )
			dbFree ( result )
			laSetElementData ( player, "buslevel", tonumber(dsatz["Bus"]) )
			laSetElementData ( player, "drogendealerlevel", tonumber(dsatz["Drogendealer"]) )
			laSetElementData ( player, "farmerlevel", tonumber(dsatz["Farmer"]) )
			laSetElementData ( player, "fischerlevel", tonumber(dsatz["Fischer"]) )
			laSetElementData ( player, "flughafenlevel", tonumber(dsatz["Flughafen"]) )
			laSetElementData ( player, "gabelstaplerlevel", tonumber(dsatz["Gabelstapler"]) )
			laSetElementData ( player, "hotdoglevel", tonumber(dsatz["Hotdog"]) )
			laSetElementData ( player, "lieferantlevel", tonumber(dsatz["Lieferant"]) )
			laSetElementData ( player, "strassenreinigunglevel", tonumber(dsatz["Strassenreinigung"]) )
			laSetElementData ( player, "taxilevel", tonumber(dsatz["Taxi"]) )
			laSetElementData ( player, "truckerlevel", tonumber(dsatz["Trucker"]) )
			dsatz = nil
			--outputDebugString ("Jobs fuer Spieler "..pname.." wurden geladen!")	
			outputLog ( "[JOBDATA]: Jobs fuer Spieler "..pname.." wurden geladen!" , "save" )		
		end
	else
		-- local result = mysql_query(handler, "INSERT INTO jobdata (Name, Bus, Drogendealer, Farmer, Fischer, Flughafen, Gabelstapler, Hotdog, Lieferant, Strassenreinigung, Taxi, Trucker) VALUES ('"..pname.."','1','1','1','1','1','1','1','1','1','1','1' )")
		local result = dbQuery(handler, "INSERT INTO jobdata (Name, Bus, Drogendealer, Farmer, Fischer, Flughafen, Gabelstapler, Hotdog, Lieferant, Strassenreinigung, Taxi, Trucker) VALUES ('"..pname.."','1','1','1','1','1','1','1','1','1','1','1' )")
		if( not result) then
			outputDebugString("Error executing the query Jobload: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
			outputLog ( "[JOBDATA]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
		else
			-- mysql_free_result(result)
			dbFree(result)
			laSetElementData ( player, "buslevel", 1 )
			laSetElementData ( player, "drogendealerlevel", 1 )
			laSetElementData ( player, "farmerlevel", 1 )
			laSetElementData ( player, "fischerlevel", 1 )
			laSetElementData ( player, "flughafenlevel", 1 )
			laSetElementData ( player, "gabelstaplerlevel", 1 )
			laSetElementData ( player, "hotdoglevel", 1 )
			laSetElementData ( player, "lieferantlevel", 1 )
			laSetElementData ( player, "strassenreinigunglevel", 1 )
			laSetElementData ( player, "taxilevel", 1 )
			laSetElementData ( player, "truckerlevel", 1 )
			dsatz = nil
			--outputDebugString ("Jobs fuer Spieler "..pname.." wurden erstellt!")
			outputLog ( "[JOBDATA]: Jobs fuer Spieler "..pname.." wurden erstellt!" , "save" )		
		end
	end
end



-- Info: Angabe von Last_Login in Tagen seit Jahresanfang, Angabe von Geschlecht in 1 u. 0 - 1 = Weiblich, 0 = mnnlich
-- Anreise in 1 u. 0, 0 = Schiff, 1 = Flugzeug
-- Scheine: 0 = nicht vorhanden, 1 = vorhanden

function logoutPlayer_func ( x, y, z, int, dim, armor )

	if not laGetElementData ( source, "shootingRanchGun" ) then
		local pname = MySQL_Save ( getPlayerName ( source ) )
		local int = tonumber ( MySQL_Save ( int ) )
		local dim = tonumber ( MySQL_Save ( dim ) )
		local curWeaponsForSave = "|"
		for i = 1, 12 do
			if i ~= 10 and i ~= 12 then
				local weapon = getElementData ( source, "weaponInSlot"..i )
				local ammo = getElementData ( source, "weaponInSlot"..i.."Ammo" )
				if weapon > 0 and ammo > 0 then
					if #curWeaponsForSave <= 40 then
						curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
					end
				end
			end
		end
		local armor = tonumber(armor)
		curWeaponsForSave = MySQL_Save ( curWeaponsForSave )
		pos = "|"..(math.floor(x*100)/100).."|"..(math.floor(y*100)/100).."|"..(math.floor(z*100)/100).."|"..int.."|"..dim.."|"
		if #curWeaponsForSave < 5 then
			curWeaponsForSave = ""
		end
		local result = mysql_la_query( "INSERT INTO logout (Position, Waffen, Name, Weste) VALUES ('"..pos.."', '"..curWeaponsForSave.."', '"..pname.."', '"..armor.."')")
		outputLog ( "[/SAVE]: Spieler "..pname.." hat gesaved.", "save" )
		kickPlayer ( source, "Ausgeloggt." )
	else
		outputChatBox ( "Bugusing ist verboten.", source, 125, 0, 0 )
	end
end
addEvent ( "logoutPlayer", true )
addEventHandler ( "logoutPlayer", getRootElement(), logoutPlayer_func )

function werbery_func ( player, werber)

		if werber ~= nil then
			laSetElementData ( player, "werber", werber )
			outputChatBox ( "Erfolgreich eingetragen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast niemanden angegeben!", player, 125, 0, 0 )
		end
end
addEvent ( "werbery", true )
addEventHandler ( "werbery", getRootElement(), werbery_func )


function language_func ( player, sprache)

		if sprache ~= nil then
			setElementData ( player, "sprache", sprache )
			outputChatBox ( "Erfolgreich eingetragen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast keine Sprache ausgewählt!", player, 125, 0, 0 )
		end
end
addEvent ( "language", true )
addEventHandler ( "language", getRootElement(), language_func )

function casinoMoneySave ( player )

	if laGetElementData ( player, "loggedin" ) == 1 then
		local name = getPlayerName ( player )
		local chips = math.abs ( math.floor ( laGetElementData ( player, "casinoChips" ) ) )
		local money = math.floor ( laGetElementData ( player, "money" ) )
		local bankMoney = math.floor ( laGetElementData ( player, "bankmoney" ) )
		mysql_la_query ( "UPDATE inventar SET Chips = '"..chips.."' WHERE Name LIKE '"..name.."'" )
		mysql_la_query ( "UPDATE userdata SET Geld = '"..money.."' WHERE Name LIKE '"..name.."'" )
		mysql_la_query ( "UPDATE userdata SET Bankgeld = '"..bankMoney.."' WHERE Name LIKE '"..name.."'" )
	end
end

function getIDByName ( pname )
	return tonumber ( MySQL_GetString ( "players", "id", "Name LIKE '"..pname.."'" ) )
end