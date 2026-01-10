aiGuns = {}
 aiGuns[1] = 24
 aiGuns[2] = 25
 aiGuns[3] = 29
 aiGuns[4] = 33
 aiGuns[5] = 18
 aiGuns[6] = 39
 
aiGunNames = {}
 aiGunNames[24] = "Desert Eagle,\n3 Magazine"
 aiGunNames[25] = "Schrotflinte,\n10 Schuss"
 aiGunNames[29] = "MP5,\n3 Magazine"
 aiGunNames[33] = "Gewehr,\n15 Schuss"
 aiGunNames[18] = "Molotov Cocktail"
 aiGunNames[39] = "Fernzünd-\nSprengladung"
 
aiGunPrices = {}
 aiGunPrices[1] = 80
 aiGunPrices[2] = 75
 aiGunPrices[3] = 120
 aiGunPrices[4] = 50
 aiGunPrices[5] = 100
 aiGunPrices[6] = 350

aiTypes = {}
 aiTypes["skins"] = {}
 aiTypes["desc"] = {}
  curCount = 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 28, "dealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 29, "wdealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 158, "sdealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 137, "bum"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 179, "gunbuyer"
  totalAITypes = curCount

cityAI = {}
 cityAI["x"] = {}
 cityAI["y"] = {}
 cityAI["z"] = {}
 cityAI["r"] = {}
  curCount = 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1961.2078857422, 107.52017211914, 26.6875, 270
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2020.4782714844, 127.30358886719, 27.528022766113, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2772.806640625, 409.33831787109, 3.5040059089661, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2697.265625, 1240.5930175781, 54.782981872559, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1521.5966796875, 677.75769042969, 6.1875, 135, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1828.7847900391, -7.417350769043, 14.1171875, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2485.98046875, -621.15838623047, 131.55926513672, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2269.8254394531, -149.42747497559, 34.3203125, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2679.9028320313, 1277.2310791016, 6.1875, 90
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1539.8505859375, 567.95629882813, 6.1764278411865, 125
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2097.5668945313, 72.748497009277, 34.3203125, 180
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1988.9609375, 1115.1696777344, 53.476852416992, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = 2083.48046875, -1263.6533203125, 23.993480682373, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = 1370.314453125, -1311.2021484375, 13.546875, 180
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = 2050.12109375, -1802.666015625, 14.850131988525, 180
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = 803.0107421875, -1603.5458984375, 13.546875, 90
  totalAISpots = curCount

  
usedAIPositions = {}

function generateWeapon()

	local rnd = math.random ( 1, 6 )
	if rnd == 6 then
		rnd = math.random ( 1, 6 )
	end
	return rnd
end
  
function createNewAI ()

	local i = 1
	while true do
		local rnd = math.random ( 1, totalAISpots )
		i = i + 1
		if i >= 5 then
			break
		elseif not usedAIPositions[rnd] then
			usedAIPositions[rnd] = true
			outputLog ( "[BOTS]: Bot erstellt." , "save" )
			local x, y, z, r = cityAI["x"][rnd], cityAI["y"][rnd], cityAI["z"][rnd], cityAI["r"][rnd]
			z = z + 0.65
			r = r - 90
			local typ = math.random ( 1, totalAITypes )
			local skin =  aiTypes["skins"][typ]
			typ = aiTypes["desc"][typ]
			
			local ped = createPed ( skin, x, y, z, r )
			outputDebugString("ai_city: 109 - PED erstellt ped")
			setPedRotation ( ped, r )
			laSetElementData ( ped, "typ", typ )
			laSetElementData ( ped, "clickPed", true )
			laSetElementData ( ped, "pos", rnd )
			
			if typ == "wdealer" then
				local gun = generateWeapon()
				local price = math.floor ( aiGunPrices[gun] * math.random ( 7, 15 ) / 10 )
				laSetElementData ( ped, "item", aiGuns[gun] )
				laSetElementData ( ped, "price", price )
			elseif typ == "sdealer" then
				local rnd = math.random ( 10, 100 )
				local price = math.floor ( rnd * math.random ( 5, 15 ) / 10 * 40 )
				laSetElementData ( ped, "item", rnd )
				laSetElementData ( ped, "price", price )
			elseif typ == "dealer" then
				local rnd = math.random ( 10, 100 )
				local price = math.floor ( rnd * math.random ( 7, 15 ) )
				laSetElementData ( ped, "item", rnd )
				laSetElementData ( ped, "price", price )
			elseif typ == "gunbuyer" then
				local rnd = math.random ( 1, 3 )
				if rnd == 1 then
					local price = math.random ( 100, 500 )
					laSetElementData ( ped, "item", 22 )
					laSetElementData ( ped, "price", price )
				elseif rnd == 2 then
					local price = math.random ( 75, 300 )
					laSetElementData ( ped, "item", 4 )
					laSetElementData ( ped, "price", price )
				else
					local price = math.random ( 250, 750 )
					laSetElementData ( ped, "item", 29 )
					laSetElementData ( ped, "price", price )
				end
			end
			
			addEventHandler ( "onPedWasted", ped,
				function ( ammo, killer )
					setTimer ( destroyElement, 10000, 1, ped )
					usedAIPositions[rnd] = false
					if killer then
						laSetElementData ( killer, "wanteds", laGetElementData ( killer, "wanteds" ) + 2 )
						if laGetElementData ( killer, "wanteds" ) > 6 then
							laSetElementData ( killer, "wanteds", 6 )
							setPlayerWantedLevel ( killer, 6 )
						else
							setPlayerWantedLevel ( killer, laGetElementData ( killer, "wanteds" ) )
						end
						outputChatBox ( "Du hast ein Verbrechen begangen: Mord", killer, 0, 0, 200 )
					end
				end
			)
			break
		end
	end
