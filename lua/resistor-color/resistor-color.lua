local codes = {
	black = 0,
	brown = 1,
	red = 2,
	orange = 3,
	yellow = 4,
	green = 5,
	blue = 6,
	violet = 7,
	grey = 8,
	white = 9,
}

local solution = {}
solution.colors = function()
	return {
		"black",
		"brown",
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"violet",
		"grey",
		"white",
	}
end

solution.color_code = function(color)
	return codes[color] or error("invalid color: " .. color)
end

return solution
