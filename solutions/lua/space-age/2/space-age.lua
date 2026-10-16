local orbits = {
    mercury = 0.2408467,
    venus = 0.61519726,
    earth = 1.0,
    mars = 1.8808158,
    jupiter = 11.862615,
    saturn = 29.447498,
    uranus = 84.016846,
    neptune = 164.79132,
}

return {
    new = function(_, seconds)
        local methods = setmetatable({}, {
            __index = function()
                error('not a planet')
            end
        })
        for planet, orbit in pairs(orbits) do
            methods["on_" .. planet] = function()
                return math.floor(seconds / 315576 / orbit + 0.5) / 100
            end
        end
        return methods
    end
}
