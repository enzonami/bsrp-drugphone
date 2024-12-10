
--🅱🆂🆁🅿-⊂(▀¯▀⊂ )🇧 🇱 🇦 🇨 🇰 - 🇸 🇭 🇦 🇩 🇪 🇸 ⊂(▀¯▀⊂ )🅱🆂🆁🅿--

local drugSales = {
    weed = 0,
    coke = 0,
    meth = 0
}

local playerCooldowns = {} -- Table to track cooldowns for each player

local function calculatePrice(basePrice, sales)
    if not Config.DynamicPricing then
        return basePrice -- If dynamic pricing is disabled, return the base price
    end
    local adjustment = math.max(1 - (sales / 10) * 0.01, 0.5)
    return math.floor(basePrice * adjustment)
end

local function updateDrugPrice(drug)
    local basePrice = Config.Drugs[drug].basePrice
    local sales = drugSales[drug] or 0
    local newPrice = calculatePrice(basePrice, sales)
    Config.Drugs[drug].currentPrice = newPrice
    print(string.format("Updated price for %s: $%d", drug, newPrice))
end

RegisterNetEvent('bsrp-drugphone:sellDrugsWithQuantities', function(drugQuantities)
    local playerId = source
    local currentTime = os.time()

    -- Check if the player is on cooldown
    if playerCooldowns[playerId] and (currentTime - playerCooldowns[playerId]) < Config.Cooldown then
        local remaining = Config.Cooldown - (currentTime - playerCooldowns[playerId])
        TriggerClientEvent('ox_lib:notify', playerId, { 
            type = 'error', 
            description = string.format("Please wait %d seconds before selling again.", remaining) 
        })
        return
    end

    -- Process the drug sale
    local sold = false
    for drug, quantity in pairs(drugQuantities) do
        if quantity > 0 then
            local playerCount = exports.ox_inventory:Search(playerId, 'count', drug)
            if playerCount >= quantity then
                local price = Config.Drugs[drug].currentPrice or Config.Drugs[drug].basePrice
                local payout = price * quantity
                exports.ox_inventory:RemoveItem(playerId, drug, quantity)
                exports.ox_inventory:AddItem(playerId, Config.Currency, payout)

                drugSales[drug] = (drugSales[drug] or 0) + quantity
                if Config.DynamicPricing then
                    updateDrugPrice(drug)
                end

                TriggerClientEvent('ox_lib:notify', playerId, { 
                    type = 'success', 
                    description = string.format("Sold %d %s for $%d each!", quantity, drug, price) 
                })
                sold = true
            else
                TriggerClientEvent('ox_lib:notify', playerId, { 
                    type = 'error', 
                    description = string.format("You only have %d %s!", playerCount, drug) 
                })
            end
        end
    end

    -- Set the cooldown if the sale was successful
    if sold then
        playerCooldowns[playerId] = os.time()
    else
        TriggerClientEvent('ox_lib:notify', playerId, { type = 'error', description = 'No drugs were sold.' })
    end
end)

-- Server-side thread for restarting the resource after the defined time
CreateThread(function()
    while true do
        Wait(Config.RestartTime * 1000) -- Convert seconds to milliseconds
        TriggerClientEvent('bsrp-drugphone:resetNPC', -1) -- Reset NPC for all clients
        print('[INFO] NPC and waypoints reset after restart time elapsed.')
    end
end)
