gButton = {}
gLabel = {}

function SubmitAmmunationGunshopAbbrechenBtn (btn)

	if btn == "left" then
		guiSetVisible ( WaffenauswahlGunshopFenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		setPlayerHudComponentVisible ( "ammo", false )
		setPlayerHudComponentVisible ( "weapon", false )
		setPlayerHudComponentVisible ( "armour", false )
		setPlayerHudComponentVisible ( "money", false )
	end
end
addEvent ( "SubmitAmmunationGunshopAbbrechen", true)
addEventHandler ( "SubmitAmmunationGunshopAbbrechen", getRootElement(), SubmitAmmunationGunshopAbbrechenBtn)

function SubmitAmmunationGunshopBaseballBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "baseballbat", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchaufelBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "schaufel", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopGolfclubBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "golfclub", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMesserBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "messer", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchlagringBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "schlagring", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshop9mmBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "9mm", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshop9mmSDBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "9mmsd", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopDeagleBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "eagle", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMp5Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "mp5", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopShotgunBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "shotty", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopAk47Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "ak47", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopM4Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "m4", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopGewehrBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "gewehr", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSGewehrBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "sniper", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopRaketenwerferBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "raketenwerfer", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopLuparaBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "lupara", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopArmorBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "armor", "armor" )
	end
end

