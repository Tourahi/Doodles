-- Pong the game
-- Author : Tourahi Amine
-- Start date : Wed Nov 25
-- Made with Love :)

require("player");

function love.load(arg)
  Player:load();
end

function love.update(dt)
  Player:update(dt);
end

function love.draw()
  Player:draw();
end
