# ./online_order.rb
module OnlineOrder 
   def confirmation(thing)
      "You got #{thing}."
    end
  
    def delivery
      "Your #{order} will arrive in #{wait_time}."
    end
  
    def review
      "Please rate your order within 30 days."
    end
end
