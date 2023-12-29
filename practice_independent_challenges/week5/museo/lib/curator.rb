require 'CSV'

class Curator
   attr_reader :photographs,
               :artists

   def initialize
      @photographs = []
      @artists = []
   end

   def add_photograph(photograph)
      @photographs << photograph
   end

   def add_artist(artist)
      @artists << artist
   end

   def find_artist_by_id(id)
      @artists.find { |artist| artist.id == id }
   end

   def artist_and_its_photographs
      artist_and_its_photographs = Hash.new { |hash, key| hash[key] = [] }
      
      @photographs.each do |photo|
         artist_id = photo.artist_id
         artist = @artists.find { |artist| artist.id == artist_id }
         artist_and_its_photographs[artist] << photo if artist
      end
      
      artist_and_its_photographs
   end

   def artist_with_multiple_photographs
      artist_and_its_photographs.select { |_, photographs| photographs.length > 1}  
   end

   def photographs_by_country(country)
      photos_by_country = []
      
      artist_and_its_photographs
         .select { |artist, photograph| artist.country == country ? photos_by_country << photograph : next }

      photos_by_country.flatten
   end  

   def load_photographs_from_csv(csv_path)
      CSV.foreach(csv_path, headers: true) do |row|
         attributes = row.to_h
         photograph = Photograph.new(attributes)
         add_photograph(photograph)
      end
   end

   def load_artist_from_csv(cvs_path)
      CSV.foreach(cvs_path, headers: true) do |row|
         attributes = row.to_h
         artist = Artist.new(attributes)
         add_artist(artist)
      end
   end

   def photographs_in_range(range)
      @photographs.select { |photo| range.include?(photo.year.to_i) }
   end

   def artist_age_and_photographs(artist, photograph)
      artist_age = photograph.year.to_i - artist.born.to_i
      photographs_at_age = @photographs.select do |photo|
         photo.artist_id == artist.id && (photo.year.to_i == photograph.year.to_i)
      end

      { age: artist_age, photographs: photographs_at_age }
   end
end