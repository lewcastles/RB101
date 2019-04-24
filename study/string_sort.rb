=begin
Your task is to sort a given string. 
Each word in the string will contain a single number. 
This number is the position the word should have in the result.
Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
If the input string is empty, return an empty string. 
The words in the input String will only contain valid consecutive numbers.

Input: String
Output: String

Tests:
p order("is2 Thi1s T4est 3a") #== "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") #== "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") #== ""

Algo:
initiate a empty hash to store position number and the word
split string and assign to a word array

with each word 
  use detect to find the number
  assign number as key, word as value into the hash
  
get and sort hash keys
iterate through keys and add values to a new array 
join the array
=end

def order(str)
  pos_word = {}
  result = []
  word_array = str.split
  word_array.each do |word|
    number = word.chars.detect {|v| v.to_i != 0}
    pos_word[number] = word
  end

  pos_word.keys.sort.each do |key|
    result << pos_word[key]
  end

  result.join(' ')
end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""

# 15 min