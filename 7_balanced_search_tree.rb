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
    return nil if node.data == data

    if data < node.data
      node.left.nil? ? node.left = Node.new(data) : insert(data, node.left)
    else
      node.right.nil? ? node.right = Node.new(data) : insert(data, node.right)
    end
  end

  def delete(data)
    node = find(data)
    return nil if node.nil?

    if node.is_leaf?
      delete_leaf(node)
    elsif node.one_child
      delete_w_one_child(node)
    else
      delete_w_two_children(node)
    end
  end

  def level_order(current = root, queue = [], ordered = [])
    ordered << current.data
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
    return ordered if queue.empty?

    level_order(queue.shift, queue, ordered)
  end

  def pre_order(current = root, ordered = [])
    return ordered if current.nil?

    ordered << current.data
    pre_order(current.left, ordered)
    pre_order(current.right, ordered)
  end

  def in_order(current = root, ordered = [])
    return ordered if current.nil?

    in_order(current.left, ordered)
    ordered << current.data
    in_order(current.right, ordered)
  end

  def post_order(current = root, ordered = [])
    return ordered if current.nil?

    post_order(current.left, ordered)
    post_order(current.right, ordered)
    ordered << current.data
  end

  def height_tree(node = root)
    return 0 if node.nil?

    1 + [height_tree(node.left), height_tree(node.right)].max
  end

  def balanced?(node = root)
    (height_tree(node.left) - height_tree(node.right)).abs <= 1
  end

  def rebalance
    @root = build_tree(in_order)
  end

  # from a student in The Odin Project
  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  # Helper methods for #delete
  def delete_leaf(node)
    parent = find_parent(node)
    node.data < parent.data ? parent.left = nil : parent.right = nil
  end

  def delete_w_one_child(node)
    parent = find_parent(node)
    node.data < parent.data ? parent.left = node.one_child : parent.right = node.one_child
  end

  def delete_w_two_children(node)
    parent = find_parent(node)
    next_bigger = find_next_bigger(node.right)
    next_bigger.is_leaf? ? delete_leaf(next_bigger) : delete_w_one_child(next_bigger)
    if parent.nil?
      @root = next_bigger
    else
      node.data < parent.data ? parent.left = next_bigger : parent.right = next_bigger
    end
    next_bigger.left = node.left
    next_bigger.right = node.right
  end

  def find(data, node = root)
    return nil if node.nil?
    return node if data == node.data

    data < node.data ? find(data, node.left) : find(data, node.right)
  end

  def find_parent(node, parent = root)
    return nil if node == parent
    return parent if [parent.left, parent.right].include?(node)

    node.data < parent.data ? find_parent(node, parent.left) : find_parent(node, parent.right)
  end

  def find_next_bigger(node)
    return node if node.left.nil?

    find_next_bigger(node.left)
  end

  # Part of the exercise (must be public to be used)
  def height_node(data)
    node = find(data)
    height_tree(node)
  end

  def depth_node(data)
    height_tree - height_node(data)
  end
end



class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def is_leaf?
    left.nil? && right.nil?
  end

  def one_child
    if left.nil? && !right.nil?
      right
    elsif !left.nil? && right.nil?
      left
    end
  end
end

# Driver script
puts
puts '*** BALANCED SEARCH TREE ***'
tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree.balanced? ? 'Balanced :)' : 'Not balanced :('
tree.pretty_print
puts "Level order: #{tree.level_order}"
puts "Pre order: #{tree.pre_order}"
puts "In order: #{tree.in_order}"
puts "Post order: #{tree.post_order}"
puts 'Enter number to delete:'
print '> '
to_delete = gets.chomp.to_i
tree.delete(to_delete)
puts "Insert #{tree.insert(rand(100..150)).data}"
puts "Insert #{tree.insert(rand(100..150)).data}"
puts "Insert #{tree.insert(rand(100..150)).data}"
puts "Insert #{tree.insert(rand(100..150)).data}"
tree.pretty_print
puts tree.balanced? ? 'Balanced :)' : 'Not balanced :('
unless tree.balanced?
  puts 'Rebalancing...'
  tree.rebalance
  tree.pretty_print
  puts tree.balanced? ? 'Balanced :)' : 'Not balanced :('
  puts "Level order: #{tree.level_order}"
  puts "Pre order: #{tree.pre_order}"
  puts "In order: #{tree.in_order}"
  puts "Post order: #{tree.post_order}"
end
