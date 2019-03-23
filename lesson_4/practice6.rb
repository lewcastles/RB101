flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|word| word[0, 3]}
p flintstones