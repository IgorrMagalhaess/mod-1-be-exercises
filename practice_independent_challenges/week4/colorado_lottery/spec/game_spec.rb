require './lib/contestant'
require './lib/game'

RSpec.describe Game do
   describe '#initialize' do
      it 'exists' do
         pick_4 = Game.new('Pick 4', 2)
         expect(pick_4).to be_a Game
      end

      it 'has a name' do 
         pick_4 = Game.new('Pick 4', 2)
         mega_millions = Game.new('Mega Millions', 5, true)

         expect(pick_4.name).to eq "Pick 4"
         expect(mega_millions.name).to eq "Mega Millions"
      end

      it 'has a cost' do
         pick_4 = Game.new('Pick 4', 2)
         mega_millions = Game.new('Mega Millions', 5, true)
         
         expect(pick_4.cost).to eq 2
         expect(mega_millions.cost).to eq 5
      end
   end

   describe '#national_drawing?' do
      it 'return if game has national drawing' do
         pick_4 = Game.new('Pick 4', 2)
         mega_millions = Game.new('Mega Millions', 5, true)
         
         expect(mega_millions.national_drawing?).to eq true
         expect(pick_4.national_drawing?).to eq false
      end
   end
end