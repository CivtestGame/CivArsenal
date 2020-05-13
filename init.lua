civarsenal = {}

-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

rcbows.register_arrow("civarsenal:arrow_basic", {
	projectile_texture = "civarsenal_projectile_arrow",
	damage = 10 * default.DAMAGE_MULTIPLIER,
	inventory_arrow = {
		name = "civarsenal:inv_arrow",
		description = S("Arrow"),
		inventory_image = "civarsenal_arrow.png",
	},
})

minetest.register_craft({
	output = "civarsenal:inv_arrow 5",
	type = "shaped",
	recipe = {
		{"", "", "group:metal_ingot"},
		{"", "default:stick", ""},
		{"group:wool", "", ""},
	}
})

rcbows.register_arrow("civarsenal:arrow_fire", {
	projectile_texture = "civarsenal_projectile_arrow",
	damage = 8 * default.DAMAGE_MULTIPLIER,
	inventory_arrow = {
		name = "civarsenal:inv_arrow_fire",
		description = S("Incendiary Arrow"),
		inventory_image = "civarsenal_arrow_fire.png",
	},
	drop = "civarsenal:inv_arrow",
	effects = {
		replace_node = "fire:basic_flame",
		trail_particle = "civarsenal_particle_fire.png",
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "civarsenal:inv_arrow_fire 5",
	recipe = {"civarsenal:inv_arrow", "civarsenal:inv_arrow", "civarsenal:inv_arrow", "civarsenal:inv_arrow", "civarsenal:inv_arrow", "group:food_oil", "default:torch"},
})

rcbows.register_arrow("civarsenal:cannonball_explosive", {
	projectile_texture = "civarsenal_projectile_cannonball",
	damage = 50 * default.DAMAGE_MULTIPLIER,
	inventory_arrow = {
		name = "civarsenal:cannonball_explosive",
		description = S("Explosive Cannonball"),
		inventory_image = "civarsenal_cannonball_explosive.png",
	},
	drop = "",
	stack_max = 1,
	effects = {
		explosion = {
			mod = "tnt",
			damage = 5, --THIS IS EXPLOSION RADIUS, NOT EXPLICIT DAMAGE
			radius = 2,
			entity_damage = 20,
		},
		trail_particle = "civarsenal_particle_fire.png",
	}
})

minetest.register_craft({
	output = "civarsenal:cannonball_explosive",
	type = "shapeless",
	recipe = {"tnt:tnt", "group:coal", "group:metal_ingot"},
})

rcbows.register_bow("civarsenal:bow_wood_short", {
	description = S("Wooden Shortbow"),
	image = "civarsenal_bow_wood_short.png",
	strength = 25,
	uses = 50,
	charge_time = 1.5,
	recipe = {
		{"", "group:wood", "farming:string"},
		{"group:wood", "", "farming:string"},
		{"", "group:wood", "farming:string"},
	},
	base_texture = "civarsenal_base_bow_wood_short.png",
	overlay_empty = "civarsenal_overlay_empty.png",
	overlay_charged = "civarsenal_overlay_charged.png",
	arrows = {"civarsenal:arrow_basic","civarsenal:arrow_fire"},
	sounds = {
		max_hear_distance = 10,
		gain = 0.4,
	}
})

rcbows.register_bow("civarsenal:bow_wood_long", {
	description = S("Wooden Longbow"),
	image = "civarsenal_bow_wood_long.png",
	strength = 35,
	uses = 100,
	charge_time = 2.5,
	base_texture = "civarsenal_base_bow_wood_long.png",
	overlay_empty = "civarsenal_overlay_empty_long.png",
	overlay_charged = "civarsenal_overlay_charged_long.png",
	arrows = {"civarsenal:arrow_basic","civarsenal:arrow_fire"},
	sounds = {
		max_hear_distance = 10,
		gain = 0.4,
	}
})

rcbows.register_bow("civarsenal:bow_composite", {
	description = S("Composite Shortbow"),
	image = "civarsenal_bow_composite.png",
	strength = 30,
	uses = 250,
	charge_time = 1.2,
	base_texture = "civarsenal_base_bow_composite.png",
	overlay_empty = "civarsenal_overlay_empty.png",
	overlay_charged = "civarsenal_overlay_charged.png",
	arrows = {"civarsenal:arrow_basic","civarsenal:arrow_fire"},
	sounds = {
		max_hear_distance = 10,
		gain = 0.4,
	}
})

rcbows.register_bow("civarsenal:handcannon", {
	description = S("Handcannon"),
	image = "civarsenal_handcannon.png",
	strength = 15,
	uses = 50,
	charge_time = 5.0,
	base_texture = "civarsenal_handcannon.png",
	overlay_empty = "civarsenal_overlay_handcannon_empty.png",
	overlay_charged = "civarsenal_overlay_handcannon_charged.png",
	arrows = "civarsenal:cannonball_explosive",
	sounds = {
		max_hear_distance = 40,
		gain = 0.4,
	}
})