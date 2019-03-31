def greetings(arr, hsh)
  full_name = arr.join(' ')
  job_title = hsh[:title] + ' ' + hsh[:occupation]
  puts "Hello, #{full_name}. Nice to have a #{job_title} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
