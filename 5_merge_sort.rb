require 'pry'

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
        if compare == -1
          sorted_arr << left.shift
        else
          sorted_arr << right.shift
        end
      end
    end
    sorted_arr
  end
end

array = [3, 65, 1, 98, 28, 4, 6, 22, 13, 1, 0]
puts merge_sort(array)