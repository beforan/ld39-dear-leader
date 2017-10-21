local Assets = require "assets.assets"

local Cabinet = { Name = "Cabinet" }

function Cabinet:draw()
    love.graphics.setFont(Assets.Fonts.Header1)
    love.graphics.print("Cabinet", 20, 140)
end

return Cabinet