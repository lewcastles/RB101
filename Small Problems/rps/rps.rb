require 'yaml'
LANGUAGE = 'en'.freeze
MESSAGES = YAML.load_file('rps_messages.yml')

WIN_CONDITIONS = {  'rock' => %w[scissors lizard],
                    'lizard' => %w[spock paper],
                    'spock' => %w[rock scissors],
                    'scissors' => %w[paper lizard],
                    'paper' => %w[rock spock] }.freeze

VALID_CHOICES = %w[r l sp sc p].freeze

def print_message(msg)
  puts MESSAGES[LANGUAGE][msg].to_s
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

def play_again?(str)
  str.match(/^[y]?$/i) && !str.empty?
end

def is_tie?(score1, score2)
  score1 == score2
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
    if valid_choice?(choice)
    return (WIN_CONDITIONS.keys.select { |key| key.start_with?(choice) }).join
    end
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

def display_champion(str, usersc, compsc)
  if usersc > compsc
    puts "#{str} IS THE CHAMPION!".center(50)
  else
    puts 'THE COMPUTER IS THE CHAMPION!'.center(50)
    puts
  end
end

def display_round_winner(userchoice, computerchoice, username)
  if player_won?(userchoice, computerchoice)
    puts "#{username} TAKES THE ROUND!".center(50)
  elsif is_tie?(userchoice, computerchoice)
    puts "IT'S A TIE!".center(50)
  else
    puts 'COMPUTER TAKES THE ROUND!'.center(50)
  end
  sleep(2)
end

def increment_score_counters(userchoice, computerchoice)
  score_arr = [0, 0]
  if player_won?(userchoice, computerchoice)
    score_arr[0] = 1
  elsif is_tie?(userchoice, computerchoice)
    score_arr = [1, 1]
  else
    score_arr[1] = 1
  end
  score_arr
end

def display_current_play(userchoice, computerchoice, username)
  puts "#{username}'s #{userchoice.upcase}".center(50)
  sleep(1)
  puts 'VS'.center(50)
  sleep(1)
  puts "COMPUTER'S #{computerchoice.upcase}".center(50)
  sleep(1)
end

def display_refresh_game_header(user, userscore, compscore, current_round)
  (system 'clear') || (system 'cls')
  puts '================================================'
  puts 'Rock, Paper, Scissors, Lizard, Spock'.center(50)

  unless user.empty?
    puts "| ROUND #{current_round} |".center(50)
    puts "#{user}: #{userscore}".center(50)
    puts "COMPUTER: #{compscore}".center(50)
  end
  puts '================================================'
end

# prompt then retrieve players name
display_refresh_game_header('', '', '', '')
print_message('username_prompt')
user_name = retrieve_username

loop do
  # set starting state for game
  round = 1
  user_score = 0
  computer_score = 0
  number_of_games = 1

  # prompt then retrieve number of games to play to
  display_refresh_game_header(user_name, user_score, computer_score, round)
  print_message('bestof_prompt')
  number_of_games = retrieve_best_of_games

  # begin main game loop, break out once num of games reached
  loop do
    display_refresh_game_header(user_name, user_score, computer_score, round)
    print_message('userchoice_prompt')
    user_choice = retrieve_user_choice
    computer_choice = retrieve_computer_choice

    display_refresh_game_header(user_name, user_score, computer_score, round)
    display_current_play(user_choice, computer_choice, user_name)
    display_round_winner(user_choice, computer_choice, user_name)
    incrementor_array = increment_score_counters(user_choice, computer_choice)
    user_score += incrementor_array[0]
    computer_score += incrementor_array[1]

    round += 1
    break if [user_score, computer_score].max == number_of_games
  end

  display_refresh_game_header(user_name, user_score, computer_score, round)
  display_champion(user_name, user_score, computer_score)

  print_message('playanother_prompt')
  break unless play_again?(gets.chomp)
end
