addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	local shad = dxCreateShader("shader/ltrshader.fx") -- DER SHADER IN DEM DATEIPFAD WO die .fx DATEI DRINNE IST
	dxSetShaderValue(shad, "Tex", dxCreateTexture("shader/ltrlogo.png")) -- Eine Neue Textur wird erstellt, in dem falle das LTR LOGO, DATEIPFAD ANGEBEN
	engineApplyShaderToWorldTexture(shad, "newsvan92decal128") -- Da brauch man nichts aendern
	engineApplyShaderToWorldTexture(shad, "sanmav92blue64") -- hier auch nicht
end)