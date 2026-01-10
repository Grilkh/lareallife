local x,y = guiGetScreenSize()

GUIEditor = {
    tab = {},
    tabpanel = {},
    label = {},
    button = {},
    window = {},
    gridlist = {}
}
GUIEditor.window[1] = guiCreateWindow(x/2-(961/2), y/2-(640/2), 961, 640, "Ticketsystem", false)
guiWindowSetMovable(GUIEditor.window[1], false)
guiSetAlpha(GUIEditor.window[1], 1.00)
guiSetVisible(GUIEditor.window[1], false)

guiWindowSetSizable(GUIEditor.window[1], false)
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FFFC6C02")

GUIEditor.label[1] = guiCreateLabel(8, 33, 943, 90, "Herzlich willkommen im Ticketsystem von German Los Angeles Reallife. Hier kannst du dich bei Fragen, die nur vom Support beantwortet werden können, melden, indem du ganz einfach ein Ticket erstellst. Wenn ein Supporter o.ä. auf dein Ticket geantwortet hat, siehst du es hier im Panel. Ausserdem kannst du jederzeit auf dein Ticket antworten, indem du das jeweilige Ticket anklickst und auf anzeigen klickst. Zudem kannst du erledigte Tickets ganz einfach schliessen. \n\nMit freundlichen Grüssen,\nDein German Los Angeles Reallife Team", false, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[1], "left", true)
guiSetFont(GUIEditor.label[1], "default-bold-small")
GUIEditor.tabpanel[1] = guiCreateTabPanel(9, 125, 801, 473, false, GUIEditor.window[1])

GUIEditor.tab["open"] = guiCreateTab("Offene Tickets", GUIEditor.tabpanel[1])

GUIEditor.gridlist["open"] = guiCreateGridList(5, 5, 791, 438, false, GUIEditor.tab["open"])
guiSetProperty(GUIEditor.gridlist["open"], "SortSettingEnabled", "false")
guiSetProperty(GUIEditor.gridlist["open"], "ColumnsSizable", "false")
guiSetProperty(GUIEditor.gridlist["open"], "ColumnsMovable", "false")
local open_id = guiGridListAddColumn(GUIEditor.gridlist["open"], "ID", 0.1)
local open_owner = guiGridListAddColumn(GUIEditor.gridlist["open"], "Besitzer", 0.2)
local open_title = guiGridListAddColumn(GUIEditor.gridlist["open"], "Titel", 0.3)
local open_type = guiGridListAddColumn(GUIEditor.gridlist["open"], "Typ", 0.2)
local open_state = guiGridListAddColumn(GUIEditor.gridlist["open"], "Status", 0.1)

GUIEditor.tab["closed"] = guiCreateTab("Geschlossene Tickets", GUIEditor.tabpanel[1])

GUIEditor.gridlist["closed"] = guiCreateGridList(5, 5, 791, 438, false, GUIEditor.tab["closed"])
guiSetProperty(GUIEditor.gridlist["closed"], "SortSettingEnabled", "false")
guiSetProperty(GUIEditor.gridlist["closed"], "ColumnsSizable", "false")
guiSetProperty(GUIEditor.gridlist["closed"], "ColumnsMovable", "false")
local closed_id = guiGridListAddColumn(GUIEditor.gridlist["closed"], "ID", 0.1)
local closed_owner = guiGridListAddColumn(GUIEditor.gridlist["closed"], "Besitzer", 0.2)
local closed_title = guiGridListAddColumn(GUIEditor.gridlist["closed"], "Titel", 0.3)
local closed_type = guiGridListAddColumn(GUIEditor.gridlist["closed"], "Typ", 0.2)
local closed_state = guiGridListAddColumn(GUIEditor.gridlist["closed"], "Status", 0.1)

GUIEditor.tab["all"] = guiCreateTab("Alle Tickets", GUIEditor.tabpanel[1])

