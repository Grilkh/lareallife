local deletedBiz = 0

function createBizObjects ( i )

	if MySQL_DatasetExist ( "biz", "ID LIKE '"..i.."'" ) then
		local Besitzer = MySQL_GetString( "biz", "Inhaber", "ID LIKE '"..i.."'")
		local id = MySQL_GetString( "biz", "ID", "ID LIKE '"..i.."'")
		
		if not ( Besitzer == "none" ) then
			local lastLogin = MySQL_GetString ( "players", "LastLogin", "Name LIKE '"..Besitzer.."'" )
			if lastLogin then
				lastLogin = tonumber ( lastLogin )
				if lastLogin ~= 0 then
					if ( getMinTime() - lastLogin ) / 60 / 24 >= 90 then
						outputLog ( "[Biz]: Bizbesitzer "..Besitzer.." wurde enteignet. ( ID: "..id.." )", "biz" )
						MySQL_SetString( "biz", "Kasse", 0, "Inhaber LIKE '"..MySQL_Save ( Besitzer ).."'")
						MySQL_SetString( "biz", "Inhaber", "none", "Inhaber LIKE '"..MySQL_Save ( Besitzer ).."'")
						--mysql_la_query ( "UPDATE prestige SET Besitzer = 'none' WHERE Besitzer LIKE '"..Besitzer.."'" )
						deletedBiz = deletedBiz + 1
					end
				end
			end
		end
		
		i = i + 1
		createBizObjects ( i )
	else
		totalBizObjects = i - 1
		outputLog ( "[BIZ]: Es wurden "..( i - 1 ).." Biz gefunden und "..deletedBiz.." Besitzer enteignet.", "biz" )
	end
end
setTimer ( createBizObjects, 1000, 1, 1 )


