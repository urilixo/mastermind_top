class Game
  require_relative 'mastermind'
  include Mastermind
  def initialize
    selection_screen
  end

  def singleplayer
    puts `clear`
    Mastermind.new
    sleep 20
    puts `clear`
    selection_screen
  end

  def selection_screen
    puts "Select game mode: \n 1) Pick 1 to be the guesser, "
    puts ' 2) Pick 2 to be the mastermind, or'
    puts ' 3) To see the game rules'
    selection = gets.chomp
    singleplayer if selection == '1'
  end

  def tutorial
    puts 'rules of the game here or something'
  end
end

Game.new