GUIEditor.gridlist["all"] = guiCreateGridList(5, 5, 791, 438, false, GUIEditor.tab["all"])
guiSetProperty(GUIEditor.gridlist["all"], "SortSettingEnabled", "false")
guiSetProperty(GUIEditor.gridlist["all"], "ColumnsSizable", "false")
guiSetProperty(GUIEditor.gridlist["all"], "ColumnsMovable", "false")
local all_id = guiGridListAddColumn(GUIEditor.gridlist["all"], "ID", 0.1)
local all_owner = guiGridListAddColumn(GUIEditor.gridlist["all"], "Besitzer", 0.2)
local all_title = guiGridListAddColumn(GUIEditor.gridlist["all"], "Titel", 0.3)
local all_type = guiGridListAddColumn(GUIEditor.gridlist["all"], "Typ", 0.2)
local all_state = guiGridListAddColumn(GUIEditor.gridlist["all"], "Status", 0.1)


GUIEditor.button[1] = guiCreateButton(816, 149, 135, 52, "Ticket erstellen", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[1], "default-bold-small")
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF0C99FB")
GUIEditor.button[2] = guiCreateButton(816, 546, 135, 52, "Fenster schliessen", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[2], "default-bold-small")
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFFF0000")
GUIEditor.button[3] = guiCreateButton(816, 211, 135, 52, "Ausgewähltes\nTicket anzeigen", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[3], "default-bold-small")
guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FF0C99FB")
GUIEditor.button[4] = guiCreateButton(816, 273, 135, 52, "Ausgewähltes\nTicket schliessen", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[4], "default-bold-small")
guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FF0C99FB")
GUIEditor.button[5] = guiCreateButton(816, 484, 135, 52, "Aktualisieren", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[5], "default-bold-small")
guiSetProperty(GUIEditor.button[5], "NormalTextColour", "FF38FF09")




GUIEditor2 = {
    edit = {},
	memo = {},
    button = {},
    window = {},
    label = {},
    radiobutton = {}
}
GUIEditor2.window[1] = guiCreateWindow(x/2-(365/2), y/2-(446/2), 365, 446, "Ticket erstellen", false)
--guiWindowSetMovable(GUIEditor2.window[1], false)
guiSetAlpha(GUIEditor2.window[1], 1.00)
guiSetVisible(GUIEditor2.window[1], false)
guiWindowSetSizable(GUIEditor2.window[1], false)
guiSetProperty(GUIEditor2.window[1], "CaptionColour", "FFFF0000")

GUIEditor2.label[1] = guiCreateLabel(10, 77, 30, 15, "Art:", false, GUIEditor2.window[1])
guiSetFont(GUIEditor2.label[1], "default-bold-small")
guiLabelSetColor(GUIEditor2.label[1], 255, 0, 0)
GUIEditor2.radiobutton[1] = guiCreateRadioButton(70, 54, 160, 19, "Schnellanfrage", false, GUIEditor2.window[1])
guiRadioButtonSetSelected(GUIEditor2.radiobutton[1], true)
GUIEditor2.radiobutton[2] = guiCreateRadioButton(70, 77, 160, 19, "Respawnanfrage", false, GUIEditor2.window[1])
GUIEditor2.radiobutton[3] = guiCreateRadioButton(70, 100, 178, 17, "Problem", false, GUIEditor2.window[1])
GUIEditor2.label[2] = guiCreateLabel(10, 137, 30, 15, "Titel:", false, GUIEditor2.window[1])
guiSetFont(GUIEditor2.label[2], "default-bold-small")
guiLabelSetColor(GUIEditor2.label[2], 255, 0, 0)
GUIEditor2.edit[1] = guiCreateEdit(70, 132, 277, 30, "", false, GUIEditor2.window[1])
GUIEditor2.label[3] = guiCreateLabel(10, 172, 30, 15, "Text:", false, GUIEditor2.window[1])
guiSetFont(GUIEditor2.label[3], "default-bold-small")
guiLabelSetColor(GUIEditor2.label[3], 255, 0, 0)
GUIEditor2.memo[1] = guiCreateMemo(69, 172, 277, 219, "", false, GUIEditor2.window[1])
guiSetEnabled(GUIEditor2.memo[1], false)
GUIEditor2.button[1] = guiCreateButton(9, 394, 347, 42, "Absenden", false, GUIEditor2.window[1])
guiSetFont(GUIEditor2.button[1], "default-bold-small")
guiSetProperty(GUIEditor2.button[1], "NormalTextColour", "FFFF0000")
guiSetEnabled(GUIEditor2.button[1], false)
GUIEditor2.button[2] = guiCreateButton(335, 24, 20, 20, "X", false, GUIEditor2.window[1])
guiSetProperty(GUIEditor2.button[2], "NormalTextColour", "FFFF0000")
guiSetFont(GUIEditor2.button[2], "default-bold-small")


