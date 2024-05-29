------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function kautionRaus ( thePlayer )
	setElementInterior( thePlayer, 0, 2289.52734375, 2423.654296875, 10.8203125 )
	outputChatBox( "Du hast Kaution bezahlt und bist frei!", thePlayer, 0, 255, 0 )
end

function anwaltSuchen ( source )
local playeraccount = getPlayerAccount ( source )
local jailtime = tonumber ( getAccountData ( playeraccount, "jailtime" ) )
	if ( jailtime > 0 ) then
		for id, thePlayer in ipairs( getElementsByType ( "player" ) ) do
			local anwaltaccount = getPlayerAccount ( thePlayer )
			if ( isGuestAccount ( anwaltaccount ) == false ) then
				if ( getAccountData ( anwaltaccount, "job" ) == 5 ) then
					outputChatBox ( getPlayerName ( source ) .. " ist im Gefängnis und sucht einen Anwalt!", thePlayer )
				end
			end
		end
		outputChatBox ( "Alle verfügbaren Anwälte wurden informiert!", source )
	else
		outputChatBox ( "Du bist nicht im Gefängnis", source )
	end
end
addCommandHandler ( "anwalt", anwaltSuchen )

function anwaltAngebot ( player, command, target )
	if laGetElementData ( player, "job" ) == "anwalt" then
		if ( target ) then
			local targetplayer = getPlayerFromName ( target )
			if ( targetplayer ) then
				local targetaccount = getPlayerAccount ( targetplayer )
				if ( targetaccount ) and ( isGuestAccount ( targetaccount ) == false ) then
					local jailtime = tonumber ( getAccountData ( targetaccount, "jailtime" ) )
					if ( jailtime > 0 ) then
						theKaution = jailtime * 1200
						theAnteil = theKaution / 2
						setElementData ( targetplayer, "kauAnwalt", getPlayerName ( anwalt ) )
						setElementData ( targetplayer, "kauSumme", theKaution )
						outputChatBox ( "Du hast " .. target .. " angeboten, ihn für " .. tostring ( theKaution ) .. " $ zu befreien!", anwalt )
						outputChatBox ( "Deine Gewinnsumme würde " .. tostring ( theAnteil ) .. " betragen!", anwalt )
						outputChatBox ( getPlayerName ( anwalt ) .. " hat dir eine Kaution in Höhe von " .. theKaution .. " angeboten!", targetplayer )
						outputChatBox ( "Tippe /acceptkaution um dies zu akzeptieren!", targetplayer )
					else
						outputChatBox ( "Der Spieler ist nicht im Gefängnis!", anwalt )
					end
				else
					outputChatBox ( "Der Spieler ist nicht eingeloggt!", anwalt )
				end
			else
				outputChatBox ( "Es ist kein Spieler mit diesem Namen online!", anwalt )
			end
		else
			outputChatBox ( "Der Syntax lautet: /kaution <Spieler>!", anwalt )
		end
	end
end
addCommandHandler ( "kaution", anwaltAngebot )

function kautionZahlen ( thePlayer )
local spieleraccount = getPlayerAccount ( thePlayer )
	if laGetElementData ( theplayer, "jailtime" ) > 0 then
		if ( getElementData ( thePlayer, "kauAnwalt" ) ~= false ) and ( getElementData ( thePlayer, "kauSumme" ) ~= false ) then
			theAnwalt = getPlayerFromName ( getElementData ( thePlayer, "kauAnwalt" ) )
			if ( theAnwalt ) then
				local theSumme = getElementData ( thePlayer, "kauSumme" )
				if ( getPlayerMoney ( thePlayer ) >= theSumme ) then
					takePlayerMoney ( thePlayer, theSumme )
					givePlayerMoney ( theAnwalt, theSumme / 2 )
					kautionRaus ( thePlayer )
					setAccountData ( spieleraccount, "jailtime", 0 )
				else
					outputChatBox ( "Du hast nicht genug Geld!", thePlayer )
				end
			else
				outputChatBox ( "Dein Anwalt ist nichtmehr online!", thePlayer )
			end
		end
	end
end
addCommandHandler ( "acceptkaution", kautionZahlen )