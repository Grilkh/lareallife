function showPasswordWindow ()

	if gWindow["passwordChange"] then
		guiSetVisible ( gWindow["passwordChange"], true )
	else

		gWindow["passwordChange"] = guiCreateWindow(screenwidth/2-156/2,120,156,66,"Passwort ändern",false)
		guiSetAlpha(gWindow["passwordChange"],1)
		guiWindowSetMovable(gWindow["passwordChange"],false)
		guiWindowSetSizable(gWindow["passwordChange"],false)
		gButton["PWChangeBtn"] = guiCreateButton(0.5833,0.4091,0.359,0.4545,"Ändern",true,gWindow["passwordChange"])
		guiSetAlpha(gButton["PWChangeBtn"],1)
		gEdit["newPassword"] = guiCreateEdit(0.0577,0.3788,0.4744,0.4545,"",true,gWindow["passwordChange"])
		guiSetAlpha(gEdit["newPassword"],1)
		guiEditSetMasked ( gEdit["newPassword"], true )
		addEventHandler("onClientGUIClick", gButton["PWChangeBtn"],
			function ()
				if guiGetText ( gEdit["newPassword"] ) ~= "" then
					local player = getPlayerName(getLocalPlayer())
					triggerServerEvent ( "passwort", getLocalPlayer(), getLocalPlayer(), player, guiGetText ( gEdit["newPassword"] ) )
					SelfCancelBtn ()
					guiSetVisible ( gWindow["passwordChange"], false )
				end
			end
		)
	end
end

function showChangePasswordWindow ()
	if gWindow["passwordChanging"] then
		guiSetVisible ( gWindow["passwordChanging"], true )
	else
		showCursor(true)
		gWindow["passwordChanging"] = guiCreateWindow(screenwidth/2-498/2,screenheight/2-347/2,498,347,"Passwortänderung",false)
		guiSetAlpha(gWindow["passwordChanging"],1)
		guiWindowSetMovable(gWindow["passwordChanging"],false)
		guiWindowSetSizable(gWindow["passwordChanging"],false)
		gLabel["Info1"] = guiCreateLabel(14,21,470,123,"Aufgrund einiger Sicherheitsmassnahmen bitten wir dich, dein Passwort zu ändern.\nSomit stellen wir sicher, dass niemand im Besitz deines Passworts ist.\n\nAm besten ist es, wenn dein Passwort mindestens 8 Zeichen hat und aus\nBuchstaben & Zahlen besteht. Bitte verwende keine logische Reihenfolge der\nTastatur die leicht zu erraten ist. Das Adminteam kann dein Passwort nicht sehen.\nAuch wurde von Leyynen eine neue, verbesserte Verschlüsselungstaktik entwickelt,\num noch mehr Sicherheit zu gewährleisten.",false,gWindow["passwordChanging"])
		gLabel["Info2"] = guiCreateLabel(13,145,474,49,"Bitte verwende ein Passwort, welches du nirgendwo sonst ausserhalb von LA\nverwendest und gib es niemanden weiter!",false,gWindow["passwordChanging"])
		guiLabelSetColor(gLabel["Info2"],255,0,0)
		gLabel["Info3"] = guiCreateLabel(20,211,96,21,"Neues Passwort:",false,gWindow["passwordChanging"])
		guiSetFont(gLabel["Info3"],"default-bold-small")
		gButton["PWChangeBtn"] = guiCreateButton(16,272,471,61,"Passwort ändern",false,gWindow["passwordChanging"])
		guiSetAlpha(gButton["PWChangeBtn"],1)
		gEdit["newPassword"] = guiCreateEdit(121,202,362,34,"",false,gWindow["passwordChanging"])
		guiSetAlpha(gEdit["newPassword"],1)
		guiEditSetMasked ( gEdit["newPassword"], true )
		gLabel["Info4"] = guiCreateLabel(20,249,461,25,"Das Passwort kannst du unter Optionen im Self-Menü erneut ändern!",false,gWindow["passwordChanging"])
		guiSetFont(gLabel["Info4"],"default-bold-small")
		showCursor(true)
		addEventHandler("onClientGUIClick", gButton["PWChangeBtn"],
			function ()
				if guiGetText ( gEdit["newPassword"] ) ~= "" then
					local player = getPlayerName(getLocalPlayer())
					triggerServerEvent ( "passwortChange", getLocalPlayer(), getLocalPlayer(), player, guiGetText ( gEdit["newPassword"] ) )
					guiSetVisible ( gWindow["passwordChanging"], false )
				end
			end
		)
	end
end
addEvent ( "showChangePasswordWindow", true )
addEventHandler ( "showChangePasswordWindow", getRootElement(), showChangePasswordWindow )