GUIEditor3 = {
    label = {},
    edit = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {}
}
GUIEditor3.window[1] = guiCreateWindow(x/2-(369/2), y/2-(540/2), 369, 540, "Ticket (#{ID})", false)
--guiWindowSetMovable(GUIEditor3.window[1], false)
guiSetAlpha(GUIEditor3.window[1], 1.00)
guiSetVisible(GUIEditor3.window[1], false)
guiWindowSetSizable(GUIEditor3.window[1], false)
guiSetProperty(GUIEditor3.window[1], "CaptionColour", "FFFF0000")

GUIEditor3.label[1] = guiCreateLabel(10, 46, 30, 15, "Art:", false, GUIEditor3.window[1])
guiSetFont(GUIEditor3.label[1], "default-bold-small")
guiLabelSetColor(GUIEditor3.label[1], 255, 0, 0)
GUIEditor3.label[2] = guiCreateLabel(10, 82, 30, 15, "Titel:", false, GUIEditor3.window[1])
guiSetFont(GUIEditor3.label[2], "default-bold-small")
guiLabelSetColor(GUIEditor3.label[2], 255, 0, 0)
GUIEditor3.edit[1] = guiCreateEdit(69, 77, 277, 30, "", false, GUIEditor3.window[1])
guiEditSetReadOnly(GUIEditor3.edit[1], true)
GUIEditor3.label[3] = guiCreateLabel(10, 123, 30, 15, "Text:", false, GUIEditor3.window[1])
guiSetFont(GUIEditor3.label[3], "default-bold-small")
guiLabelSetColor(GUIEditor3.label[3], 255, 0, 0)
GUIEditor3.button[1] = guiCreateButton(12, 484, 348, 44, "Antworten", false, GUIEditor3.window[1])
guiSetFont(GUIEditor3.button[1], "default-bold-small")
guiSetProperty(GUIEditor3.button[1], "NormalTextColour", "FFFF0000")
GUIEditor3.button[2] = guiCreateButton(335, 24, 20, 20, "X", false, GUIEditor3.window[1])
guiSetProperty(GUIEditor3.button[2], "NormalTextColour", "FFFF0000")
guiSetFont(GUIEditor3.button[2], "default-bold-small")
GUIEditor3.memo[1] = guiCreateMemo(68, 123, 278, 210, "", false, GUIEditor3.window[1])
guiMemoSetReadOnly(GUIEditor3.memo[1], true)
GUIEditor3.label[4] = guiCreateLabel(69, 46, 272, 15, "{TYPE}", false, GUIEditor3.window[1])
GUIEditor3.gridlist[1] = guiCreateGridList(12, 352, 304, 122, false, GUIEditor3.window[1])
guiSetProperty(GUIEditor3.gridlist[1], "SortSettingEnabled", "false")
guiSetProperty(GUIEditor3.gridlist[1], "ColumnsSizable", "false")
guiSetProperty(GUIEditor3.gridlist[1], "ColumnsMovable", "false")
antwort_grid_id = guiGridListAddColumn(GUIEditor3.gridlist[1], "ID", 0.4)
antwort_grid_from = guiGridListAddColumn(GUIEditor3.gridlist[1], "Von", 0.4)
GUIEditor3.button[3] = guiCreateButton(329, 352, 31, 122, "A\nN\nZ\nE\nI\nG\nE\nN", false, GUIEditor3.window[1])
guiSetFont(GUIEditor3.button[3], "default-bold-small")
guiSetProperty(GUIEditor3.button[3], "NormalTextColour", "FFFF0000")


