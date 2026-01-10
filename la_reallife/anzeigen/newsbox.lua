function news1 (player, time)
	outputChatBox ( "----------------------------------Los Angeles Reallife Informationen----------------------------------", player, 50, 0, 200 )
	outputChatBox ( "----------------Du kannst nur mit den Leuten in deiner Umgebung sprechen!----------------", player, 50, 100, 200 )
	outputChatBox ( "-------Verwende /werbung für Werbung, /s für schreien und /l für flüstern!-------", player, 50, 100, 200 )
	outputChatBox ( "--------------------------Fraktionsbeitritt nur mit Bewerbung im Forum!--------------------------", player, 50, 100, 200 )
	outputChatBox ( "---------Verwende die Funktion /show um die verschiedenen Läden anzuzeigen!--------", player, 50, 100, 200 )
	outputChatBox ( "----------------------Forum: forum.lareallife.de, Teamspeak3-IP: 62.141.36.139:8894-------------------", player, 50, 100, 200 )
	outputChatBox ( "-----------------------------Für Hilfe, verwende F1, /hilfe oder /kontakt!-----------------------------", player, 50, 100, 200 )
	setTimer ( news2, time, 1, player, time )
end
function news2 (player, time)
	outputChatBox ( "----------------------------------Los Angeles Reallife Informationen----------------------------------", player, 50, 0, 200 )
	outputChatBox ( "---------Verwende die Funktion /show um die verschiedenen Läden anzuzeigen!--------", player, 50, 100, 200 )
	outputChatBox ( "-------------Verwende /call 911, um ein Verbrechen bei der Polizei zu melden!------------", player, 50, 100, 200 )
	outputChatBox ( "--------------------------Fraktionsbeitritt nur mit Bewerbung im Forum!--------------------------", player, 50, 100, 200 )
	outputChatBox ( "---------------------------Dein Fahrzeug wurde abgeschleppt? /kontakt!--------------------------", player, 50, 100, 200 )
	outputChatBox ( "------------------------Für Spenden bei Leyynen im Teamspeak melden.------------------------", player, 50, 100, 200 )
	outputChatBox ( "----------------------Forum: forum.lareallife.de, Teamspeak3-IP: 62.141.36.139:8894-------------------", player, 50, 100, 200 )
	setTimer ( news3, time, 1, player, time )
end
function news3 (player, time)
	outputChatBox ( "----------------------------------Los Angeles Reallife Informationen----------------------------------", player, 50, 0, 200 )
	outputChatBox ( "---------------Nutze /save, um deinen Wiedereinstiegspunkt zu bestimmen!---------------", player, 50, 100, 200 )
	outputChatBox ( "---------Verwende die Funktion /show um die verschiedenen Läden anzuzeigen!--------", player, 50, 100, 200 )
	outputChatBox ( "------------------------Für Spenden bei Leyynen im Teamspeak melden.------------------------", player, 50, 100, 200 )
	outputChatBox ( "-------Verwende /werbung für Werbung, /s für schreien und /l für flüstern!-------", player, 50, 100, 200 )
	outputChatBox ( "----------------------Forum: forum.lareallife.de, Teamspeak3-IP: 62.141.36.139:8894-------------------", player, 50, 100, 200 )
	outputChatBox ( "-----------------------------Für Hilfe, verwende F1, /hilfe oder /kontakt!-----------------------------", player, 50, 100, 200 )
	setTimer ( news1, time, 1, player, time )
end
--setTimer ( news1, 300000, 1 )

function infobox ( player, text, time, r, g, b )

	if isElement ( player ) then
		triggerClientEvent ( player, "infobox_start", getRootElement(), text, time, r, g, b )
	end
end


function newsnew ( player )
local pname = getPlayerName (player)
	if laGetElementData ( player, "playingtime" ) <= 180 then
		local time = 180000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	elseif laGetElementData ( player, "playingtime" ) <= 600 then
		local time = 300000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	elseif laGetElementData ( player, "playingtime" ) <= 1500 then
		local time = 600000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	elseif laGetElementData ( player, "playingtime" ) <= 3000 then
		local time = 900000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	elseif laGetElementData ( player, "playingtime" ) <= 6000 then
		local time = 1200000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	else
		local time = 1800000
		_G[pname.."newsnew"] = setTimer ( news1, time, 1, player, time )
	end
