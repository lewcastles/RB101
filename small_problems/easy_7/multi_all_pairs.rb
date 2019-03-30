def multiply_all_pairs(arr1, arr2)
  arr3 = []
  arr1.each do |arr1item|
    arr2.each do |arr2item|
      arr3 << arr1item * arr2item
    end
  end
  arr3.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]