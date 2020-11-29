

function love.load(arg)
  love.window.setTitle( "ConstShooting" );
  Object = require "classicc";
  require "player";
  require "enemy";
  require "bullet";
  player = Player();
  enemy  = Enemy();
end

function love.keypressed(key)
  player:keypressed(key);
end


function love.update(dt)
  player:update(dt);
  enemy:update(dt);
  for i,v in ipairs(bulletsList) do
    v:update(dt);
    v:checkCollision(enemy)
    if v.dead then
      table.remove(bulletsList, i)
    end
  end
end

function love.draw()
  player:draw();
  enemy:draw();
  for i,v in ipairs(bulletsList) do
    v:draw();
  end
end
