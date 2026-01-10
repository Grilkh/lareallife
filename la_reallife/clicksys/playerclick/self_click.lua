------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function hideall ()
	local elementNames = {
        "handybg", "plistadmin", "rtext", "bonusmenue", "anrufen", "sms",
        "stats", "friendlistMenue", "passwordChange", "selfNotes",
        "selfAnimations", "socialRankSelection", "suchtInfo", "achievmentList", "spawnPointSelection"
    }
	local guiElements = {}
	 -- Iterate through the element names and check if each one exists
	for _, name in ipairs(elementNames) do
        if gWindow[name] and isElement(gWindow[name]) then
            table.insert(guiElements, gWindow[name])
        else
            outputDebugString("Element " .. name .. " does not exist or is not valid.")
        end
    end
	-- Hides the elements in guiElements
	for _, element in ipairs(guiElements) do
		if guiGetVisible(element) then
			if guiGetVisible(element) then
            	guiSetVisible(element, false)
				outputDebugString("Element "..tostring(element).. " hiding")
			end
		end
    end
	-- Not Perfect yet
	if isElement(optionsWindow) then
		guiSetVisible(optionsWindow, false)
	end
    -- Disable input and save notes
    guiSetInputEnabled(false)
    saveNotes()
end

function SelfAdminBtn ()

	if getElementData ( lp, "adminlvl" ) >= 2 then
		hideall ()
		showAdminMenue ()
	end
end

function SelfOptionBtn ()

	hideall ()
	triggerEvent ( "_createOptionmenue", getLocalPlayer() )
end

