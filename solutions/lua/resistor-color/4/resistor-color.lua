local colors = {
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

local codes = {}
for i, color in ipairs(colors) do
	codes[color] = i - 1
end

return {
	colors = function() return colors end,
	color_code = function(color) return codes[color] end,
}
