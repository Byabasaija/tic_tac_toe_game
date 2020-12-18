class GamePlay
  attr_accessor :player_names, :token

  def initialize(player_names, token)
    @player_names = player_names
    @token = token
  end
end
