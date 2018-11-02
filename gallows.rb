require 'gosu'

# drawing the static gallows frame
class Gallows
  SIZE = 10

  def initialize
    @x = 460
    @y = 470
    @color = Gosu::Color::WHITE
  end

  def draw
    # .draw_rect(x, y, width, height, c,
    Gosu.draw_rect(@x, @y, 160, SIZE, @color)
    Gosu.draw_rect(540, 130, SIZE, @y, @color)
    Gosu.draw_rect(380, 130, 160, SIZE, @color)
    Gosu.draw_rect(380, 140, SIZE, 30, @color)
    Gosu.draw_line(480, 130, @color, 540, 180, @color)
  end
end
