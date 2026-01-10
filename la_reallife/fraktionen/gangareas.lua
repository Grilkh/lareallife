gangColor = {}
	gangColor[0] = {}
		gangColor[0][1] = 200
		gangColor[0][2] = 200
		gangColor[0][3] = 200
	gangColor[2] = {}
		gangColor[2][1] = 10
		gangColor[2][2] = 10
		gangColor[2][3] = 10
	gangColor[3] = {}
		gangColor[3][1] = 30
		gangColor[3][2] = 170
		gangColor[3][3] = 170
	gangColor[7] = {}
		gangColor[7][1] = 255
		gangColor[7][2] = 215
		gangColor[7][3] = 0
	gangColor[9] = {}
		gangColor[9][1] = 0
		gangColor[9][2] = 50
		gangColor[9][3] = 0
	gangColor[10] = {}
		gangColor[10][1] = 100
		gangColor[10][2] = 0
		gangColor[10][3] = 100
		
gangName = { 
 [0]="Niemandem",
 [2]="Camorra",
 [3]="Yakuza",
 [7]="Surenos",
 [9]="Compton Families",
 [10]="Watts Soldiers"
 }
 
gangPraefix = {
 [2]="Camorra",
 [3]="Yakuza",
 [7]="Surenos",
 [9]="Compton Families",
 [10]="Watts Soldiers"
 }
 
validGangs = { 
 [2]=true,
 [3]=true,
 [7]=true,
 [9]=true,
 [10]=true
 }

areaTexts = {
 [1]="Gramm Weed",
 [2]="Gramm Weed",
 [3]="Gramm Kokain",
 [4]="Gramm Kokain",
 [5]="Gramm Kokain",
 [6]="Material",
 [7]="Gramm Weed",
 [8]="Material",
 [9]="Gramm Kokain",
 [10]="Material",
 [11]="Gramm Kokain",
 [12]="Material",
 [13]="Gramm Weed",
 [14]="Material",
 [15]="Material",
 [16]="Gramm Kokain",
 [17]="Gramm Weed",
 [18]="Gramm Weed"
 }

gangAreaUnderAttack = false
gangCount = 18
gangAreaConquerEach = 250

sec = 1000

function createGangAreas ()

	local gangCounter = 1
	local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '" ..gangCounter.."'") )
	while true do
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '" ..gangCounter.."'") )
		if Besitzer then
			local Einnahmen = MySQL_GetString("gangs", "Einnahmen", "ID LIKE '" ..tonumber(gangCounter).."'")
			local X1 = MySQL_GetString("gangs", "X1", "ID LIKE '" ..tonumber(gangCounter).."'")
			local Y1 = MySQL_GetString("gangs", "Y1", "ID LIKE '" ..tonumber(gangCounter).."'")
			local X2 = MySQL_GetString("gangs", "X2", "ID LIKE '" ..tonumber(gangCounter).."'")
			local Y2 = MySQL_GetString("gangs", "Y2", "ID LIKE '" ..tonumber(gangCounter).."'")
			
			local XS = math.abs(X1-X2)
			local YS = math.abs(Y1-Y2)
			
			local X3 = MySQL_GetString("gangs", "X3", "ID LIKE '" ..tonumber(gangCounter).."'")
			local Y3 = MySQL_GetString("gangs", "Y3", "ID LIKE '" ..tonumber(gangCounter).."'")
			local Z3 = MySQL_GetString("gangs", "Z3", "ID LIKE '" ..tonumber(gangCounter).."'")
			local Einnahmen = MySQL_GetString("gangs", "Einnahmen", "ID LIKE '" ..tonumber(gangCounter).."'")
			local r = gangColor[Besitzer][1]
			local g = gangColor[Besitzer][2]
			local b = gangColor[Besitzer][3]
			
			_G["gangArea"..gangCounter] = createRadarArea ( X1, Y1, XS, YS, r, g, b, 200, getRootElement() )
			
			_G["gangPickup"..gangCounter] = createPickup ( X3, Y3, Z3, 3, 1313, 1, 9999 )
			laSetElementData ( _G["gangPickup"..gangCounter], "gang", Besitzer )
			laSetElementData ( _G["gangPickup"..gangCounter], "id", gangCounter )
			laSetElementData ( _G["gangPickup"..gangCounter], "einnahmen", Einnahmen )
			laSetElementData ( _G["gangPickup"..gangCounter], "isUnderAttack", false )
			laSetElementData ( _G["gangPickup"..gangCounter], "Blocked", false )
			
			addEventHandler ( "onPickupHit", _G["gangPickup"..gangCounter], gangPickupHit )
			
			  local x,y = getElementPosition (_G["gangArea"..gangCounter])
			  local sx,sy = getRadarAreaSize (_G["gangArea"..gangCounter])
			  local col = createColCuboid (x,y, -50, sx,sy, 7500)
			  setElementID (col, "gangareaColshape")	
			  
			gangCounter = gangCounter + 1
		else
			break
		end
	end
	-- setTimer ( gangAreaBoni, 30*60*1000, -1 )
	setTimer ( gangAreaBoni, 30*60*1000, 0 )
	-- setTimer ( gangAreaEinnahmen, 10*60*1000, -1 )
	setTimer ( gangAreaEinnahmen, 10*60*1000, 0 )
