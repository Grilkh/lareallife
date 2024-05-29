function onResourceStart()
    txd = engineLoadTXD ("mods/bigfoot.txd")
    engineImportTXD (txd, 128)
	dff = engineLoadDFF("mods/bigfoot.dff",128)
	engineReplaceModel(dff, 128)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onResourceStart)