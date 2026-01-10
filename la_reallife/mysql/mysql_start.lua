gMysqlHost = "127.0.0.1"
gMysqlUser = "USERNAME_HERE"
gMysqlPass = "PASSWORD_HERE"
gMysqlDatabase1 = "lareallife"
gMysqlDatabase2 = "lareallife"

function MySQL_Startup()
	-- handler = mysql_connect(gMysqlHost, gMysqlUser, gMysqlPass, gMysqlDatabase1)
	handler = dbConnect("mysql", "dbname="..gMysqlDatabase1..";host="..gMysqlHost, gMysqlUser, gMysqlPass)
	if( not handler) then
		outputDebugString("Couldn't run query: Unable to connect to the MySQL server - used DB1!")
		outputDebugString("Please shutdown the server and start the MySQL server!")
	end	
	-- handler_old = mysql_connect(gMysqlHost, gMysqlUser, gMysqlPass, gMysqlDatabase2)
	handler_old = dbConnect("mysql", "dbname="..gMysqlDatabase1..";host="..gMysqlHost, gMysqlUser, gMysqlPass)
	if( not handler_old) then
		outputDebugString("Couldn't run query: Unable to connect to the MySQL server - used DB2!")
		outputDebugString("Please shutdown the server and start the MySQL server!")
	end	
end
MySQL_Startup()

function MySQL_End()
	-- mysql_close(handler)
	if ( handler ) then
		destroyElement(handler)
	elseif ( handler_old ) then
		destroyElement(handler_old)
	end
end

