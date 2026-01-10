curVersion = "5.5"
thisResource = getThisResource()
resourceName = getResourceName(thisResource)

 
-- Fahrzeuge
singleTrunkWeapons = { [16]=true, [17]=true, [18]=true, [39]=true }
 
-- 24/7
flowers_price = 5
cam_price = 40
camammo_price = 36
nvgoogles_price = 150
tgoogles_price = 150
wuerfel_price = 10
rubbellos_price = 10
zigarett_price = 25
beer_price = 10
prepaid_low = 50
prepaid_middle = 80
prepaid_large = 200

-- Marker
markerPositions = {}

-- Baumarkt
placeablePrices = {}
 placeablePrices[841] = 495 -- Lagerfeuer #1
 placeablePrices[842] = 495 -- Lagerfeuer #2
 placeablePrices[3461] = 249 -- Fackel
 placeablePrices[1946] = 75 -- Basketball
 placeablePrices[1598] = 50 -- Strandball
 placeablePrices[1481] = 650 -- Grill
 placeablePrices[1255] = 300 -- Liege
 placeablePrices[1640] = 50 -- Handtuch Gruen
 placeablePrices[1641] = 50 -- Handtuch Lila
 placeablePrices[1642] = 50 -- Handtuch Rot
 placeablePrices[1643] = 50 -- Handtuch Gelb
 
serverip = "128.65.217.139:22003"
tsip = "62.141.36.139:8894"
forumURL = "lareallife.de"

-- Spawns
noobspawn1 = -1971.466796875
noobspawn2 = 137.821890625
noobspawn3 = 27.6875

-- DayNames
daynames = { [1]="Mo", [2]="Di", [3]="Mi", [4]="Do", [5]="Fr", [6]="Sa", [7]="So" }

-- Skins
malehomeless = { [1]=1, [2]=95, [3]=158, [4]=159, [5]=160, [6]=161, [7]=162, [8]=200, [9]=212, [10]=213 }
femalehomeless = { [1]=129, [2]=157, [3]=196, [4]=197, [5]=198 }

-- Animationen --
animationCMDs = {
"handsup",
"phoneout",
"phonein",
"drunk",
"robman",
"bomb",
"getarrested",
"laugh",
"lookout",
"crossarms",
"lay",
"hide",
"vomit",
"wave",
"slapass",
"deal",
"crack",
"smoke",
"smokef",
"ground",
"fucku",
"chat",
"taichi",
"chairsit",
"dance",
"piss",
"wank"
}

-- License --
evelse = { [594]=true }
trailers = { [606]=true,  [607]=true, [610]=true, [590]=true, [569]=true, [611]=true, [584]=true, [608]=true, [435]=true, [450]=true, [591]=true}
rc_vehs = { [411]=true, [464]=true, [501]=true, [465]=true, [564]=true }
trains = { [537]=true, [538]=true, [569]=true, [590]=true, [537]=true, [449]=true, }
cars = { [579]=true, [400]=true, [404]=true, [489]=true, [505]=true, [479]=true, [442]=true, [458]=true, [429]=true, [411]=true, [559]=true, [541]=true, [415]=true, [561]=true, [480]=true, [560]=true, [562]=true, [506]=true, [565]=true, 
[451]=true, [434]=true, [558]=true, [555]=true, [477]=true, [503]=true, [502]=true, [494]=true, [434]=true, [565]=true, [568]=true, [557]=true, [424]=true, [504]=true, [495]=true, [539]=true, [483]=true, [508]=true, [500]=true,  [444]=true,
[556]=true, [536]=true, [575]=true, [534]=true, [567]=true, [535]=true, [576]=true, [412]=true, [459]=true, [422]=true, [482]=true, [605]=true, [530]=true, [418]=true, [582]=true, [413]=true, [440]=true, [543]=true, [583]=true, [478]=true,
[554]=true, [602]=true, [496]=true, [401]=true, [518]=true, [527]=true, [589]=true, [419]=true, [533]=true, [526]=true, [474]=true, [545]=true, [517]=true, [410]=true, [600]=true, [436]=true, [580]=true, [439]=true, [549]=true, [491]=true,
[445]=true, [604]=true, [507]=true, [585]=true, [466]=true, [492]=true, [546]=true, [551]=true, [516]=true, [467]=true, [426]=true, [547]=true, [405]=true, [409]=true, [550]=true, [566]=true, [540]=true, [529]=true, [485]=true,
[574]=true, [420]=true, [525]=true, [552]=true, [416]=true, [596]=true, [597]=true, [499]=true, [428]=true, [598]=true, [470]=true, [528]=true, [590]=true }

lkws = { [499]=true, [609]=true, [498]=true, [524]=true, [532]=true, [578]=true, [486]=true, [406]=true, [573]=true, [455]=true, [588]=true, [403]=true, [514]=true, [423]=true, [414]=true, [443]=true, [515]=true, [531]=true, [456]=true,
[433]=true, [427]=true, [407]=true, [544]=true, [432]=true, [431]=true, [437]=true, [408]=true, }

