CamorraLager = createObject ( 3577, -1631.1995, 1391.9, 7, 0, 0, 316 )
CamorraCasinoLager = createObject ( 3577, 2170.7622070313, 1611.3020019531, 999.755859375 )
setElementInterior ( CamorraCasinoLager, 1 )
YakuzaLager = createObject ( 3577, -2178.483, 635.241, 49.3 )
YakuzaCasinoLager = createObject ( 3577, 1911.3869628906, 970.30993652344, 10.602819442749, 0, 0, 0 )

ReporterLager = createObject ( 3577, -2090.1000976563, 420.2, 115.699 )
TerrorLager = createObject ( 3577, -1973.3395996094, -1586.1295166016, 87.407867431641 )
SurenosLager = createObject ( 3577, -2224.69921875, 1005.69921875, 83.599998474121, 0, 0, 0 )
ComptonLager = createObject ( 3577, -2452.1967773438, 26.084972381592, 45.461120605469, 0, 0, 0 )
WattsLager = createObject ( 3577, 1127.3000488281, -1164.4000244141, 31.799999237061, 0, 0, 0 )
ComptonLSLager = createObject ( 3577, -2237.5, 16.9, 35.1, 0, 0, 90 )
SurenosLSLager = createObject ( 3577, 2256.3000488281, -1333.4000244141, 23.799999237061, 0, 0, 0 )
YakuzaLSLager = createObject ( 3577, 2768.1000976563, -1605.9000244141, 10.699999809265, 0, 0, 0 )
CamorraLSLager = createObject ( 3577, 701.29998779297, -1448.5, 17.5, 0, 0, 0 )
WattsSFLager = createObject ( 3577, -2449.6000976563, -82.900001525879, 33.700000762939, 0, 0, 0 )

SurenosLVLager = createObject ( 3577,  -776.001, 1566.938, 26.7, 0, 0, 0 )

depots = { [CamorraCasinoLager]=true, [YakuzaCasinoLager]=true, [CamorraLager]=true, [YakuzaLager]=true, [ReporterLager]=true, [TerrorLager]=true, [SurenosLager]=true, [ComptonLager]=true, [WattsLager]=true, [ComptonLSLager]=true, [SurenosLSLager]=true, [YakuzaLSLager]=true, [CamorraLSLager]=true, [WattsSFLager]=true, [SurenosLVLager]=true,   }

function depotLoad ()

	CamorraMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Camorra'") )
	CamorraWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Camorra'") )
	CamorraMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Camorra'") )
	CamorraKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Camorra'") )
	YakuzaMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Yakuza'") )
	YakuzaWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Yakuza'") )
	YakuzaMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Yakuza'") )
	YakuzaKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Yakuza'") )
	TerroristenMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Terroristen'") )
	TerroristenWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Terroristen'") )
	TerroristenMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Terroristen'") )
	TerroristenKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Terroristen'") )
	ReporterMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Reporter'") )
	ReporterWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Reporter'") )
	ReporterMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Reporter'") )
	ReporterKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Reporter'") )
	SurenosMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Surenos'") )
	SurenosWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Surenos'") )
	SurenosMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Surenos'") )
	SurenosKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Surenos'") )
	ComptonMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton'") )
	ComptonWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Compton'") )
	ComptonMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Compton'") )
	ComptonKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Compton'") )
	WattsMoney = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Watts'") )
	WattsWeed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE 'Watts'") )
	WattsMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Watts'") )
	WattsKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE 'Watts'") )
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), depotLoad )