end
addEventHandler ( "onResourceStart", getRootElement(), createGangAreas )


addEventHandler ("onColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
  if (getElementType (hitElement) == "player") and (getElementID (source) == "gangareaColshape") then
	if getElementData ( hitElement, "sprache" ) == "Deutsch" then
		infobox ( hitElement, "\n\nDu hast ein Ganggebiet betreten!\nPass auf dich auf!", 5000, 125, 0, 0 )
	else
		infobox ( hitElement, "\n\nYou are entering a gang area!", 5000, 125, 0, 0 )	
	end
	setElementData ( hitElement, "isInGangArea", true)
  end
end)


function gangAreaBoni ()

	for i = 1, gangCount do
		local pickup = _G["gangPickup"..i]
		local owner = laGetElementData ( pickup, "gang" )
		if validGangs[owner] then
			local id = laGetElementData ( pickup, "id" )
			if areaTexts[id] then
				if (id == 1) or (id == 2) or (id == 7) or (id == 13) or (id == 17) or (id == 18) then
					local gang = owner
					local drugs = MySQL_GetString("fraktionen", "DepotDrogen", "ID LIKE '"..gang.."'")
					local drugsnew = drugs + 1
					--outputDebugString ( tostring ( drugsnew ) )
					MySQL_SetString("fraktionen", "DepotDrogen", drugsnew, "ID LIKE '"..gang.."'")
				elseif (id == 6) or (id == 8) or (id == 10) or (id == 12) or (id == 14) or (id == 15) then
					local gang = owner
					local mats = MySQL_GetString("fraktionen", "DepotMaterials", "ID LIKE '"..gang.."'")
					local matsnew = mats + 1
					--outputDebugString ( tostring ( matsnew ) )
					MySQL_SetString("fraktionen", "DepotMaterials", matsnew, "ID LIKE '"..gang.."'")
				elseif (id == 3) or (id == 4) or (id == 5) or (id == 9) or (id == 11) or (id == 16) then
					local gang = owner
					local koks = MySQL_GetString("fraktionen", "DepotKokain", "ID LIKE '"..gang.."'")
					local koksnew = koks + 1
					--outputDebugString ( tostring ( matsnew ) )
					MySQL_SetString("fraktionen", "DepotKokain", koksnew, "ID LIKE '"..gang.."'")
				end
			end
		end
	end
end

function gangAreaEinnahmen ()

	for i = 1, gangCount do
		local pickup = _G["gangPickup"..i]
		local owner = laGetElementData ( pickup, "gang" )
		if validGangs[owner] then
			local id = laGetElementData ( pickup, "gang" )
			local gang = owner
			local money = MySQL_GetString("fraktionen", "DepotGeld", "ID LIKE '"..gang.."'")
			local moneynew = money + laGetElementData ( pickup, "einnahmen" )
			--outputDebugString ( tostring ( moneynew ) )
			MySQL_SetString("fraktionen", "DepotGeld", moneynew, "ID LIKE '"..gang.."'")
		end
	end
