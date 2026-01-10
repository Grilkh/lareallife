
function SubmitInviteBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plistfaction"])
		triggerServerEvent ( "invite", getLocalPlayer(), getLocalPlayer(), "", guiGridListGetItemText ( gGrid["plistfaction"], etplayer, column ) )
		setTimer ( ShowFraktionComputerGui_func, 500, 1 )
	end
end

function SubmitUninviteBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plistfaction"])
		triggerServerEvent ( "uninvite", getLocalPlayer(), getLocalPlayer(), "", guiGridListGetItemText ( gGrid["plistfaction"], etplayer, column ) )
		setTimer ( ShowFraktionComputerGui_func, 500, 1 )
	end
end

function SubmitRangBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plistfaction"])
		triggerServerEvent ( "giverank", getLocalPlayer(), getLocalPlayer(),"", guiGridListGetItemText ( gGrid["plistfaction"], etplayer, column ), guiGetText ( gEdit["rank"] ), "" )
	end
end

function SubmitChangedateBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plistfaction"])
		triggerServerEvent ( "getchangestate", getLocalPlayer(), getLocalPlayer(), "", guiGridListGetItemText ( gGrid["plistfaction"], etplayer, column ) )
	end
end


function SubmitRespawnBtn(button)
	if button == "left" then
		triggerServerEvent ( "respawn_faction", getLocalPlayer(), getLocalPlayer() )
	end
end

