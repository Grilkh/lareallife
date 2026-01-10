local maxnail = 2
local nailavai = false
local nail_cars = {}

for i = 1, 700 do
	nail_cars[i] = false
end

nail_cars[433] = true
nail_cars[427] = true 
--nail_cars[490] = true 
--nail_cars[528] = true 
--nail_cars[523] = true 
--nail_cars[470] = true 
--nail_cars[598] = true 
--nail_cars[597] = true 
--nail_cars[596] = true 
--nail_cars[599] = true 
--nail_cars[601] = true 

local nail_factions = {}

for i = 1, 10, 1 do
	nail_factions[i] = false
end

nail_factions[1] = true
nail_factions[6] = true
nail_factions[8] = true

local nail_tut = {}

local nail_pickups = {} -- Aufladepickups
nail_pickups[1] = createPickup ( -1622.7950439453, 659.85522460938, -5.619252204895, 3, 1239, 1, 0 )
nail_pickups[2] = createPickup ( 131.944, 1849.616, 17.685, 3, 1239, 1, 0 )
nail_pickups[3] = createPickup ( -2440.9819335938, 523.67584228516, 29.529811859131, 3, 1239, 1, 0 )
nail_pickups[4] = createPickup ( -1242.656, 455.242, 7.188, 3, 1239, 1, 0 )

local nail_cols = {} -- Aufladecolspheres
nail_cols[1] = createColSphere ( -1622.7950439453, 659.85522460938, -5.619252204895, 3 )
nail_cols[2] = createColSphere ( 131.944, 1849.616, 17.685, 3 )
nail_cols[3] = createColSphere ( -2440.9819335938, 523.67584228516, 29.529811859131, 3 )
nail_cols[4] = createColSphere ( -1242.656, 455.242, 7.188, 3 )

nail_tut[nail_cols[1]] = true
nail_tut[nail_cols[2]] = true
nail_tut[nail_cols[3]] = true
nail_tut[nail_cols[4]] = true

-- kann Spieler ein Band legen?

local nail_ifBand = {}

-- Nagelbaender an sich

local n_Baender = {}
local n_ColBaender = {}

-- EventHandler

function nails_avai ()
	nailavai = true
end

function nail_resstart ( )
	setTimer ( nails_avai, 60000, 1 )
end

addEventHandler ( "onResourceStart", getResourceRootElement( getThisResource() ), nail_resstart )

for i, col in pairs ( nail_cols ) do
	addEventHandler ( "onColShapeHit", col,
		function ( element, dim )
			if dim and nail_tut[source] then
				if getElementType( element ) == "vehicle" then				
					local trigger = getVehicleOccupant ( element )							
					if ( nailavai == true ) and isElement(trigger) then
						outputChatBox ( "Verwende /nails, um Nagelbänder aufzuladen. Dies ist nur in einem Enforcer/Barracks möglich.", trigger, 0, 100, 0 )
					end													
				elseif getElementType( element ) == "player" and getPedOccupiedVehicleSeat( element ) ~= 0 then				
					if nailavai == true and isElement(element) then
						outputChatBox ( "Um Nagelbänder aufzuladen, setze dich in einen Enforcer/Barracks und komm hier hin zurück.", element, 200, 200, 0 )
					end
				end			
			end		
		end )
end
	
-- Commands
	
