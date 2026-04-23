-- Holy Deck
SMODS.Back {
    key = 'holy',
    pos = { x = 0, y = 0 },
    config = { sephirot_rate = 2, consumables = { 'c_hatchl_malkuth' }  },
    unlocked = true,
    atlas = 'HLDecks',

    apply = function(self, back)
        -- Apply the spectral rate
        G.GAME.sephirot_rate = self.config.sephirot_rate
    end,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.sephirot_rate, self.config.consumables[1] } }
    end,
}
