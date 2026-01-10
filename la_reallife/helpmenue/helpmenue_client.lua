gButtons = {}
gGrid = {}
gThemes = {}

function SubmitHelpMenueAbbrechenBtn ( button )

	guiSetVisible(helpmenue_window,false)
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", lp )
end

function SubmitGridClick( button )

	if button == "left" then
		local row = guiGridListGetItemText ( gGrid["helpmenue"], guiGridListGetSelectedItem ( gGrid["helpmenue"] ), 1 )
		if tostring(row) == "Erste Schritte" then
			guiSetText ( gLabel["helptext"], "Erste Schritte\n\nLebensenergie, Uhr usw. kann durch\ndrücken von \"B\" angezeigt werden\nTipp: Am Geldautomaten Geld abheben\n(s.h. \"Geld\" bzw. \"Clicksystem\")\nDie Fahrschule ( S-Symbol auf der Minimap )\num Scheine zu erwerben\n, Bulldozer-Symbol um dir\neinen Job zu besorgen.\nEin Fahrzeug beim blauen Auto-\nSymbol und Kleidung beim T-Shirt\nSymbol auf der Minimap." ) -- corrected
		elseif tostring(row) == "Serverregeln" then
			guiSetText ( gLabel["helptext"], "Regeln\n\n1. Cheaten, Hacken, Bugusing usw. ist \nverboten\n2. Es ist verboten, auf Spieler zu \"Parken\"\n3. Grundloses töten von Neulingen\nist verboten\n4. Alle Spieler - egal ob Admin oder\nnicht - sind mit Respekt zu behandeln!\n5. Den Anweisungen von Admins ist Folge \nzu leisten\n6. Pro Spieler ist nur ein Account erlaubt,\nAccountsitting o.ä. ist ebenfalls verboten\n7. Beleidigungen, Flüche oder andere Sprachen\nals Deutsch sind im öffentlichen Chat\nnicht erwünscht!\nNicht beachten von einer dieser Regeln\nkann und wird zum Ban führen! " ) -- corrected
		elseif tostring(row) == "Account" then
			guiSetText ( gLabel["helptext"], "Account\n\nIn deinem Account werden alle deine Daten\nwie z.b. Spielerfolge automatisch gespeichert -\ngebe daher NIEMALS dein Passwort an\njemanden weiter.\nFalls du glaubst, jemand kennt dein Passwort,\nmelde dich bitte umgehend bei einem\nder Administratoren.\n\nJeder Spieler ist berechtigt, EINEN Account\nzu besitzen. Sollte ein Spieler\nmehrere besitzen, dann melde\ndies bitte unverzüglich einem\nAdmin." ) -- corrected
		elseif tostring(row) == "Probleme" then
			guiSetText ( gLabel["helptext"], "Probleme\n\nFalls du ein Problem hast\n(z.b. einen Cheater),\ndann kannst du ihn per /report [text]\nan einen der Admins melden.\nFür Fragen bezüglich des Spiels,\nfrage einfach einen deiner Mitspieler." ) -- corrected
		elseif tostring(row) == "Admins" then
			guiSetText ( gLabel["helptext"], "Admins\n\nEs gibt 4 Arten von Administratoren:\n1. Supporter, 2. Moderatoren, \n3. Super-Moderatoren\nund Administratoren.\nDiese unterscheiden sich durch einige Befehle\nbzw. Zugriffsrechte, jedoch sind sie ALLE\nbevollmächtigt, im Rahmen ihrer\nMöglichkeiten zu handeln.\n\nAnfragen wie\n\"Wie verdien ich am meisten Geld?\",\n\"XY greift mich an/hat etwas zerstört\"\nwerden ignoriert.\nMit /kontakt [text] könnt ihr sie\nkontaktieren und mit /admins sehen,\nwer gerade online ist." ) -- corrected
		elseif tostring(row) == "Changelog" then
			guiSetText ( gLabel["helptext"], "Changelog\n\nAktuelle Version: "..curVersion.."" )
		elseif tostring(row) == "Fahrzeuge" then
			guiSetText ( gLabel["helptext"], "Fahrzeuge\n\nDie Fahrzeuge sind bedingt zerstörbar,\nd.h. sie können nur durch sehr starke\nExplosionen usw. beschädigt werden,\nfalls niemand in ihnen sitzt.\nDie Reifen sind dauerhaft zerstörbar,\nWenn jemand als Fahrer im\nFahrzeug ist, lässt es sich durch\nKugeln usw. zerstören.\nDamit dein Fahrzeug fahren kann, benötigt\nes ausserdem Benzin (Tankstelle).\n\nSteuerung:\n\"X\" = Motor anlassen,\n\"L\" = Licht an/ausschalten\n\nFahrzeuge können bei Autohäusern\nfür Geld erworben werden.\nMehr unter /vehhelp" ) -- corrected
		elseif tostring(row) == "Häuser" then
			guiSetText ( gLabel["helptext"], "Häuser\n\nHäuser können mit /buyhouse [bar/bank]\nerworben werden, sofern du über\ngenug Geld/Spielzeit verfügst,\nnirgends eingemietet bist und\nnoch kein Haus hast.\nBefehle:\n/rent, /sellhouse, /setrent, /unrent,\n/hlock (Auf/Zu schliessen)" ) -- corrected
		elseif tostring(row) == "Bonuspunkte" then
			guiSetText ( gLabel["helptext"], "Bonuspunkte\n\nBonuspunkte erhälst du, wenn ein von\ndir geworbener Spieler 10 Stunden spielt,\ndu Achievments erhälst oder Päckchen\nsammelst. Mit diesen kannst du unter \"Optionen\"\nbesondere Boni für Punkte freischalten." )
		elseif tostring(row) == "Geld" then
			guiSetText ( gLabel["helptext"], "Geld\n\nGeld ist auf dem Server nötig, um\nAutos, neue Skins usw. zu kaufen,\ndurch Arbeit, Zinsen und von\nanderen Spielern kann es erhalten werden.\nAn Geldautomaten kann der Kontostand\neingesehen werden, Geld ab/eingezahlt\nwerden oder überwiesen werden,\nin dem du AlT-GR drückst und\neinen Geldautomaten anklickst." ) -- corrected
		elseif tostring(row) == "Waffen" then
			guiSetText ( gLabel["helptext"], "Waffen\n\nUm Waffen erwerben zu können,\nbenötigst du einen Waffenschein.\nDiesen erhälst du wie alle\nScheine in der Stadthalle.\nPolizisten werden dir - falls\ndu mehrfach wegen Waffengebrauchs\nauffällst - diesen wieder entziehen.\nAusserdem ist es möglich, Waffen in\nWaffenkisten zu speichern - bei jedem\nWaffenhändler steht je eine - klicke\nsie einfach an!" ) -- corrected
		elseif tostring(row) == "Gangs" then
			if tonumber(getElementData ( lp, "fraktion" )) == 2 then
				guiSetText ( gLabel["helptext"], "Gangs (Camorra)\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ndeine Aufgabe als Mafioso ist es, deine Gang\nmit Waffen zu versorgen und ihr zu dienen.\nWaffen erhältlich in Los Santos, näheres\nim Forum.\nBefehle: /t, /invite, /giverank, /uninvite\n/fskin /mv /fstate\n/tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 3 then
				guiSetText ( gLabel["helptext"], "Gangs (Yakuza)\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ndeine Aufgabe als Triade ist es, deine Gang\nmit Waffen zu versorgen und ihr zu dienen.\nWaffen erhältlich in Los Santos, näheres\nim Forum.\nBefehle: /gate, /t, /invite, /giverank, /uninvite\n/fskin /fstate /gate\n/tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 4 then
				guiSetText ( gLabel["helptext"], "Terroristen\n\nErklärung nötig?\n\nBefehle:\n/equip, /arm /tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 5 then
				guiSetText ( gLabel["helptext"], "Liberty Tree Redaktion\n\nAls Reporter ist es deine\nAufgabe, über aktuelle Geschehnisse\nzu berrichten.\nBefehle: /lift /mv /news /live\n/edit" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 7 then
				guiSetText ( gLabel["helptext"], "Gangs (Surenos)\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ndeine Aufgabe als Mitglied ist es, deine Gang\nmit Waffen zu versorgen und ihr zu dienen.\nWaffen erhältlich in Los Santos, näheres\nim Forum.\nBefehle: /gate, /t, /invite, /giverank, /uninvite\n/fskin /fstate\n/tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 9 then
				guiSetText ( gLabel["helptext"], "Gangs (Compton Families)\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ndeine Aufgabe als Mitglied ist es, deine Gang\nmit Waffen zu versorgen und ihr zu dienen.\nWaffen erhältlich in Los Santos, näheres\nim Forum.\nBefehle: /mv, /t, /invite, /giverank, /uninvite\n/fskin /fstate\n/tie" )
				elseif tonumber(getElementData ( lp, "fraktion" )) == 10 then
				guiSetText ( gLabel["helptext"], "Gangs (Watts Soldiers)\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ndeine Aufgabe als Mitglied ist es, deine Gang\nmit Waffen zu versorgen und ihr zu dienen.\nWaffen erhältlich in Los Santos, näheres\nim Forum.\nBefehle: /mv, /t, /invite, /giverank, /uninvite\n/fskin /fstate\n/tie" )
			else
				guiSetText ( gLabel["helptext"], "Gangs\n\nDie Gangs kontrollieren den Drogen\n- und Waffenhandel in San Fierro,\ngehe ihnen am Anfang aus dem Weg -\noder freunde dich mit ihnen an." )
			end
		elseif tostring(row) == "Scheine" then
			guiSetText ( gLabel["helptext"], "Scheine\n\nUm Fahrzeuge benutzen zu können,\nbenötigst du einen jeweiligen Schein\n- Ebenso zum Angeln/Waffenerwerb.\nDiese erhälst du bei der Fahrschule,\nwelche als weisses S\nauf deinem Radar dargestellt ist." ) -- corrected
		elseif tostring(row) == "Ganggebiete" then
			guiSetText ( gLabel["helptext"], "Ganggebiete\n\nDie einzelnen Ganggebiete generieren -\nje nach Art - Geld, Drogen und\nMaterials. Die einzelnen Gangs können\ngegnerische Ganggebiete auch erobern,\nmehr dazu im Forum!" )
		elseif tostring(row) == "Polizei" then
			local faction = tonumber(getElementData ( lp, "fraktion" ))
			if faction == 1 or faction == 6  or faction == 8 then
				if faction == 6 then
					guiSetText ( gLabel["helptext"], "Federal Bureau of Investigation\n\nDeine Aufgabe als Agent ist es,\nVerbrecher zu fassen.\nUm den Polizeicomputer zu verwenden,\ndrücke die Spez. Missionen-Taste\nin einem SFPD/FBI Fahrzeug oder\nklicke einen Computer an.\n\nBefehle:\n/tazer (Hotkey: 1)\n/(c)arrest [Name] [Zeit] [Geldstrafe] [Kaution]\n/takeweapons [Name] - Entwaffnen\n/cuff [Name]\n/takeillegal [Name] /frisk [Name]\n/duty /swat /offduty\n/t /g /mv /wanze\n/barricade /ram" )
				elseif faction == 8 then
					guiSetText ( gLabel["helptext"], "Army\n\nDeine Aufgabe als Soldat ist es,\nVerbrecher zu fassen.\nUm den Polizeicomputer zu verwenden,\ndrücke die Spez. Missionen-Taste\nin einem Army Fahrzeug oder\nklicke einen Computer an.\n\nBefehle:\n/mv /class /permission\n/arrest /carrest /airstrike\n/spawnchange /barricade\n/sandbag /explosive" )
				else
					guiSetText ( gLabel["helptext"], "San Fierro Police Department\n\nDeine Aufgabe als Polizist ist es,\nfür Ordnung auf der Strasse zu sorgen.\nUm den Polizeicomputer zu verwenden,\ndrücke die Spez. Missionen-Taste\nin einem Polizeifahrzeug oder\nklicke einen Computer an.\n\nBefehle:\n/tazer (Hotkey: 1)\n/(c)arrest [Name] [Zeit] [Geldstrafe] [Kaution]\n/takeweapons [Name] - Entwaffnen\n/cuff [Name]\n/takeillegal [Name] /frisk [Name]\n/duty /swat /offduty\n/t /g /mv /barricade\n/ticket /fstate /fdraw" )
				end
			else
				guiSetText ( gLabel["helptext"], "Polizei\n\nDie Aufgabe der Polizei ist es,\nfür Ordnung auf der Strasse zu sorgen.\n\nFalls du ein Verbrechen begehst,\nwerden sie dich von weiteren Straftaten\nabhalten - notfalls mit Gewalt!\n\nHotline bei Verbrechen: 911" )
			end
		elseif tostring(row) == "Clicksystem" then
			guiSetText ( gLabel["helptext"], "Clicksystem\n\nBei LA-Reallife gibt es zwei verschiedene\nArten, mit Objekten und Spielern\nzu interagieren.\nZum einen die klassischen Befehle,\nzum anderen ist es möglich,\nbestimmte Objekte nach drücken\nder Alt-Gr-Taste anzuklicken und zu\ninteragieren." ) -- corrected
		elseif tostring(row) == "Job" then
			if getElementData ( lp, "job" ) == "fischer" then
				guiSetText ( gLabel["helptext"], "Job - Fischer\n\nDu bist im Moment Fischer - das heisst, du\nkannst Geld dadurch verdienen, indem du mit den\nFischerbooten, die durch ein Ankersymbol auf der\nKarte vermerkt sind, Checkpoints abfährst.\nJe mehr Fische gefangen werden, desto geringer ist der\nPreis, der für weitere Fische gezahlt wird -\mjedoch steigt dieser pro Stunde wieder an.\nTippe /quitjob, um zu kündigen!" )
			elseif getElementData ( lp, "job" ) == "taxifahrer" then
				guiSetText ( gLabel["helptext"], "Job - Taxifahrer\n\nDu bist im Moment Taxifahrer - das heisst, du\nkannst Geld dadurch verdienen, indem du mit dem\nTexi ( erhältlich am $-Symbol auf der Karte )\nLeute von Ort zu Ort transportierst.\nDazu drücke die Spezialmissionen-Taste und\ndein Taxischild leutet auf. Nun zahlt dir jeder,\nder in dein Taxi steigt pro Zeit Geld.\nTippe /quitjob, um zu kündigen!" )
			elseif getElementData ( lp, "job" ) == "dealer" then
				guiSetText ( gLabel["helptext"], "Job - Dealer\n\nDu bist im Moment Dealer - das heisst, du\nkannst Geld dadurch verdienen, indem du Drogen\nan deine Mitspieler verkaufst ( /givedrugs oder\nim Klicksystem unter \"Geben\" ). Neue\n\"Ware\" bekomsmt du, in dem du entweder\nfür Geld auf der Farm (Gelbe Figur auf der Minimap)\nStoff kaufst oder aber Minimissionen\nmachst ( Lila Figur auf der Minimap ).\nTippe /quitjob, um zu kündigen!" )
			elseif getElementData ( lp, "job" ) == "mechaniker" then
				guiSetText ( gLabel["helptext"], "Job - Mechaniker\n\nDu bist im Moment Mechaniker, d.h. du\nbist in der Lage, mit /repair [Name] [Preis]\nFahrzeuge deiner Mitspieler gegen Geld zu\nreparieren. Ausserdem kannst du Fahrzeuge von\nanderen Spielern Nitro einbauen - tippe\ndazu /tunen [Name] [Preis]" )
			elseif getElementData ( lp, "job" ) == "wdealer" then
				guiSetText ( gLabel["helptext"], "Job - Waffendealer\n\nDu bist im Moment Waffendealer, d.h. du\nbist in der Lage, dir alle 10 Minuten\nneue Materialien mit /buymats beim Jobicon\nzu kaufen. Wenn du genug Materialien hast,\nkannst du mit /gunhelp eine Liste\nvon mgl. Waffen anzeigen, die du\ndann mit /sellgun [Name]\n[Gegenstand] verkaufen kannst." )
			elseif getElementData ( lp, "job" ) == "trucker" then
				guiSetText ( gLabel["helptext"], "Job - Trucker\n\nDu bist im Moment Trucker, d.h. du\nkannst dir einen Truck gegen Vorschuss bei\ndem Truck-Icon mieten, und zu den ange-\ngebenen Koordinaten bringen - dort erhälst\ndu dann dein Geld. Besser bezahlte\nAufträge kannst du mit höherem Trucker-\nLevel ausführen (steigt bei erfolgreichen\nTransporten), jedoch nimmt der Schwierigkeitsgrad\nzu." )
			elseif getElementData ( lp, "job" ) == "pizzaboy" then
				guiSetText ( gLabel["helptext"], "Job - Pizzabote\n\nDu bist im Moment Waffendealer, d.h. du\nbist in der Lage, dir alle 10 Minuten\nneue Materialien mit /buymats beim Jobicon\nzu kaufen. Wenn du genug Materialien hast,\nkannst du mit /gunhelp eine Liste\nvon mgl. Waffen anzeigen, die du\ndann mit /sellgun [Name]\n[Gegenstand] verkaufen kannst." )
			elseif getElementData ( lp, "job" ) == "airport" then
				guiSetText ( gLabel["helptext"], "Job - Flughafenmitarbeiter\n\nDu arbeitest im Moment am Flughafen\nvon San Fierro.\nJe höher dein Flughafen-Level ist,\ndesto besser bezahlt kannst du arbeiten\n- vom Kofferpacker bis zum Jet-Pilot!\nUm einen Auftrag anzuhnemen, gehe\nin das \"i\"-Symchols unerhalb des Terminals\nbeim Eingang des Parkhauses, um\nAufträge anzunehmen." )
			elseif getElementData ( lp, "job" ) == "hitman" then
				guiSetText ( gLabel["helptext"], "Job - Hitman\n\nDu arbeitest im Moment als Profikiller -\nBefehle:\n/contract [Name] [Summe], /contracts,\n/arm" )
			elseif getElementData ( lp, "job" ) == "hotdog" then
				guiSetText ( gLabel["helptext"], "Job - Hotdogverkäufer\n\nDu arbeitest im Moment als Hotdog-\nverkäufer. Begib dich zum Besteck-Symbol,\nschnapp dir einen Hotdogwagen, belade ihn\nund klicken auf einen Spieler,\nwährend du im Truck sitzt und wähle \"geben\"\n->\"job\".\n\nBefehle: /sellhotdog [Preis] [Name]" )
			elseif getElementData ( lp, "job" ) == "streetclean" then
				guiSetText ( gLabel["helptext"], "Job - Strassenreinigung\n\nDu arbeitest im Moment als\nStrassenreiniger; Begib dich zum\nSchrottplatz am Fuße des Mt. Chilliard,\num mit der Arbeit zu beginnen. " )
			elseif getElementData ( lp, "job" ) == "farmer" then
				guiSetText ( gLabel["helptext"], "Job - Farmer\n\nDu arbeitest im Moment als\nFarmer; Begib dich zur\nFarm an der Grenze von SF\nund LV nahe der Fleischberg-\nFabrik für mehr Infos." )
			else
				guiSetText ( gLabel["helptext"], "Jobs\n\nBei LA-Reallife verschiedene Arten, an Geld\nzu kommen. Am Anfang ist es am besten, sich\neinen Job zu suchen. Dazu trete im\nJobcenter in den entsprechenden Kegel-\nnun hast du eine Markierung auf dem Radar,\nwo sich der Arbeitgeber befindet.\n\nInfo: Tippe /job, wenn du sie\nlöschen willst!" )
			end
		elseif tostring(row) == "Karte" then
			guiSetText ( gLabel["helptext"], "Karte\n\nDurch Drücken der \"F11\"-Taste kannst du\nDie Landkarte öffnen.\nFolgende Symbole werden benutzt:\n\nGelber Punkt = Stadthalle\nBlaue Figur = \"Fun Sports\"\nAutosymbol = Autohaus\nAnker = Bayside Boats\nSirene = San Fierro Police Department\nSprühdose = Pay'n Spray ( Autolackierung )\nT-Shirt = Zip ( Kleidungsladen )\nPizzastück = Well Stacked Pizza\nRotes S = 24-7\nHerz = Stripclub\nTT = \"The Truth is out there!\"\nFlugzeug = Flugzeugverkauf\nTürkiser Totenkopf = Mistys Bar\nBurger = Burgershot\n\nAlle weiteren: Jobbedingt" )
		elseif tostring(row) == "Daten" then
			guiSetText ( gLabel["helptext"], "Daten\n\nServeradresse:\n"..serverip.."\n\nTeamspeak 3:\n"..tsip.."\n\nForum:\n"..forumURL )
		elseif tostring(row) == "Befehle" then
			guiSetText ( gLabel["helptext"], "Befehle\n\n/admins /report /save\n/self\n/in /out (Häuser) /sellhouse /setrent\n/rentroom /spawnchange\n/eject\n/pm [Name] [Text], auch für offline Spieler!\n/l und /s zum schreien/flüstern." )
		elseif tostring(row) == "Hunger" then
			guiSetText ( gLabel["helptext"], "Auf diesem Server musst du\nregelmässig essen, um nicht zu\nverhungern. Drücke \"B\",um deinen aktuellen\nHunger anzuzeigen ( grüne Leiste ).\nSinkt sie unter 25%, so fängst du an,\nEnergie zu verlieren. Essen kannst\ndu an Restaurants, an\nAutomaten oder auch bei Hot-\ndogverkäufern." )
		end
	end
end

function ShowHelpmenueGui_func()
	_CreateHelpmenueGui()
end
addEvent ( "ShowHelpmenueGui", true)
addEventHandler ( "ShowHelpmenueGui", getRootElement(), ShowHelpmenueGui_func)

function _CreateHelpmenueGui()

if getElementData ( lp, "sprache" ) == "Deutsch" then
	if helpmenue_window then
		guiSetVisible ( helpmenue_window, true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		helpmenue_window = guiCreateWindow(screenwidth/2-503/2, screenheight/2-389/2,503,389,"Hilfemenü",false)
		guiSetAlpha(helpmenue_window,1)
		gGrid["helpmenue"] = guiCreateGridList(0.0378,0.0925,0.3837,0.8586,true,helpmenue_window)
		guiGridListSetSelectionMode(gGrid["helpmenue"],2)
		
		gGrid["helpcolumn"] = guiGridListAddColumn(gGrid["helpmenue"],"Hilfemenü",1)
		
		gThemes["firststeps"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["rules"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["account"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["problems"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["admins"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["changelog"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["hunger"] = guiGridListAddRow(gGrid["helpmenue"])		
		gThemes["fahrzeuge"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["houses"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["punkte"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["geld"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["waffen"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["gangs"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["ganggs"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["scheine"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["polizei"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["clicksystem"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["job"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["karte"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["daten"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["commands"] = guiGridListAddRow(gGrid["helpmenue"])		

		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["firststeps"], gGrid["helpcolumn"], "Erste Schritte", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["rules"], gGrid["helpcolumn"], "Serverregeln", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["account"], gGrid["helpcolumn"], "Account", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["problems"], gGrid["helpcolumn"], "Probleme", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["admins"], gGrid["helpcolumn"], "Admins", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["changelog"], gGrid["helpcolumn"], "Changelog", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["hunger"], gGrid["helpcolumn"], "Hunger", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["fahrzeuge"], gGrid["helpcolumn"], "Fahrzeuge", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["houses"], gGrid["helpcolumn"], "Häuser", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["punkte"], gGrid["helpcolumn"], "Bonuspunkte", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["geld"], gGrid["helpcolumn"], "Geld", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["waffen"], gGrid["helpcolumn"], "Waffen", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["gangs"], gGrid["helpcolumn"], "Gangs", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["ganggs"], gGrid["helpcolumn"], "Ganggebiete", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["scheine"], gGrid["helpcolumn"], "Scheine", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["polizei"], gGrid["helpcolumn"], "Polizei", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["clicksystem"], gGrid["helpcolumn"], "Clicksystem", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["job"], gGrid["helpcolumn"], "Job", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["karte"], gGrid["helpcolumn"], "Karte", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["daten"], gGrid["helpcolumn"], "Daten", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["commands"], gGrid["helpcolumn"], "Befehle", false, false )
		
		addEventHandler("onClientGUIClick", gGrid["helpmenue"], SubmitGridClick, true)
		
		guiSetAlpha(gGrid["helpmenue"],1)
		gLabel["helptext"] = guiCreateLabel(0.4533,0.0951,0.5149,0.73,"Herzlich Wilkommen im Hilfemenü!\n\n\nUm es später erneut aufzurufen, drücke\ndie F1-Taste.\n\nHier findest du Informationen\nzu allem was du wissen musst,\neinen Changelog für Updates,\neine Liste mit Regeln und Admins\nsowie zahlreiche Tipps.\n\nBei weiteren Fragen wende dich bitte mit\n/kontakt [Frage] direkt an einen\nder Admins/Moderatoren",true,helpmenue_window) -- max. 19 Zeilen, ca. 45 Zeichen pro Zeile
		guiSetAlpha(gLabel["helptext"],1)
		guiLabelSetColor(gLabel["helptext"],255,255,0)
		guiLabelSetVerticalAlign(gLabel["helptext"],"top")
		guiLabelSetHorizontalAlign(gLabel["helptext"],"left",false)
		
		gButtons["abbrechenhelp"] = guiCreateButton(0.5964,0.8406,0.2167,0.108,"Abbrechen",true,helpmenue_window)
		guiSetAlpha(gButtons["abbrechenhelp"],1)
		addEventHandler("onClientGUIClick", gButtons["abbrechenhelp"], SubmitHelpMenueAbbrechenBtn, false)

		guiWindowSetSizable(helpmenue_window,false)
		guiWindowSetMovable(helpmenue_window,false)
		
		guiSetFont ( gLabel["helptext"], "default-bold-small" )
	end
else
	_CreateHelpmenueGui_English()
end
end























function SubmitHelpMenueAbbrechenBtn_English ( button )

	guiSetVisible(helpmenue_window_English,false)
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", lp )
end

function SubmitGridClick_English( button )

	if button == "left" then
		local row = guiGridListGetItemText ( gGrid["helpmenue"], guiGridListGetSelectedItem ( gGrid["helpmenue"] ), 1 )
		if tostring(row) == "Getting Started" then
			guiSetText ( gLabel["helptext"], "Getting Started \n\nLifeenergy, Clock, etc. can to show with Key B \nTip: At ATMs to withdraw money \ (see here \n money \" or \ Click System \") In the\ntown hall (yellow dot on the\nminimap) acquire license \n as well as identity card or you \n get does his job. \nThe blue car at the card and verification\nprocedures for the T-shirt dress \n verification procedures on the minimap. ") -- corrected
		elseif tostring(row) == "Serverrules" then
			guiSetText ( gLabel["helptext"], "Rules \n\n1. Cheating, hacking, etc. Exploits \nforbidden \n2. It is forbidden to \npark on players \n3. Lot of reason to kill newbies \nis forbidden \n4. All players - regardless of whether or Admin \nthat - should be treated with respect, \n5. The commands off the admins \nmust be respected and followed \n6. Only one account per player is allowed. \nAccountsitting etc. is also forbidden \n7. Insults, curses and other languages ​​\nAs German and English are not allowed in the\n public chat. \nNot comply with the rules will be \npunished with a bann. " ) -- corrected
		elseif tostring(row) == "Account" then
			guiSetText ( gLabel["helptext"], "Account \n\nIn your account, all data is stored \n for example Playtime, Money, etc. - \nDo not give anyone your password. \nIf you think someone knows your password, \nreport it to an Administrator. \nEvery player is entitled to have ONE account. \nShould have a player an multiple Account,\nthen please report this an Admin." ) -- corrected
		elseif tostring(row) == "Problems" then
			guiSetText ( gLabel["helptext"], "Problems \n\nIf you have a problem \n (For Example: Bug etc.), \n Then send us an Report via: \n/contact [text]." ) -- corrected
		elseif tostring(row) == "Admins" then
			guiSetText ( gLabel["helptext"], "Admins \n\nThere are 4 types of Admins: \n1. Supporters. \n2. Moderators. \n3. Super-Moderators. \n4. Administrators. \nThey differ in their access \nRights.  But ALL have the abilty \nto act in Emergency. \nFirst of all kinds is to \n show respect.  " ) -- corrected
		elseif tostring(row) == "Changelog" then
			guiSetText ( gLabel["helptext"], "Changelog \n\nCurrent Version: "..curVersion.."" )
		elseif tostring(row) == "Vehicles" then
			guiSetText ( gLabel["helptext"], "Vehicles \n\nWhen you have buy a Car and \n you must park it on \n a Carpark. \nVehicles can exploded.\nBut not when you´re offline. \nYou can Tune your Car \nin a Tuning-Shop (Transfender). \nYou can also sell you car. \n Use: /sellcar.\n With /givecar [Player Name] [Your Slot] \n[Player Slot] can you give your car an other\nplayer!" ) -- corrected
		elseif tostring(row) == "Houses" then
			guiSetText ( gLabel["helptext"], "Houses \n\nYou can buy a house that is not \n yet sold. \n Or you rent a room in a House \n from a other player. \n With F2 can you open your Housemenu. \nWith your Housemenu you can: \n Eat, Sleep an heal yourself. \n And all you can still store weapons. " ) -- corrected
		elseif tostring(row) == "Bonuspoints" then
			guiSetText ( gLabel["helptext"], "Bonuspoints \n\nOn this Server they are \n Bonuspoints. With this Points \nYou can buy Special Skills \n(For Example: Weapon and Fighting Styles). \nBut first you have to find the \nPoints." )
		elseif tostring(row) == "Money" then
			guiSetText ( gLabel["helptext"], "Money \n\nMoney is the most important on \nthe Server. \nWith Money you can buy: \nCars, Bills, Weapons, Food and more. \nYou can Deposit oder withdraw your\nMoney on ATMs" ) -- corrected
		elseif tostring(row) == "Weapons" then
			guiSetText ( gLabel["helptext"], "Weapons \n\nWeapons you can buy at Ammu-Nation. \nThere are different types of Weapons. \n (For Example: Assault Rifles, Hand-Guns, etc. \nBut for every Weapon you need \na gun permit. \nIn case of misuse your gun license \nthe police can take it off again." ) -- corrected
		elseif tostring(row) == "Gangs" then
			if tonumber(getElementData ( lp, "fraktion" )) == 2 then
				guiSetText ( gLabel["helptext"], "Gangs (Camorra) \n\nThe gangs control the drug \nand arms trafficking in San Fierro, \nyour role as a mobster is your response \nto supply weapons and to serve it. \nweapons available in Los Santos, details \nForum \ncommands:. / t, / invite, / giverank, / uninvite \n / fskin / mv / fstate / tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 3 then
				guiSetText ( gLabel["helptext"], "Gangs (Yakuza) \n\nThe gangs control the drug \nand arms trafficking in San Fierro, \nyour role as a Yakuzi is your response \nto supply weapons and to serve it. \nweapons available in Los Santos, details \nForum \ncommands:. / t, / invite, / giverank, / uninvite \n / fskin / mv / fstate / tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 4 then
				guiSetText ( gLabel["helptext"], "Terrorists\n\nExplanation necessary?\n\nCommands:\n/equip, /arm /tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 5 then
				guiSetText ( gLabel["helptext"], "Liberty Tree Redaction \n\nAs a reporter it is your \ntask n on current events \ say \ncommands:. / Lift / mv / news / live \n  / edit" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 7 then
				guiSetText ( gLabel["helptext"], "Gangs (Surenos) \n\nThe gangs control the drug \nand arms trafficking in San Fierro, \nyour role as a Sureno is your response \nto supply weapons and to serve it. \nweapons available in Los Santos, details \nForum \ncommands:. / t, / invite, / giverank, / uninvite \n / fskin / mv / fState \n / tie" )
			elseif tonumber(getElementData ( lp, "fraktion" )) == 9 then
				guiSetText ( gLabel["helptext"], "Gangs (Compton Families) \n\nThe gangs control the drug \nand arms trafficking in San Fierro, \nyour role as a Compton is your response \nto supply weapons and to serve it. \nweapons available in Los Santos, details \nForum \ncommands:. / t, / invite, / giverank, / uninvite \n / fskin / mv / fstate / tie" )
				elseif tonumber(getElementData ( lp, "fraktion" )) == 10 then
				guiSetText ( gLabel["helptext"], "Gangs (Watts-Soldiers) \n\nThe gangs control the drug \nand arms trafficking in San Fierro, \nyour role as a Soldier is your response \nto supply weapons and to serve it. \nweapons available in Los Santos, details \nForum \ncommands:. / t, / invite, / giverank, / uninvite \n / fskin / mv / fstate / tie" )
			else
				guiSetText ( gLabel["helptext"], "Gangs \n\n The gangs control the drug \nand arms trafficking in San Fierro, \nthem go at the beginning of the path - \nor you friends with them." )
			end
		elseif tostring(row) == "Notes" then
			guiSetText ( gLabel["helptext"], "Notes \n\nFor every job you need Notes. You can\nbuy it on townhall (Yellow Dot on Map) \n There are different types of Notes \n For Example: Drivinglicense, Gunlicense etc." ) -- corrected
		elseif tostring(row) == "Gangareas" then
			guiSetText ( gLabel["helptext"], "There are different Gangareas on the Server \n In a Gangarea two gangs are fighting \n for the Gangarea. \n\n More Infos at Forum: www.la-rl.com" )
		elseif tostring(row) == "Police" then
			local faction = tonumber(getElementData ( lp, "fraktion" ))
			if faction == 1 or faction == 6  or faction == 8 then
				if faction == 6 then
					guiSetText ( gLabel["helptext"], "Federal Bureau of Investigation \n\nYour job as an agent is to take \ncriminals. \n To use the police computer, \npress the Specific emissions key 2 \nin a FBI vehicle or click on a\ncomputer. \n\ncommands: \n / tazer (hot key: 1)  \n / (c)arrest [name] \n / take weapons [name] \nDisarm - cuff [name] \n /takeillegal [name] \n/ frisk [name] \n / duty / swat / offduty \n / t / g / mv /barricade \n / ticket / fstate / fdraw" )
				elseif faction == 8 then
					guiSetText ( gLabel["helptext"], "Army \n\nYour job as a soldier is to put \ncriminals. \n To use the police computer, \npress the Specific emissions key 2 \nin a army vehicle or click on a\ncomputer. \n\ncommands: \n / tazer (hot key: 1)  \n / (c)arrest [name] \n / take weapons [name] \nDisarm - cuff [name] \n /takeillegal [name] \n/ frisk [name] \n / duty / swat / offduty \n / t / g / mv /barricade \n / ticket / fstate / fdraw" )
				else
					guiSetText ( gLabel["helptext"], "San Fierro Police Department \n\nYour job as a police officer there, \nto keep order on the streets. \n To use the police computer, \npress the Specific emissions key 2 \nin a police vehicle or click on a\ncomputer. \n\ncommands: \n / tazer (hot key: 1)  \n / (c)arrest [name] \n / take weapons [name] \nDisarm - cuff [name] \n /takeillegal [name] \n/ frisk [name] \n / duty / swat / offduty \n / t / g / mv /barricade \n / ticket / fstate / fdraw" )
				end
			else
				guiSetText ( gLabel["helptext"], "Police \n\nThe job of the police is to \nto keep order on the road \n\nIf you commit a crime, \nthey will stop you from further crimes \n- if necessary by force \n\nCrimes hotline at: 911" )
			end
		elseif tostring(row) == "Clicksystem" then
			guiSetText ( gLabel["helptext"], "Click System \n\nIn LA Reallife, there are two different \nways nobjects and players interact. \nFirst, the classical orders, \nthe other hand, it is possible \ncertain objects by pressing \nto click the Alt+Gr key and \n interact." ) -- corrected
		elseif tostring(row) == "Job" then
			if getElementData ( lp, "job" ) == "fischer" then
				guiSetText ( gLabel["helptext"], "Job - Fisherman \n\nYou´re currently Fisherman. \n To perform the Job get thee \n to the Anchor Icon on the map. \n You can catch Fish by driving trough the red marker. \nThe more fish you catch, \nthe more money earn Beac. \nPick up and unload your money, \nyou can if you go into the Green Marker. \n\n Have Fun in German Los Angeles Reallife" )
			elseif getElementData ( lp, "job" ) == "taxifahrer" then
				guiSetText ( gLabel["helptext"], "Jobs - Taxi-Driver \n\n You are currently taxi driver - in other words, you \ncan earn money by using you transport to the \ntaxi (available at the $ symbol on the map) \npeople from place to place. \nTo start the Job, Press the Special Mission Key. \nand your taxi sign light up. Now you will pay each \nquitjob rises in your taxi money per time. \n Type /quitjob to give him notice! " )
			elseif getElementData ( lp, "job" ) == "dealer" then
				guiSetText ( gLabel["helptext"], "Job - Dealer \n\n You are currently Dealer - that is, you \ncan thus earn money by you drugs \n sell to other players (/ give drugs or \nthe click system under \  Write ). New \n commodity \" will get you into the nyou either \n is buying money on the farm (yellow figure on the minimap) \nmaterial or doing mini missions \n(purple figure on the minimap). \n NM / quitjob to give him notice!" )
			elseif getElementData ( lp, "job" ) == "mechaniker" then
				guiSetText ( gLabel["helptext"], "Jobs - Mechanic \n\nYou are currently mechanics, You can \nare repair a vehicle \n with / repair [Name] [Price]. You can tune a vehicle (Nitro)\n - to tune type: / tune [Name] [Price]" )
			elseif getElementData ( lp, "job" ) == "wdealer" then
				guiSetText ( gLabel["helptext"], "Job - Weaponsdealer \n\nYou are at the moment Weapondealer, You can buy new materials \n every 10 Minutes, to buy it, goto \n the Weapon Icon command: / buymats \n. If you have enough materials, \nyou can use / gunhelp a list \nmgl. Show weapons you \nthen / sellgun [name] \n[object] can sell. " )
			elseif getElementData ( lp, "job" ) == "trucker" then
				guiSetText ( gLabel["helptext"], "Job - Trucker \n\nYou are currently a Trucker, \n You have to bring supplies from place to place \n Of lighter-goods to High-Explosive \n everything is possible. \n The job is to get \n behind de Railway Station." )
			elseif getElementData ( lp, "job" ) == "airport" then
				guiSetText ( gLabel["helptext"], "Job - Airportworkers \n\n You are currently Airportworkers \nFrom San Fierro Airport \nThe higher your airport level is \nmore better paid you can \n work nthe case packer to jet pilot \nto get the Job, go to the Plane Icon on the Map \n Then go to to the i and accept the Job." )
			elseif getElementData ( lp, "job" ) == "hitman" then
				guiSetText ( gLabel["helptext"], "Job - Hitman \n\n You are working at the moment as a professional killer - \ncommands: \n / contract [name] [amount] / contracts, \n / arm" )
			elseif getElementData ( lp, "job" ) == "hotdog" then
				guiSetText ( gLabel["helptext"], "Job - Hotdogverkäufer \n\n You work at the moment as a hot dog \n ellers. Embark on cutlery icon \ngrab a Hotdogwagen him laden \nand click on a player \nwhile sitting in the truck and select \ type \" \n-> \ job \". \n \ncommands: / sellhotdog [Price] [Name] " )
			elseif getElementData ( lp, "job" ) == "streetclean" then
				guiSetText ( gLabel["helptext"], "Job - n Streetcleaning \n\n You work at the moment as \nstreet cleaner, you begin to Embark on \nscrap yard at the foot of Mt Chilliard, \nto working." )
			elseif getElementData ( lp, "job" ) == "farmer" then
				guiSetText ( gLabel["helptext"], "Job - Farmer \n\nYou currently working as a \nFarmer; you to Embark \nFarm on the border of SF \n and LV near the mountain of flesh-\nfactory for more information." )
			else
				guiSetText ( gLabel["helptext"], "Jobs \n\nIn LA Reallife, there are different types\nof money to come.\nIn the beginning it is best to \nfor a job search. To step into the \nCity Hall in the corresponding cone \nnow you have a marker on the radar, \nwhich is the employer \n\nInfo:.\n To accept Job: /job in a Job Icon \n /quitjob to terminate the Job." )
			end
		elseif tostring(row) == "Map" then
			guiSetText ( gLabel["helptext"], "Map \n\nPress the \n F11  button you can \nOpen the map \nThe following symbols are used. \n\nYellow dot = City Hall \nBlue figure = Fun Sports \nCar icon = Carhouse \nanchor = Bayside Boats \nsiren = San Fierro Police Department \nspray = Pay'n spray (car paint) \nT-shirt = zip (clothing store) \nslice of pizza = Well Stacked Pizza \nRed S = Noobspawn \nheart = Strip Club \nTT = TT Mission.  \nAir = Aircraft sales \nTurquoise skull = Misty's Bar \nBurger = Burger Shot \n\n  Depens from the job all other. \n\n Have Fun on German Los Angeles Rellife." )
		elseif tostring(row) == "Data" then
			guiSetText ( gLabel["helptext"], "Data\n\nServerIP:\n"..serverip.."\n\nTeamspeak 3:\n"..tsip.."\n\nForum:\n"..forumURL )
		elseif tostring(row) == "Commands" then
			guiSetText ( gLabel["helptext"], "Commands\n\n/admins /report /save\n/self\n/in /out (Houses) /sellhouse /setrent\n/rentroom /spawnchange\n/eject\n/l und /s to shout/whisper." )
		elseif tostring(row) == "Needs" then
			guiSetText ( gLabel["helptext"], "Needs \n\n On this Server you must: \n Urinate, eat and Sleep. \n Eat: When you push B can you see the \n Hungry, Urinate and Sleep HUD. \n You can Eat in Wellstacked Pizza. \n For sleep and urinate use /sleep and /piss. \n\n Have fun in German Los Angeles Reallife" )
		end
	end
end


function _CreateHelpmenueGui_English()

	if helpmenue_window_English then
		guiSetVisible ( helpmenue_window_English, true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		helpmenue_window_English = guiCreateWindow(screenwidth/2-503/2, screenheight/2-389/2,503,389,"Helpmenu",false)
		guiSetAlpha(helpmenue_window_English,1)
		gGrid["helpmenue"] = guiCreateGridList(0.0378,0.0925,0.3837,0.8586,true,helpmenue_window_English)
		guiGridListSetSelectionMode(gGrid["helpmenue"],2)
		
		gGrid["helpcolumn"] = guiGridListAddColumn(gGrid["helpmenue"],"Helpmenu",1)
		
		gThemes["firststeps"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["rules"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["account"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["problems"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["admins"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["changelog"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["hunger"] = guiGridListAddRow(gGrid["helpmenue"])		
		gThemes["fahrzeuge"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["houses"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["punkte"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["geld"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["waffen"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["gangs"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["ganggs"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["scheine"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["polizei"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["clicksystem"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["job"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["karte"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["daten"] = guiGridListAddRow(gGrid["helpmenue"])
		gThemes["commands"] = guiGridListAddRow(gGrid["helpmenue"])		

		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["firststeps"], gGrid["helpcolumn"], "Getting Started", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["rules"], gGrid["helpcolumn"], "Serverrules", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["account"], gGrid["helpcolumn"], "Account", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["problems"], gGrid["helpcolumn"], "Problems", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["admins"], gGrid["helpcolumn"], "Admins", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["changelog"], gGrid["helpcolumn"], "Changelog", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["hunger"], gGrid["helpcolumn"], "Needs", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["fahrzeuge"], gGrid["helpcolumn"], "Vehicles", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["houses"], gGrid["helpcolumn"], "Houses", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["punkte"], gGrid["helpcolumn"], "Bonuspoints", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["geld"], gGrid["helpcolumn"], "Money", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["waffen"], gGrid["helpcolumn"], "Weapons", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["gangs"], gGrid["helpcolumn"], "Gangs", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["ganggs"], gGrid["helpcolumn"], "Gangareas", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["scheine"], gGrid["helpcolumn"], "Notes", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["polizei"], gGrid["helpcolumn"], "Police", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["clicksystem"], gGrid["helpcolumn"], "Clicksystem", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["job"], gGrid["helpcolumn"], "Job", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["karte"], gGrid["helpcolumn"], "Map", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["daten"], gGrid["helpcolumn"], "Data", false, false )
		guiGridListSetItemText ( gGrid["helpmenue"], gThemes["commands"], gGrid["helpcolumn"], "Commands", false, false )
		
		
		addEventHandler("onClientGUIClick", gGrid["helpmenue"], SubmitGridClick_English, true)
		
		guiSetAlpha(gGrid["helpmenue"],1)
		gLabel["helptext"] = guiCreateLabel(0.4533,0.0951,0.5149,0.73,"Helpmenu \n\nWelcome to the Helpmenu. \nCall for it again later to be \nto be able to Use F1 Key. \nHere you will find a lots \nof Information! \n(For Example:Fractions, Adminranks, Jobhelp, Rules etc. \nIf you have any questions \nUse /contact [TEXT] to direct contact with \n Admins/Moderators to take. \n\nHave Fun on Los Angeles Reallife",true,helpmenue_window_English) -- max. 19 Zeilen, ca. 45 Zeichen pro Zeile
		guiSetAlpha(gLabel["helptext"],1)
		guiLabelSetColor(gLabel["helptext"],255,255,0)
		guiLabelSetVerticalAlign(gLabel["helptext"],"top")
		guiLabelSetHorizontalAlign(gLabel["helptext"],"left",false)
		
		gButtons["abbrechenhelp"] = guiCreateButton(0.5964,0.8406,0.2167,0.108,"Abort",true,helpmenue_window_English)
		guiSetAlpha(gButtons["abbrechenhelp"],1)
		addEventHandler("onClientGUIClick", gButtons["abbrechenhelp"], SubmitHelpMenueAbbrechenBtn_English, false)

		guiWindowSetSizable(helpmenue_window_English,false)
		guiWindowSetMovable(helpmenue_window_English,false)
		
		guiSetFont ( gLabel["helptext"], "default-bold-small" )
	end
end