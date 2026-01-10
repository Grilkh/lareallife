--[[function playerDamage_func ( attacker )

	local victim = source
	if victim == lp or attacker == lp then
		if attacker then
			if getElementData ( lp, "isInHighNoon" ) or getElementData ( lp, "In_DMArena" ) == 1 then
			
			else
				if getElementData ( attacker, "jailtime" ) >= 1 or getElementData ( source, "jailtime" ) >= 1 then
					cancelEvent()
				else
					if getElementData ( attacker, "playingtime" ) <= 180 then
						if attacker == lp then
							outputChatBox ( "Erst wenn du insgesamt 3 Stunden gespielt hast, kannst du andere Spieler verletzen.", 150, 0, 0 )
							outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
						end
						cancelEvent()
					elseif getElementData ( victim, "playingtime" ) <= 180 then
						if getElementData (victim, "wanteds") > 0 then
							if (getElementData (attacker, "fraktion") == 1) or (getElementData (attacker, "fraktion") == 6) or (getElementData (attacker, "fraktion") == 8) then
								return
							else
								if victim == lp then
									outputChatBox ( "Da du noch nicht 3 Stunden gespielt hast, kannst du noch nicht von anderen Spielern verletzt werden.", 0, 150, 0 )
									outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
								end
								if attacker == lp then
									outputChatBox ( "Erst wenn der Spieler insgesamt 3 Stunden gespielt hat, kannst du ihn verletzen.", 150, 0, 0 )
									outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
								end
								cancelEvent()							
							end
						else
							if victim == lp then
								outputChatBox ( "Da du noch nicht 3 Stunden gespielt hast, kannst du noch nicht von anderen Spielern verletzt werden.", 0, 150, 0 )
								outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
							end
							if attacker == lp then
								outputChatBox ( "Erst wenn der Spieler insgesamt 3 Stunden gespielt hat, kannst du ihn verletzen.", 150, 0, 0 )
								outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
							end
							cancelEvent()
						end
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), playerDamage_func )]]

--[[damageImage = guiCreateStaticImage(0,0,1,1,"images/blut.png",true)
guiSetAlpha ( damageImage, 0 )
guiSetEnabled ( damageImage, false )]]

FireingEnabled = false

function chokecheck ( weapon, player )

	if source == getLocalPlayer() then
		if getElementModel ( source ) == 285 then
			cancelEvent()
		end
	end
end
addEventHandler ( "onClientPlayerChoke", getRootElement(), chokecheck )

function disableKnifeAimKill ( prev, next, player )

	local prevW = getPedWeapon ( lp, prev )
	local nextW = getPedWeapon ( lp, next )
	if source == lp then
		if prevW == 43 then
			setHudLessModeEnabled ( false )
		elseif nextW == 43 then
			setHudLessModeEnabled ( true )
		end
		if nextW == 4 then
			toggleControl ( "aim_weapon", false )
		elseif not getElementData ( lp, "isInHighNoon" ) then
			toggleControl ( "aim_weapon", true )
		end
	elseif player then
		if not getElementData ( lp, "isInHighNoon" ) then
			toggleControl ( "aim_weapon", true )
		end
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), disableKnifeAimKill )

--[[function onPlayerDamage ( attacker, weapon, bodypart, loss )

	if source == getLocalPlayer() then
		armor = getPedArmor (source)
		health = getElementHealth (source)
		lossdubble =  math.floor(loss * 2)
		losshalfpast =  math.floor(loss * 1.5)
		losshalf =  math.floor(loss / 2)
		losshalfaway = math.floor(loss / 1.333333)
		if attacker then
			local x, y, z = getElementPosition ( source )
			if getElementData ( source, "nodmzone" ) == 1 then
				cancelEvent()			
			elseif getElementData ( attacker, "nodmzone" ) == 1 then
				cancelEvent()	
			else
				--Tazer--
				if weapon == 3 then
					local model = getElementModel(attacker) 
					if armySkins[model] or fbiSkins[model] or copskins[model] then
						triggerServerEvent( "tazer", source, attacker )
						cancelEvent()
					else
						if health - lossdubble <= 0 then
							killPed(source)
						else
							setElementHealth ( source, health - lossdubble )
						end
					end
				--Hiebwaffen--
				elseif (weapon == 1) or (weapon == 2) or (weapon == 4) or (weapon == 5) or (weapon == 6) or (weapon == 7) or (weapon == 8) then
					if health - lossdubble <= 0 then
						killPed(source)
					else
						setElementHealth ( source, health - lossdubble )
					end
					cancelEvent()
				----Katana--15----
				--Geschenke/Other[Vib]--
				elseif (weapon == 10) or (weapon == 11) or (weapon == 12) or (weapon == 13) or (weapon == 14) or (weapon == 15) then
					if health - lossdubble <= 0 then
						killPed(source)
					else
						setElementHealth ( source, health - lossdubble )
					end
					cancelEvent()
				--Granaten--
				end

				if ( weapon == 38 ) then
					cancelEvent()
				elseif weapon == 39 then
					setElementHealth ( source, getElementHealth ( source ) - loss * 2 )
				end
				if attacker and not getElementData ( source, "isInHighNoon" ) and not isPedDead ( source ) then
					showBloodFlash ()
				end
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), onPlayerDamage )]]