GUIEditor4 = {
    button = {},
    window = {},
    label = {},
    memo = {}
}
GUIEditor4.window[1] = guiCreateWindow(x/2-(333/2), y/2-(370/2), 333, 370, "Antwort erstellen | Ticket (#{ID})", false)
--guiWindowSetMovable(GUIEditor4.window[1], false)
guiSetAlpha(GUIEditor4.window[1], 1.00)
guiSetVisible(GUIEditor4.window[1], false)
guiWindowSetSizable(GUIEditor4.window[1], false)
guiSetProperty(GUIEditor4.window[1], "CaptionColour", "FFFF0000")

GUIEditor4.memo[1] = guiCreateMemo(10, 63, 308, 249, "", false, GUIEditor4.window[1])
GUIEditor4.button[1] = guiCreateButton(10, 322, 308, 37, "Antworten", false, GUIEditor4.window[1])
guiSetFont(GUIEditor4.button[1], "default-bold-small")
guiSetProperty(GUIEditor4.button[1], "NormalTextColour", "FFFF0000")
GUIEditor4.button[2] = guiCreateButton(304, 24, 20, 20, "X", false, GUIEditor4.window[1])
guiSetFont(GUIEditor4.button[2], "default-bold-small")
guiSetProperty(GUIEditor4.button[2], "NormalTextColour", "FFFF0000")
GUIEditor4.label[1] = guiCreateLabel(10, 44, 176, 19, "Antworttext:", false, GUIEditor4.window[1])
guiSetFont(GUIEditor4.label[1], "default-bold-small")
guiLabelSetColor(GUIEditor4.label[1], 255, 0, 0)


GUIEditor5 = {
    button = {},
    window = {},
    label = {},
    memo = {}
}
GUIEditor5.window[1] = guiCreateWindow(x/2-(332/2), y/2-(330/2), 332, 330, "Antwort lesen", false)
--guiWindowSetMovable(GUIEditor5.window[1], false)
guiSetAlpha(GUIEditor5.window[1], 1.00)
guiSetVisible(GUIEditor5.window[1], false)
guiWindowSetSizable(GUIEditor5.window[1], false)
guiSetProperty(GUIEditor5.window[1], "CaptionColour", "FFFF0000")

GUIEditor5.memo[1] = guiCreateMemo(10, 63, 308, 249, "", false, GUIEditor5.window[1])
guiMemoSetReadOnly(GUIEditor5.memo[1], true)
GUIEditor5.button[1] = guiCreateButton(304, 24, 19, 20, "X", false, GUIEditor5.window[1])
guiSetFont(GUIEditor5.button[1], "default-bold-small")
guiSetProperty(GUIEditor5.button[1], "NormalTextColour", "FFFF0000")
GUIEditor5.label[1] = guiCreateLabel(10, 44, 176, 19, "Antwort von {NAME}:", false, GUIEditor5.window[1])
guiSetFont(GUIEditor5.label[1], "default-bold-small")
guiLabelSetColor(GUIEditor5.label[1], 255, 0, 0)


function updateTicketsFunc(id, owner, title, typ, state)	
	local curState
	if state == "open" then
		curState = "offen"
		local open_row = guiGridListAddRow ( GUIEditor.gridlist["open"] )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_id , id, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_owner , owner, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_title , title, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_type , typ, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_state , curState, false, false )
	end
	if state == "answered" then
		curState = "beantwortet"
		local open_row = guiGridListAddRow ( GUIEditor.gridlist["open"] )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_id , id, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_owner , owner, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_title , title, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_type , typ, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["open"], open_row, open_state , curState, false, false )
	end
	if state == "closed" then
		curState = "geschlossen"
		local closed_row = guiGridListAddRow ( GUIEditor.gridlist["closed"] )
		guiGridListSetItemText ( GUIEditor.gridlist["closed"], closed_row, closed_id , id, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["closed"], closed_row, closed_owner , owner, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["closed"], closed_row, closed_title , title, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["closed"], closed_row, closed_type , typ, false, false )
		guiGridListSetItemText ( GUIEditor.gridlist["closed"], closed_row, closed_state , curState, false, false )
	end
	local all_row = guiGridListAddRow ( GUIEditor.gridlist["all"] )
    guiGridListSetItemText ( GUIEditor.gridlist["all"], all_row, all_id , id, false, false )
	guiGridListSetItemText ( GUIEditor.gridlist["all"], all_row, all_owner , owner, false, false )
	guiGridListSetItemText ( GUIEditor.gridlist["all"], all_row, all_title , title, false, false )
	guiGridListSetItemText ( GUIEditor.gridlist["all"], all_row, all_type , typ, false, false )
	guiGridListSetItemText ( GUIEditor.gridlist["all"], all_row, all_state , curState, false, false )
