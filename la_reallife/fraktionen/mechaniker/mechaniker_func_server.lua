------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------
---- Script by Noneatme ------

local tuningmarker = createMarker(-2676.269, 447.944, 3.3559375, "cylinder", 1.2, 0, 0, 255, 100)
--local rampencol1 = createColSphere(-2667.2927246094, 446.29388427734, 4.3359375, 3)
--local rampencol2 = createColSphere(-2658.7033691406, 446.3837890625, 4.3359375, 3)
local rampencol1 = createColSphere(-2671.527, 446, 4.336, 3)
local rampencol2 = createColSphere(-2662.592, 446, 4.336, 3)
local rampenmarker1 = createMarker(-2671.527, 446, 4.336, "corona", 4, 255, 255, 255, 50)
local rampenmarker2 = createMarker(-2662.592, 446, 4.336, "corona", 4, 255, 255, 255, 50)

local tuningmarker2 = createMarker(-2909.717, 506.02, 6.368, "cylinder", 1.2, 0, 0, 255, 100)
local rampencol3 = createColSphere(-2909.147, 491.731, 7.368, 15)

local haus_col = createColSphere(-2669.0327148438, 441.52178955078, 4.3359375, 15)

local heli_col = createColSphere(-2909.147, 491.731, 7.368, 15)

addEvent("onLAOAmtCarTuning", true)

local veh_tuningtimer = {}

addEventHandler("onMarkerHit", tuningmarker, function(hitElement)
	if(getElementType(hitElement) == "player") and (isPedInVehicle(hitElement) == false) and (isMechanikerDuty(hitElement)) then
		local car1, car2 = getElementsWithinColShape(rampencol1, "vehicle"), getElementsWithinColShape(rampencol2, "vehicle")
		triggerClientEvent(hitElement, "onLAOrdnungsamtTuningGuiStart", hitElement, car1, car2)
	end
end)

addEventHandler("onMarkerHit", tuningmarker2, function(hitElement)
	if(getElementType(hitElement) == "player") and (isPedInVehicle(hitElement) == false) and (isMechanikerDuty(hitElement)) then
		local car1= getElementsWithinColShape(rampencol3, "vehicle")
		triggerClientEvent(hitElement, "onLAOrdnungsamtTuningGuiStartHeli", hitElement, car1)
	end
end)

local function sendMessageForAllInGarage(text)
	for index, player in pairs(getElementsWithinColShape(haus_col, "player")) do
		outputChatBox("[INFO]: "..text.."", player, 200, 200, 0)
	end
	for index, player in pairs(getElementsWithinColShape(heli_col, "player")) do
		outputChatBox("[INFO]: "..text.."", player, 200, 200, 0)
	end
end