end

playerCountcounter = 0
function playerCount ( )
	local players = getPlayerCount()
	if playerCountcounter == nil then playerCountcounter = 0 end
if playerCountcounter == 3 then
	if players >= 140 then
		--outputChatBox ( "Es ist unglaublich! Es sind " .. players .. " Spieler auf LA!", getRootElement(), 0, 255, 0 )
		--killTimer (playertimer)
		playerCountcounter = 3
		return
	elseif players >= 130 then
		--outputChatBox ( "Es sind zurzeit unfassbare " .. players .. " Spieler auf LA!", getRootElement(), 0, 225, 0 )
		--killTimer (playertimer)
		playerCountcounter = 2
		return
	elseif players >= 120 then
		--outputChatBox ( "Was ein schöner Tag! Es sind zurzeit " .. players .. " Spieler auf LA!", getRootElement(), 0, 200, 0 )
		--killTimer (playertimer)
		playerCountcounter = 1
		return
	elseif players < 120 then
		playerCountcounter = 0
		return
	end
elseif playerCountcounter == 2 then
	if players >= 140 then
		outputChatBox ( "Es ist unglaublich! Es sind " .. players .. " Spieler auf LA!", getRootElement(), 0, 255, 0 )
		--killTimer (playertimer)
		playerCountcounter = 3
		return
	elseif players >= 130 then
		--outputChatBox ( "Es sind zurzeit unfassbare " .. players .. " Spieler auf LA!", getRootElement(), 0, 225, 0 )
		--killTimer (playertimer)
		playerCountcounter = 2
		return
	elseif players >= 120 then
		--outputChatBox ( "Was ein schöner Tag! Es sind zurzeit " .. players .. " Spieler auf LA!", getRootElement(), 0, 200, 0 )
		--killTimer (playertimer)
		playerCountcounter = 1
		return
	elseif players < 100 then
		playerCountcounter = 0
		return
	end
--return
elseif playerCountcounter == 1 then
	if players >= 140 then
		outputChatBox ( "Es ist unglaublich! Es sind " .. players .. " Spieler auf LA!", getRootElement(), 0, 255, 0 )
		--killTimer (playertimer)
		playerCountcounter = 3
		return
	elseif players >= 130 then
		outputChatBox ( "Es sind zurzeit unfassbare " .. players .. " Spieler auf LA!", getRootElement(), 0, 225, 0 )
		--killTimer (playertimer)
		playerCountcounter = 2
		return
	elseif players >= 120 then
		--outputChatBox ( "Was ein schöner Tag! Es sind zurzeit " .. players .. " Spieler auf LA!", getRootElement(), 0, 200, 0 )
		--killTimer (playertimer)
		playerCountcounter = 1
		return
	elseif players < 100 then
		playerCountcounter = 0
		return
	end
--return
elseif playerCountcounter == 0 then
	if players >= 140 then
		outputChatBox ( "Es ist unglaublich! Es sind " .. players .. " Spieler auf LA!", getRootElement(), 0, 255, 0 )
		--killTimer (playertimer)
		playerCountcounter = 3
	elseif players >= 130 then
		outputChatBox ( "Es sind zurzeit unfassbare " .. players .. " Spieler auf LA!", getRootElement(), 0, 225, 0 )
		--killTimer (playertimer)
		playerCountcounter = 2
		return
	elseif players >= 120 then
		outputChatBox ( "Was ein schöner Tag! Es sind zurzeit " .. players .. " Spieler auf LA!", getRootElement(), 0, 200, 0 )
		--killTimer (playertimer)
		playerCountcounter = 1
		return
	elseif players < 100 then
		playerCountcounter = 0
		return
	end
--return
end
end

-- playertimer = setTimer ( playerCount, 60000, -1 )
playertimer = setTimer ( playerCount, 60000, 0 )

function playerCount_command ( )
	local players = getPlayerCount()
	outputChatBox ( "Es sind zurzeit " .. players .. " Spieler auf LA!", getRootElement(), 0, 0, 200 )
	--killTimer (playertimer)
	--playertimer = setTimer ( playerCount, 60000, -1 )
end
addCommandHandler ( "spieleronline", playerCount_command )