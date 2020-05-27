ESX = nil

-- ESX crap
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('res1st-bulletproof-vest:useItem')
AddEventHandler('res1st-bulletproof-vest:useItem', function(itemName)
	if itemName == 'armor' then
		local animdict = 'oddjobs@basejump@ig_15'
		local animname = 'puton_parachute'
		local playerped = PlayerPedId()

		-- Start the animation
		ESX.Streaming.RequestAnimDict(animdict, function()
			TaskPlayAnim(playerped, animdict, animname, 8.0, -8.0, -1, 0, 0, false, false, false)
		
		-- Start the progress bar and set the armor to FULL.
		exports['progressBars']:startUI(5000, "Nasazuji vestu...")
		Citizen.Wait(5000)
		SetPedArmour(playerped, 100)

			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerped, animdict, animname, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end

--			ESX.ShowNotification("Nasadil jsi si neprustrelnou vestu.", true, true, nil)
			exports['mythic_notify']:DoHudText('inform', 'Nasadil jsi si neprůstřelnou vestu.')
			print("Notifikace")
			print(GetPedArmour(playerped))
		end)
	end
end)

-- Made by bulva2			