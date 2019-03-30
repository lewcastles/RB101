def repeater(str)
  result = ''
  str.chars.each do |element|
    result << element * 2
  end
  result
end



p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''