# frozen_string_literal: true

def merge_sort(arr, sorted_arr = [])
  if arr.size < 2
    arr
  else
    left = merge_sort(arr[0...arr.size / 2])
    right = merge_sort(arr[arr.size / 2..-1])
    (left.size + right.size).times do
      if left.empty?
        sorted_arr << right.shift
      elsif right.empty?
        sorted_arr << left.shift
      else
        compare = left <=> right
        sorted_arr << (compare == -1 ? left.shift : right.shift)
      end
    end
    sorted_arr
  end
end

p array = [3, 65, 1, 98, 28, 4, 6, 22, 13, 1, 0]
p merge_sort(array)
puts "The result of merge_sort is the same as Array#sort: #{merge_sort(array) == array.sort}"
