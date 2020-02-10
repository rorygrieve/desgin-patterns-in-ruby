class Task
  attr_reader :name
  attr_accessor :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end

  def total_number_basic_tasks
    1
  end
end

class AddDryIngredientsTask < Task

  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class AddLiquidsTask < Task
  def initialize
    super('Add those liquids!')
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task

  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3.0
  end
end

class CookCakeTask < Task
  def initialize
    super('Cook cake!')
  end

  def get_time_required
    60.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time=0.0
    @sub_tasks.each {|task| time += task.get_time_required}
    time
  end

  def total_number_basic_tasks
    total = 0
    @sub_tasks.each {|task| total += task.total_number_basic_tasks}
    total
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
  end
end

make_batter_task = MakeBatterTask.new

add_dry_ingredients_task = AddDryIngredientsTask.new
add_liquids_task = AddLiquidsTask.new
mix_task = MixTask.new

make_batter_task << (add_dry_ingredients_task)
make_batter_task << (add_liquids_task)
make_batter_task << (mix_task)

make_cake_task = MakeCakeTask.new
cook_cake_task = CookCakeTask.new

make_cake_task << (make_batter_task)
make_cake_task << (cook_cake_task)

puts make_cake_task.total_number_basic_tasks
puts make_batter_task.total_number_basic_tasks
puts add_liquids_task.total_number_basic_tasks