motorboats = { [472]=true, [473]=true, [493]=true, [595]=true, [430]=true, [453]=true, [452]=true, [446]=true }
bikes = { [471]=true, [523]=true, [581]=true, [521]=true, [463]=true, [522]=true, [461]=true, [468]=true, [586]=true }
raftboats = { [484]=true, [454]=true }
helicopters = { [548]=true, [425]=true, [417]=true, [487]=true, [488]=true, [497]=true, [563]=true, [447]=true, [469]=true }
planea = { [512]=true, [593]=true, [476]=true, [460]=true, [513]=true }	-- Propeller
planeb = { [592]=true, [577]=true, [511]=true, [520]=true, [553]=true, [519]=true }	-- Dsenjets
nolicense = { [457]=true, [539]=true, [571]=true, [572]=true, [509]=true, [481]=true, [462]=true, [510]=true, [448]=true, [438]=true }

-- Copcars
copcars = { [427]=true, [596]=true, [597]=true, [598]=true }
copbikes = { [523]=true }
copjeeps = { [525]=true, [599]=true }
cophelis = { [497]=true }
copvehs = { [427]=true, [497]=true, [523]=true, [525]=true, [596]=true, [597]=true, [598]=true, [599]=true }

fbicars = { [428]=true, [490]=true }
fbijeeps = { [411]=true, [415]=true, [528]=true, [601]=true }
fbihelis = { [497]=true }
fbivehs = { [411]=true, [415]=true, [428]=true, [490]=true, [497]=true, [528]=true, [601]=true }

armycars = { [427]=true, [470]=true }
armybikes = { [586]=true }
armyjeeps = { [433]=true, [500]=true, [528]=true }
armyhelis = { [497]=true, [548]=true, [563]=true }
--548 und 563 2Platz
armyvehs = { [427]=true, [433]=true, [470]=true, [497]=true, [500]=true, [528]=true, [548]=true, [563]=true, [586]=true }


staatvierplatz = { [427]=true, [428]=true, [470]=true, [490]=true, [497]=true, [596]=true, [597]=true, [598]=true }
staatzweiplatz = { [411]=true, [415]=true, [433]=true, [500]=true, [523]=true, [525]=true, [528]=true, [548]=true, [563]=true, [586]=true, [599]=true, [601]=true }

-- Trucker --
tour1Price = 25
tour2Price = 50
tour3Price = 100
tour4Price = 250
maxdamage = 100
trucks = { [515]=true, [514]=true, [403]=true }
truckTrailer = { [435]=true, [450]=true, [591]=true }

-- Farben --
markerred = 125, 0, 0, 255

-- Tankstelle & Burgershot --
literPrice = 1.25
kannisterPrice = 15
sprunkheal = 2
snackPrice = 1
burgerPrice = 5

-- Bikerclub --
outfitPrice = 135
quePrice = 30
freewayPrice = 7950

-- Fraktionen --
fraktionsNamen = { [0]="Zivilist", [1]="LAPD", [2]="Camorra", [3]="Yakuza", [4]="Los Angeles Emergency", [5]="Reporter", [6]="FBI", [7]="Surenos", [8]="Army", [9]="Compton Families", [10]="Watts Soldiers", [11]="Terroristen" }

-- Jobs --
jobNames = {
["none"]="Arbeitslos",
["fischer"]="Fischer",
["trucker"]="Trucker",
["airport"]="Flughafen",
["wdealer"]="Waffendealer",
["mechaniker"]="Mechaniker",
["dealer"]="Drogendealer",
["taxifahrer"]="Taxifahrer",
["hitman"]="Hitman",
["hotdog"]="Hotdogverkaeufer",
["streetclean"]="Strassenreiniger",
["gabelstapler"]="Gabelstaplerfahrer",
["soldat"]="Soldat",
["pionier"]="Pionier",
["marine"]="Marine",
["air"]="Luftwaffe",
["tankcommander"]="Panzerkommandeur",
["special"]="Special Forces"
 }

-- Taxi --
taxiPricePerInterval = 30

-- Items --
foodImages = { 
 [1]="aid",
 [2]="beer",
 [3]="burger",
 [4]="snack",
 [5]="easteregg"
 }
foodName = {
 [1]="Erste Hilfe",
 [2]="Bier",
 [3]="Burger",
 [4]="Snack",
 [5]="Osterei"
 }
foodHeal = {
 [1]=100,
 [2]=0,
 [3]=5,
 [4]=1,
 [5]=100
}
foodHunger = {
 [1]=0,
 [2]=10,
 [3]=20,
 [4]=5,
 [5]=100
}

