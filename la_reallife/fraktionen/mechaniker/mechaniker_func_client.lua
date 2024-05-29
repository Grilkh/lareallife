------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------
---- Script by Noneatme ------

local Guivar = 0

addEvent("onLAOrdnungsamtTuningGuiStart", true)
addEvent("onLAOrdnungsamtTuningGuiStartHeli", true)
local aramp1, aramp2
local aramp3

local Fenster = {}

local Knopf = {}
local Label = {}
local Radio = {}
local Grid = {}
	

local oamt_tunings = {
	[1] = "Kleine Reparatur,50,fix",
	[2] = "Grosse Reparatur,250000,fix",
	[3] = "Sportmotor,5000,tuning.motor",
	[4] = "Neue Reifen,25,fix",
	--[5] = "Nitro,250,fix", 
}

local function refreshOAMTGrid(car1, car2)
	guiGridListClear(Grid[1])
	local select1, select2 = guiRadioButtonGetSelected(Radio[1]),  guiRadioButtonGetSelected(Radio[2])
	if(select1 == true) and (isElement(aramp1)) then
		for i = 1, #oamt_tunings, 1 do
			local name, preis, data = gettok(oamt_tunings[i], 1, ","), gettok(oamt_tunings[i], 2, ","), gettok(oamt_tunings[i], 3, ",")
			local eingebaut = "Nein"
			if(data ~= "fix") then
				if(getElementData(aramp1, data) == true) then
					eingebaut = "Ja"
				end
			end
			local Totalschaeden = 1
			local Besitzer = laGetElementData (car1[1], "owner")
			local model = getElementModel(car1[1])
			if(name == "Grosse Reparatur") then
				if (Besitzer) then
					Totalschaeden = tonumber(laGetElementData ( car1[1], "totalschaeden"))
				end
				if Totalschaeden >= 0 then
				else
					Totalschaeden = 0
				end
				Totalschaeden = Totalschaeden + 1
				if carprices[model] then
					preis = carprices[model]/(100/(5*Totalschaeden))
				else
					preis = preis/(100/(5*Totalschaeden))
				end
			end
			local row = guiGridListAddRow(Grid[1])
			guiGridListSetItemText(Grid[1], row, 1, name, false, false)
			guiGridListSetItemText(Grid[1], row, 2,eingebaut, false, false)
			guiGridListSetItemText(Grid[1], row, 3, preis.."$", false, false)
		end	
	elseif(select2 == true) and (isElement(aramp2)) then
		for i = 1, #oamt_tunings, 1 do
			local name, preis, data = gettok(oamt_tunings[i], 1, ","), gettok(oamt_tunings[i], 2, ","), gettok(oamt_tunings[i], 3, ",")
			local eingebaut = "Nein"
			if(data ~= "fix") then
				if(getElementData(aramp2, data) == true) then
					eingebaut = "Ja"
				end
			end
			local Totalschaeden = 1
			local Besitzer = laGetElementData (car2[1], "owner")
			local model = getElementModel(car2[1])
			if(name == "Grosse Reparatur") then
				--Totalschaeden = tonumber(laGetElementData ( car2[1], "totalschaeden"))
				if (Besitzer) then
					Totalschaeden = tonumber(laGetElementData ( car2[1], "totalschaeden"))
				end
				if Totalschaeden >= 0 then
				else
					Totalschaeden = 0
				end
				Totalschaeden = Totalschaeden + 1
				if carprices[model] then
					preis = carprices[model]/(100/(5*Totalschaeden))
				else
					preis = preis/(100/(5*Totalschaeden))
				end
			end
			local row = guiGridListAddRow(Grid[1])
			guiGridListSetItemText(Grid[1], row, 1, name, false, false)
			guiGridListSetItemText(Grid[1], row, 2, eingebaut, false, false)
			guiGridListSetItemText(Grid[1], row, 3, preis.."$", false, false)
		end	
	end
end

