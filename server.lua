ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('getGroup')
AddEventHandler('getGroup', function (id)
    
    xPlayer = ESX.GetPlayerFromId(id)
    group = xPlayer.getGroup()
    TriggerClientEvent("getGroup:Return", id, group)
    
end)



