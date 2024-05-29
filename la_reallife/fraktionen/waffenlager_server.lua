------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

camorrax, camorray, camorraz = -1660.809, 1302.036, 8.074
comptonx, comptony, comptonz = -2173.488, 40.7537, 35.32
surenosx, surenosy, surenosz = -2191.176, 1016.52, 79.85
wattsx, wattsy, wattsz = -2498.270, -129.03, 24.474
yakuzax, yakuzay, yakuzaz = -2211.1455078125, 565.84979248047, 49.442939758301







function gunbuy_func ( player, itemtype, item,  w0, w1, w2, w3, w4, w5, w6, w7 )
if isEvil ( player ) then
	if isCamorra ( player ) then
		fraktion = "Camorra"
	elseif isYakuza ( player ) then
		fraktion = "Yakuza"	
	elseif isSurenos ( player ) then
		fraktion = "Surenos"
	end
	
	Fraktionskasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE '"..fraktion.."'"))
	Schlagringe = tonumber(MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE '" ..fraktion.."'"))
	Baseballschlaeger = tonumber(MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE '" ..fraktion.."'"))
	Messer = tonumber(MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE '" ..fraktion.."'"))
	Schaufeln = tonumber(MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE '" ..fraktion.."'"))
	Pistolen = tonumber(MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE '" ..fraktion.."'"))
	SDPistolen = tonumber(MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE '" ..fraktion.."'"))
	istolenMagazine = tonumber(MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE '" ..fraktion.."'"))
	DesertEagles = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE '" ..fraktion.."'"))
	DesertEagleMunition = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE '" ..fraktion.."'"))
	Schrotflinten = tonumber(MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE '" ..fraktion.."'"))
	SchrotflintenMunition = tonumber(MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE '" ..fraktion.."'"))
	MP = tonumber(MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE '" ..fraktion.."'"))
	MPMunition = tonumber(MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE '" ..fraktion.."'"))
	AK = tonumber(MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE '" ..fraktion.."'"))
	AKMunition = tonumber(MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE '" ..fraktion.."'"))
	M = tonumber(MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE '" ..fraktion.."'"))
	MMunition = tonumber(MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE '" ..fraktion.."'"))
	Gewehre = tonumber(MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE '" ..fraktion.."'"))
	GewehrPatronen = tonumber(MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE '" ..fraktion.."'"))
	SGewehr = tonumber(MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE '" ..fraktion.."'"))
	SGewehrMunition = tonumber(MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE '" ..fraktion.."'"))
	Raketenwerfer = tonumber(MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE '" ..fraktion.."'"))
	Raketen = tonumber(MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE '" ..fraktion.."'"))
	Spezwaffen = tonumber(MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE '" ..fraktion.."'"))
	
		if player == client then
			local success = 0
			if itemtype == "armor" then
				if laGetElementData ( player, "money" ) >= armor_price then
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - armor_price )
					takePlayerMoney ( player, armor_price )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					setPedArmor ( player, 100 )
					triggerClientEvent ( player, "sec_armor_give", getRootElement(), 100 )
					local success = 1
					local Famkasseneu = Fraktionskasse + armor_price
					MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\n Eine Schutzweste kostet "..armor_price.." $!", 5000, 125, 0, 0 )
				end
			elseif itemtype == "ammo" then
				if item == "9mmammo" then
					if laGetElementData ( player, "money" ) >= pistolammo_price then
						if tonumber(PistolenMagazine) >= 1 then
							if w2 == 22 or w2 == 23 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - pistolammo_price )
								takePlayerMoney ( player, pistolammo_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, w2, 17, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), w2, 17 )
								success = 1
								MySQL_SetString("fraktionswaffen", "PistolenMagazine", PistolenMagazine-1, "Fraktion LIKE '"..fraktion.."'")
								PistolenMagazine = PistolenMagazine-1
								local Famkasseneu = Fraktionskasse + pistolammo_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Pistole!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Magazine mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..pistolammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "eagleammo" then
					if laGetElementData ( player, "money" ) >= eagleammo_price then
						if tonumber(DesertEagleMunition) >= 1 then
							if w2 == 24 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - eagleammo_price )
								takePlayerMoney ( player, eagleammo_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, w2, 7, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), w2, 7 )
								success = 1
								MySQL_SetString("fraktionswaffen", "DesertEagleMunition", DesertEagleMunition-1, "Fraktion LIKE '"..fraktion.."'")
								DesertEagleMunition = DesertEagleMunition-1
								local Famkasseneu = Fraktionskasse + eagleammo_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Desert Eagle!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Magazine mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..eagleammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "mp5ammo" then
					if laGetElementData ( player, "money" ) >= mpammo_price then
						if tonumber(MPMunition) >= 1 then
							if w4 == 29 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mpammo_price )
								takePlayerMoney ( player, mpammo_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, w4, 30, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), w4, 30 )
								success = 1
								MySQL_SetString("fraktionswaffen", "MPMunition", MPMunition-1, "Fraktion LIKE '"..fraktion.."'")
								MPMunition = MPMunition-1
								local Famkasseneu = Fraktionskasse + mpammo_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine MP5!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Magazine mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..mpammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "schrot" then
					if laGetElementData ( player, "money" ) >= shotgunammo_price then
						if tonumber(SchrotflintenMunition) >= 1 then
							if w3 == 25 or w3 == 26 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shotgunammo_price )
								takePlayerMoney ( player, shotgunammo_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, w3, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), w3, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "SchrotflintenMunition", SchrotflintenMunition-1, "Fraktion LIKE '"..fraktion.."'")
								SchrotflintenMunition = SchrotflintenMunition-1
								local Famkasseneu = Fraktionskasse + shotgunammo_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Schrotflinte!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Patronen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..shotgunammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "ak47ammo" then
					if laGetElementData ( player, "money" ) >= akammo_price then
						if laGetElementData ( player, "rang" ) >= 1 then
							if tonumber(AKMunition) >= 1 then
								if w5 == 30 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - akammo_price )
									takePlayerMoney ( player, akammo_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, w5, 30, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), w5, 30 )
									success = 1
									MySQL_SetString("fraktionswaffen", "AKMunition", AKMunition-1, "Fraktion LIKE '"..fraktion.."'")
									AKMunition = AKMunition-1
									local Famkasseneu = Fraktionskasse + akammo_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine AK-47!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Magazine mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst Rang 1 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..akammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "m4ammo" then
					if laGetElementData ( player, "money" ) >= mammo_price then
						if laGetElementData ( player, "rang" ) >= 2 then
							if tonumber(MMunition) >= 1 then
								if w5 == 31 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mammo_price )
									takePlayerMoney ( player, mammo_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, w5, 50, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), w5, 50 )
									success = 1
									MySQL_SetString("fraktionswaffen", "MMunition", MMunition-1, "Fraktion LIKE '"..fraktion.."'")
									MMunition = MMunition-1
									local Famkasseneu = Fraktionskasse + mammo_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine M4!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Magazine mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst Rang 2 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\n Ein Magazin kostet "..mammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "gewehrammo" then
					if laGetElementData ( player, "money" ) >= gewehrammo_price then
						if tonumber(GewehrPatronen) >= 1 then
							if w6 == 33 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - gewehrammo_price )
								takePlayerMoney ( player, gewehrammo_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, w6, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), w6, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "GewehrPatronen", GewehrPatronen-1, "Fraktion LIKE '"..fraktion.."'")
								GewehrPatronen = GewehrPatronen-1
								local Famkasseneu = Fraktionskasse + gewehrammo_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Gewehr!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Patronen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..gewehrammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "sgewehrammo" then
					if laGetElementData ( player, "money" ) >= sgewehrammo_price then
						if laGetElementData ( player, "rang" ) >= 3 then
							if tonumber(SGewehrMunition) >= 1 then
								if w6 == 34 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sgewehrammo_price )
									takePlayerMoney ( player, sgewehrammo_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, w6, 1, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), w6, 1 )
									success = 1
									MySQL_SetString("fraktionswaffen", "SGewehrMunition", SGewehrMunition-1, "Fraktion LIKE '"..fraktion.."'")
									SGewehrMunition = SGewehrMunition-1
									local Famkasseneu = Fraktionskasse + sgewehrammo_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Scharfschützengewehr!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Patronen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 3 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..sgewehrammo_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "rocket" then
					if laGetElementData ( player, "money" ) >= rak_price then
						if laGetElementData ( player, "rang" ) >= 4 then
							if tonumber(Raketen) >= 1 then
								if w7 == 35 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - rak_price )
									takePlayerMoney ( player, rak_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, w7, 1, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), w7, 1 )
									success = 1
									MySQL_SetString("fraktionswaffen", "Raketen", Raketen-1, "Fraktion LIKE '"..fraktion.."'")
									Raketen = Raketen-1
									local Famkasseneu = Fraktionskasse + rak_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Raketenwerfer!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Raketen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 4 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Rakete kostet "..rak_price.." $!", 5000, 125, 0, 0 )
					end
				end
			elseif itemtype == "gun" then
				if item == "baseballbat" then
					if laGetElementData ( player, "money" ) >= baseball_price then
						if tonumber(Baseballschlaeger) >= 1 then
							if w1 ~= 5 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - baseball_price )
								takePlayerMoney ( player, baseball_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 5, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 5, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Baseballschlaeger", Baseballschlaeger-1, "Fraktion LIKE '"..fraktion.."'")
								Baseballschlaeger = Baseballschlaeger-1
								local Famkasseneu = Fraktionskasse + baseball_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Schläger!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Schläger mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Schläger kostet "..baseball_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "schaufel" then
					if laGetElementData ( player, "money" ) >= shovels_price then
						if tonumber(Schaufeln) >= 1 then
							if w1 ~= 6 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shovels_price )
								takePlayerMoney ( player, shovels_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 6, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 6, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Schaufeln", Schaufeln-1, "Fraktion LIKE '"..fraktion.."'")
								Schaufeln = Schaufeln-1
								local Famkasseneu = Fraktionskasse + shovels_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Schaufel!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Schaufeln mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Schaufel kostet "..shovels_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "messer" then
					if laGetElementData ( player, "money" ) >= knife_price then
						if tonumber(Messer) >= 1 then
							if w1 ~= 4 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - knife_price )
								takePlayerMoney ( player, knife_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 4, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 4, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Messer", Messer-1, "Fraktion LIKE '"..fraktion.."'")
								Messer = Messer-1
								local Famkasseneu = Fraktionskasse + knife_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Messer!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Messer mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Messer kostet "..knife_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "schlagring" then
					if laGetElementData ( player, "money" ) >= schlagringe_price then
						if tonumber(Schlagringe) >= 1 then
							if w1 == 0 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - schlagringe_price )
								takePlayerMoney ( player, schlagringe_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 1, 1, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 1, 1 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Schlagringe", Schlagringe-1, "Fraktion LIKE '"..fraktion.."'")
								Schlagringe = Schlagringe-1
								local Famkasseneu = Fraktionskasse + schlagringe_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Schlagring!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Schlagringe mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Schlagring kostet "..schlagringe_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "9mm" then
					if laGetElementData ( player, "money" ) >= pistol_price then
						if tonumber(Pistolen) >= 1 then
							if w2 ~= 22 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - pistol_price )
								takePlayerMoney ( player, pistol_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 22, 17, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 22, 17 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Pistolen", Pistolen-1, "Fraktion LIKE '"..fraktion.."'")
								Pistolen = Pistolen-1
								local Famkasseneu = Fraktionskasse + pistol_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Pistole!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine Pistolen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Pistole kostet "..pistol_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "9mmsd" then
					if laGetElementData ( player, "money" ) >= sdpistol_price then
						if tonumber(SDPistolen) >= 1 then
							if w2 ~= 23 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sdpistol_price )
								takePlayerMoney ( player, sdpistol_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 23, 17, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 23, 17 )
								success = 1
								MySQL_SetString("fraktionswaffen", "SDPistolen", SDPistolen-1, "Fraktion LIKE '"..fraktion.."'")
								SDPistolen = SDPistolen-1
								local Famkasseneu = Fraktionskasse + sdpistol_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine SD-Pistole!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs sind keine SD-Pistolen mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine SD-Pistole kostet "..sdpistol_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "eagle" then
					if laGetElementData ( player, "money" ) >= eagle_price then
						if tonumber(DesertEagles) >= 1 then
							if w2 ~= 24 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - eagle_price )
								takePlayerMoney ( player, eagle_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 24, 7, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 24, 7 )
								success = 1
								MySQL_SetString("fraktionswaffen", "DesertEagles", DesertEagles-1, "Fraktion LIKE '"..fraktion.."'")
								DesertEagles = DesertEagles-1
								local Famkasseneu = Fraktionskasse + eagle_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Desert Eagle!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine Desert Eagle mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Desert Eagle kostet "..eagle_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "mp5" then
					if laGetElementData ( player, "money" ) >= mp_price then
						if tonumber(MP) >= 1 then
							if w4 ~= 29 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mp_price )
								takePlayerMoney ( player, mp_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 29, 30, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 29, 30 )
								success = 1
								MySQL_SetString("fraktionswaffen", "MP", MP-1, "Fraktion LIKE '"..fraktion.."'")
								MP = MP-1
								local Famkasseneu = Fraktionskasse + mp_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine MP5!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine MP5 mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine MP5 kostet "..mp_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "shotty" then
					if laGetElementData ( player, "money" ) >= shotgun_price then
						if tonumber(Schrotflinten) >= 1 then
							if w3 ~= 25 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shotgun_price )
								takePlayerMoney ( player, shotgun_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 25, 5, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 25, 5 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Schrotflinten", Schrotflinten-1, "Fraktion LIKE '"..fraktion.."'")
								Schrotflinten = Schrotflinten-1
								local Famkasseneu = Fraktionskasse + shotgun_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Schrotflinte!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine Schrotflinte mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Schrotflinte kostet "..shotgun_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "ak47" then
					if laGetElementData ( player, "money" ) >= ak_price then
						if tonumber(AK) >= 1 then
							if laGetElementData ( player, "rang" ) >= 1 then
								if w5 ~= 30 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - ak_price )
									takePlayerMoney ( player, ak_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, 30, 30, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), 30, 30 )
									success = 1
									MySQL_SetString("fraktionswaffen", "AK", AK-1, "Fraktion LIKE '"..fraktion.."'")
									AK = AK-1
									local Famkasseneu = Fraktionskasse + ak_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine AK-47!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 1 besitzen!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine AK-47 mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine AK-47 kostet "..ak_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "m4" then
					if laGetElementData ( player, "money" ) >= m_price then
						if laGetElementData ( player, "rang" ) >= 2 then
							if tonumber(M) >= 1 then
								if w5 ~= 30 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - m_price )
									takePlayerMoney ( player, m_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, 31, 50, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), 31, 50 )
									success = 1
									MySQL_SetString("fraktionswaffen", "M", M-1, "Fraktion LIKE '"..fraktion.."'")
									M = M-1
									local Famkasseneu = Fraktionskasse + m_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine M4!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine M4 mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 2 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine M4 kostet "..m_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "gewehr" then
					if laGetElementData ( player, "money" ) >= gewehr_price then
						if tonumber(Gewehre) >= 1 then
							if  w6 ~= 33 then
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - gewehr_price )
								takePlayerMoney ( player, gewehr_price )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
								triggerClientEvent ( player, "hudEinblendenDmg", player, player )
								giveWeapon ( player, 33, 7, true )
								triggerClientEvent ( player, "sec_gun_give", getRootElement(), 33, 7 )
								success = 1
								MySQL_SetString("fraktionswaffen", "Gewehre", Gewehre-1, "Fraktion LIKE '"..fraktion.."'")
								Gewehre = Gewehre-1
								local Famkasseneu = Fraktionskasse + gewehr_price
								MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Gewehr!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist kein Gewehr mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Gewehr kostet "..gewehr_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "sniper" then
					if laGetElementData ( player, "money" ) >= sgewehr_price then
						if laGetElementData ( player, "rang" ) >= 3 then
							if tonumber(SGewehr) >= 1 then
								if w6 ~= 34 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sgewehr_price )
									takePlayerMoney ( player, sgewehr_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, 34, 7, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), 34, 7 )
									success = 1
									MySQL_SetString("fraktionswaffen", "SGewehr", SGewehr-1, "Fraktion LIKE '"..fraktion.."'")
									--SGewehr = SGewehr-1
									local Famkasseneu = Fraktionskasse + sgewehr_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Scharfschützengewehr!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist kein Scharfschützengewehr mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 3 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Scharfschützengewehr kostet "..sgewehr_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "raketenwerfer" then
					if laGetElementData ( player, "money" ) >= rakwerfer_price then
						if laGetElementData ( player, "rang" ) >= 4 then
							if tonumber(Raketenwerfer) >= 1 then
								if w7 ~= 35 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - rakwerfer_price )
									takePlayerMoney ( player, rakwerfer_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									giveWeapon ( player, 35, 1, true )
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), 35, 1 )
									success = 1
									MySQL_SetString("fraktionswaffen", "Raketenwerfer", Raketenwerfer-1, "Fraktion LIKE '"..fraktion.."'")
									--Raketenwerfer = Raketenwerfer-1
									local Famkasseneu = Fraktionskasse + rakwerfer_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Raketenwerfer!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist kein Raketenwerfer mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 4 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Raketenwerfer kostet "..rakwerfer_price.." $!", 5000, 125, 0, 0 )
					end
				end
				if item == "lupara" or item == "katana" or item == "molly" then
					if laGetElementData ( player, "money" ) >= spezgun_price then
						if laGetElementData ( player, "rang" ) >= 5 then
							if tonumber(Spezwaffen) >= 1 then
								if w3 ~= 26 then
									laSetElementData ( player, "money", laGetElementData ( player, "money" ) - spezgun_price )
									takePlayerMoney ( player, spezgun_price )
									triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
									triggerClientEvent ( player, "hudEinblendenDmg", player, player )
									if isCamorra ( player ) then
										giveWeapon ( player, 26, 6, true )
									elseif isYakuza ( player ) then
										giveWeapon ( player, 8, 1, true )
									elseif isSurenos ( player ) then
										giveWeapon ( player, 18, 1, true )
									end
									triggerClientEvent ( player, "sec_gun_give", getRootElement(), 26, 6 )
									success = 1
									MySQL_SetString("fraktionswaffen", "Spezwaffen", Spezwaffen-1, "Fraktion LIKE '"..fraktion.."'")
									--Spezwaffen = Spezwaffen-1
									local Famkasseneu = Fraktionskasse + spezgun_price
									MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Spezialwaffe!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist keine Spezialwaffe mehr auf Lager!\nWarte auf die nächste Lieferung!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens Rang 5 besitzen!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Spezialwaffe kostet "..spezgun_price.." $!", 5000, 125, 0, 0 )
					end
				end
			end
			if success == 1 then 
				playSoundFrontEnd ( player, 40 )
			end
		end
