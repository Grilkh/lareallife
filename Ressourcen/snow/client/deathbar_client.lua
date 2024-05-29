-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function showProgressBar_func ()

	if gWindow["progress"] then
		guiSetVisible ( gWindow["progress"], true )
	else
		gWindow["progress"] = guiCreateWindow(screenwidth/2-264/2,screenheight/2-344/2,264,344,"Krankenhaus",false)
		guiSetAlpha(gWindow["progress"],1)
		gImage["death"] = guiCreateStaticImage(0.0758,0.0698,0.803,0.5349,"images/medic.jpg",true,gWindow["progress"])
		guiSetAlpha(gImage["death"],1)
		gLabel["deathbarText1"] = guiCreateLabel(0.0341,0.6076,0.9356,0.1366,"\nDu bist gestorben und wirst nun\nim Krankenhaus wieder zusammengeflickt.",true,gWindow["progress"])
		guiSetAlpha(gLabel["deathbarText1"],1)
		guiLabelSetColor(gLabel["deathbarText1"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["deathbarText1"],"top")
		guiLabelSetHorizontalAlign(gLabel["deathbarText1"],"left",false)
		guiSetFont(gLabel["deathbarText1"],"default-bold-small")
		gProgress["progressDeathtime"] = guiCreateProgressBar(0.1705,0.8285,0.6667,0.1366,true,gWindow["progress"])
		guiSetAlpha(gProgress["progressDeathtime"],1)
		guiProgressBarSetProgress(gProgress["progressDeathtime"],50)
		gLabel["deathbarText2"] = guiCreateLabel(0.2727,0.7733,0.5152,0.0523,"Behandlungsfortschritt:",true,gWindow["progress"])
		guiSetAlpha(gLabel["deathbarText2"],1)
		guiLabelSetColor(gLabel["deathbarText2"],125,125,200)
		guiLabelSetVerticalAlign(gLabel["deathbarText2"],"top")
		guiLabelSetHorizontalAlign(gLabel["deathbarText2"],"left",false)
		guiSetFont(gLabel["deathbarText2"],"default-bold-small")
	end
	curcount = 0
	if getElementData ( lp, "hitmandeath" ) then
		setTimer ( updateDeathTimer, 1200, 100 )
	else
		setTimer ( updateDeathTimer, 600, 100 )
	end
	setTimer ( hideUpdateLeiste, 60000, 1 )
end
addEvent ( "showProgressBar", true )
addEventHandler ( "showProgressBar", getRootElement(), showProgressBar_func )

function updateDeathTimer ()
	
	curcount = curcount + 1
	guiProgressBarSetProgress(gProgress["progressDeathtime"],curcount)
end

function hideUpdateLeiste ()

	guiSetVisible ( gWindow["progress"], false )
end