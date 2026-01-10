local deletedPrestige = 0

function createPrestigeObjects ( i )

	if MySQL_DatasetExist ( "prestige", "ID LIKE '"..i.."'" ) then
		local x, y, z = MySQL_GetVar( "prestige", "x", "ID LIKE '"..i.."'"), MySQL_GetVar( "prestige", "y", "ID LIKE '"..i.."'"), MySQL_GetVar( "prestige", "z", "ID LIKE '"..i.."'")
		local Besitzer = MySQL_GetString( "prestige", "Besitzer", "ID LIKE '"..i.."'")
		local preis = MySQL_GetString( "prestige", "Preis", "ID LIKE '"..i.."'")
		local id = MySQL_GetString( "prestige", "ID", "ID LIKE '"..i.."'")
		
		_G["prestige"..id] = createPickup ( x, y, z, 3, 1239, 1000 )
		
		addEventHandler ( "onPickupHit", _G["prestige"..id], prestigePickupHit )
		
		local pickup = _G["prestige"..id]
		
		laSetElementData ( pickup, "besitzer", Besitzer )
		laSetElementData ( pickup, "preis", preis )
		laSetElementData ( pickup, "id", id )
		
		if not ( Besitzer == "none" ) then
			local lastLogin = MySQL_GetString ( "players", "LastLogin", "Name LIKE '"..Besitzer.."'" )
			if lastLogin then
				lastLogin = tonumber ( lastLogin )
				if lastLogin ~= 0 then
					if ( getMinTime() - lastLogin ) / 60 / 24 >= 90 then
						outputLog ( "[PRESTIGE]: Prestigebesitzer "..Besitzer.." wurde enteignet. ( ID: "..id.." )", "biz" )
						MySQL_SetString( "prestige", "Besitzer", "none", "Besitzer LIKE '"..MySQL_Save ( Besitzer ).."'")
						--mysql_la_query ( "UPDATE prestige SET Besitzer = 'none' WHERE Besitzer LIKE '"..Besitzer.."'" )
						laSetElementData ( _G["prestige"..id], "besitzer", "none" )
						deletedPrestige = deletedPrestige + 1
					end
				end
			end
		end
		
		i = i + 1
		createPrestigeObjects ( i )
	else
		totalPrestigeObjects = i - 1
		outputLog ( "[PRESTIGE]: Es wurden "..( i - 1 ).." Prestigeobjekte gefunden und "..deletedPrestige.." Besitzer enteignet.", "biz" )
	end
end
setTimer ( createPrestigeObjects, 1000, 1, 1 )

function prestigePickupHit ( player )

	local besitzer = laGetElementData ( source, "besitzer" )
	local preis = laGetElementData ( source, "preis" )
	laSetElementData ( player, "lastPrestigePickup", source )
	if besitzer == "" then 
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDieses Objekt steht zum Verkauf, Kosten: "..preis.."$\nTippe /buyprestige, um es zu erwerben.", 7500, 200, 200, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDieses Objekt gehört: "..besitzer, 7500, 200, 200, 0 )
	end
end

