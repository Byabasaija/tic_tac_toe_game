#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting
require_relative '../lib/game_logic'
require_relative '../lib/play'
class UserInterface
  def initialize
    @game_logic = GameLogic.new
  end

  def welcome
    puts 'TIC TAC TOE'
    puts "Welcome to Pascal's and Hillary's tic-tac-toe game"
    @player = names_of_players
    player_symbols(@player)
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

      elsif '0123456789'.include?(player_names[0]) || '0123456789'.include?(player_names[1])
        puts 'Enter a valid name'
        invalid = true

      elsif player_names[0].include?(' ') || player_names[1].include?(' ')
        puts 'Enter a valid name'
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
    puts("#{player[0]} symbol is X and #{player[1]} symbol is O")
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
      puts("#{@player[0]} starts the game") if @game_logic.turn.zero?
      input = gets.chomp
      if @game_logic.valid_move?(input)
        @game_logic.move(input, i) && @game_logic.position_taken?(input)
        display_board(@game_logic.board)

        if @game_logic.won(@game_logic.board) == 1 || @game_logic.won(@game_logic.board) == 2
          case @game_logic.won(@game_logic.board)
          when 1
            abort("#{@player[0]} wins!")
          when 2
            abort("#{@player[1]} wins!")
          end

        elsif @game_logic.turn.even?
          puts("#{@player[0]}'s turn")
        else
          puts("#{@player[1]}'s turn")
        end

        if @game_logic.turn == 9
          abort("It's a draw")
        else
          game_on
        end
        i += 1

      elsif exp.include?(input) && @game_logic.turn < 8
        @game_logic.position_taken?(input)
        display_board(@game_logic.board)
        puts 'Position Taken Try Again'

      elsif @game_logic.full?
        abort("It's a draw")

      else
        puts 'Enter Valid Input'
      end

    end
  end
end
user_interface = UserInterface.new
user_interface.welcome

# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting
