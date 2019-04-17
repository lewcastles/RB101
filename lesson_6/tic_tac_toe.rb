require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
].freeze

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

def display_scores(sco)
  system 'clear' || 'cls'
  puts "PLAYER [#{PLAYER_MARKER}] SCORE : #{sco['Player']}"
  puts "COMPUTER [#{COMPUTER_MARKER}] SCORE : #{sco['Computer']}"
end

def display_board(brd)
  puts '     |     |     '
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |     '
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { 'Player' => 0, 'Computer' => 0 }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    puts 'Bad Input. Please try again'
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!display_winner(brd)
end

def display_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def refresh_display(sco, brd)
  display_scores(sco)
  display_board(brd)
end

score = initialize_score
loop do
  board = initialize_board
  refresh_display(score, board)

  loop do
    player_places_piece!(board)
    computer_places_piece!(board)
    refresh_display(score, board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    score[display_winner(board)] += 1
    refresh_display(score, board)
    prompt "#{display_winner(board)} won the round!"
  else
    score['Player'] += 1
    score['Computer'] += 1
    refresh_display(score, board)
    prompt 'This round is a tie!'
  end

  
  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts 'Thanks for Playing!!'
