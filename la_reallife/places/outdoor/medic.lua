------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------


local medicblip = createBlip ( -2654.819, 634.003, 14.453, 22, 2, 255, 0, 0, 255, 0, 99999, getRootElement() )
local mediclsblip = createBlip ( 2037.577, -1409.361, 17.164, 22, 2, 255, 0, 0, 255, 0, 1000, getRootElement() )


function buyMedic_func (lp)
local lp = source
	if laGetElementData (lp, "money") >= 25 then
		laSetElementData (lp, "money", laGetElementData (lp, "money" ) - 25 )
		setElementHealth ( lp, 100 )
		outputChatBox ( "Du hast dich für 25$ heilen lassen!", lp, 0, 125, 0 )
else
	outputChatBox ( "Du hast nicht genügend Geld dabei!", lp, 125, 0, 0 )
end
end
addEvent ( "buyMedic", true )
addEventHandler ( "buyMedic", getRootElement(), buyMedic_func )