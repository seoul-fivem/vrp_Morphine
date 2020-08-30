-- seoul#0977
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","morphine")


vRP.defInventoryItem({"morphine", "모르핀", "", function(args) 
    local choices = {}
	
	choices["*사용"] = {function(player,choice,mod)
		local user_id = vRP.getUserId({player})
        if user_id ~= nil then
            vRP.tryGetInventoryItem({user_id, "morphine", 1, true})
	TriggerClientEvent('OurStoryMorphine:inject', player)
            vRPclient.notify(player,{"모르핀을 사용합니다. 읏흥!"} ) 
            vRP.closeMenu({player})
        end
    end}
   
    return choices
end, 0.05})  