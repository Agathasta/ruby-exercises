# frozen_string_literal: true

class Game
  def initialize
    intro
    @board = Board.new
  end

  def intro
    puts
    puts '***** TOWER OF HANOI *****'
    puts 'The objective of the puzzle is to move all disks to another rod,'
    puts 'obeying the following simple rules:'
    puts '1. Only one disk can be moved at a time.'
    puts '2. No larger disk may be placed on top of a smaller disk.'
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
    loop do
      puts 'How many disks do you want to play with? (minimum 3)'
      print '> '
      @n = gets.chomp.to_i
      break if @n > 2
    end
    @board = Array.new(3) { Array.new(@n) }
    @board[0] = (1..@n).map { |n| 'o' * n }
    display
    intro_moves
  end

  def intro_moves
    puts 'To move the disks, input two numbers separated by a space:'
    puts    'the first one is the rod you take the disk FROM,'
    puts    'the second is the rod you move the disk TO.'
    puts 'V.gr.: 1 3 will move the disk from rod 1 to rod 3.'
    puts
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
    loop do
      puts 'Move disk:'
      print '> '
      coord = gets.chomp.split(' ').map { |c| c.to_i - 1 }
      @rod_nr_from = coord[0]
      @rod_nr_to = coord[1]
      next unless check_coordinates_format

      @rod_from = @board[@rod_nr_from]
      @rod_to = @board[@rod_nr_to]
      @disk = @rod_from.find { |d| !d.nil? }
      break if check_coordinates_position
    end
  end

  def check_coordinates_format
    if !@rod_nr_from.nil? && !@rod_nr_to.nil?
      if (0..2).include?(@rod_nr_from) && (0..2).include?(@rod_nr_to)
        true
      else puts 'There are only 3 rods ;)'
      end
    else
      puts 'Wrong input!'
    end
  end

  def check_coordinates_position
    check_coordinates_start && check_coordinates_finish
  end

  def check_coordinates_start
    if @rod_from[@n - 1].nil?
      puts "No disk on rod #{@rod_nr_from + 1}!"
    else
      true
    end
  end

  def check_coordinates_finish
    if @rod_to[@n - 1].nil? || @disk < @rod_to.find { |d| !d.nil? }
      true
    else
      puts 'A disk can only be put on top of a bigger one! (or on an empty rod)'
    end
  end

  def new_board
    @rod_from[@rod_from.index(@disk)] = nil
    @rod_to.shift
    idx = @rod_to.find_index { |d| !d.nil? } || @n - 1
    @rod_to.insert(idx, @disk)
  end

  def winning?
    @board[2] == (1..@n).map { |n| 'o' * n }
  end
end

game = Game.new
game.play
