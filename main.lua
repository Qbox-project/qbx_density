SetRelationshipBetweenGroups(1, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_1`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_2`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_9`, `PLAYER`)
SetRelationshipBetweenGroups(1, `GANG_10`, `PLAYER`)
SetRelationshipBetweenGroups(1, `FIREMAN`, `PLAYER`)
SetRelationshipBetweenGroups(1, `MEDIC`, `PLAYER`)
SetRelationshipBetweenGroups(1, `COP`, `PLAYER`)
SetRelationshipBetweenGroups(1, `PRISONER`, `PLAYER`)

DecorRegister('ScriptedPed', 2)
local densities = {}
local density = 0.8
local pedDensity = 1.0
local isSpeeding = false
local isDriver = false
local disabledDensity = false
local populationDensity = 0.8

local function registerDensityReason(pReason, pPriority)
    densities[pReason] = { reason = pReason, priority = pPriority, level = -1, active = false }
end

exports('registerDensityReason', registerDensityReason)

local function changeDensity(pReason, pLevel)
    if not densities[pReason] then return end

    densities[pReason]['level'] = pLevel

    local level = populationDensity
    local priority

    for i = 1, #densities do
        local reason = densities[i]
        if reason.level ~= -1 and (not priority or priority < reason.priority) then
            priority = reason.priority
            level = reason.level
        end
    end

    lib.print.warn('density', level)

    density = level + 0.0
end

exports('changeDensity', changeDensity)

CreateThread(function()
    while true do
        local vehDensity = isSpeeding and (isDriver and 0.1 or 0.0) or density

        if disabledDensity then
            vehDensity = 1.0
        end

        SetParkedVehicleDensityMultiplierThisFrame(pedDensity)
        SetVehicleDensityMultiplierThisFrame(vehDensity)
        SetRandomVehicleDensityMultiplierThisFrame(vehDensity)
        SetPedDensityMultiplierThisFrame(pedDensity)
        SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity) -- Walking NPC Density
        Wait(0)
    end
end)
