local Assets = require "assets.assets"
local UiParams = require "params.ui"

local News = {}

local pages = {
    {
        x = 50,
        y = 200,
        w = 425,
        h = 200
    },
    {
        x = 525,
        y = 200,
        w = 425,
        h = 200
    },
    {
        x = 50,
        y = 450,
        w = 425,
        h = 200
    },
    {
        x = 525,
        y = 450,
        w = 425,
        h = 200
    }
}

function News:draw(game)
    love.graphics.setFont(Assets.Fonts.Header1)
    love.graphics.print("News", 20, 140)

    local  i = 0
    for k,v in pairs(game.News) do
        i = i+1
        if i <= 4 then
            local p = pages[i]

            love.graphics.setColor(UiParams.News.PageColour)
            love.graphics.rectangle("fill", p.x, p.y, p.w, p.h)
            love.graphics.setColor(UiParams.TextColours.Text)
            love.graphics.setFont(Assets.Fonts.Header2)
            love.graphics.print(k, p.x + 10, p.y + 10)
            love.graphics.setFont(Assets.Fonts.Default)
            love.graphics.printf(v, p.x + 10, p.y + 50, p.w - 10, "left")
        end
    end
end

return News