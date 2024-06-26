local love = require "love";
local shadow = require "Shadow";

function Enemy(level)

    local dice = math.random(1, 4);
    local _x, _y;
    local _radius = 20;

    local sprite = love.graphics.newImage('project LOML/ANGRYguy.png');

    local scalefactor = 0.3;

    local mySHADOW = shadow('project LOML/ANGRYguySHADOW.png');

    if dice == 1 then
        _x = math.random(_radius, love.graphics.getWidth());
        _y = -_radius * 4;

    elseif dice == 2 then
            _x = -_radius * 4;
            _y = math.random(_radius, love.graphics.getHeight());
    elseif dice == 3 then
            _x = math.random(_radius, love.graphics.getWidth());
            _y = love.graphics.getHeight() + (_radius * 4)
    else
            _x = love.graphics.getWidth() + (_radius * 4);
            _y = math.random(_radius, love.graphics.getHeight());
    end

    return
    {

        checkTouched = function (self, player_x, player_y, cursor_radius)
            
            return math.sqrt((self.x - player_x) ^ 2 + (self.y - player_y) ^ 2) <= cursor_radius*2;

        end,


        level = level or 1,
        radius = _radius,
        x = _x,
        y = _y,

        move = function (self, player_x, player_y)
            if player_x - self.x > 0 then
                self.x = self.x + self.level;
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level;
            end

            if player_y - self.y > 0 then
                self.y = self.y + self.level;
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level;
            end

            mySHADOW:move(player_x, player_y, self.level);

        end,

        draw = function (self)

            love.graphics.draw(sprite, self.x, self.y, 0, 0.3, 0.3);
            mySHADOW:draw(scalefactor);


            --love.graphics.setColor(200, 200, 200);

            --love.graphics.circle("fill", self.x, self.y, self.radius);

            --love.graphics.setColor(200, 100, 15);
        end
    }

end

return Enemy;