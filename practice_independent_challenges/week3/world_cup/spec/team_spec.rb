require './lib/team'
require './lib/player'

RSpec.describe Team do
   describe '#initialize' do
      it 'exists' do
         team = Team.new("France")
         expect(team).to be_a Team
      end

      it 'is a country' do
         team = Team.new("France")
         expect(team.country).to eq "France"
      end

      it 'initialize not eliminated' do
         team = Team.new("France")
         expect(team.eliminated?).to eq false
      end
   end
   
   describe '#eliminated' do
      it 'eliminate team' do
         team = Team.new("France")
         team.eliminated
         expect(team.eliminated?).to eq true
      end
   end

   describe '#players' do
      it 'starts as an empty array' do
         team = Team.new("France")
         expect(team.players).to eq ([])
      end
   end

   describe '#add_players' do
      it 'can add players to the team' do
         team = Team.new("France")
         mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
         pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
         team.add_player(mbappe)
         team.add_player(pogba) 
         
         expect(team.players).to eq([mbappe, pogba])
      end
   end

   describe '#player_by_position' do
      it 'filter players in team by position' do
         team = Team.new("France")
         mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
         pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
         team.add_player(mbappe)
         team.add_player(pogba) 

         expect(team.player_by_position("midfielder")).to eq ([pogba])
         expect(team.player_by_position("defender")).to eq ([])
      end
   end
end