------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function onstartup ()
   gate = createObject ( 975, 1438.1025390625, -2879.2116699219, 2.5887410640717, 0, 0, 180)
end
addEventHandler ( "onResourceStart", getRootElement(), onstartup )
 
function move ()
  moveObject ( gate, 2200, 1429.4974365234, -2879.0065917969, 2.5750021934509)
end
addCommandHandler("auf", move)

function move ()
  moveObject ( gate, 2450, 1438.1025390625, -2879.2116699219, 2.5887410640717)
end
addCommandHandler("zu", move)

local drinkBlip = 49
createBlip ( 1439, -2874, 3, drinkBlip, 2, 255, 0, 0, 255, 0, 200, getRootElement() )