cost = 10000      --<<===== Set your price
allow_unrigg = 1  --<<===== Allow vehicle unrigg? 0 = Disabled, 1 = Enabled
refund = 0.2      --<<===== Refund ratio (1.0 = 100%, 0.5 = 50%, 0.0 = None, -0.5 = Player pay 50%)
local bombshop = { }
local bombShopCol = { }
local sensitiveMark = { }
delay = 20000     --<<===== Set your delay for VehicleRespawn
local listeElements = { "armed",
						"bool",
						"speed1", 
						"creatorPlayer", 
						"bombType", 
						"enclenche", 
						"lock", 
						"targetBomb", 
						"selectText", 
						"speed2", 
						"advert",
						"selectTime",
						"start",
						"affWarnMess",
						"engine",
						"compte",
					  }



function bombshopLoad ( res )
	local bombshopElements = getElementsByType ( "bombshop", getResourceRootElement(res) )
	for k,v in ipairs(bombshopElements) do
		local num = #bombshop+1
		bombshop[num] = { }
		bombshop[num].Name = getElementData( v, "name" )
		bombshop[num].PosX = tonumber( getElementData( v, "posX" ) )
		bombshop[num].PosY = tonumber( getElementData( v, "posY" ) )
		bombshop[num].PosZ = tonumber( getElementData( v, "posZ" ) )
		if ( bombshop[num].PosX and bombshop[num].PosY and bombshop[num].PosZ ) then
			bombShopCol = createColSphere ( bombshop[num].PosX, bombshop[num].PosY, bombshop[num].PosZ, 4 )
			if getElementData( v, "isInGarage" ) ~= "false" then
				local garageNum = getElementData( v, "isInGarage" )
				colGarage = createColSphere ( bombshop[num].PosX, bombshop[num].PosY, bombshop[num].PosZ, 13 )
				setElementData ( colGarage, "garageNumber", ""..garageNum.."" )
				addEventHandler( "onColShapeHit", colGarage, openGarage )
				addEventHandler( "onColShapeLeave", colGarage, closeGarage )
			end
			bombshop[num].marker = createMarker ( bombshop[num].PosX, bombshop[num].PosY, bombshop[num].PosZ, "cylinder", 3, 0, 0, 255, 150 )
			bombshop[num].bliper = createBlip ( bombshop[num].PosX, bombshop[num].PosY, bombshop[num].PosZ, 8, 0, 0, 0, 255, 0, 200, 200 )
			addEventHandler( "onColShapeHit", bombShopCol, bombshopEnter )
		end
	end
end

addEventHandler( "onResourceStart", getResourceRootElement(getThisResource()), bombshopLoad ) -- KAN TOUTE les ressource restart , 



function bombshopUnload ( res )
	for i=1,#bombshop do
		destroyElement(bombshop[i].marker);
		destroyElement(bombshop[i].bliper);
	end
end

addEventHandler( "onResourceStop", getResourceRootElement(getThisResource()), bombshopUnload )

function openGarage (element)
	if ( getElementType ( element ) == "vehicle" ) then
		local garageNum = getElementData ( source, "garageNumber" )
		if ( not isGarageOpen ( tonumber(garageNum) )) then
			setGarageOpen ( tonumber(garageNum), true )
		end
	end
end
function closeGarage (element)
	if ( getElementType ( element ) == "vehicle" ) then
		local garageNum = getElementData ( source, "garageNumber" )
		setGarageOpen ( tonumber(garageNum), false )
	end
end


function bombshopEnter ( element )
	if ( getElementType ( element ) == "vehicle" ) then
		local player = getVehicleOccupant ( element, 0 )
		if getElementData ( element, "bombType" ) == false then
			triggerClientEvent( "gui_bombshopEnter", player, cost )
		elseif getElementData ( element, "bombType" ) == "0" then
			triggerClientEvent( "gui_bombshopEnter", player, cost )
