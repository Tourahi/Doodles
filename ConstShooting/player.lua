
Player = Object:extend("Player");
local ww = love.graphics.getWidth();
bulletsList = {};

function Player:new()
  self.sprite = love.graphics.newImage("sprites/Player.png");
  self.x = 300
  self.y = 20
  self.speed = 500
  self.width = self.sprite:getWidth()
end

function Player:checkColli()
  if self.x < 0 then
    self.x = 0;
  elseif self.x + self.width > ww then
    self.x = ww - self.width;
  end
end

function Player:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt;
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt;
  end
  self:checkColli();
end

function Player:draw()
  love.graphics.draw(self.sprite,self.x,self.y);
end

function Player:keypressed(key)
  if key == "space" then
      table.insert(bulletsList, Bullet(self.x + (self.width/2), self.y + self.sprite:getHeight()))
  end
end
