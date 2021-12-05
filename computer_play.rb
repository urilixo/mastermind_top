# frozen_string_literal: true

require_relative './mastermind'

# Class controlling the computer logic
class ComputerPlay < Mastermind
  def start_game
  end

  def player_guess
  end

  def set_secret
    count = 0
    guess = gets.chomp
    guess.split('').each do |char|
      count += 1 if char.between?('1', '6')
    end
    count == 4 ? @guess = guess.split('') : invalid_secret
  end

  def invalid_secret
    puts 'Invalid secret, individual values must be between 1 and 6'
    set_secret
  end

  def generate_possible
    possible = Array.new(4) { Array.new(6) { Array(1..6) } }
  end

end