function spawnchange_func ( player, cmd, place, sType )

	local pname = getPlayerName ( player )
	if place == "house" then
		if laGetElementData ( player, "housekey" ) ~= 0 then
			local dim = tonumber ( math.abs ( laGetElementData ( player, "housekey" ) ) )
			local hint = laGetElementData ( _G["HouseNR"..dim], "curint" )
			local int = tonumber ( gettok ( _G["houseInt"..hint], 1, string.byte('|') ) )
			local intx = tonumber ( gettok ( _G["houseInt"..hint], 2, string.byte('|') ) )
			local inty = tonumber ( gettok ( _G["houseInt"..hint], 3, string.byte('|') ) )
			local intz = tonumber ( gettok ( _G["houseInt"..hint], 4, string.byte('|') ) )
			
			if hint == 0 then
				int = 0
				dim = 0
				intx, inty, intz = getElementPosition ( _G["HouseNR"..hint] )
			end
			
			laSetElementData ( player, "spawndim", dim )
			laSetElementData ( player, "spawnint", int )
			laSetElementData ( player, "spawnpos_x", intx )
			laSetElementData ( player, "spawnpos_y", inty )
			laSetElementData ( player, "spawnpos_z", intz )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
			--OwnFootCheck ( player )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist Obdachlos!", 5000, 0, 125, 0 )
		end
	elseif place == "faction" then
		if laGetElementData ( player, "fraktion" ) > 0 then
			if laGetElementData ( player, "rang" ) >= 5 then
				--OwnFootCheck ( player )
				if laGetElementData ( player, "fraktion" ) == 1 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", 228.71 )
						laSetElementData ( player, "spawnpos_y", 126.83 )
						laSetElementData ( player, "spawnpos_z", 1009.85 )
						laSetElementData ( player, "spawnrot_x", 180 )
						laSetElementData ( player, "spawnint", 10 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 210.94 )
						laSetElementData ( player, "spawnpos_y", 150.44 )
						laSetElementData ( player, "spawnpos_z", 1002.67 )
						laSetElementData ( player, "spawnrot_x", -90 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 252.14 )
						laSetElementData ( player, "spawnpos_y", 69.78 )
						laSetElementData ( player, "spawnpos_z", 1003.64 )
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 6 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 2 then
					if sType == "sf" then
						setPlayerNewSpawnpoint ( player, -1636.576, 1391.873, 7.172, 90, 0, 0 )
					elseif sType == "ls" then
						setPlayerNewSpawnpoint ( player, 725.90002441406, -1476.8000488281, 5.5, 90, 0, 0 )
					else
						setPlayerNewSpawnpoint ( player, 2170.59, 1601.95, 999.61895751953, 0, 1, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 3 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -2160.2456054688 )
						laSetElementData ( player, "spawnpos_y", 642.27325439453 )
						laSetElementData ( player, "spawnpos_z", 1057.2429199219 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 1 )
						laSetElementData ( player, "spawndim", 0 )
					elseif sType == "ls" then
						setPlayerNewSpawnpoint ( player, 2770.69, -1628.5, 12, 90, 0, 0 )
					else
						setPlayerNewSpawnpoint ( player, 1927.07, 1017.93, 994.11, 90, 10, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 4 then
					if laGetElementData ( player, "permission" ) == "medic" then
						laSetElementData ( player, "spawnpos_x", 407.464)
						laSetElementData ( player, "spawnpos_y", 259.259)
						laSetElementData ( player, "spawnpos_z", 996.811)
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2684.785, 435.75, 4.342, 90, 0, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 5 then
					laSetElementData ( player, "spawnpos_x", -2032.322 )
					laSetElementData ( player, "spawnpos_y", -116.989 )
					laSetElementData ( player, "spawnpos_z", 1035.171875 )
					laSetElementData ( player, "spawnrot_x", 135 )
					laSetElementData ( player, "spawnint", 3 )
					laSetElementData ( player, "spawndim", 0 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 6 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -2453.8784179688 )
						laSetElementData ( player, "spawnpos_y", 503.82363891602 )
						laSetElementData ( player, "spawnpos_z", 29.728803634644 )
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 221.12 )
						laSetElementData ( player, "spawnpos_y", 150.03)
						laSetElementData ( player, "spawnpos_z", 1002.67 )
						laSetElementData ( player, "spawnrot_x", -90 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1126.7763671875 )
						laSetElementData ( player, "spawnpos_y", -2036.951171875 )
						laSetElementData ( player, "spawnpos_z", 69.883659362793 )
						laSetElementData ( player, "spawnrot_x", -90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 7 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1734.04296875 )
						laSetElementData ( player, "spawnpos_y", -1639.720703125 )
						laSetElementData ( player, "spawnpos_z", 27.252737045288 )
						laSetElementData ( player, "spawnrot_x", 50 )
						laSetElementData ( player, "spawnint", 18 )
						laSetElementData ( player, "spawndim", 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", -771.902 )
						laSetElementData ( player, "spawnpos_y", 1563.006 )
						laSetElementData ( player, "spawnpos_z", 28 )
						laSetElementData ( player, "spawnrot_x", 180 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2174.6999511719, 974.70001220703, 80, 184, 0, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 8 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -1346.1706542969 )
						laSetElementData ( player, "spawnpos_y", 492.36785888672 )
						laSetElementData ( player, "spawnpos_z", 10.851915359497 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 247.46310424805 )
						laSetElementData ( player, "spawnpos_y", 1859.85546875 )
						laSetElementData ( player, "spawnpos_z", 13.733238220215 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 9 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1200.7490234375 )
						laSetElementData ( player, "spawnpos_y", 6.943359375 )
						laSetElementData ( player, "spawnpos_z", 1001.3443603516 )
						laSetElementData ( player, "spawnrot_x", 180 )
						laSetElementData ( player, "spawnint", 2 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "sf" then
						laSetElementData ( player, "spawnpos_x", 413.897 )
						laSetElementData ( player, "spawnpos_y", 2536.9 )
						laSetElementData ( player, "spawnpos_z", 10 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 10 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 10 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 2527.822265625 )
						laSetElementData ( player, "spawnpos_y", -1289.3125 )
						laSetElementData ( player, "spawnpos_z", 1031.421875 )
						laSetElementData ( player, "spawnrot_x", 270 )
						laSetElementData ( player, "spawnint", 2 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2446.183, -82.183, 34.2, 180, 0, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 11 then
					laSetElementData ( player, "spawnpos_x", -1998.9085693359 )
					laSetElementData ( player, "spawnpos_y", -1563.2896728516 )
					laSetElementData ( player, "spawnpos_z", 85.435836791992 )
					laSetElementData ( player, "spawnrot_x", 0 )
					laSetElementData ( player, "spawnint", 0 )
					laSetElementData ( player, "spawndim", 0 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
			else
				if laGetElementData ( player, "fraktion" ) == 1 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", 246.3 )
						laSetElementData ( player, "spawnpos_y", 125.05 )
						laSetElementData ( player, "spawnpos_z", 1003 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 10 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 216.72 )
						laSetElementData ( player, "spawnpos_y", 168.78 )
						laSetElementData ( player, "spawnpos_z", 1002.67 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 252.14 )
						laSetElementData ( player, "spawnpos_y", 69.78 )
						laSetElementData ( player, "spawnpos_z", 1003.64 )
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 6 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 2 then
					if sType == "sf" then
						setPlayerNewSpawnpoint ( player, -1636.576, 1391.873, 7.172, 0, 0 )
					elseif sType == "ls" then
						setPlayerNewSpawnpoint ( player, 762.59997558594, -1421.5, 14, 0, 0, 0 )
					else
						setPlayerNewSpawnpoint ( player, 2170.59, 1601.95, 999.61895751953, 0, 1, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 3 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -2160.2456054688 )
						laSetElementData ( player, "spawnpos_y", 642.27325439453 )
						laSetElementData ( player, "spawnpos_z", 1057.2429199219 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 1 )
						laSetElementData ( player, "spawndim", 0 )
					elseif sType == "ls" then
						setPlayerNewSpawnpoint ( player, 2796.10, -1619.40, 9.89999, 90, 0, 0 )
					else
						setPlayerNewSpawnpoint ( player, 1927.07, 1017.93, 994.11, 90, 10, 0 )
					end
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 4 then
					if laGetElementData ( player, "permission" ) == "medic" then
						laSetElementData ( player, "spawnpos_x", 407.464)
						laSetElementData ( player, "spawnpos_y", 259.259)
						laSetElementData ( player, "spawnpos_z", 996.811)
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2684.785, 435.75, 4.342, 90, 0, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 5 then
					laSetElementData ( player, "spawnpos_x", -2054.8874511719 )
					laSetElementData ( player, "spawnpos_y", 456.10498046875 )
					laSetElementData ( player, "spawnpos_z", 34.821102142334 )
					laSetElementData ( player, "spawnrot_x", 135 )
					laSetElementData ( player, "spawnint", 0 )
					laSetElementData ( player, "spawndim", 0 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 6 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -2453.8784179688 )
						laSetElementData ( player, "spawnpos_y", 503.82363891602 )
						laSetElementData ( player, "spawnpos_z", 29.728803634644 )
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 216.72 )
						laSetElementData ( player, "spawnpos_y", 168.78 )
						laSetElementData ( player, "spawnpos_z", 1002.67 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 3 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1126.7763671875 )
						laSetElementData ( player, "spawnpos_y", -2036.951171875 )
						laSetElementData ( player, "spawnpos_z", 69.883659362793 )
						laSetElementData ( player, "spawnrot_x", -90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 7 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1734.04296875 )
						laSetElementData ( player, "spawnpos_y", -1639.720703125 )
						laSetElementData ( player, "spawnpos_z", 23.767925262451 )
						laSetElementData ( player, "spawnrot_x", 50 )
						laSetElementData ( player, "spawnint", 18 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2174.6999511719, 974.70001220703, 80, 184, 0, 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 8 then
					if sType == "sf" then
						laSetElementData ( player, "spawnpos_x", -1346.1706542969 )
						laSetElementData ( player, "spawnpos_y", 492.36785888672 )
						laSetElementData ( player, "spawnpos_z", 10.851915359497 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					elseif sType == "lv" then
						laSetElementData ( player, "spawnpos_x", 247.46310424805 )
						laSetElementData ( player, "spawnpos_y", 1859.85546875 )
						laSetElementData ( player, "spawnpos_z", 13.733238220215 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
					else
						outputChatBox ( "Benutze bitte /spawnchange faction [carrier/base]!", player, 125, 0, 0 )
					end
				end
				if laGetElementData ( player, "fraktion" ) == 9 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 1215.84375 )
						laSetElementData ( player, "spawnpos_y", -15.2607421875 )
						laSetElementData ( player, "spawnpos_z", 1000.921875 )
						laSetElementData ( player, "spawnrot_x", 0 )
						laSetElementData ( player, "spawnint", 2 )
						laSetElementData ( player, "spawndim", 0 )
					else
						laSetElementData ( player, "spawnpos_x", 413.897 )
						laSetElementData ( player, "spawnpos_y", 2536.9 )
						laSetElementData ( player, "spawnpos_z", 10 )
						laSetElementData ( player, "spawnrot_x", 180 )
						laSetElementData ( player, "spawnint", 10 )
						laSetElementData ( player, "spawndim", 0 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 10 then
					if sType == "ls" then
						laSetElementData ( player, "spawnpos_x", 2527.822265625 )
						laSetElementData ( player, "spawnpos_y", -1289.3125 )
						laSetElementData ( player, "spawnpos_z", 1031.421875 )
						laSetElementData ( player, "spawnrot_x", 270 )
						laSetElementData ( player, "spawnint", 2 )
						laSetElementData ( player, "spawndim", 0 )
					else
						setPlayerNewSpawnpoint ( player, -2446.183, -82.183, 34.2, 180, 0, 0 )
					end
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
				if laGetElementData ( player, "fraktion" ) == 11 then
					laSetElementData ( player, "spawnpos_x", -1998.9085693359 )
					laSetElementData ( player, "spawnpos_y", -1563.2896728516 )
					laSetElementData ( player, "spawnpos_z", 85.435836791992 )
					laSetElementData ( player, "spawnrot_x", 0 )
					laSetElementData ( player, "spawnint", 0 )
					laSetElementData ( player, "spawndim", 0 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
				end
			end

		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in keiner Fraktion!", 5000, 125, 0, 0 )
		end
	elseif place == "street" then
		laSetElementData ( player, "spawnpos_x", -1971.466796875 )
		laSetElementData ( player, "spawnpos_y", 137.821890625 )
		laSetElementData ( player, "spawnpos_z", 27.6875 )
		laSetElementData ( player, "spawnrot_x", 90 )
		laSetElementData ( player, "spawnint", 0 )
		laSetElementData ( player, "spawndim", 0 )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
	elseif place == "hotel" then
		if laGetElementData ( player, "money" ) >= 100 then
			takePlayerSaveMoney ( player, 100 )
			if sType == "sf" then
				laSetElementData ( player, "spawnpos_x", 2230.5236816406 )
				laSetElementData ( player, "spawnpos_y", -1107.6160888672 )
				laSetElementData ( player, "spawnpos_z", 1050.5319824219 )
				laSetElementData ( player, "spawnrot_x", 0 )
				laSetElementData ( player, "spawnint", 5 )
				laSetElementData ( player, "spawndim", 0 )
			else
				laSetElementData ( player, "spawnpos_x", 2230.5236816407 )
				laSetElementData ( player, "spawnpos_y", -1107.6160888672 )
				laSetElementData ( player, "spawnpos_z", 1050.5319824219 )
				laSetElementData ( player, "spawnrot_x", 0 )
				laSetElementData ( player, "spawnint", 5 )
				laSetElementData ( player, "spawndim", 0 )
			end
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mind. 100 $ besitzen!", 5000, 0, 125, 0 )
		end
	elseif place == "hier" then
		if laGetElementData ( player, "adminlvl" ) >= 2 then
			local x, y, z = getElementPosition ( player )
			laSetElementData ( player, "spawnpos_x", x )
			laSetElementData ( player, "spawnpos_y", y )
			laSetElementData ( player, "spawnpos_z", z )
			laSetElementData ( player, "spawnrot_x", getPedRotation ( player ) )
			laSetElementData ( player, "spawnint", getElementInterior ( player ) )
			laSetElementData ( player, "spawndim", getElementDimension ( player ) )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
		end
	--[[elseif place == "adminls" then
		if laGetElementData ( player, "adminlvl" ) >= 2 then
			laSetElementData ( player, "spawnpos_x", 1438.1247558594 )
			laSetElementData ( player, "spawnpos_y", -2947.2856445312 )
			laSetElementData ( player, "spawnpos_z", 4.3248405456543 )
			laSetElementData ( player, "spawnrot_x", 0 )
			laSetElementData ( player, "spawnint", 0 )
			laSetElementData ( player, "spawndim", 0 )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
		end]]
	elseif place == "bar" then
		if laGetElementData ( player, "club" ) == "biker" then
			laSetElementData ( player, "spawnpos_x", -2244.6462402344 )
			laSetElementData ( player, "spawnpos_y", -88.103973388672 )
			laSetElementData ( player, "spawnpos_z", 34.96 )
			laSetElementData ( player, "spawnrot_x", 180 )
			laSetElementData ( player, "spawnint", 0 )
			laSetElementData ( player, "spawndim", 0 )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Biker!", player, 125, 0, 0 )
		end
	elseif place == "boat" then
		--OwnFootCheck ( player )
		local pname = getPlayerName ( player )
		for i = 1, 10 do
			carslotname = "carslot"..i
			if laGetElementData ( player, carslotname ) ~= 0 then
				local veh = _G[getPrivVehString ( pname, i )]
				if isElement ( veh ) then
					local vehModel = getElementModel ( veh )
						if (vehModel == 454) or (vehModel == 484) then
							--local x, y, z = getElementPosition( veh )
							local x = laGetElementData ( veh, "spawnpos_x")
							local y = laGetElementData ( veh, "spawnpos_y")
							local z = laGetElementData ( veh, "spawnpos_z")
							laSetElementData ( player, "spawnpos_x", x )
							laSetElementData ( player, "spawnpos_y", y )
							laSetElementData ( player, "spawnpos_z", tonumber(z)+2 )
							laSetElementData ( player, "spawnrot_x", 0 )
							laSetElementData ( player, "spawnint", 0 )
							laSetElementData ( player, "spawndim", 0 )
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
							break
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Yacht!", 5000, 125, 0, 0 )
						end
				end
			end
		end
	elseif place == "wohnmobil" then
		--OwnFootCheck ( player )
		local pname = getPlayerName ( player )
		for i = 1, 10 do
			carslotname = "carslot"..i
			if laGetElementData ( player, carslotname ) ~= 0 then
				local veh = _G[getPrivVehString ( pname, i )]
				if isElement ( veh ) then
					local vehModel = getElementModel ( veh )
						if (vehModel == 508) or (vehModel == 483) then
							--local x, y, z = getElementPosition( veh )
							local x = laGetElementData ( veh, "spawnpos_x")
							local y = laGetElementData ( veh, "spawnpos_y")
							local z = laGetElementData ( veh, "spawnpos_z")
							--local znew = tonumber(z)+2
							laSetElementData ( player, "spawnpos_x", tonumber(x)+4 )
							laSetElementData ( player, "spawnpos_y", tonumber(y)+4 )
							laSetElementData ( player, "spawnpos_z", z )
							laSetElementData ( player, "spawnrot_x", 0 )
							laSetElementData ( player, "spawnint", 0 )
							laSetElementData ( player, "spawndim", 0 )
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
							break
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Wohnmobil!", 5000, 125, 0, 0 )
						end
				end
			end
		end
		
		
		--[[local wohnmobil = false
		
		for i = 1, 10 do
			veh = _G["privVeh"..pname..i]
			if isElement ( veh ) then
				local veh = getElementModel ( _G["privVeh"..pname..i] )
				if veh == 508 or veh == 482 then
				end
			end
		end
		
		if wohnmobil then
			laSetElementData ( player, "spawnpos_x", "wohnmobil" )
			laSetElementData ( player, "spawnpos_y", 0 )
			laSetElementData ( player, "spawnpos_z", 0 )
			laSetElementData ( player, "spawnrot_x", 0 )
			laSetElementData ( player, "spawnint", 0 )
			laSetElementData ( player, "spawndim", 0 )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpawnpunkt geändert!", 5000, 0, 125, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Wohnmobil!", 5000, 0, 125, 0 )
		end]]
	else
		outputChatBox ( "Ungültige Eingabe! Bitte entweder \"house\", \"faction\", \"boat\", \"wohnmobil\" oder \"street\" eingeben!", player, 125, 0, 0 )
	end
	MySQL_SetString("userdata", "Spawnpos_X", laGetElementData ( player, "spawnpos_x" ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "Spawnpos_Y", laGetElementData ( player, "spawnpos_y" ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "Spawnpos_Z", laGetElementData ( player, "spawnpos_z" ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "Spawnrot_X", laGetElementData ( player, "spawnrot_x" ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "SpawnInterior", laGetElementData ( player, "spawnint" ), "Name LIKE '"..pname.."'")
	MySQL_SetString("userdata", "SpawnDimension", laGetElementData ( player, "spawndim" ), "Name LIKE '"..pname.."'")
end
addCommandHandler ( "spawnchange", 
	function ( player )
		outputChatBox ( "Bitte nutze das Optionsmenü!", player, 125, 0, 0 )
	end
)

function changeSpawnPosition_func ( arg1, arg2 )

	spawnchange_func ( client, "", arg1, arg2 )
end
addEvent ( "changeSpawnPosition", true )
addEventHandler ( "changeSpawnPosition", getRootElement(), changeSpawnPosition_func )

function setPlayerNewSpawnpoint ( player, x, y, z, rot, int, dim )

	laSetElementData ( player, "spawnpos_x", x )
	laSetElementData ( player, "spawnpos_y", y )
	laSetElementData ( player, "spawnpos_z", z )
	laSetElementData ( player, "spawnrot_x", rot )
	laSetElementData ( player, "spawnint", int )
	laSetElementData ( player, "spawndim", dim )
end