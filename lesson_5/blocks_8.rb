arr = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

arr.map do |sub_arr|
  sub_arr.select do |element|
    if element.instance_of?(Integer)
      element > 13
    else
      element.size < 6
    end
  end
end
