module PuzzlesHelper
  def display_words(word_string)
    word_string.split(',').map do |word|
      word += random_chars
    end.join('')
  end

  def random_chars
    num = rand(0..60)
    Puzzle::Chars.sample(num).join('')
  end

  def number_tries
    ['four','three','two','one','zero'][@puzzle.guesses]
  end
end
