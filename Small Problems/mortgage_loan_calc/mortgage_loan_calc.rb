# fix NaN if APR is set to 0, allow zero rate but just make it equal payments
# add users name to personalise it
# add examples to guide user and less gener correction when wrong input detected
# add ability to select language using yml
# add total amount to repay

def valid_currency_format?(num)
  num.match(/^[+]?[$]?[0-9]*[.]?[0-9]{0,2}$/) && !num.empty?
end

def valid_percentage_format?(num)
  num.match(/^[+]?[%]?[0-9]*[.]?[0-9]*[%]?$/) && !num.empty?
end

def valid_posinteger_format?(num)
  num.match(/^[+]?[1-9]+$/) && !num.empty?
end

def prompt(msg)
  puts "=> #{msg}"
end

def retrieve_loan_amt
  loop do
    prompt('Please enter loan amount (in USD) for example: 12345.67:')
    loan_amt = gets.chomp
    return loan_amt.delete('$').to_f if valid_currency_format?(loan_amt)

    prompt('Not a valid number. Please try again.')
  end
end

def retrieve_mnthly_int_rate
  loop do
    prompt('Please enter loan APR (in %)')
    apr_val = gets.chomp
    return apr_val.delete('%').to_f / 1200 if valid_percentage_format?(apr_val)

    prompt('Not a valid number. Please try again.')
  end
end

def retrieve_loan_duration
  loop do
    prompt('Please enter loan duration (in whole months)')
    duration = gets.chomp
    return duration.to_i if valid_posinteger_format?(duration)

    if duration.to_i < 0
      prompt('Loan must have duration, check zero or negative. Please try again.')
    else
      prompt('Not a valid number of whole months.')
    end
  end
end

# sanitized inputs from user in formula correct units
p = retrieve_loan_amt
j = retrieve_mnthly_int_rate
n = retrieve_loan_duration

# calculate monthly payments
m = p * (j / (1 - (1 + j)**-n))
puts m

result = m.round(2)

prompt("Your monthly payments will be $#{result}") 
