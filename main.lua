Gamestate = require "lib.hump.gamestate"

UiParams = require "params.ui"

Gamestate.States = {
    Game = require "states.game",
    -- Pause = require "states.pause",
    -- Menu = require "states.menu",
    -- Help = require "states.help",
    -- Credits = require "states.credits",
    -- Controls = require "states.controls",
    -- GameOver = require "states.gameover"
}

function love.load(arg)
    math.randomseed(os.time())

    Gamestate.registerEvents()
    Gamestate.switch(Gamestate.States.Game)
end

-- global helpers

function resetColour()
    love.graphics.setColor(UiParams.ClearColour)
end

function boundsCheck(mx, my, x, y, w, h)
    if type(x) == "table" then -- allow a passing a bounding box table instead of separate vals
        h = x.h
        w = x.w
        y = x.y
        x = x.x
    end
    return mx > x and mx < x + w and my > y and my < y + h
end