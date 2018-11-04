require 'gosu'
# drawing the static gallows frame
class Gallows
  attr_accessor :head, :torso, :arm_right, :arm_left, :leg_right, :leg_left

  SIZE = 10

  WHITE = Gosu::Color::WHITE
  BROWN = Gosu::Color.rgb(173, 108, 12)
  PURPLE = Gosu::Color.rgb(113, 27, 150)

  def initialize
    @x = 460
    @y = 470
    @head = false
    @torso = false
    @arm_right = false
    @arm_left = false
    @leg_right = false
    @leg_left = false
  end

  def draw
    # .draw_rect(x, y, width, height, c)
    # .draw_triangle(x1, y1, c1, x2, y2, c2, x3, y3, c3)
    Gosu.draw_rect(@x, @y, 160, SIZE, WHITE) # gallows platform
    Gosu.draw_rect(540, 130, SIZE, @y, WHITE) # main pole
    Gosu.draw_rect(380, 130, 160, SIZE, WHITE) # horizontal top
    Gosu.draw_rect(380, 140, SIZE, 30, WHITE) # short top line
    Gosu.draw_line(480, 130, WHITE, 540, 180, WHITE) # support line
    Gosu.draw_rect(382, 170, 6, 15, BROWN) if @head # rope
    Gosu.draw_triangle(385, 185, PURPLE, 350, 240, PURPLE, 420, 240, PURPLE) if @head
    Gosu.draw_rect(380, 240, SIZE, 100, PURPLE) if @torso
    Gosu.draw_rect(385, 270, 60, SIZE, PURPLE) if @arm_right
    Gosu.draw_rect(330, 270, 60, SIZE, PURPLE) if @arm_left
    Gosu.draw_rect(380, 330, 20, SIZE, PURPLE) if @leg_right # right hip
    Gosu.draw_rect(400, 330, SIZE, 90, PURPLE) if @leg_right # right leg
    Gosu.draw_rect(360, 330, 20, SIZE, PURPLE) if @leg_left # left hip
    Gosu.draw_rect(360, 330, SIZE, 90, PURPLE) if @leg_left # left leg
  end
end
