# frozen_string_literal: true

def bubble_sort(arr)
  length = arr.length - 1
  loop do
    swap = false
    (0...length).each do |i|
      next unless arr[i] > arr[i + 1]

      x = arr[i + 1]
      arr[i + 1] = arr[i]
      arr[i] = x
      swap = true
    end
    length -= 1
    break if swap == false
  end
  p arr
end

bubble_sort([4, 3, 78, 2, 0, 2])
