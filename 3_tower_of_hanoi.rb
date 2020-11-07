# program ToH

#   ask user num of disks   GAME
#   √ create board    BOARD
#   √ display boards    BOARD
#   loop do   GAME
#     ask user coordinates   GAME
#     if position is not empty    BOARD
#       display message
#     elsif there is a smaller disk before    BOARD
#       display message
#     else
#       change board    BOARD
#     end
#     display board    BOARD
#     if last pole has all the disks
#       display message
#       stop loop
#   end

# end

class Game
  def initialize
    @board = Board.new
  end

  def play
    @board.coordinates?
    @board.new_board
  end

end



class Board
  attr_accessor :board

  def initialize
    puts "How many disks?"
    @n = gets.chomp.to_i
    @board = Array.new(3){Array.new(@n)}
    @board[0] = (1..@n).map {|n| "o" * n }
    @board[1] = (1..@n).map {"|"}
    @board[2] = (1..@n).map {"|"}
    display
  end

  def display
    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts     
  end

  def coordinates?
    puts "Where to move?"
    @coord = gets.chomp.split(",").map{|c| c.to_i - 1}
    print @coord
    puts
  end

  def new_board
    idx = @board[@coord[0]].find_index {|pos| pos.include? "o"}
    temp = @board[@coord[0]][idx]
    @board[@coord[0]][idx] = "|"

    idx = @board[@coord[1]].find_index {|pos| pos.include? "|"}
    @board[@coord[1]][idx] = temp

    display
  end

end

# @board = [[o, oo, ooo, oooo], [nil, nil, nil, nil], [nil, nil, nil, nil]]


#     @board.each do |row|
#       row.each do
#         puts i + @n
#       end
#       puts
#     end  
#   end
# end



game = Game.new
game.play

