mouseSet = "CGUI-Images"
mouseName = "OUT"

_guiCreateButton = guiCreateButton
_guiCreateWindow = guiCreateWindow
_guiCreateMemo = guiCreateMemo
_guiCreateEdit = guiCreateEdit
_guiCreateStaticImage = guiCreateStaticImage
_guiCreateLabel = guiCreateLabel
_guiCreateCheckBox = guiCreateCheckBox
_guiCreateComboBox = guiCreateComboBox
_guiCreateGridList = guiCreateGridList
_guiCreateProgressBar = guiCreateProgressBar
_guiCreateRadioButton = guiCreateRadioButton
_guiCreateScrollBar = guiCreateScrollBar
_guiCreateScrollPane = guiCreateScrollPane
_guiCreateTabPanel = guiCreateTabPanel
_guiCreateTab = guiCreateTab
_guiSetInputEnabled = guiSetInputEnabled

function guiSetFontSize ( element, size )

	return guiSetProperty ( element, "", size )
end

function setHudLessModeEnabled ( bool )

	bool = not bool
	showChat ( bool )
	guiSetVisible ( gLabels["InfoTextForum"], bool )
	guiSetVisible ( gLabels["InfoTextForumShadow"], bool )
	setPlayerHudComponentVisible ( "radar", bool )
end

function guiSetInputEnabled ( bool )

	toggleControl ( "chatbox", bool )
end

function slowDrawText ( string )

	local length = #string
	local totalTime = length * timeForEveryLetter + 2500
	addEventHandler ( "onClientRender", getRootElement(), slowDrawText_render )
	curTextDrawString = ""
	for i = 1, length do
		setTimer ( redoDrawString, i * timeForEveryLetter + 1, 1, string, i )
	end
	setTimer ( removeLetterDraw, totalTime, 1 )
end

function redoDrawString ( string, i )
	curTextDrawString = string.sub ( string, 1, i )
end

function removeLetterDraw ()
	removeEventHandler ( "onClientRender", getRootElement(), slowDrawText_render )
end

function slowDrawText_render ()
	
	left, top, right, bottom = 0, 0, screenwidth, screenheight
	dxDrawText ( curTextDrawString, left, top, right, bottom, tocolor ( 255, 255, 255, 255 ), 1.0, "bankgothic", "center", "center", false, false, true )
end