require_relative "display"

class Player
  def initialize(display)
    @display = display
  end

  def move
    result = nil
    until result
      system('clear')
      @display.render
      result = @display.get_input
    end
    result
  end
end
