
function love.load()
  graphics = love.graphics;
  window   = love.window;
  --Globals
  score = 0;
  timer = 0; -- To do
  --Button tab
  button = {
    x=200,
    y=200,
    rad=50
  };
  --Font
  myFont = graphics.newFont(40);

  love.window.setTitle("Button Clicker");
end

function love.update(dt)

end

function love.draw()
  graphics.setColor(0,0.5,1);
  -- graphics.rectangle("fill",10,10,200,200);
  graphics.circle("fill",button.x,button.y,button.rad);

  graphics.setFont(myFont);
  graphics.setColor(1,1,1);
  graphics.print("Score : " .. score);
end

function calculateDistance(p1,p2)
  return math.sqrt(math.pow((p1.y - p2.y),2) + math.pow((p1.x - p2.x),2));
end

function love.mousepressed( X, Y, thisButton, istouch, presses )
  if thisButton == 1 then
    dist = calculateDistance({x=X,y=Y} , {x=button.x,y=button.y});
    if dist < button.rad then
      score = score + 1;
      button.x = math.random(button.rad, love.graphics.getWidth() - button.rad);
      button.y = math.random(button.rad, love.graphics.getHeight() - button.rad);
    end
  end
end
