def substrings_at_start(str)
  new_arr = []
  (0..str.size - 1).each do |idx|
    new_arr << str[0..idx]
  end
  new_arr
end

def substrings(str)
  new_arr = []
  (0..str.size - 1).each do |idx|
    new_arr << substrings_at_start(str[idx..str.size - 1])
  end
  new_arr.flatten
end



p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]