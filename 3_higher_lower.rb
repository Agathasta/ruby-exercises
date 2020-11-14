# frozen_string_literal: true

class HigherOrLower
  def initialize
    @num = rand(1..10)
    puts 'The computer has chosen! Your turn to guess!'
    @guesses_counter = 0
    play
  end

  def play
    loop do
      guess
      correct_result
      break if finish?
    end
    bye
  end

  def guess
    ask_guess
    @guess = gets.chomp.to_i
    @guesses_counter += 1
  end

  def ask_guess
    puts 'Enter a number between 1 - 10'
    print '> '
  end

  def correct_result
    correct unless finish?
  end

  def finish?
    @guess == @num || @guesses_counter >= 3
  end

  def correct
    puts 'Go up!' if @guess < @num
    puts 'Go down!' if @guess > @num
  end

  def bye
    puts @guess == @num ? 'Congratulations Casandra!' : "Wrong, it was #{@num}!!"
  end
end

HigherOrLower.new