function SubmitAmmunationGunshop9mmAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "9mmammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopEagleAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "eagleammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMp5AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "mp5ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchrotBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "schrot", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopAk47AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "ak47ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopM4AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "m4ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopGewehrAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "gewehrammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSGewehrAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "sgewehrammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopRaketeBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "rocket", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function createAmmunationGunshop_func ()

	showCursor ( true )
	setPlayerHudComponentVisible ( "ammo", true )
	setPlayerHudComponentVisible ( "weapon", true )
	setPlayerHudComponentVisible ( "armour", true )
	setPlayerHudComponentVisible ( "money", true )
	if guiGetVisible ( WaffenauswahlGunshopFenster ) then
		guiSetVisible ( WaffenauswahlGunshopFenster, true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		WaffenauswahlGunshopFenster = guiCreateWindow(screenwidth/2-882/2,screenheight/2-468/2,882,468,"Waffenauswahl",false)
		guiSetAlpha(WaffenauswahlGunshopFenster,1)
		AmmunationText = guiCreateLabel(11,25,863,20,"Herzlich willkommen bei Ammunation! Hier kannst du Waffen für deinen Schutz kaufen. Wichtig ist, dass du den richtigen Waffenschein besitzt.",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(AmmunationText,1)
		guiLabelSetColor(AmmunationText,255,255,255)
		guiLabelSetHorizontalAlign(AmmunationText,"center",false)
		AmmunationText2 = guiCreateLabel(383,313,493,50,"Den richtigen Waffenschein kriegst du im anderen Marker. Du benötigst dafür nur die\nrichtige Anzahl Spielstunden und genügend Geld! Eventuell ist es notwendig, dass\ndu Mitglied einer bösen Fraktion bist! Für mehr Infos besuche das Forum: www.la-rl.com",false,WaffenauswahlGunshopFenster)
		guiLabelSetVerticalAlign(AmmunationText2,"center")
		guiSetFont(AmmunationText2,"default-bold-small")
		gLabel["ammunation_pistolen1"] = guiCreateLabel(11,55,100,57,"Waffenschein A:",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_pistolen1"],1)
		guiLabelSetVerticalAlign(gLabel["ammunation_pistolen1"],"center")
		guiLabelSetHorizontalAlign(gLabel["ammunation_pistolen1"],"center")
		--guiSetFont(gLabel["ammunation_pistolen1"],"sa-header")
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gLabel["ammunation_pistolen2"] = guiCreateLabel(11,123,100,57,"Waffenschein B:",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_pistolen2"],1)
		guiLabelSetVerticalAlign(gLabel["ammunation_pistolen2"],"center")
		guiLabelSetHorizontalAlign(gLabel["ammunation_pistolen2"],"center")
		--guiSetFont(gLabel["ammunation_pistolen2"],"sa-header")
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gLabel["ammunation_pistolen3"] = guiCreateLabel(11,184,100,57,"Waffenschein C:",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_pistolen3"],1)
		guiLabelSetVerticalAlign(gLabel["ammunation_pistolen3"],"center")
		guiLabelSetHorizontalAlign(gLabel["ammunation_pistolen3"],"center")
		--guiSetFont(gLabel["ammunation_pistolen3"],"sa-header")
		end
		gLabel["ammunation_pistolen"] = guiCreateLabel(11,245,75,57,"Munition:",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_pistolen"],1)
		guiLabelSetVerticalAlign(gLabel["ammunation_pistolen"],"center")
		guiLabelSetHorizontalAlign(gLabel["ammunation_pistolen"],"center")
		--guiSetFont(gLabel["ammunation_pistolen"],"sa-header")
		gButton["ammunation_mgunshopcancel"] = guiCreateButton(10,391,863,64,"Ammunation-Waffenladen verlassen",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mgunshopcancel"],1)
		--guiSetFont(gButton["ammunation_mgunshopcancel"],"sa-header")
		gButton["ammunation_baseball"] = guiCreateButton(240,61,100,40,"Baseballschläger ("..baseball_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_baseball"],1)
		gButton["ammunation_shovel"] = guiCreateButton(120,61,100,40,"Schaufel ("..shovels_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_shovel"],1)
		gButton["ammunation_knife"] = guiCreateButton(480,61,100,40,"Messer ("..knife_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_knife"],1)
		gButton["ammunation_schlagring"] = guiCreateButton(360,61,100,40,"Schlagring ("..schlagringe_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_schlagring"],1)
		gButton["ammunation_golfclub"] = guiCreateButton(600,61,100,40,"Golfschläger ("..golfclub_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_golfclub"],1)
		
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_9mm"] = guiCreateButton(120,125,100,40,"9mm ("..pistol_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_9mm"],1)
		end
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_shotgun"] = guiCreateButton(240,125,100,40,"Schrotflinte ("..shotgun_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_shotgun"],1)
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_deagle"] = guiCreateButton(120,188,100,40,"Deagle ("..eagle_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_deagle"],1)
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_mp5"] = guiCreateButton(240,188,100,40,"MP5 ("..mp_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mp5"],1)
		end
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_gewehr"] = guiCreateButton(360,125,100,40,"Gewehr ("..gewehr_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_gewehr"],1)
		end
		--[[if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_ak-47"] = guiCreateButton(120,188,100,40,"AK-47 ("..ak_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_ak-47"],1)
		gButton["ammunation_m4"] = guiCreateButton(360,188,100,40,"M4 ("..m_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_m4"],1)
		end]]--
		gButton["ammunation_armor"] = guiCreateButton(10,305,150,40,"Schutzweste ("..armor_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_armor"],1)
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_9mmammo"] = guiCreateButton(120,250,100,40,"9mm Magazin ("..pistolammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_9mmammo"],1)
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_eagleammo"] = guiCreateButton(197,305,100,40,"Deagle Magazin ("..eagleammo_gunshop_price.."))",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_eagleammo"],1)
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_mp5ammo"] = guiCreateButton(480,250,100,40,"MP5 Magazin ("..mpammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mp5ammo"],1)
		end
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_schrot"] = guiCreateButton(360,250,100,40,"Schrotkugel ("..shotgunammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_schrot"],1)
		end
		if laGetElementData ( lp, "gunlicenseC" ) == 1 then
		gButton["ammunation_ak-47ammo"] = guiCreateButton(600,250,100,40,"AK-47 Magazin ("..akammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_ak-47ammo"],1)
		gButton["ammunation_m4ammo"] = guiCreateButton(720,250,100,40,"M4 Magazin ("..mammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_m4ammo"],1)
		end
		if laGetElementData ( lp, "gunlicenseB" ) == 1 then
		gButton["ammunation_gewehrammo"] = guiCreateButton(240,250,100,40,"Gewehrpatrone ("..gewehrammo_gunshop_price..")",false,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_gewehrammo"],1)
		end
		
		guiWindowSetMovable ( WaffenauswahlGunshopFenster, false )
		guiWindowSetSizable  ( WaffenauswahlGunshopFenster, false )
		
		addEventHandler("onClientGUIClick", gButton["ammunation_mgunshopcancel"], SubmitAmmunationGunshopAbbrechenBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_baseball"], SubmitAmmunationGunshopBaseballBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_shovel"], SubmitAmmunationGunshopSchaufelBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_golfclub"], SubmitAmmunationGunshopGolfclubBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_knife"], SubmitAmmunationGunshopMesserBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_schlagring"], SubmitAmmunationGunshopSchlagringBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mm"], SubmitAmmunationGunshop9mmBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mmSD"], SubmitAmmunationGunshop9mmSDBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_deagle"], SubmitAmmunationGunshopDeagleBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_mp5"], SubmitAmmunationGunshopMp5Btn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_shotgun"], SubmitAmmunationGunshopShotgunBtn, false)
		--addEventHandler("onClientGUIClick", gButton["ammunation_ak-47"], SubmitAmmunationGunshopAk47Btn, false)
		--addEventHandler("onClientGUIClick", gButton["ammunation_m4"], SubmitAmmunationGunshopM4Btn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_gewehr"], SubmitAmmunationGunshopGewehrBtn, false)
		--addEventHandler("onClientGUIClick", gButton["ammunation_sgewehr"], SubmitAmmunationGunshopSGewehrBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_armor"], SubmitAmmunationGunshopArmorBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mmammo"], SubmitAmmunationGunshop9mmAmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_eagleammo"], SubmitAmmunationGunshopEagleAmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_mp5ammo"], SubmitAmmunationGunshopMp5AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_schrot"], SubmitAmmunationGunshopSchrotBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_ak-47ammo"], SubmitAmmunationGunshopAk47AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_m4ammo"], SubmitAmmunationGunshopM4AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_gewehrammo"], SubmitAmmunationGunshopGewehrAmmoBtn, false)
	end
end
addEvent ( "createAmmunationGunshop", true )
addEventHandler ( "createAmmunationGunshop", getRootElement(), createAmmunationGunshop_func )