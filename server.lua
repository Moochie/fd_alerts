local Cops = {}

RegisterServerEvent('FD_Alerts:GunShot')
AddEventHandler('FD_Alerts:GunShot', function(C,SN,CN)
	local src = source
	local Coords = C
	local Street = SN
	local Cross = CN
	local Cops = exports['drp_police']:CopsOnlineChecker()
	if Config.CopsTrigger then
		for k,v in pairs(Cops) do
			TriggerClientEvent('FD_Alerts:AlertGun', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Shots Fired", tostring("Shots fired at "..Street..', '..Cross), 5000, false, "rightCenter")
		end
	else
		local IsCop = false
		for k,v in pairs(Cops) do
			if src == v.src then
				IsCop = true
			end
		end
		if not IsCop then
			for k,v in pairs(Cops) do
				TriggerClientEvent('FD_Alerts:AlertGun', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Shots Fired", tostring("Shots fired at "..Street..', '..Cross), 5000, false, "rightCenter")
			end
		end
	end
end)

RegisterServerEvent('FD_Alerts:CarJack')
AddEventHandler('FD_Alerts:CarJack', function(C,SN,CN,CO,CL)
	local src = source
	local Coords = C
	local Street = SN
	local Cross = CN
	local Colour = CO
	local Class = CL
	local Cops = exports['drp_police']:CopsOnlineChecker()
	if Config.CopsTrigger then
		for k,v in pairs(Cops) do
			TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Car Jacking", tostring(Street..', '..Cross..'. '..Colour..' '..Class), 7500, false, "rightCenter")
		end
	else
		local IsCop = false
		for k,v in pairs(Cops) do
			if src == v.src then
				IsCop = true
			end
		end
		if not IsCop then
			for k,v in pairs(Cops) do
				TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
				TriggerClientEvent("DRP_Core:Error", v.src, "Car Jacking", tostring(Street..', '..Cross..'. '..Colour..' '..Class), 7500, false, "rightCenter")
			end
		end
	end
end)

RegisterServerEvent('FD_Alerts:CarJack')
AddEventHandler('FD_Alerts:CarJack', function(C,SN,CN,CO,CL)
	local src = source
	local Coords = C
	local Street = SN
	local Cross = CN
	local Colour = CO
	local Class = CL
	local Cops = exports['drp_police']:CopsOnlineChecker()
	if Config.CopsTrigger then
		for k,v in pairs(Cops) do
			TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Car Jacking", tostring(Street..', '..Cross..'. '..Colour..' '..Class), 7500, false, "rightCenter")
		end
	else
		local IsCop = false
		for k,v in pairs(Cops) do
			if src == v.src then
				IsCop = true
			end
		end
		if not IsCop then
			for k,v in pairs(Cops) do
				TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
				TriggerClientEvent("DRP_Core:Error", v.src, "Car Jacking", tostring(Street..', '..Cross..'. '..Colour..' '..Class), 7500, false, "rightCenter")
			end
		end
	end
end)

RegisterServerEvent('FD_Alerts:HouseRobbery')
AddEventHandler('FD_Alerts:HouseRobbery', function(C)
	local Coords = vector3(C.x, C.y, C.z)
	local Cops = exports['drp_police']:CopsOnlineChecker()

	for k,v in pairs(Cops) do
		TriggerClientEvent('FD_Alerts:AlertHouse', v.src, Coords)
		TriggerClientEvent("DRP_Core:Error", v.src, "Home Invasion", 'Active House Alarm', 7500, false, "rightCenter")
	end
end)