addEventHandler("onLAOAmtCarTuning", getRootElement(), function(vehicle, tuning, preis)
	if(isTimer(veh_tuningtimer[vehicle])) then
		outputChatBox("Dieses Fahrzeug wird bereits bearbeitet!", source, 150, 0, 0)
		return
	end
	if(tuning == "Kleine Reparatur") then	
		sendMessageForAllInGarage("Das Fahrzeug "..getVehicleNameFromModel(getElementModel(vehicle)).." wird bearbeitet!")
		setElementFrozen(vehicle, true)
		local money = laGetElementData (source, "money")
		laSetElementData (source, "money", money - preis)
		givePlayerMoney(source, -preis)
		local gewinn = 0
			if preis < 1001 then
				if preis < 101 then
					gewinn = preis/2
				else
					gewinn = preis/10
				end
			else
				gewinn = preis/50
			end
		local newmoney = laGetElementData (source, "money")
		laSetElementData (source, "money", newmoney + math.floor(gewinn))
		local thePlayer = source
		veh_tuningtimer[vehicle] = setTimer(function()
			fixVehicle(vehicle)
			setElementFrozen(vehicle, false)
			sendMessageForAllInGarage("Die kleine Reparatur von Fahrzeug: "..getVehicleNameFromModel(getElementModel(vehicle)).." wurde erledigt!")
		end, 5000, 1)
	elseif(tuning == "Grosse Reparatur") then
		sendMessageForAllInGarage("Das Fahrzeug "..getVehicleNameFromModel(getElementModel(vehicle)).." wird bearbeitet!")
		setElementFrozen(vehicle, true)
		local money = laGetElementData (source, "money")
		laSetElementData (source, "money", money - preis)
		givePlayerMoney(source, -preis)
		local gewinn = math.floor(preis/5)
		local newmoney = laGetElementData (source, "money")
		local kosten = preis - gewinn
		local Totalschadenkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Totalschaden'") )
		local Totalschadenkassenew = math.floor(Totalschadenkasse + (kosten))
		MySQL_SetString("staat", "Menge", Totalschadenkassenew, "Name LIKE 'Totalschaden'")
		local thePlayer = source
		veh_tuningtimer[vehicle] = setTimer(function()
			fixVehicle(vehicle)
			setElementHealth(vehicle, 1500)
			setElementFrozen(vehicle, false)
			removeVehicleTotalschaden(vehicle)
			sendMessageForAllInGarage("Die grosse Reparatur von Fahrzeug: "..getVehicleNameFromModel(getElementModel(vehicle)).." wurde erledigt!")
		end, 30000, 1)
	elseif(tuning == "Nitro") then
		sendMessageForAllInGarage("Das Fahrzeug "..getVehicleNameFromModel(getElementModel(vehicle)).." wird bearbeitet!")
		setElementFrozen(vehicle, true)
		local money = laGetElementData (source, "money")
		laSetElementData (source, "money", money - preis)
		givePlayerMoney(source, -preis)
		local thePlayer = source
		veh_tuningtimer[vehicle] = setTimer(function()
			addVehicleUpgrade(vehicle, 1010)
			setElementFrozen(vehicle, false)
			sendMessageForAllInGarage("In dem Fahrzeug: "..getVehicleNameFromModel(getElementModel(vehicle)).." wurde Nitro eingebaut!")
		end, 5000, 1)
	elseif(tuning == "Neue Reifen") then
		sendMessageForAllInGarage("Das Fahrzeug "..getVehicleNameFromModel(getElementModel(vehicle)).." wird bearbeitet!")
		setElementFrozen(vehicle, true)
		local money = laGetElementData (source, "money")
		laSetElementData (source, "money", money - preis)
		givePlayerMoney(source, -preis)
		local thePlayer = source
		veh_tuningtimer[vehicle] = setTimer(function()
			
			setElementFrozen(vehicle, false)
			sendMessageForAllInGarage("Die Reifen vom Fahrzeug: "..getVehicleNameFromModel(getElementModel(vehicle)).." wurden erneuert!")
		end, 5000, 1)
	elseif(tuning == "Sportmotor") then
		if(getElementData(vehicle, "tuning.motor") == true) then
			outputChatBox("Das Fahrzeug hat bereits einen besseren Motor!", source, 255, 0, 0)
			return
		else
			sendMessageForAllInGarage("Das Fahrzeug "..getVehicleNameFromModel(getElementModel(vehicle)).." wird bearbeitet!")
			setElementFrozen(vehicle, true)
			local money = laGetElementData (source, "money")
			laSetElementData (source, "money", money - preis)
			givePlayerMoney(source, -preis)
			local thePlayer = source
			veh_tuningtimer[vehicle] = setTimer(function()
				local sportmotor = 1
				giveVehicleBetterEngine(vehicle)
				local Besitzer = laGetElementData (vehicle, "owner")
				local Slot = laGetElementData ( vehicle, "carslotnr_owner" )
				MySQL_SetString("vehicles", "Sportmotor", sportmotor, "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
				setElementData(vehicle, "tuning.motor", true)
				setElementFrozen(vehicle, false)
				sendMessageForAllInGarage("Der neue Motor wurde erfolgreich in Fahrzeug: "..getVehicleNameFromModel(getElementModel(vehicle)).." eingebaut!")
			end, 5000, 1)
		end
	end
end)