def triangle(int)
  (1..int).each do |i|
    puts ('*' * i).rjust(int)
  end
end

triangle(12)