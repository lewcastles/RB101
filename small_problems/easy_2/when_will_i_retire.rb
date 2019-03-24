print 'What is your age? '
age = gets.chomp.to_i
print 'At what age would you like to retire? '
target_ret = gets.chomp.to_i

age_diff = target_ret - age
year = Time.now.year

puts "It's #{year}. You will retire in #{year + age_diff}."
puts "You have only #{age_diff} years of work to go!"