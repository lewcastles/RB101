def multisum(int)
  multiples_arr = []
  (1..int).each do |cur_int|
    multiples_arr << cur_int if  cur_int % 3 == 0 || cur_int % 5 == 0
  end
  multiples_arr.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168