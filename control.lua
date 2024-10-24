local gui_type = defines.gui_type.entity
local inventory = defines.inventory.chest
local prototypes = {
	['container'] = true,
	['logistic-container'] = true,
	['infinity-container'] = true,
	['linked-container'] = true,
	['temporary-container'] = true,
}

script.on_event(defines.events.on_tick, function()
	for _, player in pairs(game.connected_players) do
		if player.opened_gui_type == gui_type and prototypes[player.opened.type] then
			player.opened.get_inventory(inventory).sort_and_merge()
		end
	end
end)
