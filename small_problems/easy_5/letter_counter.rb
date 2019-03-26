def word_sizes(str)
  word_lengths = []
  length_hash = {}
  word_arr = str.split(' ')

  word_arr.each do |word|
    word_lengths << word.length
  end

  word_lengths.each do |length|
    length_hash[length] = word_lengths.count(length)
  end

  length_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}