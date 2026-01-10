function GuncenterGui_func()

	guiSetVisible ( Bestellfenster, true )
	if getElementData ( getLocalPlayer(), "fraktion" ) == 2 then
		 spezgun = "Lupara"
	elseif getElementData ( getLocalPlayer(), "fraktion" ) == 3 then
		 spezgun = "Katana"
	elseif getElementData ( getLocalPlayer(), "fraktion" ) == 7 then
		 spezgun = "Molotov"
	end
	guiSetText ( gLabels["waffen"], "Nahkampf\n  Schlagring\n  Baseballschläger\n  Messer\n  Schaufel\n Schusswaffen\n  Pistolen\n   9mm Pistole\n   9mm Schallgedämpft\n   9mm Magazine\n   Desert Eagle\n   Deagle Magazin\n  Schrotflinten\n   Schrotflinte\n   Schrotkugeln\n  Maschinenpistolen\n   MP5\n   MP5 Magazin\n  Sturmgewehre\n   Ak-47\n   AK-47 Magazin\n   M4 Magazin\n  Gewehre\n   Gewehr\n   Gewehrpatronen\n   Scharfs. Gewehr\n   Scharfs. Patronen\n Spezial\n  Raketenwerfer\n  Raketen\n  "..spezgun )
	showCursor ( true )
end
addEvent ( "ShowGuncenterGui", true)
addEventHandler ( "ShowGuncenterGui", getRootElement(), GuncenterGui_func)

