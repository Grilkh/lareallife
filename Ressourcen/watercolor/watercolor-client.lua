addEventHandler("onClientResourceStop", getRootElement(), 
		function()
		   resetWaterColor()
		end)

addEventHandler("onClientResourceStart", getRootElement(), 
		function()
		   setWaterColor(0, 150, 255)
		end)

