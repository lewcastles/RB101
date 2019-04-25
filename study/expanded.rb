=begin

You will be given a number and you will need to return 
it as a string in expanded form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

Note: All numbers will be whole numbers greater than 0.

input: integer

output: string

algo:

get the array of the digits

map digit * 10**index over the array

join the array with +

=end

def expanded_form(num)
  new_arr = num.digits.map.with_index {|e, idx| e * 10**idx}.reverse
  new_arr.delete(0)
  new_arr.join(' + ')
end

p expanded_form(12); # Should return '10 + 2'
p expanded_form(42); # Should return '40 + 2'
p expanded_form(70304); # Should return '70000 + 300 + 4'
# 10 min