end
addEvent ( "updateTickets", true )
addEventHandler ( "updateTickets", getRootElement(), updateTicketsFunc )

local closeCooldown
addCommandHandler("tickets", function ()
	if getElementData ( lp, "loggedin" ) == 1 then
		if not isTimer(closeCooldown) then
			if not guiGetVisible(GUIEditor.window[1]) then
			guiSetVisible(GUIEditor.window[1], true)
			showCursor(true)
			setElementData ( lp, "ElementClicked", true )
			updateFromServer()
			closeCooldown = setTimer(function() end, 5000, 1)
			end
		else
		outputChatBox("#FF0000Du musst 5 Sekunden warten, bevor du das Ticketsystem erneut öffnen kannst.", 255, 0, 0, true)
		end
	end
end)


addCommandHandler("kontakt", function ()
	if getElementData ( lp, "loggedin" ) == 1 then
		if not isTimer(closeCooldown) then
			if not guiGetVisible(GUIEditor.window[1]) then
			guiSetVisible(GUIEditor.window[1], true)
			showCursor(true)
			setElementData ( lp, "ElementClicked", true )
			updateFromServer()
			closeCooldown = setTimer(function() end, 5000, 1)
			end
		else
		outputChatBox("#FF0000Du musst 5 Sekunden warten, bevor du das Ticketsystem erneut öffnen kannst.", 255, 0, 0, true)
		end
	end
end)

function updateFromServer()
	guiGridListClear(GUIEditor.gridlist["open"])
	guiGridListClear(GUIEditor.gridlist["closed"])
	guiGridListClear(GUIEditor.gridlist["all"])
	triggerServerEvent("updateTicketsForClient", getLocalPlayer())
end
addEvent ( "updateFromServerEvent", true )
addEventHandler ( "updateFromServerEvent", getRootElement(), updateFromServer )

--main schliessen
addEventHandler ( "onClientGUIClick", GUIEditor.button[2], function (button, state) 
	if button == "left" and source == GUIEditor.button[2] then
		guiSetVisible(GUIEditor.window[1], false)
		guiSetVisible(GUIEditor2.window[1], false)
		guiSetVisible(GUIEditor3.window[1], false)
		guiSetVisible(GUIEditor4.window[1], false)
		guiSetVisible(GUIEditor5.window[1], false)
		showCursor(false)
		setElementData ( lp, "ElementClicked", false )
	end
end, false )

--main aktualisieren
addEventHandler ( "onClientGUIClick", GUIEditor.button[5], function (button, state) 
	if button == "left" and source == GUIEditor.button[5] then
		updateFromServer()
		guiSetEnabled(GUIEditor.button[5], false)
		setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[5], true)
		local refreshCooldown = 5
		guiSetText(GUIEditor.button[5], "Aktualisieren ("..refreshCooldown..")")
		setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[5], "Aktualisieren ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[5], "Aktualisieren") end end, 1000, 5)
		guiSetVisible(GUIEditor2.window[1], false)
		guiSetVisible(GUIEditor3.window[1], false)
		guiSetVisible(GUIEditor4.window[1], false)
		guiSetVisible(GUIEditor5.window[1], false)
	end
end, false )

--ticket erstellen gui oeffnen
addEventHandler ( "onClientGUIClick", GUIEditor.button[1], function (button, state) 
	if button == "left" and source == GUIEditor.button[1] then
		guiSetVisible(GUIEditor2.window[1], true)
		guiBringToFront(GUIEditor2.window[1])
		guiRadioButtonSetSelected(GUIEditor2.radiobutton[1], true)
		guiSetText(GUIEditor2.edit[1], "")
		guiSetText(GUIEditor2.memo[1], "")
		guiSetVisible(GUIEditor3.window[1], false)
		guiSetVisible(GUIEditor4.window[1], false)
		guiSetVisible(GUIEditor5.window[1], false)
	end
end, false )