function SubmitBeladenBtn (btn)

	if btn == "left" then
		local text = guiGetText(Bestellungen)
		local schlagringe = tonumber(gettok ( text, 1, string.byte('*') ) )
		local baseball = tonumber(gettok ( text, 2, string.byte('*') ) )
		local knife = tonumber(gettok ( text, 3, string.byte('*') ) )
		local shovels = tonumber(gettok ( text, 4, string.byte('*') ) )
		local pistol = tonumber(gettok ( text, 5, string.byte('*') ) )
		local sdpistol = tonumber(gettok ( text, 6, string.byte('*') ) )
		local pistolammo = tonumber(gettok ( text, 7, string.byte('*') ) )
		local eagle = tonumber(gettok ( text, 8, string.byte('*') ) )
		local eagleammo = tonumber(gettok ( text, 9, string.byte('*') ) )
		local shotgun  = tonumber( gettok ( text, 10, string.byte('*') ) )
		local shotgunammo  = tonumber( gettok ( text, 11, string.byte('*') ) )
		local mp  = tonumber( gettok ( text, 12, string.byte('*') ) )
		local mpammo  = tonumber( gettok ( text, 13, string.byte('*') ) )
		local ak  = tonumber( gettok ( text, 14, string.byte('*') ) )
		local akmunni  = tonumber( gettok ( text, 15, string.byte('*') ) )
		--local m  = tonumber( gettok ( text, 16, string.byte('*') ) )
		local mammo  = tonumber( gettok ( text, 16, string.byte('*') ) )
		local gewehr  = tonumber( gettok ( text, 17, string.byte('*') ) )
		local gewehrammo  = tonumber( gettok ( text, 18,	string.byte('*') ) )
		local sgewehr  = tonumber( gettok ( text, 19,	string.byte('*') ) )
		local sgewehrammo  = tonumber( gettok ( text, 20,	string.byte('*') ) )
		local rakwerfer  = tonumber( gettok ( text, 21,	string.byte('*') ) )
		local rak  = tonumber( gettok ( text, 22,	string.byte('*') ) )
		local spezgun  = tonumber( gettok ( text, 23,	string.byte('*') ) )
		guiSetVisible ( Bestellfenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		triggerServerEvent ( "giveTruck", getLocalPlayer(), schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akmunni, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun )
	end
end

function SubmitBeladenAbbrechenBtn (btn)

	if btn == "left" then
		guiSetVisible ( Bestellfenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end
addEvent ( "SubmitBeladenAbbrechen", true)
addEventHandler ( "SubmitBeladenAbbrechen", getRootElement(), SubmitBeladenAbbrechenBtn)

function createWaffenlieferungsMenue()

	local screenwidth, screenheight = guiGetScreenSize ()
	
	Bestellfenster = guiCreateWindow(screenwidth/2-346/2,screenheight/2-638/2,346,638,"Bestellliste",false)
	guiSetAlpha(Bestellfenster,1)
	guiWindowSetMovable(Bestellfenster,false)
	guiWindowSetSizable(Bestellfenster,false)
	
	gLabels["startinfotext"] = guiCreateLabel(0.026,0.0361,0.9653,0.0517,"Bitte fülle die Tabelle aus, damit der Truck mit den Waffen\nbeladen werden kann. Das Geld musst du selber besorgen.",true,Bestellfenster)
	guiSetAlpha(gLabels["startinfotext"],1)
	guiLabelSetColor(gLabels["startinfotext"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["startinfotext"],"top")
	guiLabelSetHorizontalAlign(gLabels["startinfotext"],"left",false)
	
	Bestellgrid = guiCreateGridList(0.026,0.0925,0.948,0.7915,true,Bestellfenster)
	guiGridListSetSelectionMode(Bestellgrid,2)
	guiGridListAddColumn(Bestellgrid,"Waffe",0.2)
	guiGridListAddColumn(Bestellgrid,"Preis",0.2)
	guiSetAlpha(Bestellgrid,1)
	gLabels["waffen"] = guiCreateLabel(0.0213,0.0554,0.4299,0.9307,"Nahkampf\n  Schlagring\n  Baseballschläger\n  Messer\n  Schaufel\n Schusswaffen\n  Pistolen\n   9mm Pistole\n   9mm Schallgedämpft\n   9mm Magazine\n   Desert Eagle\n   Deagle Magazin\n  Schrotflinten\n   Schrotflinte\n   Schrotkugeln\n  Maschinenpistolen\n   MP5\n   MP5 Magazin\n  Sturmgewehre\n   Ak-47\n   AK-47 Magazin\n   M4 Magazin\n   Gewehre\n   Gewehr\n   Gewehrpatronen\n   Scharfs. Gewehr\n   Scharfs. Patronen\n Spezial\n  Raketenwerfer\n  Raketen\n  ",true,Bestellgrid)
	guiSetAlpha(gLabels["waffen"],1)
	guiLabelSetColor(gLabels["waffen"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["waffen"],"top")
	guiLabelSetHorizontalAlign(gLabels["waffen"],"left",false)
	gLabels["preise"] = guiCreateLabel(0.5732,0.0535,0.1646,0.9327,"\n "..schlagringe_price.."\n "..baseball_price.."\n "..knife_price.."\n "..shovels_price.."\n \n \n "..pistol_price.."\n "..sdpistol_price.."\n "..pistolammo_price.."\n "..eagle_price.."\n "..eagleammo_price.."\n \n "..shotgun_price.."\n "..shotgunammo_price.."\n \n "..mp_price.."\n "..mpammo_price.."\n \n "..ak_price.."\n "..akammo_price.."\n "..mammo_price.."\n \n "..gewehr_price.."\n "..gewehrammo_price.."\n "..sgewehr_price.."\n "..sgewehrammo_price.."\n \n "..rakwerfer_price.."\n "..rak_price.."\n "..spezgun_price,true,Bestellgrid)
	guiSetAlpha(gLabels["preise"],1)
	guiLabelSetColor(gLabels["preise"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["preise"],"top")
	guiLabelSetHorizontalAlign(gLabels["preise"],"left",false)
	Bestellungen = guiCreateMemo(0.7866,0.0693,0.186,0.9228,"0*\n0*\n0*\n0*\n\n\n0*\n0*\n0*\n0*\n0*\n\n0*\n0*\n\n0*\n0*\n\n0*\n0*\n0*\n\n0*\n0*\n0*\n0*\n\n0*\n0*\n0*",true,Bestellgrid)
	guiSetAlpha(Bestellungen,1)
	
	gButtons["beladen"] = guiCreateButton(0.10,0.9028,0.35,0.077,"Truck beladen",true,Bestellfenster)
	guiSetAlpha(gButtons["beladen"],1)
	gButtons["beladenabbrechen"] = guiCreateButton(0.55,0.9028,0.35,0.077,"Abbrechen",true,Bestellfenster)
	guiSetAlpha(gButtons["beladenabbrechen"],1)
	
	guiSetVisible ( Bestellfenster, false )
	
	addEventHandler("onClientGUIClick", gButtons["beladen"], SubmitBeladenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["beladenabbrechen"], SubmitBeladenAbbrechenBtn, false)
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		createWaffenlieferungsMenue()
	end
)