require_relative "display"

class Player
  attr_reader :color
  def initialize(display, color)
    @display = display
    @color = color
  end

  def move
    result = nil
    until result
      system('clear')
      @display.render
      puts "player #{self.color}s turn!"
      result = @display.get_input
    end
    result
  end
end
