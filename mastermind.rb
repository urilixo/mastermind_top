# frozen_string_literal: true

require './clues'

# Class containing methods for player as the codebreaker
class Mastermind
  include Clues
  def initialize
    @turn = 0
    set_secret
    start_game
  end

  private

  # generates random passcode
  def set_secret
    @secret = Array.new(4) { rand(1..6).to_s }
  end

  def start_game
    12.times do |turn|
      puts "Turn #{turn + 1}"
      player_guess
      puts give_clue(@guess, @secret)
      break if @guess == @secret
    end
    puts game_over
  end

  def game_over
    return puts "Defeated! The secret was: #{@secret}" unless @guess == @secret

    "You won!! #{@secret}"
  end

  def player_guess
    count = 0
    guess = gets.chomp
    guess.split('').each do |char|
      count += 1 if char.between?('1', '6')
    end
    count == 4 ? @guess = guess.split('') : invalid_guess
  end

  def invalid_guess
    puts 'Invalid guess, individual values must be between 1 and 6'
    player_guess
  end
end
