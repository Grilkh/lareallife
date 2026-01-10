function showProgressBar_func ()

	if gWindow["progress"] then
		guiSetVisible ( gWindow["progress"], true )
	else
		gWindow["progress"] = guiCreateWindow(screenwidth/2-555/2,screenheight/2-511/2,555,511,"Krankenhaus",false)
		guiSetAlpha(gWindow["progress"],1)
		gImage["death"] = guiCreateStaticImage(158,41,239,284,"images/medic.jpg",false,gWindow["progress"])
		guiSetAlpha(gImage["death"],1)
		gProgress["progressDeathtime"] = guiCreateProgressBar(9,464,537,29,false,gWindow["progress"])
		guiSetAlpha(gProgress["progressDeathtime"],1)
		guiProgressBarSetProgress(gProgress["progressDeathtime"],0)
		gLabel["deathbarText2"] = guiCreateLabel(9,334,539,125,"Du wurdest ins Krankenhaus gebracht! Du hast wohl etwas falsch gemacht...\nDu wirst es aber überleben. Wenn du ein Gesuchter warst, wirst du nach deiner Genesung\nins Gefängnis verfrachtet. Ansonsten wirst du nach Hause oder in deine Heimatstadt gebracht.\n\nIst dein Tod plötzlich eingetreten? Wichtig ist, dass du immer genug isst, urinierst und schläfst.\n\nWurdest du ohne Grund getötet? Dann melde es mit /kontakt einem Teammitglied!\n\nAnsonsten noch viel Spass auf Los Angeles Reallife!",false,gWindow["progress"])
		guiSetAlpha(gLabel["deathbarText2"],1)
		guiLabelSetColor(gLabel["deathbarText2"],0,250,0)
		guiLabelSetHorizontalAlign(gLabel["deathbarText2"],"center",false)
		guiSetFont(gLabel["deathbarText2"],"default-bold-small")
	end
	curcount = 0
	--[[if getElementData ( lp, "hitmandeath" ) then
		setTimer ( updateDeathTimer, 1200, 100 )
	else]]
		setTimer ( updateDeathTimer, 600, 100 )
	--end
	setTimer ( hideUpdateLeiste, 60000, 1 )
end
addEvent ( "showProgressBar", true )
addEventHandler ( "showProgressBar", getRootElement(), showProgressBar_func )

function showProgressBarFalse_func ()
guiSetVisible ( gWindow["progress"], false )
end
addEvent ( "showProgressBarFalse", true )
addEventHandler ( "showProgressBarFalse", getRootElement(), showProgressBarFalse_func )

function updateDeathTimer ()
	
	curcount = curcount + 1
	guiProgressBarSetProgress(gProgress["progressDeathtime"],curcount)
end

function hideUpdateLeiste ()

	guiSetVisible ( gWindow["progress"], false )
end