AddEventHandler('gameEventTriggered', function(name, data)
    if name == "CEventNetworkEntityDamage" then
        local victim = tonumber(data[1])
        local attacker = tonumber(data[2])
        local victimDied = tonumber(data[6]) == 1 and true or false
        local PPed = PlayerPedId()
        if victim == attacker or victim ~= PPed or not IsPedAPlayer(victim) or not IsPedAPlayer(attacker) then return end
        if victim == PPed and victimDied then
            local attackerid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker))
            local playerCoords = GetEntityCoords(PPed)
            TriggerServerEvent('rewards:GivePlayerItems', attackerid, playerCoords)
        end
    end
end)
