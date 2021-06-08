RLCore = nil
TriggerEvent("RLCore:GetObject", function (library)
    RLCore = library
end)

RLCore.Functions.CreateUseableItem("bag", function (source, item)
    local _source = source
    local _char = RLCore.Functions.GetPlayer(_source)
    if _char and GetItem(source, item.name).count >= 1 then
        TriggerClientEvent("mbl:bag:open",_source, item)
    else
        print("wtf?")
    end
end)


-- RegisterServerEvent("RLCore:Player:OnRemovedItem")
-- AddEventHandler("RLCore:Player:OnRemovedItem", function(source, item)
--     if item.name == 'bag' and GetItem(source, item.name).count < 1 then
--       TriggerClientEvent('mbl:bag:dropped', source)
--     end
-- end)

function GetItem(source, item)
	local _char = RLCore.Functions.GetPlayer(source)
	local count = 0

	for k,v in pairs(_char['PlayerData']['items']) do
		if v.name == item then
			count = count + v.amount
		end
	end
	return { name = item, count = count }
end