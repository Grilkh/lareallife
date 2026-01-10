------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

---EINTRAGEN---
addEventHandler("onResourceStart", resourceRoot,
	function()
		--Jobs--
		team = createTeam("Busfahrer", settingBusTeamColor [ 1 ] , settingBusTeamColor [ 2 ], settingBusTeamColor [ 3 ]) -- Bus
		team = createTeam("Dealer", settingDrogendealerTeamColor [ 1 ] , settingDrogendealerTeamColor [ 2 ] , settingDrogendealerTeamColor [ 3 ]) -- Weeddealer
		team = createTeam("Farmer", settingFarmerTeamColor [ 1 ] , settingFarmerTeamColor [ 2 ], settingFarmerTeamColor [ 3 ]) -- Farmer
		team = createTeam("Fischer", settingFischerTeamColor [ 1 ] , settingFischerTeamColor [ 2 ] , settingFischerTeamColor [ 3 ]) -- Fischer
		team = createTeam("Flughafenmitarbeiter", settingFlughafenTeamColor [ 1 ] , settingFlughafenTeamColor [ 2 ], settingFlughafenTeamColor [ 3 ]) -- Flugjob
		team = createTeam("Gabelstaplerfahrer", settingGabelstaplerTeamColor [ 1 ] , settingGabelstaplerTeamColor [ 2 ], settingGabelstaplerTeamColor [ 3 ]) -- Gabelstapler
		team = createTeam("Hotdogverkaeufer", settingHotdogTeamColor [ 1 ] , settingHotdogTeamColor [ 2 ] , settingHotdogTeamColor [ 3 ]) -- Hotdog
		team = createTeam("Lieferant", settingLieferantTeamColor [ 1 ] , settingLieferantTeamColor [ 2 ], settingLieferantTeamColor [ 3 ]) -- Lieferant
		team = createTeam("Strassenreiniger", settingStrassenreinigungTeamColor [ 1 ] , settingStrassenreinigungTeamColor [ 2 ] , settingStrassenreinigungTeamColor [ 3 ]) -- Strassenreinigung
		team = createTeam("Taxifahrer", settingTaxiTeamColor [ 1 ] , settingTaxiTeamColor [ 2 ] , settingTaxiTeamColor [ 3 ]) -- Taxi
		team = createTeam("Trucker", settingTruckerTeamColor [ 1 ] , settingTruckerTeamColor [ 2 ], settingTruckerTeamColor [ 3 ]) -- Trucker
		--Anderes--
		team = createTeam("Drogendealer", settingDrogendealerTeamColor [ 1 ] , settingDrogendealerTeamColor [ 2 ] , settingDrogendealerTeamColor [ 3 ]) -- Drogenschiff
		team = createTeam("Waffendealer", settingWaffendealerTeamColor [ 1 ] , settingWaffendealerTeamColor [ 2 ] , settingWaffendealerTeamColor [ 3 ]) -- Waffentruck
		team = createTeam("Terror", settingTerrorTeamColor [ 1 ] , settingTerrorTeamColor [ 2 ], settingTerrorTeamColor [ 3 ]) -- Terror
		for index , player in ipairs ( getElementsByType ( "player" ) ) do
			if not isGuestAccount ( getPlayerAccount ( player ) ) then
				setTimer ( function ( ) loadPlayerData ( player , getPlayerAccount ( player ) ) end , 100 , 1 )
			end
		end
	end
)

