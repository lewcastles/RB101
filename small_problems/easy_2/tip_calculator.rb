print 'What is the bill: '
bill = (gets.chomp).to_f
print 'What is tip percentage: '
tip_pc = (gets.chomp).to_f/100

tip_to_pay = (bill * tip_pc).round(2)
total_bill = (bill + tip_to_pay).round(2)

puts "The tip is $#{tip_to_pay}."
puts "The total is $#{total_bill}."
