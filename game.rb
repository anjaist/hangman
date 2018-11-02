require 'gosu'
require_relative 'gallows'

# game window and application run
class Game < Gosu::Window
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 480

  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Hangman: The Game'

    @gallows = Gallows.new
    @font = Gosu::Font.new(self, "Arial", 20)
    @font_big = Gosu::Font.new(self, 'Arial', 58)
    @game_over = false
    @paused = false
  end

  def update
    unless @paused || @game_over
    end
  end

  def draw
    @gallows.draw
    @font.draw_text("SCORE: #{@timer}", WINDOW_WIDTH - 150, 20, 1, 1.0, 1.0, Gosu::Color::AQUA)
    @font_big.draw_text('PAUSED', 100, 100, 1, 1.0, 1.0, Gosu::Color::YELLOW) if @paused
    @font_big.draw_text('GAME OVER', 100, 100, 1, 1.0, 1.0, Gosu::Color::RED) if @game_over
  end

  def toggle_paused
    @paused = !@paused
  end

  def button_down(id)
    case id
    when Gosu::KbEscape then close
    when Gosu::KB_P then toggle_paused
    end
  end
end

Game.new.show
