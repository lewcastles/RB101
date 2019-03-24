num_arr = []
puts '==> Enter the first number:'
num_arr << gets.chomp.to_i
puts '==> Enter the second number:'
num_arr << gets.chomp.to_i

p num_arr.reduce(:+)
p num_arr.reduce(:-)
p num_arr.reduce(:*)
p num_arr.reduce(:/)
p num_arr.reduce(:%)
p num_arr.reduce(:**)