# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

data = YAML.load_file('/usr/src/app/db/menu.yml')

data['dishes'].each do |dish_data|
  dish = Dish.create(name: dish_data['name'])
  dish_data['ingredients'].each do |ingredient_name|
    Ingredient.create(name: ingredient_name, dish_id: dish.id)
  end
end
