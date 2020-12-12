# frozen_string_literal: true

class LinkedList
  def initialize
    @head = nil
  end

  # Methods to modify the linked list
  def append(value)
    if @head
      go_to_tail
      @current.next = Node.new(value)
    else
      @head = Node.new(value)
    end
    value
  end

  def prepend(value)
    temp = @head
    @head = Node.new(value)
    @head.next = temp
    value
  end

  def pop
    enter_list
    go_to_next until @current.next.next.nil?
    popped = @current.next.value
    @current.next = nil
    popped
  end

  def insert_at(value, index)
    go_to_index(index - 1)
    pre = @current
    go_to_next
    pre.next = Node.new(value)
    pre.next.next = @current
    pre.next.value
  end

  def remove_at(index)
    go_to_index(index + 1)
    post = @current
    go_to_index(index - 1)
    removed = @current.next.value
    @current.next = post
    removed
  end

  # Methods to traverse the linked list
  def enter_list
    @current = @head
  end

  def go_to_next
    @current = @current.next
  end

  def go_to_index(index)
    enter_list
    (index - 1).times { go_to_next }
  end

  def go_to_tail
    enter_list
    go_to_next until @current.next.nil?
  end

  # Methods to gain information about the linked list
  def contains?(value)
    enter_list
    until @current.nil?
      return true if @current.value == value

      go_to_next
    end
    false
  end

  def find(value)
    enter_list
    counter = 1
    until @current.nil?
      return counter if @current.value == value

      counter += 1
      go_to_next
    end
    '... oh no, it doesn\'t exist!'
  end

  def size
    enter_list
    counter = 1
    until @current.next.nil?
      counter += 1
      go_to_next
    end
    counter
  end

  def head
    @head.value
  end

  def tail
    go_to_tail
    @current.value
  end

  def at(index)
    return "... oops, this list only has #{size} nodes!" unless index <= size

    go_to_index(index)
    @current.value
  end

  def to_s
    return puts 'Empty list' unless @head

    enter_list
    until @current.nil?
      print "( #{@current.value} ) -> "
      go_to_next
    end
    puts 'nil'
  end
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

list = LinkedList.new
puts "#{list.append(30)} appended"
puts "#{list.prepend(20)} prepended"
puts "#{list.append(40)} appended"
puts "#{list.prepend(10)} prepended"
list.to_s
puts "This list has #{list.size} nodes"
puts "The value of the head node is #{list.head}"
puts "The value of the tail node is #{list.tail}"
puts "The value of the node at index 3 is #{list.at(3)}"
puts "The value of the node at index 9 is #{list.at(9)}"
puts "#{list.pop} popped!"
list.to_s
puts "The value of the node at index 4 is #{list.at(4)}"
puts "#{list.pop} popped!"
puts "#{list.prepend(5)} prepended"
puts "#{list.append(25)} appended"
list.to_s
puts "10 is included! #{list.contains?(10)}"
puts "99 is included! #{list.contains?(99)}"
puts "20 is at index #{list.find(20)}"
puts "99 is at index #{list.find(99)}"
puts "#{list.insert_at(15, 3)} at index 3 added"
puts "#{list.insert_at(22, 5)} at index 5 added"
list.to_s
puts "#{list.remove_at(5)} at index 5 removed"
list.to_s
