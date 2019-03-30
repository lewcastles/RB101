def show_multiplicative_average(arr)


  float_3dp_multi_av = (arr.reduce(:*).to_f / arr.size.to_f).round(3)
  p "The result is #{float_3dp_multi_av}" 
end


show_multiplicative_average([3, 5])


show_multiplicative_average([6])


show_multiplicative_average([2, 5, 7, 11, 13, 17])
