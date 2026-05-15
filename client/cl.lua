local spawnedbenches = {}
local ESX = exports['es_extended']:getSharedObject()
Citizen.CreateThread(function()
    for i, station in ipairs(dnj.craftings) do
        lib.requestModel(station.model)

        local prop = CreateObject(station.model, station.coords.x, station.coords.y, station.coords.z - 1.0, false, false, false)
        
        SetEntityHeading(prop, station.heading)
        FreezeEntityPosition(prop, true)
        SetEntityAsMissionEntity(prop, true, true)

        table.insert(spawnedbenches, prop)

        exports.ox_target:addLocalEntity(prop, {
            {
                name = 'crafting_' .. i,
                icon = station.targeticon,
                label = station.targetlabel,
                distance = 2.0, 
                onSelect = function()
                    opencrafting(i, station)
                end,
                canInteract = function()
                    if station.reqjob then
                        local playerdata = ESX.GetPlayerData()
                        if playerdata.job and playerdata.job.name == station.reqjob then
                            return true
                        end
                        return false
                    end
                    return true
                end
            }
        })
        
        SetModelAsNoLongerNeeded(station.model)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for _, prop in ipairs(spawnedbenches) do
            if DoesEntityExist(prop) then
                DeleteEntity(prop)
            end
        end
    end
end)

function opencrafting(stationindex, station)
    local options = {}

    for recipeindex, recipe in ipairs(station.recipes) do
        local description = "Potřebuješ:\n"
        for _, req in pairs(recipe.reqitems) do
            description = description .. ("%sx %s\n"):format(req.count, req.label)
        end

        table.insert(options, {
            title = recipe.resultlabel,
            description = description,
        --    image = "nui://ox_inventory/web/images/" .. recipe.iconname .. ".png",
            icon = "nui://ox_inventory/web/images/" .. recipe.iconname .. ".png",
            onSelect = function()
                craft(stationindex, recipeindex, recipe)
            end
        })
    end

    lib.registerContext({
        id = 'cmenu' .. stationindex,
        title = station.targetlabel,
        options = options
    })

    lib.showContext('cmenu' .. stationindex)
end

function craft(stationindex, recipeindex, recipe)
    local crafttoken = lib.callback.await('dnjv2:checkitems', false, stationindex, recipeindex)
    
    if not crafttoken then
        lib.notify({ description = 'Nemáš potřebný věci!', type = 'error' })
        return
    end

    if lib.progressBar({
        duration = recipe.crafttime,
        label = 'Craftíš: ' .. recipe.resultlabel,
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true },
        anim = { dict = 'mini@repair', clip = 'fixing_a_ped' }
    }) then
        local success, msg = lib.callback.await('dnjv2:craft', false, stationindex, recipeindex, crafttoken)
        if success then
            lib.notify({  description = msg, type = 'success' })
        else
            lib.notify({  description = msg, type = 'error' })
        end
    else

        lib.notify({  description = 'Něco se pokazilo...', type = 'error' })
    end
end