--		elseif getElementData ( player, "detonaterVehicle" ) ~= false then
--			local textA = "ta deja un detonateur!!"
--			affichText ( textA, player )
		else
			if allow_unrigg == 1 then
				triggerClientEvent( "gui_bombshopEnterUnrigg", player, cost * refund )
			else
				local textA = "Dieses Fahrzeug ist bereits verkabelt!"
				affichText ( textA, player )
			end
		end
	end
end



function detBomb (player, vehicle)
	toggleVehicleRespawn (vehicle, false)
	if laGetElementData ( player, "money" ) >= cost then
		local textA = "Verwende den Zünder um die Bombe hochgehen zu lassen!"
		affichText ( textA, player )
		giveWeapon ( player, 40 )
		setElementData ( player, "detonaterVehicle", vehicle )
		playSoundFrontEnd ( player, 46 )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) - math.abs(cost) )
		takePlayerMoney ( player, math.abs(cost) )
		bombshopKasse = bombshopKasse + math.floor(cost/10)
		--updateBizKasse()
	else
		local textA = "Du kannst dir keine Bombe leisten"
		affichText ( textA, player )
		setTimer( respawnV , 1000, 1, vehicle )
	end
end



function fitBomb ( player, vehicle )
	toggleVehicleRespawn (vehicle, false)
	removeElementData (vehicle, "flag" )
	if laGetElementData ( player, "money" ) >= cost then
		type = getElementData ( vehicle, "bombType" )
		if type == "2" then
			local textA = "Verwende den Zünder um die Bombe hochgehen zu lassen!"
			affichText ( textA, player )
			giveWeapon ( player, 40 ) 
			setElementData ( player, "detonaterVehicle", vehicle )
		else
			local textA = "Drück Feuer um die Bombe zu pflanzen."
			affichText ( textA, player )
			bindKey ( player, "vehicle_fire", "down", armBomb, vehicle )
		end
		playSoundFrontEnd ( player, 46 )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) - math.abs(cost) )
		takePlayerMoney ( player, math.abs(cost) )
		bombshopKasse = bombshopKasse + math.floor(cost/10)
		--updateBizKasse()
	else
		local textA = "Du kannst es dir nicht leisten!"
		affichText ( textA, player )
		setTimer( respawnV , 1000, 1, vehicle )
	end
end



function removeBomb ( player, vehicle )
	removeElementData (vehicle, "flag" )
	type = getElementData ( vehicle, "bombType" )
	triggerClientEvent ( player, "killCount", player )
	if type == "0" then
		local textA = "Die Bombe wurde bereits entfernt!"
		affichText ( textA, player )
	else
		if refund > 0 then
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) - math.abs(cost * refund) )
			takePlayerMoney ( player, math.abs(cost * refund ) )
			bombshopKasse = bombshopKasse + math.floor((cost*refund)/10)
			--updateBizKasse()
		else
			if laGetElementData ( player, "money" ) >= cost then
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - math.abs(cost * refund) )
				takePlayerMoney ( player, math.abs(cost * refund ) )
				bombshopKasse = bombshopKasse + math.floor((cost*refund)/10)
				--updateBizKasse()
			else
				local textA = "Du kannst es dir nicht leisten!"
				affichText ( textA, player )
				return
			end
		end
		playSoundFrontEnd ( player, 46 )
		local textA = "Das Fahrzeug ist bombenfrei."
		affichText ( textA, player )
		respawnV( vehicle, player )
		if type == "2" then
			takeWeapon ( source, 40 )
		else
			unbindKey ( player, "vehicle_fire", "down", armBomb )
		end
	end
end




addEvent( "but_applyTimeButton", true)
addEvent( "but_applyDetonatorButton", true)
addEvent( "but_applyEngineButton", true)
addEvent( "but_applyWeightButton", true)
addEvent( "but_applyUnriggButton", true)

