ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Function to handle tow requests
RegisterServerEvent('towService:requestTow')
AddEventHandler('towService:requestTow', function(plate, x, y, z)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        MySQL.Async.execute('INSERT INTO tow_requests (player_id, vehicle_plate, location_x, location_y, location_z) VALUES (@player_id, @vehicle_plate, @location_x, @location_y, @location_z)', {
            ['@player_id'] = xPlayer.identifier,
            ['@vehicle_plate'] = plate,
            ['@location_x'] = x,
            ['@location_y'] = y,
            ['@location_z'] = z
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('esx:showNotification', _source, 'Tow request sent!')
            else
                TriggerClientEvent('esx:showNotification', _source, 'Failed to send tow request!')
            end
        end)
    end
end)

-- Function to handle accepting a tow
RegisterServerEvent('towService:acceptTow')
AddEventHandler('towService:acceptTow', function(towId)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        MySQL.Async.execute('UPDATE tow_requests SET status = "accepted" WHERE id = @towId', {
            ['@towId'] = towId
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('esx:showNotification', _source, 'Tow request accepted!')
            else
                TriggerClientEvent('esx:showNotification', _source, 'Failed to accept tow request!')
            end
        end)
    end
end)

-- Function to handle completing a tow
RegisterServerEvent('towService:completeTow')
AddEventHandler('towService:completeTow', function(towId)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        MySQL.Async.execute('UPDATE tow_requests SET status = "completed" WHERE id = @towId', {
            ['@towId'] = towId
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('esx:showNotification', _source, 'Tow request completed!')
            else
                TriggerClientEvent('esx:showNotification', _source, 'Failed to complete tow request!')
            end
        end)
    end
end)