def sum_square_difference(num)
  natural_upto_n = 1.upto(num)
  square_sum = natural_upto_n.reduce(:+)**2
  sum_squares = natural_upto_n.map { |e| e**2 }.reduce(:+)
  square_sum - sum_squares
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150