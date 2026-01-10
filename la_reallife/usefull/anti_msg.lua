------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local function togMsn(cmd)
if(cmd == "msg") then
cancelEvent()
outputChatBox("Die Msg Funktion ist deaktiviert. Bitte verwende /sms [NUMMER]",source,255,0,0)
end
end
addEventHandler("onPlayerCommand",getRootElement(),togMsn)