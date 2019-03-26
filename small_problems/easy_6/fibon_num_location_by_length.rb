def find_fibonacci_index_by_length(length)
  
  n1 = 1
  n2 = 1
  count = 2

  loop do
    count += 1
    fibon = n1 + n2
    break if fibon.to_s.size == length

    n1 = n2
    n2 = fibon


  end
  count
end

p find_fibonacci_index_by_length(2) == 7 
p find_fibonacci_index_by_length(3) == 12         
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
