def digit_list(num)
  num.to_s.split('').map(&:to_i)
end

puts digit_list(12_345) == [1, 2, 3, 4, 5]
