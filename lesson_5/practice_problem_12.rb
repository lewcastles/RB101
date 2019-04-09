arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hsh = {}
arr.each do |inner_arr|
  new_hsh[inner_arr[0]] = inner_arr[1]
end
new_hsh
