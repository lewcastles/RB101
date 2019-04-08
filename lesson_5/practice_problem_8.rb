hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowel_arr = []
hsh.each do |_, v|
  v.each do |word|
    vowel_arr << word.scan(/[aeiou]/)
  end
end
p vowel_arr.flatten.join
