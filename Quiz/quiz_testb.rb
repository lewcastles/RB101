def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end

end

# Is a method OK
# Takes 1 argument, a sentence string OK
# Returns array of integers FAIL returns strings array from strings.each
# Value of each int is equal to the length of the word in pos of sentence FAIL

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

# TESTS FAILED