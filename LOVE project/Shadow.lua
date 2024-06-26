local love = require("love");

function Shadow(shadow, observer)

    local SPEED_DELAY = 0.5;
    local _x, _y = 1, 1;

    return
    {

        
        x = _x,
        y = _y,

        shadow = love.graphics.newImage(shadow) or love.graphics.newImage('project LOML/HAPPYguySHADOW'),

        move = function(self, OBSERVER_X, OBSERVER_Y, SPEED)

            if OBSERVER_x - self.x > 0 then
                self.x = self.x + (SPEED - SPEED_DELAY);
            elseif OBSERVER_x - self.x < 0 then
                self.x = self.x - (SPEED - SPEED_DELAY);
            end

            if OBSERVER_y - self.y > 0 then
                self.y = self.y + (SPEED - SPEED_DELAY);
            elseif OBSERVER_y - self.y < 0 then
                self.y = self.y - (SPEED - SPEED_DELAY);
            end
        end,

        draw = function (self, scalefactor) 
        
            love.graphics(shadow, self.x, self.y, 0, scalefactor, scalefactor);

        end
    }


end

return Shadow;






-- TRY TO CALL THIS IN MAIN.LUA