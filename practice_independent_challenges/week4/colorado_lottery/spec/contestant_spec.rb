require './lib/contestant'
require './lib/game' 

RSpec.describe Contestant do
   before(:each) do
      @pick_4 = Game.new('Pick 4', 2)
      @mega_millions = Game.new('Mega Millions', 5, true)
      @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
         
   end

   describe '#initialize' do
      it 'exists' do
         expect(@alexander).to be_a Contestant
      end

      it 'has a full name' do
         expect(@alexander.full_name).to eq "Alexander Aigiades"
      end

      it 'has an age' do
         expect(@alexander.age).to eq 28
      end

      it 'has a state of residency' do
         expect(@alexander.state_of_residence).to eq "CO"
      end

      it 'has money to spend' do 
         expect(@alexander.spending_money).to eq 10
      end
   end 

   describe '#out_of_state?' do
      it 'return false if contestant out of state' do
         expect(@alexander.out_of_state?).to eq false
      end
   end

   describe '#game_interests' do
      it 'start as an empty array' do
         expect(@alexander.game_interests).to eq([])
      end

      it 'can #add_game_interest' do 
      @alexander.add_game_interest('Mega Millions')
      @alexander.add_game_interest('Pick 4')

      expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
      end
   end

   describe '#charge' do
      it 'charge cost of game' do
         @alexander.add_game_interest('Mega Millions')
         @alexander.add_game_interest('Pick 4')

         expect(@alexander.charge(@pick_4.cost)).to eq(8)
      end
   end
end