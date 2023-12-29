class Dock
   attr_reader :name, 
               :max_rental_time, 
               :rental_log

   def initialize(name, max_rental_time)
      @name = name
      @max_rental_time = max_rental_time
      @rental_log = {}
      @total_revenue = 0
   end

   def rent(boat, renter)
      @rental_log[boat] = renter
      @rental_log
   end

   def charge(boat)
      charge_boat = {}
      renter = @rental_log[boat]
      charge_boat[:card_number] = renter.credit_card_number
      
      if boat.hours_rented <= self.max_rental_time
         charge_boat[:amount] = boat.hours_rented * boat.price_per_hour
      else
         charge_boat[:amount] = self.max_rental_time * boat.price_per_hour
      end
      charge_boat
   end

   def return(boat)
      @total_revenue += charge(boat)[:amount]
      @rental_log.delete(boat)
   end

   def log_hour
      @rental_log.each do |boat, renter|
         boat.add_hour
      end
      @rental_log
   end

   def revenue
      @total_revenue
   end
end