addCommandHandler ( "nails", 
	function ( player, command )
		local fraktion = tonumber(getElementData( player, "fraktion" ))
		local rang = tonumber(getElementData( player, "rang" ))
		local seat = getPedOccupiedVehicleSeat ( player )
		
		n_inCol = false
		
		for i, col in pairs ( nail_cols ) do
			if isElementWithinColShape( player, col ) then			
				n_inCol = true			
			end		
		end		
		if nail_factions[fraktion] and n_inCol and rang >= 3 then		
			local veh = getPedOccupiedVehicle ( player )		
			if not veh or seat ~= 0 then	
				if isElement( player ) then outputChatBox ( "Du bist in keinem Fahrzeug oder nicht auf dem Fahrersitz!", player, 150, 0, 0 ) end			
			else			
				if nail_cars[getElementModel(veh)] or federalVehicles[veh] then			
					local loadedNails = getElementData( veh, "Nagelbaender" )					
					if loadedNails == false then				
						setElementData( veh, "Nagelbaender", maxnail )
						if isElement( player ) then outputChatBox ( "Du hast "..tostring(maxnail).." Nagelbänder aufgeladen.", player, 0, 150, 0 ) end
						if isElement( player ) then outputChatBox ( "Verwende /usenail [Anzahl], um die Nagelbänder zu verwenden.", player, 150, 150, 0 ) end					
					else					
						if tonumber(loadedNails) < maxnail then						
							setElementData( veh, "Nagelbaender", maxnail )
							if isElement( player ) then outputChatBox ( "Du hast "..tostring(maxnail).." Nagelbänder aufgeladen.", player, 0, 150, 0 ) end
							if isElement( player ) then outputChatBox ( "Verwende /usenail [Anzahl], um die Nagelbänder zu verwenden.", player, 150, 150, 0 ) end
						else
							outputChatBox ( "Das Fahrzeug kann nicht noch mehr Nagelbänder aufladen!", player, 150, 0, 0 )
						end					
					end					
				end
			end
		else
			outputChatBox ( "Nur für Staatsbeamte ab Rang 3 / Du bist am falschen Ort!", player, 150, 0, 0 )
		end	
	end, false, false )
	
addCommandHandler ( "usenail", 
	function ( player, command, arg )
		if not arg then
			outputChatBox ( "Du musst eine Anzahl angeben! /usenail [Anzahl]", player, 150, 0, 0 )
		else
			local fraktion = tonumber(getElementData( player, "fraktion" ))
			local rang = tonumber(getElementData( player, "rang" ))
			local seat = getPedOccupiedVehicleSeat ( player )
			if nail_factions[fraktion] and tonumber(arg) and rang >= 3 then
				local veh = getPedOccupiedVehicle ( player )			
				if not veh or seat ~= 0 then				
					if isElement( player ) then outputChatBox ( "Du bist in keinem Fahrzeug oder nicht auf dem Fahrersitz!", player, 150, 0, 0 ) end				
				else				
					if nail_cars[getElementModel(veh)] or federalVehicles[veh] then				
						local loadedNails = getElementData( veh, "Nagelbaender" )						
						if loadedNails == false then						
							if isElement( player ) then outputChatBox ( "Dein Fahrzeug hat keine Nagelbänder!", player, 150, 0, 0 ) end						
						else						
							if tonumber(arg) <= tonumber(loadedNails) then							
								setElementData( veh, "Nagelbaender", tonumber(loadedNails)-tonumber(arg) )
								setElementData( player, "NagelbaenderPlayer", tonumber(arg) )								
								if isElement( player ) then outputChatBox ( "Du hast " .. arg .. " Nagelbänder genommen!", player, 0, 100, 0 ) end
								if isElement( player ) then outputChatBox ( "Benutze /nail, um ein Nagelband zu legen!", player, 0, 100, 0 ) end								
							else							
								if isElement( player ) then outputChatBox ( "Dein Fahrzeug hat nicht genug Nagelbänder!", player, 150, 0, 0 ) end							
							end						
						end						
					end
				end			
			else
				outputChatBox ( "Nur für Staatsbeamte ab Rang 3!", player, 150, 0, 0 )
			end			
		end	
	end, false, false )
	
function freeNailPlayer ( player )
	nail_ifBand[player] = true
end
	
function plattReifen ( hit, dim )
	if dim and getElementType(hit) == "vehicle" then
		setVehicleWheelStates ( hit, 1, 1, 1, 1 )
	end
end
	
