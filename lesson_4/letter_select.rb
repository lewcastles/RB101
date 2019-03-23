=begin
---------------------------------------------------------------
Problem:
  -method called select_letter
  -takes a string and returns a new string 
  -new string contains all instances of the letter 
   that we specified
---------------------------------------------------------------
Examples:
question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""
---------------------------------------------------------------
Data Structure:
input: input (str), chr_to_sel (str)
output: selection (str)
---------------------------------------------------------------
Algorithm:
create selection string to store matches
create counter
loop through chars in string
  exit loop if at end of string
  if current char == chr_to_sel add char to selection
  counter + 1
end loop
return selection
---------------------------------------------------------------
=end

def select_letter(input, chr_to_sel)
  selection = ''
  counter = 0
  loop do
    break if counter >= input.size

    cur_char = input[counter]
    if cur_char == chr_to_sel
      selection << cur_char
    end

    counter += 1
  end
  selection
end


question = 'How many times does a particular character appear in this sentence?'

p select_letter(question, 'a').size

