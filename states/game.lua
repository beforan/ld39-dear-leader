local Hud = require "states.game.hud"

local Assets = require "assets.assets"
local UiParams = require "params.ui"

local Game = {}

Game.Campaign = require "campaigns.tutorial" -- menu will pass this as a param later
Game.Stats = {}
Game.Stacks = {
    Events = {},
    Policy = {},
    Cabinet = {},
    Press = {}
}
Game.News = {}
Game.Messages = {
    ButtonState = "Normal"
}
Game.SubStates = {
    Events = require "states.game.events",
    Policy = require "states.game.policy",
    Cabinet = require "states.game.cabinet",
    Press = require "states.game.press",
    News = require "states.game.news"
}
Game.SubState = nil

function Game:init()
    self.Campaign:Initialise(self)
end

function Game:update()
end

function Game:draw()
    love.graphics.setFont(Assets.Fonts.Default)
    
    love.graphics.clear(UiParams.ClearColour)

    Hud:draw(self)

    if self.SubState then self.SubState:draw(self)
    else
        love.graphics.setColor(UiParams.TextColours.Text)
        love.graphics.print("Please select a view from the tabs above.", 150, 400)
    end

    if self.Messages[1] then self:drawMessage() end
end

-- Game manages modal messages itself; basically everything else is deferred to substates or the hud
function Game:drawMessage()
    --modal overlay
    love.graphics.setColor(UiParams.OverlayColour)
    love.graphics.rectangle("fill", 0, love.graphics.getHeight() / 2 - love.graphics.getHeight() / 4, love.graphics.getWidth(), love.graphics.getHeight() / 2)

    -- button
    love.graphics.setColor(UiParams.Buttons[self.Messages.ButtonState])
    love.graphics.rectangle("fill", UiParams.MessageButton.x, UiParams.MessageButton.y, UiParams.MessageButton.w, UiParams.MessageButton.h)
    
    -- text
    love.graphics.setColor(UiParams.TextColours.Overlay)
    -- message
    love.graphics.printf(self.Messages[1], 10, love.graphics.getHeight() / 2 - love.graphics.getHeight() / 4 + 10, love.graphics.getWidth() - 20, "left")
    -- button
    love.graphics.printf("OK", UiParams.MessageButton.x, UiParams.MessageButton.y + 5, UiParams.MessageButton.w, "center")
end

function Game:keyreleased(key)
    -- handle some global inputs like pause, quit etc?
    
    if self.Messages[1] then
        -- input block on the modal message
        if key == "return" or key == "kpenter" then
            table.remove(self.Messages, 1)
        end
    else
        --handle some game input
    end
end

function Game:mousemoved(x, y)
    if self.Messages[1] then
        --bounds check for message button hover
        local b = UiParams.MessageButton
        if boundsCheck(x, y, b) then
            if love.mouse.isDown(1) then
                self.Messages.ButtonState = "Down"
            else
                self.Messages.ButtonState = "Hover"
            end
        else
            self.Messages.ButtonState = "Normal"
        end
    else
        Hud:mousemoved(x, y)
    end
end

function Game:mousepressed(x, y, button)
    
    if self.Messages[1] then
        --bounds check for message button down
        local b = UiParams.MessageButton
        if boundsCheck(x, y, b) then
            self.Messages.ButtonState = "Down"
        end
    else
        Hud:mousepressed(x, y, b)
    end
end

function Game:mousereleased(x, y, button)
    if self.Messages[1] then
        --bounds check for message button action
        local b = UiParams.MessageButton
        if boundsCheck(x, y, b) then
            table.remove(self.Messages, 1)
        end
    else
        Hud:mousereleased(x, y, b)
    end
end

return Game