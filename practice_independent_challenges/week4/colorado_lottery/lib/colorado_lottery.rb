class ColoradoLottery
   attr_reader :registered_contestants,
               :current_contestants,
               :winners

   def initialize
      @registered_contestants = {}
      @current_contestants = {}
      @winners = []
   end

   def interested_and_18?(contestant, game)
      contestant.age >= 18 && contestant.game_interests.include?(game.name)
   end

   def can_register?(contestant, game)
      contestant.age >= 18 && contestant.game_interests.include?(game.name) && (!contestant.out_of_state? || game.national_drawing?)
   end

   def register_contestant(contestant, game)
      if can_register?(contestant, game)
         @registered_contestants[game] ||= []
         @registered_contestants[game] << contestant
      end
   end

   def eligible_contestants
      eligible_contestants = []
      @registered_contestants.each do |game, contestants|
         contestants.each do |contestant| 
            if contestant.spending_money >= game.cost
               eligible_contestants << contestant
            end
         end
      end
      eligible_contestants
   end

   def current_contestants
      @registered_contestants.each do |game, contestants|
         contestants.each do |contestant| 
            if contestant.spending_money >= game.cost
               contestant.charge(game.cost)
               @current_contestants[game] ||= []
               @current_contestants[game] << contestant.full_name
            end
         end
      end
      @current_contestants
   end

   def draw_winners
      @winners.clear 
      current_contestants.each do |game, contestants|
         @winners << {contestants.sample => game.name}
      end
      @winners
   end

   def announce_winner
      draw_winners
      announcement = ""
      
      @winners.each do |winner|
         announcement += "The winner of #{winner.values[0]} is #{winner.keys[0]}."
      end
      
      announcement
   end
end