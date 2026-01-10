-- DEBUG --
function shootingranch ( player )

	local x, y, z = 2176.910, 920, 10.075
	setElementPosition ( player, x, y, z )
end
addCommandHandler ( "shootingranch09121994", shootingranch )
-- DEBUG --

local curDimension = 1

--[[shootingRanges = {}
 shootingRanges["x"] = {}
 shootingRanges["y"] = {}
 shootingRanges["z"] = {}
 shootingRanges["sx"] = {}
 shootingRanges["sy"] = {}
 shootingRanges["sz"] = {}
 shootingRanges["sr"] = {}
 local i = 0
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2176.910, 924.81, 10.075
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2176.910, 922.68, 10.075, 180

  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 256.08584594727, 1802.0675048828, 6.4703001976013
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 254.12063598633, 1802.0413818359, 7.0705094337463, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2282.251953125, 2423.759765625, 2.4626379013062
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2282.265625, 2425.4760742188, 3.1257882118225, 0
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -328.61669921875, 835.58874511719, 13.21817779541
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -330.22076416016, 835.6220703125, 13.891412734985, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -2615.6701660156, 205.30712890625, 3.7477607727051
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -2613.9396972656, 205.31129455566, 4.5365352630615, 90
  createObject ( 14819, -2616.5422363281, 206.02464294434, 4.8791799545288, 0, 0, 90 )
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -1594.5709228516, 716.26202392578, -5.9332661628723
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -1593.0947265625, 716.33172607422, -5.5929617881775, 90
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -2455.5949707031, 503.91421508789, 29.057998657227
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -2453.4343261719, 503.96768188477, 29.729562759399, 90
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2556.9567871094, 2065.1750488281, 10.08
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2556.9602050781, 2063.1391601563, 10.46, 180

for i, index in pairs ( shootingRanges["x"] ) do

	local x1, y1, z1 = shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i]
	local x2, y2, z2, r = shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i]
	
	createMarker ( x1, y1, z1, "cylinder", 1, 125, 0, 0, 150 )
	local marker = createMarker ( x1, y1, z1 + 1, "corona", 1, 125, 0, 0, 0 )
	setElementData ( marker, "x", x2 )
	setElementData ( marker, "y", y2 )
	setElementData ( marker, "z", z2 )
	setElementData ( marker, "r", r )
	addEventHandler ( "onMarkerHit", marker,
		function ( hit )
			if getElementType ( hit ) == "player" then
				if not getPedOccupiedVehicle ( hit ) then
					showCursor ( hit, true )
					triggerClientEvent ( hit, "showShootingRangeSelection", hit )
					local x, y, z, r = getElementData ( source, "x" ), getElementData ( source, "y" ), getElementData ( source, "z" ), getElementData ( source, "r" )
					setElementData ( hit, "shootingRangeX", x )
					setElementData ( hit, "shootingRangeY", y )
					setElementData ( hit, "shootingRangeZ", z )
					setElementData ( hit, "shootingRangeR", r )
				end
			end
		end
	)
end]]

SchiessstandSF = createMarker ( 286.243, -30.567, 1000.515625, "cylinder", 1.5, 0, 255, 0, 150 ) --Waffenkschiessstand im SF INT
setElementInterior (SchiessstandSF, 1)

