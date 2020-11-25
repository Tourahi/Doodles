

Ai = {};

function Ai:load()
  self.width = 20;
  self.height = 100;
  self.x = love.graphics.getWidth() - self.width - 50;
  self.y = love.graphics.getHeight() / 2;
  self.yVel = 0;
  self.speed = 500;
  self.timer = 0;
  self.rate = 0.5;
end

function Ai:checkBoundries()
  if self.y < 0 then
    self.y = 0;
  elseif self.y > (love.graphics.getHeight() - self.height) then
    self.y = (love.graphics.getHeight() - self.height);
  end
end

function Ai:move(dt)
  self.y = self.y + (self.yVel * dt);
  self:checkBoundries();
end

function Ai:target()
  if Ball.y + Ball.height < self.y then
   self.yVel = -self.speed;
  elseif Ball.y > self.y + self.height then
     self.yVel = self.speed;
  else
     self.yVel = 0;
  end
end

function Ai:update(dt)
  self:move(dt);
  self.timer = self.timer + dt;
  if self.timer > (self.rate/2) then
     self.timer = 0;
     self:target();
  end
end

function Ai:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height);
end
