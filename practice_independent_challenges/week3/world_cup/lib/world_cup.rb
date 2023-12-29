class WorldCup
   attr_reader :year, :teams

   def initialize(year, teams)
      @year = year
      @teams = teams
   end

   # def active_players_by_position(position)
   #    @teams.flat_map { |team| team.players.select { |player| player.position == position } }
   # end

   def active_players_by_position(position)
      active_players = []
  
      teams.each do |team|
         if team.eliminated? == false
            team.players.each do |player|
               if player.position == position
                  active_players << player
               end
            end
         end
      end
      active_players
   end

   def all_players_by_position
      all_players = Hash.new([])
      @teams.each do |team|
         team.players.each do |player|
            all_players[player.position] << player
         end
      end
      all_players
   end
end