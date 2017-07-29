local Ui = {
    ClearColour = { 255, 255, 255 },

    TextColours = {
        Title = { 180, 180, 255 },
        Good = { 180, 255, 180 },
        Warning = { 255, 240, 150 },
        Bad = { 255, 180, 180 },
        Overlay = { 255, 255, 255 },
        Text = { 0, 0, 0 }
    },
    
    Hud = {
        Colours = {
            Background = { 155, 155, 155 },
            EmptyBar = { 200, 200, 200 },
            Popularity = { 132, 179, 255 },
            Power = { 255, 255, 131 }
        }
    },

    Buttons = {
        Normal = { 36, 69, 140 },
        Hover = { 64, 90, 150 },
        Down = { 32, 45, 76 },
        Disabled = { 100, 100, 100 }
    },

    MessageButton = {
        x = love.graphics.getWidth() / 2 - 100 / 2,
        y = love.graphics.getHeight() / 2 + love.graphics.getHeight() / 4 - 40,
        w = 100,
        h = 30
    }
}

return Ui