pizza_toppings = {
  veggies: ["green peppers", "jalapeño", "mushrooms"],
  protein: ["pepperoni", "sausage", "sardines"],
  fruit: ["pineapple", "apple", "bananas"]
}

# 1. what is pizza_toppings.count
3

# 2. what is pizza_toppings.values
# p pizza_toppings.values
# p pizza_toppings.keys

# 3. how can I access the element “pineapple”
p pizza_toppings[:fruit][2]

# 4. how can I add the element “olives” to the key “veggies”?
pizza_toppings[:veggies].unshift "olives"
p pizza_toppings
