def fibonacci(n)
  first, last = [1, 1]
  (3..n).each do |n|
    first, last = [last, first + last]
  end
  last
end

p fibonacci(1_000_007)
  