--ticket erstellen gui schliessen
addEventHandler ( "onClientGUIClick", GUIEditor2.button[2], function (button, state) 
	if button == "left" and source == GUIEditor2.button[2] then
		guiSetVisible(GUIEditor2.window[1], false)
	end
end, false )

--ticket erstellen ueberpruefen ob titel vorhanden
addEventHandler("onClientGUIChanged", GUIEditor2.edit[1], function() 
	if string.len(guiGetText(GUIEditor2.edit[1])) < 1 then
		guiSetEnabled(GUIEditor2.button[1], false)
		guiSetEnabled(GUIEditor2.memo[1], false)
	else
		guiSetEnabled(GUIEditor2.button[1], true)
		guiSetEnabled(GUIEditor2.memo[1], true)
	end
end)

--ticket erstellen absenden
local selectedType
addEventHandler ( "onClientGUIClick", GUIEditor2.button[1], function (button, state) 
	if guiRadioButtonGetSelected(GUIEditor2.radiobutton[1]) then
		selectedType = guiGetText(GUIEditor2.radiobutton[1])
	end
	if guiRadioButtonGetSelected(GUIEditor2.radiobutton[2]) then
		selectedType = guiGetText(GUIEditor2.radiobutton[2])
	end
	if guiRadioButtonGetSelected(GUIEditor2.radiobutton[3]) then
		selectedType = guiGetText(GUIEditor2.radiobutton[3])
	end
	if button == "left" and source == GUIEditor2.button[1] then
		triggerServerEvent("insertTicketData", getLocalPlayer(), selectedType, guiGetText(GUIEditor2.edit[1]), guiGetText(GUIEditor2.memo[1]))
		guiSetVisible(GUIEditor2.window[1], false)
	end
end, false )

--close ticket
addEventHandler ( "onClientGUIClick", GUIEditor.button[4], function (button, state) 
	if button == "left" and source == GUIEditor.button[4] then
		if guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab["open"] then
			local curItem = guiGridListGetSelectedItems ( GUIEditor.gridlist["open"] )
			triggerServerEvent("closeTicket", getLocalPlayer(), guiGridListGetItemText ( GUIEditor.gridlist["open"], curItem[1]["row"], 1 ))
			updateFromServer()
			guiSetEnabled(GUIEditor.button[4], false)
			setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[4], true)
			local refreshCooldown = 5
			guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen ("..refreshCooldown..")")
			setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen") end end, 1000, 5)
			guiSetVisible(GUIEditor2.window[1], false)
			guiSetVisible(GUIEditor3.window[1], false)
			guiSetVisible(GUIEditor4.window[1], false)
			guiSetVisible(GUIEditor5.window[1], false)
		end
		if guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab["all"] then
			local curItem = guiGridListGetSelectedItems ( GUIEditor.gridlist["all"] )
			triggerServerEvent("closeTicket", getLocalPlayer(), guiGridListGetItemText ( GUIEditor.gridlist["all"], curItem[1]["row"], 1 ))
			updateFromServer()
			guiSetEnabled(GUIEditor.button[4], false)
			setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[4], true)
			local refreshCooldown = 5
			guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen ("..refreshCooldown..")")
			setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[4], "Ausgewähltes\nTicket schliessen") end end, 1000, 5)
			guiSetVisible(GUIEditor2.window[1], false)
			guiSetVisible(GUIEditor3.window[1], false)
			guiSetVisible(GUIEditor4.window[1], false)
			guiSetVisible(GUIEditor5.window[1], false)
		end
	end
end, false )


