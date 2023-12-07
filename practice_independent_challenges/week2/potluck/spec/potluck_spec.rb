require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do
   describe 'initialize' do
      it 'is a Potluck' do
         potluck = Potluck.new("7-13-18")
         expect(potluck).to be_a Potluck
      end
   end

end