mapfix1 = createObject ( 682.56195068359, -445.75354003906, -26.132213592529, 0, 0, 90 )
mapfix2 = createObject ( 682.5615234375, -445.7529296875, -23.382213592529, 0, 0, 90 )
mapfix3 = createObject ( 680.4482421875, -445.73837280273, -23.382213592529, 0, 0, 90 )
mapfix4 = createObject ( 680.4482421875, -445.73828125, -25.882213592529, 0, 0, 90 )
mapfix5 = createObject ( 969, 679.853515625, -451.0771484375, -26.629240036011, 90, 0, 90 )

setElementInterior ( mapfix1, 2 )
setElementInterior ( mapfix2, 2 )
setElementInterior ( mapfix3, 2 )
setElementInterior ( mapfix4, 2 )
setElementInterior ( mapfix5, 2 )

local BikerClubEnter = createMarker ( -2242.5334472656, -88.182876586914, 35.287929534912, "corona", 1.5, 0, 255, 0, 150 )
local BikerClubExit = createMarker ( 681.5185546875, -447.37362670898, -26.6, "corona", 1.5, 0, 255, 0, 150 )
local BikerClubBuy = createMarker ( 681.36389160156, -453.89111328125, -26.967962265015, "cylinder", 1.5, 0, 0, 255, 150 )
setElementInterior ( BikerClubExit, 1 )
setElementInterior ( BikerClubBuy, 1 )


MistysFreeway1 = createVehicle ( 463, -2243.93359375, -83.8095703125, 34.937313079834, 0, 0, 110 )
toggleVehicleRespawn ( MistysFreeway1, true )
setVehicleIdleRespawnDelay ( MistysFreeway1, 1000 )
setVehicleDamageProof ( MistysFreeway1, true )
setVehicleDoorsUndamageable ( MistysFreeway1, true )
setVehicleLocked ( MistysFreeway1, true )
laSetElementData ( MistysFreeway1, "owner", "console" )
--setElementFrozen ( MistysFreeway1, true )

MistysFreeway2 = createVehicle ( 463, -2243.92578125, -85.8095703125, 34.937313079834, 0, 0, 112 )
toggleVehicleRespawn ( MistysFreeway2, true )
setVehicleIdleRespawnDelay ( MistysFreeway2, 1000 )
setVehicleDamageProof ( MistysFreeway2, true )
setVehicleDoorsUndamageable ( MistysFreeway2, true )
setVehicleLocked ( MistysFreeway2, true )
laSetElementData ( MistysFreeway2, "owner", "console" )
--setElementFrozen ( MistysFreeway2, true )

MistysFreeway3 = createVehicle ( 463, -2243.9033203125, -91.5595703125, 34.937313079834, 0, 0, 104 )
toggleVehicleRespawn ( MistysFreeway3, true )
setVehicleIdleRespawnDelay ( MistysFreeway3, 1000 )
setVehicleDamageProof ( MistysFreeway3, true )
setVehicleDoorsUndamageable ( MistysFreeway3, true )
setVehicleLocked ( MistysFreeway3, true )
laSetElementData ( MistysFreeway3, "owner", "console" )
--setElementFrozen ( MistysFreeway3, true )

MistysFreeway4 = createVehicle ( 463, -2242.1435546875, -94.052627563477, 34.937313079834, 0, 0, 175 )
toggleVehicleRespawn ( MistysFreeway4, true )
setVehicleIdleRespawnDelay ( MistysFreeway4, 1000 )
setVehicleDamageProof ( MistysFreeway4, true )
setVehicleDoorsUndamageable ( MistysFreeway4, true )
setVehicleLocked ( MistysFreeway4, true )
laSetElementData ( MistysFreeway4, "owner", "console" )
--setElementFrozen ( MistysFreeway4, true )

bikerskins = {}
bikerskins = { [100]=true, [247]=true, [248]=true, [254]=true }

createBlip ( -2242.5334472656, -88.182876586914, 34.287929534912, 23, 2, 255, 0, 0, 255, 0, 200 )

function defreeze ( player )
	setElementFrozen ( player, false )
end

