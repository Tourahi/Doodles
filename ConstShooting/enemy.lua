
Enemy = Object:extend();
local ww = love.graphics.getWidth();

function Enemy:new()
  self.sprite = love.graphics.newImage("sprites/Enemy.png");
  self.x = 325;
  self.y = 450;
  self.speed = 100;
  self.width = self.sprite:getWidth();
  self.height = self.sprite:getHeight();
end

function Enemy:flipSpeed()
  self.speed = -self.speed;
end

function Enemy:checkColli()
  if self.x < 0 then
    self.x = 0;
    self:flipSpeed();
  elseif self.x + self.width > ww then
    self.x = ww - self.width;
    self:flipSpeed();
  end
end

function Enemy:update(dt)
  self.x = self.x + self.speed * dt;
  self:checkColli();
end

function Enemy:draw()
  love.graphics.draw(self.sprite,self.x,self.y);
end
