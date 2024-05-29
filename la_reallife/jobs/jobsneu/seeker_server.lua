------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local newAssignM = createMarker ( 1305.0126953125 , -1369.9697265625 , 12.568832397461 , "cylinder" , 2 , 255 , 153 , 0 )

addEventHandler ( "onMarkerHit" , newAssignM ,
	function ( hElement , mDim )
		if not mDim or getElementType ( hElement ) ~= "player" or not getPlayerTeam ( hElement ) or getTeamName ( getPlayerTeam ( hElement ) ) ~= "Sucher" or isPedInVehicle ( hElement ) then
			return
		end
		local rand = math.random ( #bcTable )
		local bcData = bcTable [ rand ]
		local posX , posY , posZ = unpack ( bcData )
		local prize = getDistanceBetweenPoints3D ( 1305.0126953125 , -1369.9697265625 , 12.568832397461 , posX , posY , posZ ) * settingBriefcasePrize
		prize = string.format ( "%.f" , prize )
		triggerClientEvent ( hElement , "client:showNAGUI" , hElement , prize )
		setElementData ( hElement , "naIndex" , rand )
	end
)

addEvent ( "server:startAssign" , true )
addEventHandler ( "server:startAssign" , root ,
	function ( )
		if getTeamName ( getPlayerTeam ( source ) ) ~= "Sucher" then
			return
		end
		if getElementData ( source , "gAssignment" ) then
			outputChatBox ( "Du musst 10 Minuten warten, um einen neuen Auftrag anzunehmen." , source , 200 , 200 , 200 )
			for index , briefcase in ipairs ( getElementsByType ( "pickup" , resourceRoot ) ) do
				if getElementData ( briefcase , "player" ) == source then
					destroyElement ( briefcase )
					break
				end
			end
			return
		end
		local bcData = bcTable [ getElementData ( source , "naIndex" ) ]
		local posX , posY , posZ = unpack ( bcData )
		local bc = createPickup ( posX , posY , posZ , 3 , 1210 )
		setElementData ( bc , "player" , source )
		setElementData ( source , "gAssignment" , true )
			outputChatBox("Du hast 10 Minuten um den Aktenkoffer zu finden!", source, 192, 192, 192)
		addEventHandler ( "onPickupHit" , bc ,
			function ( player )
				if not getPlayerTeam ( player ) or getTeamName ( getPlayerTeam ( player ) ) ~= "Sucher" or getElementData ( bc , "player" ) ~= player then
					cancelEvent ( )
					return
				end
				local posX , posY , posZ = getElementPosition ( source )
				local prize = getDistanceBetweenPoints3D ( 1305.0126953125 , -1369.9697265625 , 12.568832397461 , posX , posY , posZ ) * settingBriefcasePrize
				prize = string.format ( "%.f" , prize )
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) + prize )
				outputChatBox ( "Du hast den Aktenkoffer gefunden und verdienst #00FF00$" .. prize , player , 255 , 153 , 0 , true )
				triggerClientEvent ( player , "client:playCashSound" , player )
				destroyElement ( source )
			end
		)		
		setCameraMatrix ( source , posX - 30 , posY , posZ + 30 , posX , posY , posZ )
		setElementFrozen ( source , true )
		triggerClientEvent ( source , "client:showLocation" , source , true , getZoneName ( posX , posY , posZ , false ) , getZoneName ( posX , posY , posZ , true ) )
		setTimer (
			function ( player )
				setCameraTarget ( player )
				setElementFrozen ( player , false )
				local posX2 , posY2 , posZ2 = getElementPosition ( player )
				setElementPosition ( player , posX2 + 2 , posY2 , posZ2 + 1 )
				triggerClientEvent ( player , "client:showLocation" , player , false )
			end
		, 5000 , 1 , source )
		setTimer (
			function ( player , bc )
				removeElementData ( player , "gAssignment" )
				destroyElement ( bc )
				outputChatBox ( "Mission Aktenkoffer fehlgeschlagen!" , player , 200 , 200 , 200 )
			end
		, 600000 , 1 , source , bc )
	end
)