end

function gangPickupHit ( hit )

	outputChatBox ( "Dieses Ganggebiet gehört: "..gangName[laGetElementData ( source, "gang" )], hit, 125, 125, 200 )
	if areaTexts [ laGetElementData ( source, "id" ) ] then
		bonus = "1 "..areaTexts [ laGetElementData ( source, "id" ) ].." / 30 Minuten"
	else
		bonus = "-"
	end
	outputChatBox ( "Einnahmen/Stunde: "..( laGetElementData ( source, "einnahmen" ) * 6 )..", Sonstige Boni: "..bonus, hit, 125, 125, 200 )
	local fraktion = laGetElementData ( hit, "fraktion" )
	if laGetElementData ( hit, "rang" ) >= 3 and validGangs[fraktion] then
		outputChatBox ( "Tippe /attack, um einen Angriff zu starten!", hit, 150, 0, 0 )
	end
end

function attack_func ( player )
	
	if validGangs[laGetElementData ( player, "fraktion" )] and laGetElementData ( player, "rang" ) >= 3 then
		local x1, y1, z1 = getElementPosition ( player )
		sucess = false
		validID = nil
		for i = 1, gangCount do
			local x2, y2, z2 = getElementPosition ( _G["gangPickup"..i] )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
				validID = i
				sucess = true
				break
			end
		end
		if sucess then
			local pickup = _G["gangPickup"..validID]
			local owner = tonumber ( laGetElementData ( pickup, "gang" ) )
			if owner ~= laGetElementData ( player, "fraktion" ) then
				--Sicherheitshinweis--
				if getFactionMembersOnline ( owner ) >= 3 then
					if not gangAreaUnderAttack then
						if not laGetElementData ( pickup, "Blocked" ) then
							startGangAreaAttack ( player, pickup, owner, validID )
						else
							outputChatBox ( "Dieses Gebiet wurde heute bereits angegriffen!", player, 125, 0, 0 )
						end
					else
						outputChatBox ( "Es kann immer nur ein Angriff zur selben Zeit stattfinden!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Es müssen mindestens 3 Mitglieder der verteidigenden Gang online sein!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du kannst nicht dein eigenes Gebiet angreifen!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist bei keinem Ganggebiet!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "attack", attack_func )

function startGangAreaAttack ( player, pickup, owner, id )

	local attackerfrac = laGetElementData ( player, "fraktion" )
	local area = _G["gangArea"..id]
	gangAreaUnderAttack = true
	setRadarAreaFlashing ( area, true )
	setRadarAreaColor ( area, 125, 0, 0, 200 )
	laSetElementData ( pickup, "isUnderAttack", true )
	eroberungsTimer = setTimer ( areaEroberungsCheck, 30*sec, -1, area, attackerfrac, owner, pickup )
	victoryTimer = setTimer ( areaFinishCheck, 15*60*sec, -1, area, attackerfrac, owner, pickup, id )
	sendMSGForFaction ( "Die "..gangName[attackerfrac].." greifen eines eurer Gebiete an!", owner, 150, 0, 0 )
	sendMSGForFaction ( "Ihr habt 15 Minuten Zeit, um euer Gebiet zu verteidigen. Ansonsten verliert ihr es!", owner, 150, 0, 0 )
	outputChatBox ( "Du hast einen Angriff gegen die "..gangName[owner].." gestartet!", player, 0, 150, 0 )
	sendMSGForFaction ( "Haltet die "..gangName[owner].." 15 Minuten lang vom Totenkopf fern, um das Gebiet zu erobern!", attackerfrac, 0, 150, 0 )
	outputLog( "[GANGWAR]: "..getPlayerName(player).." ("..gangName[attackerfrac]..") hat die "..gangName[owner].." attackt!", "bad")
	
	
	createVehicles ( area )
	gangwararea = "angriffstand"
	killTimer (zehnminutengangwar)
	killTimer (fuenfminutengangwar)
	killTimer (eineminutengangwar)
	setTimer(zehnminutengangwar, 300000, 1)
	local msg = "[INFO]: Die "..gangName[attackerfrac].." haben einen Gangwar gegen die "..gangName[owner].." gestartet!"
		sendMSGForFaction ( msg, 2, 100, 100, 0 )
		sendMSGForFaction ( msg, 3, 100, 100, 0 )
		sendMSGForFaction ( msg, 7, 100, 100, 0 )
		sendMSGForFaction ( msg, 9, 100, 100, 0 )
		sendMSGForFaction ( msg, 10, 100, 100, 0 )
end

function zehnminutengangwar()
	if gangwararea == "angriffstand" then
		local msg = "[INFO]: Der Gangwar dauert noch 10 Minuten."
		sendMSGForFaction ( msg, 2, 100, 100, 0 )
		sendMSGForFaction ( msg, 3, 100, 100, 0 )
		sendMSGForFaction ( msg, 7, 100, 100, 0 )
		sendMSGForFaction ( msg, 9, 100, 100, 0 )
		sendMSGForFaction ( msg, 10, 100, 100, 0 )
		setTimer(fuenfminutengangwar, 300000, 1)
	end
end

function fuenfminutengangwar()
	if gangwararea == "angriffstand" then
		local msg = "[INFO]: Der Gangwar dauert noch 5 Minuten."
		sendMSGForFaction ( msg, 2, 100, 100, 0 )
		sendMSGForFaction ( msg, 3, 100, 100, 0 )
		sendMSGForFaction ( msg, 7, 100, 100, 0 )
		sendMSGForFaction ( msg, 9, 100, 100, 0 )
		sendMSGForFaction ( msg, 10, 100, 100, 0 )
		setTimer(eineminutengangwar, 240000, 1)
	end
end

function eineminutengangwar()
	if gangwararea == "angriffstand" then
		local msg = "[INFO]: Der Gangwar dauert noch 1 Minute."
		sendMSGForFaction ( msg, 2, 100, 100, 0 )
		sendMSGForFaction ( msg, 3, 100, 100, 0 )
		sendMSGForFaction ( msg, 7, 100, 100, 0 )
		sendMSGForFaction ( msg, 9, 100, 100, 0 )
		sendMSGForFaction ( msg, 10, 100, 100, 0 )
	end
end

function createVehicles ( area )
if area == _G["gangArea1"] then
	GangwarBurrito1 = createVehicle ( 482, -2630.29932, 1345.35999, 7.11159, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2630.42603, 1348.93433, 7.02424, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2630.57520, 1352.38257, 7.01860, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2630.82446, 1355.12390, 7.07561, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2638.08765, 1353.86719, 6.7461, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2637.16138, 1345.89026, 6.73792, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2636.67798, 1350.09912, 6.84829, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea2"] then
	GangwarBurrito1 = createVehicle ( 482, -2315.78711, -123.51726, 35.29749, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2319.52368, -123.66209, 35.29770, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2323.05029, -123.68397, 35.30185, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2326.91748, -123.67110, 35.29868, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2334.04614, -124.57731, 34.89124, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2338.18628, -124.71746, 34.89869, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2330.47217, -124.15515, 34.98221, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea3"] then
	GangwarBurrito1 = createVehicle ( 482, -2145.29, -185.65, 35.3, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2145.29, -190.78, 35.3, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2134.41, -192.334, 35.304, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2134.41, -185.44, 35.304, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2143.574, -200.911, 34.906, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2148.974, -200.911, 34.906, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2145.75, -205.41, 34.98, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea4"] then
	GangwarBurrito1 = createVehicle ( 482, -2108.07202, -899.10248, 32.15488, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2108.07813, -905.04944, 32.15435, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2112.25342, -905.40265, 32.14865, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2112.30298, -898.98486, 32.15934, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2119.49731, -906.06097, 31.74874, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2120.00513, -899.72327, 31.61066, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2115.67358, -899.52325, 31.68963, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea5"] then
	GangwarBurrito1 = createVehicle ( 482, -2730.09, -321.97, 7.174, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2733.04, -325.72, 7.174, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2709.7, -301.42, 7.1635, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2716.757, -308.08, 7.163, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2736.56, -330.3, 6.82, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2702.787, -295.774, 6.7724, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2742.98, -336.245, 6.837, 0, 0, 215, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea6"] then
	GangwarBurrito1 = createVehicle ( 482, -2270.6733, 2312.816, 4.8135, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -2270.6733, 2306.770, 4.8135, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -2270.6733, 2300.770, 4.8135, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -2270.6733, 2318.770, 4.8135, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -2252.67, 2321.356, 4.379, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -2252.67, 2309.356, 4.379, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -2252.67, 2315.7, 4.379, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea7"] then
	GangwarBurrito1 = createVehicle ( 482, 422.52713, 2525.53809, 16.51441, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 419.68903, 2525.22900, 16.50123, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 419.42621, 2531.87866, 16.57951, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 422.14194, 2531.88745, 16.58207, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 424.86090, 2530.86060, 16.17007, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 428.14288, 2531.07104, 16.16661, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 431.44928, 2533.31030, 16.12527, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea8"] then
	GangwarLimo1 = createVehicle ( 487, -1367.4265, 1490.2, 11.17, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea9"] then
	GangwarBurrito1 = createVehicle ( 482, -1307.93860, 2520.09351, 87.27991, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -1304.14246, 2520.06250, 87.28335, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -1297.72583, 2520.08936, 87.31665, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -1293.64111, 2520.40503, 87.30233, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -1295.40479, 2512.94678, 86.64656, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -1308.00000, 2512.43970, 86.64408, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -1301.08887, 2521.54761, 87.06674, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea10"] then
	GangwarBurrito1 = createVehicle ( 482, 205.65933, 1446.81677, 10.56534, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 202.33141, 1446.96875, 10.57761, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 196.16016, 1447.58252, 10.54251, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 199.23846, 1447.45740, 10.54695, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 192.99628, 1447.07239, 10.17466, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 186.44661, 1447.08362, 10.14238, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 190.01039, 1447.02539, 10.26742, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea11"] then
	GangwarBurrito1 = createVehicle ( 482, 1074.13965, 1080.78748, 10.82542, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 1078.29114, 1085.02588, 10.82933, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 1098.04285, 1085.26233, 10.82697, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 1093.65186, 1087.95740, 10.81933, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 1087.80212, 1087.51929, 10.41246, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 1083.79565, 1086.91125, 10.42244, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 1086.68457, 1080.29077, 10.49935, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea12"] then
	GangwarBurrito1 = createVehicle ( 482, 1674.29358, 1000.19904, 10.80371, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 1670.93579, 1000.02667, 10.80708, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 1667.66907, 1000.02246, 10.79266, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 1664.81848, 1000.11609, 10.80039, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 1654.83179, 999.03381, 10.39611, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 1658.11084, 999.12805, 10.40012, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 1661.40698, 1001.66028, 10.47910, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea13"] then
	GangwarIntruder1 = createVehicle ( 487, 1367.07068, 2161.96143, 11.12567, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 487, 1363.22437, 2162.06787, 11.10866, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
elseif area == _G["gangArea14"] then
	GangwarBurrito1 = createVehicle ( 482, -470.29998779297, -488.5, 25.700000762939, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -475.29998779297, -488.5, 25.700000762939, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -480.29998779297, -488.5, 25.700000762939, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -485.60000610352, -488.5, 25.700000762939, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -490.20001220703, -488.39999389648, 25.39999961853, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -495.29998779297, -488.39999389648, 25.39999961853, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -505.39999389648, -487.5, 25.299999237061, 0, 0, 180, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea15"] then
	GangwarBurrito1 = createVehicle ( 482, -1006.5, -681.59997558594, 32.200000762939, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -1006.4000244141, -679, 32.200000762939, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -1006.4000244141, -676.5, 32.200000762939, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -1006.4000244141, -674, 32.200000762939, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -1006.0999755859, -671.40002441406, 31.89999961853, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -1006.0999755859, -668.90002441406, 31.89999961853, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -1005.299987793, -686.79998779297, 31.799999237061, 0, 0, 90, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea16"] then
	GangwarBurrito1 = createVehicle ( 482, 1079.5999755859, -1611.1999511719, 20.700000762939, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 1082.5, -1611.0999755859, 20.700000762939, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 1085.5, -1611.0999755859, 20.700000762939, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 1088.6999511719, -1611.0999755859, 20.700000762939, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 1096.5999755859, -1611, 20.39999961853, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 1100.3000488281, -1611, 20.39999961853, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 1107.1999511719, -1610.1999511719, 20.39999961853, 0, 0, 0, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea17"] then
	GangwarBurrito1 = createVehicle ( 482, 1865.8000488281, -1408, 13.699999809265, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, 1865.8000488281, -1410.8000488281, 13.699999809265, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, 1865.8000488281, -1413.5, 13.699999809265, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, 1865.8000488281, -1416.4000244141, 13.699999809265, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, 1865.1999511719, -1401.8000488281, 13.39999961853, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, 1865.1999511719, -1404.9000244141, 13.39999961853, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, 1866.1999511719, -1395.3000488281, 13.39999961853, 0, 0, 270, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
elseif area == _G["gangArea18"] then
	GangwarBurrito1 = createVehicle ( 482, -429.5, 2261.5, 42.599998474121, 359.70336914063, 0.0439453125, 196.24877929688, "GANGWAR" )
	setVehicleColor ( GangwarBurrito1, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito1, 10000 )
	GangwarBurrito2 = createVehicle ( 482, -426.19921875, 2262.5, 42.599998474121, 359.70336914063, 0.0439453125, 196.24877929688, "GANGWAR" )
	setVehicleColor ( GangwarBurrito2, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito2, 10000 )
	GangwarBurrito3 = createVehicle ( 482, -423, 2263.3994140625, 42.599998474121, 359.70336914063, 0.0439453125, 196.24877929688, "GANGWAR" )
	setVehicleColor ( GangwarBurrito3, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito3, 10000 )
	GangwarBurrito4 = createVehicle ( 482, -419.3994140625, 2264.3994140625, 42.599998474121, 359.70336914063, 0.0439453125, 196.24877929688, "GANGWAR" )
	setVehicleColor ( GangwarBurrito4, 1, 1, 0, 0 )
	setElementHealth ( GangwarBurrito4, 10000 )
	GangwarIntruder1 = createVehicle ( 546, -413.10000610352, 2267.1000976563, 42.299999237061, 0, 0, 195.99609375, "GANGWAR" )
	setVehicleColor ( GangwarIntruder1, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder1, 10000 )
	GangwarIntruder2 = createVehicle ( 546, -409.236, 2268.85, 41.679, 0, 0, 195.99609375, "GANGWAR" )
	setVehicleColor ( GangwarIntruder2, 1, 1, 0, 0 )
	setElementHealth ( GangwarIntruder2, 10000 )
	GangwarLimo1 = createVehicle ( 409, -416.20001220703, 2266.3000488281, 42.299999237061, 0, 0, 196, "GANGWAR" )
	setVehicleColor ( GangwarLimo1, 1, 1, 0, 0 )
	setElementHealth ( GangwarLimo1, 10000 )
end
end

function destroyVehicles ()

destroyElement ( GangwarBurrito1 )
destroyElement ( GangwarBurrito2 )
destroyElement ( GangwarBurrito3 )
destroyElement ( GangwarBurrito4 )
destroyElement ( GangwarIntruder1 )
destroyElement ( GangwarIntruder2 )
destroyElement ( GangwarLimo1 )

end

function areaEroberungsCheck ( area, attackers, owner, pickup )

	suc = false
	for id, playeritem in ipairs ( getElementsByType( "player" ) ) do
		if tonumber ( laGetElementData ( playeritem, "fraktion" ) ) == tonumber ( attackers ) then
			local x1, y1, z1 = getElementPosition ( pickup )
			local x2, y2, z2 = getElementPosition ( playeritem )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 50 and not isPedDead ( playeritem ) then
				suc = true
				break
			end
		end
	end
	if not suc then
		setRadarAreaFlashing ( area, false )
		local r = gangColor[owner][1]
		local g = gangColor[owner][2]
		local b = gangColor[owner][3]
		setRadarAreaColor ( area, r, g, b, 200 )
		sendMSGForFaction ( "Die "..gangName[owner].." konnten ihr Gebiet erfolgreich verteidigen!", attackers, 150, 0, 0 )
		sendMSGForFaction ( "Gebiet erfolgreich gegen die "..gangName[attackers].." verteidigt!", owner, 0, 150, 0 )
		laSetElementData ( pickup, "isUnderAttack", false )
		laSetElementData ( pickup, "Blocked", true)
		gangAreaUnderAttack = false
		killTimer ( eroberungsTimer )
		killTimer ( victoryTimer )
		destroyVehicles ()
	local msg = "[INFO]: Die "..gangName[owner].." haben ihr Gebiet erfolgreich gegen die "..gangName[attackers].." verteidigt!"
	sendMSGForFaction ( msg, 2, 100, 100, 0 )
	sendMSGForFaction ( msg, 3, 100, 100, 0 )
	sendMSGForFaction ( msg, 7, 100, 100, 0 )
	sendMSGForFaction ( msg, 9, 100, 100, 0 )
	sendMSGForFaction ( msg, 10, 100, 100, 0 )
	gangwararea = "fertig"
	outputLog( "[GANGWAR]: Die "..gangName[owner].." haben ihr Gebiet  gegen die "..gangName[attackers].." verteidigt!", "bad")
	end
end

function areaFinishCheck ( area, attackers, owner, pickup, id )

	setRadarAreaFlashing ( area, false )
	sendMSGForFaction ( "Das Gebiet der "..gangName[owner].." erfolgreich erobert!", attackers, 0, 150, 0 )
	sendMSGForFaction ( "Ihr habt euer Gebiet an die "..gangName[attackers].." verloren!", owner, 150, 0, 0 )
		
	laSetElementData ( pickup, "isUnderAttack", false )
	gangAreaUnderAttack = false
	destroyVehicles ()
	laSetElementData ( pickup, "gang", attackers )
	laSetElementData ( pickup, "Blocked", true)
	MySQL_SetString("gangs", "BesitzerFraktion", attackers, "ID LIKE '"..id.."'")
	
	local r = gangColor[attackers][1]
	local g = gangColor[attackers][2]
	local b = gangColor[attackers][3]
	setRadarAreaColor ( area, r, g, b, 200 )
	
	for id, playeritem in ipairs ( getElementsByType( "player" ) ) do
		if tonumber ( laGetElementData ( playeritem, "fraktion" ) ) == tonumber ( attackers ) then
			givePlayerSaveMoney ( playeritem, gangAreaConquerEach )
			triggerClientEvent ( playeritem, "achievsound", getRootElement() )
		end
	end
	
	killTimer ( eroberungsTimer )
	killTimer ( victoryTimer )
	
	local msg = "Die "..gangName[attackers].." haben das Gebiet der "..gangName[owner].." erfolgreich erobert!"
	sendMSGForFaction ( msg, 2, 100, 100, 0 )
	sendMSGForFaction ( msg, 3, 100, 100, 0 )
	sendMSGForFaction ( msg, 7, 100, 100, 0 )
	sendMSGForFaction ( msg, 9, 100, 100, 0 )
	sendMSGForFaction ( msg, 10, 100, 100, 0 )
	gangwararea = "fertig"
	outputLog( "[GANGWAR]: Die "..gangName[attackers].." haben das Gebiet der "..gangName[owner].." erobert!", "bad")
end

function isReallyInsideRadarArea ( theArea, x, y )
    local posX, posY = getElementPosition ( theArea )
    local sizeX, sizeY = getRadarAreaSize ( theArea )
    if getDistanceBetweenPoints2D ( x, y, posX, posY ) <= 100 then
		return true
	else
		return false
	end
end
isInsideRadarArea = nil


function setAreaBlocked_func ( player, cmd, area )
	if isSMod (player) then
		if tonumber(area) then
			if (tonumber(area) > 0) and (tonumber(area) <= 18) then
				if laGetElementData (_G["gangPickup"..tonumber(area)], "Blocked") == true then
					laSetElementData ( _G["gangPickup"..area], "Blocked", false )
					outputChatBox ( "Du hast den Angriffsschutz des Ganggebiets "..area.." deaktiviert!", player, 200, 200, 0 )
					local msg = ""..getPlayerName ( player ).." hat den Angriffschutz des Ganggebiets "..area.." deaktiviert."
					sendMSGForFaction ( msg, 2, 100, 100, 0 )
					sendMSGForFaction ( msg, 3, 100, 100, 0 )
					sendMSGForFaction ( msg, 7, 100, 100, 0 )
					sendMSGForFaction ( msg, 9, 100, 100, 0 )
					sendMSGForFaction ( msg, 10, 100, 100, 0 )
					outputLog ( "[GANGWAR]: "..getPlayerName ( player ).." hat den Angriffschutz des Ganggebiets "..area.." deaktiviert.", "admin" )
				else
					laSetElementData ( _G["gangPickup"..area], "Blocked", true )
					outputChatBox ( "Du hast den Angriffsschutz des Ganggebiets "..area.." aktiviert!", player, 200, 200, 0 )
					local msg = ""..getPlayerName ( player ).." hat den Angriffschutz des Ganggebiets "..area.." aktiviert."
					sendMSGForFaction ( msg, 2, 100, 100, 0 )
					sendMSGForFaction ( msg, 3, 100, 100, 0 )
					sendMSGForFaction ( msg, 7, 100, 100, 0 )
					sendMSGForFaction ( msg, 9, 100, 100, 0 )
					sendMSGForFaction ( msg, 10, 100, 100, 0 )
					outputLog ( "[GANGWAR]: "..getPlayerName ( player ).." hat den Angriffschutz des Ganggebiets "..area.." aktiviert.", "admin" )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /areareset [1-18]!", 5000, 255, 0, 0 )
				outputChatBox ( "Verwende /ganggebiete, um eine Übersicht der Ganggebiete zu sehen! ", player, 200, 200, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /areareset [1-18]!", 5000, 255, 0, 0 )
			outputChatBox ( "Verwende /ganggebiete, um eine Übersicht der Ganggebiete zu sehen! ", player, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "areareset", setAreaBlocked_func )

function GangAreasOverview_func ( player, cmd )
	if isSupporter (player) or isEvil (player) then
		outputChatBox ( "Ganggebiete:", player, 200, 200, 0 )
		local areanumber = 1
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Jizzys: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 2
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Burgershot: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 3
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Drogenlabor: "..gangName[Besitzer]..", ", player, r, g, b )

		local areanumber = 4
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Universität: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 5
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Golfclub: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 6
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Bayside: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 7
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Flugzeugfriedhof: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 8
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Schiff: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 9
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Ruine: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 10
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Green Palms (Raffinerie): "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 11
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". College: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 12
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Depot: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 13
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Baseballstadion: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 14
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Fallen Tree (Lagerhalle): "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 15
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Fabrik: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 16
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Verona Center: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 17
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Glen Park: "..gangName[Besitzer]..", ", player, r, g, b )
		
		local areanumber = 18
		local Besitzer = tonumber ( MySQL_GetString("gangs", "BesitzerFraktion", "ID LIKE '"..areanumber.."'") )
		if laGetElementData (_G["gangPickup"..areanumber], "Blocked") == true then
			r, g, b = 150, 0, 0
		else
			r, g, b = 0, 150, 0
		end
		outputChatBox ( ""..areanumber..". Geisterstadt: "..gangName[Besitzer].."", player, r, g, b )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Verbrecher/Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "ganggebiete", GangAreasOverview_func )