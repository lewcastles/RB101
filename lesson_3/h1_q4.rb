def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words.size == 4
end

puts dot_separated_ip_address?("192.168.0.1")