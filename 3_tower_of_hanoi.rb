class Board
  def initialize(n)
    @board = Array.new(3){Array.new(n)}
    @n = n
    first_display
  end

  def first_display
    @board[0] = (1..@n).map {|n| "o" * n }
    @board[1] = (1..@n).map {"|"}
    @board[2] = (1..@n).map {"|"}

    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts
  end

  def display
    @coord = [0, 1]
    idx = @board[@coord[0]].find_index {|pos| pos.include? "o"}
    temp = @board[@coord[0]][idx]
    @board[@coord[0]][idx] = "|"

    idx = @board[@coord[1]].find_index {|pos| pos.include? "|"}
    @board[@coord[1]][idx] = temp

    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts
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

class Move
end

game = Board.new(4)
game.display

