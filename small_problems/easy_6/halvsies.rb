def halvsies(arr)
  arr1 = []
  arr2 = []
  arr.each_with_index do |ele, idx|
    if idx <= (arr.length.to_f / 2).ceil - 1
      arr1 << ele
    else
      arr2 << ele
    end
  end
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]