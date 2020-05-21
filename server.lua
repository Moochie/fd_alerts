local Cops = {}

RegisterServerEvent('FD_Alerts:GunShot')
AddEventHandler('FD_Alerts:GunShot', function(C,SN,CN)
	local src = source
	local Coords = C
	local Street = SN
	local Cross = CN
	local Cops = exports['drp_police']:CopsOnlineChecker()
	for k,v in pairs(Cops) do
		if Config.CopsTrigger then
			TriggerClientEvent('FD_Alerts:AlertGun', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Shots Fired", tostring("Shots fired at "..Street..', '..Cross), 5000, false, "rightCenter")
		else 
			if src ~= v.src then
				TriggerClientEvent('FD_Alerts:AlertGun', v.src, Coords, Steet)
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
	for k,v in pairs(Cops) do
		if Config.CopsTrigger then
			TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
			TriggerClientEvent("DRP_Core:Error", v.src, "Car Jacking", tostring(Street..', '..Cross..'. '..Colour..' '..Class), 7500, false, "rightCenter")
		else 
			if src ~= v.src then
				TriggerClientEvent('FD_Alerts:AlertCar', v.src, Coords)
			end
		end
		
	end
end)