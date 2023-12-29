class Contestant
   attr_reader :full_name,
               :age,
               :state_of_residence,
               :spending_money,
               :game_interests

   def initialize(contestant_data)
      @full_name = "#{contestant_data[:first_name]} #{contestant_data[:last_name]}"
      @age = contestant_data[:age]
      @state_of_residence = contestant_data[:state_of_residence]
      @spending_money = contestant_data[:spending_money]
      @game_interests = []
   end

   def out_of_state?
      @state_of_residence != "CO"
   end

   def add_game_interest(game_name)
      @game_interests << game_name
   end

   def charge(cost)
      @spending_money -= cost
      @spending_money
   end
end