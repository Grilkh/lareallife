PnsLVCity = createColSphere ( 1976.6048583984, 2162.4150390625, 9.5703125, 3 )
PnsFortCarson = createColSphere ( -99.773811340332, 1118.3737792969, 18.294296264648, 3 )
PnsIdleWood = createColSphere ( 2061.20703125, -1831.5673828125, 13.546875, 3 )
PnsDillimore = createColSphere ( 720.2373046875, -455.859375, 16.3359375, 3 )
PnsTemple = createColSphere ( 1024.9111328125, -1023.7529296875, 32.1015625, 3 )
PnsBeach = createColSphere ( 487.347, -1741.646, 11.131, 3 )
setGarageOpen ( 36, true )
setGarageOpen ( 41, true )
setGarageOpen ( 8, true )
setGarageOpen ( 47, true )
setGarageOpen ( 11, true )
setGarageOpen ( 12, true )

PnsLVCityBlip = createBlip ( 1976.6048583984, 2162.4150390625, 9.5703125, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsFortCarsonBlip = createBlip ( -99.773811340332, 1118.3737792969, 18.294296264648, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsIdleWoodBlip = createBlip ( 2061.20703125, -1831.5673828125, 13.546875, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsDillimoreBlip = createBlip ( 720.2373046875, -455.859375, 16.3359375, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsTempleBlip = createBlip ( 1024.9111328125, -1023.7529296875, 32.1015625, 63, 2, 255, 0, 0, 255, 0, 300, getRootElement() )
PnsBeachBlip = createBlip ( 487.347, -1741.646, 11.131, 63, 2, 255, 0, 0, 255, 0, 300, getRootElement() )

laSetElementData ( PnsLVCity, "gateID", 36 )
laSetElementData ( PnsFortCarson, "gateID", 41 )
laSetElementData ( PnsIdleWood, "gateID", 8 )
laSetElementData ( PnsDillimore, "gateID", 47 )
laSetElementData ( PnsTemple, "gateID", 11 )
laSetElementData ( PnsBeach, "gateID", 12 )

PnsSFWangCars = createColCircle (-1904.47949, 289.4714660, 5 )
PnsSFJuniperHill = createColCircle (-2425.8376464844, 1020.0791015625, 5 )
PnsSFJuniperHillBlip = createBlip ( -2425.8376464844, 1020.0791015625, 50, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setGarageOpen ( 19, true )
setGarageOpen ( 27, true )

function PnsSFWangCarsHit ( hitelement )
	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
				takePlayerMoney ( player, paynsprayprice )
				triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				local veh = hitelement
				local x, y, z = getElementPosition ( hitelement )
				if z > 37 and z < 46 and motorboats[getElementModel ( veh )] ~= true and raftboats[getElementModel ( veh )] ~= true and helicopters[getElementModel ( veh )] ~= true and planea[getElementModel ( veh )] ~= true and planeb[getElementModel ( veh )] ~= true then
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )
					pnsDohertyKasse = pnsDohertyKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( wangrepair, 3000, 1, veh, hitelement )
					if isGarageOpen ( 19 ) == true then
						setGarageOpen ( 19, false )
					end
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsSFWangCars, PnsSFWangCarsHit )

function PnsSFJuniperHillHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )
					pnsJuniperKasse = pnsJuniperKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( juniperrepair, 3000, 1, veh, hitelement )
					if isGarageOpen ( 27 ) then
						setGarageOpen ( 27, false )
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsSFJuniperHill, PnsSFJuniperHillHit )

function PnsLVHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )

					local gateID = laGetElementData ( source, "gateID" )
					if isGarageOpen ( gateID ) then
						setGarageOpen ( gateID, false )
					end
					pnsLVKasse = pnsLVKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( LVRepair, 3000, 1, veh, hitelement, gateID )
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsLVCity, PnsLVHit )
addEventHandler ( "onColShapeHit", PnsFortCarson, PnsLVHit )

function PnsIdleWoodHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )

					local gateID = laGetElementData ( source, "gateID" )
					if isGarageOpen ( gateID ) then
						setGarageOpen ( gateID, false )
					end
					pnsLSKasse = pnsLSKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()()
					setTimer ( LVRepair, 3000, 1, veh, hitelement, gateID )
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsIdleWood, PnsIdleWoodHit )

function PnsDillimoreHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )

					local gateID = laGetElementData ( source, "gateID" )
					if isGarageOpen ( gateID ) then
						setGarageOpen ( gateID, false )
					end
					pnsLSKasse = pnsLSKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( LVRepair, 3000, 1, veh, hitelement, gateID )
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsDillimore, PnsDillimoreHit )

function PnsTempleHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )

					local gateID = laGetElementData ( source, "gateID" )
					if isGarageOpen ( gateID ) then
						setGarageOpen ( gateID, false )
					end
					pnsLSKasse = pnsLSKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( LVRepair, 3000, 1, veh, hitelement, gateID )
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsTemple, PnsTempleHit )

function PnsBeachHit ( hitelement )

	if getElementType ( hitelement ) == "vehicle" then
		if getVehicleOccupant ( hitelement ) ~= false then
			local player = getVehicleOccupant ( hitelement )
			if laGetElementData ( player, "money" ) >= paynsprayprice then
				local veh = hitelement
				if not helicopters[getElementModel ( veh )] and not planea[getElementModel ( veh )] and not planeb[getElementModel ( veh )] then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - paynsprayprice )
					takePlayerMoney ( player, paynsprayprice )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					local x, y, z = getElementPosition ( hitelement )
					setPedFrozen ( player, true )
					setVehicleFrozen ( veh, true )

					local gateID = laGetElementData ( source, "gateID" )
					if isGarageOpen ( gateID ) then
						setGarageOpen ( gateID, false )
					end
					pnsLSKasse = pnsLSKasse + math.floor(paynsprayprice/5)
					--updateBizKasse()
					setTimer ( LVRepair, 3000, 1, veh, hitelement, gateID )
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Auto umzulackieren kostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTo repaint your car costs "..paynsprayprice.." $!", 5000, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsBeach, PnsBeachHit )

function wangrepair ( veh, hitelement )

	if not isGarageOpen ( 19 ) then
		setGarageOpen ( 19, true )
	end
	playSoundFrontEnd ( getVehicleOccupant ( hitelement ), 46 )
	setPedFrozen ( getVehicleOccupant ( hitelement ), false )

	pnsFixVehicle ( veh )
end

function juniperrepair ( veh, hitelement )

	if not isGarageOpen ( 27 ) then
		setGarageOpen ( 27, true )
	end
	playSoundFrontEnd ( getVehicleOccupant ( hitelement ), 46 )
	setPedFrozen ( getVehicleOccupant ( hitelement ), false )
	
	pnsFixVehicle ( veh )
end

function LVRepair ( veh, hit, gateID )

	local player = getVehicleOccupant ( hit )
	if not isGarageOpen ( gateID ) then
		setGarageOpen ( gateID, true )
	end
	playSoundFrontEnd ( player, 46 )
	setPedFrozen ( player, false )
	
	pnsFixVehicle ( veh )
end


function pnsFixVehicle ( veh )

	fixVehicle ( veh )
	if laGetElementData ( veh, "stuning2" ) then
		setElementHealth ( veh, 1700 )
	end
	setVehicleFrozen ( veh, false )
end