require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do
   describe 'initialize' do
      it 'is a Potluck' do
         potluck = Potluck.new("7-13-18")
         expect(potluck).to be_a Potluck
      end

      it 'has a date' do
         potluck = Potluck.new("7-13-18")
         expect(potluck.date).to eq "7-13-18"
      end

      it 'start with no dishes' do
         potluck = Potluck.new("7-13-18")
         expect(potluck.dishes).to eq []
      end 
   end

end