# frozen_string_literal: true

# Module responsible for giving out clues to both human and computer players
module Clues
  def give_clue(guess, secret)
    @clue = "#{guess.join}: "
    @minor_clue = ''
    secret.each_with_index { |digit, index| major_clue(guess, digit, index)}
    @clue += @minor_clue
  end

  def major_clue(guess, digit, index)
    guess[index] == digit ? @clue += ' ★ ' : minor_clue(guess, digit)
  end

  def minor_clue(guess, digit)
    @minor_clue += ' ☆ ' if guess.include?(digit)
  end
end
