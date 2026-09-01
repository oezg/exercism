local codes = {
        'black', --
        'brown', --
        'red', --
        'orange', --
        'yellow', --
        'green', --
        'blue', --
        'violet', --
        'grey', --
        'white'
    }

return {

  colors = function() return codes
end,
  color_code = function(color)
      for i, v in ipairs(codes) do
          if v == color then return i - 1 end
      end
      error(string.format("invalid color: %s", color))
  end,

}
