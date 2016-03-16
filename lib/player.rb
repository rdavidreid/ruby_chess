require_relative "display"

class Player
  attr_reader :color
  def initialize(display, color)
    @display = display
    @color = color
  end

  def move(msg)
    result = nil
    until result
      system('clear')
      @display.render
      puts "#{self.color}'s turn"
      puts msg
      result = @display.get_input
    end
    result
  end
end
