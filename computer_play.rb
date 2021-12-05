# frozen_string_literal: true

require './mastermind'

# Class controlling the computer logic
class ComputerPlay < Mastermind
  def initialize
    possible_guesses
    super
  end

  def start_game
    12.times do |turn|
      puts "Turn #{turn + 1}"
      @guess = %w[1 1 2 2] if turn.zero?
      break if @guess == @secret

      choose_guess(@guess)
      puts give_clue(@guess, @secret)
    end
    puts game_over
  end

  def choose_guess(guess)
    @clue = give_clue(guess, @secret).split(':').pop
    remove_guesses(guess, @clue)
    @guesses.shift
  end

  def remove_guesses(guess, clue)
    @guesses.select! { |n| give_clue(guess, n.split('')).split(':').pop == clue }
    @guess = @guesses[0].split('')
  end

  def possible_guesses
    guesses = []
    (0..1295).each { |n| guesses << (n.to_s(6).to_i + 1111).to_s}
    @guesses = guesses
  end

  def set_secret
    count = 0
    secret = gets.chomp
    secret.split('').each do |char|
      count += 1 if char.between?('1', '6')
    end
    count == 4 ? @secret = secret.split('') : invalid_secret
  end

  def invalid_secret
    puts 'Invalid secret, individual values must be between 1 and 6'
    set_secret
  end
end