local function refreshOAMTGridHeli(car1)
	guiGridListClear(Grid[1])
	local select1 = guiRadioButtonGetSelected(Radio[1])
	if(select1 == true) and (isElement(aramp3)) then
		for i = 1, #oamt_tunings, 1 do
			local name, preis, data = gettok(oamt_tunings[i], 1, ","), gettok(oamt_tunings[i], 2, ","), gettok(oamt_tunings[i], 3, ",")
			local eingebaut = "Nein"
			if(data ~= "fix") then
				if(getElementData(aramp3, data) == true) then
					eingebaut = "Ja"
				end
			end
			local Totalschaeden = 1
			local Besitzer = laGetElementData (car1[1], "owner")
			local model = getElementModel(car1[1])
			if(name == "Grosse Reparatur") then
				if (Besitzer) then
					Totalschaeden = tonumber(laGetElementData ( car1[1], "totalschaeden"))
				end
				if Totalschaeden >= 0 then
				else
					Totalschaeden = 0
				end
				Totalschaeden = Totalschaeden + 1
				if carprices[model] then
					preis = carprices[model]/(100/(5*Totalschaeden))
				else
					preis = preis/(100/(5*Totalschaeden))
				end
			end
			local row = guiGridListAddRow(Grid[1])
			guiGridListSetItemText(Grid[1], row, 1, name, false, false)
			guiGridListSetItemText(Grid[1], row, 2,eingebaut, false, false)
			guiGridListSetItemText(Grid[1], row, 3, preis.."$", false, false)
		end	
	end
end

local function createOAMTGui(car1, car2)
	if(GuivarMech == 1) then return end
	GuivarMech = 1
	showCursor(true)

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = 404,330
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)
	
	Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Ordnungsamt Tuningfenster",false)
	Label[1] = guiCreateLabel(11,21,384,52,"Willkommen an der Werkbank!\nHier kannst du aussuchen, was mit den Autos auf der Hebebühne\npassieren soll.",false,Fenster[1])
	guiSetFont(Label[1],"default-bold-small")
	Label[2] = guiCreateLabel(11,51,383,19,"______________________________________________________________",false,Fenster[1])
	guiLabelSetColor(Label[2],0, 255, 0)
	local t1, t2 = "N/A", "N/A"
	aramp1 = nil
	aramp2 = nil
	if(type(car1) == "table") then
		if(isElement(car1[1])) then
			t1 = getVehicleNameFromModel(getElementModel(car1[1]))
			aramp1 = car1[1]
		end
	end
	if(type(car2) == "table") then
		if(isElement(car2[1])) then
			t2 = getVehicleNameFromModel(getElementModel(car2[1]))
			aramp2 = car2[1]
		end
	end
	
	Label[3] = guiCreateLabel(12,79,380,34,"Auffahrrampe 1: "..t1.."\nAuffahrrampe 2: "..t2,false,Fenster[1])
	guiSetFont(Label[3],"default-bold-small")
	Label[4] = guiCreateLabel(13,112,149,21,"Verwende:",false,Fenster[1])
	guiLabelSetColor(Label[4],0, 255, 0)
	guiSetFont(Label[4],"default-bold-small")
	Radio[1] = guiCreateRadioButton(16,137,134,19,"Auffahrrampe 1",false,Fenster[1])
	guiSetFont(Radio[1],"default-bold-small")
	Radio[2] = guiCreateRadioButton(135,139,134,19,"Auffahrrampe 2",false,Fenster[1])
	guiRadioButtonSetSelected(Radio[1],true)
	guiSetFont(Radio[2],"default-bold-small")
	Grid[1] = guiCreateGridList(15,163,226,158,false,Fenster[1])
	guiGridListSetSelectionMode(Grid[1],1)

	guiGridListAddColumn(Grid[1],"Aktion",0.5)

	guiGridListAddColumn(Grid[1],"Eingebaut",0.2)

	guiGridListAddColumn(Grid[1],"Preis",0.2)
	Knopf[1] = guiCreateButton(250,172,138,32,"Aktion durchführen",false,Fenster[1])
	Knopf[2] = guiCreateButton(252,279,138,32,"Abbrechen",false,Fenster[1])
	Knopf[3] = guiCreateButton(250,207,138,32,"Aktion entfernen",false,Fenster[1])
	guiSetEnabled(Knopf[3], false)
	refreshOAMTGrid(car1, car2)
	-- EVENT HANDLERS --
	
	addEventHandler("onClientGUIClick", Knopf[1], function()
		local aktion, eingebaut, preis = guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 1), guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 2),  guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 3)
		if(aktion == "") then return end
		local car1, car2 = guiRadioButtonGetSelected(Radio[1]), guiRadioButtonGetSelected(Radio[2])
		local car
		if(car1 == true) then
			car = aramp1
		end
		if(car2 == true) then
			car = aramp2
		end
		if(eingebaut == "Ja") then
			outputChatBox("Diese Aktion wurde bereits durchgeführt!", 200, 0, 0)
			return
		end
		-- SICHERHEITSHINWEIS --
		local money = laGetElementData (gMe, "money")
		if(money < tonumber(gettok(preis, 1, "$"))) then
			outputChatBox("Du hast nicht genug Geld!", 200, 0, 0)
			return
		end
		triggerServerEvent("onLAOAmtCarTuning", gMe, car, aktion, tonumber(gettok(preis, 1, "$")))
	end, false)
	-- RADIO --
	
	addEventHandler("onClientGUIClick", Radio[1], function()
		refreshOAMTGrid(car1, car2)
	end, false)
	addEventHandler("onClientGUIClick", Radio[2], function()
		refreshOAMTGrid(car1, car2)
	end, false)
	
	-- CANCEL BUTTON --
	addEventHandler("onClientGUIClick", Knopf[2], function()
		GuivarMech = 0
		destroyElement(Fenster[1])
		showCursor(false)
	end, false)
