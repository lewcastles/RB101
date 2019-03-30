def fizzbuzz(start_int, end_int)
  output = ''
  (start_int..end_int).each do |element|
    output << if element % 3 == 0 && element % 5 == 0
                'FizzBuzz, '
              elsif element % 3 == 0 
                'Fizz, '
              elsif element % 5 == 0
                'Buzz, '
              else
                "#{element}, "
              end
  end
  output
end




p fizzbuzz(1, 15)