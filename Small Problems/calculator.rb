# asks for two numbers
# asks for the type of operation to perform
# displays the result

puts 'enter 1st'
n1 = gets.chomp.to_i
puts 'enter 2nd'
n2 = gets.chomp.to_i
puts 'Type of operation (enter + - * /)'
op = gets.chomp.to_s

result =  case op
          when '+'
            n1 + n2
          when '-'
            n1 - n2
          when '*'
            n1 * n2
          when '/'
            n2 == 0 ? 'an error: no div by zero' : n1.to_f / n2.to_f
          end

puts "result is #{result}"
