puts "Welcome to Pascal and Hillary's tic-tac-toe game"

puts 'Enter first player name'
player_names = Array.new(2)
invalid = true
while invalid
    (0..1).each do |i|
     puts "Enter player #{i+1} name" 
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

puts "Please enter your token (X or O)"
token = gets.chomp!
if token == "X"
    board<<token.to_i
    puts "The other players turn "
else token == "O"
    board<<token.to_i
    puts "Your turn"
end
board_played = ['X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X']
def display_board(board_played)
    puts " #{board_played[0]} | #{board_played[1]} | #{board_played[2]} "
    puts '-----------'
    puts " #{board_played[3]} | #{board_played[4]} | #{board_played[5]} "
    puts '-----------'
    puts " #{board_played[6]} | #{board_played[7]} | #{board_played[8]} "
  end
display_board(board_played)
if board<<token.to_i && token.to_i
    #Invalid move
    else
        #play on
    end


puts 'You won'
puts 'You Drew'
