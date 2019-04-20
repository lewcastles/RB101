def retrieve_word_score(word)
  current_word_score = 0
  word.downcase.chars.each do |letter|
    current_word_score += letter.ord - 96
  end
  current_word_score
end

def high(str)
  high_score = 0
  high_word = ''
  word_array = str.split
  word_array.each do |word|
    if retrieve_word_score(word) >= high_score
      high_score = retrieve_word_score(word)
      high_word = word
    end
  end
  high_word
end

p high('what time are we climbing up the volcano') == 'volcano'