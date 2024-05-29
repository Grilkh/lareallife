------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

createBlip (-2055.3654, 7.7953, 35.328, 37, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local hinweis0marker = createMarker ( -2055.3654, 7.7953, 35.328, "corona", 1, 125, 255, 200, 255 )
local bodymarker = createMarker ( 1944.0626220703, -545.39880371094, 18.816662597656, "corona", 1, 125, 255, 200, 255 )
local hinweis1marker = createMarker ( 1919.2958984375, -530.6015625, 20.378124237061, "corona", 1, 125, 255, 0, 0 )
local hinweis2marker = createMarker ( 1378.220703125, 2952.767578125, 47.522925567627, "corona", 1, 125, 255, 255, 255 )
local hinweis3marker = createMarker ( -850.72392578125, -1953.9810791016, 14.0351993560791, "corona", 1, 125, 255, 255, 255 )
local hinweis4marker = createMarker ( -2147.5598144531, -1662.4805908203, 300.87725830078, "corona", 2, 125, 255, 255, 255 )
local hinweis5marker = createMarker ( 2965.324, 977.05, 33.564, "corona", 1, 125, 255, 255, 255 )
--[[local hinweis6marker = createMarker ( 1914.694, -510.379, 18.3869, "corona", 1, 125, 255, 255, 255 )]]

function hinweis0_func ( lp )
if getElementData ( lp, "points" ) <= 1 then
	triggerClientEvent ( lp, "showHinweis0Gui", getRootElement() )
	setElementData ( lp, "points", 0 )
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis0marker, hinweis0_func )

function leiche_func ( lp )
if getElementData ( lp, "points" ) <= 1 then
	triggerClientEvent ( lp, "showLeicheGui", getRootElement() )
	setElementData ( lp, "points", 1 )
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", bodymarker, leiche_func )

function hinweis1_func ( lp )
if getElementData ( lp, "points" ) <= 2 then
	if getElementData ( lp, "points" ) == 0 then
		outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
	else
		triggerClientEvent ( lp, "showHinweis1Gui", getRootElement() )
		setElementData ( lp, "points", 2 )
	end
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis1marker, hinweis1_func )

function hinweis2_func ( lp )
if getElementData ( lp, "points" ) <= 3 then
	if getElementData ( lp, "points" ) <= 1 then
		outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
	else
	triggerClientEvent ( lp, "showHinweis2Gui", getRootElement() )
		setElementData ( lp, "points", 3 )
	end
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis2marker, hinweis2_func )

function hinweis3_func ( lp )
if getElementData ( lp, "points" ) <= 4 then
	if getElementData ( lp, "points" ) <= 2 then
		outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
	else
	triggerClientEvent ( lp, "showHinweis3Gui", getRootElement() )
		setElementData ( lp, "points", 4 )
	end
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis3marker, hinweis3_func )

function hinweis4_func ( lp )
if getElementData ( lp, "points" ) <= 5 then
	if getElementData ( lp, "points" ) <= 3 then
		outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
	else
	triggerClientEvent ( lp, "showHinweis4Gui", getRootElement() )
		setElementData ( lp, "points", 5 )
	end
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis4marker, hinweis4_func )


function hinweis5_func ( lp )
if getElementData ( lp, "points" ) <= 6 then
	if getElementData ( lp, "points" ) <= 4 then
		outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
	else
	triggerClientEvent ( lp, "showHinweis5Gui", getRootElement() )
		setElementData ( lp, "points", 6 )
	end
else
	outputChatBox ( "Hier warst du bereits!", lp, 125, 0, 0 )
end
end
addEventHandler ( "onMarkerHit", hinweis5marker, hinweis5_func )


function givethesuccessboni_func ( player )
--if getElementData ( player, "points" ) == 8 then
if laGetElementData ( player, "successallready") == true then

else
	laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 20000 )
	laSetElementData ( player, "successallready", true )
--	setElementData ( player, "points", 9 )
--end
end
end
addEvent ( "givethesuccessboni", true )
addEventHandler ( "givethesuccessboni", getRootElement(), givethesuccessboni_func )


--[[function hinweis6_func ( lp)
if not getPedOccupiedVehicle ( lp ) then
	if getElementData ( lp, "points" ) <= 7 then
		if getElementData ( lp, "points" ) <= 5 then
			outputChatBox ( "Hier kannst du noch nicht hin!", lp, 125, 0, 0 )
		else
			showChat ( false )
			screenWidth, screenHeight = guiGetScreenSize()
			toggleAllControls ( false )
			setElementPosition ( lp, 1915.531, -509.153, 18.408 )
			setPedRotation ( lp, 90 )
			fadeCamera ( false, 1, 0, 0, 0 )
			triggerClientEvent ( lp, "showMysteryBriefing", getRootElement() )
			MissionName = "Die überraschende Wende"
			addEventHandler("onClientRender",getRootElement(), createMissionName)
			showPlayerHudComponent ( "radar", false )
			setElementData ( lp, "points", 6 )
		end
	end
end
end
addEventHandler ( "onClientMarkerHit", hinweis6marker, hinweis6_func )]]