timetohide = 3000

function hudAusblenden ()

    setPlayerHudComponentVisible ( "ammo", false )
    setPlayerHudComponentVisible ( "weapon", false )
	setPlayerHudComponentVisible ( "health", false )
	setPlayerHudComponentVisible ( "armour", false )
	setPlayerHudComponentVisible ( "money", false )
	setPlayerHudComponentVisible ( "radar", false )
	setPlayerHudComponentVisible ( "area_name", false )
	setPlayerHudComponentVisible ( "clock", false )
	
	ausblendentimer_dmg_started = false
	bindKey ( "b", "both", showall )
end
addEventHandler ( "onClientResourceStart", getRootElement(), hudAusblenden )

function hudEinblendenDmg_func ( a, b, c, d, bool )

	if ( source == getLocalPlayer() and not getElementData ( lp, "isInHighNoon" ) and not isPedDead ( lp ) ) or bool then
		setPlayerHudComponentVisible ( "health", true ) 
		setPlayerHudComponentVisible ( "armour", true )
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
		setPlayerHudComponentVisible ( "ammo", true ) 
		setPlayerHudComponentVisible ( "weapon", true )
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
		setPlayerHudComponentVisible ( "ammo", true )
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
	
	setPlayerHudComponentVisible ( "money", true ) 
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

	setPlayerHudComponentVisible ( "money", false ) 
	ausblendentimer_money_started = false
end

function hudAusblendenDmg ()

	setPlayerHudComponentVisible ( "health", false ) 
	setPlayerHudComponentVisible ( "armour", false )
	ausblendentimer_dmg_started = false
end

function hudAusblendenFire ()

	setPlayerHudComponentVisible ( "ammo", false ) 
	
	ausblendentimer_fire_started = false
end

function hudAusblendenSwitch ()

    setPlayerHudComponentVisible ( "weapon", false )
	
	ausblendentimer_switch_started = false
end

function showall ( key, state )

	if state == "down" and not isPedDead ( lp ) then
		setPlayerHudComponentVisible ( "ammo", true )
		setPlayerHudComponentVisible ( "weapon", true )
		setPlayerHudComponentVisible ( "health", true )
		setPlayerHudComponentVisible ( "armour", true )
		setPlayerHudComponentVisible ( "money", true )
		setPlayerHudComponentVisible ( "area_name", true )
		setPlayerHudComponentVisible ( "clock", true )
		setPlayerHudComponentVisible ( "radar", true )
		showHungerBar()
		showUrinBar()
		showSchlafBar()
	end
	if state == "up" then
		setPlayerHudComponentVisible ( "ammo", false )
		setPlayerHudComponentVisible ( "weapon", false )
		setPlayerHudComponentVisible ( "health", false )
		setPlayerHudComponentVisible ( "armour", false )
		setPlayerHudComponentVisible ( "money", false )
		setPlayerHudComponentVisible ( "area_name", false )
		setPlayerHudComponentVisible ( "clock", false )
		hideHungerBar()
		hideUrinBar()
		hideSchlafBar()
	end
end

function hideall ()

	setPlayerHudComponentVisible ( "ammo", false )
	setPlayerHudComponentVisible ( "weapon", false )
	setPlayerHudComponentVisible ( "health", false )
	setPlayerHudComponentVisible ( "armour", false )
	setPlayerHudComponentVisible ( "money", false )
	setPlayerHudComponentVisible ( "area_name", false )
	setPlayerHudComponentVisible ( "clock", false )
	local inprogress = false
end