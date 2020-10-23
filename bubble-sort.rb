def bubble_sort(arr)
    until arr == arr.sort do
        for i in 0...arr.length - 1
            pair = [arr[i], arr[i + 1]]
            pair.sort!
            arr.delete_at(i+1)
            arr.delete_at(i)
            arr.insert(i, pair[0], pair[1])
        end
    end
    p arr
end

bubble_sort([4,3,78,2,0,2])