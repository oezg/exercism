return {
  rotate = function(input, key)
    local function test(n, a, z)
      if n >= a and n <= z then
        return (n - a + key) % 26 + a
      end
    end

    local out = {}
    for index, n in ipairs({ string.byte(input, 1, #input) }) do
      out[index] = test(n, 97, 122) or test(n, 65, 90) or n
    end
    return string.char(table.unpack(out))
  end
}
