class NutritionPlan < ApplicationRecord
  belongs_to :user

  RESTRICTIONS = %w[lactose_intolerant vegetarian vegan gluten_free nut_allergy keto paleo low_carb].freeze

  validates :protein, presence: true, numericality: { greater_than: 0 }
  validates :carbs, presence: true, numericality: { greater_than: 0 }
  validates :fats, numericality: { greater_than: 0 }
  validates :restrictions, inclusion: { in: RESTRICTIONS }, allow_nil: true, allow_blank: true
end
