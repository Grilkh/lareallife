------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

--[[antiSpam = {} 
function antiChatSpam() 
	if isTimer(antiSpam[source]) then
		cancelEvent()  
		outputChatBox("Du wurdest gemutet! (10 Sekunden)",source,255,0,0)
		setPlayerMuted(source, true)
		setTimer ( autoUnmute, 10000, 1, source)
	else
		antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 500, 1, source) 
	end
end
addEventHandler("onPlayerChat", root, antiChatSpam)


function autoUnmute ( player )
	if ( isElement ( player ) and isPlayerMuted ( player ) ) then
		setPlayerMuted ( player, false )
		outputChatBox ( "Du wurdest entmutet!", player, 125, 0, 0 )
	end
end]]


local commandSpam = {}
 
function preventCommandSpam( )

        if (not commandSpam[source]) then
                commandSpam[source] = 1
                -- Table erstellen
        elseif (commandSpam[source] == 10) then -- Wenn 10 Mal geschrieben wird in 1 Sekunde
                cancelEvent() -- Spam verhindern
                outputChatBox("Bitte kein Spam!", source, 255, 0, 0) -- Warnung
                commandSpam[source] = commandSpam[source] + 1
        elseif (commandSpam[source] == 20) then -- Wenn mehr als 20 Mal in der Sekunde geschrieben wird
                local banningBot = "Antispam"
                local reason = "Spam"
                local seconds = 1800
				--bannedPlayer = getPlayerFromName(source)
                cancelEvent() -- Spam verhindern
                --kickPlayer ( source, Antispambot, reason ) -- Kicken
                --outputChatBox("Spieler "..source.." wurde vom Antispambot wegen Spam gekickt!", getRootElement(), 255, 0, 0) -- öffentliche Meldung
                --banPlayer ( source, Antispambot, reason, seconds )
				spammingnoob = getPlayerName(source)
				if spammingnoob ~= "[LA]Leyynen" then
					--outputChatBox("Spieler "..getPlayerName(source).." wurde vom Antispambot wegen Spam für 30 Minuten gebannt!", getRootElement(), 255, 0, 0) -- öffentliche Meldung
					--banPlayer ( source, true, false, false, banningBot, reason, seconds )
					outputChatBox("Spieler "..getPlayerName(source).." wurde vom Antispambot wegen Spam gekickt!", getRootElement(), 255, 0, 0) -- öffentliche Meldung
					kickPlayer ( source, "Spam" )
				else
					outputChatBox("Auch wenn du ein Teammitglied bist, hör auf mit der Scheisse!", source, 255, 0, 0)
				end
        else
                commandSpam[source] = commandSpam[source] + 1 -- Die Table + 1 bei einem neuen Command
        end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)
setTimer(function() commandSpam = {} end, 1000, 0) -- Jede Sekunde leeren
 