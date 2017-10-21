local Hud = {}

local Assets = require "assets.assets"
local UiParams = require "params.ui"

Hud.Buttons = {
    Events = {
        State = "Normal"
    },
    Policy = {
        State = "Normal"
    },
    Cabinet = {
        State = "Normal"
    },
    Press = {
        State = "Normal"
    },
    News = {
        State = "Normal"
    }
}
local ActiveButton = nil

function Hud:draw(game)

    -- top background
    love.graphics.setColor(UiParams.Hud.Colours.Background)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 125)

    -- Dear Leader background
    love.graphics.setColor(UiParams.Hud.Colours.LeaderBackground)
    love.graphics.rectangle("fill", 10, 10, 290, 105)

    -- Opposition background
    love.graphics.rectangle("fill", love.graphics.getWidth() - 230, 45, 220, 70)

    -- portrait
    resetColour()
    love.graphics.draw(Assets.Sprites.Portrait, 20, 20, 0, 0.05, 0.05)

    -- Leader titles
    love.graphics.setColor(UiParams.TextColours.Text)
    love.graphics.print("Dear Leader", 90, 25)
    love.graphics.print("Opposition", love.graphics.getWidth() - 220, 55)

    -- empty bars first
    love.graphics.setColor(UiParams.Hud.Colours.EmptyBar)
    love.graphics.rectangle("fill", 90, 50, 200, 20)
    love.graphics.rectangle("fill", 90, 80, 200, 20)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 220, 80, 200, 20)

    --fill the bars
    love.graphics.setColor(UiParams.Hud.Colours.Power)
    love.graphics.rectangle("fill", 90, 50, game.Stats.Power * 2, 20)
    love.graphics.setColor(UiParams.Hud.Colours.Popularity)
    love.graphics.rectangle("fill", 90, 80, game.Stats.Popularity * 2, 20)
    love.graphics.setColor(UiParams.Hud.Colours.OppositionPopularity)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 220, 80, (100 - game.Stats.Popularity) * 2, 20)

    -- bar overlay text
    love.graphics.setColor(UiParams.TextColours.Text)
    love.graphics.printf("Power: " .. game.Stats.Power, 90, 50, 200, "center")
    love.graphics.printf("Popularity: " .. game.Stats.Popularity, 90, 80, 200, "center")
    love.graphics.printf("Popularity: " .. (100 - game.Stats.Popularity), love.graphics.getWidth() - 220, 80, 200, "center")

    -- buttons!
    for k, v in pairs(self.Buttons) do
        love.graphics.setColor(UiParams.Hud.Colours.Buttons[v.State])
        local b = UiParams.Hud.Buttons[k]
        love.graphics.rectangle("fill",
            b.x, v.State == "Active" and (b.y - 10) or b.y,
            b.w, v.State == "Active" and (b.h + 10) or b.h)
        love.graphics.setColor(UiParams.TextColours.Text)

        love.graphics.setFont(Assets.Fonts.HudButtonIcons)
        love.graphics.printf(Assets.Icons[k], b.x,
            v.State == "Active" and (b.y + 10) or (b.y + 20),
            b.w, "center")

        -- check for star badge worthiness
        local starbadge = false
        if k == "News" then
            if game.NewsUpdate then starbadge = true end
        else
            if #game.Stacks[k] > 0 then starbadge = true end
        end

        if starbadge then
            love.graphics.setColor(UiParams.StarBadgeColour)
            love.graphics.setFont(Assets.Fonts.StarBadge)
            love.graphics.print(Assets.Icons.StarBadge, b.x + b.w - 20, b.y + 10)
        end

        love.graphics.setColor(UiParams.TextColours.Text)
        love.graphics.setFont(Assets.Fonts.Default)
        love.graphics.printf(k, b.x,
            v.State == "Active" and (b.y + b.h - 30) or (b.y + b.h - 20),
            b.w, "center")
    end
end

function Hud:mousemoved(x, y)
    for k, v in pairs(self.Buttons) do
        if v.State ~= "Active" then
            local b = UiParams.Hud.Buttons[k]
            --bounds check for button hover
            if boundsCheck(x, y, b) then
                if love.mouse.isDown(1) then
                    v.State = "Down"
                else
                    v.State = "Hover"
                end
            else
                v.State = "Normal"
            end
        end
    end
end

function Hud:mousepressed(x, y, button)
    for k, v in pairs(self.Buttons) do
        if v.State ~= "Active" then
            local b = UiParams.Hud.Buttons[k]
            --bounds check for button down
            if boundsCheck(x, y, b) then
                v.State = "Down"
            end
        end
    end
end

function Hud:mousereleased(x, y, button)
    for k, v in pairs(self.Buttons) do
        if v.State ~= "Active" then
            local b = UiParams.Hud.Buttons[k]
            --bounds check for button action
            if boundsCheck(x, y, b) then
                --unset old active
                if self.ActiveButton ~= nil then
                    self.Buttons[self.ActiveButton].State = "Normal"
                end

                -- set new active
                v.State = "Active"
                self.ActiveButton = k

                -- change substate
                local gs = Gamestate.current()
                gs.SubState = gs.SubStates[k]
                if k == "News" then gs.NewsUpdate = false end -- mark as read on switching for news
            end
        end
    end
end

return Hud