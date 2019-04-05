def bubble(arr)
  loop do
    incomplete = false
    counter = 1

    while counter < arr.size
      if arr[counter - 1] > arr[counter]
        arr[counter - 1], arr[counter] = arr[counter], arr[counter - 1]
        incomplete = true
      end
      counter += 1
    end
    break if incomplete == false
  end
  arr
end

p bubble([1,3,2,12,45,5,6, 145, 2])
