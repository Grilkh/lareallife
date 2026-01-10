------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local b_a = false

addEventHandler("onClientRender", getRootElement(), function()
	local sx, sy = guiGetScreenSize()
	if(b_a == true) then
		dxDrawRectangle(sx-430/1920*sx, sy-50/1920*sx, 430/1920*sx, 50/1920*sx, tocolor(0, 0, 0, 125))
		dxDrawText("LA-RL 5.0 Development Resource", sx-(420/1920*sx), sy-(45/1920*sx), sx, sy, tocolor(255, 255, 255, 200), 2/1920*sx, "default-bold")
	end
end)
local state = false
addCommandHandler("hideall", function()
	if(state == false) then
		state = true
		showChat(false)
		setPlayerHudComponentVisible("all", false)
	else
		state = false
		showChat(true)
		setPlayerHudComponentVisible("all", true)
	end
end)

--[[addCommandHandler("hidelogo", function()
	b_a = not b_a
end)]]

addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	--[[
	local shader = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader, "Tex", dxCreateTexture("images/texturen/boden_textur.jpg"))
	engineApplyShaderToWorldTexture(shader, "gun_floor1")
	]]
	--local shader2 = dxCreateShader("images/textureshader.fx")
	--dxSetShaderValue(shader2, "Tex", dxCreateTexture("images/texturen/asphalttextur.jpg"))
	--engineApplyShaderToWorldTexture(shader2, "ws_carpark2")
	--engineApplyShaderToWorldTexture(shader2, "bow_church_dirt")
	--engineApplyShaderToWorldTexture(shader2, "mountainskree_stones256")
	
	-- GARAGE OAMT --
	local shader3 = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader3, "Tex", dxCreateTexture("images/texturen/garage_wand.jpg"))
	engineApplyShaderToWorldTexture(shader3, "ws_altz_wall4")
	engineApplyShaderToWorldTexture(shader3, "ws_altz_wall7_big")
	engineApplyShaderToWorldTexture(shader3, "ws_altz_wall5_big")
	
	local shader4 = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader4, "Tex", dxCreateTexture("images/texturen/garage_dach.jpg"))
	engineApplyShaderToWorldTexture(shader4, "ws_corr_metal1")
	engineApplyShaderToWorldTexture(shader4, "ws_corr_plastic")
	
	
	local shader5 = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader5, "Tex", dxCreateTexture("images/texturen/garage_fenster.jpg"))
	engineApplyShaderToWorldTexture(shader5, "ws_fuckedwin1")
	
	local shader6 = dxCreateShader("images/textureshader.fx")
	dxSetShaderValue(shader6, "Tex", dxCreateTexture("images/texturen/garage_info.jpg"))
	engineApplyShaderToWorldTexture(shader6, "ws_xenon_used")
	
end)



gMe = getLocalPlayer()


local moov = 0
local object1, object2

function smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	if(moov == 1) then outputDebugString("Error: Zu wenig Frames!") return end
	object1 = createObject ( 1337, x1, y1, z1 )
	object2 = createObject ( 1337, x1t, y1t, z1t )
	setElementAlpha ( object1, 0 )
	setElementAlpha ( object2, 0 )
	setObjectScale(object1, 0)
	setObjectScale(object2, 0)
	moveObject ( object1, time, x2, y2, z2, 0, 0, 0, "InOutQuad" )
	moveObject ( object2, time, x2t, y2t, z2t, 0, 0, 0, "InOutQuad" )
	
	addEventHandler ( "onClientRender", getRootElement(), camRender )
	moov = 1
	setTimer ( removeCamHandler, time, 1 )
	setTimer ( destroyElement, time, 1, object1 )
	setTimer ( destroyElement, time, 1, object2 )
end

function removeCamHandler ()
	moov = 0
	removeEventHandler ( "onClientRender", getRootElement(), camRender )
end

function camRender ()

	local x1, y1, z1 = getElementPosition ( object1 )
	local x2, y2, z2 = getElementPosition ( object2 )
	setCameraMatrix ( x1, y1, z1, x2, y2, z2 )

end


addCommandHandler("devmode", function()
	setDevelopmentMode( not getDevelopmentMode())
end)

function getMiddleGuiPosition(lol, lol2)

local sWidth, sHeight = guiGetScreenSize()

local Width,Height = lol, lol2
local X = (sWidth/2) - (Width/2)
local Y = (sHeight/2) - (Height/2)

return X, Y, Width, Height
end