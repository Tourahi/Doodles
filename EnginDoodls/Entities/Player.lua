local class = require("classicc");
local player = class:extend("Player");

-- Player._shapes = {
--   ["circle"] : "circle",
--   ["rectangle"] : "rectangle"
-- }

-- width , Height, pos(x,y), type
function player:new( options )
  self.width =  options.width;
  self.height = options.height;
  self.x = options.x;
  self.y  = options.y;
  self.mode = options.mode;
  self.controller = (options.controller or nil);
end

function player:update(dt)
  if(self.controller) then
    self.controller(dt);
  end
end

function player:draw()
  love.graphics.rectangle(self.mode, self.x, self.y,
                          self.width, self.height );
end



return player;
