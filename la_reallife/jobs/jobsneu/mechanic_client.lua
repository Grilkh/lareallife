------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------


addEvent('setMechaniker', true)
addEventHandler('setMechaniker', root,
	function()
		addEventHandler('onClientPlayerWeaponFire', root, FixTheVehicle)
	end
)

function FixTheVehicle(weapon, ammo, ammoIC, hx, hy, hz, hitElement)
	if hitElement then
		if getElementType(hitElement) == 'vehicle' then
			if weapon == 41 then
				triggerServerEvent('fixTheVehicle', root, getLocalPlayer(), hitElement)
			end
		end
	end
end

addEventHandler('onClientPlayerDamage', root,
	function(attacker, weapon, bodypart)
		if weapon == 41 then
			cancelEvent()
		end
	end
)



local sX, sY = guiGetScreenSize()
addEvent('showOrder', true)
addEventHandler('showOrder', root,
	function(player, zone, city)
		local y = 547.0
		local function showTheOrder()
			dxDrawFramedText("Anfrage: "..getPlayerName(player).." braucht einen Mechaniker in "..zone.."("..city..")",(sX/1440) * 886.0,(sY/900) * y,(sX/1440) * 1355.0,(sY/900) * 577.0,tocolor(0,255,0,255),(sX/1440) * 1.2,"default","left","top",false,false,false)
			outputChatBox ( "Um Autos zu reparieren, registriere dich zuerst mit /register [Name] [Passwort] und logge dich dannach ein mit /login" , player , 200 , 200 , 200 )
			y = y - 0.3
			if y < 240.0 then
				removeEventHandler('onClientRender', root, showTheOrder)
			end
		end
		addEventHandler('onClientRender', root, showTheOrder)
	end
)