def swap(str)
  word_arr = str.split(' ')
  new_word_arr = []
  word_arr.each do |word|
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
    new_word_arr << word
  end
  new_word_arr.join(' ')
end



p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'