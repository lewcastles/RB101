# correct error messages - work on check logic

def valid_currency_format?(num)
  num.match(/^[+]?[$]?[0-9]*[.]?[0-9]{0,2}$/) && !num.empty? && !(num == '0')
end

def valid_percentage_format?(num)
  num.match(/^[+]?[%]?[0-9]*[.]?[0-9]*[%]?$/) && !num.empty?
end

def valid_posinteger_format?(num)
  num.match(/^[+]?[0-9]+$/) && !num.empty? && !num.to_i.zero?
end

def prompt(msg)
  puts "=> #{msg}"
end

def retrieve_loan_amt
  loop do
    prompt('Please enter loan amount (in USD) with no commas (for example 12345.67)')
    loan_amt = gets.chomp
    puts
    return loan_amt.delete('$').to_f if valid_currency_format?(loan_amt)

    if loan_amt == '0' || loan_amt.to_i < 0
    prompt('Loan amount must be greater than zero.')
    else
    prompt('Not a valid amount of currency. Check for commas, please try again.')
    end
  end
end

def retrieve_mnthly_int_rate
  loop do
    prompt('Please enter loan APR (in %)')
    apr_val = gets.chomp
    puts
    return apr_val.delete('%').to_f / 1200 if valid_percentage_format?(apr_val)
    if apr_val.to_i < 0
      prompt('APR must not be negative. Please try again')
    else
      prompt('Not a valid number. Please try again.')
    end
  end
end

def retrieve_loan_duration
  loop do
    prompt('Please enter loan duration (in whole MONTHS)')
    duration = gets.chomp
    puts
    return duration.to_i if valid_posinteger_format?(duration)

    if duration == '0' || duration.to_i < 0
      prompt('Loan must have duration, check zero or negative. Please try again.')
    else
      prompt('Not a valid number of whole months.')
    end
  end
end

def retrieve_username
  loop do
    prompt('Please enter your name:')
    name = gets.chomp
    puts
    return name if !name.empty?

    prompt('We didnt catch your name, please try again')
  end
end

def prompt_user_repeat
  prompt("Would you like to calculate payments on another loan? (input 'Y' to repeat calculation)")
  gets.chomp.match(/^[y]?$/i)
end

system "clear" or system "cls"
puts '======Welcome to the Loan Calculator======'
name = retrieve_username.capitalize # didnt want to restrict inputs too much here, users can call themselves whatever.
loop do
prompt("#{name}, let us take a few moments to gather some required information")
# retrieve sanitized inputs from user in formula correct units
p = retrieve_loan_amt
j = retrieve_mnthly_int_rate
n = retrieve_loan_duration

if j == 0.0
  m = p / n # calculate interest-free equal payments
else
  m = p * (j / (1 - (1 + j)**-n)) # calculate using formula
end
mnthly_payments = m.round(2)
total_to_repay = mnthly_payments*n


prompt("Thank you #{name}, your monthly payments will be $%0.2f per month over #{n} months \n" % [mnthly_payments]) 
prompt("with a total repayment of $%0.2f" % [total_to_repay])
puts

break if !prompt_user_repeat # user does not wish to repeat then break loop
system "clear" or system "cls"
end