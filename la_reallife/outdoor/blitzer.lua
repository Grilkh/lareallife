-- ScriptName: Blitzer Version: 1.0 ScriptBy: [SR]NexxT

-- Dieses Script beinhaltet die Funktion Spieler die zu schnell Fahren zu blitzen so dass diese eine Strafe Zahlen müssen.


-- Marker für die Funktion

Wangcars = createMarker(-2003, 299, 35, "corona", 15, 0, 0, 0, 0)
PD = createMarker(-1559, 867, 8, "corona", 15, 0, 0, 0, 0)
Hotel = createMarker(-2407, 303, 35, "corona", 15, 0, 0, 0, 0)
Ammunation = createMarker(-2591, 224, 10, "corona", 15, 0, 0, 0, 0)
Rathaus = createMarker(-2853, 380, 5, "corona", 15, 0, 0, 0, 0)
Noobspawn = createMarker(-2386, 718, 36, "corona", 15, 0, 0, 0, 0)
Bridge = createMarker(-2541, 1108, 56, "corona", 15, 0, 0, 0, 0)
SpeedTest = createMarker(-2008, 259, 31, "corona", 15, 0, 0, 0, 0)

function SpeedTest_func(thePlayer)
speedx, speedy, speedz = getElementVelocity (thePlayer)
 
actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
 
mps = actualspeed * 50 --zeigt die Geschwindigkeit in Meter pro Sekunde an.
kmh = actualspeed * 180 --zeigt die Geschwindigkeit in Kilometer pro Stunde.
mph = actualspeed * 111.847 --zeigt die Geschwindigkeit in Meilen pro Stunde.
-- In dieser Verion werden wir die Geschwindkeit in KMH anzeigen lassen.
if (kmh > 100) and (120 > kmh) then -- Die "80" gibt die erlaubte Geschwindigkeit an.//Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	outputChatBox("Du bist gerade geblitzt worden!",thePlayer,255,255,0)
	outputChatBox("Deine gemessene Geschwindigkeit: "..math.floor(kmh).." KMH",thePlayer,255,255,0) -- Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("Dir wurden 50$ abgerechnet um den Strafzettel zu bezahlen.",thePlayer,255,255,0) -- Den Preis kannst du im Text jederzeit ändern!
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	laSetElementData ( thePlayer, "bankmoney", laGetElementData ( thePlayer, "bankmoney" ) - 50 )
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 255 )   --Diese Timer lassen den Marker auf leuchten wenn jemand geblitzt wird.
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 0 )   
	end, 0100, 1) 
	end, 0100, 1)
elseif (kmh > 120) and (150 > kmh) then -- Die "80" gibt die erlaubte Geschwindigkeit an.//Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	outputChatBox("Du bist gerade geblitzt worden!",thePlayer,255,255,0)
	outputChatBox("Deine gemessene Geschwindigkeit: "..math.floor(kmh).." KMH",thePlayer,255,255,0) -- Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("Dir wurden 100$ abgerechnet um den Strafzettel zu bezahlen.",thePlayer,255,255,0) -- Den Preis kannst du im Text jederzeit ändern!
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	laSetElementData ( thePlayer, "bankmoney", laGetElementData ( thePlayer, "bankmoney" ) - 100 )
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 255 )   --Diese Timer lassen den Marker auf leuchten wenn jemand geblitzt wird.
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 0 )   
	end, 0100, 1) 
	end, 0100, 1) 
elseif (kmh > 150) and (200 > kmh) then -- Die "80" gibt die erlaubte Geschwindigkeit an.//Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	outputChatBox("Du bist gerade geblitzt worden!",thePlayer,255,255,0)
	outputChatBox("Deine gemessene Geschwindigkeit: "..math.floor(kmh).." KMH",thePlayer,255,255,0) -- Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("Dir wurden 250$ abgerechnet um den Strafzettel zu bezahlen.",thePlayer,255,255,0) -- Den Preis kannst du im Text jederzeit ändern!
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	laSetElementData ( thePlayer, "bankmoney", laGetElementData ( thePlayer, "bankmoney" ) - 250 )
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 255 )   --Diese Timer lassen den Marker auf leuchten wenn jemand geblitzt wird.
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 0 )   
	end, 0100, 1) 
	end, 0100, 1)
elseif (kmh > 200) then -- Die "80" gibt die erlaubte Geschwindigkeit an.//Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	outputChatBox("Du bist gerade geblitzt worden!",thePlayer,255,255,0)
	outputChatBox("Deine gemessene Geschwindigkeit: "..math.floor(kmh).." KMH",thePlayer,255,255,0) -- Wenn du die Geschwindigkeit nicht in KMH haben willst gebe "mps oder mph" ein.
	outputChatBox("Dir wurden 500$ abgerechnet um den Strafzettel zu bezahlen.",thePlayer,255,255,0) -- Den Preis kannst du im Text jederzeit ändern!
	outputChatBox("--Blitzer--",thePlayer,255,255,0)
	laSetElementData ( thePlayer, "bankmoney", laGetElementData ( thePlayer, "bankmoney" ) - 500 )
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 255 )   --Diese Timer lassen den Marker auf leuchten wenn jemand geblitzt wird.
	setTimer(function()
	setMarkerColor ( SpeedTest, 255, 255, 255, 0 )   
	end, 0100, 1) 
	end, 0100, 1)
end

end
addEventHandler("onMarkerHit", SpeedTest, SpeedTest_func) --Informationen: "SpeedTest = Name des Markers"
-- Beispiel: "addEventHandler("onMarkerHit", MarkerNAME, SpeedTest_func)" --Um ein weiteres Event zu erstellen einfach das Beispiel kopieren und einfügen!

-- Das Script darf immer bearbeitet werden! Jedoch sollte der Hinweis wer das Script erstellt hat erhalten bleiben, denn das Script liegt unter Copyright von [SR]NexxT!
-- //ScripterWebsite: www.IxTron.de - Scripter: [SR]NexxT
-- //Viel spaß mit dem Script und viel erfolg bei deinem Projekt!