spawnPointListCMD1 = {
 ["Bahnhof"]="street",
 ["Haus"]="house",
 ["Basis"]="faction",
 
 ["SFPD"]="faction",
 ["LVPD"]="faction",
 ["LSPD"]="faction",
 
 ["Pier 69"]="faction",
 ["Caligulas Casino"]="faction",
 
 ["Chinatown"]="faction",
 ["Four Dragons"]="faction",
 ["Ausbildungslager"]="faction",
 
 ["SF Basis"]="faction",
 ["LS Basis"]="faction",
 
 ["Flugzeugträger"]="faction",
 ["Area 51"]="faction",

 ["Hier"]="hier",
 ["Mistys Bar"]="bar",
 ["Yacht"]="boat",
 ["Wohnwagen"]="wohnmobil",
 
 ["Hotel ( SF )"]="hotel",
 ["Hotel ( LV )"]="hotel"
 }

spawnPointListCMD2 = {
 ["Bahnhof"]="",
 ["Haus"]="",
 ["Basis"]="",
 
 ["SFPD"]="sf",
 ["LVPD"]="lv",
 ["LSPD"]="ls",
 
 ["Pier 69"]="sf",
 ["Caligulas Casino"]="lv",
 
 ["Chinatown"]="sf",
 ["Four Dragons"]="lv",
 ["Ausbildungslager"]="lv",
 
 ["SF Basis"]="sf",
 ["LS Basis"]="ls",
 
 ["Flugzeugträger"]="sf",
 ["Area 51"]="lv",

 ["Hier"]="",
 ["Adminbase LS"]="adminls",
 ["Mistys Bar"]="",
 ["Yacht"]="",
 ["Wohnwagen"]="",
 
 ["Hotel ( SF )"]="sf",
 ["Hotel ( LV )"]="lv"
 }

factionsInBothCitys = {
 [1]=true, -- LAPD
 [2]=true, -- Camorra
 [3]=true, -- Yakuza
 [6]=true, -- FBI
 [7]=true, -- Surenos
 [8]=true,  -- Army
 [9]=true, -- Comptons
[10]=true  -- Watts
 }

function showSpawnSelection ()

	if isElement ( gWindow["spawnPointSelection"] ) then
		guiSetVisible ( gWindow["spawnPointSelection"], true )
	else
		gWindow["spawnPointSelection"] = guiCreateWindow(screenwidth/2-281/2,120,281,287,"Startpunkt",false)
		guiSetAlpha(gWindow["spawnPointSelection"],1)
		gGrid["availableSpawnPoints"] = guiCreateGridList(9,25,128,253,false,gWindow["spawnPointSelection"])
		guiGridListSetSelectionMode(gGrid["availableSpawnPoints"],2)
		gColumn["spawnPoint"] = guiGridListAddColumn(gGrid["availableSpawnPoints"],"Startpunkt",0.8)
		guiSetAlpha(gGrid["availableSpawnPoints"],1)
		gButton["changeSpawnPoint"] = guiCreateButton(145,100,126,69,"Als Start- und\nWieder-\neinstiegspunkt festlegen",false,gWindow["spawnPointSelection"])
		guiSetAlpha(gButton["changeSpawnPoint"],1)
		guiSetFont(gButton["changeSpawnPoint"],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["changeSpawnPoint"],
			function ()
				local row, column = guiGridListGetSelectedItem ( gGrid["availableSpawnPoints"] )
				local text = guiGridListGetItemText ( gGrid["availableSpawnPoints"], row, column )
				
				local cmd1 = spawnPointListCMD1[text]
				local cmd2 = spawnPointListCMD2[text]
				
				if cmd1 then
					triggerServerEvent ( "changeSpawnPosition", lp, cmd1, cmd2 )
				end
			end,
		false )
	end
	fillSpawnPointList ()
end

function fillSpawnPointList ()

	guiGridListClear ( gGrid["availableSpawnPoints"] )
	
	local row
	-- Street --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Bahnhof", false, false )
	-- Haus --
	if getElementData ( lp, "housekey" ) ~= 0 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Haus", false, false )
	end
	-- Fraktion --
	local fraktion = getElementData ( lp, "fraktion" )
	if fraktion == 1 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SFPD", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LVPD", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LSPD", false, false )
	elseif fraktion == 2 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Pier 69", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Caligulas Casino", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
	elseif fraktion == 3 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Chinatown", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Four Dragons", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
	elseif fraktion == 6 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SF Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LVPD", false, false )
	elseif fraktion == 7 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SF Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Ausbildungslager", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	elseif fraktion == 8 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Flugzeugträger", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Area 51", false, false )
	elseif fraktion == 9 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SF Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
	elseif fraktion == 10 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SF Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LS Basis", false, false )
	elseif fraktion > 0 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Basis", false, false )
	end
	-- Admin --
	if getElementData ( player, "adminlvl" ) >= 2 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hier", false, false )
	end
	-- Adminbase LS --
	if getElementData ( player, "adminlvl" ) >= 2 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Adminbase LS", false, false )
	end
	-- Yacht --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Yacht", false, false )
	-- Wohnwagen --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Wohnwagen", false, false )

	-- Hotels --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hotel ( SF )", false, false )
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hotel ( LV )", false, false )
end