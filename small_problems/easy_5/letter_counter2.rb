def word_sizes(str)
  length_hash = Hash.new(0) # set any created value to zero by def

  str.split.each do |word|
    san_word = word.gsub(/[^A-z]/, '').length
    length_hash[san_word] += 1
  end
  length_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}