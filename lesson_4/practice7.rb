statement = "The Flintstones Rock"
freq = {}
statement.chars do |char|
  freq[char] = statement.count(char)
end
p freq

