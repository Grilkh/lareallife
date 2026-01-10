db = dbConnect("mysql", "dbname=lareallife;host=127.0.0.1", "USERNAME_HERE", "PASSWORD_HERE")


function updateTicketsForClientFunc()
	if isSupporter(source) then
		local qh = dbQuery( db, "SELECT * FROM tickets ORDER BY id DESC")
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		if num_affected_rows > 0 then
			for result, row in pairs ( result ) do
				triggerClientEvent(source, "updateTickets", source, row["id"], row["owner"], row["title"], row["type"], row["state"])
			end
		end
	else
		local qh = dbQuery( db, "SELECT * FROM tickets WHERE owner = ? ORDER BY id DESC", getPlayerName(source))
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		if num_affected_rows > 0 then
			for result, row in pairs ( result ) do
				triggerClientEvent(source, "updateTickets", source, row["id"], row["owner"], row["title"], row["type"], row["state"])
			end
		end
	end
end
addEvent ( "updateTicketsForClient", true )
addEventHandler ( "updateTicketsForClient", getRootElement(), updateTicketsForClientFunc )

function insertTicketDataFunc(typ, title, text)
	local regtime = getRealTime()
	local year = regtime.year + 1900
	local month = regtime.month + 1
	local day = regtime.monthday
	local hour = regtime.hour
	local minute = regtime.minute
	local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
	local lastlogin = registerdatum
	local qh = dbQuery( db, "INSERT INTO tickets (`owner`, `title`, `text`, `type`, `state`, `date` ) VALUES (?,?,?,?,?,?);", getPlayerName(source), title, text, typ, "open", lastlogin)
	dbFree( qh )
	triggerClientEvent(source, "updateFromServerEvent", source)
	
	outputChatBox ("Du hast ein Ticket erfolgreich erstellt.", source, 200, 200, 0, true)
	
	local players = getElementsByType ( "player" )
	
		
	for theKey,thePlayer in ipairs(players) do
		if isSupporter(thePlayer) then
		  outputChatBox ("Ein neues Ticket wurde von "..getPlayerName(source).." erstellt.", thePlayer, 200, 2000, 0, true)
	   end
	end
end
addEvent ( "insertTicketData", true )
addEventHandler ( "insertTicketData", getRootElement(), insertTicketDataFunc )


function insertAntwortDataFunc(ticket_id, text)
	local qh = dbQuery( db, "SELECT * FROM tickets_antworten WHERE ticket_id ="..ticket_id.."")
	local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	local regtime = getRealTime()
	local year = regtime.year + 1900
	local month = regtime.month + 1
	local day = regtime.monthday
	local hour = regtime.hour
	local minute = regtime.minute
	local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
	local lastlogin = registerdatum
	local qh2 = dbQuery( db, "INSERT INTO tickets_antworten (`ticket_id`, `antwort_id`, `from`, `text`, `date`) VALUES (?,?,?,?,?);", ticket_id, num_affected_rows + 1, getPlayerName(source), text, lastlogin)
	dbFree( qh2 )
	
	if isSupporter(source) then
		local qh4 = dbQuery( db, "UPDATE  tickets SET  state =  'answered' WHERE  id = ?;", ticket_id)
		dbFree( qh4 )
	else
		local qh4 = dbQuery( db, "UPDATE  tickets SET  state =  'open' WHERE  id = ?;", ticket_id)
		dbFree( qh4 )
	end
	
	outputChatBox ("Du hast auf das Ticket #"..ticket_id.." erfolgreich geantwortet.", source, 200, 200, 0, true)
	
	local qh3 = dbQuery( db, "SELECT * FROM tickets WHERE id ="..ticket_id.."")
	local result3, num_affected_rows3, errmsg3 = dbPoll ( qh3, -1 )
	for result3, row in pairs ( result3 ) do
		if row["owner"] ~= getPlayerName(source) then
			if getPlayerFromName(row["owner"]) then
				outputChatBox("Auf dein Ticket #"..row["id"].." wurde von "..getPlayerName(source).." geantwortet.", getPlayerFromName(row["owner"]), 200, 200, 0, true)
			end
		end
	end
	
	local players = getElementsByType ( "player" )
	for theKey,thePlayer in ipairs(players) do
		if isSupporter(thePlayer) then
		  outputChatBox ("Auf das Ticket #"..ticket_id.." wurde eine Antwort von "..getPlayerName(source).." hinzugefügt.", thePlayer, 200, 200, 0, true)
	   end
	end
end
addEvent ( "insertAntwortData", true )
addEventHandler ( "insertAntwortData", getRootElement(), insertAntwortDataFunc )



function closeTicketFunc(id)
	local qh = dbQuery( db, "UPDATE  tickets SET  state =  'closed' WHERE  id = ?;", id)
	dbFree( qh )
	
	outputChatBox ("Du hast das Ticket #"..id.." erfolgreich geschlossen.", source, 200, 200, 0, true)
	local players = getElementsByType ( "player" )
	for theKey,thePlayer in ipairs(players) do
	   if isSupporter(thePlayer) then
		  --outputChatBox ("[Ticketsystem]: Das Ticket #"..id.." wurde von "..getPlayerName(source).." geschlossen.", thePlayer, 200, 200, 0, true)
	   end
	end
end
addEvent ( "closeTicket", true )
addEventHandler ( "closeTicket", getRootElement(), closeTicketFunc )


function getSelTicketDataFromServerFunc(id)
	local qh = dbQuery( db, "SELECT * FROM tickets WHERE id = ?", id)
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	 
	if num_affected_rows > 0 then
		for result, row in pairs ( result ) do
			triggerClientEvent(source, "updateSelTicket", source, id, row["type"], row["title"], row["text"], row["state"])
		end
	end
	
	local qh2 = dbQuery( db, "SELECT * FROM tickets_antworten WHERE ticket_id = ? ORDER BY antwort_id ASC", id)
		local result, num_affected_rows, errmsg = dbPoll ( qh2, -1 )
	 
	if num_affected_rows > 0 then
		for result, row in pairs ( result ) do
			triggerClientEvent(source, "updateSelTicketAntworten", source, row["antwort_id"], row["from"])
		end
	end
end

addEvent ( "getSelTicketDataFromServer", true )
addEventHandler ( "getSelTicketDataFromServer", getRootElement(), getSelTicketDataFromServerFunc )


function getCurAntwortFunc(ticket_id, antwort_id)
	local qh = dbQuery( db, "SELECT * FROM tickets_antworten WHERE ticket_id = ? AND antwort_id = ?", ticket_id, antwort_id)
	local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	
	if num_affected_rows > 0 then
		for result, row in pairs ( result ) do
			triggerClientEvent(source, "updateReadAntwort", source, row["from"], row["text"])
		end
	end
end
addEvent ( "getCurAntwort", true )
addEventHandler ( "getCurAntwort", getRootElement(), getCurAntwortFunc )
--[[
	Antworten erstellen
	User Permissions
	Screensize anpassen
	Überprüfen Serverseitig & Clientseitig ob User Admin ist ( SCHLIESSEN..)
]]--
