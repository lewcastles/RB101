arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr =  arr.map do |hsh|
  temp_hash = {}
  hsh.keys.each do |key|
    temp_hash[key] = hsh[key] + 1
  end
  temp_hash
end

p arr
p new_arr