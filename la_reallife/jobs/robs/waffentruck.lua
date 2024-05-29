local robfaction
function giveTruck_func ( schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akammo, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun )
	
	local schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akammo, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun = math.abs(schlagringe), math.abs(baseball), math.abs(knife), math.abs(shovels), math.abs(pistol), math.abs(sdpistol), math.abs(pistolammo), math.abs(eagle), math.abs(eagleammo), math.abs(shotgun), math.abs(shotgunammo), math.abs(mp), math.abs(mpammo), math.abs(ak), math.abs(akammo), math.abs(mammo), math.abs(gewehr), math.abs(gewehrammo), math.abs(sgewehr), math.abs(sgewehrammo), math.abs(rakwerfer), math.abs(rak), math.abs(spezgun)
	local preis = math.abs(schlagringe)*schlagringe_price + math.abs(baseball)*baseball_price + math.abs(knife)*knife_price + math.abs(shovels)*shovels_price + math.abs(pistol)*pistol_price + math.abs(sdpistol)*sdpistol_price + math.abs(pistolammo)*pistolammo_price + math.abs(eagle)*eagle_price + math.abs(eagleammo)*eagleammo_price + math.abs(shotgun)*shotgun_price + math.abs(shotgunammo)*shotgunammo_price + mp*mp_price + mpammo*mpammo_price + ak*ak_price + akammo*akammo_price + mammo*mammo_price + gewehr*gewehr_price + gewehrammo*gewehrammo_price + sgewehr*sgewehr_price + sgewehrammo*sgewehrammo_price + math.abs(rakwerfer)*rakwerfer_price + math.abs(rak)*rak_price + math.abs(spezgun)*spezgun_price
	if preis then
		if preis > 300 and preis < 10000 then
			if laGetElementData ( source, "money" ) >= preis then
				if mafiatransport == nil then mafiatransport = 0 end
				if mafiatransport == 1 then
				outputChatBox ( "Es ist bereits ein Waffentruck unterwegs!", source, 175, 0, 0 )
				else
					if math.floor(math.abs(schlagringe))==schlagringe and math.floor(math.abs( baseball ) ) == baseball and math.floor(math.abs( knife ) ) == knife and math.floor(math.abs( shovels ) ) == shovels and math.floor(math.abs( pistol ) ) == pistol and math.floor(math.abs( sdpistol ) ) == sdpistol and math.floor(math.abs( pistolammo ) ) == pistolammo and math.floor(math.abs( eagle ) ) == eagle and math.floor(math.abs( eagleammo ) ) == eagleammo and math.floor(math.abs( shotgun ) ) == shotgun and math.floor(math.abs( shotgunammo ) ) == shotgunammo and math.floor(math.abs( mp ) ) == mp and math.floor(math.abs( mpammo ) ) == mpammo and math.floor(math.abs( ak ) ) == ak and math.floor(math.abs( akammo ) ) == akammo and math.floor(math.abs( mammo ) ) == mammo and math.floor(math.abs( gewehr ) ) == gewehr and math.floor(math.abs( gewehrammo ) ) == gewehrammo and math.floor(math.abs( sgewehr ) ) == sgewehr and math.floor(math.abs( sgewehrammo ) ) == sgewehrammo and math.floor(math.abs( rakwerfer ) ) == rakwerfer and math.floor(math.abs( rak ) ) == rak and math.floor(math.abs( spezgun ) ) == spezgun then
						if isCamorra ( player ) then
							fraktion = "Camorra"
						elseif isYakuza ( player ) then
							fraktion = "Yakuza"	
						elseif isSurenos ( player ) then
							fraktion = "Surenos"
						end
							Schlagringe = tonumber(MySQL_GetString("fraktionswaffen", "Schlagringe", "Fraktion LIKE '" ..fraktion.."'"))
							Baseballschlaeger = tonumber(MySQL_GetString("fraktionswaffen", "Baseballschlaeger", "Fraktion LIKE '" ..fraktion.."'"))
							Messer = tonumber(MySQL_GetString("fraktionswaffen", "Messer", "Fraktion LIKE '" ..fraktion.."'"))
							Schaufeln = tonumber(MySQL_GetString("fraktionswaffen", "Schaufeln", "Fraktion LIKE '" ..fraktion.."'"))
							Pistolen = tonumber(MySQL_GetString("fraktionswaffen", "Pistolen", "Fraktion LIKE '" ..fraktion.."'"))
							SDPistolen = tonumber(MySQL_GetString("fraktionswaffen", "SDPistolen", "Fraktion LIKE '" ..fraktion.."'"))
							PistolenMagazine = tonumber(MySQL_GetString("fraktionswaffen", "PistolenMagazine", "Fraktion LIKE '" ..fraktion.."'"))
							DesertEagles = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagles", "Fraktion LIKE '" ..fraktion.."'"))
							DesertEagleMunition = tonumber(MySQL_GetString("fraktionswaffen", "DesertEagleMunition", "Fraktion LIKE '" ..fraktion.."'"))
							Schrotflinten = tonumber(MySQL_GetString("fraktionswaffen", "Schrotflinten", "Fraktion LIKE '" ..fraktion.."'"))
							SchrotflintenMunition = tonumber(MySQL_GetString("fraktionswaffen", "SchrotflintenMunition", "Fraktion LIKE '" ..fraktion.."'"))
							MP = tonumber(MySQL_GetString("fraktionswaffen", "MP", "Fraktion LIKE '" ..fraktion.."'"))
							MPMunition = tonumber(MySQL_GetString("fraktionswaffen", "MPMunition", "Fraktion LIKE '" ..fraktion.."'"))
							AK = tonumber(MySQL_GetString("fraktionswaffen", "AK", "Fraktion LIKE '" ..fraktion.."'"))
							AKMunition = tonumber(MySQL_GetString("fraktionswaffen", "AKMunition", "Fraktion LIKE '" ..fraktion.."'"))
							--M = tonumber(MySQL_GetString("fraktionswaffen", "M", "Fraktion LIKE '" ..fraktion.."'"))
							MMunition = tonumber(MySQL_GetString("fraktionswaffen", "MMunition", "Fraktion LIKE '" ..fraktion.."'"))
							Gewehre = tonumber(MySQL_GetString("fraktionswaffen", "Gewehre", "Fraktion LIKE '" ..fraktion.."'"))
							GewehrPatronen = tonumber(MySQL_GetString("fraktionswaffen", "GewehrPatronen", "Fraktion LIKE '" ..fraktion.."'"))
							SGewehr = tonumber(MySQL_GetString("fraktionswaffen", "SGewehr", "Fraktion LIKE '" ..fraktion.."'"))
							SGewehrMunition = tonumber(MySQL_GetString("fraktionswaffen", "SGewehrMunition", "Fraktion LIKE '" ..fraktion.."'"))
							Raketenwerfer = tonumber(MySQL_GetString("fraktionswaffen", "Raketenwerfer", "Fraktion LIKE '" ..fraktion.."'"))
							Raketen = tonumber(MySQL_GetString("fraktionswaffen", "Raketen", "Fraktion LIKE '" ..fraktion.."'"))
							Spezwaffen = tonumber(MySQL_GetString("fraktionswaffen", "Spezwaffen", "Fraktion LIKE '" ..fraktion.."'"))
							if tonumber(Schlagringe)+math.abs(tonumber(schlagringe)) <= schlagringcap and 
							tonumber(Baseballschlaeger)+math.abs(tonumber(baseball)) <= baseballcap and 
							tonumber(Messer)+math.abs(tonumber(knife)) <= knifecap and 
							tonumber(Schaufeln)+math.abs(tonumber(shovels)) <= shovelscap and 
							tonumber(Pistolen)+math.abs(tonumber(pistol)) <= pistolcap and 
							tonumber(SDPistolen)+math.abs(tonumber(sdpistol)) <= sdpistolcap and 
							tonumber(PistolenMagazine)+math.abs(tonumber(pistolammo)) <= pistolammocap and 
							tonumber(DesertEagles)+math.abs(tonumber(eagle)) <= eaglecap and 
							tonumber(DesertEagleMunition)+math.abs(tonumber(eagleammo)) <= eagleammocap and 
							tonumber(Schrotflinten)+math.abs(tonumber(shotgun)) <= shotguncap and 
							tonumber(SchrotflintenMunition)+math.abs(tonumber(shotgunammo)) <= shotgunammocap and 
							tonumber(MP)+math.abs(tonumber(mp)) <= mpcap and 
							tonumber(MPMunition)+math.abs(tonumber(mpammo)) <= mpammocap and 
							tonumber(AK)+math.abs(tonumber(ak)) <= akcap and 
							tonumber(AKMunition)+math.abs(tonumber(akammo)) <= akammocap and 
							--tonumber(M)+math.abs(tonumber(m)) <= mcap and 
							tonumber(MMunition)+math.abs(tonumber(mammo)) <= mammocap and 
							tonumber(Gewehre)+math.abs(tonumber(gewehr)) <= gewehrcap and 
							tonumber(GewehrPatronen)+math.abs(tonumber(gewehrammo)) <= gewehrammocap and 
							tonumber(SGewehr)+math.abs(tonumber(sgewehr)) <= sgewehrcap and 
							tonumber(SGewehrMunition)+math.abs(tonumber(sgewehrammo)) <= sgewehrammocap and 
							tonumber(Raketenwerfer)+math.abs(tonumber(rakwerfer)) <= raketenwerfercap and 
							tonumber(Raketen)+math.abs(tonumber(rak)) <= raketencap and 
							tonumber(Spezwaffen)+math.abs(tonumber(spezgun)) <= spezguncap then
								loadTruck ( source, schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akammo, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun, preis )
							else
								outputChatBox ( "Das Lager ist zu voll, um deine Lieferung aufzunehmen!", source, 150, 0, 0 )
								outputChatBox ( "Mit /fstate siehst du, was im Lager vorhanden ist.", source, 150, 0, 0 )
							end
					else
						outputChatBox ( "Ungültige Auswahl!", source, 150, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du hast nicht genug Geld!", source, 150, 0, 0 )
			end
		else
			outputChatBox ( "Bitte wähle Waffen zwischen 300 und 10.000$ aus!", source, 150, 0, 0 )
		end
	else
		outputChatBox ( "Ungültige Auswahl!", source, 150, 0, 0 )
	end
end
addEvent ( "giveTruck", true )
addEventHandler ( "giveTruck", getRootElement(), giveTruck_func )

function vehicleEnterMafiaTruck (veh)

local driver = source

	if laGetElementData ( veh, "guntruck" ) == 1 then
		if laGetElementData ( driver, "fraktion" ) == 2 then
			setElementVisibleTo ( CamorraDeliver, driver, true )
			setElementVisibleTo ( CamorraDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 3 then
			setElementVisibleTo ( YakuzaDeliver, driver, true )
			setElementVisibleTo ( YakuzaDeliverBlip, driver, true )
		end
		if laGetElementData ( driver, "fraktion" ) == 7 then
			setElementVisibleTo ( SurenosDeliver, driver, true )
			setElementVisibleTo ( SurenosDeliverBlip, driver, true )
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vehicleEnterMafiaTruck )

function vehicleExitMafiaTruck (veh)

	if laGetElementData ( veh, "guntruck" ) == 1 then
		if laGetElementData ( source, "fraktion" ) == 2 then
			setElementVisibleTo ( CamorraDeliver, source, false )
			setElementVisibleTo ( CamorraDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 3 then
			setElementVisibleTo ( YakuzaDeliver, source, false )
			setElementVisibleTo ( YakuzaDeliverBlip, source, false )
		end
		if laGetElementData ( source, "fraktion" ) == 7 then
			setElementVisibleTo ( SurenosDeliver, source, false )
			setElementVisibleTo ( SurenosDeliverBlip, source, false )
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), vehicleExitMafiaTruck )

