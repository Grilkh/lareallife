function increasePlayerFishingSkillLevel ( player, amount )

	local old = calcFishingSkillLevel ( player )
	laSetElementData ( player, "fishingSkill", laGetElementData ( player, "fishingSkill" ) + amount )
	
	local skill = laGetElementData ( player, "fishingSkill" )
	
	if old < calcFishingSkillLevel ( player ) then
		outputChatBox ( "Du bist um einen Angellevel aufgestiegen! Du kannst nun mehr Haken und Köder mitnehmen,", player, 0, 125, 0 )
		outputChatBox ( "Ausserdem kannst du mehr und grössere Fische fangen!", player, 0, 125, 0 )
	end
	
	triggerClientEvent ( player, "showSkillInfo", player, "Angelskills:", calcFishingBarFuelState ( skill ), getFishesLeftForNextLevel ( skill ), calcFishingSkillLevel ( player ) )
end

function increasePlayerGambleSkillLevel ( player, amount )

	local old = calcGambleSkillLevel ( player )
	laSetElementData ( player, "gambleSkill", laGetElementData ( player, "gambleSkill" ) + amount )
	
	local skill = laGetElementData ( player, "gambleSkill" )
	
	if old < calcGambleSkillLevel ( player ) then
		outputChatBox ( "Du bist um einen Spielskill aufgestiegen! Du kannst nun um mehr Geld spielen.", player, 0, 125, 0 )
	end
	
	triggerClientEvent ( player, "showSkillInfo", player, "Spielskills:", calcGambleBarFuelState ( skill ), getGambleMoneyLeftForNextLevel ( skill ), calcGambleSkillLevel ( player ) )
end