local campaign =  {}

campaign.Description = "Learn to play the game during the month or so of election time leading up to the main campaign."

campaign.Introduction = [[In this tutorial campaign, many decisions are made for you (by disabling the obviously wrong options), but you will learn how to play the game.

This campaign is set shortly before the main campaign. Dear Leader rose to power after the public voted unanimously in favour of a divisive referendum proposal.

At least, the narrowly winning side of the divide was unanimous.

Dear Leader is now responsible for driving through the overwhelmingly popular decision, referred to by the press as "Flopzix", and no one is better qualified. Of the whole country, Dear Leader alone was able to provide the illuminating revelation that "Flopzix means Flopzix."

Dear Leader's power was shaky following the divisive referendum, but now that she has the absolute support of the populace for an absolute Flopzix the time has come to formalize this support by calling an election to solidify her power.

This tutorial will show you how to guide Dear Leader through her election campaign, to put her in a solid position of power at the start of the main campaign, leaving you and her able to to execute an effective Flopzix.
]]

function campaign:Initialise(game) -- this initialises stacks and stats at the start of the campaign. The game will always call it.
    game.Stats.Power = 52
    game.Stats.Popularity = 60

    table.insert(game.Stacks.Cabinet, {
        Minister1 = {
            Name = "Foreign Secretary",
            Opinion = "Your popularity is much higher than Opposition's! You should hold an election to increase your power, and guarantee Flopzix success!"
        },
        Minister2 = {
            Name = "Flopzix Minister",
            Opinion = "Flopzix needs a stable and strong government. Of course we are such a government, but an election would increase our power, making us stabler and stongerer."
        },
        Minister3 = {
            Name = "Health Secretary",
            Opinion = "If we cut healthcare down we will become more powerful than you can possibly imagine. With that power we can at least make healthcare profitable, if not actually effective."
        },
        Options = {
            {
                Text = "Calling an early election is too risky. The referendum was divisive and this will be too.",
                Disabled = true
            },
            {
                Text = "We're way ahead in the polls. An election is a guaranteed success, especially if I regale the public with tales of my field frolicking days to make me appear relatable.",
                Result = function(game)
                    -- stack up some more decisions!
                end
            }
        }
    })

    game.News = {
        ["The Moon"] = "We love Dear Leader. Dear Leader will lead us to great victory through Flopzix.",
        ["The Sentinel"] = "Opposition justifiably preferable to Dear Leader. This edition filled with columns justifying it.",
        ["The Unaffiliated"] = "Dear Leader moderately popular, suggesting she deserves more power.",
        ["The Daily Rage"] = "Dear Leader guarantees Flopzix will purge all undesirable everythings. Finally we can be rid of everything holding us back."
    }
    game.NewsUpdate = true

    table.insert(game.Messages, self.Introduction)
end

campaign.Events = {
}
campaign.Policy = {
}
campaign.Cabinet = {
}
campaign.Press = {
}

return campaign;