# Part One
# Given the follow array:
animals = [:dog, :cat, :zebra, :quokka, :unicorn, :bear]

# Use an enumerable to
# 1. Return an array of animals as strings.
animal_string = animals.map(&:to_s)

p animal_string





# 2. Return an array of animals with a length >= 4.

animal_string = animals.select{|animal| animal.length <= 4}

p animal_string

