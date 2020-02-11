class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['red', 'green', 'blue']

i = ArrayIterator.new(array)

while i.has_next?
  puts("item: #{i.next_item}")
end

i_with_string = ArrayIterator.new('abc')

while i_with_string.has_next?
  puts("item: #{i_with_string.next_item}")
end


