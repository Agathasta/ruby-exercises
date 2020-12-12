# Build a Tree class which accepts an array when initialized. 
# The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
class Tree
  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree
  end

  def build_tree

  end
end


# Build a Node class. It should have an attribute for the data it stores as well as its left and right children. 
# As a bonus, try including the Comparable module and compare nodes using their data attribute.
class Node
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end