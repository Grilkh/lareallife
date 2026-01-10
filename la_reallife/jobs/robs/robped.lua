------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function createPenner ()
local rnd = math.random ( 1, 4 )
if not isElement(pennerped) then
	if rnd == 1 then
		pennerped = createPed(239, -2135.45, -43.95, 35.32)
		laSetElementData(pennerped,"anim", 1)
		setPedRotation(pennerped, 0)
	elseif rnd == 2 then
		pennerped = createPed(230, -2198.77, 78.35, 35.32)
		laSetElementData(pennerped,"anim", 1)
		setPedRotation(pennerped, 0)
	elseif rnd == 3 then
		pennerped = createPed(134, -2123.19, 652.65, 52.36)
		laSetElementData(pennerped,"anim", 1)
		setPedRotation(pennerped, 0)
	elseif rnd == 4 then
		pennerped = createPed(136, -1919.20, 143.28, 27.13)
		laSetElementData(pennerped,"anim", 1)
		setPedRotation(pennerped, 0)
	end
	outputDebugString("robped: createPenner - PED erstellt pennerped")
end
end
-- setTimer ( createPenner, 6000, -1 )
setTimer ( createPenner, 6000, 0 )


function playerTargetCheckPenner ( )
    local target
    for i, player in ipairs ( getElementsByType("player") ) do
        target = getPedTarget ( player )
			if ( target ) then
				if target == pennerped then
					setPedAnimation(bikeshopped, "shop", "SHP_HandsUp_Scr")
					setTimer(handb,500,1,bikeshopped)
					outputChatBox ( ""..getPlayerName(player)..": Gib mir dein Geld!", player, 255, 255, 255 )
					outputChatBox ( "Das ist alles was ich habe!", player, 0, 0, 125 )
					setTimer(robpenner_func,4000,1,player)
				end
			end
    end
end
setTimer ( playerTargetCheckPenner, 1000, 0 )



function robpenner_func ( player, pennerped )
		local amount = math.random ( 1, 200 )
		local money = laGetElementData ( player, "money")
		laSetElementData ( player, "money", money + amount )
		outputChatBox ( "Du hast "..amount.."$ erhalten!", player, 0, 0, 125 )
		local msg = "Ein Penner wurde überfallen!"
		sendMSGForFaction ( msg, 1, 100, 100, 255 )
		sendMSGForFaction ( msg, 6, 100, 100, 255 )
		sendMSGForFaction ( msg, 8, 100, 100, 255 )
		destroyElement ( pennerped )
			if laGetElementData ( player, "wanteds" ) >= 5 then
				laSetElementData ( player, "wanteds", 6 )
			else
				laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 1 )
			end
			setPlayerWantedLevel ( target, laGetElementData ( target, "wanteds" ) )
end
addEventHandler ( "robpenner", getRootElement(), robpenner_func )