puts "Welcome to Pascal and Hillary's tic-tac-toe game"

puts 'Enter first player name'
player_names = Array.new(2)
invalid = true
while invalid
  # get the player names and add them to player_names array
  puts "Enter player #{i + 1} name"
  player_names[i] = gets.chomp
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

puts 'You won'
puts 'You Drew'