function SchiessstandSF_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if laGetElementData ( hitElement, "gunlicense" ) == 1 then
				showCursor ( hitElement, true )
				triggerClientEvent ( hitElement, "showShootingRangeSelection", hitElement )
				setElementData ( hitElement, "shootingRangeX", 286.2635 )
				setElementData ( hitElement, "shootingRangeY", -32.5246 )
				setElementData ( hitElement, "shootingRangeZ", 1001.6156 )
				setElementData ( hitElement, "shootingRangeR", 180 )
		else
			triggerClientEvent ( hitElement, "infobox_start", getRootElement(), "\n\nDu hast keinen Waffenschein!", 7500, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", SchiessstandSF, SchiessstandSF_func )

function startShootingRanch_func ( gun )

	local player = client
	local id = shootingRangeGunIDs[gun]
	setElementDimension ( player, getFreeDimension () )
	takeAllWeapons ( player )
	if id == 22 then
		giveWeapon ( player, id, 102, true )
	elseif id == 23 then
		giveWeapon ( player, id, 102, true )
	elseif id == 24 then
		giveWeapon ( player, id, 63, true )
	elseif id == 25 then
		giveWeapon ( player, id, 50, true )
	elseif id == 28 then
		giveWeapon ( player, id, 100, true )
	elseif id == 29 then
		giveWeapon ( player, id, 90, true )
	elseif id == 30 then
		giveWeapon ( player, id, 100, true )
	elseif id == 31 then
		giveWeapon ( player, id, 100, true )
	end
		
	setElementFrozen ( player, true )
	setTimer ( setElementFrozen, 5000, 1, player, false )
	
	setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
	setPedRotation ( player, 90 )
	setElementInterior ( player, 7 )
	
	setTimer ( triggerClientEvent, 3000, 1, player, "startShootingRanchTest", player, id )
	
	setElementData ( player, "shootingRanchGun", id )
end
addEvent ( "startShootingRanch", true )
addEventHandler ( "startShootingRanch", getRootElement(), startShootingRanch_func )

--function endShootingRanchTest_func ( percent, hit )
function endShootingRanchTest_func ( percent, totalShootingRangeShots, id )

	local player = client
	local pname = getPlayerName ( player )
	
	outputChatBox ( ""..math.round(percent, 0).." Prozent der Schüsse haben die Zielscheiben getroffen!", player, 200, 200, 0 )
	
	if id == 22 then
		if totalShootingRangeShots >= 68 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "pistolskill", "hitman" )
					MySQL_SetString("bonustable", "PistolenSkill", laGetElementData ( player, "pistolskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "pistolskill", "pro" )
					MySQL_SetString("bonustable", "PistolenSkill", laGetElementData ( player, "pistolskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end		
	elseif id == 23 then
		if totalShootingRangeShots >= 68 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "silenceskill", "hitman" )
					MySQL_SetString("bonustable", "SilenceSkill", laGetElementData ( player, "silenceskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "silenceskill", "pro" )
					MySQL_SetString("bonustable", "SilenceSkill", laGetElementData ( player, "silenceskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 24 then
		if totalShootingRangeShots >= 28 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "deagleskill", "hitman" )
					MySQL_SetString("bonustable", "DeagleSkill", laGetElementData ( player, "deagleskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "deagleskill", "pro" )
					MySQL_SetString("bonustable", "DeagleSkill", laGetElementData ( player, "deagleskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 25 then
		if totalShootingRangeShots >= 20 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "shotgunskill", "hitman" )
					MySQL_SetString("bonustable", "ShotgunSkill", laGetElementData ( player, "shotgunskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "shotgunskill", "pro" )
					MySQL_SetString("bonustable", "ShotgunSkill", laGetElementData ( player, "shotgunskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 28 then
		if totalShootingRangeShots >= 45 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 75, 999 )
					laSetElementData ( player, "uziskill", "hitman" )
					MySQL_SetString("bonustable", "UziSkill", laGetElementData ( player, "uziskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 75, 950 )
					laSetElementData ( player, "uziskill", "pro" )
					MySQL_SetString("bonustable", "UziSkill", laGetElementData ( player, "uziskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 29 then
		if totalShootingRangeShots >= 45 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "mp5skill", "hitman" )
					MySQL_SetString("bonustable", "MP5Skills", laGetElementData ( player, "mp5skill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "mp5skill", "pro" )
					MySQL_SetString("bonustable", "MP5Skills", laGetElementData ( player, "mp5skill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 30 then
		if totalShootingRangeShots >= 45 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "akskill", "hitman" )
					MySQL_SetString("bonustable", "AKSkill", laGetElementData ( player, "akskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "akskill", "pro" )
					MySQL_SetString("bonustable", "AKSkill", laGetElementData ( player, "akskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	elseif id == 31 then
		if totalShootingRangeShots >= 45 then
			if percent >= 75 then
				if percent >= 90 then
					setPedStat ( player, 69, 1000 )
					laSetElementData ( player, "assaultskill", "hitman" )
					MySQL_SetString("bonustable", "AssaultSkill", laGetElementData ( player, "assaultskill" ), "Name LIKE '"..pname.."'")
				else
					setPedStat ( player, 69, 950 )
					laSetElementData ( player, "assaultskill", "pro" )
					MySQL_SetString("bonustable", "AssaultSkill", laGetElementData ( player, "assaultskill" ), "Name LIKE '"..pname.."'")
				end
			end
		end
	end
	
	setElementInterior ( player, 1 )
	setElementDimension ( player, 0 )
	
	local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
	setPedRotation ( player, r )
	setElementPosition ( player, x, y, z )
	
	takeWeapon ( player, getElementData ( player, "shootingRanchGun" ) )
	setElementData ( player, "shootingRanchGun", nil )
end
addEvent ( "endShootingRanchTest", true )
addEventHandler ( "endShootingRanchTest", getRootElement(), endShootingRanchTest_func )

function getFreeDimension ()

	curDimension = curDimension + 1
	return curDimension
end


function waffenskills (player)
	if laGetElementData ( player, "pistolskill" ) == "pro" then
		PistolenSkilly = "Profi"
	elseif laGetElementData ( player, "pistolskill" ) == "hitman" then
		PistolenSkilly = "Hitman"
	else
		PistolenSkilly = "Ungeskillt"
	end
	outputChatBox ( "Pistolenskill: "..PistolenSkilly.."", player, 0, 200, 0 )
	--[[if laGetElementData ( player, "silenceskill" ) == "pro" then
		SilenceSkilly = "Profi"
	elseif laGetElementData ( player, "silenceskill" ) == "hitman" then
		SilenceSkilly = "Hitman"
	else
		SilenceSkilly = "Ungeskillt"
	end
	outputChatBox ( "Schallgedämpfte 9mm Skill: "..SilenceSkilly.."", player, 0, 0, 200 )]]
	if laGetElementData ( player, "deagleskill" ) == "pro" then
		DeagleSkilly = "Profi"
	elseif laGetElementData ( player, "deagleskill" ) == "hitman" then
		DeagleSkilly = "Hitman"
	else
		DeagleSkilly = "Ungeskillt"
	end
	outputChatBox ( "Deagleskill: "..DeagleSkilly.."", player, 0, 200, 0 )
	if laGetElementData ( player, "shotgunskill" ) == "pro" then
		ShotgunSkilly = "Profi"
	elseif laGetElementData ( player, "shotgunskill" ) == "hitman" then
		ShotgunSkilly = "Hitman"
	else
		ShotgunSkilly = "Ungeskillt"
	end
	outputChatBox ( "Shotgunskill: "..ShotgunSkilly.."", player, 0, 0, 200 )
	if laGetElementData ( player, "uziskill" ) == "pro" then
		UziSkilly = "Profi"
	elseif laGetElementData ( player, "uziskill" ) == "hitman" then
		UziSkilly = "Hitman"
	else
		UziSkilly = "Ungeskillt"
	end
	outputChatBox ( "Uziskill: "..UziSkilly.."", player, 0, 200, 0 )
	if laGetElementData ( player, "mp5skill" ) == "pro" then
		MP5Skilly = "Profi"
	elseif laGetElementData ( player, "mp5skill" ) == "hitman" then
		MP5Skilly = "Hitman"
	else
		MP5Skilly = "Ungeskillt"
	end
	outputChatBox ( "MP5 Skill: "..MP5Skilly.."", player, 0, 0, 200 )
	if laGetElementData ( player, "akskill" ) == "pro" then
		AKSkilly = "Profi"
	elseif laGetElementData ( player, "akskill" ) == "hitman" then
		AKSkilly = "Hitman"
	else
		AKSkilly = "Ungeskillt"
	end
	outputChatBox ( "AK-47 Skill: "..AKSkilly.."", player, 0, 200, 0 )
	if laGetElementData ( player, "assaultskill" ) == "pro" then
		M4Skilly = "Profi"
	elseif laGetElementData ( player, "assaultskill" ) == "hitman" then
		M4Skilly = "Hitman"
	else
		M4Skilly = "Ungeskillt"
	end
	outputChatBox ( "M4 Skill: "..M4Skilly.."", player, 0, 0, 200 )
end
addCommandHandler ( "waffenskill", waffenskills )