--[[function showBloodFlash ()

	guiSetEnabled ( damageImage, true )
	if isTimer ( bloodTimer ) then
		killTimer ( bloodTimer )
	end
	bloodTimer = setTimer ( bloodFlash, 50, -1 )
	guiSetAlpha ( damageImage, 1 )
end

function bloodFlash()

	alpha = guiGetAlpha ( damageImage )
	if alpha == 0 then
		killTimer ( bloodTimer )
		guiSetEnabled ( damageImage, false )
	else
		guiSetAlpha ( damageImage, alpha - 0.1 )
	end
end]]

function reddot_func ()

	if not reddotEnabled then
		reddotEnabled = true
		addEventHandler ( "onClientRender", getRootElement(), reddot_render )
		outputChatBox ( "Rotpunkt-Visir aktiviert!", 0, 150, 0 )
	else
		reddotEnabled = false
		removeEventHandler ( "onClientRender", getRootElement(), reddot_render )
		outputChatBox ( "Rotpunkt-Visir deaktiviert!", 150, 0, 0 )
	end
end
addCommandHandler ( "reddot", reddot_func )

fireWeapons = {
[2]=true,
[3]=true,
[4]=true,
[5]=true,
[6]=true,
[7]=true
}

function reddot_render ()

	local curGun = getPedWeapon ( lp )
	if curGun then
		if fireWeapons[getSlotFromWeapon(curGun)] then
			local x1, y1, z1 = getPedWeaponMuzzlePosition ( lp )
			local x2, y2, z2 = getPedTargetEnd ( lp )
			if x1 and x2 and getPedControlState ( lp, "aim_weapon" ) then
				dxDrawLine3D ( x1, y1, z1, x2, y2, z2, tocolor ( 125, 0, 0, 125 ), 2, false )
			end
		end
	end
end










local width, height = guiGetScreenSize ( )
local target
local targetname
local weapon
local bodypart
local loss
local bodypartname
 
function DamageText_GW ()
if bodypart == 3 then
	bodypartname = "Oberkoerper"
elseif bodypart == 4 then
	bodypartname = "Hintern"
elseif bodypart == 5 then
	bodypartname = "Linker Arm"
elseif bodypart == 6 then
	bodypartname = "Rechter Arm"
elseif bodypart == 7 then
	bodypartname = "Linkes Bein"
elseif bodypart == 8 then
	bodypartname = "Rechtes Bein"
elseif bodypart == 9 then
	bodypartname = "Kopf"
else
	bodypartname = ""
