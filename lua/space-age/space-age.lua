local orbits = {
    Mercury = 0.2408467,
    Venus = 0.61519726,
    Earth = 1.0,
    Mars = 1.8808158,
    Jupiter = 11.862615,
    Saturn = 29.447498,
    Uranus = 84.016846,
    Neptune = 164.79132,
}


local earth_year = 31557600

local function round(n)
    return n < 0 and math.ceil(n - 0.5) or math.floor(n + 0.5)
end

local function round_2(n)
    return round(n * 100) / 100
end

local SpaceAge = {}
SpaceAge.__index = SpaceAge

function SpaceAge:new(seconds)
    return {
        on_earth = function()
            return round_2(seconds / earth_year)
        end,
        on_mercury = function()
            return round_2(seconds / earth_year / orbits.Mercury)
        end,
        on_venus = function()
            return round_2(seconds / earth_year / orbits.Venus)
        end,
        on_mars = function()
            return round_2(seconds / earth_year / orbits.Mars)
        end,
        on_jupiter = function()
            return round_2(seconds / earth_year / orbits.Jupiter)
        end,
        on_saturn = function()
            return round_2(seconds / earth_year / orbits.Saturn)
        end,
        on_uranus = function()
            return round_2(seconds / earth_year / orbits.Uranus)
        end,
        on_neptune = function()
            return round_2(seconds / earth_year / orbits.Neptune)
        end,
        on_sun = function()
            error('not a planet')
        end
    }
end

return SpaceAge
