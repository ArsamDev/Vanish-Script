ESX = nil


Citizen.CreateThread(function()
 while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
 end
end)

player = {
    visible = true,
    group = 'user'
}
		
RegisterNetEvent("getGroup:Return")
AddEventHandler("getGroup:Return", function(group)
    player.group = group
    if player.visible == true and player.group ~= 'user' then
        SetEntityVisible(PlayerPedId(), false, 0)
        ESX.ShowNotification("Du bist jetzt Unsichtbar!", "info")
        player.visible = false
    elseif player.group ~= 'user' then
        SetEntityVisible(PlayerPedId(), true, 0)
        ESX.ShowNotification("Du bist nicht mehr Unsichtbar!", "info")
        player.visible = true
    else
        ESX.ShowNotification("Du hast dazu keine Berechtigungen!", "error")
    end
end)

RegisterCommand("v", function(source, args, rawCommand)
    local playerid = GetPlayerServerId(PlayerId())
    TriggerServerEvent('getGroup', playerid)
    
end, false)
