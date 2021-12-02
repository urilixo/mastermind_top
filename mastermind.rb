class Mastermind
  def initialize
    random_secret
    p @secret
    player_guess
    give_clue
    p @clue
    p @guess
  end

  private

  # generates random passcode
  def random_secret
    @secret = Array.new(4) { rand(1..6).to_s }
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

  def give_clue
    @clue = ''
    @minor_clue = ''
    @secret.each_with_index { |digit, index| major_clue(digit, index)}
    @clue += @minor_clue
  end

  def major_clue(digit, index)
    @guess[index] == digit ? @clue += ' ★ ' : minor_clue(digit)
  end

  def minor_clue(digit)
    @minor_clue += ' ☆ ' if @guess.include?(digit)
  end
end

game = Mastermind.new