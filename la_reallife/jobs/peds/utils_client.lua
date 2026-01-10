------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------


local screenX , screenY = guiGetScreenSize ( )
local curTeamName

addEventHandler ( "onClientRender" , root ,
	function ( )
		for index , teamChar in ipairs ( getElementsByType ( "ped" , resourceRoot ) ) do
			if getElementData (teamChar, "jobped" ) == true then
			local teamName = getElementData ( teamChar , "teamName" )
			local charName = getElementData ( teamChar , "charName" )
			local posX , posY , posZ = getElementPosition ( teamChar )
			local camX , camY , camZ = getCameraMatrix ( )
			local RGB = getElementData ( teamChar , "RGB" )
			local distance = getDistanceBetweenPoints3D ( camX , camY , camZ , posX , posY , posZ )
			if distance < 12 then
				local sX , sY = getScreenFromWorldPosition ( posX , posY , posZ + 1.25 )
				if sX then
					dxDrawFramedText ( charName , sX , sY , sX , sY , tocolor ( RGB [ 1 ] , RGB [ 2 ] , RGB [ 3 ] , 255 ) , ( screenX / 1440 ) * 2 , "default-bold" , "center" , "center" , false , false , false )
				end
				sX , sY = getScreenFromWorldPosition ( posX , posY , posZ + 1 )
				if sX then
					dxDrawFramedText ( teamName , sX , sY , sX , sY , tocolor ( RGB [ 1 ] , RGB [ 2 ] , RGB [ 3 ] , 255 ) , ( screenX / 1440 ) * 2 , "default-bold" , "center" , "center" , false , false , false )
				end
			end
			end
		end
	end
)

function dxDrawFramedText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left + 1 , top + 1 , width + 1 , height + 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left + 1 , top - 1 , width + 1 , height - 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top + 1 , width - 1 , height + 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top - 1 , width - 1 , height - 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI )
end

addEventHandler ( "onClientPedDamage" , resourceRoot ,
	function ( )
		if getElementData (source, "undeadbarped" ) then
		cancelEvent ( )
		end
	end
)

addEventHandler ( "onClientResourceStart" , resourceRoot ,
	function ( )
		tcGUI = build_tcGUI ( )
		--dGUI = build_dGUI ( )
	end
)

function build_tcGUI()
	
	local gui = {}
	
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 305, 137
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	gui["_root"] = guiCreateWindow(left, top, windowWidth, windowHeight, "Job annehmen", false)
	guiWindowSetSizable(gui["_root"], false)
	guiWindowSetMovable(gui["_root"], false)
	guiSetAlpha(gui["_root"], 1)
	guiSetVisible(gui["_root"], false)
	
	gui["tcInfoL"] = guiCreateLabel(0, 15, 311, 31, "Möchtest du wirklich dem 'Job' beitreten?", false, gui["_root"])
	guiLabelSetHorizontalAlign(gui["tcInfoL"], "center", false)
	guiLabelSetVerticalAlign(gui["tcInfoL"], "center")
	guiLabelSetColor(gui["tcInfoL"], 255, 0, 0)
	
	gui["tcAcceptB"] = guiCreateButton(50, 95, 75, 23, "Annehmen", false, gui["_root"])
	if on_tcAcceptB_clicked then
		addEventHandler("onClientGUIClick", gui["tcAcceptB"], on_tcAcceptB_clicked, false)
	end
	
	gui["tcCancelB"] = guiCreateButton(180, 95, 75, 23, "Abbrechen", false, gui["_root"])
	if on_tcCancelB_clicked then
		addEventHandler("onClientGUIClick", gui["tcCancelB"], on_tcCancelB_clicked, false)
	end
	
	return gui, windowWidth, windowHeight
end

function on_tcAcceptB_clicked(button, state, absoluteX, absoluteY)
	if (button ~= "left") or (state ~= "up") then
		return
	end
	guiSetVisible ( tcGUI [ "_root" ] , false )
	showCursor ( false )
	triggerServerEvent ( "server:setPlayerTeam" , localPlayer , curTeamName )
	setElementFrozen ( localPlayer , false )
end

function on_tcCancelB_clicked(button, state, absoluteX, absoluteY)
	if (button ~= "left") or (state ~= "up") then
		return
	end
	guiSetVisible ( tcGUI [ "_root" ] , false )
	showCursor ( false )
