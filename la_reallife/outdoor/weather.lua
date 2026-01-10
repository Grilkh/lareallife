weatherNames = {}
weatherNames = { [1]="Bewölkt",
[2]="Bewölkt",
[3]="Bewölkt",
[4]="Bewölkt",
[5]="Bewölkt",
[6]="Bewölkt",
[7]="Bewölkt",
[8]="Sturm",
[9]="Neblig und Bewölkt",
[10]="Blauer Himmel",
[11]="Hitzewelle",
[12]="Grau und trist",
[13]="Grau und trist",
[14]="Grau und trist",
[15]="Grau und trist",
[16]="Bewölkt und verregnet",
[17]="Leichte Hitze",
[18]="Leichte Hitze",
[19]="Sandsturm",
[20]="Neblig und Bewölkt" }

s = 1000
duration = 1200*s

function weather_func ()

	weather = 19
	outputDebugString ( "Weatherchange" )
	while weather == 19 do
		weather = math.floor ( math.random ( 1, 20 ) )
	end
	if weather >= 1 and weather <= 7 then						--- leicht Bewlkt, kein Regen
		waves = 1 + ( math.random ( -1, 1 ) )
		weatherreal = weather
	end
	if weather == 8 then										--- Sturm
	--	waves = 3.5 + ( math.random ( -3, 3 ) 
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
		weatherreal = 10
	end
	if weather == 9 or weather == 20 then						--- Bewlkt / neblig
	--	waves = 1.5 + ( math.random ( -0.5, 0.5 ) )
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
		weatherreal = 10
	end
	if weather == 10 then										--- Blauer Himmel, wolkenlos
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
		weatherreal = weather
	end
	if weather == 11 then										--- Hitzewelle
		waves = 0.5 + ( math.random ( -0.5, 1 ) )
		weatherreal = weather
	end
	if weather >= 12 and weather <= 15 then						--- Grau, Farblos usw.
		waves = 1 + ( math.random ( -0.75, 0.5 ) )
		weatherreal = weather
	end
	if weather == 16 then										--- Bewlkt, verregnet
	--	waves = 2 + ( math.random ( -0.5, 1.5 ) )
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
		weatherreal = 10
	end
	if weather == 17 or weather == 18 then						--- Leichte Hitze
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
		weatherreal = weather
	end
	if weather == 8 and math.random ( 1, 9 ) == 9 then
		outputChatBox ( "[Unwetterwarnung]: Die Städte werden von Wellen überschwemmt! Bringt euch in Sicherheit!", getRootElement(), 255, 0, 0 )
		outputChatBox ( "Die Polizei kann euch im Notfall retten!", getRootElement(), 200, 0, 0 )
		setTimer ( changeWeatherUnwetter, 180*s, 1 )
	else
		for id, playeritem in ipairs(getElementsByType("player")) do
			if laGetElementData ( playeritem, "loggedin" ) == 1 then
				if tonumber(laGetElementData ( playeritem, "fraktion" )) == 5 then
					outputChatBox ( "Wetterbericht: In 5 Minuten wird das Wetter sich wie folgt ändern: "..weatherNames[weatherreal].." und Wellenhöhe von bis zu "..waves.." Metern!", playeritem, 200, 200, 0 )
				end
			end
		end
		setTimer ( changeWeather, 300*s, 1, weatherreal, waves )
	end
end
setTimer ( weather_func, wctime*60*s, 1 )

function changeWeather ( weatherreal, waves )

	setWeatherBlended ( weatherreal )
	setWaveHeight ( waves )
	setTimer ( weather_func, wctime*60*s, 1 )
end

function changeWeatherUnwetter ()

	setWeatherBlended ( 8 )
	setWaveHeight ( math.random ( 5, 9 ) )
	
	local height = 0
	
	local southWest_X = -2998
	local southWest_Y = -2998
	local southEast_X = 2998
	local southEast_Y = -2998
	local northWest_X = -2998
	local northWest_Y = 2998
	local northEast_X = 2998
	local northEast_Y = 2998

	water = createWater ( -2998, -2998, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
	setWaterLevel ( 0 )
	setWaterLevel ( water, 0 )
	
	setTimer ( setWaterLVLHigher, (10*s), 18, water )
	setTimer ( setWaterLVLLowerStart, (10*s)*18+duration, 1, water )
end

function setWaterLVLHigher ( water )

	if isElement ( water ) then
		local x, y, z = getElementPosition ( water )
		local waterlevel = z
		outputDebugString ( x.."|"..y.."|"..z )
		local waterlevel = z + 0.44
		setWaterLevel ( water, waterlevel )
		setWaterLevel ( waterlevel )
	end
end

function setWaterLVLLowerStart ( water )

	setWaterLVLLowerTimer = setTimer ( setWaterLVLLower, (10*s), 18, water )
end

function setWaterLVLLower ( water )

	if isElement ( water ) then
		local x, y, z = getElementPosition ( water )
		local waterlevel = z
		local waterlevel = z - 0.44
		if waterlevel <= 0 then
			setWaterLevel ( water, 0 )
			setWaterLevel ( 0 )
			destroyElement ( water )
			setTimer ( weather_func, 20*s, 1 )
			killTimer ( setWaterLVLLowerTimer )
		else
			setWaterLevel ( water, waterlevel )
			setWaterLevel ( waterlevel )
		end
	end
end