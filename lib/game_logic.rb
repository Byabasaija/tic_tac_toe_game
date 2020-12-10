class GameLogic
  attr_reader :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, turn)
    @board[input_to_index(input)] = current_player(turn)
  end

  def position_taken?(input)
    if @board[input.to_i] == '' || @board[input.to_i] == ' ' || @board[input.to_i].nil?
      false
    else
      true
    end
  end

  def valid_move?(input)
    if !position_taken?(input.to_i - 1) && (input.to_i - 1).between?(0, 8)
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

  def full?
    if @board.any? { |input| input.nil? || input == ' ' }
      false
    else
      true
    end
  end

  def won(board)
    WIN_COMBINATIONS.each do |w|
      return 1 if w.all? { |i| board[i] == 'X' }
      return 2 if w.all? { |i| board[i] == 'O' }
    end
    0
  end
end