function MySQL_GetVar(tablename, feldname, bedingung)
	-- local result = mysql_query(handler, "SELECT "..feldname.." from "..tablename.." WHERE "..bedingung)
	local result = dbQuery(handler, "SELECT "..feldname.." from "..tablename.." WHERE "..bedingung)
	if( not result) then
		outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		outputLog ( "[GetVar]: Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- if(mysql_num_rows(result) > 0) then
		-- 	local dsatz = mysql_fetch_assoc(result)
		-- 	local savename = feldname
		-- 	mysql_free_result(result)
		-- 	return tonumber(dsatz[feldname])
		-- else
		-- 	mysql_free_result(result)
		-- 	return false
		-- end

		local re, num_rows = dbPoll(result, -1)
		if re and num_rows > 0 then
			-- outputDebugString("In Function MySQL_GetVar " .. tostring(num_rows) .. " - " .. tostring(re) .. " - ".. tostring(re[1][feldname]))
			local savename = feldname
            dbFree(result)
            return tonumber(re[1][feldname])
        else
            dbFree(result)
            return false
        end
	end
end

function MySQL_GetString(tablename, feldname, bedingung)
	-- local result = mysql_query(handler, "SELECT "..feldname.." from "..tablename.." WHERE "..bedingung)
	local result = dbQuery(handler, "SELECT "..feldname.." from "..tablename.." WHERE "..bedingung)
	if( not result) then
		 outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		 outputLog ( "[GetString]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- if(mysql_num_rows(result) > 0) then
		-- 	local dsatz = mysql_fetch_assoc(result)
		-- 	local savename = feldname
		-- 	mysql_free_result(result)
		-- 	return dsatz[feldname]
		-- else
		-- 	mysql_free_result(result)
		-- 	return false
		-- end
		local re, num_rows = dbPoll(result, -1)
        if re and num_rows > 0 then
			-- outputDebugString("In Function MySQL_GetString " .. tostring(num_rows) .. " - " .. tostring(re) .. " - ".. tostring(re[1][feldname]))
			local savename = feldname
            dbFree(result)
            return re[1][feldname]
        else
            dbFree(result)
            return false
        end
	end
end

function MySQL_SetVar(tablename, feldname, var, bedingung)
	if var then
		-- local result = mysql_query(handler, "UPDATE "..tablename.." SET "..feldname.." = "..var.." WHERE "..bedingung)
		local result = dbQuery(handler, "UPDATE "..tablename.." SET "..feldname.." = "..var.." WHERE "..bedingung)
		if( not result) then
			 outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
			 outputLog ( "[SetVar]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
		else
			-- mysql_free_result(result)
			dbFree(result)
			return false
		end
	end
end

function MySQL_DelRow(tablename, bedingung)
	-- local result = mysql_query(handler, "DELETE FROM "..tablename.." WHERE "..bedingung)
	local result = dbQuery(handler, "DELETE FROM "..tablename.." WHERE "..bedingung)
	if( not result) then
		 outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		 outputLog ( "[DelRow]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- mysql_free_result(result)
		dbFree(result)
		return false
	end
	outputDebugString ("geloescht?!")
end

function MySQL_SetString(tablename, feldname, var, bedingung)
	if var and bedingung then
		-- local result = mysql_query(handler, "UPDATE "..tablename.." SET "..feldname.." = '"..var.."' WHERE "..bedingung)
		local result = dbQuery(handler, "UPDATE "..tablename.." SET "..feldname.." = '"..var.."' WHERE "..bedingung)
		if( not result) then
			outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
			outputLog ( "[SetString]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
		else
			-- mysql_free_result(result)
			dbFree(result)
			return false
		end
	end
end

function MySQL_DatasetExist(tablename, bedingung)
	-- local result = mysql_query(handler, "SELECT * from "..tablename.." WHERE "..bedingung)
	local result = dbQuery(handler, "SELECT * from "..tablename.." WHERE "..bedingung)
	if( not result) then
		 outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		 outputLog ( "[DatasetExist]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- if(mysql_num_rows(result) > 0) then
		-- 	mysql_free_result(result)
		-- 	return true
		-- else
		-- 	mysql_free_result(result)
		-- 	return false
		-- end

		local re, num_rows = dbPoll(result, -1)
        if re and num_rows > 0 then
			local savename = feldname
            dbFree(result)
            return true
        else
            dbFree(result)
            return false
        end
	end
end

function MySQL_Save ( string )
	
	-- if string then
	-- 	return mysql_escape_string ( handler, string )
	-- end
	if string then
		return dbPrepareString ( handler, string )
	end
end

--[[function GSave ( string ) 
if(not(string) or  type(string)~="string")then
		outputDebugString("ErrorHelp save_message: "..debug.traceback())
end
return mysql_escape_string ( handler, string ) 


end
]]
function mysql_la_query ( query )

	if stringSaveFind(query, "Adminlevel") then
		outputDebugString ( "Query: "..query)
	end
	-- local result = mysql_query ( handler, query )
	local result = dbQuery ( handler, query )
	local oldres = result
	if not result then
		outputDebugString ( "Error: Invalid Query: "..tostring ( query ) )
		outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		outputLog ( "[LaQuery]: Error executing the query: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler), "mysql" )
	else
		-- mysql_free_result ( result )
		dbFree(result)
	end
	return oldres
end

function stringSaveFind ( arg1, arg2 )

	if arg1 and arg2 then
		return string.find ( arg1, arg2 )
	else
		return false
	end
end

--addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()),MySQL_Startup )
addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()),MySQL_End)

--[[
Ich verfasse hier ein Tutorial zu MySQL,
da es meiner Ansicht nach der beste Weg ist,
Datenstze zu verarbeiten.

Was ihr dazu braucht:
-Ein lauffhiges Script, an dem ihr ben knnt
-Das MySQL-Modul von Ryden
-Einen Apache Server (z.b. ber XAMPP), der auf eurem PC luft sowie
eine Benutzeroberflche, ich z.b. verwende PHP MyAdmin ( liegt bei XAMPP dabei )
-Grundliegende Kentnisse in Lua

Wozu MySQL?
MySQL empfiehlt sich, da es zum einen sehr schnell arbeitet und zum
anderen mit vielen weiteren Anwendungen und Sprachen kompatibel ist,
so knnte man z.b. einen Ingame-Account mit einem Forumsaccount verknpfen
oder auch ein Control Panel in PHP schreiben.

Vorbereitung:

Das MySQL-Modul muss heruntergeladen werden,
anschlieend packt ihr es in folgendes Verzeichnis:
[code]server\mods\deathmatch\modules[/code]
Und tragt folgendes in die .cfg ein:
[code]<module src="mta_mysql" />[/code]
Dabei ist zu beachten, dass das modul als letztes vor
den eigentlichen resourcen geladen werden sollte.

Funktionsweise:

MySQL speichert Daten im Tabellenformat, d.h. in z.b. folgende Struktur:

Datenbank: testDB

Tabelle Spieler:
[code]Name | Skin | Geld
Zipper | 75 | 500 $
Ryker | 175 | 400 $[/code]

Tabelle Fahrzeuge:
[code]
Modell | xPos | yPos | zPos
477 | 0 | 0 | 0
500 | 50 | 2000 | 0
[/code]



]]
