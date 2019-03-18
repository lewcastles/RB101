def select_fruit(hsh)
  count = 0
  selected = {}
  hsh_keys = hsh.keys
  loop do
    break if count == hsh.size

    cur_key = hsh_keys[count]
    cur_val = hsh[cur_key]
    if cur_val == 'Vegetable'
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

p select_fruit(produce)