function buyprestige_func ( player, cmd, typ )

	if typ == "bar" then
		cash = laGetElementData ( player, "money" )
		local cmd = true
	elseif typ == "bank" then
		cash = laGetElementData ( player, "bankmoney" )
		local cmd = true
	else
		local cmd = false
	end
	if cmd then
		local pickup = laGetElementData ( player, "lastPrestigePickup" )
		if pickup then
			local pname = MySQL_Save ( getPlayerName ( player ) )
			if laGetElementData ( pickup, "besitzer" ) == "none" then
				if not MySQL_DatasetExist ( "buyit", "Hoechstbietender LIKE '"..pname.."' AND Typ LIKE 'Prestige'" ) then
					local isOwning = false
					for i = 1, totalPrestigeObjects do
						if laGetElementData ( _G["prestige"..i], "besitzer" ) == pname then
							isOwning = true
							break
						end
					end
					if not isOwning then
						local preis = tonumber ( laGetElementData ( pickup, "preis" ) )
						if typ == "bar" then
							prestigepreis = preis
						else
							prestigepreis = preis * 1.05
						end
						--local bankmoney = tonumber ( laGetElementData ( player, "bankmoney" ) )
						local id = laGetElementData ( pickup, "id" )
						if prestigepreis <= cash then
							if typ == "bar" then
								takePlayerMoney ( player, prestigepreis )
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - prestigepreis )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							else
								laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - prestigepreis )
								triggerClientEvent ( player, "createNewStatementEntry", player, "Prestigekauf\n", prestigepreis * -1, "\n" )
							end
							outputChatBox ( "Herzlichen Glückwunsch, du hast dieses Objekt für "..prestigepreis.."$ erworben!", player, 0, 125, 0 )
							MySQL_SetString( "prestige", "Besitzer", pname, "ID LIKE '"..id.."'")
							laSetElementData ( pickup, "besitzer", pname )
							outputLog ( "[PRESTIGE]: Das Prestige (ID "..id..") wurde von "..pname.." fuer "..prestigepreis.."$ erworben.", "biz" )
							
							local Prestigekaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Prestigekauf'") )
							local Prestigekaufkassenew = math.floor(Prestigekaufkasse + (preis))
							MySQL_SetString("staat", "Menge", Prestigekaufkassenew, "Name LIKE 'Prestigekauf'")
							
							if typ == "bank" then
								local Prestigekaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Prestigekaufsteuern'") )
								local Prestigekaufsteuernkassenew = math.floor(Prestigekaufsteuernkasse + (preis/20))
								MySQL_SetString("staat", "Menge", Prestigekaufsteuernkassenew, "Name LIKE 'Prestigekaufsteuern'")
							end
								
						else
							outputChatBox ( "Du hast nicht genug Geld - dieses Objekt kostet "..prestigepreis.."$!", player, 125, 0, 0 )
						end
					else
						outputChatBox ( "Du kannst nur ein Prestigeobjekt besitzen!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Du bietest bereits auf ein Prestige-Objekt!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Dieses Objekt steht nicht zum Verkauf!", player, 125, 0, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /buyprestige [bar/bank], um das Prestige zu kaufen!", 7500, 0, 125, 0 )
	end
end
addCommandHandler ( "buyprestige", buyprestige_func )

function sellprestige_func ( player )
local pname = getPlayerName(player)
	if MySQL_DatasetExist ( "prestige", "Besitzer LIKE '"..MySQL_Save( pname ).."'" ) then
		if not MySQL_DatasetExist ("buyit", "Anbieter LIKE '"..pname.."' AND Typ LIKE 'Prestige'") then
			local price = tonumber ( MySQL_GetString( "prestige", "Preis", "Besitzer LIKE '"..MySQL_Save ( pname ).."'") )
			local pricewithsteuern = price - price/10
			laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) + pricewithsteuern )
			outputChatBox ( "Du hast dein Prestige-Objekt verkauft und erhältst "..pricewithsteuern.."$ (-10%)!", player, 0, 125, 0 )
			local id = MySQL_GetString( "prestige", "ID", "Besitzer LIKE '"..pname.."'")
			triggerClientEvent ( player, "createNewStatementEntry", player, "Prestigeverkauf\n", pricewithsteuern, "\n" )
			outputLog ( "[PRESTIGE]: "..pname.." hat sein Prestige (ID "..id..") für "..pricewithsteuern.."$ verkauft.", "biz" )
			MySQL_SetString( "prestige", "Besitzer", "none", "Besitzer LIKE '"..MySQL_Save ( pname ).."'")
			
			local Prestigeverkaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Prestigeverkauf'") )
			local Prestigeverkaufkassenew = math.floor(Prestigeverkaufkasse + (pricewithsteuern))
			MySQL_SetString("staat", "Menge", Prestigeverkaufkassenew, "Name LIKE 'Prestigeverkauf'")
			
			local Prestigeverkaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Prestigeverkaufsteuern'") )
			local Prestigeverkaufsteuernkassenew = math.floor(Prestigeverkaufsteuernkasse + (price/10))
			MySQL_SetString("staat", "Menge", Prestigeverkaufsteuernkassenew, "Name LIKE 'Prestigeverkaufsteuern'")
		
			for i = 1, totalPrestigeObjects do
				if laGetElementData ( _G["prestige"..i], "besitzer" ) == pname then
					laSetElementData ( _G["prestige"..i], "besitzer", "none" )
				end
			end
		else
			outputChatBox ( "Dein Prestige-Objekt wird momentan versteigert!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Dir gehört kein Prestige-Objekt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "sellprestige", sellprestige_func )