class GamePlay
    attr_accessor :name, :token
  def initialize(player_names, token)
    @player_names = player_names
    @token = token
  end
end