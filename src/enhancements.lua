-- Sulfur 🜍
SMODS.Enhancement {
    key = 'sulfur',
    pos = { x = 0, y = 0 },
    config = { extra = { mult = 1 } },
    atlas = 'HLEnhancements',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                card.ability.extra.mult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end
}

-- Mercury ☿
SMODS.Enhancement {
    key = 'mercury',
    pos = { x = 1, y = 0 },
    config = { extra = { min = 0, max = 75 } },
    atlas = 'HLEnhancements',
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = pseudorandom('m_hatchl_mercury', card.ability.extra.min, card.ability.extra.max)
            }
        end
    end
}

-- Salt 🜔
SMODS.Enhancement {
    key = 'salt',
    pos = { x = 2, y = 0 },
    config = { extra = { odds = 2, repetitions = 2 } },
    atlas = 'HLEnhancements',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_hatchl_salt')
        return { vars = { numerator, denominator, card.ability.extra.repetitions } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.individual and
            SMODS.pseudorandom_probability(card, 'm_hatchl_salt', 1, card.ability.extra.odds) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,
}