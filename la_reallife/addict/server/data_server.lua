function loadAddictionsForPlayer ( player )
	laSetElementData ( player, "cigarettAddictPoints", 0 )
	laSetElementData ( player, "alcoholAddictPoints", 0 )
	laSetElementData ( player, "weedAddictPoints", 0 )
	laSetElementData ( player, "koksAddictPoints", 0 )
		
	laSetElementData ( player, "cigarettFlushPoints", 0 )
	laSetElementData ( player, "alcoholFlushPoints", 0 )
	laSetElementData ( player, "weedFlushPoints", 0 )
	laSetElementData ( player, "koksFlushPoints", 0 )
end

function saveAddictionsForPlayer ( player )
end

function restoreWeather()
	local ww,bb = getWeather()
	triggerClientEvent(source, "restoreWeather", source, ww)
end

addEvent("restoreWeather", true)
addEventHandler("restoreWeather", getRootElement(), restoreWeather)