end
	local text = ""..targetname..", "..loss.." Schaden, "..bodypartname.." "
    -- Schatten
    dxDrawText ( text, width/2, height - 41, width, height, tocolor ( 0, 0, 0, 255 ), 1.02, "default-bold" )
    -- Text
    dxDrawText ( text, width/2, height - 43, width, height, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" ) 
end
 
function DamageText_GW_Rendering_func ( targetS, weaponS, bodypartS, lossS )
	if getElementData (lp, "DamageText") == true then
		stop_DamageText_func()
		killTimer(DamageText_Timer)
	end
	
    addEventHandler ( "onClientRender", getRootElement(), DamageText_GW ) -- Sichtbarkeit ausführen
	target = source
	targetname = targetS
	weapon = weaponS
	bodypart = bodypartS
	loss = math.round(lossS, 1)
	DamageText_Timer = setTimer ( stop_DamageText_func, 5000, 1 )
	setElementData (lp, "DamageText", true)
	playSoundFrontEnd ( 32 )

end
addEvent ("DamageText_GW_Rendering", true )
addEventHandler ("DamageText_GW_Rendering", getRootElement(), DamageText_GW_Rendering_func )

function stop_DamageText_func ()
removeEventHandler ( "onClientRender", getRootElement(), DamageText_GW )
setElementData (lp, "DamageText", false)
end






















-------------------------------
-- The "Damage" Script is a ---
----- Script by schotobi ------
----------- © - 2013 ----------
-------------------------------

local lp = getLocalPlayer()
local getroffen = false


weaponDamages = {}
	weaponDamages[8] = 30
	
	weaponDamages[22] = 9
	weaponDamages[23] = 9
	weaponDamages[24] = 22.5
	
	weaponDamages[25] = 18
	weaponDamages[26] = 9
	weaponDamages[27] = 7.2
	
	weaponDamages[28] = 13.5
	weaponDamages[29] = 9
	weaponDamages[32] = 13.5
	
	weaponDamages[30] = 7.2
	weaponDamages[31] = 5.4
	
	weaponDamages[33] = 18
	weaponDamages[34] = 45
	
	weaponDamages[35] = 45
	weaponDamages[36] = 40.5
	
	weaponDamages[51] = 9
--auch in Server anpassen


function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )
	if hitElement then
		local hx, hy, hz = getElementPosition(hitElement)
		if math.sqrt((hitX-hx)^2) <= 0.35 and math.sqrt((hitY-hy)^2) <= 0.35 and math.sqrt((hitZ-hz)^2) <= 0.9 then
			getroffen = true
			--outputChatBox("TRUE GESETTED")--DEBUG
		else
			getroffen = false
			--outputChatBox("FALSE GESETTED")--DEBUG
		end
	end
	--outputChatBox(getroffen, getRootElement())
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), onClientPlayerWeaponFireFunc)

function getGetroffen()
	return getroffen
end

function cancelAllDamage ( attacker, weapon, bodypart, loss )

	if attacker == lp then
		if not ( weapon == 17 and getElementModel ( source ) == 285 ) then
			if attacker and weapon and bodypart and loss then
				if weaponDamages[weapon] then
					local victim = source
					if victim == lp or attacker == lp then
						if attacker then
							if getElementData ( source, "nodmzone" ) == 1 then
								cancelEvent()
								return
							elseif getElementData ( attacker, "nodmzone" ) == 1 then
								cancelEvent()
								return
							else
								--Tazer--
								if weapon == 3 then
									local model = getElementModel(attacker) 
									if armySkins[model] or fbiSkins[model] or copskins[model] then
										triggerServerEvent( "tazer", source, attacker )
										cancelEvent()
										return
									end
								end
							
								if getElementData ( lp, "isInHighNoon" ) or getElementData ( lp, "In_DMArena" ) == 1 then
								
								else
									if getElementData ( attacker, "jailtime" ) >= 1 or getElementData ( source, "jailtime" ) >= 1 then
										cancelEvent()
										return
									else
										if getElementData ( attacker, "playingtime" ) <= 180 then
											if attacker == lp then
												outputChatBox ( "Erst wenn du insgesamt 3 Stunden gespielt hast, kannst du andere Spieler verletzen.", 150, 0, 0 )
												outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
											end
											cancelEvent()
											return
										elseif getElementData ( victim, "playingtime" ) <= 180 then
											if getElementData (victim, "wanteds") > 0 then
												if (getElementData (attacker, "fraktion") == 1) or (getElementData (attacker, "fraktion") == 6) or (getElementData (attacker, "fraktion") == 8) then
													setTimer(sendData, 50, 1, lp, attacker, weapon, bodypart, loss, source)
												else
													if victim == lp then
														outputChatBox ( "Da du noch nicht 3 Stunden gespielt hast, kannst du noch nicht von anderen Spielern verletzt werden.", 0, 150, 0 )
														outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
													end
													if attacker == lp then
														outputChatBox ( "Erst wenn der Spieler insgesamt 3 Stunden gespielt hat, kannst du ihn verletzen.", 150, 0, 0 )
														outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
													end
													cancelEvent()
													return													
												end
											else
												if victim == lp then
													outputChatBox ( "Da du noch nicht 3 Stunden gespielt hast, kannst du noch nicht von anderen Spielern verletzt werden.", 0, 150, 0 )
													outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
												end
												if attacker == lp then
													outputChatBox ( "Erst wenn der Spieler insgesamt 3 Stunden gespielt hat, kannst du ihn verletzen.", 150, 0, 0 )
													outputChatBox ( "Aber auch dann ist sinnloses Deathmatch strengstens verboten!", 200, 0, 0 )
												end
												cancelEvent()
												return
											end
										else
											setTimer(sendData, 50, 1, lp, attacker, weapon, bodypart, loss, source)
										end
									end
								end
							end
						end
					end
				end
				if weapon == 0 then
					triggerServerEvent("transferBlood", source)
				end
			end
		end
	elseif lp == source then
		if weapon ~= 17 then
			initBloodScreen()
		end
		if attacker and weapon and bodypart and loss then
			if weaponDamages[weapon] then
				cancelEvent ()
				
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), cancelAllDamage )

