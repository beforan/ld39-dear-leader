local utf8 = require "utf8" -- for fa icons

return {
    Sprites = {
        Portrait = love.graphics.newImage("/assets/jon/DearLeader.jpg")
    },
    Fonts = {
        Default = love.graphics.newFont("/assets/fonts/fantasquesansmono-regular.otf", 16),
        Header1 = love.graphics.newFont("/assets/fonts/fantasquesansmono-regular.otf", 36),
        Header2 = love.graphics.newFont("/assets/fonts/fantasquesansmono-regular.otf", 24),
        OverlayBanner = love.graphics.newFont("/assets/fonts/fantasquesansmono-regular.otf", 72),
        OverlaySubtext = love.graphics.newFont("/assets/fonts/fantasquesansmono-regular.otf", 30),
        HudButtonIcons = love.graphics.newFont("/assets/fonts/fontawesome-webfont.ttf", 30),
        StarBadge = love.graphics.newFont("/assets/fonts/fontawesome-webfont.ttf", 16)
    },
    Icons = { --Oh yes a unicode lookup for the fa icons i'm actually using
        Events = utf8.char(0xf073),
        Policy = utf8.char(0xf05a),
        Cabinet = utf8.char(0xf0c0),
        Press = utf8.char(0xf0e6),
        News = utf8.char(0xf1ea),
        StarBadge = utf8.char(0xf005)
    }
}