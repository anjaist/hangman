require 'gosu'
require 'random-word'
# generating word and game logic
class Word
  attr_reader :length
  def initialize
    @word = generate_word
    @length = @word.length
  end

  def generate_word
    i = rand(0..1)
    RandomWord.exclude_list << /_|ae/
    a = RandomWord.nouns.next
    b = RandomWord.adjs.next
    word = [a, b]
    word[i]
  end
end
