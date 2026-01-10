------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local maindomane = "www.medic-center.com"
Domanes[maindomane] = maindomane

Domanes["medi"] = maindomane
Domanes["medi.com"] = maindomane
Domanes["medi.de"] = maindomane
Domanes["www.medi.com"] = maindomane
Domanes["www.medi.de"] = maindomane




addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()

		local img = createBasicPage ( "white" )

		gImage["medi"] = guiCreateStaticImage(5,0,189,225,"images/internet/medi.jpg",false,img)
		gLabel["medi1"] = guiCreateLabel(200,14,193,69,"Du bist verwundet?\nDu brauchst schnell Hilfe?\n\nDann bestell hier jetzt und sofort\nein Medikit und lass dir helfen!\n",false,img)
		guiLabelSetColor(gLabel["medi1"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["medi1"],"top")
		guiLabelSetHorizontalAlign(gLabel["medi1"],"left",false)
		guiSetFont(gLabel["medi1"],"default-bold-small")
		gLabel["medi3"] = guiCreateLabel(200,100,191,108,"Ein Standard-Medikit\nkostet 50$ inkl. MwSt!\n24/7 Lieferservice innerhalb\nvon 10 Minuten!",false,img)
		guiLabelSetColor(gLabel["medi3"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["medi3"],"top")
		guiLabelSetHorizontalAlign(gLabel["medi3"],"left",false)
		guiSetFont(gLabel["medi3"],"default-bold-small")
		
		gButton["mediDeliver"] = guiCreateButton(200,175,150,55,"Jetzt liefern!",false,img)
		addEventHandler("onClientGUIClick", gButton["mediDeliver"], 
			function ( btn, state )
				if state == "up" then
					if getElementData ( lp, "money" ) >= 50 then
						triggerServerEvent ( "mediOnlineDeliver", lp )
					else
						outputChatBox ( "Ein Medikit kostet 50$!", 125, 0, 0 )
					end
				end
			end,
		false)
	end
)