def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

# Is a method OK
# Takes 1 argument, a sentence string OK
# Returns array of integers FAIL
# Value of each int is equal to the length of the word in pos of sentence

# CASE 1 Provided Test
# INPUT 'To be or not to be'
# OUTPUT [2, 2, 2, 3, 2, 2]
p string_lengths('To be or not to be')

# CASE 2 Extra Whitespace
# INPUT 'To be   or   not to    be'
# OUTPUT [2, 2, 2, 3, 2, 2]
p string_lengths('To be   or   not to    be')

# CASE 3 Empty
# INPUT ''
# OUTPUT []
p string_lengths('')

# CASE 4 Single Word
# INPUT ''
# OUTPUT [5]
p string_lengths('hello')
