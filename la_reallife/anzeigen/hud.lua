timetohide = 3000

function hudAusblenden ()

    showPlayerHudComponent ( "ammo", false )
    showPlayerHudComponent ( "weapon", false )
	showPlayerHudComponent ( "health", false )
	showPlayerHudComponent ( "armour", false )
	showPlayerHudComponent ( "money", false )
	showPlayerHudComponent ( "radar", false )
	showPlayerHudComponent ( "area_name", false )
	showPlayerHudComponent ( "clock", false )
	
	ausblendentimer_dmg_started = false
	bindKey ( "b", "both", showall )
end
addEventHandler ( "onClientResourceStart", getRootElement(), hudAusblenden )

function hudEinblendenDmg_func ( a, b, c, d, bool )

	if ( source == getLocalPlayer() and not getElementData ( lp, "isInHighNoon" ) and not isPedDead ( lp ) ) or bool then
		showPlayerHudComponent ( "health", true ) 
		showPlayerHudComponent ( "armour", true )
		if ausblendentimer_dmg_started then
			killTimer ( ausblendentimer_dmg )
			ausblendentimer_dmg = setTimer ( hudAusblendenDmg, timetohide, 1 )
			ausblendentimer_dmg_started = true
		else
			ausblendentimer_dmg = setTimer ( hudAusblendenDmg, timetohide, 1 )
			ausblendentimer_dmg_started = true
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement (), hudEinblendenDmg_func )

function hudEinblendenSwitch ( old, new )
	
	if source == getLocalPlayer() and not getElementData ( lp, "isInHighNoon" ) then
		showPlayerHudComponent ( "ammo", true ) 
		showPlayerHudComponent ( "weapon", true )
		if fireModeWeapons[getPedWeapon( lp, new )] then
			showWeaponFireState ( true )
			if getElementData ( lp, "playingtime" ) <= 50*60 and not gunmodeInfo then
				gunmodeInfo = true
				infobox ( "\n\nDeine aktuelle Waffe unterstützt mehrere\nFeuermodi. Drücke \"X\", um sie zu wechseln.", 5000, 200, 200, 0 )
			end
		else
			
		end
		if ausblendentimer_switch_started then
			killTimer ( ausblendentimer_switch )
			ausblendentimer_switch = setTimer ( hudAusblendenSwitch, timetohide, 1 )
			ausblendentimer_switch_started = true
		else
			ausblendentimer_switch = setTimer ( hudAusblendenSwitch, timetohide, 1 )
			ausblendentimer_switch_started = true
		end
		if ausblendentimer_fire_started then
			killTimer ( ausblendentimer_fire )
			ausblendentimer_fire = setTimer ( hudAusblendenFire, timetohide, 1 )
			ausblendentimer_fire_started = true
		else
			ausblendentimer_fire = setTimer ( hudAusblendenFire, timetohide, 1 )
			ausblendentimer_fire_started = true
		end
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), hudEinblendenSwitch )

function hudEinblendenFire ()
	
	if source == getLocalPlayer() and not getElementData ( lp, "isInHighNoon" ) then
		showPlayerHudComponent ( "ammo", true )
		if ausblendentimer_fire_started then
			killTimer ( ausblendentimer_fire )
			ausblendentimer_fire = setTimer ( hudAusblendenFire, timetohide, 1 )
			ausblendentimer_fire_started = true
		else
			ausblendentimer_fire = setTimer ( hudAusblendenFire, timetohide, 1 )
			ausblendentimer_fire_started = true
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), hudEinblendenFire )

function hudEinblendenMoney_func ()
	
	showPlayerHudComponent ( "money", true ) 
	if ausblendentimer_money_started == true then
		killTimer ( ausblendentimer_money )
		ausblendentimer_money = setTimer ( hudAusblendenMoney, timetohide, 1 )
		ausblendentimer_money_started = true
	else
		ausblendentimer_money = setTimer ( hudAusblendenMoney, timetohide, 1 )
		ausblendentimer_money_started = true
	end
end
addEvent ("HudEinblendenMoney", true )
addEventHandler ("HudEinblendenMoney", getRootElement(), hudEinblendenMoney_func)

function hudAusblendenMoney ()

	showPlayerHudComponent ( "money", false ) 
	ausblendentimer_money_started = false
end

function hudAusblendenDmg ()

	showPlayerHudComponent ( "health", false ) 
	showPlayerHudComponent ( "armour", false )
	ausblendentimer_dmg_started = false
end

function hudAusblendenFire ()

	showPlayerHudComponent ( "ammo", false ) 
	
	ausblendentimer_fire_started = false
end

function hudAusblendenSwitch ()

    showPlayerHudComponent ( "weapon", false )
	
	ausblendentimer_switch_started = false
end

function showall ( key, state )

	if state == "down" and not isPedDead ( lp ) then
		showPlayerHudComponent ( "ammo", true )
		showPlayerHudComponent ( "weapon", true )
		showPlayerHudComponent ( "health", true )
		showPlayerHudComponent ( "armour", true )
		showPlayerHudComponent ( "money", true )
		showPlayerHudComponent ( "area_name", true )
		showPlayerHudComponent ( "clock", true )
		showPlayerHudComponent ( "radar", true )
		showHungerBar()
		showUrinBar()
		showSchlafBar()
	end
	if state == "up" then
		showPlayerHudComponent ( "ammo", false )
		showPlayerHudComponent ( "weapon", false )
		showPlayerHudComponent ( "health", false )
		showPlayerHudComponent ( "armour", false )
		showPlayerHudComponent ( "money", false )
		showPlayerHudComponent ( "area_name", false )
		showPlayerHudComponent ( "clock", false )
		hideHungerBar()
		hideUrinBar()
		hideSchlafBar()
	end
end

function hideall ()

	showPlayerHudComponent ( "ammo", false )
	showPlayerHudComponent ( "weapon", false )
	showPlayerHudComponent ( "health", false )
	showPlayerHudComponent ( "armour", false )
	showPlayerHudComponent ( "money", false )
	showPlayerHudComponent ( "area_name", false )
	showPlayerHudComponent ( "clock", false )
	local inprogress = false
end