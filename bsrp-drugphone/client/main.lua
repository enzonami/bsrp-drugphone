
--🅱🆂🆁🅿-⊂(▀¯▀⊂ )🇧 🇱 🇦 🇨 🇰 - 🇸 🇭 🇦 🇩 🇪 🇸 ⊂(▀¯▀⊂ )🅱🆂🆁🅿--

local spawnedNPC = nil
local npcBlip = nil

-- Play selling animation
function playSellingAnimation()
    local ped = PlayerPedId()
    local anim = Config.Animations.selling

    RequestAnimDict(anim.dict)
    while not HasAnimDictLoaded(anim.dict) do
        Wait(100)
    end

    TaskPlayAnim(ped, anim.dict, anim.clip, 8.0, -8.0, -1, 49, 0, false, false, false)
    Wait(anim.duration)
    ClearPedTasks(ped)
end

-- Open input dialog for selling drugs with inventory display
local function sellDrugs()
    local inputs = {}
    local inventory = {}

    -- Fetch player's current inventory
    for drug, config in pairs(Config.Drugs) do
        inventory[drug] = exports.ox_inventory:Search('count', drug) or 0 -- Get current quantity
    end

    -- Generate input fields for each drug
    for drug, config in pairs(Config.Drugs) do
        table.insert(inputs, {
            name = drug,
            label = string.format("Quantity of %s (You have: %d)", drug, inventory[drug]),
            type = "number",
            default = 0
        })
    end

    -- Show input dialog
    local result = lib.inputDialog("Sell Drugs", inputs)
    if not result then return end -- Player canceled the dialog

    -- Send the input to the server
    local drugQuantities = {}
    for i, drug in ipairs(inputs) do
        drugQuantities[drug.name] = tonumber(result[i]) or 0
    end

    TriggerServerEvent('bsrp-drugphone:sellDrugsWithQuantities', drugQuantities)
end

-- Trigger this function when the player interacts with the dealer
RegisterNetEvent('bsrp-drugphone:openSellDialog', sellDrugs)

-- Spawn an NPC
local function spawnDealer(location, model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(100) end

    local npc = CreatePed(4, model, location.x, location.y, location.z, location.w, false, true)
    SetEntityInvincible(npc, true)
    TaskStartScenarioInPlace(npc, Config.NPC.idleAnimations[1], 0, true) -- Default idle animation

    if Config.NPC.blip.enabled then
        npcBlip = AddBlipForEntity(npc)
        SetBlipSprite(npcBlip, Config.NPC.blip.sprite)
        SetBlipScale(npcBlip, Config.NPC.blip.scale)
        SetBlipColour(npcBlip, Config.NPC.blip.color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.NPC.blip.name)
        EndTextCommandSetBlipName(npcBlip)
    end

    -- Set waypoint to NPC
    SetNewWaypoint(location.x, location.y)

    spawnedNPC = npc
end

-- Reset NPC
RegisterNetEvent('bsrp-drugphone:resetNPC', function()
    if spawnedNPC then
        DeleteEntity(spawnedNPC)
        spawnedNPC = nil
    end
    if npcBlip then
        RemoveBlip(npcBlip)
        npcBlip = nil
    end
    ClearGpsPlayerWaypoint()
end)

-- Player interaction loop
CreateThread(function()
    while true do
        Wait(0)
        if spawnedNPC then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local npcCoords = GetEntityCoords(spawnedNPC)
            local dist = #(playerCoords - npcCoords)

            if dist <= Config.NPC.interactionDistance then
                if IsControlJustPressed(0, 38) then
                    TriggerEvent('bsrp-drugphone:openSellDialog') -- Open the input dialog
                end
            end
        end
    end
end)

-- Clear Waypoint Command
RegisterCommand('clearWaypoint', function()
    ClearGpsPlayerWaypoint()
    TriggerEvent('ox_lib:notify', { type = 'inform', description = 'Waypoint cleared!' })
end)

-- Spawn NPC Command
RegisterCommand('spawnDealer', function()
    local location = Config.NPC.locations[math.random(#Config.NPC.locations)]
    spawnDealer(location, Config.NPC.model)
end)
