class MealSuggestion < ApplicationRecord
  belongs_to :user

  validates :meal_name, presence: true
  validates :ingredients, presence: true
  validates :portion_size, numericality: { greater_than: 0 }
end
