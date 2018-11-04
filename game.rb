require 'gosu'
require_relative 'gallows'
require_relative 'word'

# game window and application run
class Game < Gosu::Window
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 480

  GREEN = Gosu::Color.rgb(74, 219, 139)
  RED = Gosu::Color.rgb(219, 4, 54)
  LIGHT_BLUE = Gosu::Color.rgb(192, 229, 227)

  GOSU_KB_VALUES = { 4 => 'A', 5 => 'B', 6 => 'C', 7 => 'D',
                     8 => 'E', 9 => 'F', 10 => 'G', 11 => 'H',
                     12 => 'I', 13 => 'J', 14 => 'K', 15 => 'L',
                     16 => 'M', 17 => 'N', 18 => 'O', 19 => 'P',
                     20 => 'Q', 21 => 'R', 22 => 'S', 23 => 'T',
                     24 => 'U', 25 => 'V', 26 => 'W', 27 => 'X',
                     28 => 'Y', 29 => 'Z' }.freeze

  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Hangman: The Game'

    @gallows = Gallows.new
    p @password = Word.new
    @font = Gosu::Font.new(self, 'Arial', 20)
    @font_big = Gosu::Font.new(self, 'Arial', 58)
    @game_over = false
    @color = LIGHT_BLUE
    @rightly_guessed = []
    @wrongly_guessed = []
  end

  def guess
    @user_guess = GOSU_KB_VALUES[@numeric_guess]
    if @user_guess.nil?
      @hidden = @password.hidden
    elsif @password.word.include? @user_guess
      @rightly_guessed << @user_guess
      @color = GREEN
      @hidden = @password.reveal_letter(@rightly_guessed)
    else
      @color = RED
      @wrongly_guessed << @user_guess
    end
  end

  def draw_hanged_man
    case @wrongly_guessed.uniq.length
    when 1 then @gallows.head = true
    when 2 then @gallows.torso = true
    when 3 then @gallows.arm_right = true
    when 4 then @gallows.arm_left = true
    when 5 then @gallows.leg_left = true
    when 6 then @gallows.leg_right = true
    end
  end

  def check_for_win
    @win = !(@hidden.include? '_')
  end

  def check_for_game_over
    @game_over = @wrongly_guessed.uniq.length == 6
  end

  def update
    unless @game_over
      guess
      draw_hanged_man
      check_for_win
      check_for_game_over
    end
  end

  def draw
    @font.draw_text("Your guess: #{@user_guess}", 50, 150, 1, 1.0, 1.0, @color)
    @gallows.draw
    @font_big.draw_text(@hidden, 50, 55, 1, 1.0, 1.0, LIGHT_BLUE)
    @font.draw_text(@wrongly_guessed.uniq.join(' '), 50, 300, 1, 1.0, 1.0, RED)
    @font_big.draw_text('You won!', 150, 200, 1, 1.0, 1.0, GREEN) if @win
    @font_big.draw_text('Game over', 150, 200, 1, 1.0, 1.0, RED) if @game_over
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    elsif GOSU_KB_VALUES.key?(id)
      @numeric_guess = id.to_i
    end
  end
end

Game.new.show
