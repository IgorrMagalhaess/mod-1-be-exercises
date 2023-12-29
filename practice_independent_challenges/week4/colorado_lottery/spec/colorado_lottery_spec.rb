require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'

RSpec.describe ColoradoLottery do
   before(:each) do
      @pick_4 = Game.new('Pick 4', 2)
      @mega_millions = Game.new('Mega Millions', 5, true)
      @cash_5 = Game.new('Cash 5', 1)
      @alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
      @benjamin = Contestant.new({
                        first_name: 'Benjamin',
                        last_name: 'Franklin',
                        age: 17,
                        state_of_residence: 'PA',
                        spending_money: 100})
      @frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
      @winston = Contestant.new({
                        first_name: 'Winston',
                        last_name: 'Churchill',
                        age: 18,
                        state_of_residence: 'CO',
                        spending_money: 5}) 
      @charlie = Contestant.new({
                           first_name: 'Charlie',
                           last_name: 'Morrison',
                           age: 26,
                           state_of_residence: 'CO',
                           spending_money: 5})   
      
      @alexander.add_game_interest('Pick 4')    
      @alexander.add_game_interest('Mega Millions') 
      @frederick.add_game_interest('Mega Millions')   
      @winston.add_game_interest('Cash 5')     
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')
      @charlie.add_game_interest('Cash 5')
      @charlie.add_game_interest('Pick 4')
   end

   describe '#initialize' do
      it 'exists' do
         lottery = ColoradoLottery.new
         
         expect(lottery).to be_an_instance_of ColoradoLottery
      end

      it 'start with no contestants' do
         lottery = ColoradoLottery.new
         
         expect(lottery.registered_contestants).to eq({})
      end

      it 'start with no winners' do
         lottery = ColoradoLottery.new
         
         expect(lottery.winners).to eq([])
      end

      it 'start with no current_contestants' do
         lottery = ColoradoLottery.new
         
         expect(lottery.current_contestants).to eq({})
      end
   end

   describe '#interested_and_18?' do
      it 'check if contestant is interested and its above 18' do
         lottery = ColoradoLottery.new
         
         expect(lottery.interested_and_18?(@alexander, @pick_4)).to eq true
         expect(lottery.interested_and_18?(@benjamin, @mega_millions)).to eq false
         expect(lottery.interested_and_18?(@alexander, @cash_5)).to eq false
      end
   end

   describe '#can_register' do
      it 'can register contestants' do
         lottery = ColoradoLottery.new
         
         expect(lottery.can_register?(@alexander, @pick_4)).to eq true
         expect(lottery.can_register?(@alexander, @cash_5)).to eq false
         expect(lottery.can_register?(@frederick, @mega_millions)).to eq true
         expect(lottery.can_register?(@benjamin, @mega_millions)).to eq false
         expect(lottery.can_register?(@frederick, @cash_5)).to eq false
      end
   end
   
   describe '#register_contestant' do
      it 'add contestant that can be registered' do
         lottery = ColoradoLottery.new
         lottery.register_contestant(@alexander, @pick_4)
         lottery.register_contestant(@alexander, @cash_5)

         expect(lottery.registered_contestants).to eq({@pick_4 => [@alexander]})

         lottery.register_contestant(@frederick, @mega_millions)
         lottery.register_contestant(@benjamin, @mega_millions)

         expect(lottery.registered_contestants).to eq({@pick_4 => [@alexander], 
                                                       @mega_millions => [@frederick]})
      end
   end

   describe '#eligible_contestants' do
      it 'returns contestants who have been registered and have enough money' do
         lottery = ColoradoLottery.new
         lottery.register_contestant(@alexander, @pick_4)
         lottery.register_contestant(@alexander, @cash_5)
         lottery.register_contestant(@frederick, @mega_millions)
         lottery.register_contestant(@benjamin, @mega_millions)

         expect(lottery.eligible_contestants).to eq([@alexander, @frederick])
      end
   end

   describe '#current_contestants' do
      it 'returns contestants who have been registered and have enough money' do
         lottery = ColoradoLottery.new
         lottery.register_contestant(@alexander, @pick_4)
         lottery.register_contestant(@frederick, @mega_millions)

         expect(lottery.current_contestants).to eq({@pick_4 => ["Alexander Aigades"],
                                                   @mega_millions => ["Frederick Douglass"]})
      end
   end

   describe '#draw_winners' do
      it 'select winners for each game' do
         lottery = ColoradoLottery.new
         lottery.register_contestant(@alexander, @pick_4)
         lottery.register_contestant(@alexander, @mega_millions)
         lottery.register_contestant(@frederick, @mega_millions)
         lottery.register_contestant(@winston, @cash_5)
         lottery.register_contestant(@benjamin, @mega_millions)
         lottery.register_contestant(@charlie, @cash_5)
         lottery.register_contestant(@charlie, @pick_4)

         expect(lottery.draw_winners).to be_an Array
      end
   end

   describe '#announce_winner' do
      it 'announce who won each game' do
         lottery = ColoradoLottery.new
         lottery.register_contestant(@alexander, @pick_4)
         lottery.register_contestant(@alexander, @mega_millions)
         lottery.register_contestant(@frederick, @mega_millions)
         lottery.register_contestant(@winston, @cash_5)
         lottery.register_contestant(@benjamin, @mega_millions)
         lottery.register_contestant(@charlie, @cash_5)
         lottery.register_contestant(@charlie, @pick_4)

         expect(lottery.announce_winner).to be_a String
      end
   end
end