addEventHandler( "but_applyTimeButton", getRootElement(), fitBomb )
addEventHandler( "but_applyDetonatorButton", getRootElement(), detBomb )
addEventHandler( "but_applyEngineButton", getRootElement(), fitBomb )
addEventHandler( "but_applyWeightButton", getRootElement(), fitBomb )
addEventHandler( "but_applyUnriggButton", getRootElement(), removeBomb )

function respawnV (source, player)
	toggleVehicleRespawn (source, true)
	if (player) then
		removeElementData (player, "detonaterVehicle" )
	end
	removeElementData (source, "creatorPlayer" )
	for k, v in pairs ( listeElements ) do
		--outputChatBox ( ""..v.."" )
		removeElementData (source, ""..v.."" )
	end
end




function bombshopVehicleEnter ( player, seat, jacked )
	local startV = getElementData ( source, "start" )
	local type = getElementData ( source, "bombType" )
	local typeb = getElementData ( source, "targetBomb" )
	local typeC = getElementData ( source, "compte" )
	if type == false then
--		setElementData ( source, "bombType", "0" )   --<< Voire si l annulation pose pas de probleme 

	elseif type ~= "2" and getElementData ( source, "armed" ) == false and type ~= "0" then
		if seat == 0 then
			bindKey ( player, "vehicle_fire", "down", armBomb, source )
			local textA = "Drücke Feuer um die Bombe zu pflanzen!"
			affichText ( textA, player )
		end
	elseif type ~= "2" and getElementData ( source, "armed" ) ~= false then
			unbindKey ( player, "vehicle_fire", "down", armBomb ) 
		if type == "3" and getElementData ( source, "armed" ) ~= false then
			local x,y,z = getElementPosition(player)
			if seat == 0 and typeb == getPlayerNametagText ( player ) then
				killPed ( player, (getElementData ( source, "creatorPlayer" )), 51 )
				createExplosion (x, y, z, 10, (getElementData ( source , "creatorPlayer" )))
				respawnV( source )
			elseif seat == 0 and ( typeb == nil or typeb == "=> All <=" ) then
				killPed ( player, (getElementData ( source, "creatorPlayer" )), 51 )
				createExplosion (x, y, z, 10, (getElementData ( source, "creatorPlayer" )))
				respawnV( source )
			end
		end
		if type == "4" then
			local i = 0
			local totalPassengers = 0
			while i ~= 8 do --loop until i == 8
				if ( getVehicleOccupant ( source, i ) ) then
					totalPassengers = totalPassengers + 1
				end
				i = i + 1
			end
			if totalPassengers > 1 then
				local x,y,z = getElementPosition(source)
				killPed ( player, (getElementData ( source, "creatorPlayer" )), 51 )
				createExplosion (x, y, z, 10, (getElementData ( source, "creatorPlayer" )))
				respawnV( source )
			end
		end
		if type == "6" then
			destroyElement ( getElementData (  source, "sensitiveCol"  ) )
			removeElementData ( source, "sensitiveCol" )
		end
		if type == "11" then
			if typeC == "1" then
				if startV == "1" then
					setVehicleEngineState ( source , false )
					bindKey ( player, "accelerate", "both", functStopEng, source )
					toggleControl ( player, "brake_reverse", false )
				end
				return	
			else	
				local x,y,z = getElementPosition(player)
				sTime = getElementData ( source, "selectTime" )
				if seat == 0 and typeb == getPlayerNametagText ( player ) then
					if startV == "1" then
						setVehicleEngineState ( source , false )
						bindKey ( player, "accelerate", "both", functStopEng, source )
						toggleControl ( player, "brake_reverse", false )
					end
					setElementData ( source, "compte", "1" )
					setTimer ( timeBombCountDown, 1000, 1, ""..sTime.."", player, source )
					triggerClientEvent( "gui_postMortem", player, source )
				elseif seat == 0 and ( typeb == nil or typeb == "=> All <=" )				then --<<<<<<<<<<<<<<<<<<<<<<<  possibilité de compacter le if en 1 seule 
					--if getElementData ( source, "creatorPlayer") ~= player then					
						if startV == "1" then
							setVehicleEngineState ( source , false )
							bindKey ( player, "accelerate", "both", functStopEng, source )
							toggleControl ( player, "brake_reverse", false )
						end
						setElementData ( source, "compte", "1" )
						setTimer ( timeBombCountDown, 1000, 1, ""..sTime.."", player, source )
						triggerClientEvent( "gui_postMortem", player, source )
					--end
				end
			end
		end
		if type == "7" then
			if seat == 0 and typeb == getPlayerNametagText ( player ) or ( typeb == nil or typeb == "=> All <=" ) then
				triggerClientEvent( player, "startCountSpeed", player )
			end
		end
	end
