def oddities(arr)
  counter = 0
  new_arr = []

  while counter < arr.size
    new_arr << arr[counter] if counter.even?
    counter += 1
  end

  new_arr
end



p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []