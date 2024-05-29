------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

local HolzfaellerMarker = createMarker ( -1060.5999755859, -1205.5, 129.30000305176, "corona", 1.5, 0, 255, 0, 150 )

local function startJob ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		local newdim = tonumber ( laGetElementData ( hitElement, "playerid" ) ) + 1
		setElementPosition( hitElement, -1194.3000488281, -1089.9000244141, 128.89999389648 )
		setElementDimension ( hitElement, newdim )
		giveWeapon( hitElement, 9)
		triggerClientEvent ( hitElement, "HolzfaellerClientStart", getRootElement(), newdim )
	end
end
end
addEventHandler( "onMarkerHit", HolzfaellerMarker, startJob )


--clientseitig--

local holzcar1 = 
local dim = 0
function HolzfaellerClientStart_func (newdim)
	dim = newdim
	holzcar1 = createVehicle ( 579, -1196.3000488281, -1089.9000244141, 128.89999389648, 0, 0, 0 )
	setElementDimension (holzcar1, dim)
	setElementData ( lp, "isinholzmission", true )
	createHolzMission ( lp )
end
addEvent( "HolzfaellerClientStart", true)
addEventHandler ( "HolzfaellerClientStart", getRootElement(), HolzfaellerClientStart_func)

local Holzmarker ={
}

local HolzBlip ={
}

local Baum ={
}

function createHolzMission (lp)
Holzmarker[1] = createMarker ()
HolzBlip[1] = createBlip ()
Baum[1] = createObject ()

--Schleife, alle addEventHandler

end






--[[
Holzfällerjob annehmen S
Andere Dimension S
Motorsäge S
Walton 579 C
Bäume werden erstellt, rotes Blip für jeden Baum C
Zum Baum hingehen, draufklicken mit Motorsäge C
Schwarzer Bildschirm C
Holzblöcke am Boden, Baum weg C
Dann ins Auto einteigen und Holz anklicken C
Wenn genug nah, schwarzer Bildschirm, Holz aufgeladen C
Zum Lager zurückfahren C
Schwarzer Bildschirm, Wagen leer C
>>>Zum Baum gehen C



https://wiki.multitheftauto.com/wiki/OnClientClick





Wenn du den Job beenden willst, bring das Holz zur Fabrik C
Yankee 456 C
Einsteigen, Bäume werden gelöscht C
Schwarzer Bildschirm C
Holzblöcke im Auto, am Boden weg, Motorsäge weg C
Neus Blip bei der Firma C
Fahrzeug in den Marker fahren, raus aus dem Job, Lohn C/S
]]






--[[
function cancelHolzMission ( veh )
	if getElementData ( source, "isinholzmission" ) then
		if not getPedOccupiedVehicle ( source ) then
			if getElementData ( source, "isinholzmission" ) then
				local pname = getPlayerName ( source )
				if ( getElementModel ( veh ) == 579 ) then
					destroyElement ( veh )
					setElementDimension ( source, 0 )
					setElementData ( source, "isinholzmission", false )
					outputChatBox ( "Auftrag abgebrochen - Du hast das Fahrzeug verlassen!", source, 125, 0, 0 )
					setElementPosition ( source, -1058.6999511719, -1195.6999511719, 128.89999389648 )
					setElementDimension ( source, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), cancelHolzMission )
]]


function startHolzMission ( player )
	local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
	local pname = getPlayerName ( player )
	if getElementData ( player, "isinholzmission" ) then
		if getPedOccupiedVehicle ( player ) then
			if getElementData ( player, "isinholzmission" ) then
			
				-----------------------------------------
				_G["Grassplant0"..pname] = createObject(3409, -1178.8000488281, -1055.1999511719, 127.19999694824)
				_G["Grassplant1"..pname] = createObject(3409, -1159.1999511719, -1055.0999755859, 127.19999694824)
				_G["Grassplant2"..pname] = createObject(3409, -1141, -1015.9000244141, 127.19999694824)
				_G["Grassplant3"..pname] = createObject(3409, -1112, -993.20001220703, 127.19999694824)
				_G["Grassplant4"..pname] = createObject(3409, -1125.3000488281, -959.90002441406, 127.19999694824)
				_G["Grassplant5"..pname] = createObject(3409, -1123.8000488281, -992.59997558594, 127.19999694824)
				_G["Grassplant6"..pname] = createObject(3409, -1163.1999511719, -1012, 127.19999694824)
				_G["Grassplant7"..pname] = createObject(3409, -1173.900024414, -980.79998779297, 127.19999694824)
				_G["Grassplant8"..pname] = createObject(3409, -1106.9000244141, -980.29998779297, 127.19999694824)
				_G["Grassplant9"..pname] = createObject(3409, -1096.9000244141, -958.5, 127.19999694824)
				_G["Grassplant10"..pname] = createObject(3409, -1084.4000244141, -996.90002441406, 127.19999694824)
				_G["Grassplant11"..pname] = createObject(3409, -1102.0999755859, -1013.799987793, 127.19999694824)
				_G["Grassplant12"..pname] = createObject(3409, -1093.6999511719, -992.70001220703, 127.19999694824)
				_G["Grassplant13"..pname] = createObject(3409, -1078.1999511719, -1011.9000244141, 127.19999694824)
				_G["Grassplant14"..pname] = createObject(3409, -1097.5999755859, -1031.3000488281, 127.19999694824)
				_G["Grassplant15"..pname] = createObject(3409, -1117, -1022.299987793, 127.19999694824)
				_G["Grassplant16"..pname] = createObject(3409, -1124.5999755859, -1031.6999511719, 127.19999694824)
				_G["Grassplant17"..pname] = createObject(3409, -1107, -1047.5999755859, 127.19999694824)
				_G["Grassplant18"..pname] = createObject(3409, -1092, -1040.5999755859, 127.19999694824)
				_G["Grassplant19"..pname] = createObject(3409, -1068.6999511719, -1051.8000488281, 127.19999694824)
				_G["Grassplant20"..pname] = createObject(3409, -1075.0999755859, -977.79998779297, 127.19999694824)
				_G["Grassplant21"..pname] = createObject(3409, -1113.8000488281, -954.29998779297, 127.19999694824)
				_G["Grassplant22"..pname] = createObject(3409, -1136.3000488281, -973.40002441406, 127.19999694824)
				_G["Grassplant23"..pname] = createObject(3409, -1135.0999755859, -999.20001220703, 127.19999694824)
				_G["Grassplant24"..pname] = createObject(3409, -1157.0999755859, -1022.0999755859, 127.19999694824)
				_G["Grassplant25"..pname] = createObject(3409, -1134.6999511719, -1042.5, 127.19999694824)
				_G["Grassplant26"..pname] = createObject(3409, -1155.1999511719, -1043.4000244141, 127.19999694824)
				_G["Grassplant27"..pname] = createObject(3409, -1177.5, -1032.6999511719, 127.19999694824)
				_G["Grassplant28"..pname] = createObject(3409, -1172.5, -1002.200012207, 127.19999694824)
				_G["Grassplant29"..pname] = createObject(3409, -1156.1999511719, -968.59997558594, 127.19999694824)
				_G["Grassplant30"..pname] = createObject(3409, -1139.9000244141, -947.29998779297, 127.19999694824)
				setElementDimension ( _G["Grassplant0"..pname], dim )
				setElementDimension ( _G["Grassplant1"..pname], dim )
				setElementDimension ( _G["Grassplant2"..pname], dim )
				setElementDimension ( _G["Grassplant3"..pname], dim )
				setElementDimension ( _G["Grassplant4"..pname], dim )
				setElementDimension ( _G["Grassplant5"..pname], dim )
				setElementDimension ( _G["Grassplant6"..pname], dim )
				setElementDimension ( _G["Grassplant7"..pname], dim )
				setElementDimension ( _G["Grassplant8"..pname], dim )
				setElementDimension ( _G["Grassplant9"..pname], dim )
				setElementDimension ( _G["Grassplant10"..pname], dim )
				setElementDimension ( _G["Grassplant11"..pname], dim )
				setElementDimension ( _G["Grassplant12"..pname], dim )
				setElementDimension ( _G["Grassplant13"..pname], dim )
				setElementDimension ( _G["Grassplant14"..pname], dim )
				setElementDimension ( _G["Grassplant15"..pname], dim )
				setElementDimension ( _G["Grassplant16"..pname], dim )
				setElementDimension ( _G["Grassplant17"..pname], dim )
				setElementDimension ( _G["Grassplant18"..pname], dim )
				setElementDimension ( _G["Grassplant19"..pname], dim )
				setElementDimension ( _G["Grassplant20"..pname], dim )
				setElementDimension ( _G["Grassplant21"..pname], dim )
				setElementDimension ( _G["Grassplant22"..pname], dim )
				setElementDimension ( _G["Grassplant23"..pname], dim )
				setElementDimension ( _G["Grassplant24"..pname], dim )
				setElementDimension ( _G["Grassplant25"..pname], dim )
				setElementDimension ( _G["Grassplant26"..pname], dim )
				setElementDimension ( _G["Grassplant27"..pname], dim )
				setElementDimension ( _G["Grassplant28"..pname], dim )
				setElementDimension ( _G["Grassplant29"..pname], dim )
				setElementDimension ( _G["Grassplant30"..pname], dim )
				-----------------------------------------
				
				
				function hitGrassplant0 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant0"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant0Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant0"..pname])
						destroyElement(_G["Grassplant0Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant0Marker"..pname], hitGrassplant0)

				function hitGrassplant1 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant1"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant1Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant1"..pname])
						destroyElement(_G["Grassplant1Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant1Marker"..pname], hitGrassplant1)

				function hitGrassplant2 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant2"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant2Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant2"..pname])
						destroyElement(_G["Grassplant2Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant2Marker"..pname], hitGrassplant2)
				
				function hitGrassplant3 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant3"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant3Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant3"..pname])
						destroyElement(_G["Grassplant3Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant3Marker"..pname], hitGrassplant3)
				
				function hitGrassplant4 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant4"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant4Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant4"..pname])
						destroyElement(_G["Grassplant4Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant4Marker"..pname], hitGrassplant4)
				
				function hitGrassplant5 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant5"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant5Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant5"..pname])
						destroyElement(_G["Grassplant5Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant5Marker"..pname], hitGrassplant5)
				
				function hitGrassplant6 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant6"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant6Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant6"..pname])
						destroyElement(_G["Grassplant6Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant6Marker"..pname], hitGrassplant6)
				
				function hitGrassplant7 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant7"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant7Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant7"..pname])
						destroyElement(_G["Grassplant7Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant7Marker"..pname], hitGrassplant7)
				
				function hitGrassplant8 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant8"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant8Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant8"..pname])
						destroyElement(_G["Grassplant8Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant8Marker"..pname], hitGrassplant8)
				
				function hitGrassplant9 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant9"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant9Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant9"..pname])
						destroyElement(_G["Grassplant9Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant9Marker"..pname], hitGrassplant9)
				
				function hitGrassplant10 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant10"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant10Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant10"..pname])
						destroyElement(_G["Grassplant10Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant10Marker"..pname], hitGrassplant10)
				
				function hitGrassplant11 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant11"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant11Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant11"..pname])
						destroyElement(_G["Grassplant11Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant11Marker"..pname], hitGrassplant11)
				
				function hitGrassplant12 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant12"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant12Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant12"..pname])
						destroyElement(_G["Grassplant12Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant12Marker"..pname], hitGrassplant12)
				
				function hitGrassplant13 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant13"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant13Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant13"..pname])
						destroyElement(_G["Grassplant13Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant13Marker"..pname], hitGrassplant13)
				
				function hitGrassplant14 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant14"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant14Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant14"..pname])
						destroyElement(_G["Grassplant14Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant14Marker"..pname], hitGrassplant14)
				
				function hitGrassplant15 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant15"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant15Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant15"..pname])
						destroyElement(_G["Grassplant15Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant15Marker"..pname], hitGrassplant15)
				
				function hitGrassplant16 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant16"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant16Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant16"..pname])
						destroyElement(_G["Grassplant16Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant16Marker"..pname], hitGrassplant16)
				
				function hitGrassplant17 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant17"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant17Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant17"..pname])
						destroyElement(_G["Grassplant17Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant17Marker"..pname], hitGrassplant17)
				
				function hitGrassplant18 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant18"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant18Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant18"..pname])
						destroyElement(_G["Grassplant18Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant18Marker"..pname], hitGrassplant18)
				
				function hitGrassplant19 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant19"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant19Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant19"..pname])
						destroyElement(_G["Grassplant19Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant19Marker"..pname], hitGrassplant19)
				
				function hitGrassplant20 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant20"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant20Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant20"..pname])
						destroyElement(_G["Grassplant20Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant20Marker"..pname], hitGrassplant20)
				
				function hitGrassplant21 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant21"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant21Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant21"..pname])
						destroyElement(_G["Grassplant21Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant21Marker"..pname], hitGrassplant21)
				
				function hitGrassplant22 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant22"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant22Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant22"..pname])
						destroyElement(_G["Grassplant22Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant22Marker"..pname], hitGrassplant22)
				
				function hitGrassplant23 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant23"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant23Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant23"..pname])
						destroyElement(_G["Grassplant23Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant23Marker"..pname], hitGrassplant23)
				
				function hitGrassplant24 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant24"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant24Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant24"..pname])
						destroyElement(_G["Grassplant24Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant24Marker"..pname], hitGrassplant24)
				
				function hitGrassplant25 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant25"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant25Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant25"..pname])
						destroyElement(_G["Grassplant25Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant25Marker"..pname], hitGrassplant25)
				
				function hitGrassplant26 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant26"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant26Marker"..pname] ) == dim then
							destroyElement(_G["Grassplant26"..pname])
							destroyElement(_G["Grassplant26Marker"..pname])
							local pmoney = laGetElementData ( player, "money" )
							laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant26Marker"..pname], hitGrassplant26)
				
				function hitGrassplant27 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant27"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant27Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant27"..pname])
						destroyElement(_G["Grassplant27Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant27Marker"..pname], hitGrassplant27)
				
				function hitGrassplant28 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant28"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant28Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant28"..pname])
						destroyElement(_G["Grassplant28Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant28Marker"..pname], hitGrassplant28)
				
				function hitGrassplant29 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant29"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant29Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant29"..pname])
						destroyElement(_G["Grassplant29Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant29Marker"..pname], hitGrassplant29)
				
				function hitGrassplant30 (player)
				local pname = getPlayerName ( player )
				local dim = tonumber ( laGetElementData ( player, "playerid" ) ) + 1
				if getElementDimension ( _G["Grassplant30"..pname] ) == dim then
					if getElementDimension ( _G["Grassplant30Marker"..pname] ) == dim then
						destroyElement(_G["Grassplant30"..pname])
						destroyElement(_G["Grassplant30Marker"..pname])
						local pmoney = laGetElementData ( player, "money" )
						laSetElementData ( player, "money", pmoney +5 )
					end
				end
				end
				addEventHandler("onMarkerHit", _G["Grassplant30Marker"..pname], hitGrassplant30)		
			end
		end
	end
end