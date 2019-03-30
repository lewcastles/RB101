def interleave(arr1, arr2)
  arr3 = []
  arr1.each_with_index do |element, idx|
    arr3 << arr1[idx] << arr2[idx]
  end
  arr3
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