---EINTRAGEN---
local jobsTable = {
	--Jobs--
	{ "Busfahrer" , settingBusCharName , settingBusCharSkinID , -1974.239, 478.692, 29.016, 0 , 0 , 90 , settingBusTeamColor } , -- Busfahrer
	{ "Dealer" , settingDealerCharName , settingDealerCharSkinID , -2109.357, 1.0, 35.32 , 0 , 0 , 180 , settingDealerTeamColor } , -- Weeddealer
	{ "Farmer" , settingFarmerCharName , settingFarmerCharSkinID , -1060.5999755859, -1205.5, 129.30000305176, 0 , 0 , 180 , settingFarmerTeamColor } , -- Farmer
	{ "Fischer" , settingFischerCharName , settingFischerCharSkinID , -1734.673, 1462.018, 7.188 , 0 , 0 , 260 , settingFischerTeamColor } , -- Fischer
	{ "Flughafenmitarbeiter" , settingFlughafenCharName , settingFlughafenCharSkinID , -1413.604, -297.983, 6.203125 , 0 , 0 , 135 , settingFlughafenTeamColor } , -- Flugjob	
	{ "Gabelstaplerfahrer" , settingGabelstaplerCharName , settingGabelstaplerCharSkinID , -2968.8000488281, 1231.5999755859, 5, 0 , 0 , 320 , settingGabelstaplerTeamColor } , -- Gabelstapler
	{ "Hotdogverkaeufer" , settingHotdogCharName , settingHotdogCharSkinID, -1699.98, 0.434, 3.555, 0 , 0 , 45 , settingHotdogTeamColor } , -- Hotdog
	{ "Lieferant" , settingLieferantCharName , settingLieferantCharSkinID , -1569.897, 131.55, 3.554, 0 , 0 , 180 , settingLieferantTeamColor } , -- Lieferant
	{ "Strassenreiniger" , settingStrassenreinigungCharName , settingStrassenreinigungCharSkinID , -1897.1510009766, -1671.5749511719, 22.664850234985, 0 , 0 , 270 , settingStrassenreinigungTeamColor } , -- Strassenreinigung
	{ "Taxifahrer" , settingTaxiCharName , settingTaxiCharSkinID , -2548.064, 672.6994, 27.973125, 0 , 0 , 280 , settingTaxiTeamColor } , -- Taxi
	{ "Trucker" , settingTruckerCharName , settingTruckerCharSkinID , -1838.64, 111.21, 15.117, 0 , 0 , 0 , settingTruckerTeamColor } , -- Trucker
	--Anderes--
	{ "Drogendealer" , settingDrogendealerCharName , settingDrogendealerCharSkinID , 2875.06, -2057.755, 8.74 , 0 , 0 , 270 , settingDrogendealerTeamColor } , -- Drogenschiff
	{ "Waffendealer" , settingWaffendealerCharName , settingWaffendealerCharSkinID , 2523.44, -1999.272, 13.546875 , 0 , 0 , 140 , settingWaffendealerTeamColor } -- Waffentruck
	--{ "Terror" , settingTerrorCharName , settingTerrorCharSkinID , 2196.275, -2031.85, 13.546875 , 0 , 0 , 180 , settingTerrorTeamColor }, -Terror
}

