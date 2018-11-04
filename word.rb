require 'gosu'
require 'random-word'
# generating word and game logic
class Word
  attr_reader :word, :hidden
  def initialize
    @word = generate_word
    @hidden = hide_word
  end

  def generate_word
    i = rand(0..1)
    RandomWord.exclude_list << /_|ae/
    a = RandomWord.nouns.next
    b = RandomWord.adjs.next
    word = [a, b]
    word[i].upcase
  end

  def hide_word
    @hidden = @word.gsub(/[A-Z]/, '_ ')
  end

  def reveal_letter(arr)
    @word.gsub(/[^#{arr.join}]/, '_ ')
  end
end
