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

local density = lib.load('qbx_density.config')

local function setDensity(type, value)
    if type == 'parked' then
        density.parked = value
    elseif type == 'vehicle' then
        density.vehicle = value
    elseif type == 'multiplier' then
        density.multiplier = value
    elseif type == 'peds' then
        density.peds = value
    elseif type == 'scenario' then
        density.scenario = value
    end
end

---@deprecated use SetDensity instead
exports('DecorSet', setDensity)
exports('SetDensity', setDensity)

CreateThread(function()
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(density.parked)
        SetVehicleDensityMultiplierThisFrame(density.vehicle)
        SetRandomVehicleDensityMultiplierThisFrame(density.multiplier)
        SetPedDensityMultiplierThisFrame(density.peds)
        SetScenarioPedDensityMultiplierThisFrame(density.scenario, density.scenario) -- Walking NPC Density
        Wait(0)
    end
end)