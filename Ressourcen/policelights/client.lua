function clientsetup (resource)
	loadtheshield = setTimer ( shieldload, 3000, 1 )
	bindKey ("j", "down", "licht", "" )
end

addEventHandler ( "onClientResourceStart",getRootElement() , clientsetup)

addEvent("Clientshieldload",true)
function shieldload ()
	txd_shield = engineLoadTXD("riot_shield.txd")
	engineImportTXD(txd_shield,1631)
	col_shield = engineLoadCOL("riot_shield.col")
	dff_shield = engineLoadDFF("riot_shield.dff", 0 )
	engineReplaceCOL(col_shield,1631)
	engineReplaceModel(dff_shield,1631)
end

addEventHandler( "Clientshieldload", getRootElement(), shieldload )