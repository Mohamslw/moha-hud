local QBCore = exports['qb-core']:GetCoreObject()

function getPlayerInfo()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local job = PlayerData.job.name
    local jobGrade = PlayerData.job.grade.name
    local faction = PlayerData.gang.name
    local factionGrade = PlayerData.gang.grade.name
    local id = GetPlayerServerId(PlayerId())

    SendNUIMessage({
        action = 'updateHUD',
        job = job,
        jobGrade = jobGrade,
        faction = faction,
        factionGrade = factionGrade,
        id = id
    })
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', getPlayerInfo)
RegisterNetEvent('QBCore:Client:OnGangUpdate', getPlayerInfo)

RegisterNetEvent('qb-multicharacter:client:spawnLastLocation', function()
    getPlayerInfo()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Wait(1000)
        getPlayerInfo()
    end
end)