end

addEventHandler( "onVehicleEnter", getRootElement(), bombshopVehicleEnter )


function getSpeed (player, source, speed1, speed2, speedBool )
	local speedx, speedy, speedz = getElementVelocity ( source )
	local rSpeed = ( speedx^2 + speedy^2 +speedz^2 )^( 0.5 )
	rSpeed2 = rSpeed*150
	rSpeedEntier, rSpeedDec = math.modf(rSpeed2)
	local textA = ""..rSpeedEntier..""
	if getElementData ( source, "enclenche" ) == "1" or getElementData ( source, "enclenche" ) == false then
		if getElementData ( source, "advert" ) == "0" then
			triggerClientEvent( "gui_postMortem", player, source )
			affichText ( textA, player )
		end
	end
	boolOp = "=="
	if rSpeedEntier then
		if speedBool == ">" then
			if rSpeedEntier > tonumber (speed1) and getElementData ( source, "enclenche" ) == "1" or rSpeedEntier > tonumber (speed1) and getElementData ( source, "enclenche" ) == false then
				if getElementData ( source, "advert" ) == "1" then
					triggerClientEvent( "gui_postMortem", player, source )
					affichText ( textA, player )
				end
				local x,y,z = getElementPosition(player)
	--			killPed ( player, (getElementData ( source, "creatorPlayer" )), 51 )              -------- A CREER SI L ELEMENT "LOCK VEHICULE" est a "1"
				createExplosion (x, y, z-1, 10)
				blowVehicle (source)
				triggerClientEvent ( player, "killCount", player )
				respawnV( source )
				
			end
		elseif speedBool == "<" then
			if rSpeedEntier < tonumber (speed1) and getElementData ( source, "enclenche" ) == "1" or rSpeedEntier < tonumber (speed1) and getElementData ( source, "enclenche" ) == false then
				if getElementData ( source, "advert" ) == "1" then
					triggerClientEvent( "gui_postMortem", player, source )
					affichText ( textA, player )
				end
				local x,y,z = getElementPosition(player)
	--			killPed ( player, (getElementData ( source, "creatorPlayer" )), 51 )              -------- A CREER SI L ELEMENT "LOCK VEHICULE" est a "1"
				createExplosion (x, y, z-1, 10)
				blowVehicle (source)
				triggerClientEvent ( player, "killCount", player )
				respawnV( source )
				
			end
		end
		if ( speed2 ) then
			if rSpeedEntier > tonumber (speed2) and getElementData ( source, "enclenche" ) == "0" then
				setElementData ( source, "enclenche", "1" )
				if getElementData ( source, "advert" ) == "0" then
					triggerClientEvent( "gui_postMortem", player, source )
					affichText ( textA, player )
				end
			end
		end
	end
end
addEvent ("getSpeed", true )
addEventHandler( "getSpeed", getRootElement(), getSpeed )

function functStopEng (player, key, keyState, source)
	if getElementData ( source, "engine" ) == "stop" then
		setControlState ( player, "brake_reverse", false )
		setVehicleEngineState ( source , true )
		setElementData ( source, "engine", "start" )
	else
		setControlState ( player, "brake_reverse", true )
		setVehicleEngineState ( source , false )
		setElementData ( source, "engine", "stop" )
	end
end



