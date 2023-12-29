require './lib/curator'
require './lib/photograph'

RSpec.describe Photograph do
   describe '#initialize' do
      it 'exists' do 
         attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
         }
         photograph = Photograph.new(attributes)
         expect(photograph).to be_a Photograph
      end

      it 'has an id' do
         attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
         }
         photograph = Photograph.new(attributes)
         expect(photograph.id).to eq "1"
      end

      it 'has a name' do
         attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
         }
         photograph = Photograph.new(attributes)
         expect(photograph.name).to eq "Rue Mouffetard, Paris (Boy with Bottles)"
      end

      it 'has an artist id' do
         attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
         }
         photograph = Photograph.new(attributes)
         expect(photograph.artist_id).to eq "4"
      end

      it 'has a year' do
         attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
         }
         photograph = Photograph.new(attributes)
         expect(photograph.year).to eq "1954"
      end
   end

end