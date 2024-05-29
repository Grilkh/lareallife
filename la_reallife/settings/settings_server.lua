testmode = false
winterzeit = 0
maxplayers = 140
wctime = 20
speznr = { [911]=true, [110]=true, [112]=true, [111]=true, [400]=true, [666]=true, [7676]=true, } -- 911=Polizei, 111=Auskunft, 400=Taxi, 666=Teufel
tramSpeed = 0.35

-- Cars
destcardim = 1
noobbikerespawn = 5
FCarIdleRespawn = 10
FCarDestroyRespawn = 0.1
noobrollerrespawntime = 5
noobrolleridlerespawntime = 600

-- Preise
nitroprice = 50
tuningpartprice = 75

paynsprayprice = 100
wantedprice = 30
wantedkill = 300
jailtimeperwanted = 10
hospitalcosts = 30
autosteuerprice = 30
autosteuererh = 1.5
drugprice = 30
smsprice = 2
smspriceflat = 1
smspriceabo = 1
callprice = 5
callpriceflat = 2
callpriceabo = 3
aboprice = 100
flatrateprice = 50
adcosts = 3
adbasiscosts = 10
pm_price = 250
carrestzeit = 10
carreststrafe = 100
carrestkaution = 0
arrestzeit = 7
arreststrafe = 70
arrestkaution1 = 200
arrestkaution2 = 2000

zinssatz = 0.5

-- Essen
salatprice = 5
smallpizzaprice = 3
normalpizzaprice = 7
bigpizzaprice = 10
salatheal = 10
smallpizzaheal = 5
normalpizzaheal = 15
bigpizzaheal = 20

validResources = { ["realdriveby"]=true, ["parachute"]=true, ["..resourceName.."]=true }
stopBadScripts = false

function resourceStart ( resource )

	if not validResources [ getResourceName ( resource ) ] then
		if stopBadScripts then
			cancelEvent()
		end
	end
end
addEventHandler ( "onResourcePreStart", getRootElement(), resourceStart )