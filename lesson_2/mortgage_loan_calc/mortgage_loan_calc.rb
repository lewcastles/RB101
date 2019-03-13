# strengthen your user-input validation spaces for my name

def prompt(msg)
  puts "=> #{msg}"
end

def valid_name_format?(str)
  str.match(/^[A-Z]+[ ]?[A-Z]*$/i) && !str.empty?
end

def valid_currency_format?(num)
  num.match(/^[+]?[$]?[0-9]*[.]?[0-9]{0,2}$/) && !num.empty?\
   && !num.match(/^[$]?[0]*[.]?[0]{0,2}$/)
end

def valid_posinteger_format?(num)
  num.match(/^[+]?[0-9]+$/) && !num.empty?\
   && !num.match(/^[$]?[0]*[.]?[0]{0,2}$/)
end

def valid_percentage_format?(num)
  num.match(/^[+]?[%]?[0-9]*[.]?[0-9]*[%]?$/) && !num.empty?
end

def display_zero_neg_notice(num)
  if num.match(/^[$]?[0]*[.]?[0]{0,2}$/) || num.to_i < 0
    prompt('Input must be greater than zero.')
  else
    prompt('Input not valid. Please try again.')
  end
end

def display_neg_notice(num)
  if num.to_i < 0
    prompt('Input must be zero or positive.')
  else
    prompt('Input not valid. Please try again.')
  end
end

def display_welcome_message
  (system 'clear') || (system 'cls')
  puts '======Welcome to the Loan Calculator======'
end

def display_payment_message(name, mnthly_payments, total, duration)
  prompt("Thank you #{name}, your monthly payments will be #{mnthly_payments}")
  prompt("per month for #{duration} months with a total repayment of #{total}")
  puts
end

def retrieve_loan_amt
  loop do
    prompt('Please enter loan amount with no commas (for example 63123.67)')
    loan_val = gets.chomp
    puts
    return loan_val.delete('$').to_f if valid_currency_format?(loan_val)

    display_zero_neg_notice(loan_val)
  end
end

def retrieve_mnthly_int_rate
  loop do
    prompt('Please enter loan APR in % (for example 4.53%):')
    apr_val = gets.chomp
    puts
    return apr_val.delete('%').to_f / 1200 if valid_percentage_format?(apr_val)

    display_neg_notice(apr_val)
  end
end

def retrieve_loan_duration
  loop do
    prompt('Please enter loan duration in whole MONTHS:')
    duration = gets.chomp
    puts
    return duration.to_i if valid_posinteger_format?(duration)

    display_zero_neg_notice(duration)
  end
end

def retrieve_username
  loop do
    prompt('Please enter your name:')
    name = gets.chomp
    puts
    return name.split.map(&:capitalize).join(' ') if valid_name_format?(name)

    prompt('We didnt catch your name, please try again')
  end
end

def prompt_user_repeat
  prompt('Would you like to calculate another loan?')
  prompt("(Input 'Y' to repeat, all other keys will close the program)")
  repeat = gets.chomp
  repeat.match(/^[y]?$/i) && !repeat.empty?
end

# MAIN PROCESS START --------------------------------------------------------

display_welcome_message
name = retrieve_username

loop do
  prompt("#{name}, let us take a few moments to gather some information")
  # retrieve sanitized inputs from user in formula correct units
  loan_amt = retrieve_loan_amt
  int_rate = retrieve_mnthly_int_rate
  duration = retrieve_loan_duration

  payments = if int_rate == 0.0
               loan_amt / duration # calculate interest-free equal payments
             else
               loan_amt * (int_rate / (1 - (1 + int_rate)**-duration))
             end
  mnthly_payments = format('$%.2f', payments.round(2))
  total = format('$%.2f', payments.round(2) * duration)
  # 2dp format possibly some rounding errors here, future improvement maybe.

  display_payment_message(name, mnthly_payments, total, duration)

  break unless prompt_user_repeat # user does not wish to repeat then break loop

  (system 'clear') || (system 'cls')
end