---EINTRAGEN---
for index , teamData in ipairs ( jobsTable ) do
	local teamName , charName , charSkin , posX , posY , posZ , interior , dimension , rotation , RGBTable = unpack ( teamData )
	local ped = createPed ( charSkin , posX , posY , posZ )
	outputDebugString("utils_server: 57 - PED erstellt ped")
	setElementRotation ( ped , 0 , 0 , rotation )
	setElementInterior ( ped , interior )
	setElementDimension ( ped , dimension )
	setElementData ( ped , "charName" , charName )
	setElementData ( ped , "teamName" , teamName )
	setElementData ( ped , "RGB" , RGBTable )
	setElementData ( ped, "undeadbarped", true )
	setElementData ( ped, "jobped", true )
	setElementFrozen ( ped , true )
	addEventHandler ( "onElementClicked" , ped ,
		function ( button , state , player )
			if button ~= "left" or state ~= "up" then
				return
			end
			local teamName = getElementData ( source , "teamName" )
			--Anderes--
			if teamName == "Drogendealer" then -- Drogenschiff
				if isEvil( player ) then
					triggerClientEvent ( player , "showBuyMerchandiseWnd" , player , teamName , settingDrogendealerTeamColor )
				else
					outputChatBox ( "Nur für böse Fraktionen!", player, 125, 0, 0 )
				end
			elseif teamName == "Waffendealer" then -- Waffentruck
				if laGetElementData ( player, "fraktion" ) == 2 or laGetElementData ( player, "fraktion" ) == 3 or laGetElementData ( player, "fraktion" ) == 7 then
					triggerClientEvent ( player , "ShowGuncenterGui" , player , teamName , settingWaffendealerTeamColor )
				else
					outputChatBox ( "Nur für böse Fraktionen!", player, 125, 0, 0 )
				end
			elseif teamName == "Terror" then -- Terror
				triggerClientEvent ( player , "client:showTeamCheckGUI" , player , teamName , settingTerrorTeamColor )
			--Jobs--
			elseif teamName == "Busfahrer" then -- Busfahrer
				if laGetElementData ( player, "job" ) == "bus" then
					triggerClientEvent ( player , "Busfahrer_GUI" , player )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingBusTeamColor )
				end
			elseif teamName == "Dealer" then -- Weeddealer
				if laGetElementData ( player, "job" ) == "dealer" then
					triggerClientEvent ( player , "_createDrugdealerGui" , player )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingDealerTeamColor )
				end
			elseif teamName == "Farmer" then -- Farmer
				if laGetElementData ( player, "job" ) == "farmer" then
					--triggerClientEvent ( player , "_createDrugdealerGui" , player )
					outputChatBox ( "Noch nicht überarbeitet.", player, 125, 0, 0 )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingFarmerTeamColor )
				end
			elseif teamName == "Fischer" then -- Fischer
				if laGetElementData ( player, "job" ) == "fischer" then
					outputChatBox ( "[AUFGABE]: Geh nach unten und schnapp dir ein Boot!", player, 0, 100, 200 )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingFischerTeamColor )
				end
			elseif teamName == "Flughafenmitarbeiter" then -- Flugjob
				if laGetElementData ( player, "job" ) == "airport" then
					triggerClientEvent ( player , "showAirportJobGui" , player )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingFlughafenTeamColor )
				end
			elseif teamName == "Gabelstaplerfahrer" then -- Gabelstapler
				if laGetElementData ( player, "job" ) == "gabelstapler" then
					if(getElementData(player, "IsInGabelJob") == true) then return end
						triggerClientEvent("onClientGabelstaplerJobHit", player)
						
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingGabelstaplerTeamColor )
				end
			elseif teamName == "Hotdogverkaeufer" then -- Hotdog
				if laGetElementData ( player, "job" ) == "hotdog" then
					--triggerClientEvent ( player , "_createDrugdealerGui" , player )
					outputChatBox ( "[AUFGABE]: Schnapp dir einen Hotdogwagen, belade ihn mit Fleisch und leg los!", player, 0, 100, 200)
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingHotdogTeamColor )
				end
			elseif teamName == "Lieferant" then -- Lieferant
				if laGetElementData ( player, "job" ) == "lieferant" then
					--triggerClientEvent ( player , "_createDrugdealerGui" , player )
					outputChatBox ( "Noch nicht überarbeitet.", player, 125, 0, 0 )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingLieferantTeamColor )
				end
			elseif teamName == "Strassenreiniger" then -- Strassenreinigung
				if laGetElementData ( player, "job" ) == "streetclean" then
					showCursor ( player, true )
					laSetElementData ( player, "ElementClicked", true )
					toggleAllControls ( player, false )
					triggerClientEvent ( player, "showStreetCleanGUI", getRootElement() )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingStrassenreinigungTeamColor )
				end
			elseif teamName == "Taxifahrer" then -- Taxi
				if laGetElementData ( player, "job" ) == "taxifahrer" then
					--triggerClientEvent ( player , "_createDrugdealerGui" , player )
					outputChatBox ( "[AUFGABE]: Geh und schnapp dir ein Taxi!", player, 0, 100, 200 )
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingTaxiTeamColor )
				end
			elseif teamName == "Trucker" then -- Trucker
				if laGetElementData ( player, "job" ) == "trucker" then
					laSetElementData ( player, "ElementClicked", true )
					triggerClientEvent ( player, "createTruckerGui", getRootElement() )
					if not getElementData ( player, "informationtruckerread" ) then
						outputChatBox ( "Du musst eine kleine Anzahlung machen, doch du kriegst das Vierfache als Belohnung zurück!", player, 0, 200, 0 )
						setElementData ( player, "informationtruckerread", true )
					end
				else
					triggerClientEvent ( player , "show_Job_Window" , player , teamName , settingTruckerTeamColor )
				end
			end
		end
	)
