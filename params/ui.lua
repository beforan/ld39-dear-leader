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
            Background = { 47, 48, 56 },
            LeaderBackground = { 155, 155, 155 },
            EmptyBar = { 200, 200, 200 },
            Popularity = { 132, 179, 255 },
            OppositionPopularity = { 252, 78, 78 },
            Power = { 255, 255, 131 },
            Buttons = {
                Normal = { 200, 200, 200 },
                Hover = { 220, 220, 220 },
                Down = { 180, 180, 180 },
                Active = { 255, 255, 255 }
            }
        },
        Buttons = {
            Events = {
                x = 310,
                y = 45,
                w = 85,
                h = 80
            },
            Policy = {
                x = 395,
                y = 45,
                w = 85,
                h = 80
            },
            Cabinet = {
                x = 480,
                y = 45,
                w = 85,
                h = 80
            },
            Press = {
                x = 565,
                y = 45,
                w = 85,
                h = 80
            },
            News = {
                x = 650,
                y = 45,
                w = 85,
                h = 80
            }
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