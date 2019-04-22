INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
FIRST_PLAYER = 'choose'
WIN_LIMIT = 2

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim = ',', word = 'or')
  arr.map.with_index do |element, idx|
    case idx
    when 0 then element.to_s
    when arr.size - 1 then " #{word} #{element}"
    else "#{delim} #{element}"
    end
  end.join
end

def display_scores(info)
  system 'clear' || 'cls'
  puts 'TIC-TAC-TOE'
  puts "FIRST PLAYER TO SCORE #{WIN_LIMIT} WINS!"
  puts "#{info['User']} [#{PLAYER_MARKER}] SCORE : #{info['player_score']}"
  puts "COMPUTER [#{COMPUTER_MARKER}] SCORE : #{info['computer_score']}"
end

def draw_board_row(col1, col2, col3)
  puts '     |     |     '
  puts "  #{col1}  |  #{col2}  |  #{col3}  "
  puts '     |     |     '
end

def display_board(brd)
  draw_board_row(brd[1], brd[2], brd[3])
  puts '-----+-----+-----'
  draw_board_row(brd[4], brd[5], brd[6])
  puts '-----+-----+-----'
  draw_board_row(brd[7], brd[8], brd[9])
end

def choose_first_player
  play = ''
  loop do
    prompt 'Who goes first? (p for the human player, c for computer):'
    play = gets.chomp.downcase
    break if play =~ /^[pc]{1}$/

    prompt 'Invalid Input. Please select from the options provided.'
  end

  play == 'p' ? 'player' : 'computer'
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def valid_name_format?(str)
  str.match(/^[A-Z]+[ ]?[A-Z]*$/i) && !str.empty?
end

def retrieve_username
  loop do
    prompt 'Please enter your name:'
    name = gets.chomp
    return name.upcase if valid_name_format?(name)

    prompt 'Bad Username. Please try again. Check no numbers or spaces.'
  end
end

def initialize_gameinfo
  game_information = { 'player_score' => 0, 'computer_score' => 0,
                       'first_player' => '', 'username' => '' }
  initialize_username!(game_information)
  initialize_first_player!(game_information)
  game_information
end

def initialize_first_player!(info)
  info['first_player'] = if FIRST_PLAYER == 'choose'
                           choose_first_player
                         else
                           FIRST_PLAYER
                         end
end

def initialize_username!(info)
  info['User'] = retrieve_username
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    input = gets.chomp
    square = input.to_i
    break if empty_squares(brd).include?(square) && input =~ /^[1-9]{1}$/

    prompt 'Invalid Input. Please select from the options provided.'
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  move = retrieve_win_or_block_move(brd, COMPUTER_MARKER)
  move ||= retrieve_win_or_block_move(brd, PLAYER_MARKER)
  move ||= retrieve_center_or_random_move(brd)
  brd[move] = COMPUTER_MARKER
end

def place_piece!(brd, cur_player)
  if cur_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def retrieve_win_or_block_move(brd, marker)
  result = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      result = line.detect { |e| brd[e] == INITIAL_MARKER }
      break if result
    end
  end
  result
end

def retrieve_center_or_random_move(brd)
  brd[5] == INITIAL_MARKER ? 5 : empty_squares(brd).sample
end

def someone_won?(brd)
  !!winner(brd)
end

def winner(brd)
  WINNING_LINES.each do |line|
    return 'player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def refresh_display(info, brd)
  display_scores(info)
  display_board(brd)
end

def alternate_player(cur_player)
  cur_player == 'player' ? 'computer' : 'player'
end

def score_winner!(info, brd)
  if winner(brd) == 'player'
    info['player_score'] += 1
    prompt " #{info['username']} won the round!"
  else
    info['computer_score'] += 1
    prompt 'The computer won the round!'
  end
end

def player_won_match?(info)
  info['player_score'] > info['computer_score']
end

def score_reached_limit?(info)
  info['player_score'] >= WIN_LIMIT || info['computer_score'] >= WIN_LIMIT
end

def prompt_user_play_again
  prompt 'Would you like to play another game? '
  prompt "Enter the 'Y' key to restart the game, "\
          'all other keys will close the program.'
  gets.chomp
end

def play_again?(str)
  str.match(/^[y]?$/i) && !str.empty?
end

# MAIN GAME LOGIC --------------------------------------

loop do
  system 'clear' || 'cls'
  gameinfo = initialize_gameinfo
  loop do
    board = initialize_board
    current_player = gameinfo['first_player']
    refresh_display(gameinfo, board)

    # ROUND LOOP ------------------------------------------

    loop do
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      refresh_display(gameinfo, board)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      score_winner!(gameinfo, board)
    else
      prompt 'This round is a tie!'
    end

    sleep(2)
    refresh_display(gameinfo, board)

    break if score_reached_limit?(gameinfo)
  end

  if player_won_match?(gameinfo)
    prompt 'Player Wins the Match!'
  else
    prompt 'Computer Wins the Match!'
  end

  str = prompt_user_play_again
  break unless play_again?(str)
end

system 'clear' || 'cls'
prompt 'Thanks for Playing. Take it easy!'