-- Waffen
meeleweapons = { [0]=true, [1]=true, [2]=true, [3]=true, [4]=true, [5]=true, [6]=true, [7]=true, [8]=true, [9]=true, [15]=true, [10]=true, [11]=true, [12]=true, [14]=true }
	-- Waffenpreise
		uncosts = 2
		
		schlagringe_price = 50
		baseball_price = 25
		knife_price = 75
		shovels_price = 20
		golfclub_price = 40
		pistol_price = 150
		sdpistol_price = 200
		pistolammo_price = 15
		eagle_price = 500
		eagleammo_price = 75
		shotgun_price = 250
		shotgunammo_price = 3
		mp_price = 270
		mpammo_price = 50
		ak_price = 450
		akammo_price = 50
		m_price = 550
		mammo_price = 75
		gewehr_price = 225
		gewehrammo_price = 2
		sgewehr_price = 750
		sgewehrammo_price = 7
		rakwerfer_price = 3000
		rak_price = 500
		spezgun_price = 150
		armor_price = 75

		schlagringcap = 20
		baseballcap = 20
		knifecap = 15
		shovelscap = 10
		pistolcap = 35
		sdpistolcap = 10
		pistolammocap = 125
		eaglecap = 5
		eagleammocap = 50
		shotguncap = 15
		shotgunammocap = 1200
		mpcap = 20
		mpammocap = 50
		akcap = 10
		akammocap = 20
		mcap = 5
		mammocap = 15
		gewehrcap = 10
		gewehrammocap = 150
		sgewehrcap = 3
		sgewehrammocap = 50
		raketenwerfercap = 3
		raketencap = 15
		spezguncap = 10
		
schlagringe_gunshop_price = math.floor ( schlagringe_price*uncosts )
baseball_gunshop_price = math.floor ( baseball_price*uncosts )
knife_gunshop_price = math.floor ( knife_price*uncosts )
shovels_gunshop_price = math.floor ( shovels_price*uncosts )
golfclub_gunshop_price = math.floor ( golfclub_price*uncosts )
pistol_gunshop_price = math.floor ( pistol_price*uncosts )
sdpistol_gunshop_price = math.floor ( sdpistol_price*uncosts )
pistolammo_gunshop_price = math.floor ( pistolammo_price*uncosts )
eagle_gunshop_price = math.floor ( eagle_price*uncosts )
eagleammo_gunshop_price = math.floor ( eagleammo_price*uncosts )
shotgun_gunshop_price = math.floor ( shotgun_price*uncosts )
shotgunammo_gunshop_price = math.floor ( shotgunammo_price*uncosts )
mp_gunshop_price = math.floor ( mp_price*uncosts )
mpammo_gunshop_price = math.floor ( mpammo_price*uncosts )
ak_gunshop_price = math.floor ( ak_price*uncosts )
akammo_gunshop_price = math.floor ( akammo_price*uncosts )
m_gunshop_price = math.floor ( m_price*uncosts )
mammo_gunshop_price = math.floor ( mammo_price*uncosts )
gewehr_gunshop_price = math.floor ( gewehr_price*uncosts )
gewehrammo_gunshop_price = math.floor ( gewehrammo_price*uncosts )
sgewehr_gunshop_price = math.floor ( sgewehr_price*uncosts )
sgewehrammo_gunshop_price = math.floor ( sgewehrammo_price*uncosts )
rakwerfer_gunshop_price = math.floor ( rakwerfer_price*uncosts )
rak_gunshop_price = math.floor ( rak_price*uncosts )
spezgun_gunshop_price = math.floor ( spezgun_price*uncosts )
armor_gunshop_price = math.floor ( armor_price*uncosts )

-- Skins

copskins = { [265]=true, [266]=true, [267]=true, [280]=true, [281]=true, [282]=true, [283]=true, [284]=true, [285]=true, [288]=true, [295]=true }

camorraSkins = { [111]=true, [112]=true, [113]=true, [124]=true, [125]=true, [126]=true, [127]=true, [272]=true, [290]=true, [308]=true }

yakuzaSkins = { [49]=true, [117]=true, [118]=true, [120]=true, [122]=true, [123]=true, [169]=true, [186]=true, [203]=true, [294]=true }
--------
medicSkins = { [276]=true, [275]=true, [274]=true, [70]=true }
----
mechanikSkins = {[268]=true, [305]=true, [50]=true,[67]=true, [309]=true }

newsreporterSkins = { [59]=true, [60]=true, [141]=true, [147]=true, [170]=true, [187]=true, [188]=true, [227]=true, [240]=true, [250]=true }

fbiSkins = { [17]=true, [163]=true, [164]=true, [165]=true, [166]=true, [228]=true, [285]=true, [286]=true }

surenosSkins = { [108]=true, [109]=true, [110]=true, [114]=true, [115]=true, [116]=true, [173]=true, [174]=true, [175]=true, [307]=true }

armySkins = { [61]=true, [71]=true, [73]=true, [179]=true, [255]=true, [285]=true, [287]=true, [312]=true }

comptonSkins = { [105]=true, [106]=true, [107]=true, [195]=true, [269]=true, [270]=true, [271]=true, [293]=true, [302]=true, [310]=true }

wattsSkins = { [13]=true, [21]=true, [102]=true, [103]=true, [104]=true, [296]=true, [297]=true }

terrorSkins = { [14]=true, [142]=true, [143]=true, [183]=true, [220]=true, [221]=true, [222]=true }

chickenskin = { [167]=true }

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end