function SubmitSchliessenFakBtn(button)

	if button == "left" then
		guiSetVisible(gWindow["fraktionpc"],false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end


function ShowFraktionComputerGui_func( money, weed, mats, koks)
	guiSetVisible(gWindow["fraktionpc"], true)
	showCursor(true)
	guiGridListClear ( gGrid["plistfaction"] )
	for id, playeritem in ipairs(getElementsByType("player")) do 
		if getElementData ( playeritem, "loggedin" ) == 1 then
			local row = guiGridListAddRow ( gGrid["plistfaction"] )
			guiGridListSetItemText ( gGrid["plistfaction"], row, gGrid["players"], getPlayerName ( playeritem ), false, false )
			faction = tostring(getElementData ( playeritem, "fraktion" ))
			if tonumber (faction) == 0 then
				factiontext = "Zivilisten"
			elseif tonumber (faction) == 1 then
				factiontext = "LAPD"
			elseif tonumber (faction) == 2 then
				factiontext = "Camorra"
			elseif tonumber (faction) == 3 then
				factiontext = "Yakuza"
			elseif tonumber (faction) == 4 then
				factiontext = "Notdienst"
			elseif tonumber (faction) == 5 then
				factiontext = "Reporter"
			elseif tonumber (faction) == 6 then
				factiontext = "FBI"
			elseif tonumber (faction) == 7 then
				factiontext = "Surenos"
			elseif tonumber (faction) == 8 then
				factiontext = "Army"
			elseif tonumber (faction) == 9 then
				factiontext = "Comptons"
			elseif tonumber (faction) == 10 then
				factiontext = "Watts"
			elseif tonumber (faction) == 11 then
				factiontext = "Terroristen"
			end
			guiGridListSetItemText ( gGrid["plistfaction"], row, gGrid["playerfaction"], factiontext, false, false )
		end
	end
	--setTimer ( setValueDepots, 1000, 5, money, drugs, mats )
	setValueDepots (money, weed, mats, koks)
end
addEvent ( "ShowFraktionComputerGui", true)
addEventHandler ( "ShowFraktionComputerGui", getRootElement(), ShowFraktionComputerGui_func)
--addCommandHandler ( "fraktion", ShowFraktionComputerGui_func )

function _createFraktionComputerMenue ( )
	
	gWindow["fraktionpc"] = guiCreateWindow(screenwidth/2-382/2,screenheight/2-510/2,382,510,"Fraktionsübersicht",false)

	guiSetAlpha(gWindow["fraktionpc"],1)
	guiWindowSetMovable(gWindow["fraktionpc"],false)
	guiWindowSetSizable(gWindow["fraktionpc"],false)

	gButtons["invite"] = guiCreateButton(201,29,137,32,"Invite",false,gWindow["fraktionpc"])
	guiSetAlpha(gButtons["invite"],1)
	gButtons["uninvite"] = guiCreateButton(201,69,137,32,"Uninvite",false,gWindow["fraktionpc"])
	guiSetAlpha(gButtons["uninvite"],1)
	gButtons["rang"] = guiCreateButton(237,111,137,32,"Rang geben",false,gWindow["fraktionpc"])
	guiSetAlpha(gButtons["rang"],1)
	gButtons["respawnen"] = guiCreateButton(201,150,137,32,"Respawnen",false,gWindow["fraktionpc"])
	guiSetAlpha(gButtons["respawnen"],1)
	gButtons["schliessen"] = guiCreateButton(201,433,172,68,"Schliessen",false,gWindow["fraktionpc"]) -- Done
	guiSetAlpha(gButtons["schliessen"],1)
	guiSetFont(gButtons["schliessen"],"default-bold-small")

	gGrid["plistfaction"] = guiCreateGridList(14,26,177,471,false,gWindow["fraktionpc"])
	guiSetAlpha(gGrid["plistfaction"],1)
	guiGridListSetSelectionMode(gGrid["plistfaction"],1)
	gGrid["players"] = guiGridListAddColumn(gGrid["plistfaction"],"Spieler:",0.5)
	gGrid["playerfaction"] = guiGridListAddColumn(gGrid["plistfaction"],"Fraktion:",0.4)

	gLabel["lager"] = guiCreateLabel(201,229,170,26,"Fraktionslager:",false,gWindow["fraktionpc"])
	guiSetAlpha(gLabel["lager"],1)
	guiLabelSetColor(gLabel["lager"], 255, 255, 0 )
	guiLabelSetVerticalAlign(gLabel["lager"],"center")
	guiLabelSetHorizontalAlign(gLabel["lager"],"center",false)
	guiSetFont(gLabel["lager"],"clear-normal")
	
	gLabel["geld"] = guiCreateLabel(199,257,31,22,"Geld:",false,gWindow["fraktionpc"])
	guiSetAlpha(gLabel["geld"],1)
	guiLabelSetColor(gLabel["geld"], 200, 200, 0 )
	
	gLabel["drogen"] = guiCreateLabel(199,276,45,22,"Weed:",false,gWindow["fraktionpc"])
	guiSetAlpha(gLabel["drogen"],1)
	guiLabelSetColor(gLabel["drogen"], 0, 150, 0 )

	gLabel["materialien"] = guiCreateLabel(199,296,66,22,"Materialien:",false,gWindow["fraktionpc"])
	guiSetAlpha(gLabel["materialien"],1)
	guiLabelSetColor(gLabel["materialien"], 150, 0, 0 )

	gLabel["kokain"] = guiCreateLabel(199,316,66,22,"Kokain:",false,gWindow["fraktionpc"])
	guiSetAlpha(gLabel["kokain"],1)
	guiLabelSetColor(gLabel["kokain"], 0, 0, 150 )
	
	gButtons["invitedate"] = guiCreateButton(201,189,137,32,"Un/Invite Datum",false,gWindow["fraktionpc"])
	guiSetAlpha(gButtons["invitedate"],1)
	
	gEdit["rank"] = guiCreateEdit(202,114,32,28,"",false,gWindow["fraktionpc"])
	guiSetAlpha(gEdit["rank"],1)
	
gLabel["money"] = guiCreateLabel(235,257,141,22,"",false,gWindow["fraktionpc"])
guiLabelSetColor(gLabel["money"],200, 200, 0)
gLabel["drugs"] = guiCreateLabel(253,276,123,22,"",false,gWindow["fraktionpc"])
guiLabelSetColor(gLabel["drugs"],0, 150, 0)
gLabel["mats"] = guiCreateLabel(268,296,108,22,"",false,gWindow["fraktionpc"])
guiLabelSetColor(gLabel["mats"],150, 0, 0)
gLabel["koks"] = guiCreateLabel(253,316,108,22,"",false,gWindow["fraktionpc"])
guiLabelSetColor(gLabel["koks"],0, 0, 150)

	addEventHandler("onClientGUIClick", gButtons["invite"], SubmitInviteBtn, false)
	addEventHandler("onClientGUIClick", gButtons["uninvite"], SubmitUninviteBtn, false)
	addEventHandler("onClientGUIClick", gButtons["rang"], SubmitRangBtn, false)
	addEventHandler("onClientGUIClick", gButtons["respawnen"], SubmitRespawnBtn, false)
	addEventHandler("onClientGUIClick", gButtons["schliessen"], SubmitSchliessenFakBtn, false)
	addEventHandler("onClientGUIClick", gButtons["invitedate"], SubmitChangedateBtn, false)
	
	guiSetVisible ( gWindow["fraktionpc"], false )
	
	--triggerServerEvent ( "FillValueDepots", getRootElement(), getLocalPlayer(), false)
end

function setValueDepots (money, weed, mats, koks)

	guiSetText ( gLabel["money"], money.." $" )
	guiSetText ( gLabel["drugs"], weed.." g" )
	guiSetText ( gLabel["mats"], mats.." Stk." )
	guiSetText ( gLabel["koks"], koks.." g." )
end


addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		_createFraktionComputerMenue()
	end
)