function fDepotServer_func ( player, take, money, weed, mats, koks )
local fraktion
	if player == client then
		if isInDepotFaction ( player ) then
			if isCamorra ( player ) then
				fraktion = "Camorra"
			elseif isYakuza ( player ) then
				fraktion = "Yakuza"
			elseif isTerror ( player ) then
				fraktion = "Terroristen"
			elseif isReporter ( player ) then
				fraktion = "Reporter"				
			elseif isSurenos ( player ) then
				fraktion = "Surenos"
			elseif isCompton ( player ) then
				fraktion = "Compton"
			elseif isWatts ( player ) then
				fraktion = "Watts"
			end
			Fraktionskasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE '"..fraktion.."'"))
			Fraktionsweed = tonumber(MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE '"..fraktion.."'"))
			Fraktionsmats = tonumber(MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE '"..fraktion.."'"))
			Fraktionskoks = tonumber(MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE '"..fraktion.."'"))
			
			if tonumber ( money ) and tonumber ( weed ) and tonumber ( mats ) and tonumber ( koks ) and tonumber ( money ) + tonumber ( weed ) + tonumber ( mats ) + tonumber ( koks ) > 0 then
				local pmoney = tonumber ( laGetElementData ( player, "money" ) )
				local pweed = tonumber ( laGetElementData ( player, "weed" ) )
				local pmats = tonumber ( laGetElementData ( player, "mats" ) )
				local pkoks = tonumber ( laGetElementData ( player, "koks" ) )
				local money = math.floor ( math.abs ( tonumber ( money ) ) )
				local weed = math.floor ( math.abs ( tonumber ( weed ) ) )
				local mats = math.floor ( math.abs ( tonumber ( mats ) ) )
				local koks = math.floor ( math.abs ( tonumber ( koks ) ) )
				if take then
					if money > 0 and tonumber ( laGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst noch kein Geld entnehmen!", player, 125, 0, 0 )
					elseif weed > 0 and tonumber ( laGetElementData ( player, "rang" ) ) < 2 then
						outputChatBox ( "Du darfst noch kein Weed entnehmen!", player, 125, 0, 0 )
					elseif mats > 0 and tonumber ( laGetElementData ( player, "rang" ) ) < 3 then
						outputChatBox ( "Du darfst noch keine Materialien entnehmen!", player, 125, 0, 0 )
					elseif koks > 0 and tonumber ( laGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst noch kein Kokain entnehmen!", player, 125, 0, 0 )
					else
						if Fraktionskasse < money then
							outputChatBox ( "In der Fraktionskasse ist nicht genug Geld!", player, 125, 0, 0 )
						elseif Fraktionsweed < weed then
							outputChatBox ( "In der Fraktionskasse ist nicht genug Weed!", player, 125, 0, 0 )
						elseif Fraktionsmats < mats then
							outputChatBox ( "In der Fraktionskasse sind nicht genug Materialien!", player, 125, 0, 0 )
						elseif Fraktionskoks < koks then
							outputChatBox ( "In der Fraktionskasse ist nicht genug Kokain!", player, 125, 0, 0 )
						else
							local msg = getPlayerName(player).." hat "..money.." $, "..weed.." Gramm Weed, "..mats.." Materialien und "..koks.." Gramm Kokain aus dem Depot genommen."
							sendMSGForFaction ( msg, tonumber(laGetElementData ( player, "fraktion" )), 100, 0, 0 )
							local fraktion = laGetElementData ( player, "fraktion")
							local fraktionsname = fraktionNames[fraktion]
							if (weed + mats + koks) > 1000 then
								outputLog ( "[DEPOT+]: "..msg.." ("..fraktionsname..")", "fraktions" )
							else
								outputLog ( "[DEPOT]: "..msg.." ("..fraktionsname..")", "fraktions" )							
							end
							laSetElementData ( player, "money", pmoney + money )
							givePlayerMoney ( player, money )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							laSetElementData ( player, "weed", pweed + weed )
							laSetElementData ( player, "mats", pmats + mats )
							laSetElementData ( player, "koks", pkoks + koks )
							local Famkasseneu = Fraktionskasse - money
							local Famweedneu = Fraktionsweed - weed
							local Fammatsneu = Fraktionsmats - mats
							local Famkoksneu = Fraktionskoks - koks
							MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotDrogen", Famweedneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE '"..fraktion.."'")
							_G[fraktion.."Money"] = Famkasseneu
							_G[fraktion.."Weed"] = Famweedneu
							_G[fraktion.."Mats"] = Fammatsneu
							_G[fraktion.."Koks"] = Famkoksneu
							triggerClientEvent ( player, "showFDepot", getRootElement(), Famkasseneu, Fammatsneu, Famweedneu, Famkoksneu )
						end
					end
				else
					if money > pmoney then
						outputChatBox ( "Du hast nicht genug Geld dafür!", player, 125, 0, 0 )
					elseif weed > pweed then
						outputChatBox ( "Du hast nicht genug Weed dafür!", player, 125, 0, 0 )
					elseif mats > pmats then
						outputChatBox ( "Du hast nicht genug Materialen dafür!", player, 125, 0, 0 )
					elseif koks > pkoks then
						outputChatBox ( "Du hast nicht genug Kokain dafür!", player, 125, 0, 0 )
					else
						laSetElementData ( player, "money", pmoney - money )
						takePlayerMoney ( player, money )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						laSetElementData ( player, "weed", pweed - weed )
						laSetElementData ( player, "mats", pmats - mats )
						laSetElementData ( player, "koks", pkoks - koks )
							local Famkasseneu = Fraktionskasse + money
							local Famweedneu = Fraktionsweed + weed
							local Fammatsneu = Fraktionsmats + mats
							local Famkoksneu = Fraktionskoks + koks
							MySQL_SetString("fraktionen", "DepotGeld", Famkasseneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotDrogen", Famweedneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE '"..fraktion.."'")
							MySQL_SetString("fraktionen", "DepotKokain", Famkoksneu, "Name LIKE '"..fraktion.."'")
							local msg = getPlayerName(player).." hat "..money.." $, "..weed.." Gramm Weed, "..mats.." Materialien und "..koks.." Gramm Kokain in das Depot gelegt."
							sendMSGForFaction ( msg, tonumber(laGetElementData ( player, "fraktion" )), 0, 100, 0 )
							local fraktion = laGetElementData ( player, "fraktion")
							local fraktionsname = fraktionNames[fraktion]
							if (weed + mats + koks) > 1000 then
								outputLog ( "[DEPOT+]: "..msg.." ("..fraktionsname..")", "fraktions" )
							else
								outputLog ( "[DEPOT]: "..msg.." ("..fraktionsname..")", "fraktions" )							
							end
							_G[fraktion.."Money"] = Famkasseneu
							_G[fraktion.."Weed"] = Famweedneu
							_G[fraktion.."Mats"] = Fammatsneu
							_G[fraktion.."Koks"] = Famkoksneu
						triggerClientEvent ( player, "showFDepot", getRootElement(), Famkasseneu, Fammatsneu, Famweedneu, Famkoksneu )
					end
				end
			else
				outputChatBox ( "Ungültige Eingabe!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist in einer ungültigen Fraktion!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "fDepotServer", true )
addEventHandler ( "fDepotServer", getRootElement(), fDepotServer_func )