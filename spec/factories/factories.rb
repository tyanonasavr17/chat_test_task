FactoryBot.define do
  factory :order do
    excluded_ingredients { ['ingredient1', 'ingredient2'] }
  end

  factory :dish do
    name { 'dish1' }
  end

  factory :ingredient do
    name { 'ingredient1' }
  end
end