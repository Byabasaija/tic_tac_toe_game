require_relative '../lib/game_logic'
require_relative '../lib/play'

describe GameLogic do
  game_logic = GameLogic.new

  describe '#input_to_index' do
    it 'checks if the input is put to the corresponding index on board' do
      expect(game_logic.input_to_index(2)).to eq(1)
    end
  end

  describe '#check for valid inputs' do
    it 'Check if a number between 1 and 9 is valid input' do
      expect(game_logic.valid_move?('1')).to eql(true)
    end

    it 'Check if 9 is valid input' do
      expect(game_logic.valid_move?('9')).to eql(true)
    end

    it 'Check if a number greater than 9 is valid input' do
      expect(game_logic.valid_move?('10')).to eql(false)
    end

    it 'Check if letters are valid input' do
      expect(game_logic.valid_move?('a')).to eql(false)
    end

    it 'Check if space is valid input' do
      expect(game_logic.valid_move?(' ')).to eql(false)
    end
  end

  describe '#turn' do
    it 'counts the turns taken in the game' do
      expect(game_logic.turn).to eq(0)
    end
  end

  describe '#checks for position taken' do
    it 'checks if position has been taken or not' do
      expect(game_logic.position_taken?(1)).to eq(false)
    end
  end

  describe '#current_player' do
    it 'checks for the current player' do
      expect(game_logic.current_player(0)).to eq('X')
    end
  end

  describe '#move' do
    it 'checks player moves' do
      expect(game_logic.move(1, 0)).not_to eq(false)
    end
  end

  describe '#full' do
    it 'checks if the board if full' do
      expect(game_logic.full?).to eq(false)
    end
  end

  describe '#won' do
    it 'checks if the game has been won or not' do
      expect(game_logic.won('X')).to eq(0)
    end
  end
end
