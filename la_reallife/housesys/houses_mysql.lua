local deletedHouses = 0

function houseCreation()

	local houseamount = 0
	local result = mysql_query(handler, "SELECT * FROM houses")
	if( not result) then
		 outputLog ( "[HOUSE]: Error executing the query: ("		.. mysql_errno(handler) .. ") " .. mysql_error(handler), "mysql" )
	else
		if(mysql_num_rows(result) > 0) then
			local dsatz = mysql_fetch_assoc(result)
			while( dsatz ) do
				houseamount = houseamount + 1
				local ID = tonumber(dsatz["ID"])
				local SymbolX = tonumber(dsatz["SymbolX"])
				local SymbolY = tonumber(dsatz["SymbolY"])
				local SymbolZ = tonumber(dsatz["SymbolZ"])
				local Besitzer = dsatz["Besitzer"]
				local Preis = tonumber(dsatz["Preis"])
				local Mindestzeit = tonumber(dsatz["Mindestzeit"])
				local CurrentInterior = tonumber(dsatz["CurrentInterior"])
				local Kasse = tonumber(dsatz["Kasse"])
				local Miete = tonumber(dsatz["Miete"])
				if Besitzer == "none" then symbolGrafik = 1273 else symbolGrafik = 1272 end
				_G["HouseNR"..ID] = createPickup ( SymbolX, SymbolY, SymbolZ, 3, symbolGrafik, 1000, 0 )
				laSetElementData ( _G["HouseNR"..ID], "owner", Besitzer )
				laSetElementData ( _G["HouseNR"..ID], "locked", true )
				laSetElementData ( _G["HouseNR"..ID], "preis", Preis )
				laSetElementData ( _G["HouseNR"..ID], "mintime", Mindestzeit )
				laSetElementData ( _G["HouseNR"..ID], "curint", CurrentInterior )
				laSetElementData ( _G["HouseNR"..ID], "id", ID )
				laSetElementData ( _G["HouseNR"..ID], "miete", Miete )
				laSetElementData ( _G["HouseNR"..ID], "kasse", Kasse )
				
				if not ( Besitzer == "none" ) then
					local lastLogin = MySQL_GetString ( "players", "LastLogin", "Name LIKE '"..Besitzer.."'" )
					if lastLogin then
						lastLogin = tonumber ( lastLogin )
						if lastLogin ~= 0 then
							if ( getMinTime() - lastLogin ) / 60 / 24 >= 90 then
								outputLog ( "[START]: Hausbesitzer "..Besitzer.." wurde enteignet. (ID: "..ID..")", "house")
								MySQL_SetString ( "userdata", "Hausschluessel", "0", "Name LIKE '"..Besitzer.."'" )
								MySQL_SetString ( "houses", "Kasse", "0", "Besitzer LIKE '"..Besitzer.."'" )
								mysql_la_query ( "UPDATE houses SET Besitzer = 'none' WHERE Besitzer LIKE '"..Besitzer.."'" )
								Besitzer = "none"
								deletedHouses = deletedHouses + 1
							end
						end
					end
				end
				dsatz = mysql_fetch_assoc(result)
			end
			outputLog("[START]: Es wurden "..houseamount.." Haeuser gefunden und "..deletedHouses.." Besitzer enteignet.", "house")
		else
			outputLog("[START]: Es wurden keine Häuser gefunden.", "house")
		end
	mysql_free_result(result)
	end
end
setTimer ( houseCreation, 10000, 1 )