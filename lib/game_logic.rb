class GameLogic
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2],
        [0,4,8]
        ]

    def initialize
        @board = Array.new(9, " ")
    end

    def input_to_index(token)
      @choice = token.to_i-1
    end

    def move(input_to_index,token)
      @board[input_to_index] = token
    end

    def position_taken?(input_to_index)
    if @board[input_to_index] == "X" || @board[input_to_index] == "O"
      true
    else
      false
    end
    end

    def valid_move?(input_to_index)
      !position_taken?(input_to_index) && @board[input_to_index]
    end

    def turn
      count = 0 
      @board.each do |input|
        count +=1 if input == 'X' || input == 'O'
      end
      count
    end

    def current_player(board)
      if turn(board) % 2 == 0 
      "X" = true
      else 
      "O" = true
    end
end