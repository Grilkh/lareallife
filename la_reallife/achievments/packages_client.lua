function hidePackages_func (package)

	setElementDimension ( package, 1 )
end
addEvent ( "hidePackages", true )
addEventHandler ( "hidePackages", getRootElement(), hidePackages_func )