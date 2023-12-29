
require './lib/artist'
require './lib/photograph'

RSpec.describe Artist do
   describe '#initialize' do
      it 'exists' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist).to be_a Artist
      end

      it 'has an id' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.id).to eq "2"
      end

      it 'has a name' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.name).to eq "Ansel Adams"
      end

      it 'has a year of birth' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.born).to eq "1902"
      end

      it 'has a year of death' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.died).to eq "1984"
      end

      it 'has a country' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.country).to eq "United States"
      end
   end

   describe '#age_at_death' do
      it 'calculate age when died' do
         attributes = {
            id: "2",
            name: "Ansel Adams",
            born: "1902",
            died: "1984",
            country: "United States"
         }

         artist = Artist.new(attributes)
         expect(artist.age_at_death).to eq "82"
      end
   end
end