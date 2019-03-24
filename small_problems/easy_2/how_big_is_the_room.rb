puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f
puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f
aream = (length * width).round(2)
areaft = (aream * 3.28084).round(2)
puts "The area of the room is #{aream} square meters (#{areaft} square feet)."

