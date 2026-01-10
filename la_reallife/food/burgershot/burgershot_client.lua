--DriveinMarkers

--SF1
local dx1, dy1, dz1 = -2352.765625, -155.2479095459, 34.0703125
--SF2
local dx2, dy2, dz2 = -2344.787, 1024.018, 50.695
--LS1
local dx4, dy4, dz4 = 800.33, -1629.49, 12.3828125
--LS2
local dx5, dy5, dz5 = 1214.369140625, -904.6806640625, 41.9209976196295
--LV1
local dx6, dy6, dz6 = 2154.13, 2808.33, 9.81
--LV2
local dx7, dy7, dz7 = 1856.83, 2081.05, 9.82
--LV3
local dx8, dy8, dz8 = 2488.01, 2022.739, 9.82
--LV4
local dx9, dy9, dz9 = 1168.09, 2084.234, 9.82

local DriveInMarkerSF1 = createMarker ( dx1, dy1, dz1, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerSF2 = createMarker ( dx2, dy2, dz2, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLS1 = createMarker ( dx4, dy4, dz4, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLS2 = createMarker ( dx5, dy5, dz5, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLV1 = createMarker ( dx6, dy6, dz6, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLV2 = createMarker ( dx7, dy7, dz7, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLV3 = createMarker ( dx8, dy8, dz8, "cylinder", 5, 0, 0, 255, 150 )
local DriveInMarkerLV4 = createMarker ( dx9, dy9, dz9, "cylinder", 5, 0, 0, 255, 150 )


function showDriveIn_func ( hit, dim )

	local _, _, z1 = getElementPosition ( source )
	local _, _, z2 = getElementPosition ( hit )
	local diff = math.abs ( z1 - z2 )
	if hit == lp and dim and diff < 5 then
		setElementData ( lp, "ElementClicked", true, true )
		showCursor ( true )
		if gWindow["burgershotDriveIn"] then
			guiSetVisible ( gWindow["burgershotDriveIn"], true )
		else
			gWindow["burgershotDriveIn"] = guiCreateWindow ( screenwidth/2-284/2, screenheight/2-122/2, 284, 122, "Burgershot", false )
			guiSetAlpha(gWindow["burgershotDriveIn"],1)
			
			gImage["burgershotBurger"] = guiCreateStaticImage(0.0317,0.5,0.1761,0.4098,"images/inventory/burger.bmp",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gImage["burgershotBurger"],1)
			gImage["burgershotSnack"] = guiCreateStaticImage(0.4859,0.5,0.1761,0.4098,"images/inventory/snack.bmp",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gImage["burgershotSnack"],1)
			
			gLabel["burgershotInfo"] = guiCreateLabel(0.0352,0.1885,0.7711,0.23,"Herzlich willkommen bei \"Burgershot\".\nIhre Bestellung bitte!",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo"],1)
			guiLabelSetColor(gLabel["burgershotInfo"],200,200,000)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo"],"left",false)
			guiSetFont(gLabel["burgershotInfo"],"default-bold-small")
			gLabel["burgershotInfo1"] = guiCreateLabel(0.2676,0.4344,0.1408,0.123,"Burger",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo1"],1)
			guiLabelSetColor(gLabel["burgershotInfo1"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo1"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo1"],"left",false)
			guiSetFont(gLabel["burgershotInfo1"],"default-bold-small")
			gLabel["burgershotInfo2"] = guiCreateLabel(0.2993,0.5656,0.0915,0.1311, burgerPrice.."$",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo2"],1)
			guiLabelSetColor(gLabel["burgershotInfo2"],025,125,000)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo2"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo2"],"left",false)
			guiSetFont(gLabel["burgershotInfo2"],"default-bold-small")
			gLabel["burgershotPrice1"] = guiCreateLabel(0.7711,0.6066,0.0906,0.1301, snackPrice.."$",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotPrice1"],1)
			guiLabelSetColor(gLabel["burgershotPrice1"],25,125,0)
			guiLabelSetVerticalAlign(gLabel["burgershotPrice1"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotPrice1"],"left",false)
			guiSetFont(gLabel["burgershotPrice1"],"default-bold-small")
			gLabel["burgershotPrice2"] = guiCreateLabel(0.7359,0.4672,0.1717,0.122,"Snack",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotPrice2"],1)
			guiLabelSetColor(gLabel["burgershotPrice2"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["burgershotPrice2"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotPrice2"],"left",false)
			guiSetFont(gLabel["burgershotPrice2"],"default-bold-small")
			
			gButton["burgershotClose"] = guiCreateButton(0.9014,0.1885,0.0669,0.1639,"X",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["burgershotClose"],1)
			gButton["BurgershotBuy1"] = guiCreateButton(0.2289,0.7213,0.2148,0.1967,"Kaufen",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["BurgershotBuy1"],1)
			gButton["BurgershotBuy2"] = guiCreateButton(0.6972,0.7377,0.2148,0.1967,"Kaufen",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["BurgershotBuy2"],1)
			
			addEventHandler( "onClientGUIClick", gButton["burgershotClose"],
				function ()
					guiSetVisible ( gWindow["burgershotDriveIn"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy1"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 1 )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy2"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 2 )
				end
			)
		end
	end
end
addEvent( "show_Burger_GUI", true)
addEventHandler("show_Burger_GUI", getRootElement(), showDriveIn_func)

addEventHandler ( "onClientMarkerHit", DriveInMarkerSF1, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerSF2, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLS1, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLS2, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV1, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV2, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV3, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV4, showDriveIn_func )






function showBurgerIn_func ( hit, dim )
	if hit == lp then
		setElementData ( lp, "ElementClicked", true, true )
		showCursor ( true )
		if gWindow["burgershotBuy"] then
			guiSetVisible ( gWindow["burgershotBuy"], true )
		else
			gWindow["burgershotBuy"] = guiCreateWindow ( screenwidth/2-272/2, screenheight/2-391/2, 272,391,"Burgershot", false )
			guiSetAlpha(gWindow["burgershotBuy"],1)
			gButton["burgershotBuyClose"] = guiCreateButton(9,318,254,59,"Nichts kaufen",false,gWindow["burgershotBuy"])
			guiSetAlpha(gButton["burgershotBuyClose"],1)
			gButton["BurgershotBuy1"] = guiCreateButton(9,23,254,59,"Salat (5$)",false,gWindow["burgershotBuy"])
			guiSetAlpha(gButton["BurgershotBuy1"],1)
			gButton["BurgershotBuy2"] = guiCreateButton(9,88,254,59,"kleiner Burger (3$)",false,gWindow["burgershotBuy"])
			guiSetAlpha(gButton["BurgershotBuy2"],1)
			gButton["BurgershotBuy3"] = guiCreateButton(9,155,254,59,"normaler Burger (7$)",false,gWindow["burgershotBuy"])
			guiSetAlpha(gButton["BurgershotBuy3"],1)
			gButton["BurgershotBuy4"] = guiCreateButton(9,222,254,59,"grosser Burger (10$)",false,gWindow["burgershotBuy"])
			guiSetAlpha(gButton["BurgershotBuy4"],1)
			
			addEventHandler( "onClientGUIClick", gButton["burgershotBuyClose"],
				function ()
					guiSetVisible ( gWindow["burgershotBuy"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy1"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 3 )
					guiSetVisible ( gWindow["burgershotBuy"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy2"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 4 )
					guiSetVisible ( gWindow["burgershotBuy"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy3"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 5 )
					guiSetVisible ( gWindow["burgershotBuy"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy4"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 6 )
					guiSetVisible ( gWindow["burgershotBuy"], false )
					setElementData ( lp, "ElementClicked", false, true )
					showCursor ( false )
				end
			)
		end
	end
end
addEvent( "show_Burgershot_GUI", true)
addEventHandler("show_Burgershot_GUI", getRootElement(), showBurgerIn_func)