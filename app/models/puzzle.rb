class Puzzle < ActiveRecord::Base
  after_initialize :init

  def init
    @words = CleanWords::Random.new.fetch(5,20)
    @words.map(&:upcase)
    self.secret_word = @words.sample
  end

  def words
    @words
  end

  def guess(word)
    self.guesses += 1
    word = retrieve_word(word)
    if word == secret_word
      puts "Correct! The secret word is #{secret_word}."
      puts "You guessed in #{guesses} tries."
    else
      puts "You guessed #{word}"
      puts "Wrong. You have #{4 - guesses} guesses left."
      puts "Likeness = #{likeness(word)}"
    end
  end

  def likeness(word)
    matches = 0
    word.split('').each_with_index do |l,i|
      matches +=1 if l == secret_word[i]
    end
    matches
  end

  def retrieve_word(word)
    if word.is_a?(Integer) && (word + 1).between?(0, @words.count)
      @words[word]
    elsif @words.include? word
      word
    else
      raise "Word not found in puzzle."
    end
  end

end