end
end
addEvent ( "gunbuy", true )
addEventHandler ( "gunbuy", getRootElement(), gunbuy_func )

package_price = 800

function equip_func ( player )
local money = laGetElementData ( player, "money" )
if laGetElementData (player, "readyequip") == false then
if money >= package_price then
	local x, y, z = getElementPosition ( player )
	if isCamorra ( player ) and getDistanceBetweenPoints3D ( x, y, z, -1695.496, 1375.092, 7.282352 ) <= 5 then
		laSetElementData ( player, "readyequip", true )
		equipuser_func ( player )
	elseif isCompton ( player ) and getDistanceBetweenPoints3D ( x, y, z, -2445.599609375, -46.69921875, 34.099998474121 ) <= 5 then
		laSetElementData ( player, "readyequip", true )
		equipuser_func ( player )
	elseif isSurenos ( player ) and (getDistanceBetweenPoints3D ( x, y, z, -2177.06, 957.953, 80 ) <= 5) or (getDistanceBetweenPoints3D ( x, y, z,(getDistanceBetweenPoints3D ( x, y, z, -2177.06, 957.953, 80 ) <= 5) ) <= 5) then
		laSetElementData ( player, "readyequip", true )
		equipuser_func ( player )
	elseif isWatts ( player ) and getDistanceBetweenPoints3D ( x, y, z, -2445.9123535156, -83.361068725586, 34.226455688477 ) <= 5 then
		laSetElementData ( player, "readyequip", true )
		equipuser_func ( player )
	elseif isYakuza ( player ) and getDistanceBetweenPoints3D ( x, y, z, -2184.9501953125, 697.5166015625, 53.890625 ) <= 5 then
		laSetElementData ( player, "readyequip", true )
		equipuser_func ( player )
	elseif isTerror ( player ) and getDistanceBetweenPoints3D ( x, y, z, -1998.3441162109, -1537.8443603516, 84.67 ) <= 5 then
		if laGetElementData ( player, "rang" ) >= 2 then
			laSetElementData ( player, "readyequip", true )
			equipuser_func ( player )
		else
			outputChatBox ( "Erst ab Rang 2!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist am falschen Ort oder nicht befugt!", player, 125, 0, 0 )
	end
