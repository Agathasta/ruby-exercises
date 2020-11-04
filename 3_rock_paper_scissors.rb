class Game
  def initialize
    @player_1 = Player.new("Player 1")
  end

  def play
    @player_1.get_choice
    puts "#{@player_1.name}, you choose #{@player_1.choice}"
  end
end

class Player
  attr_reader :name, :choice

  def initialize(name)
    @name = name
  end

  def get_choice
    loop do
      @choice = ask_choice
      if valid_choice?(choice)
        break
      end
    end
  end

  def ask_choice
    puts "#{@name}, choose Rock (R), Paper (P) or Scissors (S)" if @choice.nil?
    gets.chomp.upcase
  end

  def valid_choice?(choice)
    if choice.match /[rps]/i
      true
    else
      puts "That's not a valid option! Choose R, P or S"
      false
    end
  end

end

game = Game.new
game.play
