require 'rails_helper'

RSpec.describe NutritionPlan, type: :model do
  let(:user) { create(:user) }
  let(:nutrition_plan) { build(:nutrition_plan, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:protein) }
    it { should validate_presence_of(:carbs) }
    it { should validate_numericality_of(:protein).is_greater_than(0) }
    it { should validate_numericality_of(:carbs).is_greater_than(0) }
    it { should validate_numericality_of(:fats).is_greater_than(0) }
    it { should allow_value(nil).for(:restrictions) }
    it { should allow_value([]).for(:restrictions) }
    it { should allow_value(nil).for(:dislikes) }
    it { should allow_value([]).for(:dislikes) }

    it 'validates inclusion of restrictions in NutritionPlan::RESTRICTIONS' do
      valid_restrictions = NutritionPlan::RESTRICTIONS.sample(2)
      invalid_restrictions = [ 'invalid_restriction' ]

      expect(nutrition_plan).to allow_value(valid_restrictions).for(:restrictions)
      expect(nutrition_plan).not_to allow_value(invalid_restrictions).for(:restrictions)
    end
  end
end
