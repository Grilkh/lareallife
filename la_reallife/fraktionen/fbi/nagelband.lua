nagel =0

function create(source,command,rotation)
x,y,z = getElementPosition(source)
if isFBI or isArmy ( source ) and laGetElementData ( player, "rang" ) >= 3 then
if nagel == 0 then
nagel=1

nagelband = createObject(2892,x,y,z-1)
setElementData ( nagelband, "nagel", "nagel")
setElementID(nagelband,"20","20")
if (rotation) then
setObjectRotation (nagelband,0,0,rotation)
hammer1 = createColCircle(x-5,y,1)
hammer2 = createColCircle(x-4,y,1)
hammer3 = createColCircle(x-3,y,1)
hammer4 = createColCircle(x-2,y,1)
hammer5 = createColCircle(x-1,y,1)
hammer6 = createColCircle(x,y,1)
hammer7 = createColCircle(x+1,y,1)
hammer8 = createColCircle(x+2,y,1)
hammer9 = createColCircle(x+3,y,1)
hammer10 = createColCircle(x+4,y,1)
hammer11 = createColCircle(x+5,y,1)
else
hammer1 = createColCircle(x,y-1,1)
hammer2 = createColCircle(x,y-2,1)
hammer3 = createColCircle(x,y-3,1)
hammer4 = createColCircle(x,y-4,1)
hammer5 = createColCircle(x,y-5,1)
hammer6 = createColCircle(x,y,1)
hammer7 = createColCircle(x,y+1,1)
hammer8 = createColCircle(x,y+2,1)
hammer9 = createColCircle(x,y+3,1)
hammer10 = createColCircle(x,y+4,1)
hammer11 = createColCircle(x,y+5,1)
end
else outputChatBox("Du kannst nur ein Nagelband legen! /remove um das Alte zu entfernen!",source, 125, 125, 0 )
end
else outputChatBox("Du bist nicht befugt!",source, 125, 0, 0 )
end
end
addCommandHandler("nagelband",create)




function destroy(source)
nagel = 0
destroyElement(getElementByID ( "20" ))
destroyElement(hammer1)
destroyElement(hammer2)
destroyElement(hammer3)
destroyElement(hammer4)
destroyElement(hammer5)
destroyElement(hammer6)
destroyElement(hammer7)
destroyElement(hammer8)
destroyElement(hammer9)
destroyElement(hammer10)
destroyElement(hammer11)

end
addCommandHandler("remove",destroy)

function damage(source,hammer1,hammer2,hammer3,hammer4,hammer5,hammer6,hammer7,hammer8,hammer9,hammer10,hammer11)

if isElementWithinColShape(source,hammer1) or isElementWithinColShape(source,hammer2) or isElementWithinColShape(source,hammer3) or isElementWithinColShape(source,hammer4) or isElementWithinColShape(source,hammer5) or isElementWithinColShape(source,hammer6)  or
isElementWithinColShape(source,hammer7)  or isElementWithinColShape(source,hammer8) or  isElementWithinColShape(source,hammer9)or  isElementWithinColShape(source,hammer10)or  isElementWithinColShape(source,hammer11)then
if isPedInVehicle(source) then
vehicle = getPedOccupiedVehicle(source)
setVehicleWheelStates(vehicle, 1, 1, 1, 1)
end
end
end
addEventHandler( "onElementColShapeHit", getRootElement(), damage)
