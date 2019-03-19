def general_select(hsh, selector)
  selected = {}
  keylist = hsh.keys
  count = 0
  loop do
    break if count >= hsh.size

    cur_key = keylist[count]
    cur_val = hsh[cur_key]

    if cur_val == selector
    selected[cur_key] = cur_val
    end
    count += 1
  end
  selected
end



produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Meat')