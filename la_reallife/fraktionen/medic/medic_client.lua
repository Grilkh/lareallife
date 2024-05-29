addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	local shader = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader, "Tex", dxCreateTexture("images/texturen/ambulance.png"))
	engineApplyShaderToWorldTexture(shader, "ambulan92decal128")
	
	-- RADIO --
	local sound = playSound3D("https://dl.dropboxusercontent.com/u/61988522/lobbymusic.mp3", 409.51727294922, 262.29370117188, 997.16198730469, true)
	setElementInterior(sound, 3)
end)

addEvent("onLAMedicToterMeld", true)
addEvent("doLAPlayAmbulanceSiren", true)
addEvent("doLAStopAmbulanceSiren", true)

local a_siren = {}
local d_blip = {}

addEventHandler("onLAMedicToterMeld", getLocalPlayer(), function(thePlayer)
	if(isElement(d_blip[thePlayer])) then
		destroyElement(d_blip[thePlayer])
	end
	local x, y, z = getElementPosition(thePlayer)
	d_blip[thePlayer] = createBlip(x, y, z, 0, 2, 0, 255, 255, 150, 0, 99999)
end)

addEventHandler("onClientPlayerSpawn", getRootElement(), function()
	if(isElement(d_blip[source])) then
		destroyElement(d_blip[source])
	end
end)

addEventHandler("doLAStopAmbulanceSiren", getRootElement(), function(vehicle)
	if(isElement(a_siren[vehicle])) then
		destroyElement(a_siren[vehicle])
	end
end)
addEventHandler("doLAPlayAmbulanceSiren", getRootElement(), function(vehicle)
	if(isElement(a_siren[vehicle])) then
		destroyElement(a_siren[vehicle])
	end
	a_siren[vehicle] = playSound3D("sounds/sirene.wav", 0, 0, 0, true)
	setSoundMaxDistance(a_siren[vehicle], 100)
	attachElements(a_siren[vehicle], vehicle)
end)


addEventHandler("onClientVehicleExplode", getRootElement(), function()
	triggerEvent("doLAStopAmbulanceSiren", source, source)
end)

addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	for index, car in pairs(getElementsByType("vehicle")) do
		if(getElementData(car, "sirenstate") == true) and (getVehicleOccupant(car)) then
			triggerEvent("doLAPlayAmbulanceSiren", car, car)
		end
	end
end)