munsters = {
  Herman: { age: 32, gender: 'male' },
  Lily: { age: 30, gender: 'female' },
  Grandpa: { age: 402, gender: 'male' },
  Eddie: { age: 10, gender: 'male' },
  Marilyn: { age: 23, gender: 'female'}
}

munsters.each_pair do |key, value|
  if value[:age] > 64
    munsters[key]['age_group'] = 'senior'
  elsif value[:age] > 17
    munsters[key][:age_group] = 'adult'
  else
    munsters[key][:age_group] = 'kid'
  end

end

p munsters