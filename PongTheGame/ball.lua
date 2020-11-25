
Ball = {};


function Ball:load()
  self.x = love.graphics.getWidth() / 2;
  self.y = love.graphics.getHeight() / 2;
  self.width = 20;
  self.height = 20;
  self.speed = 200;
  self.xVel  = -self.speed;
  self.yVel  = 0;
end

function Ball:move(dt)
  self.x = self.x + (self.xVel * dt);
  self.y = self.y + (self.yVel * dt);
end

function Ball:collide()
  if checkCollision(self,Player) then
    self.xVel = self.speed;
    local midBall = (self.x + self.height) / 2;
    local midPlayer = (Player.x + Player.height) / 2;
    local colliPos = midBall - midPlayer;
    self.yVel = colliPos * 5;
  end

  if self.y < 0 then
    self.y = 0;
    self.yVel = -self.yVel;
  elseif self.y > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height;
    self.yVel =  -self.yVel;
  end
end

function Ball:update(dt)
  self:move(dt);
  self:collide();
end


function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height);
end