function sendData (a,b,c,d,e,f,g)
	if getroffen then
		triggerServerEvent ( "damageCalcServer", a, b, c, d, e, f, g)
		getroffen = false
	end
end




local gMe   = getLocalPlayer();
local gRoot = getRootElement();

local imgTable = { image = {}, alpha = {} };
local drawRec = false;

local screen = { guiGetScreenSize() };
local imgDims = { 
  { screen[1]-screen[1]/1.76+25, screen[2]-(screen[2]/2.5), screen[1]/1.76, screen[2]/1.6 },
  { screen[1]/2-screen[1]/1.76, screen[2]-(screen[2]/1.8), screen[1]/1.76, screen[2]/1.6 },
  { screen[1]-screen[1]/1.99, screen[2]-(screen[2]/1.5), screen[1]/1.76, screen[2]/1.6 },
  { screen[1]-screen[1]/3.6, screen[2]/120, screen[1]/4.2, screen[2]/1.5 },
  { screen[1]/25, screen[2]/25, screen[1]/1.76, screen[2]/1.6 },
  { screen[1]/2-screen[1]/5, screen[2]/120, screen[1]/1.76, screen[2]/1.6 }
}

addEventHandler( 'onClientResourceStart', gRoot,
  function ( res )
    if res == getThisResource() then
      for i = 1, 6 do
        imgTable.image[i] = 'images/blood/blood_'..tostring(i)..'.png';
        imgTable.alpha[i] = 0;
      end
      rectangleAlpha = 0;
    end
  end
)


function initBloodScreen()
	imgTable.alpha[math.random(1,6)] = 255;
	rectangleAlpha = 150;
	if drawRec == false then
		drawRec = true;
		addEventHandler( 'onClientRender', gRoot, renderRectangle );
	end
end

addEvent ( "init", true )
addEventHandler ( "init", getRootElement(), initBloodScreen )

--[[addEventHandler( 'onClientRender', gRoot,
  function ()
    for imgKey, imgAdress in ipairs( imgTable.image ) do
      if imgTable.alpha[imgKey] > 0 then
        imgTable.alpha[imgKey] = imgTable.alpha[imgKey] - 5;
      end;
      if imgKey == 6 then
        dxDrawImage( imgDims[imgKey][1], imgDims[imgKey][2], imgDims[imgKey][3], imgDims[imgKey][4], imgAdress, 90, 0, 0, tocolor( 225, 0, 0, imgTable.alpha[imgKey] ) );
      else
        dxDrawImage( imgDims[imgKey][1], imgDims[imgKey][2], imgDims[imgKey][3], imgDims[imgKey][4], imgAdress, 0, 0, 0, tocolor( 225, 0, 0, imgTable.alpha[imgKey] ) );
      end;
    end;
  end
);]]

function renderRectangle()
  if rectangleAlpha > 0 then
    rectangleAlpha = rectangleAlpha - 5;
    dxDrawRectangle( 0, 0, screen[1], screen[2], tocolor( 155, 0, 0, rectangleAlpha ) );
  else
    removeEventHandler( 'onClientRender', gRoot, renderRectangle );
    drawRec = false;
  end;
end;