end
createNewAI ()
createNewAI ()
createNewAI ()
createNewAI ()
createNewAI ()
-- setTimer ( createNewAI, 180000, -1 )
setTimer ( createNewAI, 180000, 0 )

function agreeWithPed_func ()

	local player = source
	local ped = laGetElementData ( player, "curclicked" )
	if isElement ( ped ) then
		if not isPedDead ( ped ) then
			local typ = laGetElementData ( ped, "typ" )
			local item = laGetElementData ( ped, "item" )
			local price = laGetElementData ( ped, "price" )
			if typ == "bum" then
				local sucess = false
				for i = 1, 3 do
					if laGetElementData ( player, "food"..i ) == 3 then
						sucess = true
						laSetElementData ( player, "food"..i, 0 )
						break
					end
				end
				if not sucess then
					outputChatBox ( "Du hast keinen Burger dabei!", player, 125, 0, 0 )
				else
					outputChatBox ( "Aus Dank hat dir der Obdachlose 100 $ Geschenkt", player, 0, 125, 0 )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 100 )
					givePlayerMoney ( player, 100 )
					vanishPed ( ped )
				end
			elseif typ == "wdealer" then
				local money = laGetElementData ( player, "money" )
				if money >= price then
					local ammo
					if item == 24 then
						ammo = 21
					elseif item == 25 then
						ammo = 10
					elseif item == 29 then
						ammo = 90
					elseif item == 33 then
						ammo = 15
					else
						ammo = 1
					end
					giveWeapon ( player, item, ammo )
					laSetElementData ( player, "money", money - price )
					takePlayerMoney ( player, price )
					outputChatBox ( "Waffendealer: Sag niemanden davon!", player, 200, 200, 200 )
					vanishPed ( ped )
				else
					outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
				end
			elseif typ == "sdealer" then
				local money = laGetElementData ( player, "money" )
				if money >= price then
					laSetElementData ( player, "money", money - price )
					takePlayerMoney ( player, price )
					laSetElementData ( player, "flowerseeds", laGetElementData ( player, "flowerseeds" ) + item )
					outputChatBox ( "Junky: Je länger sie wächst, desto mehr kannst du ernten!", player, 200, 200, 200 )
					vanishPed ( ped )
				else
					outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
				end
			elseif typ == "dealer" then
				local money = laGetElementData ( player, "money" )
				if money >= price then
					laSetElementData ( player, "money", money - price )
					takePlayerMoney ( player, price )
					laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) + item )
					outputChatBox ( "Dealer: Dann mal viel Spass...", player, 200, 200, 200 )
					vanishPed ( ped )
				else
					outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
				end
			elseif typ == "gunbuyer" then
				local money = laGetElementData ( player, "money" )
				if item == 22 and getPedWeapon ( player, 2 ) == 22 then
					laSetElementData ( player, "money", money + price )
					outputChatBox ( "Käufer: Danke, jetzt kann ich mich endlich um meine Frau kümmern...", player, 200, 200, 200 )
					takeWeapon ( player, 22 )
					vanishPed ( ped )
				elseif item == 4 and getPedWeapon ( player, 1 ) == 4 then
					laSetElementData ( player, "money", money + price )
					outputChatBox ( "Käufer: Danke, ich werde Spass haben!", player, 200, 200, 200 )
					takeWeapon ( player, 4 )
					vanishPed ( ped )
				elseif item == 29 and getPedWeapon ( player, 4 ) == 29 then
					laSetElementData ( player, "money", money + price )
					outputChatBox ( "Käufer: Damit kann ich endlich lustige Dinge unternehmen!", player, 200, 200, 200 )
					takeWeapon ( player, 29 )
					vanishPed ( ped )
				else
					outputChatBox ( "Du hast die entsprechende Waffe nicht!", player, 125, 0, 0 )
				end
			end
		else
			outputChatBox ( "Du kannst nicht mit Toten Geschäfte machen!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "agreeWithPed", true )
addEventHandler ( "agreeWithPed", getRootElement(), agreeWithPed_func )

function vanishPed ( ped )

	if isElement ( ped ) then
		laSetElementData ( ped, "typ", nil )
		for i = 1, 25 do
			setTimer ( setElementAlpha, 100 * i, 1, ped, 255 / 25 * ( 25 - i ) )
		end
		setTimer ( destroyElement, 2500, 1, ped )
		usedAIPositions[laGetElementData ( ped, "pos" )] = nil
	end
end