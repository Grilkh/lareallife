function payday ( player )

local zuschuesse = 0
local income = 0
local clubkosten = 0
local steuern = 0
local vermoegenssteuern = 0 
local rent = 0
local hotel = 0
local handy = 0
local plus = 0
local nzinsen = 0
local zinsen = 0
local carcosts = 0
local boni = 0
local totalbalance = 0
local addbalance = 0
local koks = 0
local mats = 0
local whitelist = 0
--local paeckchen = tonumber(getPlayerPaeckchen(player))
local pname = getPlayerName(player)
---------------
	if math.floor ( laGetElementData ( player, "playingtime" ) / 60 ) == ( laGetElementData ( player, "playingtime" ) / 60 ) then
		local bankmoney = laGetElementData ( player, "bankmoney" )
		if isZivi(player) == 0 then
			income = 0
			zuschuesse = 1000
		elseif isCop(player) then
			income = 1500+tonumber(laGetElementData ( player, "pdayincome" ))
			zuschuesse = 0
		elseif isCamorra(player) then
			income = 1000+500*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isYakuza(player) then
			income = 1000+500*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isMedic(player) then
			income = 1500+600*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isMechaniker(player) then
			income = 1500+600*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isReporter(player) then
			income = 1500+600*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isFBI(player) then
			income = 1500+tonumber(laGetElementData ( player, "pdayincome" ))
			zuschuesse = 0
		elseif isSurenos(player) then
			income = 1000+500*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isArmy(player) then
			income = 1500+tonumber(laGetElementData ( player, "pdayincome" ))
			zuschuesse = 0
		elseif isCompton(player) then
			income = 1000+500*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isWatts(player) then
			income = 1000+500*tonumber(laGetElementData(player,"rang"))
			zuschuesse = 0
		elseif isTerror(player) then
			income = 5000
			zuschuesse = 0
		else
			income = 0
			zuschuesse = 0
		end
		local Einkommenskasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Einkommen'") )
		local Einkommenskassenew = Einkommenskasse + income
		MySQL_SetString("staat", "Menge", Einkommenskassenew, "Name LIKE 'Einkommen'")
		
		--[[if math.floor ( tonumber ( laGetElementData ( player, "playingtime" ) ) / 600 ) == ( tonumber ( laGetElementData ( player, "playingtime" ) ) / 600 ) then
			zuschuesse = zuschuesse + 10000
			outputChatBox ( "Du kriegst alle 10 Spielstunden einen Zuschuss von 10.000$!", player, 0, 200, 0 )
		end]]
		--if laGetElementData ( player, "club" ) == "gartenverein" then
		--	clubkosten = 30
		--	outputChatBox ( "Um den Club zu verlassen, tippe /leaveclub", player, 125, 0, 0 )
		if laGetElementData ( player, "club" ) == "biker" then
			clubkosten = 50
			mystiesBarKasse = mystiesBarKasse + 50
			outputChatBox ( "Um den Club zu verlassen, tippe /leaveclub", player, 125, 0, 0 )
		else
			clubkosten = 0
		end
		steuern = 0
		vermoegenssteuern = 0 
		rent = 0
		if laGetElementData ( player, "housekey" ) < 0 then
			local ID = math.abs(laGetElementData ( player, "housekey" ))
			rent = MySQL_GetString("houses", "Miete", "ID LIKE '"..ID.."'")
			local Kasse = MySQL_GetString("houses", "Kasse", "ID LIKE '"..ID.."'")
			local newKasse = Kasse + rent
			MySQL_SetString("houses", "Kasse", newKasse, "ID LIKE '"..ID.."'")
			rent = tonumber(rent)
		end
		hotel = 0
		if laGetElementData ( player, "spawnpos_x" ) == 2230.5236816406 then
			hotel = hotel + 100
		elseif laGetElementData ( player, "spawnpos_x" ) == 2230.5236816407 then
			hotel = hotel + 100
		end
		handy = 0
		local hcosts = laGetElementData ( player, "handyCosts" )
		if laGetElementData ( player, "handyType" ) == 1 then -- Vertrag
			if hcosts <= 100 then
				handy = handy +100
			end
		elseif laGetElementData ( player, "handyType" ) == 2 then -- Prepaid
			handy = handy + 0
		elseif laGetElementData ( player, "handyType" ) == 3 then -- Flatrate
			handy = handy + hcosts + 50
		end
		local Handykasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Handykosten'") )
		local Handykassenew = Handykasse + handy
		MySQL_SetString("staat", "Menge", Handykassenew, "Name LIKE 'Handykosten'")
		
		if income <= 500 then
			steuern = math.floor(income/100*5*2)
		elseif income <= 1500 then
			steuern = math.floor(income/100*10*1.9)
		elseif income <= 2500 then
			steuern = math.floor(income/100*15*1.8)
		elseif income <= 3500 then
			steuern = math.floor(income/100*20*1.7)
		elseif income <= 4500 then
			steuern = math.floor(income/100*25*1.6)
		elseif income <= 5500 then
			steuern = math.floor(income/100*30*1.5)
		elseif income <= 6500 then
			steuern = math.floor(income/100*35*1.4)
		else
			steuern = math.floor(income/100*40*1.3)
		end
		local Lohnkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Lohnsteuern'") )
		local Lohnkassenew = Lohnkasse + steuern
		MySQL_SetString("staat", "Menge", Lohnkassenew, "Name LIKE 'Lohnsteuern'")
		
		local id = laGetElementData ( player, "housekey" )
		local hauskasse = 0
		if tonumber(id) > 0 then
			hauskasse = tonumber ( MySQL_GetString ( "houses", "Kasse", "ID LIKE '" ..id.."'" ) )
		end
		if hauskasse < 0 then
			hauskasse = 0
		end
		
		local bizkasse = 0
		if laGetElementData ( player, "bizkey" ) > 0 then
			local key = laGetElementData ( player, "bizkey" )
			local biz = bizkeys[key]
			local bizname = _G[bizkeys[key].."Name"]
			bizkasse = _G[biz.."Kasse"]
		end
		if bizkasse < 0 then
			bizkasse = 0
		end
				
				
		vermoegen = bankmoney + hauskasse + bizkasse
		
		if vermoegen <= 1000000 then
			vermoegenssteuern = math.floor((vermoegen/1000)/5)
		elseif vermoegen <= 2500000 then
			vermoegenssteuern = math.floor((vermoegen/950)/5)
		elseif vermoegen <= 5000000 then
			vermoegenssteuern = math.floor((vermoegen/900)/5)
		elseif vermoegen <= 7500000 then
			vermoegenssteuern = math.floor((vermoegen/850)/5)
		elseif vermoegen <= 10000000 then
			vermoegenssteuern = math.floor((vermoegen/800)/5)
		else
			vermoegenssteuern = math.floor((vermoegen/750)/5)
		end
		local Vermoegenskasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Vermoegenssteuern'") )
		local Vermoegenskassenew = Vermoegenskasse + vermoegenssteuern
		MySQL_SetString("staat", "Menge", Vermoegenskassenew, "Name LIKE 'Vermoegenssteuern'")
		--if laGetElementData ( player, "fraktion" ) == 2 then plus = 350 else plus = 0 end
		plus = 0
		--[[if laGetElementData ( player, "adminlvl" ) >= 2 then
			nzinsen = zinssatz*3
		else
			nzinsen = zinssatz
		end
		carcosts = 0
		zinsen = math.floor(bankmoney )/100*nzinsen)]]
		carcosts = math.floor(laGetElementData ( player, "curcars" )^(autosteuererh)*autosteuerprice*2)
		local Autokasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Autosteuern'") )
		local Autokassenew = Autokasse + carcosts
		MySQL_SetString("staat", "Menge", Autokassenew, "Name LIKE 'Autosteuern'")
		boni = laGetElementData ( player, "boni" )
		
		local CurrentAnzahl = 1
		if laGetElementData (player, "isOnWhiteList2") == true then
			if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '2'" ) then
				whitelist = whitelist + 1000
				local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
				local FraktionskasseNew = (Fraktionskasse + 1000)
				MySQL_SetString("fraktionen", "DepotGeld", FraktionskasseNew, "Name LIKE 'Camorra'")
				CurrentAnzahl = tonumber(MySQL_GetString("whitelist", "Anzahl", "Name LIKE '"..pname.."' AND Fraktion LIKE '2'"))
				MySQL_SetString("whitelist", "Anzahl", CurrentAnzahl+1, "Name LIKE '"..pname.."' AND Fraktion LIKE '2'")
			end
		end
		if laGetElementData (player, "isOnWhiteList3") == true then
			if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '3'" ) then
				whitelist = whitelist + 1000
				local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
				local FraktionskasseNew = (Fraktionskasse + 1000)
				MySQL_SetString("fraktionen", "DepotGeld", FraktionskasseNew, "Name LIKE 'Yakuza'")
				CurrentAnzahl = tonumber(MySQL_GetString("whitelist", "Anzahl", "Name LIKE '"..pname.."' AND Fraktion LIKE '3'"))
				MySQL_SetString("whitelist", "Anzahl", CurrentAnzahl+1, "Name LIKE '"..pname.."' AND Fraktion LIKE '3'")
			end
		end
		if laGetElementData (player, "isOnWhiteList7") == true then
			if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '7'" ) then
				whitelist = whitelist + 1000
				local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
				local FraktionskasseNew = (Fraktionskasse + 1000)
				MySQL_SetString("fraktionen", "DepotGeld", FraktionskasseNew, "Name LIKE 'Surenos'")
				CurrentAnzahl = tonumber(MySQL_GetString("whitelist", "Anzahl", "Name LIKE '"..pname.."' AND Fraktion LIKE '7'"))
				MySQL_SetString("whitelist", "Anzahl", CurrentAnzahl+1, "Name LIKE '"..pname.."' AND Fraktion LIKE '7'")
			end
		end
		if laGetElementData (player, "isOnWhiteList9") == true then
			if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '9'" ) then
				whitelist = whitelist + 1000
				local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
				local FraktionskasseNew = (Fraktionskasse + 1000)
				MySQL_SetString("fraktionen", "DepotGeld", FraktionskasseNew, "Name LIKE 'Compton'")
				CurrentAnzahl = tonumber(MySQL_GetString("whitelist", "Anzahl", "Name LIKE '"..pname.."' AND Fraktion LIKE '9'"))
				MySQL_SetString("whitelist", "Anzahl", CurrentAnzahl+1, "Name LIKE '"..pname.."' AND Fraktion LIKE '9'")
			end
		end
		if laGetElementData (player, "isOnWhiteList10") == true then
			if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '10'" ) then
				whitelist = whitelist + 1000
				local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Watts'") )
				local FraktionskasseNew = (Fraktionskasse + 1000)
				MySQL_SetString("fraktionen", "DepotGeld", FraktionskasseNew, "Name LIKE 'Watts'")
				CurrentAnzahl = tonumber(MySQL_GetString("whitelist", "Anzahl", "Name LIKE '"..pname.."' AND Fraktion LIKE '10'"))
				MySQL_SetString("whitelist", "Anzahl", CurrentAnzahl+1, "Name LIKE '"..pname.."' AND Fraktion LIKE '10'")
			end
		end
			
		local Gangarea1 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '1'") )
		local Gangarea2 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '2'") )
		local Gangarea3 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '3'") )
		local Gangarea4 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '4'") )
		local Gangarea5 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '5'") )
		local Gangarea6 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '6'") )
		local Gangarea7 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '7'") )
		local Gangarea8 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '8'") )
		local Gangarea9 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '9'") )
		local Gangarea10 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '10'") )
		local Gangarea11 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '11'") )
		local Gangarea12 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '12'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '13'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '14'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '15'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '16'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '17'") )
		local Gangarea13 = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '18'") )
		
		if Gangarea1 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea2 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea3 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea4 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea5 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea6 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea7 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea8 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea9 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea10 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea11 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea12 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end
		if Gangarea13 == laGetElementData ( player, "fraktion" ) then
			boni = boni + 100
		end

		local Bonikasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Boni'") )
		local Bonikassenew = Bonikasse + boni
		MySQL_SetString("staat", "Menge", Bonikassenew, "Name LIKE 'Boni'")
		
		-- Zinsen --
		local zinsen = math.floor ( ( ( bankmoney ) ^ ( zinssatz ) ) + 0.5 )
		if zinsen < 0 then
			zinsen = 0
		end
		
		local Zinsenkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Zinsen'") )
		local Zinsenkassenew = Zinsenkasse + zinsen
		MySQL_SetString("staat", "Menge", Zinsenkassenew, "Name LIKE 'Zinsen'")
		
		totalbalance = income + boni + zuschuesse + plus + zinsen - clubkosten - steuern - vermoegenssteuern - carcosts - rent - hotel - handy - whitelist
		addbalance = 0
		if laGetElementData ( player, "adminlvl" ) >= 2 then
			addbalance = math.floor ( totalbalance * 0.2 + 0.5 )
		end
		totalbalance = totalbalance + addbalance
		
		if laGetElementData ( player, "stvo" ) >= 1 then
			laSetElementData ( player, "stvo", laGetElementData ( player, "stvo" ) - 1 )
			outputChatBox ( "Dir wurde soeben 1 StVO-Punkt erlassen!", player, 0, 150, 0 )
		end
		if math.floor ( tonumber ( laGetElementData ( player, "playingtime" ) ) / 120 ) == ( tonumber ( laGetElementData ( player, "playingtime" ) ) / 120 ) and ( laGetElementData ( player, "wanteds" ) >= 1 ) then
			laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) - 1 )
			local wanteds = laGetElementData ( player, "wanteds" )
			if (wanteds >= 0) and (wanteds <= 6) then
				setPlayerWantedLevel ( player, wanteds )
			end
			outputChatBox ( "Dir wurde soeben 1 Wanted erlassen!", player, 0, 150, 0 )
		end
		
		outputChatBox ( "_____Zahltag_____", player, 0, 0, 255 )
		outputChatBox ( "__Einkommen:__", player, 0, 255, 0 )
		if income > 0 then
			outputChatBox ( "Fraktion: +"..income.."$", player, 0, 200, 0 )
		end
		if boni > 0 then
			outputChatBox ( "Boni: +"..boni.."$", player, 0, 200, 0 )
		end
		if zuschuesse > 0 then
			outputChatBox ( "Zuschüsse: +"..zuschuesse.."$", player, 0, 200, 0 )
		end
		if getElementData ( player, "socialState" ) == "Rentner" then
			outputChatBox ( "Rentenzuschuss: +1.500$", player, 0, 200, 0 )
			totalbalance = totalbalance + 1500
		end
		if isWatts (player) then
			if laGetElementData(player,"rang") >= 1 then
				koks = 2*tonumber(laGetElementData(player,"rang"))
			else
				koks = 1
			end
			local koki = tonumber(koks)
			outputChatBox ( "Fraktionsboni: "..koki.." Gramm Kokain!", player, 0, 200, 0 )
			laSetElementData ( player, "koks", tonumber ( laGetElementData ( player, "koks" ) ) + koks )
		elseif isCompton (player) then
			if laGetElementData(player,"rang") >= 1 then
				mats = 10*2*tonumber(laGetElementData(player,"rang"))
			else
				mats = 10
			end
			local mati = tonumber(mats)
			outputChatBox ( "Fraktionsboni: "..mati.." Materialien!", player, 0, 200, 0 )
			laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + mats )
		end
		-- Zinsen --
		outputChatBox ( "Zinsen: +"..zinsen.."$", player, 0, 200, 0 )
		
		outputChatBox ( "__Kosten:__", player, 255, 0, 0 )
		if steuern > 0 then
			outputChatBox ( "Einkommenssteuer: -"..steuern.."$", player, 225, 0, 0 )
		end
		if vermoegenssteuern > 0 then
			outputChatBox ( "Vermögenssteuer: -"..vermoegenssteuern.."$", player, 225, 0, 0 )
		end
		if carcosts > 0 then
			outputChatBox ( "Fahrzeugsteuer: -"..carcosts.."$", player, 225, 0, 0 )
		end
		if boni < 0 then
			outputChatBox ( "Boni: "..boni.."$", player, 200, 0, 0 )
		end
		if rent > 0 then
			outputChatBox ( "Miete: -"..rent.."$", player, 200, 0, 0 )
		end
		if hotel > 0 then
			outputChatBox ( "Hotelkosten: -"..hotel.."$", player, 200, 0, 0 )
		end
		if clubkosten > 0 then
			outputChatBox ( "Club: -"..clubkosten.."$", player, 200, 0, 0 )
		end
		if handy > 0 then
			outputChatBox ( "Handy: -"..handy.."$", player, 200, 0, 0 )
		end
		
		if whitelist > 0 then
			outputChatBox ( "Whitelist: -"..whitelist.."$", player, 200, 0, 0 )
			outputChatBox ( "Verwende /stopwhitelist um dich von der Whitelist der Fraktion zu streichen.", player, 200, 0, 0 )
		end

		outputChatBox ( "__________________", player, 0, 0, 125 )
		
		--Boni-PAYDAY--
		--totalbalance = totalbalance * 2
		if totalbalance > 0 then
			outputChatBox ( "Abrechnung: +"..totalbalance.."$ "--[[( Davon "..addbalance.." $ Premium Bonus )"]], player, 0, 255, 0 )
			outputChatBox ( "Die Einnahmen wurden auf dein Konto gutgeschrieben!", player, 0, 200, 0 )
		else
			outputChatBox ( "Abrechnung: -"..totalbalance.."$ "--[[( Davon "..addbalance.." $ Premium Bonus )"]], player, 255, 0, 0 )
			outputChatBox ( "Die Ausgaben wurden deinem Konto belastet!", player, 200, 0, 0 )		
		end

		--setPlayerPaeckchen(player, paeckchen+1)
		--outputChatBox ( "Du kriegst jede Stunde 1 Päckchen!", player, 0, 200, 0 )		
		triggerClientEvent ( player, "createNewStatementEntry", player, "Abrechnung\n", totalbalance, "\n" )
		
		laSetElementData ( player, "pdayincome", 0 )
		laSetElementData ( player, "boni", 0 )

		triggerClientEvent ( player, "achievsound", player )

		if (totalbalance < 0) and (bankmoney - totalbalance) <= 0 then
			laSetElementData ( player, "bankmoney", 0 )
		else
			laSetElementData ( player, "bankmoney", bankmoney + totalbalance )
		end
		if laGetElementData ( player, "bankmoney" ) < 0 then
			laSetElementData ( player, "bankmoney", 0 )
		end
		
		datasave_remote ( player )
	end
end
-----------------------------------
--addCommandHandler( "testpd", payday)


function playingtime ( player )
local bonus = 0
	if player then
		if isElement ( player ) then
			if laGetElementData ( player, "loggedin" ) == 1 then
				local veh = getPedOccupiedVehicle(player)
				if veh then
					if not mlkws[getElementModel(veh)] then
						local wanteds = laGetElementData ( player, "wanteds" )
						if (wanteds >= 0) and (wanteds <= 6) then
							setPlayerWantedLevel ( player, wanteds )
						end
					end
				else
					local wanteds = laGetElementData ( player, "wanteds" )
					if (wanteds >= 0) and (wanteds <= 6) then
						setPlayerWantedLevel ( player, wanteds )
					end
				end
				local pname = getPlayerName ( player )
				laSetElementData ( player, "curplayingtime", laGetElementData ( player, "curplayingtime" ) + 1 )						-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
				
				if math.random ( 1, 2 ) == 1 then
					checkForSymptoms ( player )
				end
				if math.floor ( laGetElementData ( player, "curplayingtime" ) / 5 ) == laGetElementData ( player, "curplayingtime" ) / 5 then
					lowerFlush ( player )
				elseif math.floor ( laGetElementData ( player, "curplayingtime" ) / 20 ) == laGetElementData ( player, "curplayingtime" ) / 20 then
					lowerAddict ( player )
				end
				
				if laGetElementData ( player, "curplayingtime" ) >= 720 and laGetElementData ( player, "schlaflosinsa" ) ~= "done" then	-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
					triggerClientEvent ( player, "showAchievmentBox", player, "Schlaflos in SA", 50, 10000 )						-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
					laSetElementData ( player, "bonuspoints", laGetElementData ( player, "bonuspoints" ) + 50	)									-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
					laSetElementData ( player, "schlaflosinsa", "done" )																-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
					MySQL_SetString("achievments", "SchlaflosInSA", laGetElementData ( player, "schlaflosinsa" ), "Name LIKE '"..getPlayerName(player).."'")								-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
				end																													-- Achiev: Schlaflos in SA, 12 Stunden am Stück zocken, 30 Punkte
				laSetElementData ( player, "playingtime", laGetElementData ( player, "playingtime" ) + 1 )								-- Spielzeit
				if tonumber(laGetElementData ( player, "jailtime" )) > 1 then
					laSetElementData ( player, "jailtime", tonumber(laGetElementData ( player, "jailtime" )) - 1 )
				elseif tonumber(laGetElementData ( player, "jailtime" )) == 1 then
					laSetElementData ( player, "jailtime", 0 )
					outputChatBox ("Du wurdest entlassen! Lass dich nicht nochmal erwischen!", player, 0, 125, 0 )
					toggleControl ( player, "fire", true )
					toggleControl ( player, "jump", true )
					if laGetElementData ( player, "heaventime" ) == 0 then
						setElementInterior ( player, 0 )
						setElementDimension ( player, 0 )
						if getElementData ( player, "jail" ) == "lv" then
							setElementPosition ( player, 2340.1567382813, 2451.8452148438, 14.62340164 )
							setPedRotation ( player, 180 )
						else
							setElementPosition ( player, -1605.675, 717.516, 12.006 )
						end
					end
				end
				if tonumber ( laGetElementData ( player, "jobtime" ) ) ~= 0 then
					laSetElementData ( player, "jobtime", tonumber ( laGetElementData ( player, "jobtime" ) ) - 1 )
				end
				local pname = getPlayerName ( player )
				_G[pname.."paydaytime"] = setTimer ( playingtime, 60000, 1, player )
				laSetElementData ( player, "lastcrime", "none" )
				if isOnDuty ( player ) or isArmy ( player ) then		
					if isArmy(player) then
						bonus = 1.3
					elseif isFBI(player) then
						bonus = 1.2
					else
						bonus = 1
					end
					local multiplicator = tonumber(laGetElementData ( player, "rang" ))/3+1
					laSetElementData ( player, "pdayincome", math.floor(laGetElementData ( player, "pdayincome" ) + multiplicator * 25 * bonus ) )
				end
				payday ( player )
				MySQL_SetString("userdata", "Bankgeld", math.floor ( laGetElementData ( player, "bankmoney") ), "Name LIKE '"..pname.."'")
				MySQL_SetString("userdata", "Geld", math.floor ( laGetElementData ( player, "money" ) ), "Name LIKE '"..pname.."'")
				--MySQL_SetString("userdata", "Bankgeld", MySQL_Save ( laGetElementData ( player, "bankmoney") ), "Name LIKE '"..pname.."'")
				--MySQL_SetString("userdata", "Geld", MySQL_Save ( laGetElementData ( player, "money" ) ), "Name LIKE '"..pname.."'")
				ReallifeAchievCheck ( player )
				if getPlayerPing ( player ) >= 350 then
					setTimer ( pingCheck, 5000, 1, player )
				end
				local z = ( laGetElementData ( player, "curplayingtime" ) / 5 )
				if z == math.floor ( z ) then
					datasave_remote ( player )
				end
				if not isPremium(player) then
					local curtime = getRealTime()
					local year = curtime.year + 1900
					local yearday = curtime.yearday+1
					if tonumber ( MySQL_GetString("bonustable", "PremiumUntilDay", "Name LIKE '" ..pname.."'") ) >= yearday or tonumber ( MySQL_GetString("bonustable", "PremiumUntilYear", "Name LIKE '" ..pname.."'") ) > year then
						checkPremium ( player )
					end
				end
			end
		end
	end
end


function highpingkick_func ( x, y, z, int, dim, armor )

	if not laGetElementData ( source, "shootingRanchGun" ) then
		local pname = MySQL_Save ( getPlayerName ( source ) )
		local int = tonumber ( MySQL_Save ( int ) )
		local dim = tonumber ( MySQL_Save ( dim ) )
		local curWeaponsForSave = "|"
		for i = 1, 12 do
			if i ~= 10 and i ~= 12 then
				local weapon = getElementData ( source, "weaponInSlot"..i )
				local ammo = getElementData ( source, "weaponInSlot"..i.."Ammo" )
				if weapon > 0 and ammo > 0 then
					if #curWeaponsForSave <= 40 then
						curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
					end
				end
			end
		end
		local armor = tonumber(armor)
		curWeaponsForSave = MySQL_Save ( curWeaponsForSave )
		pos = "|"..(math.floor(x*100)/100).."|"..(math.floor(y*100)/100).."|"..(math.floor(z*100)/100).."|"..int.."|"..dim.."|"
		if #curWeaponsForSave < 5 then
			curWeaponsForSave = ""
		end
		local result = mysql_la_query( "INSERT INTO logout (Position, Waffen, Name, Weste) VALUES ('"..pos.."', '"..curWeaponsForSave.."', '"..pname.."', '"..armor.."')")
		outputLog ( "[/HIGHPING]: Spieler "..pname.." hatte einen zu hohen Ping!", "save" )
		kickPlayer ( source, "Dein Ping ist zu hoch!" )
	else
		outputChatBox ( "Bugusing ist verboten.", source, 125, 0, 0 )
	end
end
addEvent ( "highpingpick", true )
addEventHandler ( "highpingpick", getRootElement(), highpingkick_func )


function pingCheck ( player )

	if not isElement(player) then
		return
	end
	if isAdmin ( player ) then
		if getPlayerPing ( player ) >= 500 then
			if getPlayerName ( player ) ~= "[LA]Leyynen" then
				local x, y, z = getElementPosition ( player )
				highpingkick_func (player, x, y, z, getElementInterior ( player ), getElementDimension ( player ), getPedArmor( player ) )
				outputChatBox ( "Aufgrund eines zu hohen Pings wurde "..getPlayerName(player).." gekickt!", getRootElement(), 125, 125, 125 )
			end
		end
	else
		if getPlayerPing ( player ) >= 400 then
			local x, y, z = getElementPosition ( player )
			triggerEvent ( "logoutPlayer", player, x, y, z, getElementInterior ( player ), getElementDimension ( player ), getPedArmor( player ) )
			outputChatBox ( "Aufgrund eines zu hohen Pings wurde "..getPlayerName(player).." gekickt!", getRootElement(), 125, 125, 125 )
		end
	end
end