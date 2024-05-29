--
-- c_water.lua
--

local myShader, tec = nil, nil
local watershader = false
local textureVol = nil
local textureCube = nil
local alreadyConnected = false
local watertimer = nil
function createWaterShader_func ()
	-- Version check
	if getVersion ().sortable < "1.1.0" then
		outputChatBox( "Shader ist nicht mit diesem Clienten kompatibel.", 255, 0 ,0 )
		return
	end
	-- Create shader
	myShader, tec = dxCreateShader ( "water.fx" )
	if not myShader then
		outputChatBox( "Herstellung des Shaders fehlgeschlagen. Bitte kontaktiere Leyynen.", 255, 0, 0 )
	else
		if watershader == false then
			-- Set textures
			textureVol = dxCreateTexture ( "images/smallnoise3d.dds" );
			textureCube = dxCreateTexture ( "images/cube_env256.dds" );
			dxSetShaderValue ( myShader, "microflakeNMapVol_Tex", textureVol );
			dxSetShaderValue ( myShader, "showroomMapCube_Tex", textureCube );
			-- Apply to global txd 13
			engineApplyShaderToWorldTexture ( myShader, "waterclear256" )
			if alreadyConnected == false then
				outputChatBox( "/waterhader um den Wassershader an- oder auszuschalten.", 200, 200, 0 )
				alreadyConnected = true
			end
			watershader = true
			-- Update water color incase it gets changed by persons unknown
			watertimer = setTimer(	function()
							if myShader then
								local r,g,b,a = getWaterColor()
								dxSetShaderValue ( myShader, "gWaterColor", r/255, g/255, b/255, a/255 );
							end
						end
						,100,0 )
		end
	end
end
addEventHandler( "onClientResourceStart", resourceRoot, createWaterShader_func)


function stopwatershader_func ()
	if watershader == false then
		createWaterShader_func()
		outputChatBox( "Wassershader eingeschaltet.", 200, 200, 0 )
	else
		destroyElement ( textureVol )
		destroyElement ( textureCube )
		engineRemoveShaderFromWorldTexture ( myShader, "waterclear256" )
		killTimer(watertimer)
		destroyElement( myShader )
		watershader = false
		outputChatBox( "Wassershader ausgeschaltet.", 200, 200, 0 )
		outputChatBox( "Mit /watercolor und /setwatercolor kannst du ausserdem die Farbe des Wassers ändern.", 200, 200, 0 )
	end
end
addCommandHandler("watershader", stopwatershader_func)

local watercolor = true
function watercolor_func ()
	if watercolor == true then
		resetWaterColor()
		outputChatBox( "Farbe des Wassers auf den Standard zurückgesetzt.", 200, 200, 0 )
		watercolor = false
	else
		setWaterColor(0, 150, 255)
		outputChatBox( "Farbe des Wassers auf die LA-Version gesetzt.", 200, 200, 0 )
		watercolor = true
	end
end
addCommandHandler("watercolor", watercolor_func)


function setwatercolor_func ( cmd, r, g, b)
	if tonumber(r) and tonumber(g) and tonumber(b) then
		if (tonumber(r) >= 0 and tonumber(r) <= 255) and (tonumber(g) >= 0 and tonumber(g) <= 255) and (tonumber(b) >= 0 and tonumber(b) <= 255) then
			setWaterColor(r, g, b)
			outputChatBox( "Farbe des Wassers geändert. /watercolor, um es zurückzusetzen.", 0, 150, 0 )
		else
			outputChatBox( "Verwende: /setwatercolor [0-255] [0-255] [0-255]", 150, 0, 0 )
		end
	else
		outputChatBox( "Verwende: /setwatercolor [0-255] [0-255] [0-255]", 150, 0, 0 )
	end
end
addCommandHandler("setwatercolor", setwatercolor_func)