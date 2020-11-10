# frozen_string_literal: true

class Game
  def initialize
    @board = Board.new
  end

  def play
    until @board.winning?
      @board.coordinates
      @board.new_board
      @board.display
    end
    puts 'CONGRATULATIONS!!'
    puts
  end
end

class Board
  attr_accessor :board

  def initialize
    puts 'How many disks?'
    @n = gets.chomp.to_i
    @board = Array.new(3) { Array.new(@n) }
    @board[0] = (1..@n).map { |n| 'o' * n }
    @round = 1
    display
  end

  def display
    puts
    puts "1\t2\t3"
    puts '__________________'
    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts
  end

  def coordinates
    if @round == 1
      puts 'To move the disks, input two numbers separated by a space:'
      puts    'the first one is the column you take the disk FROM,'
      puts    'the second is the column you move the disk TO.'
      puts 'V.gr.: 1 3 will move the disk from column 1 to column 3.'
      puts
      @round = 'x'
    end
    loop do
      puts 'Where to move?'
      coord = gets.chomp.split(' ').map { |c| c.to_i - 1 }
      @column_nr_from = coord[0]
      @column_nr_to = coord[1]
      next unless check_coordinates_format

      @column_from = @board[@column_nr_from]
      @column_to = @board[@column_nr_to]
      @disk = @column_from.find { |d| !d.nil? }
      break if check_coordinates_position
    end
  end

  def check_coordinates_format
    if !@column_nr_from.nil? && !@column_nr_to.nil?
      true if (0..2).include?(@column_nr_from) && (0..2).include?(@column_nr_to)
    else
      puts 'Wrong input!'
    end
  end

  def check_coordinates_position
    check_coordinates_start && check_coordinates_finish
  end

  def check_coordinates_start
    if @column_from[@n - 1].nil?
      puts "No disk on column #{@column_nr_from + 1}"
    else
      true
    end
  end

  def check_coordinates_finish
    if @column_to[@n - 1].nil? || @disk < @column_to.find { |d| !d.nil? }
      true
    else
      puts 'A disk can only be put on top of a bigger one'
    end
  end

  def new_board
    @column_from[@column_from.index(@disk)] = nil
    @column_to.shift
    idx = @column_to.find_index { |d| !d.nil? } || @n - 1
    @column_to.insert(idx, @disk)
  end

  def winning?
    @board[2] == (1..@n).map { |n| 'o' * n }
  end
end

game = Game.new
game.play
