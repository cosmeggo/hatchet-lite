-- Four-Leaf Clover Localisations

local x_same_ref = get_X_same
function get_X_same(num, hand, or_more)
    if next(SMODS.find_card("j_hatchl_fourleaf")) and num == 4 then
        num = 3
    end
    return x_same_ref(num, hand, or_more)
end

-- Four-Leaf Clover
SMODS.Joker {
    key = "fourleaf",
    config = {
        extra = { type = 'Three of a Kind' }
    },
    pos = { x = 3, y = 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'HLJokers',
}
