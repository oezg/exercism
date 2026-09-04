local codes = {
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

local solution = {}
solution.colors = function()
	return codes
end

solution.color_code = function(color)
	for i, v in ipairs(codes) do
		if v == color then
			return i - 1
		end
	end
	error("invalid color: " .. color)
end

return solution
