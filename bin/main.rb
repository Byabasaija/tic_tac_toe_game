#!/usr/bin/env ruby

require_relative '../lib/game_logic.rb'
require_relative '../lib/play.rb'

class UserInterface
  def initialize
    @game_logic = GameLogic.new
  end

  def welcome
    puts 'TIC TAC TOE'
    puts "Welcome to Pascal's and Hillary's tic-tac-toe game"
    player = names_of_players
    player_symbols(player)
    show_board
    game
    display_board(@board)
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
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def game
    game_on = true
    i = 0
    exp = '123456789'.split('')
    while game_on

      input = gets.chomp
      # index = @game_logic.input_to_index(input)

      if exp.include?(input)
        puts @game_logic.current_player(i)
        # @board [@game_logic.input_to_index(input)] = @game_logic.current_player(i)
        
        display_board(@game_logic.board)
        i += 1
      else
        puts "Enter Valid Input"
      end

      if @game_logic.valid_move?(input)
        @game_logic.move(input, i)
      else
        puts "position taken"
      end

      # valid = @game_logic.position_taken?(input)

      # if valid = @game_logic.current_player(i)
      #   @board[input.to_i-1] = @game_logic.current_player(i)
      # else
      #   puts 'position taken'
      # end

      # @game_logic.valid_move?(input.to_i)
      # return 'Position taken' unless @game_logic.position_taken?(input)

    end
  end
end
user_interface = UserInterface.new
user_interface.welcome
