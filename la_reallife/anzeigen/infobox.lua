gLabels = { }

function infobox ( text, tts, r, g, b )

	infobox_start_func ( text, tts, r, g, b )
end

function showInfoText_func ()

	if not gLabels["InfoTextForum"] then
		gLabels["InfoTextForumShadow"] = guiCreateLabel(screenwidth-250, 9, 250, 50,"Forum: "..forumURL..", Hilfe: F1 oder /kontakt",false,getRootElement())
		gLabels["InfoTextForum"] = guiCreateLabel(screenwidth-250, 10, 250, 50,"Forum: "..forumURL..", Hilfe: F1 oder /kontakt",false,getRootElement())
		guiLabelSetColor(gLabels["InfoTextForum"],0,255,20)
		guiLabelSetColor(gLabels["InfoTextForumShadow"],0,0,0)
		guiSetFont(gLabels["InfoTextForum"],"default-bold-small")
		guiSetFont(gLabels["InfoTextForumShadow"],"default-bold-small")
	end
end
addEvent ( "showInfoText", true )
addEventHandler ( "showInfoText", getRootElement(), showInfoText_func )

function infobox_start_func ( text, timetoshow, r, g, b )
	
	infoboxText = text
	if r == nil then
		r = 200
	end
	if g == nil then
		g = 200
	end
	if b == nil then
		b = 200
	end
	infoboxR = r
	infoboxG = g
	infoboxB = b
	
	if isTimer ( ChatBoxTimer1 ) then
		killTimer ( ChatBoxTimer1 )
		killTimer ( ChatBoxTimer2 )
	else
		addEventHandler ( "onClientRender", getRootElement(), infoboxRender )
		infoboxIMG = guiCreateStaticImage(screenwidth/2-400/2,5,400,150,"images/colors/c_black.jpg",false)
		guiSetAlpha(infoboxIMG, 0.75)
	end
	
	playSoundFrontEnd ( 2 )
	ChatBoxTimer1 = setTimer ( removeInfoboxDraw, timetoshow, 1 )
	ChatBoxTimer2 = setTimer ( destroyElement, timetoshow, 1, infoboxIMG )
end
addEvent ( "infobox_start", true )
addEventHandler ( "infobox_start", getRootElement(), infobox_start_func )

function removeInfoboxDraw ()

	removeEventHandler ( "onClientRender", getRootElement(), infoboxRender )
end

function _CreateInfobox ()

	--infoboxText = guiCreateTabPanel ( 4, 4, 135, 90, false )
	infoboxText = guiCreateStaticImage ( 3, 3, 135, 90, "images/black.bmp", false )
	infoboxTextLabel = guiCreateLabel ( 10,10,122,78,"", false )
	guiLabelSetColor ( infoboxTextLabel, 255, 255, 125 )
	guiSetAlpha ( infoboxText, 1 )
	guiSetAlpha ( infoboxTextLabel, 1 )
	guiSetVisible(infoboxText, false)
	guiSetVisible(infoboxTextLabel, false)
	guiSetFont ( infoboxTextLabel, "default-bold-small" )
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		_CreateInfobox()
	end
)

function showDrawnText_func ( text, timeToShow, r, g, b )

	curDrawedText = text
	curDrawedTextR = tonumber ( r )
	curDrawedTextG = tonumber ( g )
	curDrawedTextB = tonumber ( b )
	addEventHandler ( "onClientRender", getRootElement(), showDrawnText_render )
	setTimer ( function () removeEventHandler ( "onClientRender", getRootElement(), showDrawnText_render ) end, timeToShow, 1 )
end
addEvent ( "showDrawnText", true )
addEventHandler ( "showDrawnText", getRootElement(), showDrawnText_func )

function showDrawnText_render ()

	dxDrawText ( curDrawedText, screenwidth/2-3-200, screenheight/2-3, screenwidth, screenheight, tocolor ( 0, 0, 0, 255 ), 2.5, "pricedown" )
	dxDrawText ( curDrawedText, screenwidth/2-200, screenheight/2, screenwidth, screenheight, tocolor ( curDrawedTextR, curDrawedTextG, curDrawedTextB, 255 ), 2.5, "pricedown" )
end

function infoboxRender ()

	dxDrawText(infoboxText,screenwidth/2-400/2,8,400,224.0,tocolor(infoboxR,infoboxG,infoboxB,255),1.4,"default-bold","left","top",false,false,true)
end