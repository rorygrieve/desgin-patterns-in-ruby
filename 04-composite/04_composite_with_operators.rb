class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
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
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time=0.0
    @sub_tasks.each {|task| time += task.get_time_required}
    time
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
puts make_cake_task.get_time_required

make_cake_task << (cook_cake_task)
puts make_cake_task.get_time_required

make_cake_task.remove_sub_task(cook_cake_task)
puts make_cake_task.get_time_required

puts make_cake_task[0].get_time_required
make_cake_task[0] = cook_cake_task
puts make_cake_task[0].get_time_required
