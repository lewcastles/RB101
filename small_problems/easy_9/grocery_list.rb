def buy_fruit(arr)
  new_arr = []
  arr.each do |listitem|
    listitem[1].times {new_arr << listitem[0]}
  end
  new_arr
end



p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]