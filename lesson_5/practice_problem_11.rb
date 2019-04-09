arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |inner_arr|
  inner_arr.select do |element|
    (element % 3).zero?
  end
end
