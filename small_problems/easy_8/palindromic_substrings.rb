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

def palindrome?(str)
  str == str.reverse && str.length > 1
end

def palindromes(str)
  substrings = substrings(str)
  substrings.select do |element|
    palindrome?(element)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]