--ticket anzeigen gui oeffnen, initialisieren
addEventHandler ( "onClientGUIClick", GUIEditor.button[3], function (button, state) 
	if button == "left" and source == GUIEditor.button[3] then
		if guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab["open"] then
			local curItem = guiGridListGetSelectedItems ( GUIEditor.gridlist["open"] )
			guiGridListClear(GUIEditor3.gridlist[1])
			triggerServerEvent("getSelTicketDataFromServer", getLocalPlayer(), guiGridListGetItemText ( GUIEditor.gridlist["open"], curItem[1]["row"], 1 ))
			guiSetVisible(GUIEditor3.window[1], true)
			guiSetEnabled(GUIEditor.button[3], false)
			setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[3], true)
			local refreshCooldown = 5
			guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")")
			setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen") end end, 1000, 5)
			guiBringToFront(GUIEditor3.window[1])
			guiSetVisible(GUIEditor4.window[1], false)
			guiSetVisible(GUIEditor2.window[1], false)
			guiSetVisible(GUIEditor5.window[1], false)
		end
		if guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab["closed"] then
			local curItem = guiGridListGetSelectedItems ( GUIEditor.gridlist["closed"] )
			guiGridListClear(GUIEditor3.gridlist[1])
			triggerServerEvent("getSelTicketDataFromServer", getLocalPlayer(), guiGridListGetItemText ( GUIEditor.gridlist["closed"], curItem[1]["row"], 1 ))
			guiSetVisible(GUIEditor3.window[1], true)
			guiSetEnabled(GUIEditor.button[3], false)
			setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[3], true)
			local refreshCooldown = 5
			guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")")
			setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen") end end, 1000, 5)
			guiBringToFront(GUIEditor3.window[1])
			guiSetVisible(GUIEditor4.window[1], false)
			guiSetVisible(GUIEditor2.window[1], false)
			guiSetVisible(GUIEditor5.window[1], false)
		end
		if guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab["all"] then
			local curItem = guiGridListGetSelectedItems ( GUIEditor.gridlist["all"] )
			guiGridListClear(GUIEditor3.gridlist[1])
			triggerServerEvent("getSelTicketDataFromServer", getLocalPlayer(), guiGridListGetItemText ( GUIEditor.gridlist["all"], curItem[1]["row"], 1 ))
			guiSetVisible(GUIEditor3.window[1], true)
			guiSetEnabled(GUIEditor.button[3], false)
			setTimer(guiSetEnabled, 5000, 1, GUIEditor.button[3], true)
			local refreshCooldown = 5
			guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")")
			setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen ("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor.button[3], "Ausgewähltes\nTicket anzeigen") end end, 1000, 5)
			guiBringToFront(GUIEditor3.window[1])
			guiSetVisible(GUIEditor4.window[1], false)
			guiSetVisible(GUIEditor2.window[1], false)
			guiSetVisible(GUIEditor5.window[1], false)
			
		end
	end
end, false )

--update sel ticket
local curTicketID
function updateSelTicketFunc(id, typ, title, text, state)
	guiSetText(GUIEditor3.window[1], "Ticket (#"..id..")")
	guiSetText(GUIEditor3.label[4], typ)
	guiSetText(GUIEditor3.edit[1], title)
	guiSetText(GUIEditor3.memo[1], text)
	guiSetText(GUIEditor4.window[1], "Antwort erstellen | Ticket (#"..id..")")
	if state == "open" then
		guiSetEnabled(GUIEditor3.button[1], true)
		guiSetText(GUIEditor3.button[1], "Antworten")
	elseif state == "closed" then
		guiSetEnabled(GUIEditor3.button[1], false)
		guiSetText(GUIEditor3.button[1], "(Ticket ist geschlossen)")
	end
	curTicketID = id
	
end
addEvent ( "updateSelTicket", true )
addEventHandler ( "updateSelTicket", getRootElement(), updateSelTicketFunc )

--ticket anzeigen schliessen
addEventHandler ( "onClientGUIClick", GUIEditor3.button[2], function (button, state) 
	if button == "left" and source == GUIEditor3.button[2] then
		guiSetVisible(GUIEditor3.window[1], false)
		guiSetVisible(GUIEditor4.window[1], false)
		guiSetVisible(GUIEditor5.window[1], false)
	end
end, false )

