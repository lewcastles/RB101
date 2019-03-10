require 'yaml'
MSG = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MSG[lang][message]
end

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.match(/^[+-]?([0-9]*[.])?[0-9]+$/)
end

def operation_to_message(op, n1, n2)
  res = case op
        when '1'
          "Adding #{n1} to #{n2}"
        when '2'
          "Subtracting #{n2} from #{n1}"
        when '3'
          "Multiplying #{n1} and #{n2}"
        when '4'
          "Dividing #{n1} by #{n2}"
        end
  res # return required.
end

prompt(messages('welcome', 'es'))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('valid_name', 'es'))
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  number1 = ''
  loop do 
    break if valid_number?(number1)
    prompt('What is the first number?')
    number1 = gets.chomp 
    prompt("Hm.. that doesn't look like a valid number")
  end

  number2 = ''
  loop do
    prompt('What is the second number')
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hm.. that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG
  prompt(operator_prompt)

  operator=''
  loop do
    operator = gets.chomp

    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt('Must choose 1, 2, 3 or 4')
    end
  end

  prompt("#{operation_to_message(operator, number1, number2)}")

  result =  case operator
            when '1'
              number1.to_f + number2.to_f
            when '2'
              number1.to_f - number2.to_f
            when '3'
              number1.to_f * number2.to_f
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt('Thank you for using the calculator, goodbye!')

