def prompt(msg)
  puts "=> #{msg}"
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

def zero_neg_notice(num)
  if num.match(/^[$]?[0]*[.]?[0]{0,2}$/) || num.to_i < 0
    prompt('Input must be greater than zero.')
  else
    prompt('Input not valid. Please try again.')
  end
end

def neg_notice(num)
  if num.to_i < 0
    prompt('Input must zero or positive.')
  else
    prompt('Input not valid. Please try again.')
  end
end

def retrieve_loan_amt
  loop do
    prompt('Please enter loan amount with no commas (for example 63123.67)')
    loan_val = gets.chomp
    puts
    return loan_val.delete('$').to_f if valid_currency_format?(loan_val)

    zero_neg_notice(loan_val)
  end
end

def retrieve_mnthly_int_rate
  loop do
    prompt('Please enter loan APR in % (for example 4.53%):')
    apr_val = gets.chomp
    puts
    return apr_val.delete('%').to_f / 1200 if valid_percentage_format?(apr_val)

    neg_notice(apr_val)
  end
end

def retrieve_loan_duration
  loop do
    prompt('Please enter loan duration in whole MONTHS:')
    duration = gets.chomp
    puts
    return duration.to_i if valid_posinteger_format?(duration)

    zero_neg_notice(duration)
  end
end

def retrieve_username
  loop do
    puts '======Welcome to the Loan Calculator======'
    prompt('Please enter your name:')
    name = gets.chomp
    puts
    return name unless name.empty?

    prompt('We didnt catch your name, please try again')
  end
end

def prompt_user_repeat
  prompt("Would you like to calculate another loan? (input 'Y' to repeat)")
  gets.chomp.match(/^[y]?$/i)
end

# MAIN PROCESS ----------------------------------------------------------------
(system 'clear') || (system 'cls') # clear screen in multiple os?? for clarity

# username, probably minimal validation here, not critical to function.
name = retrieve_username.capitalize

loop do
  prompt("#{name}, let us take a few moments to gather some information")
  # retrieve sanitized inputs from user in formula correct units
  p = retrieve_loan_amt
  j = retrieve_mnthly_int_rate
  n = retrieve_loan_duration

  m = if j == 0.0
        p / n # calculate interest-free equal payments
      else
        p * (j / (1 - (1 + j)**-n)) # calculation from formula
      end
  mnthly_payments = format('$%.2f', m.round(2))
  total_to_pay = format('$%.2f', m.round(2) * n)
  # 2dp format possibly some rounding errors here, future improvement maybe.

  prompt("Thank you #{name}, your monthly payments will be #{mnthly_payments}")
  prompt("per month for #{n} months with a total repayment of #{total_to_pay}")
  puts

  break unless prompt_user_repeat # user does not wish to repeat then break loop

  (system 'clear') || (system 'cls')
end
