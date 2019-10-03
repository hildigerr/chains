print("[Chains] v1.1")

minetest.register_node("chains:chain", {
    description = "Chain",
    walkable = false,
    climbable = true,
    sunlight_propagates = true,
    paramtype = "light",
    drops = "",
    inventory_image = "Chain_inv.png",
    tile_images = { "Chain.png" },
    drawtype = "plantlike",
    on_place = place_rope,
    after_dig_node = function(pos, oldnode, oldmetadata, digger)
        local num = 0
        local below = {x=pos.x,y=pos.y -1,z=pos.z}
        while minetest.env:get_node(below).name == "chains:chain" do
            minetest.env:remove_node(below)
            below.y = below.y -1
            num = num + 1
        end
        if num ~= 0 then
            digger:get_inventory():add_item("main", "chains:chain "..num)
        end
    end,
    groups = {cracky=3},
    sounds =  default.node_sound_stone_defaults(),
    })

minetest.register_node("chains:chain_top", {
    description = "Chain Top",
    walkable = false,
    climbable = true,
    sunlight_propagates = true,
    paramtype = "light",
    drops = "",
    tile_images = { "Chain_top.png" },
    drawtype = "plantlike",
    groups = {cracky=3},
    sounds =  default.node_sound_stone_defaults(),
    })

minetest.register_node("chains:chandelier", {
    description = "Chandelier",
    paramtype = "light",
    walkable = false,
    light_source = LIGHT_MAX-2,
    climbable = true,
    sunlight_propagates = true,
    paramtype = "light",
    drops = "",
    tile_images = { {name="Chandelier.png", animation={type="vertical_frames", aspect_w=96, aspect_h=64, length=16.0}}},
    inventory_image = "Chandelier_inv.png",
    wield_image = "Chandelier_inv.png",
    drawtype = "plantlike",
    groups = {cracky=3},
    sounds =  default.node_sound_stone_defaults(),
    })

minetest.register_craft({
	output = "chains:chain 2",
	recipe = {
		{'default:steel_ingot'},
		{'default:steel_ingot'},
		{'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'chains:chain_top',
	recipe = {
		{'default:steel_ingot'},
		{'chains:chain'},
	},
})

minetest.register_craft({
	output = 'chains:chandelier',
	recipe = {
		{'default:torch', 'chains:chain', 'default:torch'},
		{'default:torch', 'chains:chain', 'default:torch'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})