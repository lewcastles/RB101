def after_midnight(str)
  hours = str.slice(0..1).to_i
  mins = str.slice(3..4).to_i
  total = hours * 60 + mins
  total.divmod(1440)[1]
end

def before_midnight(str)
  hours = str.slice(0..1).to_i
  mins = str.slice(3..4).to_i
  total = -hours * 60 + -mins
  total.divmod(1440)[1]
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0