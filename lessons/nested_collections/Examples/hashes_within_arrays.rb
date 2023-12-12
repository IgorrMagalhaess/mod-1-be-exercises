food_feelings = [{:pizza => "tasty"}, {:calzone => "also tasty"}]

# 1. what is food_feelings.count
2

# 2. what is food_feelings.first.count
1

# 3. how can I access the value "also tasty"
p food_feelings[0]

# 4. how can I change the value “also tasty” to “super delicious”
food_feelings[1][:calzone_2] = "super delicious"
food_feelings[1].replace({:calzone => "super delicious"})

 p food_feelings
