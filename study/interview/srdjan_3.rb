=begin
-------------------------
input: arr, int
output: int

algo:
if count of every character in str2 
  is less than count of character in str 1 then true else false

-------------------------
=end

# Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
#
# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.

# Only lower case letters will be used (a-z). No punctuation or digits will be included.


def scramble(str1, str2)
  str2.chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end




p scramble('javaass', 'jjss') == false

p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true