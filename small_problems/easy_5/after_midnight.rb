def time_of_day(mins)
  mins = mins
  res = case mins <=> 0
  when 1
    mins.divmod(60)
  when 0 
    mins.divmod(60)
  when -1
    mins.divmod(60)
  end
  hours = (24 + (res[0] / 24)).divmod(24)[0]
  mins = res[1]
  puts format('%02d:%02d', hours, mins)
end



time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"