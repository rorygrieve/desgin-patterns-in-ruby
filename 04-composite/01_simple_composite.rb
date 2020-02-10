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

class MakeBatterTask < Task
  def initialize
    super('Make batter')
    @sub_tasks = []
  end

   def add_sub_task(task)
    @sub_tasks << task
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

make_batter_task = MakeBatterTask.new

add_dry_ingredients_task = AddDryIngredientsTask.new
add_liquids_task = AddLiquidsTask.new
mix_task = MixTask.new

puts make_batter_task.get_time_required

make_batter_task.add_sub_task(add_dry_ingredients_task)
make_batter_task.add_sub_task(add_liquids_task)
make_batter_task.add_sub_task(mix_task)
puts make_batter_task.get_time_required

make_batter_task.remove_sub_task(add_dry_ingredients_task)
make_batter_task.remove_sub_task(add_liquids_task)
make_batter_task.remove_sub_task(mix_task)
puts make_batter_task.get_time_required
