=begin
-------------------------
input: arr, int
output: int

algo:

take string.downcase.chars

output substring 2 or longer from string for both




check if there are any matches to both

-------------------------
=end


# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.
def all_substrings_over_2(str)
  string = str.downcase
  substrings = []
  (0..str.size).each do |lower|
    (lower..str.size).each do |upper|
      substrings << string[lower..upper]
    end
  end
  substrings.select { |sub| sub.size >= 2 }
end

def substring_test(str1, str2)
  array1 = all_substrings_over_2(str1)
  array2 = all_substrings_over_2(str2)
  array1.each do |sub1|
    return true if array2.include?(sub1)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
