require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do
   before(:each) do
      @potluck = Potluck.new("7-13-18")
      @couscous_salad = Dish.new("Couscous Salad", :appetizer)
      @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      @summer_pizza = Dish.new("Summer Pizza", :appetizer)
      @roast_pork = Dish.new("Roast Pork", :entre)
      @candy_salad = Dish.new("Candy Salad", :dessert)
      @bean_dip = Dish.new("Bean Dip", :appetizer)
   end

   describe 'initialize' do
      it 'is a Potluck' do
         expect(@potluck).to be_a Potluck
      end

      it 'has a date' do
         expect(@potluck.date).to eq "7-13-18"
      end

      it 'start with no dishes' do
         expect(@potluck.dishes).to eq []
      end 
   end

   describe '#add_dish' do
      it 'add dishes to Potluck dishes' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@cocktail_meatballs)
         expect(@potluck.dishes).to eq [@couscous_salad, @cocktail_meatballs]
      end
   end

   describe '#get_all_from_category' do
      it 'return an array with dishes in category' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@summer_pizza)
         @potluck.add_dish(@roast_pork)
         @potluck.add_dish(@cocktail_meatballs)
         
         expected = [@couscous_salad, @summer_pizza]
         expect(@potluck.get_all_from_category(:appetizer)).to eq (expected)
      end

      it 'can return the first item of a category' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@summer_pizza)
         @potluck.add_dish(@roast_pork)
         @potluck.add_dish(@cocktail_meatballs)

         expected = @couscous_salad
         expect(@potluck.get_all_from_category(:appetizer).first).to eq (expected)
      end

      it 'can return the first item name of a category' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@summer_pizza)
         @potluck.add_dish(@roast_pork)
         @potluck.add_dish(@cocktail_meatballs)
         
         expected = "Couscous Salad"
         expect(@potluck.get_all_from_category(:appetizer).first.name).to eq (expected)
      end
   end
# MENU METHOD SORT ALPHABETCALLY 
   describe '#menu' do
      it 'sort food according to its category' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@summer_pizza)
         @potluck.add_dish(@roast_pork)
         @potluck.add_dish(@cocktail_meatballs)
         @potluck.add_dish(@candy_salad)
         @potluck.add_dish(@bean_dip)

         expected = {:appetizer=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entre=>["Cocktail Meatballs", "Roast Pork"],:dessert=>["Candy Salad"]}
         expect(@potluck.menu).to eq (expected)

      end
   end
end