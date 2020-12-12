# Build a Tree class which accepts an array when initialized. 
# The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
class Tree
  attr_reader :root

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array)
    # puts @root.data
    # puts @root.left.data
    # puts @root.left.left.data
  end

# Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) 
# and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). 
# The #build_tree method should return the level-1 root node.
  def build_tree(array)
    return nil if array.empty?

    middle = (array.length - 1) / 2
    root = Node.new(array[middle])
    root.left = build_tree(array[0...middle])
    root.right = build_tree(array[(middle + 1)..-1])
    root
  end
end


# Build a Node class. It should have an attribute for the data it stores as well as its left and right children. 
# As a bonus, try including the Comparable module and compare nodes using their data attribute.
class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

tree = Tree.new([28, 32, 38, 28, 30, 6, 86, 23, 58, 77, 23, 42, 14, 23, 85, 45, 16])
# [6, 14, 16, 23, 28, 30, 32, 38, 42, 45, 58, 77, 85, 86]

# tree = Tree.new(Array.new(15) { rand(1..100) })
