def multiply_list(arr1, arr2)
  arr3 = []
  arr1.each_with_index do |_, idx|
    arr3 << arr1[idx] * arr2[idx]
  end
  arr3
end




p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]