function setBizData ()

	pnsDohertyIcon = createPickup ( -1908.7257080078, 276.80416870117, 40.696102142334, 3, 1239, 1, 0 )
	laSetElementData ( pnsDohertyIcon, "biz", "pnsDoherty" )
	pnsJuniperIcon = createPickup ( -2431.1665039063, 1028.9090576172, 50.039852142334, 3, 1239, 1, 0 )
	laSetElementData ( pnsJuniperIcon, "biz", "pnsJuniper" )
	pnsLVIcon = createPickup ( 1967.053, 2166.98, 10.82, 3, 1239, 1, 0 )
	laSetElementData ( pnsLVIcon, "biz", "pnsLV" )
	pnsLSIcon = createPickup ( 2072.669, -1834.77, 13.555, 3, 1239, 1, 0 )
	laSetElementData ( pnsLSIcon, "biz", "pnsLS" )	
	pizzaStackIcon = createPickup ( -1720.0610351563, 1356.5998535156, 6.8367257118225, 3, 1239, 1, 0 )
	laSetElementData ( pizzaStackIcon, "biz", "pizzaStack" )
	mystiesBarIcon = createPickup ( -2242.4169921875, -89.888648986816, 34.969539642334, 3, 1239, 1, 0 )
	laSetElementData ( mystiesBarIcon, "biz", "mystiesBar" )
	sprunkIcon = createPickup ( -1752.3122558594, -144.58361816406, 3.2039132118225, 3, 1239, 1, 0 )
	laSetElementData ( sprunkIcon, "biz", "sprunk" )
	bombshopIcon = createPickup ( 1842.828, -1859.223, 13.383, 3, 1239, 1, 0 )
	laSetElementData ( bombshopIcon, "biz", "bombshop" )
	burgershotIcon = createPickup ( -2342.636, -166.897, 35.555, 3, 1239, 1, 0 )
	laSetElementData ( burgershotIcon, "biz", "burgershot" )
	tankeIcon = createPickup ( -1676.185, 432.165, 7.18, 3, 1239, 1, 0 )
	laSetElementData ( tankeIcon, "biz", "tanke" )
	verleihIcon = createPickup ( -2121.902, 413.203, 35.172, 3, 1239, 1, 0 )
	laSetElementData ( verleihIcon, "biz", "verleih" )

	bizIcons = { [pnsDohertyIcon]=true, [pnsJuniperIcon]=true, [pizzaStackIcon]=true, [mystiesBarIcon]=true, [sprunkIcon]=true, [pnsLVIcon]=true, [pnsLSIcon]=true, [bombshopIcon]=true, [burgershotIcon]=true, [tankeIcon]=true, [verleihIcon]=true }

	OttosAutosIcon = createPickup ( -1639.7821044922, 1202.6267089844, 6.879873752594, 3, 1239, 1, 0 )

	TraeumeUndHoffnungen = createPickup ( -127.10718536377, 2258.1259765625, 28.063650131226, 3, 1239, 1, 0 )

	pnsDohertyName = MySQL_GetString("biz", "Name", "Biz LIKE 'PaynSprayWangcars'")
	pnsJuniperName = MySQL_GetString("biz", "Name", "Biz LIKE 'PaynSprayJuniper'")
	pnsLVName = MySQL_GetString("biz", "Name", "Biz LIKE 'PaynSprayLV'")
	pnsLSName = MySQL_GetString("biz", "Name", "Biz LIKE 'PaynSprayLS'")
	sprunkName = MySQL_GetString("biz", "Name", "Biz LIKE 'Sprunk'")
	pizzaStackName = MySQL_GetString("biz", "Name", "Biz LIKE 'WellStackedPizza'")
	mystiesBarName = MySQL_GetString("biz", "Name", "Biz LIKE 'MistysBar'")
	bombshopName = MySQL_GetString("biz", "Name", "Biz LIKE 'Bombshop'")
	burgershotName = MySQL_GetString("biz", "Name", "Biz LIKE 'Burgershot'")
	tankeName = MySQL_GetString("biz", "Name", "Biz LIKE 'Tanke'")
	verleihName = MySQL_GetString("biz", "Name", "Biz LIKE 'Verleih'")
	
	pnsDohertyKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'PaynSprayWangcars'") )
	pnsJuniperKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'PaynSprayJuniper'") )
	pnsLVKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'PaynSprayLV'") )
	pnsLSKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'PaynSprayLS'") )
	sprunkKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'Sprunk'") )
	pizzaStackKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'WellStackedPizza'") )
	mystiesBarKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'MistysBar'") )
	bombshopKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'Bombshop'") )
	burgershotKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'Burgershot'") )
	tankeKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'Tanke'") )
	verleihKasse = tonumber ( MySQL_GetString("biz", "Kasse", "Biz LIKE 'Verleih'") )
	pnsDohertyInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'PaynSprayWangcars'")
	pnsJuniperInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'PaynSprayJuniper'")
	pnsLVInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'PaynSprayLV'")
	pnsLSInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'PaynSprayLS'")
	sprunkInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'Sprunk'")
	pizzaStackInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'WellStackedPizza'")
	mystiesBarInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'MistysBar'")
	bombshopInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'Bombshop'")
	burgershotInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'Burgershot'")
	tankeInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'Tanke'")
	verleihInhaber = MySQL_GetString("biz", "Inhaber", "Biz LIKE 'Verleih'")
	
	pnsDohertyPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'PaynSprayWangcars'") )
	pnsJuniperPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'PaynSprayJuniper'") )
	pnsLVPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'PaynSprayLV'") )
	pnsLSPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'PaynSprayLS'") )
	sprunkPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'Sprunk'") )
	pizzaStackPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'WellStackedPizza'") )
	mystiesBarPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'MistysBar'") )
	bombshopPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'Bombshop'") )
	burgershotPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'Burgershot'") )
	tankePrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'Tanke'") )
	verleihPrice = tonumber ( MySQL_GetString("biz", "Preis", "Biz LIKE 'Verleih'") )
	
	bizkeys = { [1]="pnsDoherty", [2]="pnsJuniper", [3]="sprunk", [4]="pizzaStack", [5]="mystiesBar", [6]="pnsLV", [7]="pnsLS", [8]="bombshop", [9]="burgershot", [10]="tanke", [11]="verleih"}
	
	addEventHandler ( "onPickupHit", getRootElement(), onBizPickupHit )
	
	setTimer ( updateBizKasse, 300000, 1 )
end
setTimer ( setBizData, 1000, 1 )

function updateBizKasse ()

	MySQL_SetString("biz", "Kasse", pnsDohertyKasse, "Name LIKE '"..pnsDohertyName.."'")
	MySQL_SetString("biz", "Kasse", pnsJuniperKasse, "Name LIKE '"..pnsJuniperName.."'")
	MySQL_SetString("biz", "Kasse", pnsLVKasse, "Name LIKE '"..pnsLVName.."'")
	MySQL_SetString("biz", "Kasse", pnsLSKasse, "Name LIKE '"..pnsLSName.."'")
	MySQL_SetString("biz", "Kasse", sprunkKasse, "Name LIKE '"..sprunkName.."'")
	MySQL_SetString("biz", "Kasse", pizzaStackKasse, "Name LIKE '"..pizzaStackName.."'")
	MySQL_SetString("biz", "Kasse", mystiesBarKasse, "Name LIKE '"..mystiesBarName.."'")
	MySQL_SetString("biz", "Kasse", bombshopKasse, "Name LIKE '"..bombshopName.."'")
	MySQL_SetString("biz", "Kasse", burgershotKasse, "Name LIKE '"..burgershotName.."'")
	MySQL_SetString("biz", "Kasse", tankeKasse, "Name LIKE '"..tankeName.."'")
	MySQL_SetString("biz", "Kasse", verleihKasse, "Name LIKE '"..verleihName.."'")
	outputLog ( "[BIZ]: Bizkassen wurden gespeichert!" , "biz" )		
	
	setTimer ( updateBizKasse, 300000, 1 )
end

function onBizPickupHit ( hit )

	if source == TraeumeUndHoffnungen then
	outputChatBox ( "Hier ruhen Baba-Eminems Träume seiner \"Book\"-Fixxes.", hit, 125, 125, 200 )
	elseif bizIcons[source] then
		local biz = laGetElementData ( source, "biz" )
		local besitzer = _G[biz.."Inhaber"]
		if besitzer == "none" then
			besitzer = "Niemandem"
		end
		local bizname = _G[biz.."Name"]
		local bizprice = _G[biz.."Price"]
		outputChatBox ( bizname..", gehört: "..besitzer.." - Preis: "..bizprice.."$ und 50 Stunden Mindestspielzeit!", hit, 125, 0, 0 )
		if besitzer == "Niemandem" then
			triggerClientEvent ( hit, "infobox_start", getRootElement(), "\n\nTippe /buybiz[bar/bank], um das Geschäft zu kaufen!\nBei bank fallen 5% mehr Kosten an!", 7500, 0, 125, 0 )
		end
	elseif OttosAutosIcon == source then
		outputChatBox ( "Tippe /givecar [Name] [Eigener Slot] [Slot beim neuen Besitzer], um das Auto an jemanden zu geben.", hit, 200, 200, 0 )
	end
end

function buybiz_func ( player, cmd, typ )

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
		local biz, bizkey = getNearestBiz ( player )
		if biz then
			if typ == "bar" then
				bizprice = _G[biz.."Price"]
			else
				bizprice = _G[biz.."Price"] * 1.05
			end
			if bizprice <= cash then
				if _G[biz.."Inhaber"] == "none" then
					if laGetElementData ( player, "bizkey" ) == 0 then
						local bizname = _G[bizkeys[bizkey].."Name"]
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n"..bizname.." für "..bizprice.."$ gekauft!\n Tippe /bizhelp für mehr Informationen!", 7500, 0, 125, 0 )
						triggerClientEvent ( player, "createNewStatementEntry", player, "Bizkauf\n", bizprice * -1, bizname.."\n" )
						laSetElementData ( player, "bizkey", bizkey )
						local pname = getPlayerName ( player )
						MySQL_SetString("userdata", "Bizschluessel", laGetElementData ( player, "bizkey" ), "Name LIKE '"..pname.."'")
						MySQL_SetString("biz", "Inhaber", pname, "Name LIKE '".._G[biz.."Name"].."'")
						_G[biz.."Inhaber"] = pname
						if typ == "bar" then
							takePlayerMoney ( player, bizprice )
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - bizprice )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - bizprice )
							triggerClientEvent ( player, "createNewStatementEntry", player, "Bizkauf\n", bizprice * -1, "\n" )
						end
						local x, y, z = getElementPosition ( player )
						setCameraMatrix ( player, x+10, y+10, z+10, x, y, z )
						setTimer ( fixBizBuyCam, 5000, 1, player ) 
						triggerClientEvent ( player, "achievsound", getRootElement() )
						outputLog ( "[BIZ]: "..getPlayerName ( player ).." hat das Geschaeft "..bizname.." fuer "..bizprice.."$ gekauft. (ID: "..bizkey..")", "biz" )
						
						local Bizkaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Bizkauf'") )
						local Bizkaufkassenew = math.floor(Bizkaufkasse + (_G[biz.."Price"]))
						MySQL_SetString("staat", "Menge", Bizkaufkassenew, "Name LIKE 'Bizkauf'")
						
						if typ == "bank" then
							local Bizkaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Bizkaufsteuern'") )
							local Bizkaufsteuernkassenew = math.floor(Bizkaufsteuernkasse + (bizprice/20))
							MySQL_SetString("staat", "Menge", Bizkaufsteuernkassenew, "Name LIKE 'Bizkaufsteuern'")
						end
					else
						local key = laGetElementData ( player, "bizkey" )
						local bizname = _G[bizkeys[key].."Name"]
						outputChatBox ( "Du hast bereits ein Geschäft ("..bizname..") - Verkaufe es mit /sellbiz.", player, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Geschäft gehört bereits jemandem!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht genug Geld!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Geschäft!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /buybiz [bar/bank], um das Geschäft zu kaufen!", 7500, 0, 125, 0 )
	end
end
addCommandHandler ( "buybiz", buybiz_func )

function sellbiz_func ( player )

	if laGetElementData ( player, "bizkey" ) == 0 then
		outputChatBox ( "Du hast kein Geschäft!", player, 125, 0, 0 )
	else
		local tx, ty, tz = getElementPosition (BizMarker)
		if (getDistanceBetweenPoints3D ( tx, ty, tz, getElementPosition ( player ) )) < 10 and (getElementInterior(player) == 3) and (getElementDimension(player) == 1) then
			local key = laGetElementData ( player, "bizkey" )
			local biz = bizkeys[key]
			local bizname = _G[bizkeys[key].."Name"]
			_G[biz.."Inhaber"] = "none"
			local bizprice = _G[biz.."Price"]
			local bizpricewithsteuern = bizprice - bizprice/10
			local pname = getPlayerName ( player )
			outputLog ( "[BIZ]: "..pname.." hat sein Geschaeft "..bizname.." fuer "..bizpricewithsteuern.."$ verkauft. (ID: "..key..")", "biz" )
			outputChatBox ( "Du hast dein Geschäft "..bizname.." verkauft und erhältst "..bizpricewithsteuern.."$ (-10%)!", player, 0, 125, 0 )
			givePlayerMoney ( player, bizpricewithsteuern )
			laSetElementData ( player, "bizkey", 0 )
			laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) + bizpricewithsteuern )
			triggerClientEvent ( player, "createNewStatementEntry", player, "Bizverkauf\n", bizpricewithsteuern, bizname.."\n" )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			MySQL_SetString("userdata", "Bizschluessel", laGetElementData ( player, "bizkey" ), "Name LIKE '"..pname.."'")
			MySQL_SetString("biz", "Inhaber", "none", "Name LIKE '".._G[biz.."Name"].."'")
			datasave_remote ( player )
				
			local Bizverkaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Bizverkauf'") )
			local Bizverkaufkassenew = math.floor(Bizverkaufkasse + (bizpricewithsteuern))
			MySQL_SetString("staat", "Menge", Bizverkaufkassenew, "Name LIKE 'Bizverkauf'")
				
			local Bizverkaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Bizverkaufsteuern'") )
			local Bizverkaufsteuernkassenew = math.floor(Bizverkaufsteuernkasse + (bizprice/10))
			MySQL_SetString("staat", "Menge", Bizverkaufsteuernkassenew, "Name LIKE 'Bizverkaufsteuern'")
		else
			outputChatBox ( "Du bistt nicht im Biz-Gebäude (blaues Männchen)!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "sellbiz", sellbiz_func )

function fixBizBuyCam ( player )

	setCameraTarget ( player, player )
end

--1 bis soviele Biz wie es gibt
function getNearestBiz ( player )

	local x1, y1, z1 = getElementPosition ( player )
	for i = 1, 10 do
		local biz = bizkeys[i]
		local x2, y2, z2 = getElementPosition ( _G[biz.."Icon"] )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
			return biz, i
		end
	end
	return false, false
end

function bizhelp_func ( player )

	local bizkey = tonumber ( laGetElementData ( player, "bizkey" ) )
	if bizkey == 0 then
		outputChatBox ( "Du besitzt kein Geschäft!", player, 125, 0, 0 )
	else
		local bizname = _G[bizkeys[bizkey].."Name"]
		outputChatBox ( "Dein Geschäft: "..bizname..", Kasse: ".._G[bizkeys[bizkey].."Kasse"].." $.", player, 200, 200, 15 )
		outputChatBox ( "Um dein Geschäft zu verkaufen oder Geld ein/auszuzahlen, musst du ins Biz-Gebäude (blaues Männchen).", player, 125, 125, 200 )
	end
end
addCommandHandler ( "bizhelp", bizhelp_func )

function bizdraw_func ( player, cmd, amount )

	if laGetElementData ( player, "bizkey" ) > 0 then
		local tx, ty, tz = getElementPosition (BizMarker)
		if (getDistanceBetweenPoints3D ( tx, ty, tz, getElementPosition ( player ) )) < 10 and (getElementInterior(player) == 3) and (getElementDimension(player) == 1) then
			local amount = math.abs ( tonumber ( amount ) )
			if amount then
				local key = laGetElementData ( player, "bizkey" )
				local biz = bizkeys[key]
				local bizname = _G[bizkeys[key].."Name"]
				local curmoney = _G[biz.."Kasse"]
				if curmoney >= amount then
					_G[biz.."Kasse"] = curmoney - amount
					givePlayerMoney ( player, amount )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + amount )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					outputChatBox ( "Du hast "..amount.."$ aus deinem Geschäft "..bizname.." abgehoben.", player, 0, 150, 0 )
					outputLog ( "[BIZ]: "..getPlayerName(player).." hat aus seinem Geschaeft "..bizname.." "..amount.."$ abgehoben. (ID: "..key..")", "biz" )
				else
					outputChatBox ( "Du hast nicht so viel Geld in deinem Geschäft!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bistt nicht im Biz-Gebäude (blaues Männchen)!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du besitzt kein Geschäft!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "bizdraw", bizdraw_func )

function bizstore_func ( player, cmd, amount )

	if laGetElementData ( player, "bizkey" ) > 0 then
		local tx, ty, tz = getElementPosition (BizMarker)
		if (getDistanceBetweenPoints3D ( tx, ty, tz, getElementPosition ( player ) )) < 10 and (getElementInterior(player) == 3) and (getElementDimension(player) == 1) then
			local amount = math.abs ( tonumber ( amount ) )
			if amount then
				local key = laGetElementData ( player, "bizkey" )
				local biz = bizkeys[key]
				local bizname = _G[bizkeys[key].."Name"]
				if laGetElementData ( player, "money" ) >= amount then
					_G[biz.."Kasse"] = _G[biz.."Kasse"] + amount
					takePlayerMoney ( player, amount )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - amount )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					outputChatBox ( "Du hast "..amount.."$ in dein Geschäft "..bizname.." eingezahlt.", player, 0, 150, 0 )
					outputLog ( "[BIZ]: "..getPlayerName(player).." hat in sein Geschaeft "..bizname.." "..amount.."$ eingezahlt. (ID: "..key..")", "biz" )
				else
					outputChatBox ( "Du hast nicht genug Geld bei dir!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht im Biz-Gebäude (blaues Männchen)!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du besitzt kein Geschäft!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "bizstore", bizstore_func )

denkmalIcon = createPickup ( -2430.548, -1618.764, 525.761, 3, 1239, 50, 0 )

function denkmal ( player )

	outputChatBox ( "--Zum Gedenken an unseren geliebten Grafite1905 [13.07.2012]--", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", denkmalIcon, denkmal )


bizped = createPed(172, 820, 2, 1004.2)
outputDebugString("biz: 378 - PED erstellt bizped")
setElementInterior (bizped, 3)
setElementDimension(bizped, 1)
setPedRotation(bizped, 270)
setElementData ( bizped, "undeadbarped", true )
setElementFrozen(bizped, true)

local bizblip = createBlip ( -2621.631, -198.051, 4.336, 61, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local BizToInt = createMarker ( -2621.631, -198.051, 4.336, "corona", 1.5, 255, 0, 0, 150 )
local BizFromInt = createMarker ( 834.298, 7.46, 1004.187, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (BizFromInt, 3)
setElementDimension (BizFromInt, 1)

local function BizToInt_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			if laGetElementData ( hitElement, "bizkey" ) > 0 then
				fadeElementInterior ( hitElement, 3, 832.554, 7.197, 1004.18 )
				setElementDimension(hitElement, 1)
				infobox ( hitElement, "\n\nWillkommen, Geschäftsmann!", 5000, 0, 125, 0 )
			else
				outputChatBox ( "Du besitzt kein Geschäft!", hitElement, 125, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", BizToInt, BizToInt_func )

local function BizFromInt_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			fadeElementInterior ( hitElement, 0,  -2618.617, -198.012, 4.336 )
			setElementDimension(hitElement, 0)
		end
	end
end
addEventHandler ( "onMarkerHit", BizFromInt, BizFromInt_func )

BizMarker = createMarker ( 822.422, 1.856, 1002.8, "cylinder", 1.5, 0, 0, 255, 150 )
setElementInterior (BizMarker, 3)
setElementDimension(BizMarker, 1)

local function BizMarker_func ( hitElement, dim )
	if laGetElementData ( hitElement, "bizkey" ) > 0 then
		if (getElementInterior(hitElement) == 3) and (getElementDimension(hitElement) == 1) then
			outputChatBox ( "/sellbiz - Geschäft verkaufen, /bizdraw - Geld abheben, /bizstore - Geld einlagern.", hitElement, 200, 200, 0 )
			local bizkey = tonumber ( laGetElementData ( player, "bizkey" ) )
			local bizname = _G[bizkeys[bizkey].."Name"]
			outputChatBox ( "Dein Geschäft: "..bizname..", Kasse: ".._G[bizkeys[bizkey].."Kasse"].."$.", player, 200, 200, 15 )
		end
	else
		outputChatBox ( "Du besitzt kein Geschäft!", hitElement, 125, 0, 0 )
	end
end
addEventHandler ( "onMarkerHit", BizMarker, BizMarker_func )
