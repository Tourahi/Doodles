local Player = require("Entities.Player");
require "Entities.camera";
Object   = require "classicc";
Binocles = require "binocles";
watcher = Binocles({
    active = true,
    customPrinter = true,
    debugToggle =   'f1',
    consoleToggle = 'f2',
    colorToggle   = 'f3',
    watchedFiles = {
      'main.lua',
    },
  });

local player;


tx=0
ty=0

function love.load(arg)
   player = Player({
      width = 200,
      height = 100,
      x = 20,
      y = 20,
      mode = "fill"
    });

    watcher:watch("Translate",function() return {tx = tx,ty = ty} end);
    watcher:watch("distance",function() return {dx = dx,dy = dy} end);
    watcher:watch("mouse",function() return {mx = mx,my = my} end);
    -- camera:scale(0.5);
    -- camera:move(100, 100)
end

function love.draw()
  camera:set();
    -- camera:rotate(0.1);
    player:draw();
    camera:draw()
  camera:unset();
end

function love.update(dt)
  watcher:update();
  camera:update(dt)
end

function love.mousepressed(x, y, button, istouch)
   if button == 2 then
      tx = 0
      ty = 0
   end
end



function exampleDraw()
  mx = love.mouse.getX()
	my = love.mouse.getY()
	if love.mouse.isDown(1) then
		if not mouse_pressed then
			mouse_pressed = true
			dx = tx-mx
			dy = ty-my
		else
			tx = mx+dx
			ty = my+dy
		end
	elseif mouse_pressed then
		mouse_pressed = false
	end
	love.graphics.translate(tx, ty)
  -- player:draw();
	-- example graphics:
	love.graphics.circle( "line", 0, 0, 400 )
	love.graphics.line(-440, 0, 440, 0)
	love.graphics.line(0, -440, 0, 440)
end