addCommandHandler ( "nail", 
	function ( player, command )
		local veh = getPedOccupiedVehicle( player )
		local fraktion = tonumber(getElementData( player, "fraktion" ))
		local rang = tonumber(getElementData( player, "rang" ))
		local bands = getElementData( player, "NagelbaenderPlayer" )
		if ( not veh ) and nail_factions[fraktion] and ( bands ~= false ) and ( rang >= 3 ) then
			if nail_ifBand[player] ~= false then
				if tonumber(bands) >= 1 then		
					nail_ifBand[player] = false
					local bands = tonumber(bands)
					local nums = #n_Baender+1
					local x, y, z = getElementPosition ( player )
					local rx, ry, rz = getElementRotation ( player )			
					n_Baender[nums] = createObject ( 2892, x, y, z-1, rx, ry, rz+90 ) -- Model noch
					n_ColBaender[nums] = createColSphere ( x, y, z, 4 )			
					setElementData( player, "NagelbaenderPlayer", tonumber(bands)-1 )
					setElementData( n_ColBaender[nums], "NagelbaenderdieNummer", nums )
					setElementData( n_ColBaender[nums], "NagelbaenderName", getPlayerName(player) )
					setTimer ( freeNailPlayer, 10000, 1, player )				
					addEventHandler ( "onColShapeHit", n_ColBaender[nums], plattReifen )
					outputChatBox ( "Nagelband verlegt!", player, 0, 150, 0 )
					outputLog( "[NAGELBAND]: "..getPlayerName(player).." hat ein Nagelband verlegt!", "pd")
				else
					if isElement( player ) then
						outputChatBox ( "Du hast keine Nagelbänder mehr!", player, 150, 0, 0 )
					end
				end
			else			
				if isElement( player ) then
					outputChatBox ( "Du kannst nur alle 10 Sekunden ein Nagelband legen!", player, 150, 0, 0 )
				end		
			end	
		end	
	end, false, false )
	
addCommandHandler ( "removenails", 
	function ( player, command )
		local fraktion = tonumber(getElementData( player, "fraktion" ))
		local rang = tonumber(getElementData( player, "rang" ))
		local admin = tonumber(getElementData( player, "adminlvl" ))
		if ( nail_factions[fraktion] and ( rang >= 5 ) ) or ( admin >= 2 ) then
			for i, band in pairs ( n_Baender ) do
				if isElement(band) then
					destroyElement(band)
				end				
			end
			for i, band in pairs ( n_ColBaender ) do
				if isElement(band) then		
					destroyElement(band)		
				end	
			end
				n_Baender = {}
				n_ColBaender = {}
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 1, 150, 150, 0 )
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 6, 150, 150, 0 )
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 8, 150, 150, 0 )
				outputLog( "[NAGELBAND]: "..getPlayerName(player).." hat alle Nagelbaender entfernt.", "pd")
		end
	end, false, false )
	
addCommandHandler ( "removenail", 
	function ( player, command )
		local fraktion = tonumber(getElementData( player, "fraktion" ))
		local rang = tonumber(getElementData( player, "rang" ))
		avalue = false
		if nail_factions[fraktion] and ( rang >= 3 ) then
			for i, col in pairs ( n_ColBaender ) do
				if isElement(col) then
					if isElementWithinColShape ( player, col ) and not avalue then
						avalue = true
						local pbesitzer = getElementData( col, "NagelbaenderName" )
						if ( rang >= 4 ) or pbesitzer == getPlayerName( player ) then
							local nummer = tonumber(getElementData( col, "NagelbaenderdieNummer" ))
							destroyElement(n_ColBaender[nummer])
							destroyElement(n_Baender[nummer])
							n_Baender[nummer] = 0
							n_ColBaender[nummer] = 0
							outputChatBox ( "Nagelband entfernt!", player, 0, 150, 0 )
							outputLog( "[NAGELBAND]: "..getPlayerName(player).." hat ein Nagelband entfernt!", "pd")
						else
							if isElement( player ) then
								outputChatBox ( "Das Nagelband kann nur der Verleger oder ein Rang 4 entfernen!", player, 150, 0, 0 )
							end
						end
					end
				end
			end
		end
	end, false, false )
	
addCommandHandler ( "maxnails", 
	function ( player, command, arg )
		local admin = tonumber(getElementData( player, "adminlvl" ))
		if admin >= 4 and arg then
			maxnail = tonumber(arg)
			if isElement( player ) then
				outputChatBox ( "Du hast die maximalen Nagelbänder pro Wagen auf "..arg.." gesetzt!", player, 0, 150, 0 )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat die maximale Anzahl Nagelbänder auf "..arg.." gesetzt!", playeritem, 200, 200, 0 )
				end
				sendMSGForFaction ( getPlayerName(player).." hat die maximale Anzahl Nagelbänder auf "..arg.." gesetzt!", 1, 150, 150, 0 )
				sendMSGForFaction ( getPlayerName(player).." hat die maximale Anzahl Nagelbänder auf "..arg.." gesetzt!", 6, 150, 150, 0 )
				sendMSGForFaction ( getPlayerName(player).." hat die maximale Anzahl Nagelbänder auf "..arg.." gesetzt!", 8, 150, 150, 0 )
			end
		end
	end, false, false )