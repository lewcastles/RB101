def substrings_at_start(str)
  new_arr = []
  (0..str.size - 1).each do |idx|
    new_arr << str[0..idx]
  end
  new_arr
end




p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']