ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- Function to request a tow
function RequestTow()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local plate = GetVehicleNumberPlateText(vehicle)

    if vehicle == 0 then
        ESX.ShowNotification('You are not in a vehicle!')
        return
    end

    TriggerServerEvent('towService:requestTow', plate, coords.x, coords.y, coords.z)
end

-- Function to accept a tow
function AcceptTow(towId)
    TriggerServerEvent('towService:acceptTow', towId)
end

-- Function to complete a tow
function CompleteTow(towId)
    TriggerServerEvent('towService:completeTow', towId)
end

-- Register command for requesting a tow
RegisterCommand('requesttow', function()
    RequestTow()
end, false)

-- Register command for accepting a tow
RegisterCommand('accepttow', function(source, args)
    if args[1] then
        AcceptTow(tonumber(args[1]))
    else
        ESX.ShowNotification('Please provide a tow ID!')
    end
end, false)

-- Register command for completing a tow
RegisterCommand('completetow', function(source, args)
    if args[1] then
        CompleteTow(tonumber(args[1]))
    else
        ESX.ShowNotification('Please provide a tow ID!')
    end
end, false)