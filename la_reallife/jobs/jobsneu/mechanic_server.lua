------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------


addEventHandler("onPlayerSpawn", root,
	function()
		if isPlayerInTeam(source, "Mechaniker") then
			giveWeapon(source, 41, 1000)
		end
	end
)

addEventHandler("onPlayerLogin", root,
	function()
		setTimer(
			function(source)
				if isPlayerInTeam(source, "Mechaniker") then
					triggerClientEvent(source, "setMechaniker", source)
					setElementData(source, "canFix", true)
				end
				setElementData(source, "orderedMechaniker", false)
			end
		, 500, 1, source)
	end
)

addEventHandler("onResourceStart", resourceRoot,
	function()
		setTimer(
			function()
				for i, v in ipairs(getElementsByType("player")) do
					if not isGuestAccount(getPlayerAccount(v)) then
						if isPlayerInTeam(v, "Mechaniker") then
							triggerClientEvent(v, "setMechaniker", v)
							setElementData(v, "canFix", true)
						end
						setElementData(v, "orderedMechaniker", false)
					end
				end
			end
		, 500, 1)
	end
)


addEventHandler("onResourceStart", resourceRoot,
	function()
		NoDriverTXT = textCreateDisplay()
		NoDriverITEM = textCreateTextItem("Das Fahrzeug hat keinen Fahrer", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(NoDriverTXT, NoDriverITEM)
		FixedCarTXT = textCreateDisplay()
		FixedCarITEM = textCreateTextItem("Dieses Fahrzeug ist unbeschädigt", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(FixedCarTXT, FixedCarITEM)
		PreventAbuseTXT = textCreateDisplay()
		PreventAbuseITEM = textCreateTextItem("Das Reparieren ist für 1 Minute blockiert", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(PreventAbuseTXT, PreventAbuseITEM)
		PoorDriverForMechanikerTXT = textCreateDisplay()
		PoorDriverForMechanikerITEM = textCreateTextItem("Der Fahrer hat zu wenig Geld", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(PoorDriverForMechanikerTXT, PoorDriverForMechanikerITEM)
		PoorDriverForDriverTXT = textCreateDisplay()
		PoorDriverForDriverITEM = textCreateTextItem("Du hast zu wenig Geld", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(PoorDriverForDriverTXT, PoorDriverForDriverITEM)
		DidntOrderTXT = textCreateDisplay()
		DidntOrderITEM = textCreateTextItem("Der Fahrer wünscht keine Reparatur", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(DidntOrderTXT, DidntOrderITEM)
		SuccesForDriverTXT = textCreateDisplay()
		SuccesForDriverITEM = textCreateTextItem("Dein Fahrzeug wurde für 100$ repariert", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(SuccesForDriverTXT, SuccesForDriverITEM)
		SuccesForMechanikerTXT = textCreateDisplay()
		SuccesForMechanikerITEM = textCreateTextItem("Das Fahrzeug wurde für 100$ repariert", 0.35, 0.8, "high", 0, 255, 0, 255, 2)
		textDisplayAddText(SuccesForMechanikerTXT, SuccesForMechanikerITEM)
		for i, v in ipairs(getElementsByType("player")) do
			setTimer(
				function(v)
					if isPlayerInTeam(v, "Mechaniker") then
						triggerClientEvent(v, "setMechaniker", v)
						setElementData(v, "canFix", true)
					end
					setElementData(v, "orderedMechaniker", false)
				end
			, 500, 1, v)
		end
	end
)

addEvent("fixTheVehicle", true)
addEventHandler("fixTheVehicle", root,
	function(mechaniker, vehicle)
		if isPlayerInTeam(mechaniker, "Mechaniker") then
			if getElementData(mechaniker, "canFix") then
				local driver = getVehicleOccupant(vehicle, 0)
				if driver then
					if getElementData(driver, "orderedMechaniker") then
						if getElementHealth(vehicle) < 1000 and getElementHealth(vehicle) > 0 then
							if laSetElementData (driver, "money", laGetElementData ( player, "money" ) ) >= 100 then
								if fixVehicle(vehicle) then
									laSetElementData ( driver, "money", laGetElementData ( player, "money" ) - 100 )
									laSetElementData ( mechaniker, "money", laGetElementData ( player, "money" ) + 100 )
									setElementData(driver, "orderedMechaniker", false)
									setElementData(mechaniker, "canFix", false)
									setTimer(setElementData, 60000, 1, mechaniker, "canFix", true)
									if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(SuccesForMechanikerTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, SuccesForMechanikerTXT, mechaniker) end
									if not textDisplayIsObserver(SuccesForDriverTXT, driver) and not textDisplayIsObserver(PoorDriverForDriverTXT, driver) then textDisplayAddObserver(SuccesForDriverTXT, driver) setTimer(textDisplayRemoveObserver, 6000, 1, SuccesForDriverTXT, driver) end
								end
							else
								if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(PoorDriverForMechanikerTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, PoorDriverForMechanikerTXT, mechaniker) end
								if not textDisplayIsObserver(SuccesForDriverTXT, driver) and not textDisplayIsObserver(PoorDriverForDriverTXT, driver) then textDisplayAddObserver(PoorDriverForDriverTXT, driver) setTimer(textDisplayRemoveObserver, 6000, 1, PoorDriverForDriverTXT, driver) end
							end
						else
							if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(FixedCarTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, FixedCarTXT, mechaniker) end
						end
					else
						if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(DidntOrderTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, DidntOrderTXT, mechaniker) end
					end
				else
					if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(NoDriverTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, NoDriverTXT, mechaniker) end
				end
			else
				if not textDisplayIsObserver(SuccesForMechanikerTXT, mechaniker) and not textDisplayIsObserver(PoorDriverForMechanikerTXT, mechaniker) and not textDisplayIsObserver(FixedCarTXT, mechaniker) and not textDisplayIsObserver(DidntOrderTXT, mechaniker) and not textDisplayIsObserver(PreventAbuseTXT, mechaniker) then textDisplayAddObserver(PreventAbuseTXT, mechaniker) setTimer(textDisplayRemoveObserver, 6000, 1, PreventAbuseTXT, mechaniker) end
			end
		end
	end
)

addCommandHandler("mechaniker",
	function(player)
		if isPlayerInTeam(player, "Mechaniker") then return end
		if getElementData(player, "orderedMechaniker") then return outputChatBox("Du hast bereits einen Mechaniker angefordert!", player) end
		if laSetElementData ( player, "money", laGetElementData ( player, "money" ) ) >= 50 then
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 50 )
			outputChatBox ( "Deine Anforderung wurde gesendet." , player , 200 , 200 , 200 )
			local x, y, z = getElementPosition(player)
			local zone = getZoneName(x, y, z)
			local city = getZoneName(x, y, z, true)
			setElementData(player, "orderedMechaniker", true)
			for i, v in ipairs(getPlayersInTeam(getTeamFromName("Mechaniker"))) do
				triggerClientEvent(v, "showOrder", v, player, zone, city)
			end
		else
			outputChatBox ( "Du hast nicht genug Geld!" , source , 200 , 200 , 200 )
		end
	end
)