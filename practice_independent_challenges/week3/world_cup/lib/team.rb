class Team
   attr_reader :country, :players

   def initialize(country)
      @country = country
      @eliminated = false
      @players = []
   end

   def eliminated?
      @eliminated
   end

   def eliminated
      @eliminated = true
   end

   def add_player(player)
      @players << player
   end

   def player_by_position(position)
      @players.select { |player| player.position == position }
   end
end