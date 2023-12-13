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

   def ratio(category)
      total_dishes = @dishes.length.to_f
      category_count = @dishes.count { |dish| dish.category == category }

      if total_dishes > 0
         ratio = (category_count / total_dishes) * 100
         ratio.round(1)
      else
         0.0
      end
   end
end