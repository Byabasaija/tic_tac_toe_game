require_relative '../lib/play.rb'
describe GamePlay do
  let(:gameplay) { GamePlay.new('Player1', 'X') }

  it ' checks for player names' do
    expect(gameplay.player_names).to eq('Player1')
  end

  it ' checks for player mark' do
    expect(gameplay.token).to eq('X')
  end
end
