class Game
  require_relative 'mastermind'
  require_relative 'computer_play'
  def initialize
    @selected = false
    selection_screen
  end

  def singleplayer
    @selected = true
    puts `clear`
    puts 'Pick a 4 digit code to guess the secret.'
    Mastermind.new
    sleep 2
    puts `clear`
    selection_screen
  end

  def versus_computer
    @selected = true
    puts `clear`
    puts 'Pick a 4 digit code for the computer to crack.'
    ComputerPlay.new
    sleep 2
    puts `clear`
    selection_screen
  end

  def selection_screen
    puts `clear`
    puts "Select game mode: \n 1) to be the guesser, \n 2) to be the mastermind or\n 3) to see the game rules"
    selection = gets.chomp
    singleplayer if selection == '1'
    versus_computer if selection == '2'
    tutorial if selection == '3'
    puts `clear` unless @selected
    puts 'Invalid choice, please try again!' unless @selected
    selection_screen unless @selected
  end

  def tutorial
    puts `clear`
    @selected = true
    puts "Mastermind is a game about trying to figure out a pattern, \n every turn you pick 4 numbers to guess, ranging from 1 to 6, \n if your choice is correct, you win."
    puts '------------------------------------'
    puts "Two kinds of clues(★ ☆ ) are given when you guess: \n- ★  means you have a number with correct value AND position,\n- ☆  means you have a number with correct value but INCORRECT position"
    puts '------------------------------------'
    puts 'Press enter to go back to selection screen.'
    gets
    selection_screen
  end
end

Game.new
