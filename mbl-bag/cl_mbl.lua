RLCore = nil

Citizen.CreateThread(function ()
    while RLCore == nil do
        Citizen.Wait(0)
        TriggerEvent("RLCore:GetObject", function (library)
            RLCore = library
        end)
    end
end)

RegisterNetEvent("mbl:bag:openbag")
AddEventHandler("mbl:bag:openbag",function (itemData)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", itemData.info.bagid, {
        maxweight = 15,
        slots = 15,
    })
    TriggerEvent("inventory:client:SetCurrentStash", itemData.info.bagid)
end)
