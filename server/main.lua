ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('armor', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('res1st-bulletproof-vest:useItem', source, 'armor')
	xPlayer.removeInventoryItem('armor', 1)

	Citizen.Wait(10000)
end)