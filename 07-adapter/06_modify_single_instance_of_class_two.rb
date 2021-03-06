class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    puts text
    puts size
    puts color
  end
end

class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @string = string
    @size_mm = size_mm
    @colour = colour
  end
end

bto = BritishTextObject.new('hello', 50.8, :blue)

def bto.color
  colour
end

def bto.text
  string
end

def bto.size_inches
  return size_mm/25.4
end

renderer = Renderer.new

renderer.render(bto)
