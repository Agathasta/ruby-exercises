def my_reverse(str)
  new_str = ""
  for i in 0..str.length - 1
    new_str << str[-1 -i]
  end
  new_str
end

# puts my_reverse("Blah!")

def fibo(num)
  fibs = [0, 1]
  for i in 2..num - 1
    fibs << (fibs[i - 1]) + (fibs[i - 2])
  end
  p fibs

end

# fibo(8)

def my_benchmark(times)
  time_beginning = Time.now
  times.times { yield }
  time_end = Time.now
  puts "That took #{time_end - time_beginning} seconds"
end

# my_benchmark(10000) { puts "hi" }