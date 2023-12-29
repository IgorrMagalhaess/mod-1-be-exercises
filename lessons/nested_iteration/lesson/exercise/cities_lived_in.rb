cities_lived_in = {
    michaela: ["Philadelphia", "Fort Collins", "Seattle"],
    mike: ["Denver", "Santa Fe", "Philadelphia", "Portland"],
    pamela: ["Lansing"],
    alex: ["Seattle", "Columbus", "Philadelphia", "Austin"]
}


# Problem #1: 
# Get a unique list of all of the cities that these humans have lived in  
# ["Philadelphia", "Fort Collins", "Seattle", "Denver", "Santa Fe", "Portland", "Lansing", "Columbus", "Austin"]

cities_lived = []

cities_lived_in.each do |name, cities|
    cities.each do |city|
        if !cities_lived.include?(city)
            cities_lived << city
        end
    end
end
p cities_lived




# Problem #2: 
# Write code that iterates through the `cities_lived_in` hash, and returns a list of  
# names of the humans who've lived in Philadelphia.

# [:michaela, :mike, :alex]
# or
# ["Michaela", "Mike", "Alex"]

philly_people = []

cities_lived_in.each do |name, cities|
    if cities_lived_in[name].include? "Philadelphia"
        philly_people << name
    end
end
p philly_people


# Problem #3: 
# Create a hash that has the city as a key, and the number of people that live in it as it's value: 

# {
#     "Philadelphia" => 3,
#     "Fort Collins" => 1,
#     "Seattle" =>2,
#     "Denver" => 1,
#     "Santa Fe" => 1,
#     "Portland" => 1,
#     "Lansing" => 1,
#     "Columbus => 1,
#     "Austin" => 1
# }

city_count = {}

cities_lived_in.each do |_person, cities|
  cities.each do |city|
    city_count[city] ||= 0
    city_count[city] += 1
  end
end
p city_count