end

setTimer (
	function ( )
		createBlip ( 2875.06, -2057.755, 8.74 , settingDrogendealerHQBlip, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
		--createBlip ( 1310.185546875 , -1367.7626953125 , 13.540292739868 , settingSucherHQBlip )
		--createBlip ( 2747, -2576, 5.5059471130371 , settingShipBlip )
	end
, 100 , 1 )

function findTeam(name, resPlayer)
	local matches = {}
	for i, v in ipairs(getElementsByType("team")) do
		if getTeamName(v) == name then
			return v
		end
		local teamName = getTeamName(v):lower()
		if teamName:find(name:lower(), 0) then
			table.insert(matches, v)
		end
	end
	if #matches == 1 then
		return matches[1]
	else
		outputChatBox("Found "..#matches.." teams with that partial name", resPlayer)
	end
	return false
end

function findPlayer ( partialName , resPlayer )
	if partialName and resPlayer then
		local matches = {}
		for i, player in ipairs ( getElementsByType ( "player" ) ) do
			if getPlayerName ( player ) == partialName then
				return player
			end
			if getPlayerName ( player ) : gsub ( "#%x%x%x%x%x%x" , "" ) : lower ( ) : find ( partialName : lower ( ) ) then
				table.insert ( matches , player )
			end
		end
		if #matches == 1 then
			return matches [ 1 ]
		else
			outputChatBox ( "Found "..#matches.." matches" , resPlayer , 255 , 0 , 0 )
		end
	else
		outputDebugString ( "findPlayer Missing Arguments In Resource " .. getResourceName ( getThisResource ( ) ) , 3)
	end
	return false
end

function isPlayerInTeam(src, TeamName)
	if src and isElement ( src ) and getElementType ( src ) == "player" then
		local team = getPlayerTeam(src)
		if team then
			if getTeamName(team) == TeamName then
				return true
			else
				return false
			end
		end
	end
end

function isPlayerAdmin(player, right)
	if right then
		if hasObjectPermissionTo ( player, right, false ) then
			return true
		else
			return false
		end
	else
		outputDebugString("isPlayerAdmin Missing Arguments", 3)
	end
end

function isPlayerInRangeOfPoint(player, x, y, z, range)
	local px, py, pz = getElementPosition(player)
	return ((x-px)^2+(y-py)^2+(z-pz)^2)^0.5 <= range
end

function savePlayerData(player, account)
	if getPlayerTeam(player) then
		setAccountData(account, "team", getTeamName(getPlayerTeam(player)))
	else
		setAccountData(account, "team", nil)
	end
	if getElementData(player, "duty.Team") ~= false then
		setAccountData(account, "duty.Team", getElementData(player, "duty.Team"))
	end
end

function loadPlayerData(player, account)

	if not getAccountData(account, "team") == false then
		setPlayerTeam(player, getTeamFromName(getAccountData(account, "team")))
	end
	if getAccountData(account, "duty.Team") ~= false then
		setElementData(player, "duty.Team", getAccountData(account, "duty.Team"))
	end
end

addEventHandler("onPlayerLogin", root,
	function(_, account)
		loadPlayerData(source, account)
	end
)

addEventHandler("onResourceStop", resourceRoot,
	function()
		for i, v in ipairs(getElementsByType("player")) do
			if not isGuestAccount(getPlayerAccount(v)) then
				savePlayerData(v, getPlayerAccount(v))
			end
		end
	end
)

addEventHandler("onPlayerQuit", root,
	function()
		if isGuestAccount(getPlayerAccount(source)) then return end
		savePlayerData(source, getPlayerAccount(source))
	end
)

addEventHandler("onPlayerLogout", root,
	function(account, _)
		savePlayerData(source, account)
	end
)

---EINTRAGEN---
addEvent ( "server:sendSettings" , true )
addEventHandler ( "server:sendSettings" , root ,
	function ( )
		triggerClientEvent ( source , "client:recieveSettings" , source , settingDrogendealerTeamColor , settingWaffendealerTeamColor , settingBusTeamColor, settingDealerTeamColor, settingFarmerTeamColor, settingFischerTeamColor, settingFlughafenmitarbeiterTeamColor, settingGabelstaplerTeamColor, settingHotdogTeamColor, settingLieferantTeamColor, settingStrassenreinigungTeamColor, settingTaxiTeamColor, settingTruckerTeamColor, settingTerrorTeamColor)
	end
)

---EINTRAGEN---
addEvent ( "server:setPlayerTeam" , true )
addEventHandler ( "server:setPlayerTeam" , root ,
	function ( teamName )
		if teamName == "bus" then
			laSetElementData ( source, "job", "bus" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Busfahrer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "dealer" then
			laSetElementData ( source, "job", "dealer" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Dealer! Öffne das\nHilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
			setElementVisibleTo ( drugsblip, source, true )
			--triggerClientEvent ( source, "createDrugJobMarker", getRootElement() )
		end
		if teamName == "farmer" then
			laSetElementData ( source, "job", "farmer" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Farmer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "fischer" then
			laSetElementData ( source, "job", "fischer" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Fischer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "airport" then
			laSetElementData ( source, "job", "airport" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Flughafenmitarbeiter!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "gabelstapler" then
			laSetElementData ( source, "job", "gabelstapler" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Gabelstapler-Fahrer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "hotdog" then
			laSetElementData ( source, "job", "hotdog" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Hotdog-Verkäufer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "lieferant" then
			laSetElementData ( source, "job", "lieferant" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Lieferant!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "streetclean" then
			laSetElementData ( source, "job", "streetclean" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Strassenreiniger!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "taxifahrer" then
			laSetElementData ( source, "job", "taxifahrer" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Taxifahrer!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
		if teamName == "trucker" then
			laSetElementData ( source, "job", "trucker" )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist nun Trucker!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
		end
	end
)





local invulnerablePeds = {}

local ped
function createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )

	ped = createPed ( skin, x, y, z, rot )
	outputDebugString("utils_server: 374 - PED erstellt ped")
	setPedRotation ( ped, rot )
	laSetElementData ( ped, "x", x )
	laSetElementData ( ped, "y", y )
	laSetElementData ( ped, "z", z )
	laSetElementData ( ped, "rot", rot )
	setElementDimension ( ped, dim )
	setElementInterior ( ped, int )
	addEventHandler ( "onPedWasted", ped,
		function ()
			local x = laGetElementData ( source, "x" )
			local y = laGetElementData ( source, "y" )
			local z = laGetElementData ( source, "z" )
			local skin = getElementModel ( source )
			local dim = getElementDimension ( source )
			local int = getElementInterior ( source )
			local rot = laGetElementData ( source, "rot" )
			destroyElement ( source )
			createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )
			--[[ped = createPed ( skin, x, y, z, rot )
			laSetElementData ( ped, "x", x )
			laSetElementData ( ped, "y", y )
			laSetElementData ( ped, "z", z )
			laSetElementData ( ped, "rot", rot )
			setElementDimension ( ped, dim )
			setElementInterior ( ped, int )]]
		end
	)
end
-- SF
--createInvulnerableTicketPed ( 283, 238.91540527344, 112.89644622803, 1002.867980957, -90, 10, 0 )
-- LV
--createInvulnerableTicketPed ( 283, 293.81640625, 182.29084777832, 1006.821105957, 180 - 45, 3, 0 )

function createInvulnerablePed ( skin, x, y, z, rot, int, dim )

	if not int then
		int = 0
	end
	if not dim then
		dim = 0
	end
	local ped = createPed ( skin, x, y, z, rot )
	outputDebugString("utils_server: 417 - PED erstellt ped")
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	triggerClientEvent ( root, "makePedInvulnerable", root, ped )
	invulnerablePeds[ped] = true
	return ped
end

function syncInvulnerablePedsWithPlayer ()

	local player = source
	for key, index in pairs ( invulnerablePeds ) do
		if not isElement ( key ) then
			invulnerablePeds[key] = nil
		else
			triggerClientEvent ( player, "makePedInvulnerable", player, key )
		end
	end
end
addEvent ( "onLAPlayerLogin", true )
addEventHandler ( "onLAPlayerLogin", getRootElement(), syncInvulnerablePedsWithPlayer )