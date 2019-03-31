def swap_name(str)
  name_arr = str.split
  "#{name_arr[1]}, #{name_arr[0]}"
end



p swap_name('Joe Roberts') == 'Roberts, Joe'