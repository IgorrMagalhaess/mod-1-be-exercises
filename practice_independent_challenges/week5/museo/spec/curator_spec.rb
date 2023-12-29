require './lib/photograph' 
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do
   it 'exists' do
      curator = Curator.new
      expect(curator).to be_a Curator
   end

   describe '#initialize' do
      it 'start with an empty array of photographs' do
         curator = Curator.new
         expect(curator.photographs).to eq []
      end

      it 'start with an empty array of artists' do
         curator = Curator.new
         expect(curator.artists).to eq []
      end
   end

   describe '#add_photograph' do
      it 'add photograph to photographs array' do
         curator = Curator.new
         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         
         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)
         
         expect(curator.photographs).to eq [photo_1, photo_2]
      end
   end

   describe '#add_artist' do
      it 'add artists to artists array' do
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         expect(curator.artists).to eq [artist_1, artist_2]
      end
   end

   describe '#find_artist_by_id' do
      it 'find artist by its id' do
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         expect(curator.find_artist_by_id("1")).to eq artist_1
      end
   end

   describe '#artist_and_its_photographs' do
      it 'match artists to its photographs' do
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         
         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)

         expect(curator.artist_and_its_photographs).to eq({artist_1=>[photo_1], artist_2=>[photo_2]})
      end
   end

   describe '#artist_with_multiple_photographs' do
      it 'return artists that have more than one photograph' do
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         photo_3 = Photograph.new({
            id: "3",      
            name: "Grass and Pool",      
            artist_id: "2",      
            year: "1939"      
         })  

         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)
         curator.add_photograph(photo_3)


         expect(curator.artist_with_multiple_photographs).to eq({artist_2=>[photo_2, photo_3]})
      end
   end

   describe '#photographs_by_country' do
      it 'return photographs taken in respective country' do
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         photo_3 = Photograph.new({
            id: "3",      
            name: "Grass and Pool",      
            artist_id: "2",      
            year: "1939"      
         })  

         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)
         curator.add_photograph(photo_3)


         expect(curator.photographs_by_country("United States")).to eq([photo_2, photo_3])
         expect(curator.photographs_by_country("France")).to eq([photo_1])
      end
   end

   describe '#load_photographs_from_csv' do
      it 'loads photographs from a CSV file and adds them to the curator' do
         curator = Curator.new
         csv_path = './data/photographs.csv'
         curator.load_photographs_from_csv(csv_path)

         expect(curator.photographs.length).to be > 0
      end
   end

   describe '#load_artists_from_csv' do
      it 'loads artists from a CSV file and adds them to the curator' do
         curator = Curator.new
         csv_path = './data/artists.csv'
         curator.load_artist_from_csv(csv_path)

         expect(curator.artists.length).to be > 0
      end
   end

   describe '#photographs_in_range' do
      it 'return photographs from the year range' do
         curator = Curator.new
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         photo_3 = Photograph.new({
            id: "3",      
            name: "Grass and Pool",      
            artist_id: "2",      
            year: "1939"      
         })  

         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)
         curator.add_photograph(photo_3)

         expect(curator.photographs_in_range(1950..1960)).to eq([photo_1])
      end
   end

   describe '#artist_age_and_photographs' do
      it 'return photographs from the year range' do
         curator = Curator.new
         curator = Curator.new
         artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
         })        
         artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
         })        

         curator.add_artist(artist_1)
         curator.add_artist(artist_2)

         photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
         })        
         photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
         })        
         photo_3 = Photograph.new({
            id: "3",      
            name: "Grass and Pool",      
            artist_id: "2",      
            year: "1941"      
         })  

         curator.add_photograph(photo_1)
         curator.add_photograph(photo_2)
         curator.add_photograph(photo_3)

         expect(curator.artist_age_and_photographs(artist_1, photo_1)).to eq({age: 46, photographs: [photo_1]})
         expect(curator.artist_age_and_photographs(artist_2, photo_2)).to eq({age: 39, photographs: [photo_2, photo_3]})
      end
   end
end