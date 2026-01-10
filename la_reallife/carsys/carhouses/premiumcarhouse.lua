premiumCarHouseMarker = createMarker ( 1583.944, 1224.283, 10.957, "corona", 2, 255, 0, 0, 255 )

function premiumCarHouseMarkerHit ( hitElement )

	if not getPedOccupiedVehicle ( hitElement ) then
		if isPremium(hitElement) then
			setElementPosition(hitElement, 1615.783, 1160.978, 14.219)
			infobox ( hitElement, "\n\nWillkommen im Premium-Autohaus!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Nur für Premiumuser!", hitElement, 150, 0, 0 )
		end	
	end
end
addEventHandler ( "onMarkerHit", premiumCarHouseMarker, premiumCarHouseMarkerHit )

premiumCarHouseMarkerOut = createMarker ( 1619.243, 1156.872, 14.219, "corona", 2, 255, 0, 0, 255 )

function premiumCarHouseMarkerHitOut ( hitElement )
	if not getPedOccupiedVehicle ( hitElement ) then
		setElementPosition(hitElement, 1585.073, 1232.035, 10.812)
	end
end
addEventHandler ( "onMarkerHit", premiumCarHouseMarkerOut, premiumCarHouseMarkerHitOut )