class GameLogic
  attr_reader :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

    # WIN_COMBINATIONS = [
    #   [0,1,2],
    #   [3,4,5],
    #   [6,7,8],
    #   [0,3,6],
    #   [1,4,7],
    #   [2,5,8],
    #   [6,4,2],
    #   [0,4,8]
    #   ]
    # input = gets.chomp
    # input = input_to_input(input)
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, turn)
    @board[input.to_i] = current_player(turn)
  end

  def position_taken?(input)
    if @board[input.to_i] == '' || @board[input.to_i] == ' ' || @board[input.to_i].nil?
      false
    else
      true
    end
  end

  def valid_move?(input)
    if !position_taken?(input.to_i) && input.to_i.between?(1, 8)
      true
    else
      false
    end
  end

  def turn
    count = 0
    @board.each do |input|
      count += 1 if %w[X O].include?(input)
    end
    count
  end

  def current_player(turn)
    if turn.even?
      'X'
    else
      'O'
    end
  end
end