function SelfCancelBtn ()

	hideall ()
	guiSetVisible ( gWindows["selfclick"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function SelfStateBtn ()

	hideall ()
	showStats()
end

function showNotes ()

	hideall ()
	if not gWindow["selfNotes"] then
		gWindow["selfNotes"] = guiCreateWindow(screenwidth/2-214/2,120,214,214,"Notizen",false)
		guiSetAlpha(gWindow["selfNotes"],1)
		guiWindowSetMovable(gWindow["selfNotes"],false)
		guiWindowSetSizable(gWindow["selfNotes"],false)
		gMemo["selfNotes"] = guiCreateMemo(10,30,195,174,"",false,gWindow["selfNotes"])
		guiSetAlpha(gMemo["selfNotes"],1)
		loadNotes ()
	else
		guiSetVisible ( gWindow["selfNotes"], true )
	end
end

function showEmoteList ()

	hideall ()
	if not gWindow["selfEmotes"] then
		gWindow["selfAnimations"] = guiCreateWindow(screenwidth/2-256/2,120,256,201,"Animationen",false)
		guiWindowSetMovable(gWindow["selfAnimations"],false)
		guiWindowSetSizable(gWindow["selfAnimations"],false)
		guiSetAlpha(gWindow["selfAnimations"],1)
		
		gGrid["selfAnimations"] = guiCreateGridList(10,29,135,160,false,gWindow["selfAnimations"])
		guiGridListSetSelectionMode(gGrid["selfAnimations"],2)
		gColumn["selfAnimation"] = guiGridListAddColumn(gGrid["selfAnimations"],"Animation",0.8)
		guiSetAlpha(gGrid["selfAnimations"],1)
		
		gButton["selfStartEmote"] = guiCreateButton(150,29,95,44,"Animation ausführen",false,gWindow["selfAnimations"])
		guiSetAlpha(gButton["selfStartEmote"],1)
		addEventHandler("onClientGUIClick", gButton["selfStartEmote"],
			function()
				local cmd = guiGridListGetItemText ( gGrid["selfAnimations"], guiGridListGetSelectedItem ( gGrid["selfAnimations"] ), gColumn["selfAnimation"] )
				triggerServerEvent ( "executeCommandHandlerServer", lp, lp, cmd, guiGetText ( gMemo["selfEmoteDanceStyle"] ) )
			end, false
		)
		gButton["selfStopEmote"] = guiCreateButton(151,80,94,44,"Animation stoppen",false,gWindow["selfAnimations"])
		guiSetAlpha(gButton["selfStopEmote"],1)
		addEventHandler("onClientGUIClick", gButton["selfStopEmote"],
			function()
				triggerServerEvent ( "executeCommandHandlerServer", lp, lp, "stopanim", guiGetText ( gMemo["selfEmoteDanceStyle"] ) )
			end, false
		)
		
		gLabel["selfEmoteInfo"] = guiCreateLabel(169,139,70,24,"Tanzstil:",false,gWindow["selfAnimations"])
		guiSetAlpha(gLabel["selfEmoteInfo"],1)
		guiLabelSetColor(gLabel["selfEmoteInfo"],125,125,255)
		guiLabelSetVerticalAlign(gLabel["selfEmoteInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["selfEmoteInfo"],"left",false)
		guiSetFont(gLabel["selfEmoteInfo"],"default-bold-small")
		
		gMemo["selfEmoteDanceStyle"] = guiCreateMemo(151,156,85,31,"",false,gWindow["selfAnimations"])
		guiSetAlpha(gMemo["selfEmoteDanceStyle"],1)
		
		addEmotesToList ( gGrid["selfAnimations"], gColumn["selfAnimation"] )
	else
		guiSetVisible ( gWindow["selfEmotes"], true )
	end
end

function addEmotesToList ( grid, column )

	for key, animation in ipairs ( animationCMDs ) do
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, column, animation, false, false )
	end
end

function loadNotes ()

	local noteList = xmlLoadFile ( ":"..resourceName.."/notes/notes.xml" )
	if not noteList then
		local noteList = xmlCreateFile ( ":"..resourceName.."/notes/notes.xml", "notes" )
		local notes = xmlCreateChild ( noteList, "noteText" )
		xmlNodeSetValue ( notes, "" )
		xmlSaveFile ( noteList )
		guiSetText ( gMemo["selfNotes"], notes )
	else
		local notes = xmlNodeGetChildren ( noteList, 0 )
		local notes = xmlNodeGetValue ( notes )
		guiSetText ( gMemo["selfNotes"], notes )
	end
end

function saveNotes ()

	if gMemo["selfNotes"] then
		local noteText = guiGetText ( gMemo["selfNotes"] )
		local file = xmlLoadFile ( ":"..resourceName.."/notes/notes.xml" )
		local node = xmlNodeGetChildren ( file, 0 )
		xmlNodeSetValue ( node, noteText )
		xmlSaveFile ( file )
	end
end

function ShowSelfClickMenue_func()

if getElementData ( lp, "tiedsecur" ) == 1 then
	outputChatBox ( "Du musst warten bis du entfesselt wirst!", 255, 0, 0 )
else
	guiSetInputEnabled ( true )
	if gWindows["selfclick"] then
		guiSetVisible ( gWindows["selfclick"], true )
	else
		gWindows["selfclick"] = guiCreateWindow(screenwidth/2-730/2,1,730,123,"Eigenmenü",false)
		
		gButtons["selfstatus"] = guiCreateButton(18,28,118,35,"Status",false,gWindows["selfclick"])
		gButtons["selfoptions"] = guiCreateButton(18,76,118,35,"Optionen",false,gWindows["selfclick"])
		
		gButtons["selfadmin"] = guiCreateButton(157,28,118,35,"Admin",false,gWindows["selfclick"])
		gButtons["selfcancel"] = guiCreateButton(158,76,298,35,"Zurück zum Spiel",false,gWindows["selfclick"])
		
		gButtons["selfhandy"] = guiCreateButton(461,28,118,35,"Handy",false,gWindows["selfclick"])
		gButtons["selffriendlist"] = guiCreateButton(462,76,118,35,"Friendlist",false,gWindows["selfclick"])
		
		gButtons["selfnotes"] = guiCreateButton(596,28,118,35,"Notizen",false,gWindows["selfclick"])
		gButtons["selfemotes"] = guiCreateButton(595,76,118,35,"Animationen",false,gWindows["selfclick"])
		
		gImage["la"] = guiCreateStaticImage(333,32,72,38,"images/la.png",false,gWindows["selfclick"])
		
		addEventHandler("onClientGUIClick", gButtons["selfadmin"], SelfAdminBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfcancel"], SelfCancelBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfoptions"], SelfOptionBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfstatus"], SelfStateBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfhandy"],
			function()
				hideall ()
				showHandy()
			end, false
		)
		addEventHandler("onClientGUIClick", gButtons["selffriendlist"],
			function()
				if getElementData ( getLocalPlayer(), "premium" ) then
					hideall ()
					showFriendlistSelf()
				else
					outputChatBox ( "Nur für Premium Benutzer!", 125, 0, 0 )
				end
			end, false
		)
		addEventHandler("onClientGUIClick", gButtons["selfnotes"],
			function()
				showNotes ()
			end, false
		)
		addEventHandler("onClientGUIClick", gButtons["selfemotes"],
			function()
				showEmoteList ()
			end, false
		)
		
		guiWindowSetSizable(gWindows["selfclick"],false)
		guiWindowSetMovable(gWindows["selfclick"],false)
		guiSetAlpha(gWindows["selfclick"],1)
	end
	guiSetText ( gButtons["selfstatus"], "Status" )
end
end
addEvent ( "ShowSelfClickMenue", true)
addEventHandler ( "ShowSelfClickMenue", getLocalPlayer(),  ShowSelfClickMenue_func)