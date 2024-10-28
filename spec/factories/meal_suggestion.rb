FactoryBot.define do
  factory :meal_suggestion do
    user
    meal_name { Faker::Food.dish }
    ingredients { Faker::Food.ingredient }
  end
end
