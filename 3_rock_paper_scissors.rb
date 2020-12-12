# frozen_string_literal: true

class Game
  CHOICES = %w[Rock Paper Scissors].freeze
  WINNING = [%w[Paper Rock], %w[Rock Scissors], %w[Scissors Paper]].freeze

  def initialize
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
    @current_player = @player_1
  end

  def play
    loop do
      2.times do
        @current_player.get_choice
        switch_player
      end
      break if winner
    end
  end

  def switch_player
    system('clear')
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def winner
    result = [@player_1.choice, @player_2.choice]
    puts "\n#{@player_1.name} chooses #{@player_1.choice}, and #{@player_2.name} chooses #{@player_2.choice}."
    puts 'That means thaaaaat...'
    if result[0] == result[1]
      puts "...you're tied, try again\n\n"
      false
    else
      puts WINNING.include?(result) ? "#{@player_1.name.upcase} WINS!!" : "#{@player_2.name.upcase} WINS!!\n\n"
      true
    end
  end
end

class Player
  attr_reader :name, :choice

  def initialize(name)
    @name = name
  end

  def get_choice
    @choice = nil
    loop do
      @choice = ask_choice
      break if valid_choice?(choice)
    end
  end

  def ask_choice
    puts "#{@name}, choose Rock (R), Paper (P) or Scissors (S)" if @choice.nil?
    case gets.chomp.upcase
    when /p/i then 'Paper'
    when /r/i then 'Rock'
    when /s/i then 'Scissors'
    else ''
    end
  end

  def valid_choice?(choice)
    if choice.match(/[rps]/i)
      true
    else
      puts "That's not a valid option! Choose R, P or S"
      false
    end
  end
end

game = Game.new
game.play

# ##AGAINST COMPUTER
# class Game
#   def initialize
#     @player_1 = Player.new("Player 1")
#   end

#   CHOICES = %w[Rock Paper Scissors]

#   def play
#     @player_1.get_choice
#     puts "#{@player_1.name}, you choose #{@player_1.choice}"
#     @computer_choice = CHOICES[rand 2]
#     puts "Computer chooses #{@computer_choice}"
#     winner
#   end

#   WINNING = [["Paper", "Rock"],["Rock", "Scissors"],["Scissors", "Paper"]]

#   def winner
#     result = [@player_1.choice, @computer_choice]
#     if result[0] == result[1]
#       puts "Tied, try again"
#     elsif WINNING.include?(result)
#       puts "YOU WIN!!"
#     else
#       puts "Next time... maybe"
#     end
#   end

# end

# class Player
#   attr_reader :name, :choice

#   def initialize(name)
#     @name = name
#   end

#   def get_choice
#     loop do
#       @choice = ask_choice
#       break if valid_choice?(choice)
#     end
#   end

#   def ask_choice
#     puts "#{@name}, choose Rock (R), Paper (P) or Scissors (S)" if @choice.nil?
#     case (gets.chomp.upcase)
#       when /p/i then "Paper"
#       when /r/i then "Rock"
#       when /s/i then "Scissors"
#       else ""
#     end
#   end

#   def valid_choice?(choice)
#     if choice.match /[rps]/i
#       true
#     else
#       puts "That's not a valid option! Choose R, P or S"
#       false
#     end
#   end

# end

# game = Game.new
# game.play
