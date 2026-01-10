------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

sexshopped = createPed(246, -104.77, -8.586, 1000.71875)
setElementInterior (sexshopped, 3)
laSetElementData(sexshopped,"anim", 1)
setPedRotation(sexshopped, 180)
setElementData ( sexshopped, "undeadbarped", true )

donutshopped = createPed(14, 380.783, -188.740, 1000.6328)
setElementInterior (donutshopped, 17)
laSetElementData(donutshopped,"anim", 1)
setPedRotation(donutshopped, 180)
setElementData ( donutshopped, "undeadbarped", true )

bikeshopped = createPed(248, 681.589, -456.08, -25.609)
setElementInterior (bikeshopped, 1)
laSetElementData(bikeshopped,"anim", 1)
setPedRotation(bikeshopped, 0)
setElementData ( bikeshopped, "undeadbarped", true )

outputDebugString("rob_allround: 7... - PED erstellt sex, donuts, bikes")


RobPeds = { [sexshopped]=true, [donutshopped]=true, [bikeshopped]=true }

function playerTargetCheck ( )
    local target
    for i, player in ipairs ( getElementsByType("player") ) do
        target = getPedTarget ( player )
		if ( target ) then
			if RobPeds[target] then
				if isEvil(player) then
					if raubueberfall == 1 then
						outputChatBox ( "Es läuft gerade ein Überfall!", player, 175, 0, 0 )
					else
						if target == sexshopped then
							if xxxtransport == 1 then
								outputChatBox ( "Dieser Shop wurde bereits überfallen!", player, 175, 0, 0 )
							else
								setPedAnimation(sexshopped, "shop", "SHP_HandsUp_Scr")
								setTimer(handb,500,1,sexshopped)
								outputChatBox ( ""..getPlayerName(player).." sagt: Wo ist der Tresorraum?!", player, 255, 255, 255 )
								outputChatBox ( "Angestellte sagt: Ich bringe dich zum Tresorraum, aber lass mich leben!", player, 255, 255, 255 )
								setTimer ( darknessbeginn_func, 2000, 1, player)
								setTimer ( darknessend_func, 5000, 1, player)
								setTimer(robXXX_func,4000,1,player)
								xxxtransport = 1
								raubueberfall = 1
								xxxunterwegs = 1
							end
						elseif target == donutshopped then
							if donuttransport == 1 then
								outputChatBox ( "Dieser Donutladen wurde bereits überfallen!", player, 175, 0, 0 )
							else
								setPedAnimation(donutshopped, "shop", "SHP_HandsUp_Scr")
								setTimer(handb,500,1,donutshopped)
								outputChatBox ( ""..getPlayerName(player).." sagt: Wo sind die Geldreserven?!", player, 255, 255, 255 )
								outputChatBox ( "Donutverkäufer sagt: Ich bringe dich zu den Geldreserven, aber lass mich leben!", player, 255, 255, 255 )
								setTimer ( darknessbeginn_func, 2000, 1, player)
								setTimer ( darknessend_func, 5000, 1, player)
								setTimer(robdonut_func,4000,1,player)
								donuttransport = 1
								raubueberfall = 1
								donutunterwegs = 1
							end
						elseif target == bikeshopped then
							if biketransport == 1 then
								outputChatBox ( "Diese Bar wurde bereits überfallen!", player, 175, 0, 0 )
							else
								setPedAnimation(bikeshopped, "shop", "SHP_HandsUp_Scr")
								setTimer(handb,500,1,bikeshopped)
								outputChatBox ( ""..getPlayerName(player).." sagt: Bring mir dein schönstes Motorrad!!", player, 255, 255, 255 )
								outputChatBox ( "Biker sagt: Ich bringe dich zu meinem Motorrad, aber lass mich leben!", player, 255, 255, 255 )
								setTimer ( darknessbeginn_func, 2000, 1, player)
								setTimer ( darknessend_func, 5000, 1, player)
								setTimer(robbike_func,4000,1,player)
								biketransport = 1
								raubueberfall = 1
								bikeunterwegs = 1
							end
						end
					end
				else
					outputChatBox ( "Du bist nicht in einer bösen Fraktion!", player, 200, 0, 0 )
				end
			end
		end
	end
end
setTimer ( playerTargetCheck, 1000, 0 )


function darknessbeginn_func (player)
fadeCamera ( player, false, 0.5, 0, 0, 0 )
end

function darknessend_func (player)
fadeCamera ( player, true, 0.5, 0, 0, 0 )
outputChatBox ( "Scheisse, die Bullen wurden alamiert! Du musst dich beeilen!", player, 200, 0, 0 )
outputChatBox ( "[AUFGABE]: Bringe nun das Fahrzeug zu dem LKW Zeichen in Las Venturas, um deine Belohnung zu erhalten!", player, 0, 100, 200 )
end

--[[
function robtimer(rob)
	if rob.."transport" == 1 then
		rob.."transport" = 0
		setPedAnimation(rob.."shopped", "dealer", "dealer_deal",-1)
	end
end

function raubueberfalltimer(rob)
	if raubueberfall == 1 then
		raubueberfall = 0
		rob.."unterwegs" = 0
		setElementVisibleTo ( rob.."Deliver", getRootElement(), false )
		setElementVisibleTo ( rob.."DeliverBlip", getRootElement(), false )
		destroyElement( rob.."Deliver" )
		destroyElement( rob.."DeliverBlip ")
	end
end
 ]]
