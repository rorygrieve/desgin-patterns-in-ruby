require "./07-adapter/03_british_text_object"

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
  def color
    return colour
  end

  def text
    return string
  end

  def size_inches
    return size_mm / 25.4
  end
end

text_object = BritishTextObject.new("large object", 27, "red")
renderer = Renderer.new

renderer.render(text_object)