end

addEvent ( "client:showTeamCheckGUI" , true )
addEventHandler ( "client:showTeamCheckGUI" , root ,
	function ( teamName , colorTable )
		guiSetText ( tcGUI [ "tcInfoL" ] , "Willst du dem Team '" .. teamName .. "' beitreten?" )
		guiLabelSetColor ( tcGUI [ "tcInfoL" ] , colorTable [ 1 ] , colorTable [ 2 ] , colorTable [ 3 ] )
		guiSetVisible ( tcGUI [ "_root" ] , true )
		showCursor ( true )
		curTeamName = teamName
	end
)

---EINTRAGEN---
addEvent ( "show_Job_Window" , true )
addEventHandler ( "show_Job_Window" , root ,
	function ( teamName , colorTable )
		if teamName == "Busfahrer" then
			jobName = "bus"
		elseif teamName == "Dealer" then
			jobName = "dealer"
		elseif teamName == "Farmer" then
			jobName = "farmer"
		elseif teamName == "Fischer" then
			jobName = "fischer"
		elseif teamName == "Flughafenmitarbeiter" then
			jobName = "airport"
		elseif teamName == "Gabelstaplerfahrer" then
			jobName = "gabelstapler"
		elseif teamName == "Hotdogverkaeufer" then
			jobName = "hotdog"
		elseif teamName == "Lieferant" then
			jobName = "lieferant"
		elseif teamName == "Strassenreiniger" then
			jobName = "streetclean"
		elseif teamName == "Taxifahrer" then
			jobName = "taxifahrer"
		elseif teamName == "Trucker" then
			jobName = "trucker"
		end
		guiSetText ( tcGUI [ "tcInfoL" ] , "Möchtest du als '" .. teamName .. "' arbeiten? " )
		guiLabelSetColor ( tcGUI [ "tcInfoL" ] , colorTable [ 1 ] , colorTable [ 2 ] , colorTable [ 3 ] )
		guiSetVisible ( tcGUI [ "_root" ] , true )
		showCursor ( true )
		curTeamName = jobName
	end
)

---EINTRAGEN---
addEvent ( "client:recieveSettings" , true )
addEventHandler ( "client:recieveSettings" , root ,
	function ( drogendealerColor, waffendealerColor, busColor, dealerColor, farmerColor, fischerColor, flughafenmitarbeiterColor, gabelstaplerColor, hotdogColor, lieferantColor, strassenreinigungColor, taxiColor, truckerColor, terrorColor )
		--Anderes--
		settingDrogendealerTeamColor = drogendealerColor
		settingWaffendealerTeamColor = waffendealerColor
		settingTerrorTeamColor = terrorColor
		--Jobs--
		settingBusTeamColor = busColor
		settingDealerTeamColor = dealerColor
		settingFarmerTeamColor = farmerColor
		settingFischerTeamColor = fischerColor
		settingFlughafenmitarbeiterTeamColor = flughafenmitarbeiterColor
		settingGabelstaplerTeamColor = gabelstaplerColor
		settingHotdogTeamColor = hotdogColor
		settingLieferantTeamColor = lieferantColor
		settingStrassenreinigungTeamColor = strassenreinigungColor
		settingTaxiTeamColor = taxiColor
		settingTruckerTeamColor = truckerColor
	end
)

addEventHandler ( "onClientResourceStart" , resourceRoot ,
	function ( )
		triggerServerEvent ( "server:sendSettings" , localPlayer )
	end
)



function createInvulnerablePed ( skin, x, y, z, r, int, dim )

	local ped = createPed ( skin, x, y, z )
	outputDebugString("utils_client: 188 - PED erstellt ped")
	if not dim then
		dim = 0
	end
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	setPedRotation ( ped, r )
	addEventHandler ( "onClientPedDamage", ped,
		function ()
			cancelEvent()
		end
	)
	return ped
end

function makePedInvulnerable_func ( ped )

	addEventHandler ( "onClientPedDamage", ped,
		function ()
			cancelEvent()
		end
	)
end
addEvent ( "makePedInvulnerable", true )
addEventHandler ( "makePedInvulnerable", getRootElement(), makePedInvulnerable_func )