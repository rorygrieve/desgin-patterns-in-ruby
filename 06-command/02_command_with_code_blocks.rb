class SlickButton
  attr_accessor :command

  def initialize(&block)
    @command = block
  end

  #
  # Lots of button drawing and management
  # code omitted...
  #

  def on_button_push
    @command.call if @command
  end
end

new_button = SlickButton.new do
  puts "I do something"
end

new_button.on_button_push