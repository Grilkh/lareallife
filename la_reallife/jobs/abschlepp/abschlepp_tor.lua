------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

removeWorldModel(11014,1000,-2076.4375,-107.9296875,36.96875)
removeWorldModel(11372,1000,-2076.4375,-107.9296875,36.96875)

gate = createObject ( 980, -2042.9284667969, -102.35790252686, 36.945266723633, 0, 0, 0 )
gate2 = createObject ( 980, -2054.4079589844, -102.35790252686, 36.945266723633, 0, 0, 0 )
gateMoved = false

function abschleppGate ( player )
    if laGetElementData ( player, "adminlvl" ) >= 1 then
        if getDistanceBetweenPoints3D ( -2042.9284667969, -102.35790252686, 36.945266723633, getElementPosition ( player ) ) < 20 then
            if gateMoved == false then
                moveObject ( gate, 5000, -2042.9284667969, -102.35790252686, 26.945266723633)
				moveObject ( gate2, 5000, -2054.4079589844, -102.35790252686, 26.945266723633)
                gateMoved = true
            else
                moveObject ( gate, 5000, -2042.9284667969, -102.35790252686, 36.945266723633)
				moveObject ( gate2, 5000, -2054.4079589844, -102.35790252686, 36.945266723633)
                gateMoved = false
            end
        end
    end
end
addCommandHandler ( "move", abschleppGate )

abschleppPickup = createPickup ( -2058.96, -101.0334, 35.171, 3, 1239, 50, 0 )
function pickupHit ( player )

	outputChatBox ( "Herzlich willkommen beim Abschleppplatz. Verwende /autopark um den Lift rechts vom Tor zu betätigen.", player, 200, 2000, 20 )
	outputChatBox ( "Ist dein Auto auf dem Abschleppplatz? Wenn ja, kontaktiere ein Admin um es zurückzukaufen!", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", abschleppPickup, pickupHit )


welcomePickup = createPickup ( -1980.06, 137.82, 27.6875, 3, 1239, 50, 0 )
function pickupWelcomeHit ( player )

	outputChatBox ( "Herzlich willkommen in Los Angeles! Verwende /infos, wenn du die wichtigsten Informationen sehen willst oder drücke F1!", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", welcomePickup, pickupWelcomeHit )


function informationwelcome ( player )
outputChatBox ( "Einen Job kannst du beim Bulldozer-Icon (gelber Bagger) annehmen.", player, 0, 100, 0 )
outputChatBox ( "Führerscheine findest du beim weissen S, bei der Fahrschule.", player, 0, 0, 100 )
outputChatBox ( "Mit /hilfe hast du wichtige Infos und mit /kontakt kontaktierst du das LA-Team!", player, 0, 100, 0 )
outputChatBox ( "Bei den Auto-Symbolen kannst du Fahrzeuge erwerben!", player, 0, 0, 100 )
outputChatBox ( "Waffen, Waffenscheine, Waffenskills findest du beim Pistolen-Icon.", player, 0, 100, 0 )
outputChatBox ( "Du suchst eine Fraktion oder Gang? Dann bewerbe dich noch heute im Forum!", player, 0, 0, 100 )
outputChatBox ( "Forum: www.la-rl.com   TS3: ts.la-rl.com", player, 0, 100, 0 )
end
addCommandHandler ( "infos", informationwelcome )