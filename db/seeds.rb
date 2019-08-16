# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# lemon = Ingredient.create(name: 'lemon')
# ice = Ingredient.create(name: 'ice')
# rhum = Ingredient.create(name: 'rhum')
# passion_puree = Ingredient.create(name: 'passion puree')
# sparkling_water = Ingredient.create(name: 'sparkling water')
# banana = Ingredient.create(name: 'banana')
# mint = Ingredient.create(name: 'mint leaves')
# sugar = Ingredient.create(name: 'sugar')

# dose1 = Dose.create(6)
# dose2 = Dose.create(4)
# dose2 = Dose.create(4)

require 'json'
require 'open-uri'
require 'faker'
filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(filepath).read
ingredients_ready = JSON.parse(ingredients)


ingredients_ready["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
20.times do
  cocktail = Cocktail.new(name: Faker::Name.name)
  ingredient_1 = Ingredient.all.sample
  ingredient_2 = Ingredient.all.sample
  ingredient_3 = Ingredient.all.sample
  dose_1 = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient_1)
  dose_2 = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient_2)
  dose_3 = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient_3)
  dose_1.save
  dose_2.save
  dose_3.save
  cocktail.save
end




