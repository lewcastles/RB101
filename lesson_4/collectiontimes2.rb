def double_numbers(arr, multiplier)
  new_arr = []
  count = 0
  loop do
    break if count >= arr.size
    cur_val = arr[count]

    new_arr << cur_val * multiplier
    count += 1
  end
  new_arr
end



my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers, 9)