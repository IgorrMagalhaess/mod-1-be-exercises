class Player
   attr_reader :name, :position
   
   def initialize(data_player)
      @name = data_player[:name]
      @position = data_player[:position]
   end      
end