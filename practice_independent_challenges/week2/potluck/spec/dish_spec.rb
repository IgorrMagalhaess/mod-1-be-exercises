require 'rspec'
require './lib/dish'

describe Dish do
   describe '#initialize' do
      it 'is a Dish' do
         dish = Dish.new("Couscous Salad", :appetizer)
         expect(dish).to be_a Dish
      end

end