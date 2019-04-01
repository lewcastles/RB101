def toggle(n)
n=!n
end

def lights(int)
  lights_on = []
  light_array = Array.new(int, false)
  1.step(light_array.size, 1) do |round|
    light_array.each_with_index do |light, idx| 
      light_array[idx] = !light if (idx + 1) % round == 0
    end
  end
  light_array.each_with_index { |e, idx| lights_on << idx + 1 if e}
  lights_on
end

p lights(10)



