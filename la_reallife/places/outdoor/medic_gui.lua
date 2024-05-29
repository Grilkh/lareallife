------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------


local medicPickup = createPickup ( -2647.7, 696, 27.9, 3, 1240, 0, 0 )

function showMedicGui (hit, dim)

	if hit == lp and dim then
		showCursor ( true )
		setElementData ( lp, "ElementClicked", true )
		if gWindow["Medic"] then
			guiSetVisible ( gWindow["Medic"], true )
		else
			gWindow["Medic"] = guiCreateWindow(screenwidth/2-670/2,screenheight/2-257/2,670,257,"Krankenhaus",false)
			guiWindowSetMovable ( gWindow["Medic"], false )
			guiWindowSetSizable ( gWindow["Medic"], false )
			guiSetAlpha(gWindow["Medic"],1)
			
			gLabel[1] = guiCreateLabel(115,31,460,125,"Herzlich willkommen im Krankenhaus in SF! Hier kannst du dich für 25$ komplett\nheilen lassen. Dadurch hast du wieder volle HP und bist bereit für weitere\nAbenteuer in Los Angeles!\n\nÜbrigens: Du kannst auch über das Internet Medikits bestellen,\nwelche du überall schnell und einfach verwenden kannst! unter www.medi.com",false,gWindow["Medic"])
			guiSetAlpha(gLabel[1],1)
			guiLabelSetColor(gLabel[1],200,200,0)
			guiLabelSetVerticalAlign(gLabel[1],"top")
			guiLabelSetHorizontalAlign(gLabel[1],"left",false)
			guiSetFont(gLabel[1],"default-bold-small")
			
			gButton["medicCenterClose"] = guiCreateButton(620,25,16,19,"x",false,gWindow["Medic"])
			guiSetAlpha(gButton["medicCenterClose"],1)
			guiSetFont(gButton["medicCenterClose"],"default-bold-small")
			gButton["medicCenterBuy"] = guiCreateButton(120,150,423,70,"Ja, ich möchte mich heilen lassen. (Kostet 25$)",false,gWindow["Medic"])
			guiSetAlpha(gButton["medicCenterBuy"],1)
			guiSetFont(gButton["medicCenterBuy"],"default-bold-small")
			
			addEventHandler ( "onClientGUIClick", gButton["medicCenterClose"],
				function ()
					showCursor ( false )
					setElementData ( lp, "ElementClicked", false )
					guiSetVisible ( gWindow["Medic"], false )
				end
			)
			
			addEventHandler ( "onClientGUIClick", gButton["medicCenterBuy"],
				function ()
						showCursor ( false )
						setElementData ( lp, "ElementClicked", false )
						guiSetVisible ( gWindow["Medic"], false )
						
						triggerServerEvent ( "buyMedic", lp )
				end
			)
		end
	end
end
addEventHandler ( "onClientPickupHit", medicPickup, showMedicGui )