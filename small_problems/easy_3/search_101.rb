nums = []

puts '==> Enter the 1st number:'
nums << gets.chomp.to_i
puts '==> Enter the 2nd number:'
nums << gets.chomp.to_i
puts '==> Enter the 3rd number:'
nums << gets.chomp.to_i
puts '==> Enter the 4th number:'
nums << gets.chomp.to_i
puts '==> Enter the 5th number:'
nums << gets.chomp.to_i
puts '==> Enter the last number:'
last = gets.chomp.to_i

if nums.any?(last)
  puts "The number #{last} appears in #{nums}"
else
  puts "The number #{last} does NOT appear in #{nums}"
end