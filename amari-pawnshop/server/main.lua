local QBCore = exports['qb-core']:GetCoreObject()
local playerPeds = {}

RegisterNetEvent('amari-pawnshop:Server:TriggerNotification')
AddEventHandler('amari-pawnshop:Server:TriggerNotification', function(playerId, msg, type, length)
    TriggerClientEvent('amari-pawnshop:Client:CustomNotify', playerId, msg, type, length)
end)


RegisterServerEvent('amari-pawnshop:server:Craft')
AddEventHandler('amari-pawnshop:server:Craft', function(itemHash, materials)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player then
        local canCraft = true
        for _, material in ipairs(materials) do
            if not player.Functions.GetItemByName(material.item) or player.Functions.GetItemByName(material.item).amount < material.amount then
                canCraft = false
                TriggerClientEvent('QBCore:Notify', src, 'Not enough ' .. QBCore.Shared.Items[material.item].label, 'error')
                break
            end
        end
        
        if canCraft then
            for _, material in ipairs(materials) do
                player.Functions.RemoveItem(material.item, material.amount)
            end
            local added = player.Functions.AddItem(itemHash, 1)
            if added then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemHash], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'Failed to craft item.', 'error')
            end
        end
    end
end)

RegisterServerEvent('amari-pawnshop:Server:Removemats')
AddEventHandler('amari-pawnshop:Server:Removemats', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName(item) and Player.Functions.GetItemByName(item).amount >= amount then
            Player.Functions.RemoveItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Not enough ' .. QBCore.Shared.Items[item].label, 'error')
        end
    end
end)

QBCore.Functions.CreateCallback('amari-pawnshop:server:Materials', function(source, cb, materials)
    local src = source
    local item = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            item = item + 1
            if item == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)

QBCore.Functions.CreateCallback('amari-pawnshop:server:HasItem', function(source, cb, itemKey)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local item = Player.Functions.GetItemByName(itemKey)
        if item and item.amount > 0 then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)


RegisterNetEvent("amari-pawnshop:Server:Billing", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == Config.Job then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent("qb-phone:RefreshPhone", billed.PlayerData.source)
                    TriggerEvent('amari-pawnshop:Server:TriggerNotification', source, Language.Notify.Send, 'success', 5000)
                    TriggerEvent('amari-pawnshop:Server:TriggerNotification', billed.PlayerData.source, Language.Notify.InvoiceReceived, 'info', 5000) -- Assuming 'info' is the type
                else
                    TriggerEvent('amari-pawnshop:Server:TriggerNotification', source, Language.Notify.HigherValue, 'error', 5000)
                end
            else
                TriggerEvent('amari-pawnshop:Server:TriggerNotification', source, Language.Notify.InvoiceOwn, 'error', 5000)
            end
        else
            TriggerEvent('amari-pawnshop:Server:TriggerNotification', source, Language.Notify.PlayerUnavailable, 'error', 5000)
        end
    else
        TriggerEvent('amari-pawnshop:Server:TriggerNotification', source, Language.Notify.NoPermission, 'error', 5000)
    end
end)

------------------------------------BREAK ITEMS--------------------------------------

RegisterServerEvent('amari-pawnshop:server:BreakItem')
AddEventHandler('amari-pawnshop:server:BreakItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        Player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")

        for _, materialData in ipairs(Config.BreakerItems[item]) do
            Player.Functions.AddItem(materialData.material, materialData.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[materialData.material], "add")
        end
    end
end)

------------------------------------MELT ITEMS--------------------------------------

--------- FOR SOME WEIRD REASON THESE EVENTS ONLY WORKS IF I NAME THE MELTING ZONES TO BreakerZones2 instead of MeltingZone ----------

RegisterServerEvent('amari-pawnshop:server:BreakItem2')
AddEventHandler('amari-pawnshop:server:BreakItem2', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        Player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")

        for _, materialData in ipairs(Config.BreakerItems2[item]) do
            Player.Functions.AddItem(materialData.material, materialData.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[materialData.material], "add")
        end
    end
end)

-----------------------------------MONEYWASH-----------------------------------------

QBCore.Functions.CreateCallback('amari-pawnshop:server:HasMarkedBills', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local markedBills = Player.Functions.GetItemByName("markedbills")
    if markedBills and markedBills.amount > 0 then
        cb(true, markedBills.amount)
    else
        cb(false)
    end
end)

RegisterServerEvent('amari-pawnshop:server:WashMoney')
AddEventHandler('amari-pawnshop:server:WashMoney', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local markedBills = Player.Functions.GetItemByName("markedbills")
    if markedBills and markedBills.amount >= amount then
        local totalValue = amount * (markedBills.info.worth or 100)
        Player.Functions.RemoveItem("markedbills", amount)
        Player.Functions.AddMoney('cash', totalValue)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "remove")
        TriggerClientEvent('QBCore:Notify', src, 'You washed ' .. amount .. ' marked bills for $' .. totalValue, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough marked bills', 'error')
    end
end)


