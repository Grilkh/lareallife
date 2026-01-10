-- Zigaretten:	1
-- Alkohol:		2
-- Weed:		3
-- Koks:		4

 addictRemoveCost = 250

addictLevelNames = {}

 addictLevelNames[1] = {} -- Zigaretten
  addictLevelNames[1][0] = "Nichtraucher"
  addictLevelNames[1][1] = "Partyraucher"
  addictLevelNames[1][2] = "Partyraucher"
  addictLevelNames[1][3] = "Gelegenheitsraucher"
  addictLevelNames[1][4] = "Gelegenheitsraucher"
  addictLevelNames[1][5] = "Raucher"
  addictLevelNames[1][6] = "Raucher"
  addictLevelNames[1][7] = "Nikotinsüchtiger"
  addictLevelNames[1][8] = "Nikotinsüchtiger"
  addictLevelNames[1][9] = "Kettenraucher"
  addictLevelNames[1][10] = "Kettenraucher"
  
 addictLevelNames[2] = {} -- Alkohol
  addictLevelNames[2][0] = "Trocken"
  addictLevelNames[2][1] = "Partytrinker"
  addictLevelNames[2][2] = "Partytrinker"
  addictLevelNames[2][3] = "Gelegenheitstrinker"
  addictLevelNames[2][4] = "Gelegenheitstrinker"
  addictLevelNames[2][5] = "Regelmässiger Trinker"
  addictLevelNames[2][6] = "Regelmässiger Trinker"
  addictLevelNames[2][7] = "Alkoholiker"
  addictLevelNames[2][8] = "Alkoholiker"
  addictLevelNames[2][9] = "Alkoholkrank"
  addictLevelNames[2][10] = "Alkoholkrank"
  
 addictLevelNames[3] = {} -- Weed
  addictLevelNames[3][0] = "Clean"
  addictLevelNames[3][1] = "Gelegenheitskiffer"
  addictLevelNames[3][2] = "Gelegenheitskiffer"
  addictLevelNames[3][3] = "Wochenendskiffer"
  addictLevelNames[3][4] = "Wochenendskiffer"
  addictLevelNames[3][5] = "Kiffer"
  addictLevelNames[3][6] = "Kiffer"
  addictLevelNames[3][7] = "Weedjunkie"
  addictLevelNames[3][8] = "Weedjunkie"
  addictLevelNames[3][9] = "Pothead"
  addictLevelNames[3][10] = "Pothead"
  
  addictLevelNames[4] = {} -- Koks
  addictLevelNames[4][0] = "Clean"
  addictLevelNames[4][1] = "Gelegenheitskokser"
  addictLevelNames[4][2] = "Gelegenheitskokser"
  addictLevelNames[4][3] = "Partykokser"
  addictLevelNames[4][4] = "Partykokser"
  addictLevelNames[4][5] = "Kokser"
  addictLevelNames[4][6] = "Kokser"
  addictLevelNames[4][7] = "Koksjunkie"
  addictLevelNames[4][8] = "Koksjunkie"
  addictLevelNames[4][9] = "Koksnase"
  addictLevelNames[4][10] = "Koksnase"

--[[addictLevelDivisors = {
 [1]=3,
 [2]=4,
 [3]=2,
 [4]=1
 }]]

function getTotalAddictLevel ( player )

	local points1 = laGetElementData ( player, "cigarettAddictPoints" )
	local points2 = laGetElementData ( player, "alcoholAddictPoints" )
	local points3 = laGetElementData ( player, "weedAddictPoints" )
	local points4 = laGetElementData ( player, "koksAddictPoints" )
	
	--[[local addict1 = math.floor ( points1 / addictLevelDivisors[1] )
	local addict2 = math.floor ( points2 / addictLevelDivisors[2] )
	local addict3 = math.floor ( points3 / addictLevelDivisors[3] )
	local addict4 = math.floor ( points4 / addictLevelDivisors[4] )]]--
	
	--return addict1 + addict2 + addict3 + addict4
	return points1 + points2 + points3 + points4
end

function getCigarettAddictLevel ( player )

	if isElement ( player ) then
		local addict = laGetElementData ( player, "cigarettAddictPoints" )
		--local addict = math.floor ( points / addictLevelDivisors[1] )
		if addict > 10 then
			addict = 10
		end
		return addictLevelNames[1][addict].."\n( Stufe "..addict.." )"
	end
end

function getAlcoholAddictLevel ( player )

	if isElement ( player ) then
		local addict = laGetElementData ( player, "alcoholAddictPoints" )
		--local addict = math.floor ( points / addictLevelDivisors[2] )
		if addict > 10 then
			addict = 10
		end
		return addictLevelNames[2][addict].."\n( Stufe "..addict.." )"
	end
end

function getWeedAddictLevel ( player )

	if isElement ( player ) then
		local addict = laGetElementData ( player, "weedAddictPoints" )
		--local addict = math.floor ( points / addictLevelDivisors[3] )
		if addict > 10 then
			addict = 10
		end
		return addictLevelNames[3][addict].."\n( Stufe "..addict.." )"
	end
end

function getKoksAddictLevel ( player )

	if isElement ( player ) then
		local addict = laGetElementData ( player, "koksAddictPoints" )
		--local addict = math.floor ( points / addictLevelDivisors[3] )
		if addict > 10 then
			addict = 10
		end
		return addictLevelNames[4][addict].."\n( Stufe "..addict.." )"
	end
end