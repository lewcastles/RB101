require 'yaml'
LANGUAGE = 'en'
MESSAGES = YAML.load_file('rps_messages.yml')

WIN_CONDITIONS = {  'rock' => %w[scissors lizard],
                    'lizard' => %w[spock paper],
                    'spock' => %w[rock scissors],
                    'scissors' => %w[paper lizard],
                    'paper' => %w[rock spock]
                  }.freeze

VALID_CHOICES = %w[r l sp sc p]

def print_message(msg)
  puts MESSAGES[LANGUAGE][msg].to_s
end

def print_center(msg)
  msg.center(50)
end

def player_won?(player_choice, computer_choice)
  WIN_CONDITIONS[player_choice].include?(computer_choice)
end

def valid_name_format?(str)
  str.match(/^[A-Z]+[ ]?[A-Z]*$/i) && !str.empty?
end

def valid_games_number?(int)
  (1..9).cover?(int)
end

def valid_choice?(str)
  VALID_CHOICES.include?(str)
end

def display_refresh_game_header(user, user_score, computer_score, current_round)
  (system 'clear') || (system 'cls')
  puts '================================================'
  puts 'Rock, Paper, Scissors, Lizard, Spock'.center(50)
  puts "| ROUND #{current_round} |".center(50)
  unless user.empty?
    puts "#{user}: #{user_score}".center(50)
    puts "COMPUTER: #{computer_score}".center(50) 
  end
  puts '================================================'
end

def retrieve_best_of_games
  loop do
    games = gets.chomp.to_i
    return games if valid_games_number?(games)

    print_message('bestof_prompt_fail')
  end
end

def retrieve_user_choice
  loop do
    choice = gets.chomp.downcase
    return (WIN_CONDITIONS.keys.select { |key| key.start_with?(choice) }).join if valid_choice?(choice)

    print_message('userchoice_prompt_fail')
  end
end

def retrieve_username
  loop do
    name = gets.chomp
    return name.upcase if valid_name_format?(name)

    print_message('username_prompt_fail')
  end
end

def retrieve_computer_choice
  WIN_CONDITIONS.keys.sample
end


user_name = ''
number_of_games = 0
round = 1
user_score = 0
computer_score = 0

display_refresh_game_header(user_name, user_score, computer_score, round)
print_message('username_prompt')
user_name = retrieve_username

display_refresh_game_header(user_name, user_score, computer_score, round)
print_message('bestof_prompt')
number_of_games = retrieve_best_of_games

loop do
  display_refresh_game_header(user_name, user_score, computer_score, round)
  print_message('userchoice_prompt')
  user_choice = retrieve_user_choice
  computer_choice = retrieve_computer_choice

  display_refresh_game_header(user_name, user_score, computer_score, round)
  puts "#{user_name}'s #{user_choice.upcase}".center(50)
  sleep(1)

  puts 'VS'.center(50)
  sleep(1)

  puts "COMPUTER'S #{computer_choice.upcase}".center(50)
  sleep(1)

  if player_won?(user_choice, computer_choice)
    puts "#{user_name} TAKES THE ROUND!".center(50)
    user_score += 1
  elsif user_choice==computer_choice
    puts "IT'S A TIE!".center(50)
    user_score += 1
    computer_score += 1
  else
    puts 'COMPUTER TAKES THE ROUND!'.center(50)
    computer_score += 1
  end
  sleep(2)
  round += 1
  break if [user_score, computer_score].max == number_of_games
end
display_refresh_game_header(user_name, user_score, computer_score, round)
if user_score > computer_score
  puts "#{user_name} IS THE CHAMPION!".center(50)
  else
  puts "THE COMPUTER IS THE CHAMPION!".center(50)
end

