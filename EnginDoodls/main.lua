local Player = require("Entities.Player");

local player;

function love.load(arg)
   player = Player({
      width = 200,
      height = 100,
      x = 20,
      y = 20,
      mode = "fill"
    });
end

function love.draw()
  player:draw();
end
