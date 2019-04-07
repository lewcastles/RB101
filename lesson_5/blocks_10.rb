arr = [  [[1, 2], [3, 4]], [5, 6]  ]

arr.map do |onedeep|
  onedeep.map do |twodeep|
    if twodeep.instance_of?(Integer)
      twodeep + 1
    else
      twodeep.map do |threedeep|
        threedeep + 1
      end
    end
  end
end
