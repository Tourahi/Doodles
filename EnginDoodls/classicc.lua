--[[
    classicc
    Copyright (c) 2020, rxi
    This module is free software based on the classic module;
    you can redistribute it and/or modify it under
    the terms of the MIT license. See LICENSE for details.
--]]


local Object = {}; -- the base class.
Object.__index = Object; --[[
                              When this table is set as a metatable of other tables
                              and if we index a key in the new tables that does not
                              exist in them, Lua calls the __index metamethod of the
                              metatable so we can  see if it has the key then invoke
                              its methode or get the value associated with it.
                              so the metatable work as a backup to the main table.
                         --]]
function Object:new()
  -- Constructor
end

function Object:extend(name)
  local newClass = {};
  for key,value in pairs(self) do
    if key:find("__") == 1 then
      newClass[key] = value;
    end
    newClass.__index = newClass; -- in case you make your class a metatable
                                 -- and that will happen if you extend from it.

    newClass.super = self; -- set the super key as the parent class.
                           -- here we use self because lua send it to the function when it get called using ':'.

    setmetatable(newClass,self); -- Set the metatable of your class to the parent.

    -- Here i am dynamically naming the new class.
    --so if you print the instance it will give the class name.
    if name then
      function newClass:__tostring() return name end;
    end
    return newClass;
  end
end

function Object:implement(...)
  for _, newClass in pairs({...}) do
    for key, value in pairs(newClass) do
      if self[key] == nil and type(value) == "function" then
        self[key] = value -- here we hard copy every function of the given classes to the instance of our class.
      end
    end
  end
end

function Object:is(Type)
  -- here we recursively test type
  -- to the name of the tables including the current in our hierarchy.
  local mt = getmetatable(self)
  while mt do
    if mt == Type then
      return true
    end
    mt = getmetatable(mt)
  end
  return false
end

function Object:__call(...) -- So we can call the table as a methode.
  local obj = setmetatable({}, self)
  obj:new(...)
  return obj
end

return Object;
