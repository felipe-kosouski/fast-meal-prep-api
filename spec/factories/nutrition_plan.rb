FactoryBot.define do
  factory :nutrition_plan do
    user
    protein { 100 }
    carbs { 100 }
    fats { 100 }
    restrictions { NutritionPlan::RESTRICTIONS.sample }
    dislikes { Faker::Food.ingredient }
  end
end
