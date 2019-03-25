def ascii_value(str)
  arr_asciivals = [0]
  str.each_char do |char|
    arr_asciivals << char.ord
  end
  arr_asciivals.reduce(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0