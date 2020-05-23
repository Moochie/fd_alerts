local AlertBlips = {}

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		
		if IsPedShooting(ped) and not IsPedCurrentWeaponSilenced(ped) then
			local Coords = GetEntityCoords(ped)
			local Street,Cross = GetStreetNameAtCoord(Coords.x, Coords.y, Coords.z)
			local StreetName = GetStreetNameFromHashKey(Street)
			local CrossName = GetStreetNameFromHashKey(Cross)
			
			Citizen.Wait(10000)
			TriggerServerEvent('FD_Alerts:GunShot', Coords, StreetName, CrossName)

		elseif IsPedJacking(PlayerPedId()) then
			local Vehicle = GetVehiclePedIsEntering(ped)
			local Colour,_ = GetVehicleColours(Vehicle)
			local Colour = Config.ColourNames[tostring(Colour)]
			local Class = GetVehicleClass(Vehicle)
			local Class = Config.ClassNames[tostring(Class)]
			local Coords = GetEntityCoords(ped)
			local Street,Cross = GetStreetNameAtCoord(Coords.x, Coords.y, Coords.z)
			local StreetName = GetStreetNameFromHashKey(Street)
			local CrossName = GetStreetNameFromHashKey(Cross)

			Citizen.Wait(5000)
			TriggerServerEvent('FD_Alerts:CarJack', Coords, StreetName, CrossName, Colour, Class)
		
		elseif DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) then

			local Vehicle = GetVehiclePedIsTryingToEnter(ped)
			local Lock = GetVehicleDoorLockStatus(Vehicle)
			if Lock == 7 then
				local Random = math.random(5)
				if Random == 1 then
					local Colour,_ = GetVehicleColours(Vehicle)
					local Colour = Config.ColourNames[tostring(Colour)]
					local Class = GetVehicleClass(Vehicle)
					local Class = Config.ClassNames[tostring(Class)]
					local Coords = GetEntityCoords(ped)
					local Street,Cross = GetStreetNameAtCoord(Coords.x, Coords.y, Coords.z)
					local StreetName = GetStreetNameFromHashKey(Street)
					local CrossName = GetStreetNameFromHashKey(Cross)

					Citizen.Wait(5000)
					TriggerServerEvent('FD_Alerts:CarJack', Coords, StreetName, CrossName, Colour, Class)
				end
			end
		end
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('FD_Alerts:AlertGun')
AddEventHandler('FD_Alerts:AlertGun', function(C)
	local Coords = C
	local Draw = true
	--print('Worked')
	for k,v in pairs(AlertBlips) do
		if v.Type == 'Gun' then
			local distance = GetDistanceBetweenCoords(Coords, v.Coords)
			if distance < 25 then
				if v.Status then
					Draw = false
					print('False')
				end
			end
		end
	end
	if Draw then
		DrawGunBlip(Coords)
	end
end)

RegisterNetEvent('FD_Alerts:AlertCar')
AddEventHandler('FD_Alerts:AlertCar', function(C)
	local Coords = C
	local Draw = true
	--print('Worked')
	for k,v in pairs(AlertBlips) do
		if v.Type == 'Car' then
			local distance = GetDistanceBetweenCoords(Coords, v.Coords)
			if distance < 25 then
				if v.Status then
					Draw = false
					print('False')
				end
			end
		end
	end
	if Draw then
		DrawCarBlip(Coords)
	end
end)

function DrawGunBlip(Coords)
	local blip = AddBlipForCoord(Coords)
	SetBlipSprite(blip, 119)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 2.0)
	SetBlipColour(blip, 1)
	SetBlipAlpha(blip, 150)
	SetBlipAsShortRange(blip, false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Gun Shot Reported')
	EndTextCommandSetBlipName(blip)
	AlertBlips[blip] =  {['Coords']=Coords, ['Type']='Gun', ['Status']=true}
	local scale = 2
	while colour ~= 0 do
		Citizen.Wait(60000)
		if scale == 2 then
			scale = 1.75
		elseif scale == 1.75 then
			scale = 1.50
		elseif scale == 1.50 then
			scale = 1.25
		elseif scale == 1.25 then
			SetBlipColour(blip, 0)
			scale = 1.0
			SetBlipAsShortRange(blip, true)
			AlertBlips[blip].Status = false
		end
		SetBlipScale(blip, scale)
	end
end

function DrawCarBlip(Coords)
	local blip = AddBlipForCoord(Coords)
	SetBlipSprite(blip, 488)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 2.0)
	SetBlipColour(blip, 1)
	SetBlipAlpha(blip, 150)
	SetBlipAsShortRange(blip, false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Car Jacking Reported')
	EndTextCommandSetBlipName(blip)
	AlertBlips[blip] =  {['Coords']=Coords, ['Type']='Car', ['Status']=true}
	local scale = 2
	while colour ~= 0 do
		Citizen.Wait(60000)
		if scale == 2 then
			scale = 1.75
		elseif scale == 1.75 then
			scale = 1.50
		elseif scale == 1.50 then
			scale = 1.25
		elseif scale == 1.25 then
			SetBlipColour(blip, 0)
			scale = 1.0
			SetBlipAsShortRange(blip, true)
			AlertBlips[blip].Status = false
		end
		SetBlipScale(blip, scale)
	end
end

function ClearBlips()
	for k,v in pairs(AlertBlips) do
		RemoveBlip(k)
	end
	AlertBlips = {}
end

RegisterCommand('alerts', function(src, args, raw)
	local src = source
	local action = args[1]
	if action == 'clear' then
		ClearBlips()
	end
end)