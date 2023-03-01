module ColorsHepler
  def self.get_random
    rand(255)
  end

  def self.color_hex(options = {})
    default = { red: get_random, green: get_random, blue: get_random }
    options = default.merge(options)
    '#%X%X%X' % options.values
  end

  def generate_colors(count)
    arr = []
    count.times {
      |i| arr[i] = color_hex
    }

    arr
  end
end
