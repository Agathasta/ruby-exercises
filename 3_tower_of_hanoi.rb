# program ToH

#   √ ask user num of disks   GAME
#   √ create board    BOARD
#   √ display boards    BOARD
#   loop do   GAME
#     √ ask user coordinates   GAME
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

class Game
  def initialize
    @board = Board.new
  end

  def play
    until @board.winning?
      @board.coordinates?
      @board.new_board
    end
  end

end

class Board
  attr_accessor :board

  def initialize
    puts "How many disks?"
    @n = gets.chomp.to_i
    @board = Array.new(3){Array.new(@n)}
    @board[0] = (1..@n).map {|n| "o" * n }
    @round = 1
    display
  end

  def display
    puts
    puts "1\t2\t3"
    puts "__________________"
    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts     
  end

  def coordinates?
    if @round == 1
      puts "To move the disks, input two numbers separated by a space:"
      puts  "the first one is the column you take the disk FROM,"
      puts  "the second is the column you move the disk TO."
      puts "V.gr.: 1 3 will move the disk from column 1 to column 3."
      puts
      @round = "x"
    end
    loop do
      puts "Where to move?"
      @coord = gets.chomp.split(" ").map{|c| c.to_i - 1}
      break if check_coordinates_format && check_coordinates_start
    end
  end

  def check_coordinates_format
    if ((0..2).include? (@coord[0])) && ((0..2).include? (@coord[1]))
      true
    else
      puts "Wrong input!"
    end
  end

  def check_coordinates_start
    if @board[@coord[0]][@n - 1].nil?
      puts "No disk on that column"
    else 
      true
    end
  end


  def new_board
    column_0 = @board[@coord[0]]
    column_1 = @board[@coord[1]]

    @disk = column_0.find {|d| !d.nil?}
    column_0[column_0.index(@disk)] = nil

    column_1.shift
    idx = column_1.find_index {|d| !d.nil?} || @n - 1
    column_1.insert(idx, @disk)
    display
  end

  def winning?
    @board[2] == (1..@n).map {|n| "o" * n }
  end
end

game = Game.new
game.play