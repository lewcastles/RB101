def running_total(arr)
  cur_total = 0
  totals_arr = []
  arr.each do |element|
    cur_total += element
    totals_arr << cur_total
  end
  totals_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []