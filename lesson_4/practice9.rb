def titleize(words)
  words.split(" ").each(&:capitalize!).join(' ')
end

words = "the flintstones rock"

p titleize(words)