--antwort erstellen oeffnen
addEventHandler ( "onClientGUIClick", GUIEditor3.button[1], function (button, state) 
	if button == "left" and source == GUIEditor3.button[1] then
		guiSetVisible(GUIEditor4.window[1], true)
		guiBringToFront(GUIEditor4.window[1])
		guiSetText(GUIEditor4.memo[1], "")
		guiSetEnabled(GUIEditor4.button[1], false)
	end
end, false )

--antwort erstellen schliessen
addEventHandler ( "onClientGUIClick", GUIEditor4.button[2], function (button, state) 
	if button == "left" and source == GUIEditor4.button[2] then
		guiSetVisible(GUIEditor4.window[1], false)
	end
end, false )

--antwort erstellen absenden
addEventHandler ( "onClientGUIClick", GUIEditor4.button[1], function (button, state) 
	if button == "left" and source == GUIEditor4.button[1] then
		guiGridListClear(GUIEditor3.gridlist[1])
		triggerServerEvent("insertAntwortData", getLocalPlayer(), curTicketID, guiGetText(GUIEditor4.memo[1]))
		triggerServerEvent("getSelTicketDataFromServer", getLocalPlayer(), curTicketID)
		guiSetVisible(GUIEditor4.window[1], false)
		updateFromServer()
	end
end, false )

--antworten aktualisieren
function updateSelTicketAntwortenFunc(id, from)
		local open_row = guiGridListAddRow ( GUIEditor3.gridlist[1] )
		guiGridListSetItemText ( GUIEditor3.gridlist[1], open_row, antwort_grid_id, id, false, false )
		guiGridListSetItemText ( GUIEditor3.gridlist[1], open_row, antwort_grid_from, from, false, false )
end
addEvent ( "updateSelTicketAntworten", true )
addEventHandler ( "updateSelTicketAntworten", getRootElement(), updateSelTicketAntwortenFunc )

--antworten ueberpruefen ob text vorhanen
addEventHandler("onClientGUIChanged", GUIEditor4.memo[1], function() 
	if string.len(guiGetText(GUIEditor4.memo[1])) < 2 then
		guiSetEnabled(GUIEditor4.button[1], false)
	else
		guiSetEnabled(GUIEditor4.button[1], true)
	end
end)

--antwort lesen oeffnen
addEventHandler ( "onClientGUIClick", GUIEditor3.button[3], function (button, state) 
	if button == "left" and source == GUIEditor3.button[3] then
		local curItem = guiGridListGetSelectedItems ( GUIEditor3.gridlist[1] )
		triggerServerEvent("getCurAntwort", getLocalPlayer(), curTicketID, guiGridListGetItemText ( GUIEditor3.gridlist[1], curItem[1]["row"], 1 ))
		guiSetEnabled(GUIEditor3.button[3], false)
		setTimer(guiSetEnabled, 5000, 1, GUIEditor3.button[3], true)
		local refreshCooldown = 5
		guiSetText(GUIEditor3.button[3], "("..refreshCooldown..")")
		setTimer(function () refreshCooldown = refreshCooldown - 1 guiSetText(GUIEditor3.button[3], "("..refreshCooldown..")") if refreshCooldown == 0 then guiSetText(GUIEditor3.button[3], "A\nN\nZ\nE\nI\nG\nE\nN") end end, 1000, 5)
		guiBringToFront(GUIEditor3.window[1])
		guiSetVisible(GUIEditor4.window[1], false)
		guiSetVisible(GUIEditor2.window[1], false)
		guiSetVisible(GUIEditor5.window[1], true)
		guiBringToFront(GUIEditor5.window[1])
	end
end, false )

--aktualisere Antwort text
function updateReadAntwortFunc(from, text)
	guiSetText(GUIEditor5.label[1], "Antwort von "..from..":")
	guiSetText(GUIEditor5.memo[1], text)
end
addEvent ( "updateReadAntwort", true )
addEventHandler ( "updateReadAntwort", getRootElement(), updateReadAntwortFunc )

--antwort lesen schliessen
addEventHandler ( "onClientGUIClick", GUIEditor5.button[1], function (button, state) 
	if button == "left" and source == GUIEditor5.button[1] then
		guiSetVisible(GUIEditor5.window[1], false)
	end
end, false )