end
addEventHandler("onLAOrdnungsamtTuningGuiStart", getLocalPlayer(), createOAMTGui)



local function createOAMTGuiHeli(car1)
	if(GuivarMechHeli == 1) then return end
	GuivarMechHeli = 1
	showCursor(true)

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = 404,330
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)
	
	Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Ordnungsamt Tuningfenster",false)
	Label[1] = guiCreateLabel(11,21,384,52,"Willkommen am Heliport!\nHier kannst du aussuchen, was mit dem Helikopter\npassieren soll.",false,Fenster[1])
	guiSetFont(Label[1],"default-bold-small")
	Label[2] = guiCreateLabel(11,51,383,19,"______________________________________________________________",false,Fenster[1])
	guiLabelSetColor(Label[2],0, 255, 0)
	local t1 = "N/A"
	aramp3 = nil
	if(type(car1) == "table") then
		if(isElement(car1[1])) then
			t1 = getVehicleNameFromModel(getElementModel(car1[1]))
			aramp3 = car1[1]
		end
	end
	
	Label[3] = guiCreateLabel(12,79,380,34,"Heliport: "..t1.."",false,Fenster[1])
	guiSetFont(Label[3],"default-bold-small")
	Label[4] = guiCreateLabel(13,112,149,21,"Verwende:",false,Fenster[1])
	guiLabelSetColor(Label[4],0, 255, 0)
	guiSetFont(Label[4],"default-bold-small")
	Radio[1] = guiCreateRadioButton(16,137,134,19,"Heliport",false,Fenster[1])
	guiSetFont(Radio[1],"default-bold-small")
	Grid[1] = guiCreateGridList(15,163,226,158,false,Fenster[1])
	guiGridListSetSelectionMode(Grid[1],1)

	guiGridListAddColumn(Grid[1],"Aktion",0.5)

	guiGridListAddColumn(Grid[1],"Eingebaut",0.2)

	guiGridListAddColumn(Grid[1],"Preis",0.2)
	Knopf[1] = guiCreateButton(250,172,138,32,"Aktion durchführen",false,Fenster[1])
	Knopf[2] = guiCreateButton(252,279,138,32,"Abbrechen",false,Fenster[1])
	Knopf[3] = guiCreateButton(250,207,138,32,"Aktion entfernen",false,Fenster[1])
	guiSetEnabled(Knopf[3], false)
	refreshOAMTGridHeli(car1)
	-- EVENT HANDLERS --
	
	addEventHandler("onClientGUIClick", Knopf[1], function()
		local aktion, eingebaut, preis = guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 1), guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 2),  guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 3)
		if(aktion == "") then return end
		local car1 = guiRadioButtonGetSelected(Radio[1])
		local car
		if(car1 == true) then
			car = aramp3
		end
		if(eingebaut == "Ja") then
			outputChatBox("Diese Aktion wurde bereits durchgeführt!", 200, 0, 0)
			return
		end
		-- SICHERHEITSHINWEIS --
		local money = laGetElementData (gMe, "money")
		if(money < tonumber(gettok(preis, 1, "$"))) then
			outputChatBox("Du hast nicht genug Geld!", 200, 0, 0)
			return
		end
		triggerServerEvent("onLAOAmtCarTuning", gMe, car, aktion, tonumber(gettok(preis, 1, "$")))
	end, false)
	-- RADIO --
	
	addEventHandler("onClientGUIClick", Radio[1], function()
		refreshOAMTGridHeli(car1)
	end, false)
	
	-- CANCEL BUTTON --
	addEventHandler("onClientGUIClick", Knopf[2], function()
		GuivarMechHeli = 0
		destroyElement(Fenster[1])
		showCursor(false)
	end, false)
end
addEventHandler("onLAOrdnungsamtTuningGuiStartHeli", getLocalPlayer(), createOAMTGuiHeli)