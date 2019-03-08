def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

# Is a method OK
# Takes 1 argument, a sentence string OK
# Returns array of integers PASS
# Value of each int is equal to the length of the word in pos of sentence PASS

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

# TESTS PASSED