------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function Projcre(player,tX,tY,tZ)
	if isPedInVehicle(player)then
		createProjectile(player,20,tX,tY,tZ,10,getPedOccupiedVehicle(player))
	else
		createProjectile(player,20,tX,tY,tZ,10,player)
	end
end
addEvent("createProj",true)
addEventHandler("createProj",getRootElement(),Projcre)