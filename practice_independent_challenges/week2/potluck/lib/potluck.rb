class Potluck
   attr_reader :date, :dishes

   def initialize(date)
      @date = date
      @dishes = []
   end

   def add_dish(dish)
      @dishes << dish
   end

   def get_all_from_category(category)
      @dishes.select { |dish| dish.category == category }
   end

   def menu
      menu = {}
      @dishes.each do |dish|
         menu[dish.category] ||= []
         menu[dish.category].push (dish.name)
         menu[dish.category].sort!  
      end
      menu
   end
end