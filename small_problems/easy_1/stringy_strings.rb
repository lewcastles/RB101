def stringy(a)
  b = []
  a.times {|idx| idx.even? ? b << 1 : b << 0}
  b.join
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'