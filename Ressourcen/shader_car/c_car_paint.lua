--
-- c_car_paint.lua
--
local myShader, tec = nil, nil
local carshader = false
local textureVol = nil
local textureCube = nil
local alreadyConnected = false
function createCarShader_func ()
	-- Version check
	if getVersion ().sortable < "1.1.0" then
		outputChatBox( "Shader ist nicht mit diesem Clienten kompatibel.", 255, 0 ,0 )
		return
	end
	-- Create shader
	myShader, tec = dxCreateShader ( "car_paint.fx" )
	if not myShader then
		outputChatBox( "Herstellung des Shaders fehlgeschlagen. Bitte kontaktiere Leyynen.", 255, 0, 0 )
	else
		if carshader == false then
			-- Set textures
			textureVol = dxCreateTexture ( "images/smallnoise3d.dds" );
			textureCube = dxCreateTexture ( "images/cube_env256.dds" );
			dxSetShaderValue ( myShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( myShader, "sReflectionTexture", textureCube );
			-- Apply to world texture
			engineApplyShaderToWorldTexture ( myShader, "vehiclegrunge256" )
			engineApplyShaderToWorldTexture ( myShader, "?emap*" )
			if alreadyConnected == false then
				outputChatBox( "/carshader um den Fahrzeugshader an- oder auszuschalten.", 200, 200, 0 )
				alreadyConnected = true
			end
			carshader = true
		end
	end
end
addEventHandler( "onClientResourceStart", resourceRoot, createCarShader_func)


function stopcarshader_func ()
	if carshader == false then
		createCarShader_func()
		outputChatBox( "Fahrzeugshader eingeschaltet.", 200, 200, 0 )
	else
		destroyElement ( textureVol )
		destroyElement ( textureCube )
		engineRemoveShaderFromWorldTexture ( myShader, "vehiclegrunge256" )
		engineRemoveShaderFromWorldTexture ( myShader, "?emap*" )
		destroyElement( myShader )
		carshader = false
		outputChatBox( "Fahrzeugshader ausgeschaltet.", 200, 200, 0 )
	end
end
addCommandHandler("carshader", stopcarshader_func)