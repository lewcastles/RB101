def crunch(str)
  output = ''
  count = 0
  while count < str.size
    output << str[count] unless str[count] == str[count + 1]
    count += 1
  end
  output
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
