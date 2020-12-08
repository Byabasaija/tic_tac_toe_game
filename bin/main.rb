#!/usr/bin/env ruby

require_relative '../lib/game_logic.rb'
require_relative '../lib/play.rb'

class UserInterface

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def welcome
    puts 'TIC TAC TOE'
    puts "Welcome to Pascal's and Hillary's tic-tac-toe game"
  end

  def names_of_players

    player_names = Array.new(2)
    invalid = true
    while invalid
      (0..1).each do |i|
        puts "Enter player #{i + 1} name"
        player_names[i] = gets.chomp
      end

      if player_names[0] == player_names[1]
        puts "Player names can't be the same"
        invalid = true
  
      elsif player_names[0].empty? || player_names[1].empty?
        puts "player names can't be empty"
        invalid = true
      else
        invalid = false
      end
    end
    player_names
  end

  def player_symbols(player)
    puts ("#{player[0]} symbol is X and #{player[1]} symbol is O")
  end

  def show_board
    puts 'play by entering X or O on the board by selecting 1-9'
    puts <<-BOARD
      1 | 2 | 3 |
      -----------
      4 | 5 | 6 |
      -----------
      7 | 8 | 9 |
      BOARD
  end

  def display_board(board)

    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[1][2]} "
    puts '-----------'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts '-----------'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "    
  end

  def game
    game_logic = GameLogic.new

    game_on = true
    i = 0
    exp = '123456789'.split('')
    while game_on

      input = gets.chomp

      if exp.include?(input)
        puts game_logic.current_player(i)
        @board[input.to_i-1] = game_logic.current_player(i)
        puts @board.inspect, @board[input.to_i-1].class, game_logic.current_player(i)
        i += 1
      else
        puts "Enter Valid Input"
      end
    end
  end

end
user_interface = UserInterface.new
user_interface.welcome
player = user_interface.names_of_players
user_interface.player_symbols(player)
user_interface.show_board
user_interface.game
show = user_interface.display_board


# game_on = true

# puts 'Please enter your token (X or O)'
# token = gets.chomp!

# while game_on

#   board << token.to_i
#   if token == 'X'
#     puts 'The other players turn '
#   else
#     puts 'Your turn'
#   end

#   
#   BOARD

#   if board << token.to_i == 'X' || board << token.to_i == 'O'
#     puts 'Invalid move'
#   else
#     # play on
#     puts 'Valid move'
#   end

#   winner = true
#   # player tokens are alligned in the entire row or column
#   if winner
#     puts 'You won'
#     game_on = false
#   else
#     puts 'You Drew'
#   end
# end
