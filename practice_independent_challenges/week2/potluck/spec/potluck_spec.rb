require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do
   before(:each) do
      @potluck = Potluck.new("7-13-18")
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
         couscous_salad = Dish.new("Couscous Salad", :appetizer)
         cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
         @potluck.add_dish(couscous_salad)
         @potluck.add_dish(cocktail_meatballs)
         expect(@potluck.dishes).to eq [couscous_salad, cocktail_meatballs]
      end
   end
end