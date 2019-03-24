def reverse_words(str)
  sentence_arr = []
  str.split.each do |word|
    if word.length > 4
      sentence_arr.push(word.reverse) 
    else
      sentence_arr.push(word)
    end
  end

  sentence_arr.join(' ')
end

puts reverse_words('Professional') 
puts reverse_words('Walk around the block') 
puts reverse_words('Launch School')  