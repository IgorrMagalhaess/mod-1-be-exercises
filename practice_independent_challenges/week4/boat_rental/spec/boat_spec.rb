require './lib/boat'
require './lib/renter'

RSpec.describe Boat do
   describe '#initialize' do
      it 'exists' do
         kayak = Boat.new(:kayak, 20)
         expect(kayak).to be_a Boat
      end

      it 'has a type' do
         kayak = Boat.new(:kayak, 20)
         expect(kayak.type).to eq :kayak
      end

      it 'has a price per hour' do
         kayak = Boat.new(:kayak, 20)
         expect(kayak.price_per_hour).to eq 20
      end

      it 'initialize with no hours rented' do
         kayak = Boat.new(:kayak, 20)
         expect(kayak.hours_rented).to eq 0
      end
   end

   describe '#add_hour' do
      it 'add hours to hours_rented' do
         kayak = Boat.new(:kayak, 20)
         kayak.add_hour
         kayak.add_hour
         kayak.add_hour

         expect(kayak.hours_rented).to eq 3

         kayak.add_hour

         expect(kayak.hours_rented).to eq 4
      end
   end
end