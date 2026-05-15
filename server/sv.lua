local oxinv = exports.ox_inventory
local ESX = exports['es_extended']:getSharedObject()

local actkns = {}

local function g()
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local token = ''
    for i = 1, 32 do
        local rand = math.random(1, #chars)
        token = token .. string.sub(chars, rand, rand)
    end
    return token
end

lib.callback.register('dnjv2:checkitems', function(source, stationindex, recipeindex)
    local src = source
    local station = dnj.craftings[stationindex]
    if not station then return false end
    local recipe = station.recipes[recipeindex]
    if not recipe then return false end

    for _, req in pairs(recipe.reqitems) do
        local itemcount = oxinv:GetItem(src, req.item, nil, true)
        if itemcount < req.count then
            return false
        end
    end

    local token = g()
    actkns[src] = token

    return token 
end)

lib.callback.register('dnjv2:craft', function(source, stationindex, recipeindex, ctkn)
    local src = source

    if not ctkn or actkns[src] ~= ctkn then
        return false, "Wow! To nejde!!!"
    end

    actkns[src] = nil

    local station = dnj.craftings[stationindex]
    if not station then return false, "To nejde..." end
    local recipe = station.recipes[recipeindex]
    if not recipe then return false, "To nejde..." end

    if station.reqjob then
        local xpl = ESX.GetPlayerFromId(src)
        if xpl.job.name ~= station.reqjob then
            return false, "To nejde..."
        end
    end

    for _, req in pairs(recipe.reqitems) do
        local itemcount = oxinv:GetItem(src, req.item, nil, true)
        if itemcount < req.count then
            return false, "Něco se pokazilo!"
        end
    end

    for _, req in pairs(recipe.reqitems) do
        oxinv:RemoveItem(src, req.item, req.count)
    end

    oxinv:AddItem(src, recipe.resultitem, 1)

    return true, "Vycraftil jsi : " .. recipe.resultlabel
end)