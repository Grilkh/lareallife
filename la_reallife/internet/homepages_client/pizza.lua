local maindomane = "www.well-stacked-pizza.com"
Domanes[maindomane] = maindomane

Domanes["pizza"] = maindomane
Domanes["pizza.com"] = maindomane
Domanes["pizza.de"] = maindomane
Domanes["www.pizza.com"] = maindomane
Domanes["www.pizza.de"] = maindomane




addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()

		local img = createBasicPage ( "white" )

		gImage["pizza"] = guiCreateStaticImage(5,0,189,225,"images/internet/pizza.jpg",false,img)
		gLabel["pizza1"] = guiCreateLabel(200,14,193,69,"Der wahre Geist von LA,\nüberbacken mit der dreifachen\nMenge an Käse und übergossen\nund getränkt mit bestes\nOlivenöl.*\n",false,img)
		guiLabelSetColor(gLabel["pizza1"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza1"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza1"],"left",false)
		guiSetFont(gLabel["pizza1"],"default-bold-small")
		gLabel["pizza2"] = guiCreateLabel(200,88,161,28,"*Kann Spuren von Nüssen, Glutamat\nund Strontium 90 enthalten",false,img)
		guiLabelSetColor(gLabel["pizza2"],125,125,125)
		guiLabelSetVerticalAlign(gLabel["pizza2"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza2"],"left",false)
		guiSetFont(gLabel["pizza2"],"default-small")
		gLabel["pizza3"] = guiCreateLabel(200,148,191,108,"Ab sofort verfügbar:\n\nDer Well Stacked Pizza Co.\nLieferservice!\n24/7 die Woche, ob morgens zum\nFrühstück oder als Snack in\nder Mittagspause!",false,img)
		guiLabelSetColor(gLabel["pizza3"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza3"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza3"],"left",false)
		guiSetFont(gLabel["pizza3"],"default-bold-small")
		gLabel["pizza4"] = guiCreateLabel(92,214,28,15,"[Neu]",false,img)
		guiLabelSetColor(gLabel["pizza4"],255,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza4"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza4"],"left",false)
		guiSetFont(gLabel["pizza4"],"default-small")
		
		gButton["pizzaDeliver"] = guiCreateButton(50,230,106,55,"Pizza liefern\n( Kosten: 25 $ )",false,img)
		addEventHandler("onClientGUIClick", gButton["pizzaDeliver"], 
			function ( btn, state )
				if state == "up" then
					if getElementData ( lp, "money" ) >= 50 then
						triggerServerEvent ( "deliverPizza", lp )
					else
						outputChatBox ( "Eine Pizza kostet 25 $!", 125, 0, 0 )
					end
				end
			end,
		false)
	end
)