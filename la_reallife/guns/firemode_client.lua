-- Semi = Einzelschuss, Burst = Feuerstoß, Auto = Automatik

local firestate = "auto"
local kindOfAmmo = ""
local ammoKindEventHandled = false
local isEvent = false

fireModeWeapons = {
 [28]=350,
 [29]=350,
 [30]=350,
 [31]=350,
 [32]=350
 }

local x = math.floor ( 1338 / 1680 * screenwidth + 0.5 )
local x2 = math.floor ( 1325 / 1680 * screenwidth + 0.5 )
local y = math.floor ( 30 / 1050 * screenheight + 0.5 )
local y2 = math.floor ( 5 / 1050 * screenheight + 0.5 )

local size = 1 / 1650 * screenwidth

function weaponStateRender ()
	dxDrawText(firestate,x+1,y,999,999,tocolor(0,0,0,255),size,"pricedown","left","top",false,false,false)
	dxDrawText(firestate,x,y-1,999,999,tocolor(255,255,255,255),size,"pricedown","left","top",false,false,false)
end
function kindOfAmmoRender ()
	dxDrawText(kindOfAmmo,x+1,y2,999,999,tocolor(0,0,0,255),size,"pricedown","left","top",false,false,false)
	dxDrawText(kindOfAmmo,x,y2-1,999,999,tocolor(255,255,255,255),size,"pricedown","left","top",false,false,false)
end

local removeAmmoKindEventHandlerTimer

function refreshAmmoKindDraw ()

	local ammoTyp = getElementData ( lp, "curAmmoTyp" )
	if ammoTyp and ammoTyp > 0 and weaponsWithSpeacialAmmo[getPedWeapon ( lp )] then
		if rangedWeapons[getPedWeapon ( lp )] then
			if getElementData ( lp, "ammoTyp"..ammoTyp ) > 0 then
				if not ammoKindEventHandled then
					ammoKindEventHandled = true
					addEventHandler ( "onClientRender", getRootElement(), kindOfAmmoRender )
				end
				if isTimer ( removeAmmoKindEventHandlerTimer ) then
					killTimer ( removeAmmoKindEventHandlerTimer )
				end
				removeAmmoKindEventHandlerTimer = setTimer (
					function ()
						removeEventHandler ( "onClientRender", getRootElement(), kindOfAmmoRender )
						ammoKindEventHandled = false
					end,
				1500, 1 )
				kindOfAmmo = ""
				
				kindOfAmmo = kindOfAmmo..specialAmmoName[ammoTyp]
				
				kindOfAmmo = kindOfAmmo.." ("..getElementData ( lp, "ammoTyp"..ammoTyp )..")"
			end
		end
	elseif ammoKindEventHandled then
		removeEventHandler ( "onClientRender", getRootElement(), kindOfAmmoRender )
		ammoKindEventHandled = false
		if isTimer ( removeAmmoKindEventHandlerTimer ) then
			killTimer ( removeAmmoKindEventHandlerTimer )
		end
	end
end

function showWeaponFireState ( bool )

	if fireModeWeapons[getPedWeapon ( lp )] or bool then
		bindFireModeChangeKey ()
		if not isEvent then
			addEventHandler ( "onClientRender", getRootElement(), weaponStateRender )
			isEvent = true
		end
	end
end
function hideWeaponFireState ()

	if isEvent then
		removeEventHandler ( "onClientRender", getRootElement(), weaponStateRender )
		isEvent = false
	end
end
function weaponFireModeDecision ( weapon )

	if fireModeWeapons[weapon] and source == lp then
		if firestate == "auto" then
			-- Vollautomatik = GTA-Standart
		elseif firestate == "semi" and not isTimer ( weaponModeTimer ) then
			setPedControlState ( "fire", false )
			toggleControl ( "fire", false )
			weaponModeTimer = setTimer ( toggleControl, 250, 1, "fire", true )
		elseif firestate == "burst" and not isTimer ( weaponModeTimer ) then
			burstFire ( weapon )
		else
			cancelEvent ()
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), weaponFireModeDecision )

function burstFire ( weapon )

	weapon = getPedWeapon ( lp )
	if getPedControlState ( "fire" ) and fireModeWeapons[weapon] then
		setTimer ( setPedControlState, fireModeWeapons[weapon], 1, "fire", false )
		setTimer ( toggleControl, fireModeWeapons[weapon], 1, "fire", false )
		weaponModeTimer = setTimer ( toggleControl, fireModeWeapons[weapon]*2, 1, "fire", true )
		setTimer ( burstFire, fireModeWeapons[weapon]*2, 1, weapon )
	end
end

function changeFireMode ()
	local weapon = getPedWeapon ( lp )
	if weapon == 28 or weapon == 32 then
		if firestate == "burst" then
			firestate = "semi"
		else
			firestate = "burst"
		end
	end
	if fireModeWeapons[getPedWeapon ( lp )] and not getPedOccupiedVehicle ( lp ) then
		if firestate == "auto" then
			if laGetElementData ( lp, "fraktion" ) == 8 then
				if laGetElementData ( lp, "rang" ) == 0 then
					firestate = "semi"
				else
					firestate = "burst"
				end
			else
				firestate = "burst"
			end
		elseif firestate == "burst" then
			firestate = "semi"
		else
		-- firestate == "semi"
			if laGetElementData ( lp, "fraktion" ) == 8 then
				if laGetElementData ( lp, "rang" ) == 0 then
					firestate = "burst"
				else
					firestate = "auto"
				end
			else
				firestate = "auto"
			end
		end
		showWeaponFireState ()
		setTimer ( hideWeaponFireState, 1500, 1 )
		playSoundFrontEnd ( 41 )
	end
end

function bindFireModeChangeKey ()
	local weapon = getPedWeapon ( lp )
	if weapon == 28 or weapon == 32 then
			firestate = "burst"
	end
	if laGetElementData ( lp, "fraktion" ) == 8 then
		if laGetElementData ( lp, "rang" ) > 1 then
	--		firestate = "auto"
		elseif laGetElementData ( lp, "rang" ) == 1 then
	--		firestate = "burst"
		else
			firestate = "burst"
		end
	end
	unbindKey ( "x", "down", changeFireMode )
	bindKey ( "x", "down", changeFireMode )
end