local maindomane = "army.la"
 Domanes["www.army.de"]=maindomane
 Domanes["www.army.com"]=maindomane
 Domanes["www.army.net"]=maindomane
 Domanes["www.army.org"]=maindomane
 Domanes["army"]=maindomane
 
 function showarmy_mail()
	showEmailSpecialWindow ( true, "admin@army.de" )
 end 
 
function army_func ()
img = createBasicPage ( "green" )
gImage["army2"] = guiCreateStaticImage(56,83,279,215,"images/colors/c_grey.jpg",false,img)
gImage["army3"] = guiCreateStaticImage(0,295,400,5,"images/colors/c_grey.jpg",false,img)
gImage["army4"] = guiCreateStaticImage(395,0,5,297,"images/colors/c_grey.jpg",false,img)
gImage["army5"] = guiCreateStaticImage(0,0,5,297,"images/colors/c_grey.jpg",false,img)
gImage["army6"] = guiCreateStaticImage(-1,0,399,7,"images/colors/c_grey.jpg",false,img)
gImage["army7"] = guiCreateStaticImage(56,14,279,49,"images/colors/c_grey.jpg",false,img)
gImage["army8"] = guiCreateStaticImage(2,71,397,5,"images/colors/c_grey.jpg",false,img)
gImage["army9"] = guiCreateStaticImage(44,3,5,294,"images/colors/c_grey.jpg",false,img)
gImage["army10"] = guiCreateStaticImage(342,2,5,297,"images/colors/c_grey.jpg",false,img)
gButton["army1"] = guiCreateButton(137,269,167,23,"Kontaktiere diese Fraktion",false,img)
gImage["army11"] = guiCreateStaticImage(97,268,40,26,"images/internet/email.png",false,img)
gMemo["army1"] = guiCreateMemo(6,88,389,178,"Herzlich Willkommen auf der Homepage der Army,\n\nWir sind für besonders schwere Verbrecher zuständig.\nEs gibt bei uns viele verschiedene Ränge und Klassen.\nWir bilden ausserdem die GWD-Bewerber aus.\nSie brauchen den GWD um in manchen Fraktionen wie z.b. dem SFPD oder den FBI beizutreten. Wenn sie eine gute GWD Note (90%+) erreichen, sind sie sogar qualifiziert der Army als Soldat beizutreten.\n\nBewerben sie sich für den GWD im Forum !",false,img)
gLabel["army1"] = guiCreateLabel(78,13,241,52,"army",false,img)
guiLabelSetColor(gLabel["army1"],0,0,0)
guiLabelSetVerticalAlign(gLabel["army1"],"top")
guiLabelSetHorizontalAlign(gLabel["army1"],"left",false)
guiSetFont(gLabel["army1"],"sa-header")
addEventHandler("onClientGUIClick", gButton["army1"], showarmy_mail, false)
end
addEvent ( "army.la", true )
addEventHandler ( "army.la", getRootElement(), army_func )