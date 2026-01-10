function checkForOldMails ()

	-- result = mysql_query(handler, "SELECT * FROM email")
	result = dbQuery(handler, "SELECT * FROM email")
	deletedMails = 0
	mails = 0

	if( not result) then
		outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
	else
		local re, num_rows = dbPoll(result, -1)
		-- if(mysql_num_rows(result) > 0) then
        if re and num_rows > 0 then
			-- mailData = mysql_fetch_assoc(result)
			mailData = re[1]
			mySQLMailCheck ()
		else
			-- mysql_free_result(result)
			dbFree(result)
			outputServerLog("Es wurden keine Mails gefunden")
		end
	end
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource() ), checkForOldMails )

function mySQLMailCheck ()

	mails = mails + 1

	if isMailingDateOld ( mailData["Yearday"], mailData["Year"] ) then
		MySQL_DelRow("email", "Empfaenger LIKE '"..mailData["Empfaenger"].."' AND Text LIKE '"..mailData["Text"].."'")
		deletedMails = deletedMails + 1
	end
	
	-- mailData = mysql_fetch_assoc(result)
	mailData = dbPoll(result, -1)
	if mailData then
		mySQLMailCheck ()
	else
		-- mysql_free_result(result)
		dbFree(result)
		outputServerLog("Es wurden "..mails.." E-Mails gefunden und "..deletedMails.." alte Mails geloescht.")
	end
end

function isMailingDateOld ( yd, y )

	local time = getRealTime()
	local year = time.year
	local yearday = time.yearday
	local tCurTime = time.year * 365 + time.yearday
	local tMailTime = y * 365 + y
	local tDiff = tCurTime - tMailTime
	if tDiff >= 10 then
		return true
	end
	return false
end

specMailAdresses = { ["admin@la-rl.com"]=true, ["admin@ltr.net"]=true, ["admin@bund.net"]=true,
["admin@triaden.de"]=true,
["admin@ltr.de"]=true,
["admin@sfpd.de"]=true,
["admin@mafia.de"]=true,
["admin@fbi.de"]=true,
["admin@army.de"]=true }

function sendMail_func ( text, betreff, to )

	local text = MySQL_Save ( text )
	local betreff = MySQL_Save ( betreff )
	local to = MySQL_Save ( to )
	if specMailAdresses [ string.lower ( to ) ] then
		exists = true
	else
		to = gettok ( to, 1, string.byte ( '@' ) )
		exists = MySQL_DatasetExist("players", "Name LIKE '"..to.."'")
	end
	if exists then
		local mail = MySQL_Save ( tostring ( getPlayerName(client).."@LA-RL.com|"..betreff.."|"..timestamp()..": "..text ) )
		--if mail == MySQL_Save ( mail ) then
			outputChatBox ( "E-Mail gesendet!", client, 0, 125, 0 )
			local time = getRealTime()
			local y = time.year
			local yd = time.yearday
			
			-- local result = mysql_query(handler, "INSERT INTO email (Empfaenger, Text, Yearday, Year) VALUES ('"..to.."', '"..mail.."', '"..yd.."', '"..y.."')")
			local result = dbQuery(handler, "INSERT INTO email (Empfaenger, Text, Yearday, Year) VALUES ('"..to.."', '"..mail.."', '"..yd.."', '"..y.."')")
			if( not result) then
				outputDebugString("Error executing the query: (" .. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
			else
				-- mysql_free_result(result)
				dbFree(result)
			end
			if isElement ( getPlayerFromName ( to ) ) and laGetElementData ( getPlayerFromName ( to ), "loggedin" ) == 1 then
				getMailsForClient_func ( to )
			end
		--else
		--	outputChatBox ( "Du verwendest einige ungeultige Zeichen in deiner E-Mail!", client, 125, 0, 0 )
		--end
	else
		outputChatBox ( "Ungültiger Name", client, 125, 0, 0 )
	end
end
addEvent ( "sendMail", true )
addEventHandler ( "sendMail", getRootElement(), sendMail_func )

function getMailsForClient_func ( pname )

	local adress = pname
	-- result = mysql_query(handler, "SELECT * FROM email WHERE Empfaenger LIKE '"..adress.."'")
	result = dbQuery(handler, "SELECT * FROM email WHERE Empfaenger LIKE '"..adress.."'")
	player = getPlayerFromName ( pname )
	-- if mysql_num_rows(result) > 0 then
	-- 	mailData = mysql_fetch_assoc(result)
	-- 	while mailData do
	-- 		triggerClientEvent ( player, "reciveMail", getRootElement(), mailData["Text"] )
	-- 		outputDebugString ( "Empfaenger LIKE "..adress.." AND Text LIKE "..mailData["Text"] )
	-- 		mailData = mysql_fetch_assoc(result)
	-- 	end
	-- 	mysql_free_result(result)
	-- end
	-- mysql_la_query ( "DELETE FROM email WHERE Empfaenger LIKE '"..pname.."'" )

	if result then
		local re, num_rows = dbPoll(result, -1)
		if re and num_rows > 0 then
			mailData = re
			for _, row in ipairs ( mailData ) do
				triggerClientEvent ( player, "reciveMail", getRootElement(), row["Text"] )
				outputDebugString ( "Empfaenger LIKE "..adress.." AND Text LIKE "..row["Text"] )
			end
			dbFree(result)
		end
		mysql_la_query ( "DELETE FROM email WHERE Empfaenger LIKE '"..pname.."'" )

	end
end