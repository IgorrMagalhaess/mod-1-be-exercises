# Part Two
# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings
string_animals = []
nested_animals.each do |nested_animal|
   string_animals.push(nested_animal.map(&:to_s))
end

p string_animals.flatten


# 2. Return an unnested array of animals with length >= 4
short_name_animals = nested_animals.flat_map { |nested_animal| nested_animal.select { |animal| animal.length >= 4 } }

p short_name_animals


# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }
hash = {}
nested_animals.flat_map do |nested_animal|
   nested_animal.each do |animal|
      hash[animal] = animal.length
   end
end

p hash