local function onBikerClubEnterHit ( hit, dim )
if getElementType(hit) == "player" and (dim) then
	if isPedInVehicle ( hit ) == false then
		fadeElementInterior ( hit, 1, 681.39819335938, -450.52166748047, -25.96 )
		setPedRotation ( hit, 270 )
		setElementFrozen ( hit, true )
		setTimer ( defreeze, 500, 1, hit )
		outputLog ( "[MISTYS]: "..getPlayerName ( hit ).." hat Mistys Bar betreten.", "bad" )
		infobox ( hit, "\n\nWillkommen in Misty's Bar!", 5000, 0, 125, 0 )
		if biketransport == 1 then
			setPedAnimation(bikeshopped, "ped", "cower")
		else
		setPedAnimation(bikeshopped, "dealer", "dealer_deal",-1)
		end
	end
end
end
addEventHandler ( "onMarkerHit", BikerClubEnter, onBikerClubEnterHit )

local function onBikerClubExitHit ( hit, dim )
if getElementType(hit) == "player" and (dim) then
	if isPedInVehicle ( hit ) == false then
		fadeElementInterior ( hit, 0, -2244.6462402344, -88.103973388672, 34.96 )
		setPedRotation ( hit, 180 )
	end
end
end
addEventHandler ( "onMarkerHit", BikerClubExit, onBikerClubExitHit )

local function onBikerClubBuyHit ( hit, dim )
if getElementType(hit) == "player" and (dim) then
	if isPedInVehicle ( hit ) == false then
		triggerClientEvent ( hit, "showBikerBarWindow", getRootElement() )
		showCursor ( hit, true )
		laSetElementData ( hit, "ElementClicked", true )
		toggleAllControls ( hit, false )
	end
end
end
addEventHandler ( "onMarkerHit", BikerClubBuy, onBikerClubBuyHit )

function bikerBarBuyQue_func ( player )

	if laGetElementData ( player, "club" ) == "biker" then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= quePrice then
			laSetElementData ( player, "money", money - quePrice )
			takePlayerMoney ( player, quePrice )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			playSoundFrontEnd ( player, 40 )
			giveWeapon ( player, 7, 1, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), 7, 1 )
		else
			outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Nur für Biker!", player, 125, 0,0 )
	end
end
addEvent ( "bikerBarBuyQue", true )
addEventHandler ( "bikerBarBuyQue", getRootElement(), bikerBarBuyQue_func )

function bikerBarJoin_func ( player )

	if laGetElementData ( player, "club" ) == "biker" then
		outputChatBox ( "Du bist bereits Mitglied!", player, 125, 0, 0 )
	else
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 100 then
			laSetElementData ( player, "money", money - 100 )
			takePlayerMoney ( player, 100 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			playSoundFrontEnd ( player, 40 )
			laSetElementData ( player, "club", "biker" )
			outputChatBox ( "Du bist soeben dem Bikerclub beigetreten - nutze /spawnchange bar, um hier zu spawnen!", player, 10, 150, 10 )
		else
			outputChatBox ( "Du hast nicht genug Geld! Dem Bikerclub beizutreten kostet 100$!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "bikerBarJoin", true )
addEventHandler ( "bikerBarJoin", getRootElement(), bikerBarJoin_func )

function bikerBarBuySkin_func ( player, skin )

	if laGetElementData ( player, "club" ) == "biker" then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if laGetElementData ( player, "money" ) >= outfitPrice then
			laSetElementData ( player, "money", money - outfitPrice )
			takePlayerMoney ( player, outfitPrice )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			playSoundFrontEnd ( player, 40 )
			laSetElementData ( player, "skinid", skin )
			setPedSkin ( player, skin )
		else
			outputChatBox ( "Du hast nicht genug Geld! Dem Bikerclub beizutreten kostet 100$!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Nur für Biker!", player, 125, 0,0 )
	end
end
addEvent ( "bikerBarBuySkin", true )
addEventHandler ( "bikerBarBuySkin", getRootElement(), bikerBarBuySkin_func )

function bikerBarBuyBike_func ( player )

	if player == client then
		if laGetElementData ( player, "club" ) == "biker" then
			carbuy ( player, freewayPrice, 463, -2243.9421386719, -81.810104370117, 34.937313079834, 0, 0, 110 )
		else
			outputChatBox ( "Nur für Biker!", player, 125, 0,0 )
		end
	end
end
addEvent ( "bikerBarBuyBike", true )
addEventHandler ( "bikerBarBuyBike", getRootElement(), bikerBarBuyBike_func )