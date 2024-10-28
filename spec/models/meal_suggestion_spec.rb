require 'rails_helper'

RSpec.describe MealSuggestion, type: :model do
  let(:user) { create(:user) }
  let(:meal_suggestion) { build(:meal_suggestion, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:meal_name) }
    it { should validate_presence_of(:ingredients) }
    it { should validate_numericality_of(:portion_size).is_greater_than(0) }
  end
end
