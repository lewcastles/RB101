current_longest = []
current_sentence = []

File.open('pg84.txt').each do |line|
  line.split.each do |word|
    if /[?!.]/.match(word)
      current_sentence << word
      current_longest = current_sentence if current_sentence.size > current_longest.size
      current_sentence = []
    else
      current_sentence << word
    end
  end

end
puts current_longest.join(' ')
p current_longest.size

