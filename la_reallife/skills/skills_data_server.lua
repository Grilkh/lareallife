function skillDataLoad ( player )

	local pname = getPlayerName ( player )
	--setFishingValues ( player )
if MySQL_DatasetExist ( "skills", "Name LIKE '"..pname.."'" ) then
	laSetElementData ( player, "fishingSkill", tonumber ( MySQL_GetString ( "skills", "fishing", "Name LIKE '"..pname.."'" ) ) )
	laSetElementData ( player, "fishingSkillOld", laGetElementData ( player, "fishingSkill" ) )
	laSetElementData ( player, "gambleSkill", tonumber ( MySQL_GetString ( "skills", "gamble", "Name LIKE '"..pname.."'" ) ) )
else
	local result = mysql_la_query ( "INSERT INTO skills ( id, Name ) VALUES ( '"..getIDByName ( pname ).."', '"..pname.."' )" )
		if( not result) then
			outputDebugString("Error executing the query Skills: ("		.. dbErrorCode(handler) .. ") " .. dbErrorMessage(handler))
		else
			-- mysql_free_result(result)
			dbFree(result)
			laSetElementData ( player, "fishingSkill", tonumber ( MySQL_GetString ( "skills", "fishing", "Name LIKE '"..pname.."'" ) ) )
			laSetElementData ( player, "fishingSkillOld", laGetElementData ( player, "fishingSkill" ) )
			laSetElementData ( player, "gambleSkill", tonumber ( MySQL_GetString ( "skills", "gamble", "Name LIKE '"..pname.."'" ) ) )
		end
end
end

function skillDataSave ( player )

	local pname = getPlayerName ( player )
	if laGetElementData ( player, "fishingSkill" ) > laGetElementData ( player, "fishingSkillOld" ) then
		MySQL_SetString ( "skills", "fishing", laGetElementData ( player, "fishingSkill" ), "Name LIKE '"..pname.."'" )
	end
	--saveFishingValues ( player )
	MySQL_SetString ( "skills", "gamble", laGetElementData ( player, "gambleSkill" ), "Name LIKE '"..pname.."'" )
end