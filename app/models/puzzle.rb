class Puzzle < ActiveRecord::Base
  after_create :init
  Chars = "!@#$%^&*()_-+=~`<>,./?;:|{}[]ßå∂œ∑´®†¥¨ˆøπåß∂ƒ©˙∆˚¬Ω≈ç√∫˜µ≤≥".split('')

  def init
    word_size  = [4,6,8][difficulty]
    new_words  = CleanWords::Random.new.fetch(word_size,20).map(&:upcase)
    self.words = new_words.join(',')
    self.secret_word = new_words.sample
    self.save!
  end

  def guess(word)
    self.guesses += 1
    word.upcase!
    if guesses > 4
      "Sorry. You failed to guess within 4 tries."
    elsif word == secret_word
      "Success! You guessed the the secret word!"
    elsif words.include?(word)
      "You guessed #{word}. Likeness=#{likeness(word)}"
    else
      "Word not found in puzzle."
    end
  end

  def likeness(word)
    matches = 0
    word.upcase.split('').each_with_index do |l,i|
      matches +=1 if l == secret_word[i]
    end
    matches
  end
end