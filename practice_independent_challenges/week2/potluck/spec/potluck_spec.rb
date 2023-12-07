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
      before(:each) do
         it 'add dishes to Potluck dishes' do
         @potluck.add_dish(@couscous_salad)
         @potluck.add_dish(@cocktail_meatballs)
         expect(@potluck.dishes).to eq [@couscous_salad, @cocktail_meatballs]
      end
   end


end