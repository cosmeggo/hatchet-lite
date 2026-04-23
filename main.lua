--ATLASES
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLJokers", 
    path = "HLJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLConsumables", 
    path = "HLConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLBoosters", 
    path = "HLBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLEnhancements", 
    path = "HLEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLDecks", 
    path = "HLDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HLBlinds", 
    path = "HLBlinds.png", 
    px = 34,
    py = 34, 
    frames = 21, 
    atlas_table = "ANIMATION_ATLAS"
})

--loading src files
assert(SMODS.load_file("src/backs.lua"))()
assert(SMODS.load_file("src/blinds.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file('src/jokers.lua'))()
-- assert(SMODS.load_file("src/sephirot.lua"))()
-- assert(SMODS.load_file("src/boosters.lua"))()

SMODS.ConsumableType {
    key = 'sephirot',
    primary_colour = HEX('0ebab2'),
    secondary_colour = HEX('0ebab2'),
    collection_rows = { 4, 5 },
    shop_rate = 0,
    loc_txt = {
        name = "Sephirot",
        collection = "Sephirot Cards",
    }
}

--- Main Menu Colours (Credit to Cryptid and JoyousSpring)
local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

        local colours = { c1 = HEX("4d5670"), c2 = HEX("90f252") }
        G.SPLASH_BACK:define_draw_steps({
            {
                shader = "splash",
                send = {
                    { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                    { name = "vort_speed", val = 0.4 },
                    { name = "colour_1",   ref_table = colours,  ref_value = "c1" },
                    { name = "colour_2",   ref_table = colours,      ref_value = "c2" },
                },
            },
        })
    return ret
end

-- Credit to NopeTooFast
SMODS.current_mod.menu_cards = function()
return {
  { key = 'j_hatchl_fourleaf' },
  remove_original = true
} end