local Hud = {}

local Assets = require "assets.assets"
local UiParams = require "params.ui"

function Hud:draw(game)

    -- Dear Leader background
    love.graphics.setColor(UiParams.Hud.Colours.Background)
    love.graphics.rectangle("fill", 10, 10, 290, 105)
    resetColour()

    -- portrait
    love.graphics.draw(Assets.Sprites.Portrait, 20, 20, 0, 0.05, 0.05)

    -- Dear Leader stats
    love.graphics.setColor(UiParams.TextColours.Text)
    love.graphics.print("Dear Leader", 90, 25)

    -- empty bars first
    love.graphics.setColor(UiParams.Hud.Colours.EmptyBar)
    love.graphics.rectangle("fill", 90, 50, 200, 20)
    love.graphics.rectangle("fill", 90, 80, 200, 20)

    --fill the bars
    love.graphics.setColor(UiParams.Hud.Colours.Power)
    love.graphics.rectangle("fill", 90, 50, game.Stats.Power * 2, 20)
    love.graphics.setColor(UiParams.Hud.Colours.Popularity)
    love.graphics.rectangle("fill", 90, 80, game.Stats.Popularity * 2, 20)

    -- bar overlay text
    love.graphics.setColor(UiParams.TextColours.Text)
    love.graphics.printf("Power: " .. game.Stats.Power, 90, 50, 200, "center")
    love.graphics.printf("Popularity: " .. game.Stats.Popularity, 90, 80, 200, "center")

    -- Opposition stats
end

return Hud