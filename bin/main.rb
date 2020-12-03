puts "Welcome to Pascal and Hillary's tic-tac-toe game"

puts 'Enter name'

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

puts 'You won'
puts 'You Drew'
