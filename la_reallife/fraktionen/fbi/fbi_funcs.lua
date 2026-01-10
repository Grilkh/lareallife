FBIDutyIcon = createPickup ( -2453.17, 507.338, -22.101943969727, 3, 1239, 50 )

function FBIDutyIconHit ( player )

	outputChatBox ( "Tippe /duty [1-4] oder /swat, um in den Dienst zu gehen!", player, 125, 0, 0 )
end
addEventHandler ( "onPickupHit", FBIDutyIcon, FBIDutyIconHit )

function ram_func ( player )

	if isFBI ( player ) and laGetElementData ( player, "rang" ) >= 2 or ( isCop(player) and laGetElementData ( player, "rang" ) >= 4 ) then
		local house = laGetElementData ( player, "house" )
		local px, py, pz = getElementPosition ( player )
		local hx, hy, hz = getElementPosition ( house )
		if getDistanceBetweenPoints3D ( px, py, pz, hx, hy, hz ) <= 5 then
			if ( getElementModel ( house ) == 1273 or getElementModel ( house ) == 1272 ) and laGetElementData ( house, "curint" ) > 0 then
				local i = laGetElementData ( house, "curint" )
				laSetElementData ( player, "curIntIn", i )
				local int = tonumber ( gettok ( _G["houseInt"..i], 1, string.byte('|') ) )
				local intx = tonumber ( gettok ( _G["houseInt"..i], 2, string.byte('|') ) )
				local inty = tonumber ( gettok ( _G["houseInt"..i], 3, string.byte('|') ) )
				local intz = tonumber ( gettok ( _G["houseInt"..i], 4, string.byte('|') ) )
				local dim = laGetElementData ( house, "id" )
				if i == 0 then
					dim = 0
				end
				setElementDimension ( player, dim )
				fadeElementInterior ( player, int, intx, inty, intz )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /out, um das Haus zu verlassen\nund drücke F2, um das\nHausmenü zu öffnen.", 7500, 125, 0, 0 )
				bindKey ( player, "F2", "down", house_func )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Haus!", 7500, 125, 0, 0 )
		end
	else
		outputChatBox ( "Für FBI ab Rang 2, beim LAPD ab Rang 4.", player, 125, 0, 0 )
	end
end
addCommandHandler ( "ram", ram_func )

function sendMSGToSecuricar ( msg )

	if getVehicleOccupant ( FederalSecuricar, 0 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar, 0 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar, 1 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar, 1 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar, 2 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar, 2 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar, 3 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar, 3 ), 200, 200, 0 )
	end
end

function sendMSGToSecuricar1 ( msg )

	if getVehicleOccupant ( FederalSecuricar1, 0 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar1, 0 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar1, 1 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar1, 1 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar1, 2 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar1, 2 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalSecuricar1, 3 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalSecuricar1, 3 ), 200, 200, 0 )
	end
end

function refreshBlipsForBoxville ( veh )

	if veh == FederalSecuricar then
		for i = 1, 3 do
			if _G["Wanze"..i.."Blip"] then
				setElementVisibleTo ( _G["Wanze"..i.."Blip"], getRootElement(), false )
			end
		end
		if getVehicleOccupant ( FederalSecuricar, 0 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar, 0 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar, 1 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar, 1 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar, 2 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar, 2 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar, 3 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar, 3 ), true )
				end
			end
		end
	elseif veh == FederalSecuricar1 then
		for i = 1, 3 do
			if _G["Wanze"..i.."Blip"] then
				setElementVisibleTo ( _G["Wanze"..i.."Blip"], getRootElement(), false )
			end
		end
		if getVehicleOccupant ( FederalSecuricar1, 0 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar1, 0 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar1, 1 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar1, 1 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar1, 2 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar1, 2 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalSecuricar1, 3 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalSecuricar1, 3 ), true )
				end
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), refreshBlipsForBoxville )

function refreshBlipsForBoxvilleExit ( veh )

	if (veh == FederalSecuricar) or (veh == FederalSecuricar1) then
		for i = 1, 3 do
			if _G["Wanze"..i.."Blip"] then
				setElementVisibleTo ( _G["Wanze"..i.."Blip"], source, false )
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), refreshBlipsForBoxvilleExit )

function wanze_func ( player )

	if isFBI ( player ) and laGetElementData ( player, "rang" ) >= 3 then
		local veh = getPedOccupiedVehicle (player)
		if (veh == FederalSecuricar) or (veh == FederalSecuricar1) then
			outputChatBox ( "[INFO]: Wanze bereit. Klicke auf einen Gegenstand oder ein Fahrzeug in deiner Nähe!", player, 150, 150, 0 )
			laSetElementData ( player, "wanzen", true )
		else
			outputChatBox ( "Du bist nicht im Securicar!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist kein Agent des FBI oder nicht Rang 3!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "wanze", wanze_func )

function createWanze ( player, clickedElement, x, y, z )
	if not x then
		local x, y, z = getElementPosition ( clickedElement )
	end
	local px, py, pz = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( px, py, pz, x, y, z ) < 3 then
		if laGetElementData ( player, "rang" ) >= 3 then
			if wanzen <= 2 then
				for i = 1, 3 do
					if not _G["Wanze"..i] then
						c = i
						break
					end
				end
				if not clickedElement then
					outputChatBox ( "[INFO]: Wanze platziert!", player, 0, 125, 0 )
					laSetElementData ( player, "wanzen", false )
					showCursor ( player, false )
					setElementData ( source, "ElementClicked", false )
					_G["Wanze"..c] = createObject ( 1317, x, y, z )
					setTimer ( killWanze, 60*60*1000, 1, c )
					_G["Wanze"..c.."Blip"] = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, wanzenrange, nil )
					wanzen = wanzen + 1
					setElementAlpha ( _G["Wanze"..c], 0 )
				elseif getElementType ( clickedElement ) == "vehicle" then
					outputChatBox ( "[INFO]: Wanze an Fahrzeug platziert!", player, 0, 125, 0 )
					laSetElementData ( player, "wanzen", false )
					showCursor ( source, false )
					setElementData ( source, "ElementClicked", false )
					_G["Wanze"..c] = createObject ( 1317, x, y, z )
					setTimer ( killWanze, 60*60*1000, 1, c )
					_G["Wanze"..c.."Blip"] = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, wanzenrange, nil )
					attachElements ( _G["Wanze"..c], clickedElement )
					attachElements ( _G["Wanze"..c.."Blip"], _G["Wanze"..c] )
					wanzen = wanzen + 1
					setElementAlpha ( _G["Wanze"..c], 0 )
				end
				refreshBlipsForBoxville ( FederalSecuricar )
				refreshBlipsForBoxville ( FederalSecuricar1 )
				laSetElementData ( player, "wanzen", false )
			else
				outputChatBox ( "Es wurden bereits zu viele Wanzen platziert!", player, 125, 0, 0 )
				laSetElementData ( player, "wanzen", false )
			end
		else
			outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
			laSetElementData ( player, "wanzen", false )
		end
	else
		outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0)
	end
end

function killWanze ( count )

	destroyElement ( _G["Wanze"..count] )
	destroyElement ( _G["Wanze"..count.."Blip"] )
	sendMSGForFaction ( "Wanze Nr. "..count.." hat sich verabschiedet!", 6, 125, 0, 0 )
	refreshBlipsForBoxville ( FederalSecuricar )
	refreshBlipsForBoxville ( FederalSecuricar1 )
	wanzen = wanzen - 1
	_G["Wanze"..count] = false
end