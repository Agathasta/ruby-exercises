require 'pry'

def merge_sort(arr)

  if arr.size < 2
    arr
  else
    left = merge_sort(arr[0...arr.size/2])
    right = merge_sort(arr[arr.size/2..-1])
    merge(left, right)
  end
end

def merge(left, right, sorted_arr = [])
  binding.pry
  2.times do
    if right.empty?
      sorted_arr << left.shift
    elsif left.empty?
      sorted_arr << right.shift
    else
      compare = left <=> right
      if compare == -1
        sorted_arr << left.shift
      elsif compare == 1
        sorted_arr << right.shift
      end
    end
  end
  sorted_arr
end

arr = [4, 2, 1, 5, 3]
merge_sort(arr)