else
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!\nDie Waffen kosten "..package_price.."$!", 5000, 125, 0, 0 )
end
else
	outputChatBox ( "Du hast dich bereits ausgerüstet!", player, 125, 0, 0 )
end
end
addCommandHandler ( "equip", equip_func )

function equipuser_func ( player )
	if isTerror ( player ) then
		laSetElementData ( player, "hasBomb", true )
		local weapon = 30
		local ammo = 90
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		local weapon = 24
		local ammo = 28
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		local weapon = 39
		local ammo = 1
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		local weapon = 35
		local ammo = 3
		giveWeapon ( player, weapon, ammo, true )
		triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
	else
			local weapon = 30
			local ammo = 200
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		--[[if laGetElementData ( player, "rang" ) == 0 then
			local weapon = 5
			local ammo = 1
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 1 then
			local weapon = 22
			local ammo = 170
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 2 then
			local weapon = 25
			local ammo = 50
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 3 then
			local weapon = 29
			local ammo = 90
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 4 then
			local weapon = 24
			local ammo = 28
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 5 then
			local weapon = 30
			local ammo = 150
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		elseif laGetElementData ( player, "rang" ) == 6 then
			local weapon = 30
			local ammo = 150
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		end]]
	end
	--laSetElementData ( player, "readyequip", false )
	local moneymo = laGetElementData ( player, "money" )
	laSetElementData ( player, "money", moneymo - package_price )
	takePlayerMoney ( player, package_price )
	playSoundFrontEnd ( player, 40 )
	triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )									
	local armor = 100
	setPedArmor ( player, armor )
	triggerClientEvent ( player, "sec_armor_give", getRootElement(), armor )
end
