# Warmup 3: Rebuild the Enumerable Methods
public

def my_each(proc = nil)
  self.length.times do |i|
    if proc == nil
      yield(self[i])
    else
      proc.call(self[i])
    end
  end
  self
end

# [1,2,5].my_each{ |item| puts item**2 }

# my_proc = Proc.new{|item| puts item**2}
# [1,2,5].my_each(my_proc)

###########################################

def my_map(proc = nil)
  arr = Array.new
  self.my_each do |e|
    if proc == nil
      arr << yield(e)
    else
      arr << proc.call(e)
    end
  end
  arr
end

# [1,2,5].my_map {|item| item**2}

# my_proc = Proc.new{|item| item**2}
# [1,2,5].my_map(my_proc)

###########################################

def my_select(proc = nil)
  arr = Array.new
  self.my_each do |e|
    if proc == nil
      arr << e if yield(e)
    else
      arr << e if proc.call(e)
    end
  end
  arr
end

# [1,2,5].my_select{|item| item.even?}

# my_proc = Proc.new{|item| item.even?}
# [1,2,5].my_select(my_proc)

###########################################


