------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function los (player)

if laGetElementData ( player, "adminlvl" ) >= 4 then

  outputChatBox (" Die gezogenen Zahlen sind: " ..math.random(1,12).. ", "..math.random(1,12)..", "..math.random(1,12)..", " ..math.random(1,12)..", "..math.random(1,12)..", " ..math.random(1,12).. "!", getRootElement(), 255, 125, 20 )
  outputLottoLog ( getPlayerName ( player ).." hat die Lottozahlen gezogen!" )
end

end

addCommandHandler("lottozahlen",los)

