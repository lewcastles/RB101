puts '>> Please enter an integer greater than 0:'
loop do
pos_int = gets.chomp
break if pos_int =~ /^[1-9]\d*$/
end

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
loop do
  s_or_p = gets.chomp.downcase
  return s_or_p if s_or_p =~ /^s|p$/
end

puts s_or_p
if s_or_p == 's'
  sum = (1..pos_int).sum
  puts "The sum of the integers between 1 and #{pos_int} is #{sum}"
else
end