function vehicleDestroyedMafiaTruck ()

	if laGetElementData ( source, "guntruck" ) == 1 then
		mafiatransport = 0
		destroyElement ( veh, "guntruck" )
		destroyElement ( source )				
		setElementPosition ( veh, 999999, 999999, -50 )
		local msg = "[WAFFENTRUCK]: Der Waffentruck ist explodiert!"
		sendMSGForFaction ( msg, 1, 0, 150, 0 )
		if robfaction ~= 2 then
			sendMSGForFaction ( msg, 2, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 3, 0, 150, 0 )
		sendMSGForFaction ( msg, 6, 0, 150, 0 )
		if robfaction ~= 7 then
			sendMSGForFaction ( msg, 7, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 8, 0, 150, 0 )
		if robfaction ~= 9 then
			sendMSGForFaction ( msg, 9, 200, 200, 0 )
		end
		if robfaction ~= 10 then
			sendMSGForFaction ( msg, 10, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
		outputLog ( "[WAFFENTRUCK]: Der Waffentruck ist explodiert!", "bad")
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), vehicleDestroyedMafiaTruck )

function loadTruck ( player, schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akammo, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun, preis )

	local msg = "[ILLEGAL]: Ein Waffentruck wurde beladen!"
	local fraktion = laGetElementData (player, "fraktion")
	robfaction = fraktion
	sendMSGForFaction ( msg, 1, 200, 0, 0 )
	if robfaction ~= 2 then
		sendMSGForFaction ( msg, 2, 200, 200, 0 )
	end
	sendMSGForFaction ( msg, 3, 200, 0, 0 )
	sendMSGForFaction ( msg, 6, 200, 0, 0 )
	if robfaction ~= 7 then
		sendMSGForFaction ( msg, 7, 200, 200, 0 )
	end
		sendMSGForFaction ( msg, 8, 200, 0, 0 )
	if robfaction ~= 9 then
		sendMSGForFaction ( msg, 9, 200, 200, 0 )
	end
	if robfaction ~= 10 then
		sendMSGForFaction ( msg, 10, 200, 200, 0 )
	end
	sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
	outputLog ( "[WAFFENTRUCK]: "..getPlayerName(player).." ("..robfaction..") hat einen Waffentruck gestartet!", "bad")
	laSetElementData ( player, "money", laGetElementData ( player, "money" ) - preis )
	takePlayerMoney ( player, preis )
	triggerClientEvent ( player, "SubmitBeladenAbbrechen", getRootElement() )
	triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
	if truckcount == nil then truckcount = 1 else truckcount = truckcount + 1 end
	mafiatransport = 1
	_G["truck"..truckcount] = createVehicle ( 455, 2507.79, -2009.98, 13.3, 0, 0, 90, "GUNS" )
	setVehiclePaintjob ( _G["truck"..truckcount], 2 )
	setVehicleColor ( _G["truck"..truckcount], 40, 1, 0, 0 )
	laSetElementData ( _G["truck"..truckcount], "schlagringe", schlagringe )
	laSetElementData ( _G["truck"..truckcount], "baseball", baseball )
	laSetElementData ( _G["truck"..truckcount], "knife", knife )
	laSetElementData ( _G["truck"..truckcount], "shovels", shovels )
	laSetElementData ( _G["truck"..truckcount], "pistol", pistol )
	laSetElementData ( _G["truck"..truckcount], "sdpistol", sdpistol )
	laSetElementData ( _G["truck"..truckcount], "pistolammo", pistolammo )
	laSetElementData ( _G["truck"..truckcount], "eagle", eagle )
	laSetElementData ( _G["truck"..truckcount], "eagleammo", eagleammo )
	laSetElementData ( _G["truck"..truckcount], "shotgun", shotgun )
	laSetElementData ( _G["truck"..truckcount], "shotgunammo", shotgunammo )
	laSetElementData ( _G["truck"..truckcount], "mp", mp )
	laSetElementData ( _G["truck"..truckcount], "mpammo", mpammo )
	laSetElementData ( _G["truck"..truckcount], "ak", ak )
	laSetElementData ( _G["truck"..truckcount], "akammo", akammo )
	--laSetElementData ( _G["truck"..truckcount], "m", m )
	laSetElementData ( _G["truck"..truckcount], "mammo", mammo )
	laSetElementData ( _G["truck"..truckcount], "gewehr", gewehr )
	laSetElementData ( _G["truck"..truckcount], "gewehrammo", gewehrammo )
	laSetElementData ( _G["truck"..truckcount], "sgewehr", sgewehr )
	laSetElementData ( _G["truck"..truckcount], "sgewehrammo", sgewehrammo )
	laSetElementData ( _G["truck"..truckcount], "rakwerfer", rakwerfer )
	laSetElementData ( _G["truck"..truckcount], "rak", rak )
	laSetElementData ( _G["truck"..truckcount], "spezgun", spezgun )
	laSetElementData ( _G["truck"..truckcount], "guntruck", 1 )
	laSetElementData ( _G["truck"..truckcount], "costs", preis )
	triggerClientEvent ( player,"SubmitBeladenAbbrechen", getRootElement())
	warpPedIntoVehicle ( player, _G["truck"..truckcount] )
	outputChatBox ( "[AUFGABE]: Bringe nun den Truck zurück zur Hauptbasis!", player, 0, 100, 200 )
	setElementHealth ( _G["truck"..truckcount], 1500 )
	laSetElementData ( _G["truck"..truckcount], "illegalcar", 1 )
	if laGetElementData ( player, "fraktion" ) == 2 then
		setElementVisibleTo ( CamorraDeliver, player, true )
		setElementVisibleTo ( CamorraDeliverBlip, player, true )
	elseif laGetElementData ( player, "fraktion" ) == 3 then
		setElementVisibleTo ( YakuzaDeliver, player, true )
		setElementVisibleTo ( YakuzaDeliverBlip, player, true )
	elseif laGetElementData ( player, "fraktion" ) == 7 then
		setElementVisibleTo ( SurenosDeliver, player, true )
		setElementVisibleTo ( SurenosDeliverBlip, player, true )
	end
end