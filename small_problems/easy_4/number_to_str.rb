DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  arr_strs = []
  int.digits.reverse.each do |digit|
    arr_strs << DIGITS[digit]
  end
  arr_strs.join
end

def signed_integer_to_string(int)
  if int > 0
    '+' + integer_to_string(int)
  elsif int == 0
    integer_to_string(int)
  else
    '-' + integer_to_string(int.abs)
  end
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
