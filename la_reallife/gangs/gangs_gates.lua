------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

Nostragate = createObject ( 980, 1213.5, -1843, 15.199999809265, 0, 0, 0 )
gateMoved = false

function moveGate ( player )
    if getTeamName(getPlayerTeam(player)) == "Nostra" then
        if getDistanceBetweenPoints3D ( 1213.5, -1843, 15.199999809265, getElementPosition ( player ) ) < 10 then
            if gateMoved == false then
                moveObject ( Nostragate, 5000, 1213.5, -1843, 5.199999809265)
                gateMoved = true
            else
                moveObject ( Nostragate, 5000, 1213.5, -1843, 15.199999809265)
                gateMoved = false
            end
        end
    end
end
addCommandHandler ( "move", moveGate )