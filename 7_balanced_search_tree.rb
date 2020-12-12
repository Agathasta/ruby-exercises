# frozen_string_literal: true

class Tree
  attr_reader :root

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
    return puts 'That data already exists' if node.data == data

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

tree = Tree.new([28, 32, 38, 28, 30, 6, 86, 23, 58, 77, 23, 42, 14, 23, 85, 45, 16])
# [6, 14, 16, 23, 28, 30, 32, 38, 42, 45, 58, 77, 85, 86]
tree.insert(11)
puts tree.root.left.left.left.right.data
tree.insert(28)

# puts tree.root.data
# puts tree.root.left.data
# puts tree.root.left.left.data
# puts tree.root.left.left.left.data
# puts tree.root.right.data
# puts tree.root.right.left.data
# puts tree.root.right.left.left.data
# puts tree.root.right.left.right.data

# tree = Tree.new(Array.new(15) { rand(1..100) })
