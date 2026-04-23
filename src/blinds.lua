-- The Axe
SMODS.Blind {
    key = "hatchl_axe",
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 0 },
    boss = { min = 2 },
    boss_colour = HEX("b6315e"),
    atlas = 'HLBlinds',

    calculate = function(self, blind, context)
    if not blind.disabled then
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[1] then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
end
}

-- The Sack
SMODS.Blind {
    key = "hatchl_sack",
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 1 },
    boss = { min = 4 },
    boss_colour = HEX("6caa70"),
    atlas = 'HLBlinds',

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.individual and context.cardarea == G.play  then
                assert(SMODS.modify_rank(context.other_card, -1))
                return {
                    message = "Downgrade!"
                }
            end
        end
end
}