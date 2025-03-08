ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('rewards:GivePlayerItems')
AddEventHandler('rewards:GivePlayerItems', function(attackerid, playerCoords)
    local xPlayer = ESX.GetPlayerFromId(attackerid)

    local function isPlayerInRewardZone(coords)
        for _, loc in ipairs(Config.RewardLocations) do
            if #(vector3(coords.x, coords.y, coords.z) - loc) < Config.RewardRadius then
                return true
            end
        end
        return false
    end

    local function getRandomRewardItems()
        local selectedItems = {}
        while #selectedItems < 2 do
            for _, item in ipairs(Config.RewardItems) do
                local rand = math.random(1, 100)
                if rand <= item.chance then
                    table.insert(selectedItems, item)
                    if #selectedItems == 2 then
                        break
                    end
                end
            end
        end
        return selectedItems
    end

    if xPlayer and isPlayerInRewardZone(playerCoords) then
        local itemsToGive = getRandomRewardItems()
        for _, item in ipairs(itemsToGive) do
            xPlayer.addInventoryItem(item.name, item.amount)
        end
    end
end)