function exitVehicle (player, seat, jacked )
	ifLocked = getElementData ( source, "lock" )
	namePlayer = getElementData ( source, "targetBomb" )
	playerN = getElementData ( source, "creatorPlayer" )
	if ifLocked == "1" and getElementData ( source, "armed" ) == true then
		if seat == 0 then
			if namePlayer == getPlayerNametagText ( player ) then
				cancelEvent()
			elseif namePlayer == "=> All <=" and playerN ~= player then
				cancelEvent()
			end
		end
	end
end


addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle )


function bombshopVehicleExit ( player, seat, jacker )
	removeElementData (source, "affWarnMess" )
	triggerClientEvent ( player, "killCount", player )
	local type = getElementData ( source, "bombType" )
	local typeb = getElementData ( source, "targetBomb" )
	local typec = getElementData ( source, "armed" )
	if type == "6" and typec == true then
		local x,y,z = getElementPosition( source )
		sensitiveMark = createColSphere ( x, y, z, 6 )
		setElementData ( sensitiveMark, "sensitiveVehicle", source )
		setElementData ( source, "sensitiveCol", sensitiveMark )
		addEventHandler( "onColShapeHit", sensitiveMark, sensitiveEnter )
	end
	unbindKey ( player, "vehicle_fire", "down", armBomb )
	unbindKey ( player, "accelerate", "both", functStopEng)
	toggleControl ( player, "brake_reverse", true )
	setControlState ( player, "accelerate", false )
	
	--triggerClientEvent ( "startCountSpeed", 
end

addEventHandler( "onVehicleExit", getRootElement(), bombshopVehicleExit )



function sensitiveEnter (element, dim )
	local aVehicle = getElementData ( source, "sensitiveVehicle" )
	local x,y,z = getElementPosition( getElementData ( source, "sensitiveVehicle" ) )
	local typeb = getElementData ( (getElementData ( source, "sensitiveVehicle" )) , "targetBomb" )
	if ( getElementType ( element ) == "vehicle" ) then
		local player = getVehicleOccupant ( element, 0 )
		if typeb == getPlayerNametagText ( player ) or typeb == "=> All <=" then
			createExplosion (x, y, z, 10, (getElementData ( aVehicle, "creatorPlayer" )) )
			createExplosion (x, y, z, 10, (getElementData ( aVehicle, "creatorPlayer" )) )
			respawnV( getElementData ( source, "sensitiveVehicle" ) )
			removeElementData (aVehicle, "sensitiveCol" )
			destroyElement ( source )
		end
	end
	if ( getElementType ( element ) == "player" ) then
		if typeb == getPlayerNametagText ( element ) or typeb == "=> All <=" then
			createExplosion (x, y, z, 10, (getElementData ( aVehicle, "creatorPlayer" ))  )
			createExplosion (x, y, z, 10, (getElementData ( aVehicle, "creatorPlayer" ))  )
			respawnV( getElementData ( source, "sensitiveVehicle" ) )
			removeElementData (aVehicle, "sensitiveCol" )
			destroyElement ( source )
		end
	end
end

function armBomb ( source, key, keyState, vehicle )
  if getElementData ( vehicle, "bombType" ) == "0" then  -- Desactivate arming if there's no bomb
    unbindKey ( player, "vehicle_fire", "down", armBomb )
    return
  end
	setElementData ( vehicle, "armed", true )
	textA = "Bombe aktiviert."
	affichText ( textA, source )
	playSoundFrontEnd ( source, 42 )
	unbindKey ( source, "vehicle_fire", "down", armBomb )
	if getElementData ( vehicle, "bombType" ) == "1" then
		timer2 = getElementData ( vehicle, "selectTime" )
		setTimer ( timeBombCountDown, 1000, 1, ""..timer2.."", source, vehicle )
	end
	if getElementData ( vehicle, "bombType" ) == "12" then
		selTime = getElementData ( vehicle, "selectTime" )
		getTimer ( selTime, source, vehicle )
	end
end

function timeBombCountDown ( currentTime, source, vehicle )
	bType = getElementData ( vehicle, "bombType" )
	if bType == "0" then  -- Block the countdown!
    return
	end
		if currentTime ~= 0 then
			if bType ~= "12" then
				playSoundFrontEnd ( source, 5 )
				outputChatBox ( ""..currentTime.."", source )
			end
			currentTime = currentTime - 1			
			setTimer ( timeBombCountDown, 1000, 1, currentTime, source, vehicle )
		else
			outputChatBox ( "BOOOOOM!", source )
			local x,y,z = getElementPosition(vehicle)
			createExplosion (x, y, z, 10, (getElementData ( vehicle, "creatorPlayer" )))
			createExplosion (x, y, z, 10, (getElementData ( vehicle, "creatorPlayer" )))
			blowVehicle (vehicle)
			respawnV( vehicle )
			unbindKey ( source, "accelerate", "both", functStopEng)
			toggleControl ( source, "brake_reverse", true )
			setControlState ( source, "accelerate", false )
		end
end

function colBomb ( loss )
	--outputChatBox ( ""..loss.."" )
	if loss >= 65 then
		local type = getElementData ( source, "bombType" )
		if type == "5" and getElementData ( source, "armed" ) == true then
			local x,y,z = getElementPosition(source)
			createExplosion (x, y, z, 10, (getElementData ( source, "creatorPlayer" )))
			createExplosion (x, y, z, 10, (getElementData ( source, "creatorPlayer" )))
			blowVehicle (source)
			respawnV(source)
		end
	end
end

addEventHandler( "onVehicleDamage", getRootElement(), colBomb )



function bombshopWeaponSwitch ( prelausWeaponID, currentWeaponID )
	if currentWeaponID == 40 then 
		bindKey ( source, "fire", "down", detonateVehicle )
	else
		unbindKey ( source, "fire", "down", detonateVehicle )
	end
end

addEventHandler( "onPlayerWeaponSwitch", getRootElement(), bombshopWeaponSwitch )

function detonateVehicle ( source, player, key, keyState, vehicle )
	local aVehicle = getElementData ( source, "detonaterVehicle" )
	local x,y,z = getElementPosition( aVehicle )
	createExplosion (x, y, z-1, 10, (getElementData ( aVehicle, "creatorPlayer" )))
	createExplosion (x, y, z, 10, (getElementData ( aVehicle, "creatorPlayer" )))
	blowVehicle (aVehicle)
	respawnV( aVehicle , source )
	takeWeapon ( source, 40 )
	unbindKey ( source, "fire", "down", detonateVehicle )
end



function affichText ( textA, player )
	if ( myTextItem ) then
		textDestroyTextItem ( myTextItem)
	end
	textP = textCreateDisplay ()
	textDisplayAddObserver( textP, player )
	myTextItem = textCreateTextItem ( textA, 0.22, 0.8, 2 , 255, 0, 0, 255, 3 )
	textDisplayAddText ( textP, myTextItem )
	setTimer ( textDestroyTextItem, 5000, 1, myTextItem, player )
end




function getTimer ( selTime, source, vehicle )
	hours, mins = getTime ()
	aTime = (hours * 60) + mins
	if tonumber(selTime) > tonumber(aTime) then
		sCountD = selTime - aTime
	else
		sCountD = ( 1440 - aTime ) + selTime
	end
	setTimer ( timeBombCountDown, 1000, 1, ""..sCountD.."", source, vehicle )
end

function Rvalues ()
	respawnV(source)
end
addEventHandler ( "onVehicleExplode", getRootElement(), Rvalues)

function rReset (ammo, attacker, weapon, bodypart)
	if getElementData ( source, "detonaterVehicle" ) ~= false then
		local aVehicle = getElementData ( source, "detonaterVehicle" )
		respawnV( aVehicle , source )
		takeWeapon ( source, 40 )
		unbindKey ( source, "fire", "down", detonateVehicle )
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), rReset)






