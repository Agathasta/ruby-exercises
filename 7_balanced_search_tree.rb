# frozen_string_literal: true

class Tree
  attr_reader :root, :array

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array)
  end

  def build_tree(array)
    return nil if array.empty?

    middle = array.length / 2
    node = Node.new(array[middle])
    node.left = build_tree(array[0...middle])
    node.right = build_tree(array[(middle + 1)..-1])
    node
  end

  def insert(data, node = root)
    return nil if node.data == data

    if data < node.data
      node.left.nil? ? node.left = Node.new(data) : insert(data, node.left)
    else
      node.right.nil? ? node.right = Node.new(data) : insert(data, node.right)
    end
  end

  # Write a #delete method which accepts a value to delete
  # (you’ll have to deal with several cases for delete such as when a node has children or not).
  # def delete(node = root, data)
  #   if data < node.data
  #   end
  # end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    data <=> other.data
  end
end

tree = Tree.new(Array.new(15) { rand(1..100) })
p tree.array

tree.pretty_print
puts '--------------------------------'

tree.insert(11)
tree.insert(28)
tree.insert(tree.array[0])

tree.pretty_print
puts '--------------------------------'
