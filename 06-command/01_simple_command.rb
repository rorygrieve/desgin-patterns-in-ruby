class SlickButton
  attr_accessor :command
  def initialize(command)
    @command = command
  end

  #
  # Lots of button drawing and management
  # code omitted...
  #

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    puts "Save something!"
  end
end

save_button = SlickButton.new( SaveCommand.new )
save_button.on_button_push
