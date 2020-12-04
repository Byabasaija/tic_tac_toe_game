puts "Welcome to Pascal and Hillary's tic-tac-toe game"

puts 'Enter first player name'
player_names = Array.new(2)
invalid = true
while invalid
  (0..1).each do |i|
    puts "Enter player #{i + 1} name"
    player_names[i] = gets.chomp
  end
  invalid = false
end
puts 'TIC TAC TOE'

puts 'play by entering X or O on the board'

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

game_on = true

puts 'Please enter your token (X or O)'
token = gets.chomp!

while game_on

  board << token.to_i
  if token == 'X'
    puts 'The other players turn '
  else
    puts 'Your turn'
  end

  puts <<-BOARD
    |X|O|X|
    |X|O|X|
    |X|O|X|
  BOARD

  if board << token.to_i == 'X' || board << token.to_i == 'O'
    puts 'Invalid move'
  else
    # play on
    puts 'Valid move'
  end

  winner = true
  # player tokens are alligned in the entire row or column
  if winner
    puts 'You won'
    game_on = false
  else
    puts 'You Drew'
  end
end
